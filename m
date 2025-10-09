Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06668BC9141
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B75810EA22;
	Thu,  9 Oct 2025 12:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RZaqXbC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2E610EA22
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760013653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/lGwpht0FzByi5I8SnfLTev6FDqWYG/TdjkCJElbqo=;
 b=RZaqXbC2XEIlTZF/QOCdFE6fOYUfARaz5xYA6p4eE48xsKSePBdX1g0roCzbLpwHpUkRIb
 FFD1fO+iDBtrkfFY1NO0qyh7Yjs6KVvy0Ff43kgbmE1z/qBKCU5IOPRqe5C4Pal955pXfV
 Bi4HK5/scU21j3jqsXfH7JRiMe+1hJI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-mOAuHvhqMFyFZd2JN_2e7g-1; Thu, 09 Oct 2025 08:40:49 -0400
X-MC-Unique: mOAuHvhqMFyFZd2JN_2e7g-1
X-Mimecast-MFC-AGG-ID: mOAuHvhqMFyFZd2JN_2e7g_1760013649
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3efa77de998so1105086f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 05:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760013648; x=1760618448;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h/lGwpht0FzByi5I8SnfLTev6FDqWYG/TdjkCJElbqo=;
 b=UAHhcLJSHfKD5YBixpHFg0DQYZHpI8SY7kCiL1xvfknYZKTxSiHt/axZ0q6i784YwU
 PqIbPTBMWj2eCZARxfw8skl9l+nmvK3q8jEmAHRAS+5fxIg672pZEcK1XyYvHLiinYft
 qva8ikwZos1NV9qwFZF8Ooa80/bz4Meg9My4N15q0Cu2dt7VjyYpdQC3lp/pimPaSvNi
 UAMHKvH53IaNWJll3uR0WTSJUyboAIoKvWDTJJjSYtAAzBZy49H+pdJAiBq+mxPYnGx1
 i9yrrXj/yeUzu6QH9Gdmzwd+FzMtRzifoOAHlcspINLR6T8SzFY2UlgyeBWLR57HLxBR
 ZWxQ==
X-Gm-Message-State: AOJu0YzGcu0vVziNLGf1HGMPXXbvpRH8q7WJK3P/uQAdQ0ZgzJuCDRBY
 uEMETwsr15+7ioclv9ZRPKP2k2bYkpYnUZ4/87S1zCO6TLrt0ZHwxV/jlbZZCo+oPWqmQMAP5Ox
 Bu3ndbolX+yz2Ig9PJLvx7HjNgTBXOQmQhbjNUjvRPWgPsoAVe3ZMMAE833xPx48jXlSiVw==
X-Gm-Gg: ASbGncv5dMyrRVZrQzYD6lde+BtNqe9YbfF7FEAzroac0QwvRqts0fljE28UZK6Gzru
 bnvvB3HmC9t19aaoH4DZ5UtQPwG/lxuH85kXfH+3DVyj3hjT5yCy1gls6OotpOOQF7ghpEPQ/RG
 wuPw4R0lS5rolTsPqJEy138K/jIv6JKj6biExd03WK1B40TgJ3ae67AACdy75ev90Z3lmKuxjD9
 MAXQoBHGYdp2ONHkOnn0qu1bRZrFpJFA8U07nTGRwx6eMb+BKm8GaZMBVDu5Q/B83aSeAEqlI8e
 Dw9BNQ+JLrIjvtLkQPLgrO7QE5o5KnCl2RF53iWOrKv3kZXwmoUmGbZ2E0VNYSX80ZDgKaUe4z6
 KpOtMXLsljw==
X-Received: by 2002:a05:6000:1848:b0:3da:27c2:f51d with SMTP id
 ffacd0b85a97d-4266e8dd68fmr4880285f8f.45.1760013648493; 
 Thu, 09 Oct 2025 05:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwNzw4sgMffGc1VNsWmgDShDl/fsnjlTo62iEFlTeqQogW/kQQo3Unwn3hNTNPVjzxLStEJw==
X-Received: by 2002:a05:6000:1848:b0:3da:27c2:f51d with SMTP id
 ffacd0b85a97d-4266e8dd68fmr4880265f8f.45.1760013648041; 
 Thu, 09 Oct 2025 05:40:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9703sm35005728f8f.30.2025.10.09.05.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 05:40:43 -0700 (PDT)
Message-ID: <b91f70ed-6da4-4933-9b32-72dbec10810b@redhat.com>
Date: Thu, 9 Oct 2025 14:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/ast: Support device quirks
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20251007150343.273718-1-tzimmermann@suse.de>
 <20251007150343.273718-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251007150343.273718-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 26UmqYZLoRXVrW2q8EWKa82QZId0F-KqujQt-cFiI30_1760013649
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

