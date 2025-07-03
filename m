Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D355BAF7523
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 15:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45C110E838;
	Thu,  3 Jul 2025 13:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ik3LyhE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872CD10E838
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 13:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751548279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V39rfVtq4T7KVTvKc3Sv2++IPmrHat2U8fTmJRwUB/M=;
 b=ik3LyhE7BanFvWR6Be0QMr0AFVcUxgHyfgKR5pd1+qHMsa+sKZhHTG35PArprGUc2XCxee
 sq7byXXYWEJ3AC1yZAlB1kXW1X+guwKd3pe4Gb19cTRjdMeR5BJ0ciYcYXVErz+R/t2FG6
 DBksIBTcA2SOndtR+KHy+aecTj4s96o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-vXDqbdpGPKSYNqQbpzn3Xw-1; Thu, 03 Jul 2025 09:11:18 -0400
X-MC-Unique: vXDqbdpGPKSYNqQbpzn3Xw-1
X-Mimecast-MFC-AGG-ID: vXDqbdpGPKSYNqQbpzn3Xw_1751548277
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45320bfc18dso5122055e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 06:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751548277; x=1752153077;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V39rfVtq4T7KVTvKc3Sv2++IPmrHat2U8fTmJRwUB/M=;
 b=OzQOJxfOsk0nWOHK6J9asFGkhPuBQivvE5VHIT5MY3Ritfc1t7glsQGJVXuexUQWX8
 W8MO6cmeRbTzIwB1jciwsQoYBM0mJTV8HxQYq9uic+88yMSCnbmiYEjHNZuY1wK7Tdgd
 P/odH0JWJ1499lmMb49htGOlXAvvTVwCm9cxyUi6AmAquHf6o+mFo7e6YokNhaGhDReV
 sDvnJMJAC7NZq2hDE4hmGfzQtTAmnSGvuNkkxZxqE3DS3tE0/3yDkW8gG21nLgPO7FIM
 ssFktbQMeLPPN8g3Z5xKCzldSYJ55rCJO3gJFQCpfeuxo3KpNg/Tl/fgMYOFYEfW2AGJ
 AJoA==
X-Gm-Message-State: AOJu0YyosyPteaK3DchF8yj3zDP+QsLZCV2Hgo6cxnvF3QDXAnuTwenk
 RumlC/FfwHqgE+hzzhUJGVmbQkoi+JSrBDKXfRmVsvxgGkKTw5f2kQ7BPCI3W16oJGyKYg8zOHa
 piQVi0psrAmr/4XgFsPc5hk82u/6x2uMfNzdwZ1L6FfyDPyGpBhBH23nPoZXqmOmnN3HJSw==
X-Gm-Gg: ASbGnctganKglD235mvVVZmp2CDL5aVR4tjQFtmGMV8JObc6vlSqZQTsQ01NiVsaw3Q
 mZH8gu62fl56Tc3o7FTNWnDHN6HmA0lP9k+V3uKK4HWUniIwe1eUx2gg0fmj0MUy9ho+aCwuTIz
 F/Nzy5Dzp0fdjwnEzWzHvL6EqMdr4nO0CPVKIqA+IffkWE1Jl/9zuI3b7Fy0Q+jMbX64S/I5OrR
 GVFOY3wqFKq4hQ5ScvvclscIuUrJRbW0/s8p1wR+8z3NreyrEK8JQdlHaifKbm7qXGV3pYlC441
 mNmYtuIQ98jRINNYE3PfLbheZfiU2UQbI0HqHSBc48m+YatHmMqMNZz1l/LsjA==
X-Received: by 2002:a05:600c:4ec9:b0:43d:fa5f:7d30 with SMTP id
 5b1f17b1804b1-454aba0a46amr28208645e9.16.1751548277047; 
 Thu, 03 Jul 2025 06:11:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB3DhmJpO1IvfHp2l3EesoFS0neJiWXLj2gR4qf6UPQQEvPD6eXDl365fW3LPxsve5+S8BMQ==
X-Received: by 2002:a05:600c:4ec9:b0:43d:fa5f:7d30 with SMTP id
 5b1f17b1804b1-454aba0a46amr28208065e9.16.1751548276393; 
 Thu, 03 Jul 2025 06:11:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a99c1186sm26289365e9.36.2025.07.03.06.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 06:11:16 -0700 (PDT)
