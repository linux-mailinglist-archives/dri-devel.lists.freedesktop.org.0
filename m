Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE5B8851B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 10:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C58810E955;
	Fri, 19 Sep 2025 08:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FbFDCmxS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9A410E955
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758268933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NegQ9tsti5zc+njHHaxm8EPZGJCAew3rhHn6IXksuEU=;
 b=FbFDCmxS5Zx74jw4Oc4QiZbysLuPSJ6EHQyOzWlR8IH7MW9DgV7dnde2wO0tsoKzjZeTQM
 bnIZacEmtDrRen7dobFDmiVUJaDqmVplNfNJFqBM2ZHq0nloDiSRdoiN7ksJ3tKB/qIIMq
 YLcgG4L65XIxxIFY++x+OEwaHgADJsg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-dunOjGIUOpmibJk3gw57aA-1; Fri, 19 Sep 2025 04:02:11 -0400
X-MC-Unique: dunOjGIUOpmibJk3gw57aA-1
X-Mimecast-MFC-AGG-ID: dunOjGIUOpmibJk3gw57aA_1758268930
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45df7e734e0so21233185e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 01:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268930; x=1758873730;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NegQ9tsti5zc+njHHaxm8EPZGJCAew3rhHn6IXksuEU=;
 b=bCvMCMh/Lk670FIULiXEJopLZ7hVr+q2R8GjoJoIia+RmLERr6CJ78RCdXnWlyQMQu
 /IHjR30ABGMTT+evsCjLMbglx7de7w//ljBo+m//1eO+qXwJfT+pkNjGEn5r+vJYCTRC
 8aE4zc+MkC1xeZzYApwzcE5SBLxDuClIjPxRAEZ7ldj5PUlbl9vw9d87hXRmAmOqiGM0
 TZZe0qlP1QZpTWMkujZMlGcfGmBE7neM59sG8Ws5Qz0d5KjfywkooqjlOvRNOO8Jwxil
 x9fQBoDdEFkSIoQPgAt1eO1DjMMnbAfeYBQ8rL5jDEKyfZpmjFsixjbhFIKquDHkkEuc
 0LbA==
X-Gm-Message-State: AOJu0Yzqx9Tzd6/N4tiaIcVEx7hLm4G5fRdEK4MYFv++beMZZ2RceJ46
 xQ65wIJoeG9GokbROxs1PYvzWTMcMy2ix5unugQ+C3YDb3dqzEYFifg7/JkenOWRfA7pPIuTK9H
 60xwd8Cf9d7xm/w+0aP3mFskBJia0UMx9hiAMjbTn1AodYVQBP8EJ8zUk2wj6Dni8sdwbKcMXly
 dX8g==
X-Gm-Gg: ASbGncv7h3x2CnRz8OuaRLt0cblE4+FyQac83UoFMG5eajRpa4EuRaFL39RgGEU9pU+
 QlACA1/lkaj3/kTfRVRF9nigz6UJtWtyHPZWxPEeEFhH6whZ+MivE0Ygh7pbBzuqsi0jDKcl79h
 4FNLRCHAUPAIZhIXIfTyW6PuC+dQiLjeNBsKurDgw4QqlQmi0DpjiZlrb3O6pbZn2PQbxj+bVDr
 Rkr6Iv4oS35zc6J01Aj9SxlbEa0eanp0faY8c3nieFQx0DrM+A7/QQ+X9CpmV41uU8dZHtmTT52
 6ITLrVrL0EMUAG3RZYVRS4BY+Y0aL9C4cvX2wgB6Qi699nSOgTYuyoyrzbwfPZ7TKaJTwaFSEP0
 zAnu/
X-Received: by 2002:a05:600c:4ed1:b0:45d:dbf4:8880 with SMTP id
 5b1f17b1804b1-467eb048bbcmr14454865e9.27.1758268929668; 
 Fri, 19 Sep 2025 01:02:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1+4K9JTRq7dpoM/7wFqftDpY92rQnX+EbHabEuHv+qYWelkovYP8mHneEymdiI1xbNcGFHg==
