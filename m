Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8225BB8846F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 09:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30E910E94F;
	Fri, 19 Sep 2025 07:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V41ZjFI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA8B10E94F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758268392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tigaMe2aOLrnjlNtLjZNSB1+1WoBObV3RUF8FYTDCVQ=;
 b=V41ZjFI1VpCncDGV10eQhj2ihdIf/dEyRVg0oXPyV4eJoHunRgmf3EXHfz2lZBImLVRA99
 ZfjTpUNdsFqHOtzpMkNeV+PqhCG/KfdqjwvHzT9AN9lBejbhFr81Df1l0qd/yFSFeWtlNl
 CeOq2scw272fwubvqy3FT+Gyr780s5M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-DHk_aAbfNamQx3-sF5OQUQ-1; Fri, 19 Sep 2025 03:53:08 -0400
X-MC-Unique: DHk_aAbfNamQx3-sF5OQUQ-1
X-Mimecast-MFC-AGG-ID: DHk_aAbfNamQx3-sF5OQUQ_1758268387
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4687ad5c341so3555855e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268387; x=1758873187;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tigaMe2aOLrnjlNtLjZNSB1+1WoBObV3RUF8FYTDCVQ=;
 b=EdcnT2T6ZSEuLkeG185SPr9a7G+bpO/itBILwvEcyuRQxX499rk4n89zUBfCVOlpv4
 cgHa24NbwqbksGjI10K7ivulKOIrAGWIxBsS83Av/R6rJRSZUiBeYg2awMcXR2kiZN1o
 UjaRGkDGBvD4+BYgpmT8Y4u3Wvh27+Yx+M7gH8pCUHDCBnFpZl2uL8djF7eUV5ODak1r
 FY4goglz9YXh7gYgld08mT/0vf7+of1ubNJb8NwXp89TfGFA6b1ZJzWVrBPtzMi40Sg2
 t3h6hvChUcnqZgsshxWGLYQ+MgvzrWLUvt/dJunEjoS93sOD62jupVzijp4ufXfkNymd
 AKew==
X-Gm-Message-State: AOJu0YzKT52G6a62v3jqj21AypZpvZOwgBQ2X0zaPVYUdRUtEZbYtwK7
 2I2Aa7XHM0kM3/4PYUZW70+tCEceqXl7c9NoDabm/8aC2+aSaERdCjEOTcTW0Ro/QrPLROe4vT6
 KkGYtBFJh5yV4RXUVubi+vic95CDtW5sElxeL8VYPFTdRWysRJ7TdjF6iz17NideT17d3+w==
X-Gm-Gg: ASbGncthgYhXNXLxDfhjlIPDH+YxvkowhKao7R3M4DsL8xB4886RFWE3p4QF2O7B2aR
 U9XT5V51oYmQsIPEoZdFvy4TpkmBf26bJ0UYxEOqGi0ullHsYRXfNS70/lHsSLntLDgYAHy1zTz
 aqyCK2xZjPhyQBYQ1senyoh9GOstlv7txMdfRHnvdkluQUKDfz/DJcEEzn/z9Aiqog6JXW5CXnr
 zkmjBuPksx0wVuroDkdHymHKf+95SoBy2IMP/1Re0maIl0VR4/i2lsEIPzjE0TyxXcVcPF0kW2S
 OLXV5e3YiQuNh8i3/N/wHr3QYy4RWRsjJp6faa+GKhwfRej9oQBCJG0I/3u36d3GzCnPHSPmfTw
 QEw0p
X-Received: by 2002:a05:600c:1991:b0:45b:8543:c8c9 with SMTP id
 5b1f17b1804b1-467eb3262a0mr14090115e9.34.1758268387181; 
 Fri, 19 Sep 2025 00:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa39X0g5ft6RC6TI5ioIy4uQVUlbQqwN924KpgqFximlhg1VWJv/Djh+N9AzV6QD9+jPT2sg==
