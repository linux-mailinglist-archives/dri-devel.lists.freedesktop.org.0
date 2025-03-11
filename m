Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7034A5C1E3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D6E10E5AB;
	Tue, 11 Mar 2025 13:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Rd8Po48K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADBE10E5AB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741698438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxXsS2O6Wq0RQfsl5j6BJoE2naaQHV5PQfMgn0KSIG0=;
 b=Rd8Po48KKStoj/boJFSSFC6ZNWNO9xOpMEEBFf6+y6t3eeNouTeOQu9+UaWjRIG+4AhYgh
 vGSV0VV2vEdW1QIEAv39Ka1Rsn9oFFq8serOISOKByVDCFvd8Re0YRPDMY8gIqthR9pWQL
 9DoH6dmOokkN5eq9AglaJ3nG3Inomas=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-ucbSgnDmMKaAKKPIT_GOyw-1; Tue, 11 Mar 2025 09:07:17 -0400
X-MC-Unique: ucbSgnDmMKaAKKPIT_GOyw-1
X-Mimecast-MFC-AGG-ID: ucbSgnDmMKaAKKPIT_GOyw_1741698436
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-391315098b2so2018503f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741698435; x=1742303235;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FxXsS2O6Wq0RQfsl5j6BJoE2naaQHV5PQfMgn0KSIG0=;
 b=udwvin72shmRwCif40vuSSNQiDTYR+D81yIAVWJb6ZHKXJVY5KpdvsmaStdVMIBFuT
 NJUJQijHqP/uZsOoCfJtmiLZ//EJ0WAHXnUkWWyE28EOHf0hnumDrBymIZYLVnaij/nW
 +Mm35xW8QmtEBOyKDQ80N61D3Ksyr80EBlFtnbjjHumyxEU3ESv/PSAr0fLfEBp7lWBo
 yp3QuB1TFfPs084kmFe7LNptBFOawXUnDmLDov7yiF5PDLArXtn0CJJFu/6zs2ALE2bO
 GiqiQdR9Y26bzAHGhBIQv0uLPzeq2WDsnfLxSKkDz2A3vnYKEuPYxbUNsdEnR8mG3Qto
 YAKg==
X-Gm-Message-State: AOJu0YyLn/0aQKH/cZrN3Z4olQ0NK18+j4Byjo5icuRw+rVdRLPoT010
 pBnNUlc1QZQjtbNvRJ/Y6Dnbq0nDtXvAeS2drK6XCTDWIVeCuf284sNKnUOqnN1jV25qdRtPkzA
 bsI2PJonxb01ace6vOkwU8Y2YeQmvHbw1XBigtiy3UGnEGJ97IZRq2RQIOAf/oSqe2YKCaNqT5Q
 ==
X-Gm-Gg: ASbGncudZi5mlHPUosFhWPdXT95nihei5tVnMIcKq1J25cGoKkkF1YIbOVYLHmUeRxO
 EEE6Hx9cIN00I3N2MDOT4dVQJFw6pSP13NPt+MbN8ewlE5mRo8X/et7RP5OV+0pL9GtmxAPl0gY
 FmeIm9iUdUhcMQH8lXR76pQqxOiBIX8JllLWHuB8TAAxuK5C4+dg0Ducf1+7CAvZMR+AUp0VYjN
 oyXjUL8SVHoPOiVFRbCs/riAdhPqjhJgDh2Z0k3DEfji1G0TudnEC6tmiro7ya5XiN70HBKFTGT
 ZpoXAnO5kdLZjWWTvjQwvZFP8kq8WMd2dC3+izJhh8QtVmntJP7cFpE=
X-Received: by 2002:a05:6000:186d:b0:390:df75:ddc4 with SMTP id
 ffacd0b85a97d-39132db1113mr15074239f8f.44.1741698435194; 
 Tue, 11 Mar 2025 06:07:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVlw+JKVRTHrWnrwUFjNzRH7IQUhOu0OyE73T91oUc3aLn816izxnWr9cwh3Sdc4xvr8uj5g==
X-Received: by 2002:a05:6000:186d:b0:390:df75:ddc4 with SMTP id
 ffacd0b85a97d-39132db1113mr15074196f8f.44.1741698434799; 
 Tue, 11 Mar 2025 06:07:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cebe3f1e7sm109040105e9.13.2025.03.11.06.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:07:14 -0700 (PDT)
Message-ID: <786f77db-e5ef-4525-8d23-c220df718780@redhat.com>
Date: Tue, 11 Mar 2025 14:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/ast: Add VGACRAA register constants
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305163207.267650-1-tzimmermann@suse.de>
 <20250305163207.267650-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250305163207.267650-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7U9cutnXcGoLlEFUqfQD4iFD-vNIS1n_qeexK3jUzkY_1741698436
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

On 05/03/2025 17:30, Thomas Zimmermann wrote:
> Add register constants for VGACRAA and use them when detecting the
> size of the VGA memory. Aligns the code with the programming manual.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mm.c  | 5 +++--
>   drivers/gpu/drm/ast/ast_reg.h | 1 +
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
> index 20d833632a01..8d8aac8c0814 100644
> --- a/drivers/gpu/drm/ast/ast_mm.c
> +++ b/drivers/gpu/drm/ast/ast_mm.c
> @@ -37,9 +37,10 @@ static u32 ast_get_vram_size(struct ast_device *ast)
>   {
>   	u8 jreg;
>   	u32 vram_size;
> +	u8 vgacraa;
>   
> -	jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xaa, 0xff);
> -	switch (jreg & 3) {
> +	vgacraa = ast_get_index_reg(ast, AST_IO_VGACRI, 0xaa);
> +	switch (vgacraa & AST_IO_VGACRAA_VGAMEM_SIZE_MASK) {
>   	case 0:
>   		vram_size = SZ_8M;
>   		break;
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index bb2cc1d8b84e..039b93bed19e 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -33,6 +33,7 @@
>   #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
>   #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
>   #define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)
> +#define AST_IO_VGACRAA_VGAMEM_SIZE_MASK	GENMASK(1, 0)
>   #define AST_IO_VGACRB6_HSYNC_OFF	BIT(0)
>   #define AST_IO_VGACRB6_VSYNC_OFF	BIT(1)
>   #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */

