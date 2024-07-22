Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB909388B7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 08:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C4410E360;
	Mon, 22 Jul 2024 06:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gtxqfrHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556D310E360
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 06:00:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C29EBCE0B00;
 Mon, 22 Jul 2024 06:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EC7C4AF0D;
 Mon, 22 Jul 2024 06:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1721628031;
 bh=UOdO5rzxPHlgIWDk6aHeG0JNSvBIhvn5oszuTvmYYyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gtxqfrHmH8UtS8hE1BrE5pv3LhImqMhQrEOousVju4/BNE8cOtnA2IC6UgIe6anB4
 DJqRKKJy9BX70RMhJkDgReM+F5pKHC4iV/qPYnkFYfsMM80Qy0XTWWv4MNsQIEzsjb
 5u1jeehjWMat8pSY5zEwi5uAGb8QUKdnqW056/IQ=
Date: Mon, 22 Jul 2024 08:00:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v5 2/2] misc: fastrpc: Increase unsigned PD initmem size
Message-ID: <2024072235-daydream-clunky-0272@gregkh>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-3-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722055437.3467900-3-quic_ekangupt@quicinc.com>
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

On Mon, Jul 22, 2024 at 11:24:37AM +0530, Ekansh Gupta wrote:
> For unsigned PD offloading requirement, additional memory is required
> because of additional static heap initialization. Without this
> additional memory, PD initialization would fail. Increase the initmem
> size by 2MB for unsigned PD initmem buffer allocation. Any additional
> memory sent to DSP during PD init is used as the PD heap.
> 
> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a3a5b745936e..18668b020a87 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -40,6 +40,7 @@
>  #define FASTRPC_CTXID_MASK (0xFF0)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
> +#define FASTRPC_STATIC_HEAP_LEN (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>  
> @@ -1411,8 +1412,14 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  			goto err;
>  	}
>  
> +	/* Allocate buffer in kernel for donating to remote process.
> +	 * Unsigned PD requires additional memory because of the

What is "PD"?

> +	 * additional static heap initialized within the process.
> +	 */

Why are you using networking comment style for a non-networking file?

>  	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
>  		       1024 * 1024);
> +	if (unsigned_module)
> +		memlen += FASTRPC_STATIC_HEAP_LEN;

I don't understand, why is "static heap length" being added for
something that is "unsigned"?  Why isn't this just "SIGNING FREE SPACE"
or something like that?

thanks,

greg "naming is hard" k-h
