Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6F97A2D6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F3310E366;
	Mon, 16 Sep 2024 13:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VksvoHh4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CD610E366
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726492863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9pV0rKFN0iFpCLHaJsOPUVk9y+CblST8ZN5ajT39QZQ=;
 b=VksvoHh40HrL4u7UxmtbrNtJ66LqPup3VVgomP1ekYsqW8SyV3Qt1BEtx2026NSdjBSFIk
 F3kBDYWCpxU6TBawPat7rfqq6cuMZwdSaWTR+Iez/eBPKHCyFlx2yjnhzpfjMPZcbnu4s/
 kHkKhHbwNmLUXQrWHhIVp2p+Vx0QHAA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-Qfbpd_-HO1ud-cTf8AyEsg-1; Mon, 16 Sep 2024 09:21:01 -0400
X-MC-Unique: Qfbpd_-HO1ud-cTf8AyEsg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374b9a8512dso2547172f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 06:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726492860; x=1727097660;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9pV0rKFN0iFpCLHaJsOPUVk9y+CblST8ZN5ajT39QZQ=;
 b=I8/Ewc7t1VhAMJEyIwAbQ9ApdjgIs362pSx5DZ/4RKuxCtNOtkfQ+RTVV5LzZR1AiV
 yWWy8PBWVE5I9GCYHfSx31qHcZLGsBiOOQNwhgRIsKr0Y2fChVKKw16qCaYVjyr/8U/t
 IOFv6TCZuwmmaN0Lq1SLST0X8f1t/AWoGGrd5Bwoy/ep9I3bAjBC0bOlyt/WA3pWvm3I
 9ZJ6fl+SnhRAca2hhBoYJVDqc7c2FObI5Z4ujC2/Oh7MFtGeWQ3e675/m62Sp3aQPa+k
 x8ByOgWJlHLYS+ROjTp2/PgjacGDGh4I/0a31xMrbITBmWS+oo9AZVhtviKq9wMzV175
 nJlA==
X-Gm-Message-State: AOJu0YxfwAUucltgMTwyU8gUKycMyrxagKQ3L47ffvQ7wfiSd7H+Mglo
 BBa7dCWzg+WQKaR7gYLGpnSv/A3bTyRb4cMLsCOd+LhBSpNw9UVBLa4qYJtGmmGj5iUD1a48NBz
 DSsA1zDMzoxIfucZUZfr27q1eFBy8oIqaLPEUh/+Nfy6iIS+c9gISGKlmViCm6jLUXxSt4foLVw
 ==
X-Received: by 2002:adf:a356:0:b0:377:284d:9946 with SMTP id
 ffacd0b85a97d-378c2d031ebmr8105200f8f.30.1726492860232; 
 Mon, 16 Sep 2024 06:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyOxIV34dmdRMkTdYfGTTw3QTlpytLBKBVBN+aDdUpJ6ZUttNMs0jex/pzSUkAYp1OXfdgbg==
X-Received: by 2002:adf:a356:0:b0:377:284d:9946 with SMTP id
 ffacd0b85a97d-378c2d031ebmr8105180f8f.30.1726492859621; 
 Mon, 16 Sep 2024 06:20:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73e862esm7331042f8f.45.2024.09.16.06.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 06:20:59 -0700 (PDT)
Message-ID: <85303bc1-c66e-40da-937a-9f60740e09dd@redhat.com>
Date: Mon, 16 Sep 2024 15:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/ast: Use TX-chip register constants
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240916082920.56234-1-tzimmermann@suse.de>
 <20240916082920.56234-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240916082920.56234-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
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

On 16/09/2024 10:25, Thomas Zimmermann wrote:
> Replace magic values with named constants when reading the TX chip
> from VGACRD1.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp501.c | 13 +++++++------
>   drivers/gpu/drm/ast/ast_main.c  |  9 +++++----
>   drivers/gpu/drm/ast/ast_reg.h   |  2 +-
>   3 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index e5553334bfde..9e19d8c17730 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -444,18 +444,19 @@ static void ast_init_analog(struct ast_device *ast)
>   
>   void ast_init_3rdtx(struct ast_device *ast)
>   {
> -	u8 jreg;
> +	u8 vgacrd1;
>   
>   	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast)) {
> -		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
> -		switch (jreg & 0x0e) {
> -		case 0x04:
> +		vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
> +						 AST_IO_VGACRD1_TX_TYPE_MASK);
> +		switch (vgacrd1) {
> +		case AST_IO_VGACRD1_TX_SIL164_VBIOS:
>   			ast_init_dvo(ast);
>   			break;
> -		case 0x08:
> +		case AST_IO_VGACRD1_TX_DP501_VBIOS:
>   			ast_launch_m68k(ast);
>   			break;
> -		case 0x0c:
> +		case AST_IO_VGACRD1_TX_FW_EMBEDDED_FW:
>   			ast_init_dvo(ast);
>   			break;
>   		default:
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index d0e4f0dc9234..7289bdc6066e 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -101,12 +101,13 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   		 * the SOC scratch register #1 bits 11:8 (interestingly marked
>   		 * as "reserved" in the spec)
>   		 */
> -		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
> +		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
> +					      AST_IO_VGACRD1_TX_TYPE_MASK);
>   		switch (jreg) {
> -		case 0x04:
> +		case AST_IO_VGACRD1_TX_SIL164_VBIOS:
>   			ast->tx_chip = AST_TX_SIL164;
>   			break;
> -		case 0x08:
> +		case AST_IO_VGACRD1_TX_DP501_VBIOS:
>   			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
>   			if (ast->dp501_fw_addr) {
>   				/* backup firmware */
> @@ -116,7 +117,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   				}
>   			}
>   			fallthrough;
> -		case 0x0c:
> +		case AST_IO_VGACRD1_TX_FW_EMBEDDED_FW:
>   			ast->tx_chip = AST_TX_DP501;
>   		}
>   	} else if (IS_AST_GEN7(ast)) {
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index daa5d3a9e6a1..2aadf07d135a 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -46,7 +46,7 @@
>   #define AST_IO_VGACRD1_TX_CH7003_VBIOS		0x06
>   #define AST_IO_VGACRD1_TX_DP501_VBIOS		0x08
>   #define AST_IO_VGACRD1_TX_ANX9807_VBIOS		0x0a
> -#define AST_IO_VGACRD1_TX_FW_EMBEDDED_FW	0x0c
> +#define AST_IO_VGACRD1_TX_FW_EMBEDDED_FW	0x0c /* special case of DP501 */
>   #define AST_IO_VGACRD1_TX_ASTDP			0x0e
>   
>   #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)

