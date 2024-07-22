Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E19388B1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 07:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B092189ABE;
	Mon, 22 Jul 2024 05:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SUGtT63n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB5F89ABE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 05:58:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 01B6C6027F;
 Mon, 22 Jul 2024 05:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF1BC116B1;
 Mon, 22 Jul 2024 05:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1721627893;
 bh=nkeDblTR4S+2jmJ1dAlZ/enSxjGVeZVXYyKlqrDj3Js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SUGtT63nikfVm12vtiDGa4OygxddgbVElPGGEnc8wr1h3FG+N6u7N28tf5sGyBXuf
 EtMh6lTxuKqktB2kxtnsVcpGF1p7XECy+SfC5syCkgcRQ0M9VkRrguEEM3NG3yw5Xe
 NxoyPBKo7wCzMLVfD0u/snd0l/0OlXA0fefmHAtY=
Date: Mon, 22 Jul 2024 07:58:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v5 1/2] misc: fastrpc: Define a new initmem size for user
 PD
Message-ID: <2024072234-slug-payer-2dec@gregkh>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-2-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722055437.3467900-2-quic_ekangupt@quicinc.com>
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

On Mon, Jul 22, 2024 at 11:24:36AM +0530, Ekansh Gupta wrote:
> For user PD initialization, initmem is allocated and sent to DSP for
> initial memory requirements like shell loading. The size of this memory
> is decided based on the shell size that is passed by the user space.
> With the current implementation, a minimum of 2MB is always allocated
> for initmem even if the size passed by user is less than that. For this
> a MACRO is being used which is intended for shell size bound check.
> This minimum size of 2MB is not recommended as the PD will have very
> less memory for heap and will have to request HLOS again for memory.
> Define a new macro for initmem minimum length of 3MB.
> 
> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a7a2bcedb37e..a3a5b745936e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -39,6 +39,7 @@
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)

Meta-comment, for a future change, why not tabs to line things up?

>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>  
> @@ -1410,7 +1411,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  			goto err;
>  	}
>  
> -	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
> +	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),

You are aligning it this way, but still checking the file size for
INIT_FILELEN_MAX, so that's not really going to change anything here.

How was this tested?

thanks,

greg k-h
