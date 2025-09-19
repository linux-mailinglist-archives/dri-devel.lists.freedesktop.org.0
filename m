Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0457B88524
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 10:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A48710E958;
	Fri, 19 Sep 2025 08:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QdJ7YMsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC83010E958
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758268975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DASoL5D69Cmn05NLQrMg5yThs0LhWxlKMf4rK8QfG2Q=;
 b=QdJ7YMsxJiHE51XQEP00yWgVPCON1iztKdiaGYrDVaNZj3gsjj8EQ+onzsX/uqc00xjBPQ
 POymLwjskWMrLvjeJbWbb0DCMXEAUr0aXwwYSnrBVJpOVLYtPgrjRozNcQSioVmWg2J/sK
 drF2AlrHSzFLpq1Q7half1TlEgu4q2g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-d_sC6WE8Mu2lBzse8-_2-w-1; Fri, 19 Sep 2025 04:02:53 -0400
X-MC-Unique: d_sC6WE8Mu2lBzse8-_2-w-1
X-Mimecast-MFC-AGG-ID: d_sC6WE8Mu2lBzse8-_2-w_1758268973
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45deddf34b9so18171595e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 01:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268972; x=1758873772;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DASoL5D69Cmn05NLQrMg5yThs0LhWxlKMf4rK8QfG2Q=;
 b=su1XrWBniFRpOb8NRMGrImiWgnnyM7J14rhPCTEGMF1P6iFlgbWFol5WBNX1rCOQBO
 Gl4oDV5Bprx8yKPKeGobDrHlb5ay9qmknTBS2NN02NYx3gqjxCZRoeMqmu0jHfUcki09
 cSF44D1BcfgGBzAbiQZuqOgVovKyaWr72e4wzSyFTzXDxqTdhEwCOIgRtsFAiOL+h0+K
 j+Rv8qg/JS0DEkKWjICeLKqZcLL4FQRGhOaH5UJyx4ls4t50nYYYFCoo1OjCbgXS5JMH
 zol3WImZ6L+njy0qk5o8a0b/V85EB1dOvQIXQR0+/RaZkqebrdsVtv4MAgUXrHADvvDA
 s+ug==
X-Gm-Message-State: AOJu0YxCg8K+dEgyRN5gSalsXtVgPWleMVtEJ3vMupxu8oNU2T4Dz9QI
 si7KucRjwLqKsxo5QTleMmkVWt2q3AdPhd1qWwAndRx2sBgOSMeBzIcaxe28IbSOJt1FiQFtyxK
 Gw/1d+OeMZJt7Jq9O3zhFr7h6mUY4eptwjmQhcE6Eq1aARuLz2dmYH2DcdSyRLgdidviLbis337
 86ew==
X-Gm-Gg: ASbGncsCqMKIZwfIxtg8/pVytMftM0HFpXDbsP91MSPCl1OM/m0+tismzNoEGRft+/b
 n1F3nlsKT87J694xFB2vbkI9gvG8yLh7YzAG2RT9OdxEZlShCj4s69cUb2cbbtyRCstl4rx/Rle
 1Ai1IzNnkvBMT5QxRYl+byKWp/lYqR1fJy9/0mLpFvbE82ZFWbMQY4TbsNm1tEVbqmic4rxwtE3
 N0renkxQZTvymO6HfnN3KHqUjOleF0iGKEQa5hw+7GLMRQGUk9QcMDd3ZQWXKRuKz7XFdpNGMd1
 Zf1kdygQVGUinKjUO2n3w2cKOlGugAPgmMbo5Vh9uugTO92/04e4SLTTy7HaNkWuZM+LHMGIEeM
 XSY+b
X-Received: by 2002:a05:600c:1c27:b0:45f:2b0e:b835 with SMTP id
 5b1f17b1804b1-46706e7feeemr26638585e9.10.1758268972371; 
 Fri, 19 Sep 2025 01:02:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQTDrjjLTo1hfOsgmUUlddHcRuoKWr204MEjT3RvCOuHLu92c/8uDKVK7WPzdy1Z2TDZYezg==