X-Received: by 2002:a05:600c:4ed1:b0:45d:dbf4:8880 with SMTP id
 5b1f17b1804b1-467eb048bbcmr14454565e9.27.1758268929207; 
 Fri, 19 Sep 2025 01:02:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613f3c69d5sm114983745e9.24.2025.09.19.01.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 01:02:08 -0700 (PDT)
Message-ID: <10e960f8-8bd1-41fe-86ce-697fe5019e9e@redhat.com>
Date: Fri, 19 Sep 2025 10:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/ast: Move Gen3 device initialization into
 separate helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L23PRlEntDzzdZaVYRxfy-HhA3u7GfzzI_QjXA5KPr0_1758268930
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
> Split off device initialization for Gen3 hardware into the helpers
> ast_2200_device_create() and ast_2200_detect_wide_screen(). The new
> functions are duplicates form their counterparts in ast_main.c, but
> stripped from most non-Gen3 support.
> 
> Simplifies maintenance as the driver's number of supported hardware
> generations grows.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/Makefile   |  1 +
>   drivers/gpu/drm/ast/ast_2200.c | 86 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.c  |  4 ++
>   drivers/gpu/drm/ast/ast_drv.h  |  9 ++++
>   4 files changed, 100 insertions(+)
>   create mode 100644 drivers/gpu/drm/ast/ast_2200.c
> 
> diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
> index 2547613155da..a7a13b6d526e 100644
> --- a/drivers/gpu/drm/ast/Makefile
> +++ b/drivers/gpu/drm/ast/Makefile
> @@ -6,6 +6,7 @@
>   ast-y := \
>   	ast_2000.o \
>   	ast_2100.o \
> +	ast_2200.o \
>   	ast_2300.o \
>   	ast_2500.o \
>   	ast_2600.o \
> diff --git a/drivers/gpu/drm/ast/ast_2200.c b/drivers/gpu/drm/ast/ast_2200.c
> new file mode 100644
> index 000000000000..1952e14bab8c
> --- /dev/null
> +++ b/drivers/gpu/drm/ast/ast_2200.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2012 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portions
> + * of the Software.
> + */
> +/*
> + * Authors: Dave Airlie <airlied@redhat.com>
> + */
> +
> +#include <linux/pci.h>
> +
> +#include <drm/drm_drv.h>
> +
> +#include "ast_drv.h"
> +
> +static void ast_2200_detect_widescreen(struct ast_device *ast)
> +{
> +	if (__ast_2100_detect_wsxga_p(ast))
> +		ast->support_wsxga_p = true;
> +	if (ast->support_wsxga_p) {
> +		if (ast->chip == AST2200)
> +			ast->support_fullhd = true;
> +	}
> +	if (__ast_2100_detect_wuxga(ast))
> +		ast->support_wuxga = true;
> +}
> +
> +struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
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
> +	ast_2000_detect_tx_chip(ast, need_post);
> +
> +	if (need_post) {
> +		ret = ast_post_gpu(ast);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +	ret = ast_mm_init(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ast_2200_detect_widescreen(ast);
> +
> +	ret = ast_mode_config_init(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return dev;
> +}
> +
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index bcf0b318b495..caf41c31cc9d 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -390,6 +390,10 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		drm = ast_2100_device_create(pdev, &ast_driver, chip, config_mode,
>   					     regs, ioregs, need_post);
>   		break;
> +	case 3:
> +		drm = ast_2200_device_create(pdev, &ast_driver, chip, config_mode,
> +					     regs, ioregs, need_post);
> +		break;
>   	default:
>   		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
>   					need_post);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 8f52ac3b0f45..8a27835fd09c 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -447,6 +447,15 @@ struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
>   					  void __iomem *ioregs,
>   					  bool need_post);
>   
> +/* ast_2200.c */
> +struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
> +					  const struct drm_driver *drv,
> +					  enum ast_chip chip,
> +					  enum ast_config_mode config_mode,
> +					  void __iomem *regs,
> +					  void __iomem *ioregs,
> +					  bool need_post);
> +
>   /* ast_2300.c */
>   int ast_2300_post(struct ast_device *ast);
>   void ast_2300_detect_tx_chip(struct ast_device *ast);

