Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A73B8846C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 09:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD22710E94C;
	Fri, 19 Sep 2025 07:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OIeCQH7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2076F10E94C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758268359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vT6IvkHVsqIBZpBdNya9k7bgKZG4l2hvwbn8nne1BhY=;
 b=OIeCQH7FAdbBxdtyGrKiU7wxiJHjsmY/ymaebqb45jfjEliKcb31/uDxgh0Oe2HpfiQk4L
 aU91UlGOReQDjODLpfT3u2INyKJ9LV/O7lgm6yl/TxlRMSNflnfepqhg/wwzruGOeL3ihN
 9JS+mbGLi9vuPCqYRsTWSPlqQDNhjCs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-Qps59gk8OQGdP4UApxlCXA-1; Fri, 19 Sep 2025 03:52:35 -0400
X-MC-Unique: Qps59gk8OQGdP4UApxlCXA-1
X-Mimecast-MFC-AGG-ID: Qps59gk8OQGdP4UApxlCXA_1758268355
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45dd56f0000so22928285e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268354; x=1758873154;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vT6IvkHVsqIBZpBdNya9k7bgKZG4l2hvwbn8nne1BhY=;
 b=NBob86vpfjrB1WR45lBesb6CkueJ9nVZsodM706v2CPxuATnuOJdyKRiMSGVpofbYx
 UEP9oVhAggGDmfIuDTzTNS1+5e6sHTWRX5iv8/EA1UEXULPO3onTLts+klmBjHzJ11Fr
 VyF4ncSOgDhvRh8+qpwC/idYImr7cPi+YmtY1Ht8w47/kAuwpS7icUzKCxZnmnFZ3Ely
 RpTm7J6vV37UwJ9hy10FvEB5+tlEAseCVnETahszIxZgmkKb0KP0fXM2qZXxfOuDhq3O
 2fEjekESg4RGGlK+8ZjqR/mJXGgURBWYHm8MrznmH35l23vrV+YO27c+RQahfA8JZ96j
 TIEw==
X-Gm-Message-State: AOJu0Ywf5gcRkRz3C/EX7OkTOOmGIPEg4vNA4w8Ra0GTr9ikWVaOnQww
 7O7XcjEOus1Vr0+7I9FktyeCdZOq3UYZ/bY5/TQDGKUlDVJx5S+HjcrVLVPtu+KF8IBwBZ9vISS
 +Je3TDLafYitpx0ZfGezkmgofrugqCvbMeGc8EG0UPTE6KmJfLMqWTNmoyU7AJR0rWsTDlw==
X-Gm-Gg: ASbGncv3AFzEuT2QcEB8Arj5+SDEIM1OW9Ct/M6yjsq9e3/eimxoxrr5BvMaoy8b1BK
 aoemOm6WJ7E0jm0klaK/W2GQrXiUWhKpEvuJaO1vzYWouJDSRlZshUPkpUmhA0l8ADw+PYMXHbo
 uNgrxkXUYMnxw+exg8C+EcOwVvBhTrt3+Hv3C5Wa2cXutct0mtaZ3Bk0aMmV0jLB5A89kEW5hTp
 kRhjsE3YiAruMdhOrzrXZOwUhJaj+T64hVICqS7qJlDr7bINPo+K/k1kZ7J0/KeAkDftRFBm3D2
 IN+pYzNyCRu7H9F1Jx8sP4LXAd4RLOhGgZ+ZxIrS+8skOYxC7+I/82pEpWZpn8l4wgda04ybnwn
 R9GQd
X-Received: by 2002:a05:600d:15a:10b0:45d:d197:fecf with SMTP id
 5b1f17b1804b1-4687aa75aecmr9061765e9.0.1758268354430; 
 Fri, 19 Sep 2025 00:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkz95lM0EXB4+shdE2S48eESWvBNCmMypAykkFyfLPItzCxcHgXlvy/AUtYZsUVWzIrSgOWw==