On 10/7/25 16:54, Thomas Zimmermann wrote:
> Define struct ast_device_quirks and add an instance for each hardware
> generation. The type will provide information about per-gen constants
> and oddities.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2000.c | 5 ++++-
>   drivers/gpu/drm/ast/ast_2100.c | 5 ++++-
>   drivers/gpu/drm/ast/ast_2200.c | 5 ++++-
>   drivers/gpu/drm/ast/ast_2300.c | 5 ++++-
>   drivers/gpu/drm/ast/ast_2400.c | 5 ++++-
>   drivers/gpu/drm/ast/ast_2500.c | 5 ++++-
>   drivers/gpu/drm/ast/ast_2600.c | 5 ++++-
>   drivers/gpu/drm/ast/ast_drv.c  | 4 +++-
>   drivers/gpu/drm/ast/ast_drv.h  | 8 +++++++-
>   9 files changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
> index 74a041e99061..ae4d7a2a0ec8 100644
> --- a/drivers/gpu/drm/ast/ast_2000.c
> +++ b/drivers/gpu/drm/ast/ast_2000.c
> @@ -211,6 +211,9 @@ void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	__ast_device_set_tx_chip(ast, tx_chip);
>   }
>   
> +static const struct ast_device_quirks ast_2000_device_quirks = {
> +};
> +
>   struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
>   					  const struct drm_driver *drv,
>   					  enum ast_chip chip,
> @@ -228,7 +231,7 @@ struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
>   		return ERR_CAST(ast);
>   	dev = &ast->base;
>   
> -	ast_device_init(ast, chip, config_mode, regs, ioregs);
> +	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2000_device_quirks);
>   
>   	ast->dclk_table = ast_2000_dclk_table;
>   
> diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
> index eb3336c84833..01e064e67cf7 100644
> --- a/drivers/gpu/drm/ast/ast_2100.c
> +++ b/drivers/gpu/drm/ast/ast_2100.c
> @@ -432,6 +432,9 @@ static void ast_2100_detect_widescreen(struct ast_device *ast)
>   		ast->support_wuxga = true;
>   }
>   
> +static const struct ast_device_quirks ast_2100_device_quirks = {
> +};
> +
>   struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
>   					  const struct drm_driver *drv,
>   					  enum ast_chip chip,
> @@ -449,7 +452,7 @@ struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
>   		return ERR_CAST(ast);
>   	dev = &ast->base;
>   
> -	ast_device_init(ast, chip, config_mode, regs, ioregs);
> +	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2100_device_quirks);
>   
>   	ast->dclk_table = ast_2000_dclk_table;
>   
> diff --git a/drivers/gpu/drm/ast/ast_2200.c b/drivers/gpu/drm/ast/ast_2200.c
> index 391034d5f425..46b6fc6cf7eb 100644
> --- a/drivers/gpu/drm/ast/ast_2200.c
> +++ b/drivers/gpu/drm/ast/ast_2200.c
> @@ -43,6 +43,9 @@ static void ast_2200_detect_widescreen(struct ast_device *ast)
>   		ast->support_wuxga = true;
>   }
>   
> +static const struct ast_device_quirks ast_2200_device_quirks = {
> +};
> +
>   struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
>   					  const struct drm_driver *drv,
>   					  enum ast_chip chip,
> @@ -60,7 +63,7 @@ struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
>   		return ERR_CAST(ast);
>   	dev = &ast->base;
>   
> -	ast_device_init(ast, chip, config_mode, regs, ioregs);
> +	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2200_device_quirks);
>   
>   	ast->dclk_table = ast_2000_dclk_table;
>   
> diff --git a/drivers/gpu/drm/ast/ast_2300.c b/drivers/gpu/drm/ast/ast_2300.c
> index 3c9e1960b90c..b76a80d6aea6 100644
> --- a/drivers/gpu/drm/ast/ast_2300.c
> +++ b/drivers/gpu/drm/ast/ast_2300.c
> @@ -1407,6 +1407,9 @@ static void ast_2300_detect_widescreen(struct ast_device *ast)
>   		ast->support_wuxga = true;
>   }
>   
> +static const struct ast_device_quirks ast_2300_device_quirks = {
> +};
> +
>   struct drm_device *ast_2300_device_create(struct pci_dev *pdev,
>   					  const struct drm_driver *drv,
>   					  enum ast_chip chip,
> @@ -1424,7 +1427,7 @@ struct drm_device *ast_2300_device_create(struct pci_dev *pdev,
>   		return ERR_CAST(ast);
>   	dev = &ast->base;
>   
> -	ast_device_init(ast, chip, config_mode, regs, ioregs);
> +	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2300_device_quirks);
>   
>   	ast->dclk_table = ast_2000_dclk_table;
>   
> diff --git a/drivers/gpu/drm/ast/ast_2400.c b/drivers/gpu/drm/ast/ast_2400.c
> index be866d1cd06a..2b41ff69ab0b 100644
> --- a/drivers/gpu/drm/ast/ast_2400.c
> +++ b/drivers/gpu/drm/ast/ast_2400.c
> @@ -44,6 +44,9 @@ static void ast_2400_detect_widescreen(struct ast_device *ast)
>   		ast->support_wuxga = true;
>   }
>   
> +static const struct ast_device_quirks ast_2400_device_quirks = {
> +};
> +
>   struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
>   					  const struct drm_driver *drv,
>   					  enum ast_chip chip,
> @@ -61,7 +64,7 @@ struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
>   		return ERR_CAST(ast);
>   	dev = &ast->base;
>   
> -	ast_device_init(ast, chip, config_mode, regs, ioregs);
> +	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2400_device_quirks);
>   
>   	ast->dclk_table = ast_2000_dclk_table;
>   
> diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
> index 086c74682a55..6d305a8ccc51 100644
> --- a/drivers/gpu/drm/ast/ast_2500.c
> +++ b/drivers/gpu/drm/ast/ast_2500.c
> @@ -618,6 +618,9 @@ static void ast_2500_detect_widescreen(struct ast_device *ast)
>   		ast->support_wuxga = true;
>   }
>   
> +static const struct ast_device_quirks ast_2500_device_quirks = {
> +};
> +
>   struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
>   					  const struct drm_driver *drv,
>   					  enum ast_chip chip,
> @@ -635,7 +638,7 @@ struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
>   		return ERR_CAST(ast);
>   	dev = &ast->base;
>   
> -	ast_device_init(ast, chip, config_mode, regs, ioregs);
> +	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2500_device_quirks);
>   
>   	ast->dclk_table = ast_2500_dclk_table;
>   
> diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
> index 1f709486f491..df3b429e8174 100644
> --- a/drivers/gpu/drm/ast/ast_2600.c
> +++ b/drivers/gpu/drm/ast/ast_2600.c
> @@ -59,6 +59,9 @@ static void ast_2600_detect_widescreen(struct ast_device *ast)
>   		ast->support_wuxga = true;
>   }
>   
> +static const struct ast_device_quirks ast_2600_device_quirks = {
> +};
> +
>   struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
>   					  const struct drm_driver *drv,
>   					  enum ast_chip chip,
> @@ -76,7 +79,7 @@ struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
>   		return ERR_CAST(ast);
>   	dev = &ast->base;
>   
> -	ast_device_init(ast, chip, config_mode, regs, ioregs);
> +	ast_device_init(ast, chip, config_mode, regs, ioregs, &ast_2600_device_quirks);
>   
>   	ast->dclk_table = ast_2500_dclk_table;
>   
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index a89735c6a462..b9a9b050b546 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -51,8 +51,10 @@ void ast_device_init(struct ast_device *ast,
>   		     enum ast_chip chip,
>   		     enum ast_config_mode config_mode,
>   		     void __iomem *regs,
> -		     void __iomem *ioregs)
> +		     void __iomem *ioregs,
> +		     const struct ast_device_quirks *quirks)
>   {
> +	ast->quirks = quirks;
>   	ast->chip = chip;
>   	ast->config_mode = config_mode;
>   	ast->regs = regs;
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index b2b30a0e4ffb..2a2c28693dc6 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -164,9 +164,14 @@ to_ast_connector(struct drm_connector *connector)
>    * Device
>    */
>   
> +struct ast_device_quirks {
> +};
> +
>   struct ast_device {
>   	struct drm_device base;
>   
> +	const struct ast_device_quirks *quirks;
> +
>   	void __iomem *regs;
>   	void __iomem *ioregs;
>   	void __iomem *dp501_fw_buf;
> @@ -414,7 +419,8 @@ void ast_device_init(struct ast_device *ast,
>   		     enum ast_chip chip,
>   		     enum ast_config_mode config_mode,
>   		     void __iomem *regs,
> -		     void __iomem *ioregs);
> +		     void __iomem *ioregs,
> +		     const struct ast_device_quirks *quirks);
>   void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip);
>   
>   /* ast_2000.c */

