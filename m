Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC63BC913E
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B511110EA1F;
	Thu,  9 Oct 2025 12:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dRlqJ0d5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073BA10E163
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760013631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=by1DYuf2TSU2XMOmO640g7rt0oGjp77MHz02LN2aofU=;
 b=dRlqJ0d5lMHC6+n4cYP6MPIOtXecHiD4j5l/hmNtSCRhYikkz5JcCu5KxMBAHYRjycH7zw
 52+p2j2c26HkujFHIB+5dtGiDqeplRSHhJrkI5NXROl7bs3aBQAgKWKYP66ELgSt7qjHYW
 N1SOo6rsWYIZRStFlO0rDDhpnJICp9c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-HJopG-NkNsWUBkqTZqzg9w-1; Thu, 09 Oct 2025 08:40:29 -0400
X-MC-Unique: HJopG-NkNsWUBkqTZqzg9w-1
X-Mimecast-MFC-AGG-ID: HJopG-NkNsWUBkqTZqzg9w_1760013628
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-46e502a37cdso6302885e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 05:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760013628; x=1760618428;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=by1DYuf2TSU2XMOmO640g7rt0oGjp77MHz02LN2aofU=;
 b=SgG8Ty07obB+CDh9OjVt6GC9X0iOlFX0PT3EjjrAsBDPNTdkuicndu/k9bXA0t/Uoy
 WbW6sppXgDROHj2DvQRX5wxmvHYbqKd4AlQClP306W5PAd4Bf9Uc9VssU7U6X8+Mg4Ds
 nQHzdbJ/88KuK0bGY+7OeGTbHKZGrAw+/ly5WzSVTyGzE4qCHehIBnE+ZiouNIyvq9Mp
 Ch9SqceAKq+24YRSKXoge8SkU4pOVlUNbQHCRHoML/XZeFvrmqPH2Hc8ooD1evonFcJZ
 XWFYMAMVwJ55iH0BY6Ef+uJMzVA+CyIQFuGN37qgusNFyE2Z+bgDNli0chIlp0L7hUXV
 MHcw==
X-Gm-Message-State: AOJu0YzxNh6y8FZpMYE8H5CXG+ZgcGfRwxSU4x/QFGuQa1V/It3xJBEj
 Hlb3eTk5vyJtO234mbcMm61Riq84IZhgnzrhB3DZYtgr6DlgWz/wSx+/M+aYvWuMxjpXBpDPs3+
 g2YdRw34Iy5adzxpbTFIrRt8WXyvB2tNC5AhPlPw76KZIIeneq4oGdzrVGWe5vTy1jGbHMg==
X-Gm-Gg: ASbGncsD5fvRdQdgrIkWNegwKGaLZERJlBnxG8u6aF5Vqv62Vn3ss58RNlKKtKrn1Cl
 rxGqjgi1n+gwdMJoO0NUNFm9/psYQDTBJXwXOeLpp4cZteHgsfeDiwoccqDy55DPfeJRz1alLcH
 Can0SH2trmnjsxx1I9HtzoHUjDXX8IkmE17Ek7ohUtAt1W2IVSbUvZsYAvUibjagTctISj+17os
 PlUq+5o9EDCoHOTalr8hbSxH73A35d2mOIFp0ziRLThRQE2WXb4lM4GgCxmVfbSctu20OGWRG04
 fSwpzDKJwDbDNBCtBLu+aZlYg5cme8vr7eO7zLsssnVs/q/9VhpuD2W06neuDQ7aMXYY2LsSq5B
 PnwF/34UrEg==
X-Received: by 2002:a05:600c:a309:b0:46f:b42e:e39e with SMTP id
 5b1f17b1804b1-46fb42ee4femr1452015e9.39.1760013628378; 
 Thu, 09 Oct 2025 05:40:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBbsh7gIH+B/PZp+dO+aTsNbkV+y2cJfp3z0dqB0n2aenocE0HwvpvMuTPSnRc3JPNv5zmYw==
X-Received: by 2002:a05:600c:a309:b0:46f:b42e:e39e with SMTP id
 5b1f17b1804b1-46fb42ee4femr1451865e9.39.1760013627945; 
 Thu, 09 Oct 2025 05:40:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3d7df4sm38893085e9.1.2025.10.09.05.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 05:40:27 -0700 (PDT)
