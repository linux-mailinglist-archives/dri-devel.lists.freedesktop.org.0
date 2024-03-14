Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2087BDEC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 14:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FBE10FB38;
	Thu, 14 Mar 2024 13:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pd8MPH2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC19D10FB35;
 Thu, 14 Mar 2024 13:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8CyTic263qKQBviK5ubuIPiyE9EUHQGy3gXflVSF6N8=; b=pd8MPH2kvpbvhv2MPl0HAWIh4L
 0hLGyTijR5QF5ObAuSzKvP3nGJY1U8tOEJqvcsjouw3wZXioqcrB7zv5497yV6MRcKELxyrSHNeXr
 WD+6DUQixPKnNJJtMQVJyJ/8pw9SpcP5i8h8sdidtUtUzGwdQ6JWDkTS7rzoAKuKOPdvOric/wybT
 c8iB3Np/EtYf90qFk3RGei6OjW/KRXezO9+TJanB+l5QaFul2LW5qy0DriqNhRVEiE+iaOC+kef7l
 khAPU4Ffl3+zIsL5Mb+4TaU0xCJJvBh0w8Bq0p0qHF2au3pshbbt7v2mllc+xjYNLRvXQkhs8uRkY
 ZLwftEiw==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rklLr-00AMi6-Sq; Thu, 14 Mar 2024 14:42:32 +0100
Date: Thu, 14 Mar 2024 10:41:29 -0300
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH v4 01/42] drm: Don't treat 0 as -1 in drm_fixp2int_ceil
Message-ID: <qighr6g7r4q7rvff52eb6rrnn6tbudgesvscwv7gxku47madgw@p3ljjnxsam6k>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-2-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226211100.100108-2-harry.wentland@amd.com>
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
> Unit testing this in VKMS shows that passing 0 into
> this function returns -1, which is highly counter-
> intuitive. Fix it by checking whether the input is
> >= 0 instead of > 0.
> 
> Fixes: 64566b5e767f9 ("drm: Add drm_fixp_from_fraction and drm_fixp2int_ceil")
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Melissa Wen <mwen@igalia.com>

It was already applied upstream:
https://cgit.freedesktop.org/drm/drm-misc/commit/include?id=cf8837d7204481026335461629b84ac7f4538fa5

Thanks

Melissa
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
> 2.44.0
> 
