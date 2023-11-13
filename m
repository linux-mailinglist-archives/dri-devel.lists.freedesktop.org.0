Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4A7E9FE7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 16:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1E010E3AA;
	Mon, 13 Nov 2023 15:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B03110E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699889107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dWS1wGvjvzcTvk8xbKGanmYCheahF3T4ukmRpifsuzg=;
 b=EowKOWh4gpu8S8o3OUGh7ZZaq6xxf8pnPnp4BY/rW5fNOgLLHKyKyD91B9h3CFaZy4b4D1
 /SV7bpm8vsHDt6v7GH7WowQyYBMNwAyxxBBvp3oJwoBGABl39natIQgGRfNyiVUZte/SKA
 YkibVJAHH0Nf9lLFjPWwYqE+qj73d2Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-rkDRz_b9O5G90poR7SYWIA-1; Mon, 13 Nov 2023 10:25:06 -0500
X-MC-Unique: rkDRz_b9O5G90poR7SYWIA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4083717431eso31322835e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 07:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699889105; x=1700493905;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dWS1wGvjvzcTvk8xbKGanmYCheahF3T4ukmRpifsuzg=;
 b=ACwleOS3vKnXQuVXSzsFGFlY2IhG5LOQD2CE5DsL1KMfVBSZyxo3myZj8yWc+acd8i
 /p4sKIGmReBgusbZYPbsRZBYekzkYSc/SHs1wYPBEJ/6aHm9lV0UVoLVjHvGo2/DoL1f
 A62zX3LJyb6a2FdI6ZQ4A5puo7+BAXHlgKdcFHcomINAVzF8A/qzXnFSZ9sFdylv0ZTg
 q9Ub6IRDQ+ukrYFxTSCUyvaDbGW/8Onm+Qyk+j7IXLWoy2qsNLa6MyjdvZcm2C3mptgi
 KloPerACrvLbrgEK9IIwAJmbBAEXzLX+h4zwn6j1QFvvpMmDKbtHCAT7IZhHLktHp1C3
 R88Q==
X-Gm-Message-State: AOJu0YxiLb5yXwYPUQvInf8f2BpcQjE/vlHaDN3nsmUSZnao6Uu/oPDg
 QpQwChzQHXyQ/YmCeUyDSGddPWL0qMTlgG2B4T5p+mAjLMRQ3oxVtJL08f+ueP+aFR4pwHIvl23
 RVf4Lrk06QLglJotedzw65pW+SOs+
X-Received: by 2002:a05:600c:154c:b0:405:359e:ee43 with SMTP id
 f12-20020a05600c154c00b00405359eee43mr5777628wmg.1.1699889104738; 
 Mon, 13 Nov 2023 07:25:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuajFHuJi8llzzS2dkeZOwMj9RNdnaNE5KsYQmKtNnjvOYS1GNMN+AvT07o6MV5nth5mXU7Q==
X-Received: by 2002:a05:600c:154c:b0:405:359e:ee43 with SMTP id
 f12-20020a05600c154c00b00405359eee43mr5777617wmg.1.1699889104329; 
 Mon, 13 Nov 2023 07:25:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0040849ce7116sm14425089wmb.43.2023.11.13.07.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 07:25:03 -0800 (PST)
Message-ID: <207847ed-4a12-4926-9ae4-a90cd6bb2f65@redhat.com>
Date: Mon, 13 Nov 2023 16:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] drm/ast: Detect ast device type and config mode
 without ast device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 airlied@gmail.com
References: <20231113091439.17181-1-tzimmermann@suse.de>
 <20231113091439.17181-10-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20231113091439.17181-10-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/11/2023 09:50, Thomas Zimmermann wrote:
