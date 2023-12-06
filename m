Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD66806F69
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 13:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C7F10E6F6;
	Wed,  6 Dec 2023 12:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD9E10E6F8;
 Wed,  6 Dec 2023 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XcdB8c1GMdLnsTqmGwNSke3msn+34m8xHaTJc2Z0U6I=; b=GXegyWTSsaMoesHMXLFD+hDdqE
 VG0BJ4xBlNCiAT1i0tt7Nh74Gj25HKwwYCgUFFdR2ILnReSbFoG33APmXNFZ+InxMxXBXwpMuwKIR
 4lEgHM7hBODfh4fKBmCFiXx/gYoeoSUk3+0vSwJVLg/+psBjQnAtuvkroQ/9YWsP36gcr6BqDpMq7
 KupMUx+kyPboaZBcSRgV8k2vHSpzrryF0itlLZ9/0uybWQnyobDvBS3UtAJc4ZbPPgVpS5IRbYDrK
 1eLtEYgWQuhQVq+lzk49DQ+0VlJLI5FxJ5ZCgzDTFx6QN+W04DELQj/gYVJZu+aYDeEDp5We1F1Vl
 FI7bLdHg==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rAqez-00AwEF-7n; Wed, 06 Dec 2023 13:05:49 +0100
Date: Wed, 6 Dec 2023 11:05:43 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 01/23] drm: Don't treat 0 as -1 in drm_fixp2int_ceil
Message-ID: <20231206120316.eexh77nmt5dz46ap@mail.igalia.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-2-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108163647.106853-2-harry.wentland@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/08, Harry Wentland wrote:
> Unit testing this in VKMS shows that passing 0 into
> this function returns -1, which is highly counter-
> intuitive. Fix it by checking whether the input is
> >= 0 instead of > 0.
> 
Nice finding. Thanks!

Could you add the fixes tag? AFAIU, this one:

Fixes: 64566b5e767f9 ("drm: Add drm_fixp_from_fraction and drm_fixp2int_ceil")
Reviewed-by: Melissa Wen <mwen@igalia.com>

> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> ---
>  include/drm/drm_fixed.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 6ea339d5de08..0c9f917a4d4b 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -95,7 +95,7 @@ static inline int drm_fixp2int_round(s64 a)
>  
>  static inline int drm_fixp2int_ceil(s64 a)
>  {
> -	if (a > 0)
> +	if (a >= 0)
>  		return drm_fixp2int(a + DRM_FIXED_ALMOST_ONE);
>  	else
>  		return drm_fixp2int(a - DRM_FIXED_ALMOST_ONE);
> -- 
> 2.42.1
> 
