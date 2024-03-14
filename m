Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C7987BD6C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 14:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376E610FB08;
	Thu, 14 Mar 2024 13:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sYnU4ESp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C2210FB06;
 Thu, 14 Mar 2024 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4RrDElXXDhyo6NIxPz1psiRMkBKs34tls2lFbT7L5VA=; b=sYnU4ESp8YWwttVRCCInXzoMi5
 cdS/qXR+rCbu/DQYM0iDuME3HZ8kbJ2QFWVpqzHNS06UtsTqI2rrCpGHe3N8ttNW1SlPR+dBvCaFG
 IxPf4eu9aGtE5TMg3WjIVqjs7t7pPSfxKymi0ZRMsrxJLzQ8YyDHk7fz4MfBrwyStfpa2VfC//XTi
 uOIQgc03n0z0/Bv/6J2nD6nu2Df73nS+/xwPUQbGItMmzAuYHAksDkOnBqfFcTEDDLD+0BWhl4Ae5
 KCHe8HHwr8jiG6ngcTwl0rcmRnknJCi93muOARMGIjkRiYp2mlfI75ExTCWBkz23ixrYXYglP0Use
 6S+G394g==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rkkwP-00AMCI-A7; Thu, 14 Mar 2024 14:16:13 +0100
Date: Thu, 14 Mar 2024 10:16:05 -0300
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v4 02/42] drm: Add helper for conversion from
 signed-magnitude
Message-ID: <z7curxi4lvyqg6jj3bfa2jkty6ajhb52kkxywh3ojnx27d37mu@zm53vtrdvdsc>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-3-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226211100.100108-3-harry.wentland@amd.com>
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

On 02/26, Harry Wentland wrote:
> CTM values are defined as signed-magnitude values. Add
> a helper that converts from CTM signed-magnitude fixed
> point value to the twos-complement value used by
> drm_fixed.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  include/drm/drm_fixed.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 0c9f917a4d4b..cb842ba80ddd 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -78,6 +78,24 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
>  #define DRM_FIXED_EPSILON	1LL
>  #define DRM_FIXED_ALMOST_ONE	(DRM_FIXED_ONE - DRM_FIXED_EPSILON)
>  
> +/**
> + * @drm_sm2fixp
> + *
> + * Convert a 1.31.32 signed-magnitude fixed point to 32.32
> + * 2s-complement fixed point
> + *
> + * @return s64 2s-complement fixed point
> + */
> +static inline s64 drm_sm2fixp(__u64 a)
> +{
> +	if ((a & (1LL << 63))) {
> +		return -(a & 0x7fffffffffffffffll);
Hi Harry,

Can we have a #define macro for this constant? ^
Other than that, LGTM. You can add my r-b to the next version.

Thanks,

Melissa
> +	} else {
> +		return a;
> +	}
> +
> +}
> +
>  static inline s64 drm_int2fixp(int a)
>  {
>  	return ((s64)a) << DRM_FIXED_POINT;
> -- 
> 2.44.0
> 