> Return the ast chip and config in the detection function's parameters
> instead of storing them directly in the ast device instance.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 104 ++++++++++++++++++---------------
>   1 file changed, 57 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index f100df8d74f71..331a9a861153b 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -76,25 +76,27 @@ static void ast_open_key(void __iomem *ioregs)
>   	__ast_write8_i(ioregs, AST_IO_VGACRI, 0x80, AST_IO_VGACR80_PASSWORD);
>   }
>   
> -static int ast_device_config_init(struct ast_device *ast)
> +static int ast_detect_chip(struct pci_dev *pdev,
> +			   void __iomem *regs, void __iomem *ioregs,
> +			   enum ast_chip *chip_out,
> +			   enum ast_config_mode *config_mode_out)
>   {
> -	struct drm_device *dev = &ast->base;
> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
> -	struct device_node *np = dev->dev->of_node;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	enum ast_config_mode config_mode = ast_use_defaults;
>   	uint32_t scu_rev = 0xffffffff;
> +	enum ast_chip chip;
>   	u32 data;
> -	u8 jregd0, jregd1;
> +	u8 vgacrd0, vgacrd1;
>   
>   	/*
>   	 * Find configuration mode and read SCU revision
>   	 */
>   
> -	ast->config_mode = ast_use_defaults;
> -
>   	/* Check if we have device-tree properties */
>   	if (np && !of_property_read_u32(np, "aspeed,scu-revision-id", &data)) {
>   		/* We do, disable P2A access */
> -		ast->config_mode = ast_use_dt;
> +		config_mode = ast_use_dt;
>   		scu_rev = data;
>   	} else if (pdev->device == PCI_CHIP_AST2000) { // Not all families have a P2A bridge
>   		/*
> @@ -102,9 +104,9 @@ static int ast_device_config_init(struct ast_device *ast)
>   		 * is disabled. We force using P2A if VGA only mode bit
>   		 * is set D[7]
>   		 */
> -		jregd0 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
> -		jregd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
> -		if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
> +		vgacrd0 = __ast_read8_i(ioregs, AST_IO_VGACRI, 0xd0);
> +		vgacrd1 = __ast_read8_i(ioregs, AST_IO_VGACRI, 0xd1);
> +		if (!(vgacrd0 & 0x80) || !(vgacrd1 & 0x10)) {
>   
>   			/*
>   			 * We have a P2A bridge and it is enabled.
> @@ -112,32 +114,32 @@ static int ast_device_config_init(struct ast_device *ast)
>   
>   			/* Patch AST2500/AST2510 */
>   			if ((pdev->revision & 0xf0) == 0x40) {
> -				if (!(jregd0 & AST_VRAM_INIT_STATUS_MASK))
> -					ast_patch_ahb_2500(ast->regs);
> +				if (!(vgacrd0 & AST_VRAM_INIT_STATUS_MASK))
> +					ast_patch_ahb_2500(regs);
>   			}
>   
>   			/* Double check that it's actually working */
> -			data = ast_read32(ast, 0xf004);
> +			data = __ast_read32(regs, 0xf004);
>   			if ((data != 0xffffffff) && (data != 0x00)) {
> -				ast->config_mode = ast_use_p2a;
> +				config_mode = ast_use_p2a;
>   
>   				/* Read SCU7c (silicon revision register) */
> -				ast_write32(ast, 0xf004, 0x1e6e0000);
> -				ast_write32(ast, 0xf000, 0x1);
> -				scu_rev = ast_read32(ast, 0x1207c);
> +				__ast_write32(regs, 0xf004, 0x1e6e0000);
> +				__ast_write32(regs, 0xf000, 0x1);
> +				scu_rev = __ast_read32(regs, 0x1207c);
>   			}
>   		}
>   	}
>   
> -	switch (ast->config_mode) {
> +	switch (config_mode) {
>   	case ast_use_defaults:
> -		drm_info(dev, "Using default configuration\n");
> +		dev_info(dev, "Using default configuration\n");
>   		break;
>   	case ast_use_dt:
> -		drm_info(dev, "Using device-tree for configuration\n");
> +		dev_info(dev, "Using device-tree for configuration\n");
>   		break;
>   	case ast_use_p2a:
> -		drm_info(dev, "Using P2A bridge for configuration\n");
> +		dev_info(dev, "Using P2A bridge for configuration\n");
>   		break;
>   	}
>   
> @@ -146,63 +148,66 @@ static int ast_device_config_init(struct ast_device *ast)
>   	 */
>   
>   	if (pdev->revision >= 0x50) {
> -		ast->chip = AST2600;
> -		drm_info(dev, "AST 2600 detected\n");
> +		chip = AST2600;
> +		dev_info(dev, "AST 2600 detected\n");

Adding a macro to set chip and printk could be handy here:

something like

#define set_chip(version) \
	chip = version; \
	dev_info(dev, "%s detected\n", #version); \


and then set_chip(AST2510)


>   	} else if (pdev->revision >= 0x40) {
>   		switch (scu_rev & 0x300) {
>   		case 0x0100:
> -			ast->chip = AST2510;
> -			drm_info(dev, "AST 2510 detected\n");
> +			chip = AST2510;
> +			dev_info(dev, "AST 2510 detected\n");
>   			break;
>   		default:
> -			ast->chip = AST2500;
> -			drm_info(dev, "AST 2500 detected\n");
> +			chip = AST2500;
> +			dev_info(dev, "AST 2500 detected\n");

Should the default case have break ?
This one has no break, but later in this function they do. Maybe we can 
have more consistency ?


>   		}
>   	} else if (pdev->revision >= 0x30) {
>   		switch (scu_rev & 0x300) {
>   		case 0x0100:
> -			ast->chip = AST1400;
> -			drm_info(dev, "AST 1400 detected\n");
> +			chip = AST1400;
> +			dev_info(dev, "AST 1400 detected\n");
>   			break;
>   		default:
> -			ast->chip = AST2400;
> -			drm_info(dev, "AST 2400 detected\n");
> +			chip = AST2400;
> +			dev_info(dev, "AST 2400 detected\n");
>   		}
>   	} else if (pdev->revision >= 0x20) {
>   		switch (scu_rev & 0x300) {
>   		case 0x0000:
> -			ast->chip = AST1300;
> -			drm_info(dev, "AST 1300 detected\n");
> +			chip = AST1300;
> +			dev_info(dev, "AST 1300 detected\n");
>   			break;
>   		default:
> -			ast->chip = AST2300;
> -			drm_info(dev, "AST 2300 detected\n");
> +			chip = AST2300;
> +			dev_info(dev, "AST 2300 detected\n");
>   			break;
>   		}
>   	} else if (pdev->revision >= 0x10) {
>   		switch (scu_rev & 0x0300) {
>   		case 0x0200:
> -			ast->chip = AST1100;
> -			drm_info(dev, "AST 1100 detected\n");
> +			chip = AST1100;
> +			dev_info(dev, "AST 1100 detected\n");
>   			break;
>   		case 0x0100:
> -			ast->chip = AST2200;
> -			drm_info(dev, "AST 2200 detected\n");
> +			chip = AST2200;
> +			dev_info(dev, "AST 2200 detected\n");
>   			break;
>   		case 0x0000:
> -			ast->chip = AST2150;
> -			drm_info(dev, "AST 2150 detected\n");
> +			chip = AST2150;
> +			dev_info(dev, "AST 2150 detected\n");
>   			break;
>   		default:
> -			ast->chip = AST2100;
> -			drm_info(dev, "AST 2100 detected\n");
> +			chip = AST2100;
> +			dev_info(dev, "AST 2100 detected\n");
>   			break;
>   		}
>   	} else {
> -		ast->chip = AST2000;
> -		drm_info(dev, "AST 2000 detected\n");
> +		chip = AST2000;
> +		dev_info(dev, "AST 2000 detected\n");
>   	}
>   
> +	*chip_out = chip;
> +	*config_mode_out = config_mode;
> +
>   	return 0;
>   }
>   
> @@ -431,6 +436,8 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   	int ret = 0;
>   	void __iomem *regs;
>   	void __iomem *ioregs;
> +	enum ast_config_mode config_mode;
> +	enum ast_chip chip;
>   
>   	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
>   	if (IS_ERR(ast))
> @@ -502,10 +509,13 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> -	ret = ast_device_config_init(ast);
> +	ret = ast_detect_chip(pdev, regs, ioregs, &chip, &config_mode);
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> +	ast->chip = chip;
> +	ast->config_mode = config_mode;
> +
>   	ast_detect_widescreen(ast);
>   	ast_detect_tx_chip(ast, need_post);
>   

Thanks for your patch,

Best regards,

-- 

Jocelyn

