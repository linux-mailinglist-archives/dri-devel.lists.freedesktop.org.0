Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F26FFA37
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 21:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F2C10E5D6;
	Thu, 11 May 2023 19:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9806210E5D6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 19:35:35 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4QHMYy6n9YzDqhl;
 Thu, 11 May 2023 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1683833735; bh=TxlDHw5xRNSfzv1bNTK0J07Pgto4U5xnumlxHUwJ3eA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Msg4hSH1UznMWeI0kWns/qiK5wNIfruZZ9JHtrWB87J6SYEO9J+WokxILZ58BWbEG
 2cr5zydi/nh/VrESX4cjCTP8K1vsTiqutiKFYBBmtTj1RqjFxBY/Bw79vpA8s3BOOO
 fZKWR9IzBtaAmm2IYdDIK4vRq+fcxQnU/A2DLiFI=
X-Riseup-User-ID: DED4EC58F93F8060E3748123B87A23ED9A8E740FF63738288CD5B1EBD7B4DE51
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4QHMYw2KV3zFphB;
 Thu, 11 May 2023 19:35:31 +0000 (UTC)
Message-ID: <ffee1587-5236-ce35-40b4-5b8286dd095b@riseup.net>
Date: Thu, 11 May 2023 16:35:28 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] drm: Add fixed-point helper to get rounded integer
 values
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
References: <20230507202848.207608-1-mcanal@igalia.com>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <20230507202848.207608-1-mcanal@igalia.com>
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



On 07/05/23 17:28, Maíra Canal wrote:
> Create a new fixed-point helper to allow us to return the rounded value
> of our fixed-point value.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
> 
> v1 -> v2: https://lore.kernel.org/dri-devel/20230425153353.238844-1-mcanal@igalia.com/T/
> 
> * New patch
> * Create the function drm_fixp2int_round() (Melissa Wen).
> 
> ---
>  include/drm/drm_fixed.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 255645c1f9a8..d695d0411e2d 100644
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
> +	return ((s64)a + (1 << (DRM_FIXED_POINT_HALF - 1))) >> DRM_FIXED_POINT;

I think it would be great to use drm_fixp2int, instead of shifting manually,
like drm_fixp2int_ceil does.

Best Regards,
~Arthur Grillo

> +}
> +
>  static inline int drm_fixp2int_ceil(s64 a)
>  {
>  	if (a > 0)