X-Received: by 2002:a05:600d:15a:10b0:45d:d197:fecf with SMTP id
 5b1f17b1804b1-4687aa75aecmr9061605e9.0.1758268353983; 
 Fri, 19 Sep 2025 00:52:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613d14d212sm130074125e9.12.2025.09.19.00.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 00:52:33 -0700 (PDT)
Message-ID: <3872ef6d-6ec5-4be0-abf9-9552395be425@redhat.com>
Date: Fri, 19 Sep 2025 09:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/ast: Split ast_detect_tx_chip() per chip
 generation
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n_4KbwIK-vmnLBBdOOyKasyb3CD4opYWBlv5jzcKduw_1758268355
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

On 16/09/2025 17:26, Thomas Zimmermann wrote:
> Gen4 and later models detect the TX chip from VGACRD1, while earlier
> models detect from VGACRA3. Split up the detection helper into
> two separate helpers. Use SZ_ constants instead of plain numbers.
> 
> Then inline the call into its only caller ast_device_create(). When
> ast_device_create() gets split up per Gen, either call will remain.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2000.c | 26 ++++++++++
>   drivers/gpu/drm/ast/ast_2300.c | 68 ++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.c  | 15 ++++++
>   drivers/gpu/drm/ast/ast_drv.h  |  5 ++
>   drivers/gpu/drm/ast/ast_main.c | 94 ++--------------------------------
>   5 files changed, 119 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
> index a31daf7c2ceb..63fad9fbf519 100644
> --- a/drivers/gpu/drm/ast/ast_2000.c
> +++ b/drivers/gpu/drm/ast/ast_2000.c
> @@ -181,3 +181,29 @@ const struct ast_vbios_dclk_info ast_2000_dclk_table[] = {
>   	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
>   	{0x3b, 0x2c, 0x81},			/* 1a: VCLK118_25	*/
>   };
> +
> +/*
> + * Device initialization
> + */
> +
> +void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post)
> +{
> +	enum ast_tx_chip tx_chip = AST_TX_NONE;
> +	u8 vgacra3;
> +
> +	/*
> +	 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
> +	 * enabled, in that case, assume we have a SIL164 TMDS transmitter
> +	 *
> +	 * Don't make that assumption if we the chip wasn't enabled and
> +	 * is at power-on reset, otherwise we'll incorrectly "detect" a
> +	 * SIL164 when there is none.
> +	 */
> +	if (!need_post) {
> +		vgacra3 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
> +		if (vgacra3 & AST_IO_VGACRA3_DVO_ENABLED)
> +			tx_chip = AST_TX_SIL164;
> +	}
> +
> +	__ast_device_set_tx_chip(ast, tx_chip);
> +}
> diff --git a/drivers/gpu/drm/ast/ast_2300.c b/drivers/gpu/drm/ast/ast_2300.c
> index dc2a32244689..68d269ef9b47 100644
> --- a/drivers/gpu/drm/ast/ast_2300.c
> +++ b/drivers/gpu/drm/ast/ast_2300.c
> @@ -27,6 +27,10 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/sizes.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>   
>   #include "ast_drv.h"
>   #include "ast_post.h"
> @@ -1326,3 +1330,67 @@ int ast_2300_post(struct ast_device *ast)
>   
>   	return 0;
>   }
> +
> +/*
> + * Device initialization
> + */
> +
> +void ast_2300_detect_tx_chip(struct ast_device *ast)
> +{
> +	enum ast_tx_chip tx_chip = AST_TX_NONE;
> +	struct drm_device *dev = &ast->base;
> +	u8 vgacrd1;
> +
> +	/*
> +	 * On AST GEN4+, look at the configuration set by the SoC in
> +	 * the SOC scratch register #1 bits 11:8 (interestingly marked
> +	 * as "reserved" in the spec)
> +	 */
> +	vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
> +					 AST_IO_VGACRD1_TX_TYPE_MASK);
> +	switch (vgacrd1) {
> +	/*
> +	 * GEN4 to GEN6
> +	 */
> +	case AST_IO_VGACRD1_TX_SIL164_VBIOS:
> +		tx_chip = AST_TX_SIL164;
> +		break;
> +	case AST_IO_VGACRD1_TX_DP501_VBIOS:
> +		ast->dp501_fw_addr = drmm_kzalloc(dev, SZ_32K, GFP_KERNEL);
> +		if (ast->dp501_fw_addr) {
> +			/* backup firmware */
> +			if (ast_backup_fw(ast, ast->dp501_fw_addr, SZ_32K)) {
> +				drmm_kfree(dev, ast->dp501_fw_addr);
> +				ast->dp501_fw_addr = NULL;
> +			}
> +		}
> +		fallthrough;
> +	case AST_IO_VGACRD1_TX_FW_EMBEDDED_FW:
> +		tx_chip = AST_TX_DP501;
> +		break;
> +	/*
> +	 * GEN7+
> +	 */
> +	case AST_IO_VGACRD1_TX_ASTDP:
> +		tx_chip = AST_TX_ASTDP;
> +		break;
> +	/*
> +	 * Several of the listed TX chips are not explicitly supported
> +	 * by the ast driver. If these exist in real-world devices, they
> +	 * are most likely reported as VGA or SIL164 outputs. We warn here
> +	 * to get bug reports for these devices. If none come in for some
> +	 * time, we can begin to fail device probing on these values.
> +	 */
> +	case AST_IO_VGACRD1_TX_ITE66121_VBIOS:
> +		drm_warn(dev, "ITE IT66121 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
> +		break;
> +	case AST_IO_VGACRD1_TX_CH7003_VBIOS:
> +		drm_warn(dev, "Chrontel CH7003 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
> +		break;
> +	case AST_IO_VGACRD1_TX_ANX9807_VBIOS:
> +		drm_warn(dev, "Analogix ANX9807 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
> +		break;
> +	}
> +
> +	__ast_device_set_tx_chip(ast, tx_chip);
> +}
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 473faa92d08c..c653ea5570d8 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -37,6 +37,7 @@
>   #include <drm/drm_fbdev_shmem.h>
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_module.h>
> +#include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
>   
>   #include "ast_drv.h"
> @@ -46,6 +47,20 @@ static int ast_modeset = -1;
>   MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
>   module_param_named(modeset, ast_modeset, int, 0400);
>   
> +void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip)
> +{
> +	static const char * const info_str[] = {
> +		"analog VGA",
> +		"Sil164 TMDS transmitter",
> +		"DP501 DisplayPort transmitter",
> +		"ASPEED DisplayPort transmitter",
> +	};
> +
> +	drm_info(&ast->base, "Using %s\n", info_str[tx_chip]);
> +
> +	ast->tx_chip = tx_chip;
> +}
> +
>   /*
>    * DRM driver
>    */
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index c75600981251..ae8e6083bc2b 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -415,9 +415,13 @@ struct ast_crtc_state {
>   
>   int ast_mm_init(struct ast_device *ast);
>   
> +/* ast_drv.c */
> +void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip);
> +
>   /* ast_2000.c */
>   int ast_2000_post(struct ast_device *ast);
>   extern const struct ast_vbios_dclk_info ast_2000_dclk_table[];
> +void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post);
>   
>   /* ast_2100.c */
>   int ast_2100_post(struct ast_device *ast);
> @@ -426,6 +430,7 @@ bool __ast_2100_detect_wuxga(struct ast_device *ast);
>   
>   /* ast_2300.c */
>   int ast_2300_post(struct ast_device *ast);
> +void ast_2300_detect_tx_chip(struct ast_device *ast);
>   
>   /* ast_2500.c */
>   void ast_2500_patch_ahb(void __iomem *regs);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 1678845274c7..8ed15563173c 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -95,94 +95,6 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   	}
>   }
>   
> -static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
> -{
> -	static const char * const info_str[] = {
> -		"analog VGA",
> -		"Sil164 TMDS transmitter",
> -		"DP501 DisplayPort transmitter",
> -		"ASPEED DisplayPort transmitter",
> -	};
> -
> -	struct drm_device *dev = &ast->base;
> -	u8 vgacra3, vgacrd1;
> -
> -	/* Check 3rd Tx option (digital output afaik) */
> -	ast->tx_chip = AST_TX_NONE;
> -
> -	if (AST_GEN(ast) <= 3) {
> -		/*
> -		 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
> -		 * enabled, in that case, assume we have a SIL164 TMDS transmitter
> -		 *
> -		 * Don't make that assumption if we the chip wasn't enabled and
> -		 * is at power-on reset, otherwise we'll incorrectly "detect" a
> -		 * SIL164 when there is none.
> -		 */
> -		if (!need_post) {
> -			vgacra3 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
> -			if (vgacra3 & AST_IO_VGACRA3_DVO_ENABLED)
> -				ast->tx_chip = AST_TX_SIL164;
> -		}
> -	} else {
> -		/*
> -		 * On AST GEN4+, look at the configuration set by the SoC in
> -		 * the SOC scratch register #1 bits 11:8 (interestingly marked
> -		 * as "reserved" in the spec)
> -		 */
> -		vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
> -						 AST_IO_VGACRD1_TX_TYPE_MASK);
> -		switch (vgacrd1) {
> -		/*
> -		 * GEN4 to GEN6
> -		 */
> -		case AST_IO_VGACRD1_TX_SIL164_VBIOS:
> -			ast->tx_chip = AST_TX_SIL164;
> -			break;
> -		case AST_IO_VGACRD1_TX_DP501_VBIOS:
> -			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
> -			if (ast->dp501_fw_addr) {
> -				/* backup firmware */
> -				if (ast_backup_fw(ast, ast->dp501_fw_addr, 32*1024)) {
> -					drmm_kfree(dev, ast->dp501_fw_addr);
> -					ast->dp501_fw_addr = NULL;
> -				}
> -			}
> -			fallthrough;
> -		case AST_IO_VGACRD1_TX_FW_EMBEDDED_FW:
> -			ast->tx_chip = AST_TX_DP501;
> -			break;
> -		/*
> -		 * GEN7+
> -		 */
> -		case AST_IO_VGACRD1_TX_ASTDP:
> -			ast->tx_chip = AST_TX_ASTDP;
> -			break;
> -		/*
> -		 * Several of the listed TX chips are not explicitly supported
> -		 * by the ast driver. If these exist in real-world devices, they
> -		 * are most likely reported as VGA or SIL164 outputs. We warn here
> -		 * to get bug reports for these devices. If none come in for some
> -		 * time, we can begin to fail device probing on these values.
> -		 */
> -		case AST_IO_VGACRD1_TX_ITE66121_VBIOS:
> -			drm_warn(dev, "ITE IT66121 detected, 0x%x, Gen%lu\n",
> -				 vgacrd1, AST_GEN(ast));
> -			break;
> -		case AST_IO_VGACRD1_TX_CH7003_VBIOS:
> -			drm_warn(dev, "Chrontel CH7003 detected, 0x%x, Gen%lu\n",
> -				 vgacrd1, AST_GEN(ast));
> -			break;
> -		case AST_IO_VGACRD1_TX_ANX9807_VBIOS:
> -			drm_warn(dev, "Analogix ANX9807 detected, 0x%x, Gen%lu\n",
> -				 vgacrd1, AST_GEN(ast));
> -			break;
> -		}
> -	}
> -
> -	drm_info(dev, "Using %s\n", info_str[ast->tx_chip]);
> -}
> -
>   struct drm_device *ast_device_create(struct pci_dev *pdev,
>   				     const struct drm_driver *drv,
>   				     enum ast_chip chip,
> @@ -205,7 +117,11 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
>   	ast->regs = regs;
>   	ast->ioregs = ioregs;
>   
> -	ast_detect_tx_chip(ast, need_post);
> +	if (AST_GEN(ast) >= 4)
> +		ast_2300_detect_tx_chip(ast);
> +	else
> +		ast_2000_detect_tx_chip(ast, need_post);
> +
>   	switch (ast->tx_chip) {
>   	case AST_TX_ASTDP:
>   		ret = ast_post_gpu(ast);

