Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ADCAF6FF0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 12:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CCF10E185;
	Thu,  3 Jul 2025 10:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZlFMydMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8240D10E180
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751538246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s1egdZ0yucTmx1A1Nr4shHCwe02X80X7TaOWLW/hFVM=;
 b=ZlFMydMbWgonX8hDQaR4IhHOa4FeIZxeyPiv19ccF6UZ/kaYPRqXaEjnMGhVgJgR1Tq19e
 rJH0Xadez5Jf+KqT0b7uSA5RDKJDjk4CtEKiC8CzmF3QWqep9O6CT9kMZ19CoOJlv3k6N0
 Y3YPQ8NLkzHEbR6IVlrRQN1A/3G1WGA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-bxcgmIBgNPicmQf4lXL3xQ-1; Thu, 03 Jul 2025 06:24:05 -0400
X-MC-Unique: bxcgmIBgNPicmQf4lXL3xQ-1
X-Mimecast-MFC-AGG-ID: bxcgmIBgNPicmQf4lXL3xQ_1751538244
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-451ac1b43c4so39509705e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 03:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538244; x=1752143044;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s1egdZ0yucTmx1A1Nr4shHCwe02X80X7TaOWLW/hFVM=;
 b=BQx8LPri315YKgdWqkYSEDfDwwyXjqpMhAW6h5MOMSIc6vgV0qlx7HGt0NVj4j/Hjd
 R238O9s2hjE4NBBhY0cH0gkUI7D7JGrH9swyzx2GTGR4ceWXSX9VBuBEesF3ZBZ0AdGb
 ov/GlXn4obNArcl09jEVEFRI8QguNarJtW2D3ReJAZUmbUwrSGIwK4gmcgpCGRk5ZEpf
 Vtt4OCsLFVMnURZGrreTZZJuzZqEOlX6ad2GTOYNvVlMG1a+o4VTgAf8/PobS5clQYKc
 YKymAe7q/MgB06HlX1jcg49MovdOO4naUEcVjabp388v2k0lpq1BGjL5Gd3yhp0gwwNZ
 i0dA==
X-Gm-Message-State: AOJu0YykJTghaFjTkUVcB0FUtzsvfgH8BGLuje8SY5/WNZnLPAZnm9Fo
 4mj/So8Ffrzq/+PTjDUzENmvnxYXe/Z2v7SHrJqtrWxeHtKAFwWL3f2d+0ZmzWrp1nN6A+v7Ytv
 bccCtvRmG+toagsDnX/yelGac7dyd0BEJHnnmtNqNbAFlz6x2R0CIxrtmhXd/qC4t1am07w==
X-Gm-Gg: ASbGncuyYP1gyNGbytpne6CqOr1tDvTRu+p1uqmKQ1Cm/RaFa8HGl7QvERgcVi9PFQL
 NafknO1iNOBVe0c3chURuTecW6moatjND5eUPY2fDADQ2Z/Rk2/TyE8y1gl6acocqqHAploEQg+
 8rQ7MsAzx1yd2B1SKzWScRxPg8RPtsyyirJZpVIoo4Xt70B+tIP92x6ZGC8ncEtS/T4RQWwSqjp
 s1XYV0GKppznpS5v3lrpGhqiTXSXk3YkXIEQpVie52BdQZ//N9SAh+CCX0A45FWCVXkTCr/Fnjz
 yu56fIiO9OMdALBUgJakVXYXNtqdL6u5m3J22XG5mHY35VZTeNWCRXN3UiX/KQ==
X-Received: by 2002:a05:600c:5305:b0:43c:eeee:b70a with SMTP id
 5b1f17b1804b1-454adaad753mr13210425e9.22.1751538243852; 
 Thu, 03 Jul 2025 03:24:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHg99z3jEgzywQDSpl9MwbWqYbbPc+EwFS28wlboN4zHFBU8++7U6A2zqf60oKU3ardugteg==
X-Received: by 2002:a05:600c:5305:b0:43c:eeee:b70a with SMTP id
 5b1f17b1804b1-454adaad753mr13210045e9.22.1751538243282; 
 Thu, 03 Jul 2025 03:24:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9969a20sm22793525e9.1.2025.07.03.03.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 03:24:02 -0700 (PDT)
Message-ID: <dfb2f102-3442-42ae-818b-ae58429bd57a@redhat.com>
Date: Thu, 3 Jul 2025 12:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drm/ast: Declare helpers for POST in header
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250702132431.249329-1-tzimmermann@suse.de>
 <20250702132431.249329-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250702132431.249329-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wWFUmN5WEi30wmnjSqHFZJ8AB-4Jg47dbpcpIEB2FP4_1751538244
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

On 02/07/2025 15:12, Thomas Zimmermann wrote:
> Provide POST helpers in header file before splitting up the AST
> POST code.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_post.c | 10 +++++-----
>   drivers/gpu/drm/ast/ast_post.h | 16 ++++++++++++++++
>   2 files changed, 21 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/gpu/drm/ast/ast_post.h
> 
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 37568cf3822c..36542d266f9c 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -33,6 +33,7 @@
>   
>   #include "ast_dram_tables.h"
>   #include "ast_drv.h"
> +#include "ast_post.h"
>   
>   static void ast_post_chip_2300(struct ast_device *ast);
>   static void ast_post_chip_2500(struct ast_device *ast);
> @@ -75,7 +76,7 @@ static void ast_set_def_ext_reg(struct ast_device *ast)
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
>   }
>   
> -static u32 __ast_mindwm(void __iomem *regs, u32 r)
> +u32 __ast_mindwm(void __iomem *regs, u32 r)
>   {
>   	u32 data;
>   
> @@ -89,7 +90,7 @@ static u32 __ast_mindwm(void __iomem *regs, u32 r)
>   	return __ast_read32(regs, 0x10000 + (r & 0x0000ffff));
>   }
>   
> -static void __ast_moutdwm(void __iomem *regs, u32 r, u32 v)
> +void __ast_moutdwm(void __iomem *regs, u32 r, u32 v)
>   {
>   	u32 data;
>   
> @@ -438,7 +439,7 @@ static const u32 pattern[8] = {
>   	0x7C61D253
>   };
>   
> -static bool mmc_test(struct ast_device *ast, u32 datagen, u8 test_ctl)
> +bool mmc_test(struct ast_device *ast, u32 datagen, u8 test_ctl)
>   {
>   	u32 data, timeout;
>   
> @@ -478,8 +479,7 @@ static u32 mmc_test2(struct ast_device *ast, u32 datagen, u8 test_ctl)
>   	return data;
>   }
>   
> -
> -static bool mmc_test_burst(struct ast_device *ast, u32 datagen)
> +bool mmc_test_burst(struct ast_device *ast, u32 datagen)
>   {
>   	return mmc_test(ast, datagen, 0xc1);
>   }
> diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
> new file mode 100644
> index 000000000000..314fa0475c79
> --- /dev/null
> +++ b/drivers/gpu/drm/ast/ast_post.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef AST_POST_H
> +#define AST_POST_H
> +
> +#include <linux/types.h>
> +
> +struct ast_device;
> +
> +u32 __ast_mindwm(void __iomem *regs, u32 r);
> +void __ast_moutdwm(void __iomem *regs, u32 r, u32 v);
> +
> +bool mmc_test(struct ast_device *ast, u32 datagen, u8 test_ctl);
> +bool mmc_test_burst(struct ast_device *ast, u32 datagen);
> +
> +#endif

