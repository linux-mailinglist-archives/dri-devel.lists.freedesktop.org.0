Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F9489E0DD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 18:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6C510E8F9;
	Tue,  9 Apr 2024 16:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="XaJajSFL";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="2vmNi6/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod3-cph3.one.com
 (mailrelay2-1.pub.mailoutpod3-cph3.one.com [46.30.211.241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A536310E8F9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=D+gjx/ET+uz8sc2xxJMW5koH7dvXg3wuvXcXwL00Ppo=;
 b=XaJajSFLVOPj51V8wYoJ43rJeoSgzusS3RtpCnTSBKvyQPZO3/lAqGkr/o7UrboDPemQuJDhrY4pP
 VLx9F+12GzKKcBBx2G2Fyxd8OPMAVHrMvvHSDcxPTcgTxDZCkXANe2Lw0OlEOL1dXF7QoEwbM0Cj3X
 LM942fFcXkr4vpnv7n2qU6pR6fTDI/cxFsGFSnVQKlZX4+aaCueH38IPiO3Qev4Q6vAF6URZeajt+D
 M/pqD+aTiQAq6TeHwWb1D/5vmwMQ6sFvz9QiHtu22rvu2j8285coXRtdWePRIjpncowFdbsnBY4SNO
 lvN3xAX+xTfv6nqjSyTDJJX27E28D2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=D+gjx/ET+uz8sc2xxJMW5koH7dvXg3wuvXcXwL00Ppo=;
 b=2vmNi6/wyJQdbElVcFKxAquYit5F7KljhUoWOcbtwUqx1eXq4ShUcg1UfwX5pq7Z0Ya502ecsJ7Tq
 iuY2HHNDA==
X-HalOne-ID: e78ff64b-f691-11ee-9a0a-657348328a86
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id e78ff64b-f691-11ee-9a0a-657348328a86;
 Tue, 09 Apr 2024 16:55:04 +0000 (UTC)
Date: Tue, 9 Apr 2024 18:55:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
	Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH 16/21] drm/atmel-hlcdc: Allow build with COMPILE_TEST=y
Message-ID: <20240409165502.GA5721@ravnborg.org>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-17-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408170426.9285-17-ville.syrjala@linux.intel.com>
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

On Mon, Apr 08, 2024 at 08:04:21PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Allow atmel-hlcdc to be built with COMPILE_TEST=y for greater
> coverage. Builds fine on x86/x86_64 at least.
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/atmel-hlcdc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/Kconfig b/drivers/gpu/drm/atmel-hlcdc/Kconfig
> index 3bdbab3a6333..945f3aa7bb24 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/Kconfig
> +++ b/drivers/gpu/drm/atmel-hlcdc/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_ATMEL_HLCDC
>  	tristate "DRM Support for ATMEL HLCDC Display Controller"
> -	depends on DRM && OF && COMMON_CLK && MFD_ATMEL_HLCDC && ARM
> +	depends on DRM && OF && COMMON_CLK && ((MFD_ATMEL_HLCDC && ARM) || COMPILE_TEST)
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_KMS_HELPER
>  	select DRM_PANEL
> -- 
> 2.43.2
