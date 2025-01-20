Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57005A16ADB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 11:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA01210E398;
	Mon, 20 Jan 2025 10:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U01ko12p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A0010E398
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737369316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11CYfEwKHVkc87XQIxitK/uQ8wiA+5Jv7QMbsyWByZ8=;
 b=U01ko12p+yUGchOCbCNIMq6cej6SpdOJBg8vmIxNaPlvgvMDrAH3qVMvLwC0kDaMNXfcQr
 i0JlJK/Mz+sLdGT3Q3mLpwaFARmlHBKN3sO2E92I/Zlo2OfkUatGjX/fl5bQIDpyGNCCRx
 buOZDRaqLDQP7UuFzS1O/0oQ5bwghRQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-wdzdMy7qONGwEGTNrZuXVA-1; Mon, 20 Jan 2025 05:35:15 -0500
X-MC-Unique: wdzdMy7qONGwEGTNrZuXVA-1
X-Mimecast-MFC-AGG-ID: wdzdMy7qONGwEGTNrZuXVA
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38a873178f2so2118941f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 02:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737369313; x=1737974113;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=11CYfEwKHVkc87XQIxitK/uQ8wiA+5Jv7QMbsyWByZ8=;
 b=TvM6lmzsq+lF/CU6kQHWZ5lqUyKaxNu9xAGijRt8/i4pa3ZrP/uMfiEncmvdUmm2BF
 Ug75Yb5NgyvBNWewVAXR1tEAdPNMc1MVoo45SpT9PvN1L1Z9ziNKACcLIPzPJLVP1GNR
 ENeDvq3ABd9v5SAmIEtRkDAPfzXon7G0xRYPZivtt6IMMfsYY0Z3xwxFyWCDbBSP4n4G
 X4WQEEDZaj002QQyoYq5VV7jyHSiyUObaXMhdyolYOrj/6nTu/7AXS1RTWMCdNR4tuTe
 oJXviVEWMpffcR81wLwvToMjW9nYwma63fZlb9JG88ibarsCvpbjKir1sPe8iaJDkjpz
 jQ4g==
X-Gm-Message-State: AOJu0YyCCkOq8Ac9/RgkaHwlI5IG08Zwdomk5xS5IvJMjpPOoT6ZDQKg
 N6QjgkjTaj6UhWr7UGy717GRHxkmUGoBsOzN8nq5m5DuaFu3kOyOIVhp3rvvWFJM8ZilwKup2/Q
 j0ttQbWqcyyHnfqd5zo8vUYqxm03blbYMACoqZEli43HuSbQGLlOY4gtU8VPq7IQqEFbpD6W88g
 ==
X-Gm-Gg: ASbGnctDo+Pa3DYaedChH3kU+Scx2I+Rshw/BYVjK7HueJaKys8n1uZKBuZYlHcvOoh
 +Lv4+wPZrjgiup23Awa6p2Ivwls4US6GjnLvoCrLckL1SJszzdXyS3LSCFOasGTXTCGF2n6/7xI
 NLXSpK25lmLAcxG4wynywBHH3CJi8nUbhg2axIV6jVGXYCSrg5TcRA6bJEHJjlbKbHiZ+luDMwS
 LLYetV5FwyJyKj0Pj7C5xOmZ1Ly/NVADwhvnenwyvXp7lisEzgJOwMpQESw3RGJ3K0Ay0ZflVLR
 WkoOaBr4yo2QSZdT52Mquz+vwqxfx+B3uA==
X-Received: by 2002:adf:cd8f:0:b0:385:f2a2:50df with SMTP id
 ffacd0b85a97d-38bf566c278mr10581016f8f.27.1737369313442; 
 Mon, 20 Jan 2025 02:35:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK/q1DX7pRBSsvmsKvg8xt1wKLlClyOMCk0W1L5WZo95tG2KdfoHLSBczyhE4hN/7/yMCuMQ==
X-Received: by 2002:adf:cd8f:0:b0:385:f2a2:50df with SMTP id
 ffacd0b85a97d-38bf566c278mr10580987f8f.27.1737369313021; 
 Mon, 20 Jan 2025 02:35:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3275755sm9852332f8f.80.2025.01.20.02.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 02:35:12 -0800 (PST)
Message-ID: <8e390985-1fef-4c24-b29f-b4e63f5f140c@redhat.com>
Date: Mon, 20 Jan 2025 11:35:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/ast: Detect DRAM before TX-chip
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250117103450.28692-1-tzimmermann@suse.de>
 <20250117103450.28692-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250117103450.28692-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oPobIo1fMK3-uY7OflLk58Wc2oWe5p8zeOuT3VBFX2c_1737369314
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

On 17/01/2025 11:29, Thomas Zimmermann wrote:
> Move DRAM detection before TX-chip detection. Both steps are independent
> from each other. Detection of the TX-chip is now next to posting those
> chips, which can be done in a single step.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 037d389ab630d..456230bef2736 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -290,15 +290,13 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
>   	ast->regs = regs;
>   	ast->ioregs = ioregs;
>   
> -	ast_detect_tx_chip(ast, need_post);
> -
>   	ret = ast_get_dram_info(ast);
>   	if (ret)
>   		return ERR_PTR(ret);
> -
>   	drm_info(dev, "dram MCLK=%u Mhz type=%d bus_width=%d\n",
>   		 ast->mclk, ast->dram_type, ast->dram_bus_width);
>   
> +	ast_detect_tx_chip(ast, need_post);
>   	if (need_post)
>   		ast_post_gpu(ast);
>   

