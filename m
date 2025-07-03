Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585F8AF7524
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 15:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C4910E839;
	Thu,  3 Jul 2025 13:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M+0ihn7r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DC210E839
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751548293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMBHzhyZzFhXkIzE1RqAwtuM4QcPv2IVxhncKmMOE48=;
 b=M+0ihn7rk2zRSi/n76ZCfVuzR73x5fkzf17E3zRynCPWTySirFioogsxa2evayqYJcPvPz
 KHfT3U+m7WrUnUXKzWaFPn3l0csI8SwFmkhfDJowKNpWKMdklZOqx2JT4URvvpJPoI6JIu
 nJa7Cf5t9GiXrIXN7yKbx+ePLTwU5SQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-qwjU1IhdNViEyk3_d3F1Gw-1; Thu, 03 Jul 2025 09:11:31 -0400
X-MC-Unique: qwjU1IhdNViEyk3_d3F1Gw-1
X-Mimecast-MFC-AGG-ID: qwjU1IhdNViEyk3_d3F1Gw_1751548290
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4536962204aso23106365e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 06:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751548290; x=1752153090;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jMBHzhyZzFhXkIzE1RqAwtuM4QcPv2IVxhncKmMOE48=;
 b=A3Z53iWn1MxYhHKf9kaVqWMY3OvJsNkoblPhLsEeZbR0W5nCutU7O6jPKyRDklPM1/
 hdO27j7vVcDXor2x90s7oSStrksDPvxfFhTyqnjrsC+1JD5P1UoEld0SU2cc3xDvj+7q
 hJmLoQuXkD8o03+ffMwdk0bjoJ2Z7tBC1eCvxehOzwHNsYbZORzgBC9aXoam8Frg5j60
 Ei2LivFxutV8s4xkj2pbCOugW2zPNOcMi7OCVRWrJG/evtEzvxg78dPG1QGy4mx+9IoZ
 gh1Bax/Z9x8ujyzDLEpE1WrZmrXnse1OqmyJtb92WfG4Jj/XJuyJviqah7m/Pd3QtgCj
 XpIw==
X-Gm-Message-State: AOJu0Yx/CIndcMiOFbCnidRPW9nrqQS7s6C3Lusci4pd9w0qFc2LuXIZ
 Zcu+8Si5huRaACUvPcud4bj4GTuW3BN8CtQsNi+S4d/dQAOP4R43F3H2UkBcT6CWGVdcJc4DdoW
 SilUGw5J33tpqZN8rXp0iYYdLZSwk25ywiWzBrJx/8FIOBFkbRq7Yk5RG/qh79Vfdgl//aw==
X-Gm-Gg: ASbGncvZgbWfJjojrZufr3bgpMS0dPJYw6ahXRUFehQFQumdgvn3jCS5/zZ16S7nbjq
 OTRqQLMnrKOoFBihbLJi/WB3ICmxcCVoxJjZ9bTt4O6QVoO+rOkK2DAV9CDvkvdt80GqPWsWutD
 iXpz+2ZXrKquxJvSMc8sz1MKAY66tWmcXIvtzB+Gs4CBO0OllaiysM9npaqxbT2jqa2QGN/lqEf
 AQzYoPxq8w1C/drDNQ6dMVnfWQSVZtkmjy9wzKH0mW3VSj3zj0F2i/gvQ9kVA3VFXDLeefITuv1
 83G+s3ihvtgYJSO62nTy3xytL93b0BWDs5R2MfbMEWUoDc1bqVt5X3eTvxHAag==
X-Received: by 2002:a05:600c:8714:b0:43d:77c5:9c1a with SMTP id
 5b1f17b1804b1-454ad9aa31dmr23364275e9.4.1751548289868; 
 Thu, 03 Jul 2025 06:11:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5SFNR5Zf9rfwlZ9GiTIaMDOSoi3V92nbOJeldFmmmP9LlYmjfUdHXZJwP+YDzOSUQtEa90g==
X-Received: by 2002:a05:600c:8714:b0:43d:77c5:9c1a with SMTP id
 5b1f17b1804b1-454ad9aa31dmr23363605e9.4.1751548289212; 
 Thu, 03 Jul 2025 06:11:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bcf35csm26241345e9.20.2025.07.03.06.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 06:11:28 -0700 (PDT)
