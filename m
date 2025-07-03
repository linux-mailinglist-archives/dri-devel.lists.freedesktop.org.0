Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC652AF752D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 15:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D5F10E83E;
	Thu,  3 Jul 2025 13:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EzSiwcPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BB410E83D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 13:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751548379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ql393oxahwZs6aNpTOOJa//IsCzLS45D0pHw6zfBLSk=;
 b=EzSiwcPGpBnS35ACHvAAnRwZ3a+1P8XbhExCkk6X49ohua3QtoVGSANh9yOYiMa86mDTrM
 AcGvV5oKRHPFhu1TkSuPw5qIuQUTJFQA3KyPCxV1QI8XiNjFT1+GdNC25zaM4cpmXzF64L
 KmV6m/37A46j9hVtDBEWC8D8TCeCPrk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-BSUaVgH3PFuO1pPqGF1vyA-1; Thu, 03 Jul 2025 09:12:58 -0400
X-MC-Unique: BSUaVgH3PFuO1pPqGF1vyA-1
X-Mimecast-MFC-AGG-ID: BSUaVgH3PFuO1pPqGF1vyA_1751548377
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-450df53d461so45793685e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 06:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751548377; x=1752153177;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ql393oxahwZs6aNpTOOJa//IsCzLS45D0pHw6zfBLSk=;
 b=f6IzKPVk+9rkoXrkmH2bMW1XP3W95OXR+II/qlu+0EGFlmuOuGadQgCpq9FSWLBr9m
 pFDs575bc0uQVMLoxtT2pi1k6ReaaheLx959Smg/TLrvmbD477I62dPa+IFMOtRBMSfw
 69Nh/uqqvZCie5Kf9bcG5NDgaanxBBFHW2N+VXTPHvif+kmUOIJAvU1dDQKfoKHa5EyV
 SOc6oePKw5UPJQcOoZZlW/nbvCfKJhomFvro/5UZPSdw6BWt15eUBqpd09okYas0qNYW
 GnEtZNIMsp0xkj4+A9Cj8UOFFRvGS8GxmTfhijMHQl3a7pwBJb1ARDaKmDye7YT6kon+
 mvtw==
X-Gm-Message-State: AOJu0Yy9zMIxZMoyW40ALvybQUFvWYbM9aXuXxIQzG/dJWQlFS1AE8wi
 XvdVaPnHPInBzJl67ROWuCjoL4/p38Sy7qc0ediXtRrpI4UDAMRxgt+56xL6zL+Y+mltH8FKxWo
 TyDOUYbluEu0gtlLFI8DOJ/9VCzrMqxdxzU2HL48ZgxHofC1fB9r//RYitRo9hCcZwqEeMQ==
X-Gm-Gg: ASbGncv7KSso4Gd2KtnDpo/UAyJ7lWKG1pKrx0C7/Q35ft4KLkWgJwmUf61MonFFMnU
 Al7KoBnXD/hVgBHE01cUbsJ26iHcCBVXFVso3QOmX/s51wXuc2nG3QzqRGju5we4aLai+Pjd28d
 haR/Fx5eyqBStCedsGVoMdXEN2zJLSGWeZMkKSL7zHS97P9PFwwJkoNj4s07Qh/v4i6rKCum2OB
 OhEi30DBTgz8tOsIEX2u3HZ1W5fewtDWbBSA4oVlDWXLLZmeoh0WqpgTL5N/dvdezeB/reScqFM
 o0ncckHAdukC81k/zZvB9tihxTcBGULK6mXA7EJasF55TTfCGC/VPVbjucfuVg==
X-Received: by 2002:a05:600c:83c3:b0:43d:1b74:e89a with SMTP id
 5b1f17b1804b1-454acf65f0emr26091565e9.9.1751548376452; 
 Thu, 03 Jul 2025 06:12:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOdBD+pGPmHxjkoWP32N6QNALayz2zNQjGm5wL52nix8nKtcMAvzzCNr6d/KcjFBwtN76zsA==
X-Received: by 2002:a05:600c:83c3:b0:43d:1b74:e89a with SMTP id
 5b1f17b1804b1-454acf65f0emr26091215e9.9.1751548375997; 
 Thu, 03 Jul 2025 06:12:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a98ebe2asm27381265e9.0.2025.07.03.06.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 06:12:55 -0700 (PDT)
Message-ID: <2740e707-17bb-41de-9583-93166e82b0fe@redhat.com>
Date: Thu, 3 Jul 2025 15:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] drm/ast: Gen7: Switch default registers to gen4+
 state
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250702132431.249329-1-tzimmermann@suse.de>
 <20250702132431.249329-11-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250702132431.249329-11-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5mMES0xKtP2_hFBZcoAwWlhtv7RqjzWdmjKY3WCfdwc_1751548377
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
> Change the default register settings for Gen7 to mach Gen4 and
> later. Gen7 currently uses the settings for Gen1, which is most
> likely incorrect.
> 
> Using Gen4+ settings enables E2M linear-access modes in VGACRA2.
> It appears to be related to the chip's PCIE2MBOX feature, which
> is unused.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2600.c | 33 +--------------------------------
>   drivers/gpu/drm/ast/ast_post.h |  3 ---
>   2 files changed, 1 insertion(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
> index a426a981949e..3a3ef21684ad 100644
> --- a/drivers/gpu/drm/ast/ast_2600.c
> +++ b/drivers/gpu/drm/ast/ast_2600.c
> @@ -33,42 +33,11 @@
>    * POST
>    */
>   
> -void ast_2600_set_def_ext_reg(struct ast_device *ast)
> -{
> -	static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
> -	u8 i, index, reg;
> -	const u8 *ext_reg_info;
> -
> -	/* reset scratch */
> -	for (i = 0x81; i <= 0x9f; i++)
> -		ast_set_index_reg(ast, AST_IO_VGACRI, i, 0x00);
> -
> -	ext_reg_info = extreginfo;
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
> -	reg |= 0x20;
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
> -}
> -
>   int ast_2600_post(struct ast_device *ast)
>   {
>   	int ret;
>   
> -	ast_2600_set_def_ext_reg(ast);
> +	ast_2300_set_def_ext_reg(ast);
>   
>   	if (ast->tx_chip == AST_TX_ASTDP) {
>   		ret = ast_dp_launch(ast);
> diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
> index 9f3108ddeae8..aa5d247bebe8 100644
> --- a/drivers/gpu/drm/ast/ast_post.h
> +++ b/drivers/gpu/drm/ast/ast_post.h
> @@ -47,7 +47,4 @@ void ast_2000_set_def_ext_reg(struct ast_device *ast);
>   /* ast_2300.c */
>   void ast_2300_set_def_ext_reg(struct ast_device *ast);
>   
> -/* ast_2600.c */
> -void ast_2600_set_def_ext_reg(struct ast_device *ast);
> -
>   #endif

