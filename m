Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5AA0530E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 07:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D48B10E25D;
	Wed,  8 Jan 2025 06:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hAF3rRrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAFF10E25D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 06:08:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D8F775C20FE;
 Wed,  8 Jan 2025 06:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471E7C4CED0;
 Wed,  8 Jan 2025 06:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1736316529;
 bh=COkxza++nxxw/A15euRRlm9AH5x9rtH6UknmpWTrAsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hAF3rRrPdIK24WlZT7U+tFC5iHGnmmGxuwezwbmN9aj8aF9oN14WnlhdRdrOo71pM
 mtOYWQpGrV+6UqEF/j58UtGT5JlkVbXyepcxQQoNJlhG1OtDe7jmKLjtnKJ5W1lSCk
 CNxm6vTh/JCr0RHHPraLW8hzWII7Cg/SYAByR5jg=
Date: Wed, 8 Jan 2025 07:07:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: Fix race condition in MUNMAP
Message-ID: <2025010807-babble-album-7bfd@gregkh>
References: <20250108044802.3829060-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108044802.3829060-1-quic_lxu5@quicinc.com>
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

On Wed, Jan 08, 2025 at 10:18:02AM +0530, Ling Xu wrote:
> fastrpc_req_munmap involves two steps to unmap memory, first to locates
> a matching fastrpc buf in the list and second is to send request to DSP
> to unmap. There is a potential race condition between two operations
> which can lead to user-after-free scenario.
> Lock unmap request to avoid use-after-free.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..9ad092d3a705 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2117,7 +2117,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>  		err = fastrpc_req_mmap(fl, argp);
>  		break;
>  	case FASTRPC_IOCTL_MUNMAP:
> +		mutex_lock(&fl->mutex);
>  		err = fastrpc_req_munmap(fl, argp);
> +		mutex_unlock(&fl->mutex);

Why do you grab a mutex here when this function grabs the spinlock too?
This feels like an odd fix, shouldn't the lock be in the function at the
very least?

thanks,

greg k-h