Message-ID: <4c661415-6f4c-45d7-84bc-210fec176cd0@redhat.com>
Date: Thu, 3 Jul 2025 15:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] drm/ast: Split ast_set_def_ext_reg() by chip
 generation
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250702132431.249329-1-tzimmermann@suse.de>
 <20250702132431.249329-9-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250702132431.249329-9-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j3vEwArLe9_vF80QUbYOPEw0kVOT9-Zpwigug9ySW7U_1751548290
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
> Duplicate ast_set_def_ext_reg() for individual chip generations
> and move call it into per-chip source files. Remove the original
> code. AST2100 and AST2500 reuse the function from earlier chips.
> AST2600 appears to be incorrect as it uses an older function. Keep
> this behavior for now.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2000.c | 32 +++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_2100.c |  2 ++
>   drivers/gpu/drm/ast/ast_2300.c | 33 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_2500.c |  2 ++
>   drivers/gpu/drm/ast/ast_2600.c | 33 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_post.c | 40 ----------------------------------
>   drivers/gpu/drm/ast/ast_post.h |  9 ++++++++
>   7 files changed, 111 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
> index 93f13ecc74dc..41c2aa1e425a 100644
> --- a/drivers/gpu/drm/ast/ast_2000.c
> +++ b/drivers/gpu/drm/ast/ast_2000.c
> @@ -35,6 +35,36 @@
>    * POST
>    */
>   
> +void ast_2000_set_def_ext_reg(struct ast_device *ast)
> +{
> +	static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
> +	u8 i, index, reg;
> +	const u8 *ext_reg_info;
> +
> +	/* reset scratch */
> +	for (i = 0x81; i <= 0x9f; i++)
> +		ast_set_index_reg(ast, AST_IO_VGACRI, i, 0x00);
> +
> +	ext_reg_info = extreginfo;
> +	index = 0xa0;
> +	while (*ext_reg_info != 0xff) {
> +		ast_set_index_reg_mask(ast, AST_IO_VGACRI, index, 0x00, *ext_reg_info);
> +		index++;
> +		ext_reg_info++;
> +	}
> +
> +	/* disable standard IO/MEM decode if secondary */
> +	/* ast_set_index_reg-mask(ast, AST_IO_VGACRI, 0xa1, 0xff, 0x3); */
> +
> +	/* Set Ext. Default */
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x8c, 0x00, 0x01);
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0x00, 0x00);
> +
> +	/* Enable RAMDAC for A1 */
> +	reg = 0x04;
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
> +}
> +
>   static const struct ast_dramstruct ast2000_dram_table_data[] = {
>   	{ 0x0108, 0x00000000 },
>   	{ 0x0120, 0x00004a21 },
> @@ -104,6 +134,8 @@ static void ast_post_chip_2000(struct ast_device *ast)
>   
>   int ast_2000_post(struct ast_device *ast)
>   {
> +	ast_2000_set_def_ext_reg(ast);
> +
>   	if (ast->config_mode == ast_use_p2a) {
>   		ast_post_chip_2000(ast);
>   	} else {
> diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
> index 1cabac647584..477ee15eff5d 100644
> --- a/drivers/gpu/drm/ast/ast_2100.c
> +++ b/drivers/gpu/drm/ast/ast_2100.c
> @@ -333,6 +333,8 @@ static void ast_post_chip_2100(struct ast_device *ast)
>   
>   int ast_2100_post(struct ast_device *ast)
>   {
> +	ast_2000_set_def_ext_reg(ast);
> +
>   	if (ast->config_mode == ast_use_p2a) {
>   		ast_post_chip_2100(ast);
>   	} else {
> diff --git a/drivers/gpu/drm/ast/ast_2300.c b/drivers/gpu/drm/ast/ast_2300.c
> index 7a2c3fde09d2..dc2a32244689 100644
> --- a/drivers/gpu/drm/ast/ast_2300.c
> +++ b/drivers/gpu/drm/ast/ast_2300.c
> @@ -35,6 +35,37 @@
>    *  POST
>    */
>   
> +void ast_2300_set_def_ext_reg(struct ast_device *ast)
> +{
> +	static const u8 extreginfo[] = { 0x0f, 0x04, 0x1f, 0xff };
> +	u8 i, index, reg;
> +	const u8 *ext_reg_info;
> +
> +	/* reset scratch */
> +	for (i = 0x81; i <= 0x9f; i++)
> +		ast_set_index_reg(ast, AST_IO_VGACRI, i, 0x00);
> +
> +	ext_reg_info = extreginfo;
> +	index = 0xa0;
> +	while (*ext_reg_info != 0xff) {
> +		ast_set_index_reg_mask(ast, AST_IO_VGACRI, index, 0x00, *ext_reg_info);
> +		index++;
> +		ext_reg_info++;
> +	}
> +
> +	/* disable standard IO/MEM decode if secondary */
> +	/* ast_set_index_reg-mask(ast, AST_IO_VGACRI, 0xa1, 0xff, 0x3); */
> +
> +	/* Set Ext. Default */
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x8c, 0x00, 0x01);
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0x00, 0x00);
> +
> +	/* Enable RAMDAC for A1 */
> +	reg = 0x04;
> +	reg |= 0x20;
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
> +}
> +
>   /* AST 2300 DRAM settings */
>   #define AST_DDR3 0
>   #define AST_DDR2 1
> @@ -1281,6 +1312,8 @@ static void ast_post_chip_2300(struct ast_device *ast)
>   
>   int ast_2300_post(struct ast_device *ast)
>   {
> +	ast_2300_set_def_ext_reg(ast);
> +
>   	if (ast->config_mode == ast_use_p2a) {
>   		ast_post_chip_2300(ast);
>   		ast_init_3rdtx(ast);
> diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
> index e5b3e0c63222..1e541498ea67 100644
> --- a/drivers/gpu/drm/ast/ast_2500.c
> +++ b/drivers/gpu/drm/ast/ast_2500.c
> @@ -554,6 +554,8 @@ static void ast_post_chip_2500(struct ast_device *ast)
>   
>   int ast_2500_post(struct ast_device *ast)
>   {
> +	ast_2300_set_def_ext_reg(ast);
> +
>   	if (ast->config_mode == ast_use_p2a) {
>   		ast_post_chip_2500(ast);
>   	} else {
> diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
> index 556571efa0b2..f9b96c631d4c 100644
> --- a/drivers/gpu/drm/ast/ast_2600.c
> +++ b/drivers/gpu/drm/ast/ast_2600.c
> @@ -27,15 +27,48 @@
>    */
>   
>   #include "ast_drv.h"
> +#include "ast_post.h"
>   
>   /*
>    * POST
>    */
>   
> +void ast_2600_set_def_ext_reg(struct ast_device *ast)
> +{
> +	static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
> +	u8 i, index, reg;
> +	const u8 *ext_reg_info;
> +
> +	/* reset scratch */
> +	for (i = 0x81; i <= 0x9f; i++)
> +		ast_set_index_reg(ast, AST_IO_VGACRI, i, 0x00);
> +
> +	ext_reg_info = extreginfo;
> +	index = 0xa0;
> +	while (*ext_reg_info != 0xff) {
> +		ast_set_index_reg_mask(ast, AST_IO_VGACRI, index, 0x00, *ext_reg_info);
> +		index++;
> +		ext_reg_info++;
> +	}
> +
> +	/* disable standard IO/MEM decode if secondary */
> +	/* ast_set_index_reg-mask(ast, AST_IO_VGACRI, 0xa1, 0xff, 0x3); */
> +
> +	/* Set Ext. Default */
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x8c, 0x00, 0x01);
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0x00, 0x00);
> +
> +	/* Enable RAMDAC for A1 */
> +	reg = 0x04;
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
> +}
> +
>   int ast_2600_post(struct ast_device *ast)
>   {
>   	int ret;
>   
> +	ast_2600_set_def_ext_reg(ast);
> +
>   	if (ast->tx_chip == AST_TX_ASTDP) {
>   		ret = ast_dp_launch(ast);
>   		if (ret)
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 8e575e713f19..b72914dbed38 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -34,44 +34,6 @@
>   #include "ast_drv.h"
>   #include "ast_post.h"
>   
> -static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
> -static const u8 extreginfo_ast2300[] = { 0x0f, 0x04, 0x1f, 0xff };
> -
> -static void ast_set_def_ext_reg(struct ast_device *ast)
> -{
> -	u8 i, index, reg;
> -	const u8 *ext_reg_info;
> -
> -	/* reset scratch */
> -	for (i = 0x81; i <= 0x9f; i++)
> -		ast_set_index_reg(ast, AST_IO_VGACRI, i, 0x00);
> -
> -	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast))
> -		ext_reg_info = extreginfo_ast2300;
> -	else
> -		ext_reg_info = extreginfo;
> -
> -	index = 0xa0;
> -	while (*ext_reg_info != 0xff) {
> -		ast_set_index_reg_mask(ast, AST_IO_VGACRI, index, 0x00, *ext_reg_info);
> -		index++;
> -		ext_reg_info++;
> -	}
> -
> -	/* disable standard IO/MEM decode if secondary */
> -	/* ast_set_index_reg-mask(ast, AST_IO_VGACRI, 0xa1, 0xff, 0x3); */
> -
> -	/* Set Ext. Default */
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x8c, 0x00, 0x01);
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0x00, 0x00);
> -
> -	/* Enable RAMDAC for A1 */
> -	reg = 0x04;
> -	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast))
> -		reg |= 0x20;
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
> -}
> -
>   u32 __ast_mindwm(void __iomem *regs, u32 r)
>   {
>   	u32 data;
> @@ -114,8 +76,6 @@ int ast_post_gpu(struct ast_device *ast)
>   {
>   	int ret;
>   
> -	ast_set_def_ext_reg(ast);
> -
>   	if (AST_GEN(ast) >= 7) {
>   		ret = ast_2600_post(ast);
>   		if (ret)
> diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
> index 44136856952f..9f3108ddeae8 100644
> --- a/drivers/gpu/drm/ast/ast_post.h
> +++ b/drivers/gpu/drm/ast/ast_post.h
> @@ -41,4 +41,13 @@ void __ast_moutdwm(void __iomem *regs, u32 r, u32 v);
>   bool mmc_test(struct ast_device *ast, u32 datagen, u8 test_ctl);
>   bool mmc_test_burst(struct ast_device *ast, u32 datagen);
>   
> +/* ast_2000.c */
> +void ast_2000_set_def_ext_reg(struct ast_device *ast);
> +
> +/* ast_2300.c */
> +void ast_2300_set_def_ext_reg(struct ast_device *ast);
> +
> +/* ast_2600.c */
> +void ast_2600_set_def_ext_reg(struct ast_device *ast);
> +
>   #endif

