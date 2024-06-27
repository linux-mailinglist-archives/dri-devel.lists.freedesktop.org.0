Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BDC91A4F6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 13:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834B110EA58;
	Thu, 27 Jun 2024 11:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G6ab5byY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACF810EA58
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:20:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 02644CE2E04;
 Thu, 27 Jun 2024 11:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFB8C2BBFC;
 Thu, 27 Jun 2024 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1719487219;
 bh=MB9u8iTtmWyO97YEmZErJn/2xZ0Zhkz+CeU3YYUQ9PQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G6ab5byYgSWYwPj4yBFPWZlYZmgZwnYH/1CGw+tCXnEtY7u3R+NE7pJxn7poSZgT1
 +0jqJ8zFTop3wihIfwEbgU4VZxJR0+qOLWJkUi1PoJyM4zWQgwQ1d7chQlfkEt4o0w
 zUDTj8KKbZN4X6TrUifYfhrwVuOiFvKJ1OvlKk4U=
Date: Thu, 27 Jun 2024 13:20:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Message-ID: <2024062716-lumpish-both-24df@gregkh>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
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

On Thu, Jun 27, 2024 at 11:35:18AM +0530, Ekansh Gupta wrote:
> For user PD initialization, initmem is allocated and sent to DSP for
> initial memory requirements like shell loading. This size is passed
> by user space and is checked against a max size. For unsigned PD
> offloading, more than 2MB size could be passed by user which would
> result in PD initialization failure. Remove the user PD initmem size
> check and allow buffer allocation for user passed size. Any additional
> memory sent to DSP during PD init is used as the PD heap.
> 
> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>   - Modified commit text.
>   - Removed size check instead of updating max file size.
> 
>  drivers/misc/fastrpc.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..9d064deeac89 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1389,11 +1389,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> -	if (init.filelen > INIT_FILELEN_MAX) {
> -		err = -EINVAL;
> -		goto err;
> -	}
> -
>  	inbuf.pgid = fl->tgid;
>  	inbuf.namelen = strlen(current->comm) + 1;
>  	inbuf.filelen = init.filelen;

This feels really wrong as now there is no way to bounds-check the
buffer size at all, so userspace can do "bad things" like go over the
defined buffer size limit which you are expecting, right?

So how is this actually correct?  If you want larger sizes, then
increase the INIT_FILELEN_MAX value.

thanks,

greg k-h
