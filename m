Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864439258FD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D21610E781;
	Wed,  3 Jul 2024 10:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sWVq37Zk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5126710E69E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:39:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 35A21621F5;
 Wed,  3 Jul 2024 10:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845FBC2BD10;
 Wed,  3 Jul 2024 10:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1720003158;
 bh=c5YMYnQsGVVDkEokkgr1bMvHGW7VnZ6W/LDJWK8aJIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sWVq37Zk4uoAqYi2poiW5YdDurYhN+xWgKw/mZZdGmqHKAnywekW7t51AwB9tRKg/
 IrTljMGi+ftFVVmOyNkG5mzivjK4scc7eUX9uR8qpkXAmb4JdgAT/qSvK9Xns1lX5p
 qN+drU0zAfHc4Kx0tGc23QpSxKT9xmzcEikqy830=
Date: Wed, 3 Jul 2024 12:39:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1] misc: fastrpc: Add support for multiple PD from one
 process
Message-ID: <2024070353-giggly-stardom-7b6d@gregkh>
References: <20240703065200.1438145-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703065200.1438145-1-quic_ekangupt@quicinc.com>
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

On Wed, Jul 03, 2024 at 12:22:00PM +0530, Ekansh Gupta wrote:
> @@ -268,6 +272,7 @@ struct fastrpc_channel_ctx {
>  	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
>  	spinlock_t lock;
>  	struct idr ctx_idr;
> +	struct ida dsp_pgid_ida;

You have an idr and an ida?  Why two different types for the same
driver?

>  	struct list_head users;
>  	struct kref refcount;
>  	/* Flag if dsp attributes are cached */
> @@ -299,6 +304,7 @@ struct fastrpc_user {
>  	struct fastrpc_buf *init_mem;
>  
>  	int tgid;
> +	int dsp_pgid;

Are you sure this fits in an int?

> +static int fastrpc_pgid_alloc(struct fastrpc_channel_ctx *cctx)
> +{
> +	int ret = -1;

No need to initialize this.

> +
> +	/* allocate unique id between MIN_FRPC_PGID and MAX_FRPC_PGID */
> +	ret = ida_alloc_range(&cctx->dsp_pgid_ida, MIN_FRPC_PGID,
> +					MAX_FRPC_PGID, GFP_ATOMIC);
> +	if (ret < 0)
> +		return -1;

Why is -1 a specific value here?  Return a real error please.
Or return 0 if that's not allowed.

v
> +
> +	return ret;
> +}
> +
>  static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  {
>  	struct fastrpc_channel_ctx *cctx;
> @@ -1582,6 +1605,12 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  	fl->cctx = cctx;
>  	fl->is_secure_dev = fdevice->secure;
>  
> +	fl->dsp_pgid = fastrpc_pgid_alloc(cctx);
> +	if (fl->dsp_pgid == -1) {
> +		dev_dbg(&cctx->rpdev->dev, "too many fastrpc clients, max %u allowed\n", MAX_DSP_PD);
> +		return -EUSERS;

Why -EUSERS?

And you obviously did not test this as you just leaked memory :(

thanks,

greg k-h
