Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5AB88527
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 10:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD26F10E95B;
	Fri, 19 Sep 2025 08:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bl7dJ8m9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFC110E95B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758268988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5IYcmEH8AAZ8jNobGJKX3ZiK5xqPnh6QO1e0X7qLPw=;
 b=bl7dJ8m9V1AXq7jJGxlIeb3WU8II30crunhoojS2mvKjBJ7+HoJx97zBXLbN+fr1BwSO2p
 NyZhFMwCUVFZbBpL/Uy3O9aq1bvU+F7yL5YIFMZUmXrCLZwBBkeoP7j/XC+VrUID5fsUTR
 aOdR5NoD2Q0QEfpq+oNTQeW8pPGnask=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-kLz8lMRKP-WIXOWBrbYRnA-1; Fri, 19 Sep 2025 04:03:07 -0400
X-MC-Unique: kLz8lMRKP-WIXOWBrbYRnA-1
X-Mimecast-MFC-AGG-ID: kLz8lMRKP-WIXOWBrbYRnA_1758268986
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45f2c1556aeso6226535e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 01:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268986; x=1758873786;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A5IYcmEH8AAZ8jNobGJKX3ZiK5xqPnh6QO1e0X7qLPw=;
 b=fm2sLywM5p8oDhAgO3bWC07Rl7lJr0bpB/h0Xv2SbaeKZfevnv/lPoE9h2O9t4cP3B
 R7g8nehIBjbw84xf/FwvMW9TCPM66in2w608TKvczpnB5fQfGhsK7DsyU0JEM8lNHkcx
 MfvTgW5kfRaABYhPyuIpB97gzWlFFQuCo5GqzvvGzNtOx/QVd1DuLURaMlmMhUuq95aV
 /26Skevaj0ZW2S6FthVukKaQhzmHH/Q6m3aykFH+5jBCdHgWPlANMfh+Xcc+Nh4Uj3Pa
 eBrn0FoV3+X1Cd6ujG9nQirv9vMKBoHgUxtaVn2/SJyqTyDYPRrJrPPk9DOTAo59TMq9
 JQFg==
X-Gm-Message-State: AOJu0YwBViz1XnnRqHmBYU1CaHtCwkPu34RUqm8HyaZmd5u84D+sxkzA
 q+WT0ayfIqeAeiPokZe5xMf1ZCz+fcOZoeCtuTDSatbwRBw5aaAqX+1uAi4VM7/d1Wf2Hm4++i4
 aDsCemzswogv1+k/IKzczZTeuEn6glAAUuv0HLRzhNww64ICHr3BMtTmfgMX6IUmxV4rqtQ==
X-Gm-Gg: ASbGncurSew2i0SZ+n1qPliK6OENSsM7pixVv5+qKepi7k+YpPoRDHnfiZm9in6cEca
 R62YFiDmCwoH1iUckIuMVGZ33MuRXPc77CL5fsdEDVnYExSYH63FQ0NbGILrqT7BLl/ecOEnwID
 sdv+oPoMAnlEMW3YqnhxyRasj30eHklBIyCH9KWRASXQkLnw0gu+4OpcMX5SXfT7tgDWdvJSGox
 QeRvzI4bTi7GL7yv9wV3d02PYxJ5RHpj3+F6oN5l+Saw4UITH8HX5+giusZwd+D+Zjj4IYrOrj6
 8zPY8FfyB7fXsd/apD9L2/cxWkeaSj/QqI8xq9vGMVz7iC8ir2Sa3HonexTMh41iP7W7xOL4Z3r
 AmUQo
X-Received: by 2002:a05:600c:190d:b0:45d:e4ff:b642 with SMTP id
 5b1f17b1804b1-467eb8e1bb4mr17166435e9.25.1758268986206; 
 Fri, 19 Sep 2025 01:03:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHisDyTS0xQRINz6+PLNPZZZ6AaUahV3qBtcp9YFY1L6EEnxxRT1wEDvqrjdlgS3rxnOcOUVg==