X-Received: by 2002:a05:600c:1991:b0:45b:8543:c8c9 with SMTP id
 5b1f17b1804b1-467eb3262a0mr14089885e9.34.1758268386748; 
 Fri, 19 Sep 2025 00:53:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f162726bsm73349395e9.7.2025.09.19.00.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 00:53:06 -0700 (PDT)
Message-ID: <1b632dcf-d0ac-4fe0-9327-906797276440@redhat.com>
Date: Fri, 19 Sep 2025 09:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] drm/ast: Prepare per-Gen device initialization
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dDoX1svvW1KGOl8ckhwQ-Viz6RlC6oNCzE_2SL9qJcI_1758268387
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
> Switch device creation by hardware Gen. Return the value from the
> call to ast_detect_chip(). All generations are still initialized
> by ast_device_create().
> 
> Also add ast_device_init() for setting some common fields in struct
> ast_device.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.c  | 25 ++++++++++++++++++++++---
>   drivers/gpu/drm/ast/ast_drv.h  |  5 +++++
>   drivers/gpu/drm/ast/ast_main.c |  5 +----
>   3 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index c653ea5570d8..a1b3c25ded20 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -47,6 +47,18 @@ static int ast_modeset = -1;
>   MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
>   module_param_named(modeset, ast_modeset, int, 0400);
>   
> +void ast_device_init(struct ast_device *ast,
> +		     enum ast_chip chip,
> +		     enum ast_config_mode config_mode,
> +		     void __iomem *regs,
> +		     void __iomem *ioregs)
> +{
> +	ast->chip = chip;
> +	ast->config_mode = config_mode;
> +	ast->regs = regs;
> +	ast->ioregs = ioregs;
> +}
> +
>   void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip)
>   {
>   	static const char * const info_str[] = {
> @@ -281,7 +293,7 @@ static int ast_detect_chip(struct pci_dev *pdev,
>   	*chip_out = chip;
>   	*config_mode_out = config_mode;
>   
> -	return 0;
> +	return __AST_CHIP_GEN(chip);
>   }
>   
>   static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> @@ -292,6 +304,7 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	void __iomem *ioregs;
>   	enum ast_config_mode config_mode;
>   	enum ast_chip chip;
> +	unsigned int chip_gen;
>   	struct drm_device *drm;
>   	bool need_post = false;
>   
> @@ -364,10 +377,16 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		return ret;
>   
>   	ret = ast_detect_chip(pdev, regs, ioregs, &chip, &config_mode);
> -	if (ret)
> +	if (ret < 0)
>   		return ret;
> +	chip_gen = ret;
>   
> -	drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs, need_post);
> +	switch (chip_gen) {
> +	default:
> +		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
> +					need_post);
> +		break;
> +	}
>   	if (IS_ERR(drm))
>   		return PTR_ERR(drm);
>   	pci_set_drvdata(pdev, drm);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index ae8e6083bc2b..8868cbdd99d0 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -416,6 +416,11 @@ struct ast_crtc_state {
>   int ast_mm_init(struct ast_device *ast);
>   
>   /* ast_drv.c */
> +void ast_device_init(struct ast_device *ast,
> +		     enum ast_chip chip,
> +		     enum ast_config_mode config_mode,
> +		     void __iomem *regs,
> +		     void __iomem *ioregs);
>   void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip);
>   
>   /* ast_2000.c */
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 8ed15563173c..d1c54700686b 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -112,10 +112,7 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
>   		return ERR_CAST(ast);
>   	dev = &ast->base;
>   
> -	ast->chip = chip;
> -	ast->config_mode = config_mode;
> -	ast->regs = regs;
> -	ast->ioregs = ioregs;
> +	ast_device_init(ast, chip, config_mode, regs, ioregs);
>   
>   	if (AST_GEN(ast) >= 4)
>   		ast_2300_detect_tx_chip(ast);

