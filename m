Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA1B8851E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 10:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D84A10E959;
	Fri, 19 Sep 2025 08:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DLuNEOcs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E4110E959
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758268942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gesnYn9M/jkkhG+t+5dROEFiNaUG11omTt5QgL66/RA=;
 b=DLuNEOcsiIcwS+58M5faJHPvziB6C18u9AgoMdcbrtvuLonAA4ZzAovsNq/cVy08FJTRQa
 mmSvKNWVqpvDU+79kTR1chEcEQ2pO0yjPFSOUxO/3HP5smsQ3LpFH4ZrkiACwhQKaV9O10
 IerXiMDg8EWPn0241rn/D5WMDOyvAes=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-Dh__loV9OuGGTtkQm0T0ZQ-1; Fri, 19 Sep 2025 04:02:21 -0400
X-MC-Unique: Dh__loV9OuGGTtkQm0T0ZQ-1
X-Mimecast-MFC-AGG-ID: Dh__loV9OuGGTtkQm0T0ZQ_1758268940
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3efe4fcc9ccso245406f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 01:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758268940; x=1758873740;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gesnYn9M/jkkhG+t+5dROEFiNaUG11omTt5QgL66/RA=;
 b=Ru6YnfRlqsKEl1HM58StOzzs5AjVSDOb53AeSBY08UR+MJcI7AVUpC9WmYmsHSUb5I
 NaaQWQL9OOYxGwMTClqDRdn1ey1DMWj9vKEGjK/PLdEI2QPhywZ+W9y420LL7PkRuPCC
 DRBsCj/GEoCLt2WS4YalphJXUK8rtK7B3WX8KKnwBIjQAtQnn7u8QTMFLD+oWRL80aDF
 JV3YDPVavupgeUJBNGOWoFMgDj9NWmdAK4rBK6LQKzn0zST4FNaVyK4WDk42TPdMcwo3
 j2G1A1CW8+snd4Cok40kShnjE8WZzX1OjB37zKlspV8swR+Ryi2PuB33765Nn+tgLcw4
 hCtw==
X-Gm-Message-State: AOJu0Yw3lOLMQ75r2EtqWBpfJy1uknwUqWRQy72mIMvzExDDTPDdBZYl
 eK0QkW+UafoM/jTVfftCwMWSWUgDOMfhQM8UZMZi7wYfq9imzu6Wn/AnuOMgRtIdSpGwsJHWWBP
 Hb/gXYhnwc+OImykQDA0WjoAIKdOZSioOxaaZsVct/l1CcVzovXaiDPnvQAyCih1QToZsEw==
X-Gm-Gg: ASbGncsQ2oE+h/mTAKWc+aoI/B/+1F+g+RL8B3Y+hgN8XlIDFRU9OEFjqROsSbOUsiA
 wFsZXvEShq9D6yhb9Byd3OVue1teqtAp82PghnjXOICM3xDZjLsK0pl5o97FDJ0a/QAnTB5/dMf
 /a+TeabLdS+VktS6mb9Exavcqyawh5JmGwHB5dsapEpz8epnm5FlV62raLH4X/BbluTBnDqx05z
 0g9QyQjNhlzk7V2bXnFCOBdD7qrFxZDWBtmhAchJAdEmdNZjk+cmJ8LuVcBrIlZeV6nBfBhOjEU
 JHUud1pDZ4C/DNjdQqbAeBnnlIo2oq5P5CehY0ddQ6EopdGdHoGDUBf+wmXwPA/vk6E0Hg8NHsf
 P/5mr
X-Received: by 2002:a05:6000:2406:b0:3e9:b208:f2d2 with SMTP id
 ffacd0b85a97d-3ee8585f58bmr1597650f8f.50.1758268939751; 
 Fri, 19 Sep 2025 01:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/En5LjGf3Hu46yfvfXDT29nJgY0i/4QzpGDDEPrRFHWBSdCJ6KFTp8ojOLp3TA1HuGb93Zg==
X-Received: by 2002:a05:6000:2406:b0:3e9:b208:f2d2 with SMTP id
 ffacd0b85a97d-3ee8585f58bmr1597621f8f.50.1758268939315; 
 Fri, 19 Sep 2025 01:02:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-461383b7b9csm114362445e9.2.2025.09.19.01.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 01:02:18 -0700 (PDT)
Message-ID: <28935501-bcc0-4ab8-8dbe-df8dd75f074a@redhat.com>
Date: Fri, 19 Sep 2025 10:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] drm/ast: Move Gen4 device initialization into
 separate helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250916153239.308027-1-tzimmermann@suse.de>
 <20250916153239.308027-9-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250916153239.308027-9-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MXbrTEmuns7xTUf3gmGXTQBaTKCQlamq8pNU1nUnz0U_1758268940
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
> Split off device initialization for Gen4 hardware into the helpers
> ast_2300_device_create() and ast_2300_detect_wide_screen(). The new
> functions are duplicates form their counterparts in ast_main.c, but
> stripped from most non-Gen4 support.
> 
> Simplifies maintenance as the driver's number of supported hardware
> generations grows.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2300.c | 62 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.c  |  4 +++
>   drivers/gpu/drm/ast/ast_drv.h  |  7 ++++
>   3 files changed, 73 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2300.c b/drivers/gpu/drm/ast/ast_2300.c
> index 68d269ef9b47..79fa660cd34e 100644
> --- a/drivers/gpu/drm/ast/ast_2300.c
> +++ b/drivers/gpu/drm/ast/ast_2300.c
> @@ -27,8 +27,10 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/pci.h>
>   #include <linux/sizes.h>
>   
> +#include <drm/drm_drv.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
>   
> @@ -1394,3 +1396,63 @@ void ast_2300_detect_tx_chip(struct ast_device *ast)
>   
>   	__ast_device_set_tx_chip(ast, tx_chip);
>   }
> +
> +static void ast_2300_detect_widescreen(struct ast_device *ast)
> +{
> +	if (__ast_2100_detect_wsxga_p(ast))
> +		ast->support_wsxga_p = true;
> +	else if (ast->chip == AST1300)
> +		ast->support_wsxga_p = true;
> +	if (ast->support_wsxga_p)
> +		ast->support_fullhd = true;
> +	if (__ast_2100_detect_wuxga(ast))
> +		ast->support_wuxga = true;
> +}
> +
> +struct drm_device *ast_2300_device_create(struct pci_dev *pdev,
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
> +	ast_2300_detect_widescreen(ast);
> +
> +	ret = ast_mode_config_init(ast);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return dev;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index caf41c31cc9d..8d50abbd1c3c 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -394,6 +394,10 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		drm = ast_2200_device_create(pdev, &ast_driver, chip, config_mode,
>   					     regs, ioregs, need_post);
>   		break;
> +	case 4:
> +		drm = ast_2300_device_create(pdev, &ast_driver, chip, config_mode,
> +					     regs, ioregs, need_post);
> +		break;
>   	default:
>   		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
>   					need_post);
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 8a27835fd09c..6924f8a87e2c 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -459,6 +459,13 @@ struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
>   /* ast_2300.c */
>   int ast_2300_post(struct ast_device *ast);
>   void ast_2300_detect_tx_chip(struct ast_device *ast);
> +struct drm_device *ast_2300_device_create(struct pci_dev *pdev,
> +					  const struct drm_driver *drv,
> +					  enum ast_chip chip,
> +					  enum ast_config_mode config_mode,
> +					  void __iomem *regs,
> +					  void __iomem *ioregs,
> +					  bool need_post);
>   
>   /* ast_2500.c */
>   void ast_2500_patch_ahb(void __iomem *regs);

