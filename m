Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFBCAF8D00
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6FD10E9A5;
	Fri,  4 Jul 2025 08:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tD5RKFLM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516BA10E9A6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 08:58:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5CF6F6145B;
 Fri,  4 Jul 2025 08:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B009BC4CEE3;
 Fri,  4 Jul 2025 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751619521;
 bh=d+Wl1jZE/I9B8bdRNnQe1es6PtluF9HhWnQefqznmbA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tD5RKFLMS/H+cinxfjavqH73neq7XUI9RRZyaKOIUC3430nh5tqWQXIAsy9K5qrYj
 pwV41HGE4Lbwwrxf0MT2/kwLbqGqAmQSRzf1BnB/so0L8kUAYd2TpE7+pvdNKpxCW1
 hIvabZr4gtOqQnK1jVQRCAzan/pfN6qjWfFGZrLY=
Date: Fri, 4 Jul 2025 10:58:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v1] misc: fastrpc: Add support for userspace allocated
 buffers
Message-ID: <2025070443-impatient-essay-23ab@gregkh>
References: <20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 04, 2025 at 02:07:26PM +0530, Ekansh Gupta wrote:
> Support mapping userspace allocated buffers. If userspace allocates a
> buffer using rpcmem or DMABUF and sends it via a map request, fastrpc
> will map it to SMMU and DSP. Add support for both map and unmap
> requests.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 188 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 150 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 378923594f02..3c88c8e9ba51 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1797,17 +1797,16 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  	return 0;
>  }
>  
> -static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
> +static int fastrpc_req_munmap_dsp(struct fastrpc_user *fl, uintptr_t raddr, u64 size)

uintptr_t is not a valid kernel type, please use our real ones :)

"*u64"?

>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
>  	struct fastrpc_munmap_req_msg req_msg;
> -	struct device *dev = fl->sctx->dev;
>  	int err;
>  	u32 sc;
>  
>  	req_msg.client_id = fl->client_id;
> -	req_msg.size = buf->size;
> -	req_msg.vaddr = buf->raddr;
> +	req_msg.size = size;
> +	req_msg.vaddr = raddr;
>  
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
> @@ -1815,6 +1814,16 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
>  				      &args[0]);
> +
> +	return err;
> +}
> +
> +static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
> +{
> +	struct device *dev = fl->sctx->dev;
> +	int err;
> +
> +	err = fastrpc_req_munmap_dsp(fl, buf->raddr, buf->size);
>  	if (!err) {
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>  		spin_lock(&fl->lock);
> @@ -1831,8 +1840,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
> +	struct fastrpc_map *map = NULL, *iterm, *m;
>  	struct fastrpc_req_munmap req;
>  	struct device *dev = fl->sctx->dev;
> +	int err;
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
> @@ -1846,35 +1857,91 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	}
>  	spin_unlock(&fl->lock);
>  
> -	if (!buf) {
> -		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
> +	if (buf) {
> +		err = fastrpc_req_munmap_impl(fl, buf);
> +		if (err) {
> +			spin_lock(&fl->lock);
> +			list_add_tail(&buf->node, &fl->mmaps);
> +			spin_unlock(&fl->lock);
> +		}
> +		return err;
> +	}
> +
> +	spin_lock(&fl->lock);
> +	list_for_each_entry_safe(iterm, m, &fl->maps, node) {
> +		if (iterm->raddr == req.vaddrout) {
> +			map = iterm;
> +			list_del(&iterm->node);
> +			break;
> +		}
> +	}
> +	spin_unlock(&fl->lock);
> +	if (!map) {
> +		dev_dbg(dev, "buffer/map not found addr 0x%09llx, len 0x%08llx\n",
>  			req.vaddrout, req.size);
>  		return -EINVAL;
>  	}
>  
> -	return fastrpc_req_munmap_impl(fl, buf);
> +	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> +	if (err) {
> +		dev_dbg(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
> +		spin_lock(&fl->lock);
> +		list_add_tail(&map->node, &fl->maps);
> +		spin_unlock(&fl->lock);
> +	} else {
> +		fastrpc_map_put(map);
> +	}
> +	return err;
>  }
>  
> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
> +			       u64 size, u32 flag, uintptr_t vaddrin,
> +			       u64 *raddr)
>  {
>  	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
> -	struct fastrpc_buf *buf = NULL;
>  	struct fastrpc_mmap_req_msg req_msg;
>  	struct fastrpc_mmap_rsp_msg rsp_msg;
>  	struct fastrpc_phy_page pages;
> -	struct fastrpc_req_mmap req;
> -	struct device *dev = fl->sctx->dev;
>  	int err;
>  	u32 sc;
>  
> -	if (copy_from_user(&req, argp, sizeof(req)))
> -		return -EFAULT;
> +	req_msg.client_id = fl->client_id;
> +	req_msg.flags = flag;
> +	req_msg.vaddr = vaddrin;
> +	req_msg.num = sizeof(pages);

No validation of these user-provided values?  Or did I miss where that
happens?

>  
> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
> -		dev_err(dev, "flag not supported 0x%x\n", req.flags);
> +	args[0].ptr = (u64)(uintptr_t)&req_msg;

Again, "uintptr_t" isn't for the kernel please.

thanks,

greg k-h
