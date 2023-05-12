Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 327C8700899
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D4C10E69A;
	Fri, 12 May 2023 13:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C3810E69A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:06:05 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4QHpt51FdbzDqJ8;
 Fri, 12 May 2023 13:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1683896765; bh=9RPwMBTH0omCcuZ5/fKjwyXZM6liW7+NSjQkxJcngDo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OcJXTd3A1+jd1GSn0Kc82Etudb/lMOaZVXBrA4w0dh1hyARr0bAr437zHqlilihP9
 eMAVyUNl7ajXy/OP5uvaaHNgCDLOqMEvUlTHBZEHZwHoBOO8916vSFYI7F5MCvq97t
 icOjBQ/w0T7wDoWRSllTq5CObGD4HRr1PAcPWdoo=
X-Riseup-User-ID: 19A4B580A3338D1BBECACCEC5DE3EDD47FE7FD66F2A2D12831812AA878398B13
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4QHpt23TL4zJp1q;
 Fri, 12 May 2023 13:06:02 +0000 (UTC)
Message-ID: <7ac2cfb2-3912-675a-3ba0-171caab3ba30@riseup.net>
Date: Fri, 12 May 2023 10:05:59 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] drm: Add fixed-point helper to get rounded integer
 values
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
References: <20230512104044.65034-1-mcanal@igalia.com>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <20230512104044.65034-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/05/23 07:40, Maíra Canal wrote:
> Create a new fixed-point helper to allow us to return the rounded value
> of our fixed point value.
> 
> [v2]:
>     * Create the function drm_fixp2int_round() (Melissa Wen).
> [v3]:
>     * Use drm_fixp2int() instead of shifting manually (Arthur Grillo).
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---

Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

Best Regards,
~Arthur Grillo

>  include/drm/drm_fixed.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 255645c1f9a8..6ea339d5de08 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -71,6 +71,7 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
>  }
>  
>  #define DRM_FIXED_POINT		32
> +#define DRM_FIXED_POINT_HALF	16
>  #define DRM_FIXED_ONE		(1ULL << DRM_FIXED_POINT)
>  #define DRM_FIXED_DECIMAL_MASK	(DRM_FIXED_ONE - 1)
>  #define DRM_FIXED_DIGITS_MASK	(~DRM_FIXED_DECIMAL_MASK)
> @@ -87,6 +88,11 @@ static inline int drm_fixp2int(s64 a)
>  	return ((s64)a) >> DRM_FIXED_POINT;
>  }
>  
> +static inline int drm_fixp2int_round(s64 a)
> +{
> +	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
> +}
> +
>  static inline int drm_fixp2int_ceil(s64 a)
>  {
>  	if (a > 0)