Message-ID: <6f299fb3-9f03-45ff-b3e6-6fbcaa60fad4@redhat.com>
Date: Thu, 3 Jul 2025 15:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/ast: Handle known struct ast_dramstruct with
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250702132431.249329-1-tzimmermann@suse.de>
 <20250702132431.249329-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250702132431.249329-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RgfXI2zQSLhh--oQh-DjnxZEgBL7x8XfgsA9zAE0Dtk_1751548277
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
> Most of struct ast_dramstruct stores hardware state. Some index
> values have known or special meaning. The known values are
> 
> - 0xffff - Terminal entry in the array
> - 0xff00 - Delays the programming for usecs
> - 0x0004 - Sets the type of DRAM
> 
> Add constants and helper macros for these cases. Also add a helper
> macro for testing. Update Gen1 and Gen2+ accordingly.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2000.c | 16 ++++++++--------
>   drivers/gpu/drm/ast/ast_2100.c | 22 +++++++++++-----------
>   drivers/gpu/drm/ast/ast_post.h | 22 ++++++++++++++++++++++
>   3 files changed, 41 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
> index b2ad2ea5056b..93f13ecc74dc 100644
> --- a/drivers/gpu/drm/ast/ast_2000.c
> +++ b/drivers/gpu/drm/ast/ast_2000.c
> @@ -38,9 +38,9 @@
>   static const struct ast_dramstruct ast2000_dram_table_data[] = {
>   	{ 0x0108, 0x00000000 },
>   	{ 0x0120, 0x00004a21 },
> -	{ 0xFF00, 0x00000043 },
> +	AST_DRAMSTRUCT_UDELAY(67u),
>   	{ 0x0000, 0xFFFFFFFF },
> -	{ 0x0004, 0x00000089 },
> +	AST_DRAMSTRUCT_INIT(DRAM_TYPE, 0x00000089),
>   	{ 0x0008, 0x22331353 },
>   	{ 0x000C, 0x0d07000b },
>   	{ 0x0010, 0x11113333 },
> @@ -49,18 +49,18 @@ static const struct ast_dramstruct ast2000_dram_table_data[] = {
>   	{ 0x0024, 0x00000001 },
>   	{ 0x001C, 0x00000000 },
>   	{ 0x0014, 0x00000003 },
> -	{ 0xFF00, 0x00000043 },
> +	AST_DRAMSTRUCT_UDELAY(67u),
>   	{ 0x0018, 0x00000131 },
>   	{ 0x0014, 0x00000001 },
> -	{ 0xFF00, 0x00000043 },
> +	AST_DRAMSTRUCT_UDELAY(67u),
>   	{ 0x0018, 0x00000031 },
>   	{ 0x0014, 0x00000001 },
> -	{ 0xFF00, 0x00000043 },
> +	AST_DRAMSTRUCT_UDELAY(67u),
>   	{ 0x0028, 0x1e0828f1 },
>   	{ 0x0024, 0x00000003 },
>   	{ 0x002C, 0x1f0f28fb },
>   	{ 0x0030, 0xFFFFFE01 },
> -	{ 0xFFFF, 0xFFFFFFFF }
> +	AST_DRAMSTRUCT_INVALID,
>   };
>   
>   static void ast_post_chip_2000(struct ast_device *ast)
> @@ -81,8 +81,8 @@ static void ast_post_chip_2000(struct ast_device *ast)
>   			;
>   		} while (ast_read32(ast, 0x10100) != 0xa8);
>   
> -		while (dram_reg_info->index != 0xffff) {
> -			if (dram_reg_info->index == 0xff00) {/* delay fn */
> +		while (!AST_DRAMSTRUCT_IS(dram_reg_info, INVALID)) {
> +			if (AST_DRAMSTRUCT_IS(dram_reg_info, UDELAY)) {
>   				for (i = 0; i < 15; i++)
>   					udelay(dram_reg_info->data);
>   			} else {
> diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
> index ee40f3911ca4..1cabac647584 100644
> --- a/drivers/gpu/drm/ast/ast_2100.c
> +++ b/drivers/gpu/drm/ast/ast_2100.c
> @@ -38,11 +38,11 @@
>   static const struct ast_dramstruct ast1100_dram_table_data[] = {
>   	{ 0x2000, 0x1688a8a8 },
>   	{ 0x2020, 0x000041f0 },
> -	{ 0xFF00, 0x00000043 },
> +	AST_DRAMSTRUCT_UDELAY(67u),
>   	{ 0x0000, 0xfc600309 },
>   	{ 0x006C, 0x00909090 },
>   	{ 0x0064, 0x00050000 },
> -	{ 0x0004, 0x00000585 },
> +	AST_DRAMSTRUCT_INIT(DRAM_TYPE, 0x00000585),
>   	{ 0x0008, 0x0011030f },
>   	{ 0x0010, 0x22201724 },
>   	{ 0x0018, 0x1e29011a },
> @@ -68,7 +68,7 @@ static const struct ast_dramstruct ast1100_dram_table_data[] = {
>   	{ 0x0078, 0x00000000 },
>   	{ 0x007C, 0x00000000 },
>   	{ 0x0034, 0x00000001 },
> -	{ 0xFF00, 0x00000043 },
> +	AST_DRAMSTRUCT_UDELAY(67u),
>   	{ 0x002C, 0x00000732 },
>   	{ 0x0030, 0x00000040 },
>   	{ 0x0028, 0x00000005 },
> @@ -85,17 +85,17 @@ static const struct ast_dramstruct ast1100_dram_table_data[] = {
>   	{ 0x000C, 0x00005a21 },
>   	{ 0x0034, 0x00007c03 },
>   	{ 0x0120, 0x00004c41 },
> -	{ 0xffff, 0xffffffff },
> +	AST_DRAMSTRUCT_INVALID,
>   };
>   
>   static const struct ast_dramstruct ast2100_dram_table_data[] = {
>   	{ 0x2000, 0x1688a8a8 },
>   	{ 0x2020, 0x00004120 },
> -	{ 0xFF00, 0x00000043 },
> +	AST_DRAMSTRUCT_UDELAY(67u),
>   	{ 0x0000, 0xfc600309 },
>   	{ 0x006C, 0x00909090 },
>   	{ 0x0064, 0x00070000 },
> -	{ 0x0004, 0x00000489 },
> +	AST_DRAMSTRUCT_INIT(DRAM_TYPE, 0x00000489),
>   	{ 0x0008, 0x0011030f },
>   	{ 0x0010, 0x32302926 },
>   	{ 0x0018, 0x274c0122 },
> @@ -121,7 +121,7 @@ static const struct ast_dramstruct ast2100_dram_table_data[] = {
>   	{ 0x0078, 0x00000000 },
>   	{ 0x007C, 0x00000000 },
>   	{ 0x0034, 0x00000001 },
> -	{ 0xFF00, 0x00000043 },
> +	AST_DRAMSTRUCT_UDELAY(67u),
>   	{ 0x002C, 0x00000942 },
>   	{ 0x0030, 0x00000040 },
>   	{ 0x0028, 0x00000005 },
> @@ -138,7 +138,7 @@ static const struct ast_dramstruct ast2100_dram_table_data[] = {
>   	{ 0x000C, 0x00005a21 },
>   	{ 0x0034, 0x00007c03 },
>   	{ 0x0120, 0x00005061 },
> -	{ 0xffff, 0xffffffff },
> +	AST_DRAMSTRUCT_INVALID,
>   };
>   
>   /*
> @@ -287,11 +287,11 @@ static void ast_post_chip_2100(struct ast_device *ast)
>   			;
>   		} while (ast_read32(ast, 0x10000) != 0x01);
>   
> -		while (dram_reg_info->index != 0xffff) {
> -			if (dram_reg_info->index == 0xff00) {/* delay fn */
> +		while (!AST_DRAMSTRUCT_IS(dram_reg_info, INVALID)) {
> +			if (AST_DRAMSTRUCT_IS(dram_reg_info, UDELAY)) {
>   				for (i = 0; i < 15; i++)
>   					udelay(dram_reg_info->data);
> -			} else if (dram_reg_info->index == 0x4) {
> +			} else if (AST_DRAMSTRUCT_IS(dram_reg_info, DRAM_TYPE)) {
>   				data = dram_reg_info->data;
>   				if (ast->dram_type == AST_DRAM_1Gx16)
>   					data = 0x00000d89;
> diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
> index 3a55c32a7eb7..44136856952f 100644
> --- a/drivers/gpu/drm/ast/ast_post.h
> +++ b/drivers/gpu/drm/ast/ast_post.h
> @@ -3,6 +3,7 @@
>   #ifndef AST_POST_H
>   #define AST_POST_H
>   
> +#include <linux/limits.h>
>   #include <linux/types.h>
>   
>   struct ast_device;
> @@ -13,6 +14,27 @@ struct ast_dramstruct {
>   	u32 data;
>   };
>   
> +/* hardware fields */
> +#define __AST_DRAMSTRUCT_DRAM_TYPE      0x0004
> +
> +/* control commands */
> +#define __AST_DRAMSTRUCT_UDELAY         0xff00
> +#define __AST_DRAMSTRUCT_INVALID        0xffff
> +
> +#define __AST_DRAMSTRUCT_INDEX(_name) \
> +	(__AST_DRAMSTRUCT_ ## _name)
> +
> +#define AST_DRAMSTRUCT_INIT(_name, _value) \
> +	{ __AST_DRAMSTRUCT_INDEX(_name), (_value) }
> +
> +#define AST_DRAMSTRUCT_UDELAY(_usecs) \
> +	AST_DRAMSTRUCT_INIT(UDELAY, _usecs)
> +#define AST_DRAMSTRUCT_INVALID \
> +	AST_DRAMSTRUCT_INIT(INVALID, U32_MAX)
> +
> +#define AST_DRAMSTRUCT_IS(_entry, _name) \
> +	((_entry)->index == __AST_DRAMSTRUCT_INDEX(_name))
> +
>   u32 __ast_mindwm(void __iomem *regs, u32 r);
>   void __ast_moutdwm(void __iomem *regs, u32 r, u32 v);
>   