X-Received: by 2002:a05:600c:190d:b0:45d:e4ff:b642 with SMTP id
 5b1f17b1804b1-467eb8e1bb4mr17166035e9.25.1758268985793; 
 Fri, 19 Sep 2025 01:03:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f6695a9dsm76865135e9.24.2025.09.19.01.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 01:03:05 -0700 (PDT)
Message-ID: <5ee09cdb-1d99-486f-a843-c88835f6138e@redhat.com>
Date: Fri, 19 Sep 2025 10:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] drm/ast: Move Gen7 device initialization into
 separate helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-12-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-12-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kwcQ0ZMzvADk3gSngLEghajv-KDM1ybrHKO3_-qfxAI_1758268986
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
> Split off device initialization for Gen7 hardware into the helpers
> ast_2600_device_create() and ast_2600_detect_wide_screen(). The new
> functions are duplicates form their counterparts in ast_main.c, but
> stripped from most non-Gen7 support.
> 
> Simplifies maintenance as the driver's number of supported hardware
> generations grows.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2600.c | 63 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.c  |  4 +++
>   drivers/gpu/drm/ast/ast_drv.h  |  7 ++++
>   3 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
> index 8d75a47444f5..30490c473797 100644
> --- a/drivers/gpu/drm/ast/ast_2600.c
> +++ b/drivers/gpu/drm/ast/ast_2600.c
> @@ -26,6 +26,10 @@
>    * Authors: Dave Airlie <airlied@redhat.com>
>    */
>   
> +#include <linux/pci.h>
> +
> +#include <drm/drm_drv.h>
> +
>   #include "ast_drv.h"
>   #include "ast_post.h"
>   
> @@ -42,3 +46,62 @@ int ast_2600_post(struct ast_device *ast)
>   
>   	return 0;
>   }
> +
> +/*
> + * Device initialization
> + */
> +
> +static void ast_2600_detect_widescreen(struct ast_device *ast)
> +{
> +	ast->support_wsxga_p = true;
> +	ast->support_fullhd = true;
> +	if (__ast_2100_detect_wuxga(ast))
> +		ast->support_wuxga = true;
> +}
> +
> +struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
> +					  const struct drm_driver *drv,
> +					  enum ast_chip chip,
> +					  enum ast_config_mode config_mode,
> +					  void __iomem *regs,
> +					  void __iomem *ioregs,
> +					  bool need_post)
> +{
> +	struct drm_device *dev;
> +	struct ast_device *ast;
> +	int ret;
> +
> +	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
> +	if (IS_ERR(ast))
> +		return ERR_CAST(ast);
> +	dev = &ast->base;
> +
> +	ast_device_init(ast, chip, config_mode, regs, ioregs);
> +
> +	ast_2300_detect_tx_chip(ast);
> +
> +	switch (ast->tx_chip) {
> +	case AST_TX_ASTDP:
> +		ret = ast_post_gpu(ast);
> +		break;
> +	default:
> +		ret = 0;
> +		if (need_post)
> +			ret = ast_post_gpu(ast);
> +		break;
> +	}
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = ast_mm_init(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ast_2600_detect_widescreen(ast);
> +
> +	ret = ast_mode_config_init(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return dev;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 2f9a4c969a17..5ac1d32cfe69 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -406,6 +406,10 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		drm = ast_2500_device_create(pdev, &ast_driver, chip, config_mode,
>   					     regs, ioregs, need_post);
>   		break;
> +	case 7:
> +		drm = ast_2600_device_create(pdev, &ast_driver, chip, config_mode,
> +					     regs, ioregs, need_post);
> +		break;
>   	default:
>   		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
>   					need_post);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index fef9b9e6cb42..a64eadc3b50f 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -490,6 +490,13 @@ struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
>   
>   /* ast_2600.c */
>   int ast_2600_post(struct ast_device *ast);
> +struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
> +					  const struct drm_driver *drv,
> +					  enum ast_chip chip,
> +					  enum ast_config_mode config_mode,
> +					  void __iomem *regs,
> +					  void __iomem *ioregs,
> +					  bool need_post);
>   
>   /* ast post */
>   int ast_post_gpu(struct ast_device *ast);

