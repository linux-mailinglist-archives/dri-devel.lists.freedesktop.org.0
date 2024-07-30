Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE689940A1B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4021610E4D3;
	Tue, 30 Jul 2024 07:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O7xTwJ5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C3C10E4D3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722325292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+QFc42omRVRhINdl9X4jdixNRg1Vx4+4uyahouge0U=;
 b=O7xTwJ5gmkS4RS+zaJ4VlbwyxDgK4sYkU7vW0MK4gXsGI0y22xSzL97LDKEA86w8GSmi0G
 9GrHNsCzedk+x9FHePdB90mVTFE9cpmGWaVWMANyEWNAtmzzr3RWKMOaIhjbdLfsNN6Acg
 TIqwYvn8qVFGM+SrwbbwCRZlcl7+li4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-uw2pIGVLOgaWTbOg1-ktJQ-1; Tue, 30 Jul 2024 03:41:26 -0400
X-MC-Unique: uw2pIGVLOgaWTbOg1-ktJQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ef2907e21bso37821671fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 00:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722325285; x=1722930085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k+QFc42omRVRhINdl9X4jdixNRg1Vx4+4uyahouge0U=;
 b=apKpbsCFSZdrmjd1G8fGM5n5RxcJGw5mGJ3ZfYhJEXy5rTgd/1Erhgt8ckaTNsfC1F
 +CVE1owgprbtRgBmfzKE3jy0Qiet6+DVBuQpCGiAS6n0s7Cc35ui1dQgjxVbIJtBDmYb
 n/Y7rIs3CL5Rz6Bu+8geG9YGVvuw3BHYC+d/MnMUtIdmcggANNv3LLhIb+HVv2XyKZam
 v8Ll244eRfiqPx1PhA7upexlcteExksWzB4/gqqXfgtC2uCum8cqntHDh3cmiY0TEI3f
 g42ubQIUAWdBJA3233lf5FnYHeB6jZP8jI5wrCT/gUkVlZr0vndBIUwhCjs4DA6GOgtO
 vdNQ==
X-Gm-Message-State: AOJu0YyRMtM5QAJICprwAVHcpobp8E51gpFBQKiOR1FejU8CU3/r/Ssw
 +KqTjY+nBY3j/JPg/TYHsd8RRKYv12cx/qUsvQAi2aVPFdVufOqtqI9EzJVay+wJEQR7+Ne0jLy
 3qfMAOVwUWV7J6EZ1Jix0Gpj/ydb/p0DCHAzZ8PswIm/pbmIb27Fi56rX0Y3FsLPsUQ==
X-Received: by 2002:a2e:9e85:0:b0:2ef:2b08:1747 with SMTP id
 38308e7fff4ca-2f12ee04e8cmr65337531fa.13.1722325284763; 
 Tue, 30 Jul 2024 00:41:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDYfQLVm9zqE0YtQgIAxp9kZln2+mj+uXiSFE9MW9VWdTNKkUE6HV79tKuWK1UjgJxHjGQ2w==
X-Received: by 2002:a2e:9e85:0:b0:2ef:2b08:1747 with SMTP id
 38308e7fff4ca-2f12ee04e8cmr65337211fa.13.1722325284176; 
 Tue, 30 Jul 2024 00:41:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f93594b6sm247746495e9.5.2024.07.30.00.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 00:41:23 -0700 (PDT)
Message-ID: <1899c8d1-b2bd-4a59-a235-bc4f11f4f470@redhat.com>
Date: Tue, 30 Jul 2024 09:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/ast: astdp: Perform link training during
 atomic_enable
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240717143319.104012-1-tzimmermann@suse.de>
 <20240717143319.104012-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240717143319.104012-5-tzimmermann@suse.de>
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



