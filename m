Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73E9C92758
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 16:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0385F10E858;
	Fri, 28 Nov 2025 15:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GwgUIvHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7234D10E858
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 15:32:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 39FF260126;
 Fri, 28 Nov 2025 15:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58183C4CEF1;
 Fri, 28 Nov 2025 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1764343935;
 bh=NivM2unTfArQ4MH6trQQLpjZ9i7wmWdLO4QXz5M4Tjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GwgUIvHEYPpmzimPUGmI1hD0inJ/j/gkcXwkw4DZsGDg/odtVoY85pTEefUSkbOEz
 nKlmXkvfJv7jLjrtpxf0/9IrmzyWMiHS8vokE2AFlygU6QkhqldzG5wGPUsRiPGBu5
 1Vq8wq+lgeRJCdhyI5qwxINjJoKYKZN9mRAzKUE4=
Date: Fri, 28 Nov 2025 16:32:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v2 2/2] misc: fastrpc: Support mapping
 userspace-allocated buffers
Message-ID: <2025112854-septum-asleep-8c35@gregkh>
References: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
 <20251128103428.1119696-3-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128103428.1119696-3-ekansh.gupta@oss.qualcomm.com>
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

On Fri, Nov 28, 2025 at 04:04:28PM +0530, Ekansh Gupta wrote:
> Currently, FastRPC only supports mapping buffers allocated by the
> kernel. This limits flexibility for applications that allocate memory
> in userspace using rpcmem or DMABUF and need to share it with the DSP.
> Add support for mapping and unmapping userspace-allocated buffers to
> the DSP through SMMU. This includes handling map requests for rpcmem
> and DMABUF-backed memory and providing corresponding unmap
> functionality.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 96 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 85 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 9bf76e224852..feba79913763 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1854,8 +1854,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
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
> @@ -1869,13 +1871,41 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
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

Never print out kernel pointers "raw" like this, use the real %p tags
instead.  Odd that the current code does this, that is not good and is
probably a "information leak" somehow.

Can you fix that up first so it can be backported properly?

>  		return -EINVAL;
>  	}
>  
> -	return fastrpc_req_munmap_impl(fl, buf);
> +	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> +	if (err) {
> +		dev_dbg(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);

Same here.  Also, no need for a \t in a kernel log message.

> +		spin_lock(&fl->lock);
> +		list_add_tail(&map->node, &fl->maps);
> +		spin_unlock(&fl->lock);
> +	} else {
> +		fastrpc_map_put(map);
> +	}
> +	return err;
>  }
>  
>  static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
> @@ -1989,25 +2019,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
>  	return err;
>  }
>  
> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
> +				  struct fastrpc_req_mmap req,
> +				  char __user *argp)
>  {
> -	struct fastrpc_req_mmap req;
> +	struct fastrpc_map *map = NULL;
> +	struct device *dev = fl->sctx->dev;
> +	u64 raddr = 0;
>  	int err;
>  
> -	if (copy_from_user(&req, argp, sizeof(req)))
> -		return -EFAULT;
> +	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
> +	if (err) {
> +		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
> +		return err;
> +	}
>  
> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
> -		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
> +	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
> +				  req.vaddrin, &raddr);
> +	if (err)
> +		goto err_invoke;
>  
> -		return -EINVAL;
> +	/* update the buffer to be able to deallocate the memory on the DSP */
> +	map->raddr = (u64)raddr;
> +
> +	/* let the client know the address to use */
> +	req.vaddrout = raddr;
> +	dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
> +		map->raddr, map->size);
> +
> +	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {

argp is already a user pointer, no need to cast it again, right?

> +		err = -EFAULT;
> +		goto err_copy;
>  	}
>  
> -	err = fastrpc_req_buf_alloc(fl, req, argp);
> +	return 0;
> +err_copy:
> +	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> +err_invoke:
> +	fastrpc_map_put(map);
>  
>  	return err;
>  }
>  
> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_req_mmap req;
> +	int err;
> +
> +	if (copy_from_user(&req, argp, sizeof(req)))
> +		return -EFAULT;
> +
> +	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
> +	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {
> +		err = fastrpc_req_buf_alloc(fl, req, argp);
> +		if (err)
> +			return err;
> +	} else {
> +		err = fastrpc_req_map_create(fl, req, argp);

You changed the logic here from what used to happen if req.flags was not
set to those two values.  Are you _sure_ you mean to do that?  If so,
how does userspace know?  Why don't you have a new flag for the new
type of memory you want to map?

thanks,

greg k-h