Message-ID: <2b0343e4-6ce5-480c-9e05-9b814818d87c@redhat.com>
Date: Thu, 9 Oct 2025 14:40:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/ast: Store DRAM clock table in struct ast_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20251007150343.273718-1-tzimmermann@suse.de>
 <20251007150343.273718-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251007150343.273718-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0GNZKU4Z6AwodkKsPyLhI-qYo6od4oAPZAB5FRCSbnQ_1760013628
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
> Init the new field dclk_table in struct ast_device to the per-gen
> table of DRAM clock parameters. Use the field during modesetting.
> 
> The table is static, so a setup is only required once. Removes the
> call to IS_AST_GEN() from the atomic commit's code path.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2000.c | 2 ++
>   drivers/gpu/drm/ast/ast_2100.c | 2 ++
>   drivers/gpu/drm/ast/ast_2200.c | 2 ++
>   drivers/gpu/drm/ast/ast_2300.c | 2 ++
>   drivers/gpu/drm/ast/ast_2400.c | 2 ++
>   drivers/gpu/drm/ast/ast_2500.c | 2 ++
>   drivers/gpu/drm/ast/ast_2600.c | 2 ++
>   drivers/gpu/drm/ast/ast_drv.h  | 2 ++
>   drivers/gpu/drm/ast/ast_mode.c | 7 +------
>   9 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
> index 03b0dcea43d1..74a041e99061 100644
> --- a/drivers/gpu/drm/ast/ast_2000.c
> +++ b/drivers/gpu/drm/ast/ast_2000.c
> @@ -230,6 +230,8 @@ struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
>   
>   	ast_device_init(ast, chip, config_mode, regs, ioregs);
>   
> +	ast->dclk_table = ast_2000_dclk_table;
> +
>   	ast_2000_detect_tx_chip(ast, need_post);
>   
>   	if (need_post) {
> diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
> index 540972daec52..eb3336c84833 100644
> --- a/drivers/gpu/drm/ast/ast_2100.c
> +++ b/drivers/gpu/drm/ast/ast_2100.c
> @@ -451,6 +451,8 @@ struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
>   
>   	ast_device_init(ast, chip, config_mode, regs, ioregs);
>   
> +	ast->dclk_table = ast_2000_dclk_table;
> +
>   	ast_2000_detect_tx_chip(ast, need_post);
>   
>   	if (need_post) {
> diff --git a/drivers/gpu/drm/ast/ast_2200.c b/drivers/gpu/drm/ast/ast_2200.c
> index 4795966dc2a7..391034d5f425 100644
> --- a/drivers/gpu/drm/ast/ast_2200.c
> +++ b/drivers/gpu/drm/ast/ast_2200.c
> @@ -62,6 +62,8 @@ struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
>   
>   	ast_device_init(ast, chip, config_mode, regs, ioregs);
>   
> +	ast->dclk_table = ast_2000_dclk_table;
> +
>   	ast_2000_detect_tx_chip(ast, need_post);
>   
>   	if (need_post) {
> diff --git a/drivers/gpu/drm/ast/ast_2300.c b/drivers/gpu/drm/ast/ast_2300.c
> index d1d63e58f3d6..3c9e1960b90c 100644
> --- a/drivers/gpu/drm/ast/ast_2300.c
> +++ b/drivers/gpu/drm/ast/ast_2300.c
> @@ -1426,6 +1426,8 @@ struct drm_device *ast_2300_device_create(struct pci_dev *pdev,
>   
>   	ast_device_init(ast, chip, config_mode, regs, ioregs);
>   
> +	ast->dclk_table = ast_2000_dclk_table;
> +
>   	ast_2300_detect_tx_chip(ast);
>   
>   	if (need_post) {
> diff --git a/drivers/gpu/drm/ast/ast_2400.c b/drivers/gpu/drm/ast/ast_2400.c
> index 596338ea22f4..be866d1cd06a 100644
> --- a/drivers/gpu/drm/ast/ast_2400.c
> +++ b/drivers/gpu/drm/ast/ast_2400.c
> @@ -63,6 +63,8 @@ struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
>   
>   	ast_device_init(ast, chip, config_mode, regs, ioregs);
>   
> +	ast->dclk_table = ast_2000_dclk_table;
> +
>   	ast_2300_detect_tx_chip(ast);
>   
>   	if (need_post) {
> diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
> index 2c56db644f06..086c74682a55 100644
> --- a/drivers/gpu/drm/ast/ast_2500.c
> +++ b/drivers/gpu/drm/ast/ast_2500.c
> @@ -637,6 +637,8 @@ struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
>   
>   	ast_device_init(ast, chip, config_mode, regs, ioregs);
>   
> +	ast->dclk_table = ast_2500_dclk_table;
> +
>   	ast_2300_detect_tx_chip(ast);
>   
>   	if (need_post) {
> diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
> index 30490c473797..1f709486f491 100644
> --- a/drivers/gpu/drm/ast/ast_2600.c
> +++ b/drivers/gpu/drm/ast/ast_2600.c
> @@ -78,6 +78,8 @@ struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
>   
>   	ast_device_init(ast, chip, config_mode, regs, ioregs);
>   
> +	ast->dclk_table = ast_2500_dclk_table;
> +
>   	ast_2300_detect_tx_chip(ast);
>   
>   	switch (ast->tx_chip) {
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 35c476c85b9a..b2b30a0e4ffb 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -174,6 +174,8 @@ struct ast_device {
>   	enum ast_config_mode config_mode;
>   	enum ast_chip chip;
>   
> +	const struct ast_vbios_dclk_info *dclk_table;
> +
>   	void __iomem	*vram;
>   	unsigned long	vram_base;
>   	unsigned long	vram_size;
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 6b9d510c509d..a9ffda1b1dea 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -370,12 +370,7 @@ static void ast_set_dclk_reg(struct ast_device *ast,
>   			     struct drm_display_mode *mode,
>   			     const struct ast_vbios_enhtable *vmode)
>   {
> -	const struct ast_vbios_dclk_info *clk_info;
> -
> -	if (IS_AST_GEN6(ast) || IS_AST_GEN7(ast))
> -		clk_info = &ast_2500_dclk_table[vmode->dclk_index];
> -	else
> -		clk_info = &ast_2000_dclk_table[vmode->dclk_index];
> +	const struct ast_vbios_dclk_info *clk_info = &ast->dclk_table[vmode->dclk_index];
>   
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc0, 0x00, clk_info->param1);
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc1, 0x00, clk_info->param2);

