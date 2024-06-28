Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEBA91BBFC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586D110EBFE;
	Fri, 28 Jun 2024 09:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dAU8yXIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9664B10EBFE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719568619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gOQiWtj7pZtAQIV1UR6G2cxUXB6AedwPRgNUA319zg=;
 b=dAU8yXIbtCkA8rZS0yWl1rq/sD4dO/UuTszsSO1VEJwqRk/dW7DzAa/wS32qJy9CyG6zwi
 VZvNu6OqBQdUKNxQLFqG2k8fj50a/9MJa1jcXmBhsasFnymHDaOpE2y115k7SqHa8Pw4zt
 xuOxhoNBO/JyDxAaJX3IStATAkve7Xg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-yIDgFH6wO0m2eucpxBGQGg-1; Fri, 28 Jun 2024 05:56:58 -0400
X-MC-Unique: yIDgFH6wO0m2eucpxBGQGg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3673ce35cc7so334246f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719568617; x=1720173417;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0gOQiWtj7pZtAQIV1UR6G2cxUXB6AedwPRgNUA319zg=;
 b=V3nKR9Bsh+FUezAtwLPZieCTu5VU4Dl1aw6PI7tCX3QTsFD/UK4Ckft70VgPXFSn2i
 paR4Sen/m7nYKxo5bs0f5G5N6mnYF2l37N0oyc2OKZTFc4b9k9w0TxQV1yKqTTb2Bjb+
 heEo4KgQm7LEsG6v9FguwjAg/Bc7K76d2qsnX4UqynSn/jcb0enbMGSj6saf20a8sBQo
 DJp0v77xsTsRJpIdQFGpbSqmV/7VGbVIzYGXrK/GirV+K2gY2PeCiU7BXkOQ+AtpIO1B
 DljbsMl0Z59h30oEIWGKSh5GvkW3BVqcsJbQNHkGq8IAOS7d3QyidC3Q5OpeSuoTE5Ow
 Th4Q==
X-Gm-Message-State: AOJu0YxsbMknT4Rmjnfyjop7RgtoDa8GdQ/1Zwot+R9Vr+LpmFopKyI3
 yI5sXpWzS6MkN0XeJPpfqu5TgkNXRsqQDw/6YHbCLrzoUIbx9gjH63HETgcFgCUKOLZzkagu2TT
 bsNetoBFhmLbpQ8ru9hZ2gm8ONxhERi/Bu6nZQoKQOZtKCK9doo1QdzpwmHM0BYmYhg==
X-Received: by 2002:a05:6000:154d:b0:366:e7b5:3b49 with SMTP id
 ffacd0b85a97d-366e7b540a8mr15395313f8f.54.1719568617023; 
 Fri, 28 Jun 2024 02:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3IeOVFv8Mv+NKT/+4ElnL1ZUfLGPdTlE8uijcUIka6yCL4f66WxnrdUzvS1SQ749JLafirQ==
X-Received: by 2002:a05:6000:154d:b0:366:e7b5:3b49 with SMTP id
 ffacd0b85a97d-366e7b540a8mr15395306f8f.54.1719568616650; 
 Fri, 28 Jun 2024 02:56:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10305fsm1730152f8f.96.2024.06.28.02.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:56:56 -0700 (PDT)
Message-ID: <0000dc70-6abd-49ac-b0f7-b72e277368e2@redhat.com>
Date: Fri, 28 Jun 2024 11:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/ast: Only set VGA SCREEN_DISABLE bit in CRTC code
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <20240627153638.8765-1-tzimmermann@suse.de>
 <20240627153638.8765-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240627153638.8765-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 27/06/2024 17:27, Thomas Zimmermann wrote:
> The SCREEN_DISABLE bit controls scanout from display memory. The bit
> affects all planes, so set it only in the CRTC's atomic enable and
> disable functions.
> 
> A number of bugs affect this fix. First of all, ast_set_std_regs()
> tries to set VGASR1 except for the SD bit. Bit the read bitmask is
> invert, so it preserves anything exceptt the SD bit. Fix this by
> inverting the read mask.
> 
> The second issue is that primary-plane and CRTC helpers modify the
> SD bit. The bit controls scanout for all planes, primary and HW
> cursor, so set it only in the CRTC code.
> 
> Further add a constant to represent the SD bit in VGASR1. Keep the
> plane's atomic_disable around to make the DRM framework happy.

Thanks, it looks good te me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 14 +++++++-------
>   drivers/gpu/drm/ast/ast_reg.h  |  1 +
>   2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index e90179bc0842..77358b587098 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -303,7 +303,7 @@ static void ast_set_std_reg(struct ast_device *ast,
>   
>   	/* Set SEQ; except Screen Disable field */
>   	ast_set_index_reg(ast, AST_IO_VGASRI, 0x00, 0x03);
> -	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, stdtable->seq[0]);
> +	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0x20, stdtable->seq[0]);
>   	for (i = 1; i < 4; i++) {
>   		jreg = stdtable->seq[i];
>   		ast_set_index_reg(ast, AST_IO_VGASRI, (i + 1), jreg);
> @@ -690,15 +690,15 @@ static void ast_primary_plane_helper_atomic_enable(struct drm_plane *plane,
>   	 * Therefore only reprogram the address after enabling the plane.
>   	 */
>   	ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
> -	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x1, 0xdf, 0x00);
>   }
>   
>   static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
>   						    struct drm_atomic_state *state)
>   {
> -	struct ast_device *ast = to_ast_device(plane->dev);
> -
> -	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x1, 0xdf, 0x20);
> +	/*
> +	 * Keep this empty function to avoid calling
> +	 * atomic_update when disabling the plane.
> +	 */
>   }
>   
>   static int ast_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
> @@ -1029,14 +1029,14 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
>   	 */
>   	switch (mode) {
>   	case DRM_MODE_DPMS_ON:
> -		ast_set_index_reg_mask(ast, AST_IO_VGASRI,  0x01, 0xdf, 0);
>   		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0);
> +		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0);
>   		break;
>   	case DRM_MODE_DPMS_STANDBY:
>   	case DRM_MODE_DPMS_SUSPEND:
>   	case DRM_MODE_DPMS_OFF:
>   		ch = mode;
> -		ast_set_index_reg_mask(ast, AST_IO_VGASRI,  0x01, 0xdf, 0x20);
> +		ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);
>   		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, ch);
>   		break;
>   	}
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 62dddbf3fe56..6326cbdadc82 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -22,6 +22,7 @@
>   #define AST_IO_VGAER_VGA_ENABLE		BIT(0)
>   
>   #define AST_IO_VGASRI			(0x44)
> +#define AST_IO_VGASR1_SD		BIT(5)
>   #define AST_IO_VGADRR			(0x47)
>   #define AST_IO_VGADWR			(0x48)
>   #define AST_IO_VGAPDR		        (0x49)

