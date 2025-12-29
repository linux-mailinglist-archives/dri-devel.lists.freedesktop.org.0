Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBA6CE64C5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 10:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C0210E35F;
	Mon, 29 Dec 2025 09:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="vKAjmQd9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F61B10E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 09:33:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B11DC4E41E4F;
 Mon, 29 Dec 2025 09:33:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D04A60725;
 Mon, 29 Dec 2025 09:33:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 70223102F0BB1; Mon, 29 Dec 2025 10:33:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767000821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=00boEsv9PDFg6y37EpXpHLrQ2HtnkgcOqXBtnTsxSds=;
 b=vKAjmQd9DX1CF8fe1Ey2bextcb4oZvCucvGCHW7jj1Sa6IY/Rv7+/Ak5J835CpAzfBij3o
 WwUzVfBvt4zFe4NLItzuivvmd369IUSdRjgu05bqpddfeHOUwiy6r3h7mueZZhs1X984Yp
 1DoSgD2LDVlLdivfhjHQ9OV7ejsndhP3uHdhqW1i7863QZQIrjK5nKEfhoBswK75oHnS+w
 dz5QIefhXMCH56tKu1KF+OeRDsRpP5RO0qsoi1Xs0c52Cg6FklFS4KPlc57xybZePtR6XN
 UH30xLDTKahqKtmrmOKV1d7tXrKZzvQOL3VtneglVBKpnBJr8M018okwutMs8g==
Message-ID: <28d9f246-8952-4f03-94bc-60eadca78c2f@bootlin.com>
Date: Mon, 29 Dec 2025 10:33:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vkms: Fix bad matrix offset component multiplication
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nfraprado@collabora.com, pekka.paalanen@collabora.com,
 daniels@collabora.com, kernel@collabora.com
References: <20251223-vkms-composer-fix-matrix-v1-1-10a979e06209@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251223-vkms-composer-fix-matrix-v1-1-10a979e06209@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 12/23/25 18:26, Ariel D'Alessandro wrote:
> Pixels values are packed as 16-bit UNORM values, so the matrix offset
> components must be multiplied properly by the idempotent element -i.e.
> number 1 encoded as 16-bit UNORM-.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Hi,

Thanks for this patch!

How did you catch the issue? If you have an example of failing color 
conversion, can you add a test case in vkms_color_test?

Thanks,
Louis Chauvet

> ---
>   drivers/gpu/drm/vkms/vkms_composer.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 3cf3f26e0d8ea..efdaf665435d9 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -16,6 +16,8 @@
>   #include "vkms_composer.h"
>   #include "vkms_luts.h"
>   
> +#define UNORM_16BIT_ONE			(1ULL << 16)
> +
>   static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>   {
>   	u32 new_color;
> @@ -138,20 +140,25 @@ VISIBLE_IF_KUNIT void apply_3x4_matrix(struct pixel_argb_s32 *pixel,
>   	g = drm_int2fixp(pixel->g);
>   	b = drm_int2fixp(pixel->b);
>   
> +	/*
> +	 * Pixels values are packed as 16-bit UNORM values, so the matrix offset
> +	 * components must be multiplied properly by the idempotent element -i.e.
> +	 * number 1 encoded as 16-bit UNORM-.
> +	 */
>   	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), r) +
>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), g) +
>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), b) +
> -	     drm_sm2fixp(matrix->matrix[3]);
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[3]), drm_int2fixp(UNORM_16BIT_ONE));
>   
>   	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), r) +
>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), g) +
>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), b) +
> -	     drm_sm2fixp(matrix->matrix[7]);
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[7]), drm_int2fixp(UNORM_16BIT_ONE));
>   
>   	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), r) +
>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), g) +
>   	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), b) +
> -	     drm_sm2fixp(matrix->matrix[11]);
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[11]), drm_int2fixp(UNORM_16BIT_ONE));
>   
>   	pixel->r = drm_fixp2int_round(rf);
>   	pixel->g = drm_fixp2int_round(gf);
> 
> ---
> base-commit: b96bcfba104c65db41378a04f5ccac186f79578f
> change-id: 20251223-vkms-composer-fix-matrix-aa2c593f4515
> 
> Best regards,