X-Received: by 2002:a05:600c:1c27:b0:45f:2b0e:b835 with SMTP id
 5b1f17b1804b1-46706e7feeemr26638355e9.10.1758268971953; 
 Fri, 19 Sep 2025 01:02:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-462c17c9347sm47452755e9.0.2025.09.19.01.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 01:02:51 -0700 (PDT)
Message-ID: <b9b2a3ff-872d-4b73-8a7f-57900379f731@redhat.com>
Date: Fri, 19 Sep 2025 10:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] drm/ast: Move Gen6 device initialization into
 separate helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-11-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-11-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hzmiLPyTNVR3h2-YE2x-lxccB4zIm88T1qj7WCxeTLs_1758268973
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
> Split off device initialization for Gen6 hardware into the helpers
> ast_2500_device_create() and ast_2500_detect_wide_screen(). The new
> functions are duplicates form their counterparts in ast_main.c, but
> stripped from most non-Gen6 support.
> 
> Simplifies maintenance as the driver's number of supported hardware
> generations grows.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2500.c | 66 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.c  |  4 +++
>   drivers/gpu/drm/ast/ast_drv.h  |  7 ++++
>   3 files changed, 77 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
> index b12fec161f2b..af6021cc531d 100644
> --- a/drivers/gpu/drm/ast/ast_2500.c
> +++ b/drivers/gpu/drm/ast/ast_2500.c
> @@ -27,7 +27,9 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/pci.h>
>   
> +#include <drm/drm_drv.h>
>   #include <drm/drm_print.h>
>   
>   #include "ast_drv.h"
> @@ -601,3 +603,67 @@ const struct ast_vbios_dclk_info ast_2500_dclk_table[] = {
>   	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
>   	{0x44, 0x20, 0x43},			/* 1a: VCLK118_25	*/
>   };
> +
> +/*
> + * Device initialization
> + */
> +
> +static void ast_2500_detect_widescreen(struct ast_device *ast)
> +{
> +	if (__ast_2100_detect_wsxga_p(ast))
> +		ast->support_wsxga_p = true;
> +	else if (ast->chip == AST2510)
> +		ast->support_wsxga_p = true;
> +	if (ast->support_wsxga_p)
> +		ast->support_fullhd = true;
> +	if (__ast_2100_detect_wuxga(ast))
> +		ast->support_wuxga = true;
> +}
> +
> +struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
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
> +	/* map reserved buffer */
> +	ast->dp501_fw_buf = NULL;
> +	if (ast->vram_size < pci_resource_len(pdev, 0)) {
> +		ast->dp501_fw_buf = pci_iomap_range(pdev, 0, ast->vram_size, 0);
> +		if (!ast->dp501_fw_buf)
> +			drm_info(dev, "failed to map reserved buffer!\n");
> +	}
> +
> +	ast_2500_detect_widescreen(ast);
> +
> +	ret = ast_mode_config_init(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return dev;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 475a8d5f58cd..2f9a4c969a17 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -402,6 +402,10 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		drm = ast_2400_device_create(pdev, &ast_driver, chip, config_mode,
>   					     regs, ioregs, need_post);
>   		break;
> +	case 6:
> +		drm = ast_2500_device_create(pdev, &ast_driver, chip, config_mode,
> +					     regs, ioregs, need_post);
> +		break;
>   	default:
>   		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
>   					need_post);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index c9744b3efda0..fef9b9e6cb42 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -480,6 +480,13 @@ struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
>   void ast_2500_patch_ahb(void __iomem *regs);
>   int ast_2500_post(struct ast_device *ast);
>   extern const struct ast_vbios_dclk_info ast_2500_dclk_table[];
> +struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
> +					  const struct drm_driver *drv,
> +					  enum ast_chip chip,
> +					  enum ast_config_mode config_mode,
> +					  void __iomem *regs,
> +					  void __iomem *ioregs,
> +					  bool need_post);
>   
>   /* ast_2600.c */
>   int ast_2600_post(struct ast_device *ast);