On 17/07/2024 16:24, Thomas Zimmermann wrote:
> The place for link training is in the encoder's atomic_enable
> helper. Remove all related tests from other helper ASTDP functions;
> especially ast_astdp_is_connected(), which tests HPD status.
> 
> DP link training is controlled by the firmware. A status flag reports
> success or failure. The process can be fragile on Aspeed hardware. Moving
> the test from connector detection to the atomic_enable allows for several
> retries and a longer timeout.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c   | 45 +++++++++++++++++-----------------
>   drivers/gpu/drm/ast/ast_drv.h  |  1 +
>   drivers/gpu/drm/ast/ast_mode.c |  2 ++
>   drivers/gpu/drm/ast/ast_reg.h  |  3 +--
>   4 files changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index c45b336baf45..6cbde46f24dc 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -11,8 +11,6 @@ bool ast_astdp_is_connected(struct ast_device *ast)
>   {
>   	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, AST_IO_VGACRDF_HPD))
>   		return false;
> -	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS))
> -		return false;
>   	return true;
>   }
>   
> @@ -22,14 +20,10 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   	u8 i = 0, j = 0;
>   
>   	/*
> -	 * CRDC[b0]: DP link success
>   	 * CRE5[b0]: Host reading EDID process is done
>   	 */
> -	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
> -		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
> -								ASTDP_HOST_EDID_READ_DONE_MASK))) {
> +	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, ASTDP_HOST_EDID_READ_DONE_MASK)))
>   		goto err_astdp_edid_not_ready;
> -	}
>   
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
>   							0x00);
> @@ -58,11 +52,6 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   			 */
>   			mdelay(j+1);
>   
> -			if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC,
> -							ASTDP_LINK_SUCCESS))) {
> -				goto err_astdp_jump_out_loop_of_edid;
> -			}
> -
>   			j++;
>   			if (j > 200)
>   				goto err_astdp_jump_out_loop_of_edid;
> @@ -106,8 +95,6 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   	return (~(j+256) + 1);
>   
>   err_astdp_edid_not_ready:
> -	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS)))
> -		return (~0xDC + 1);
>   	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, ASTDP_HOST_EDID_READ_DONE_MASK)))
>   		return (~0xE5 + 1);
>   
> @@ -165,7 +152,22 @@ void ast_dp_power_on_off(struct drm_device *dev, bool on)
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_PHY_SLEEP, bE3);
>   }
>   
> +void ast_dp_link_training(struct ast_device *ast)
> +{
> +	struct drm_device *dev = &ast->base;
> +	unsigned int i = 10;
> +
> +	while (i--) {
> +		u8 vgacrdc = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
>   
> +		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)
> +			break;
> +		if (i)
> +			msleep(100);
> +	}
> +	if (!i)
> +		drm_err(dev, "Link training failed\n");
> +}
>   
>   void ast_dp_set_on_off(struct drm_device *dev, bool on)
>   {
> @@ -176,16 +178,13 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
>   	// Video On/Off
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_VIDEO_ENABLE, on);
>   
> -	// If DP plug in and link successful then check video on / off status
> -	if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS)) {
> -		video_on_off <<= 4;
> -		while (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF,
> +	video_on_off <<= 4;
> +	while (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF,
>   						ASTDP_MIRROR_VIDEO_ENABLE) != video_on_off) {
> -			// wait 1 ms
> -			mdelay(1);
> -			if (++i > 200)
> -				break;
> -		}
> +		// wait 1 ms
> +		mdelay(1);
> +		if (++i > 200)
> +			break;
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 02476eb78119..d23b98ce4359 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -474,6 +474,7 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
>   int ast_dp_launch(struct ast_device *ast);
>   bool ast_dp_power_is_on(struct ast_device *ast);
>   void ast_dp_power_on_off(struct drm_device *dev, bool no);
> +void ast_dp_link_training(struct ast_device *ast);
>   void ast_dp_set_on_off(struct drm_device *dev, bool no);
>   void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode);
>   
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 049ee1477c33..ddb7696acc04 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1622,6 +1622,8 @@ static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
>   	struct ast_device *ast = to_ast_device(dev);
>   
>   	ast_dp_power_on_off(dev, AST_DP_POWER_ON);
> +	ast_dp_link_training(ast);
> +
>   	ast_wait_for_vretrace(ast);
>   	ast_dp_set_on_off(dev, 1);
>   }
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index e61954dabf1a..28bb43f6795b 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -38,6 +38,7 @@
>   #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
>   
>   #define AST_IO_VGACRD1_MCU_FW_EXECUTING	BIT(5)
> +#define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
>   #define AST_IO_VGACRDF_HPD		BIT(0)
>   
>   #define AST_IO_VGAIR1_R			(0x5A)
> @@ -70,10 +71,8 @@
>   #define AST_DP_VIDEO_ENABLE		BIT(0)
>   
>   /*
> - * CRDC[b0]: DP link success
>    * CRE5[b0]: Host reading EDID process is done
>    */
> -#define ASTDP_LINK_SUCCESS		BIT(0)
>   #define ASTDP_HOST_EDID_READ_DONE	BIT(0)
>   #define ASTDP_HOST_EDID_READ_DONE_MASK	GENMASK(0, 0)
>   

