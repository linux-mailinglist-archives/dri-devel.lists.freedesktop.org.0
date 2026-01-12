Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C493FD1170B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 10:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3644510E055;
	Mon, 12 Jan 2026 09:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DhOwSr5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776ED10E055
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 09:16:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 156F5444CB;
 Mon, 12 Jan 2026 09:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6E9C19424;
 Mon, 12 Jan 2026 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1768209400;
 bh=18hptuZITFP2MUvlKDY/xiLNTktaNY5DlzsdiWrPiUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DhOwSr5+0sxA1wXOf+c0r11TsRAX1JcvvAavcklbWXnFwmwPpq7pZBM2toh11K0eD
 gSCghgZtU9ekSDA4NDS3a9DsoI/GZHFpJ87d5Yzu7eLpPvBj5EFnaxEv7Zdu2u28Sa
 QLNFjm8DKXPk3Yw7nmktW0MpStGEiuOAINbKaK6A=
Date: Mon, 12 Jan 2026 10:16:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Xingjing Deng <xjdeng@buaa.edu.cn>
Subject: Re: [PATCH] misc: fastrpc: possible double-free of cctx->remote_heap
Message-ID: <2026011227-casualty-rephrase-9381@gregkh>
References: <20260112090221.3250133-1-xjdeng@buaa.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112090221.3250133-1-xjdeng@buaa.edu.cn>
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

On Mon, Jan 12, 2026 at 05:02:21PM +0800, Xingjing Deng wrote:
> fastrpc_init_create_static_process() may free cctx->remote_heap on the
> err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
> frees cctx->remote_heap again if it is non-NULL, which can lead to a
> double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
> device is subsequently removed/unbound.
> Clear cctx->remote_heap after freeing it in the error path to prevent the
> later cleanup from freeing it again.
> 
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> ---
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ee652ef01534..fb3b54e05928 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1370,6 +1370,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	}
>  err_map:
>  	fastrpc_buf_free(fl->cctx->remote_heap);
> +	fl->cctx->remote_heap = NULL;
>  err_name:
>  	kfree(name);
>  err:
> -- 
> 2.25.1
> 

What commit id does this fix?  Should it go to stable kernels?

thanks,

greg k-h
