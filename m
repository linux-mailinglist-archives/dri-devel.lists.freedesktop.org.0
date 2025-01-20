Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AAEA16AE3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 11:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1281610E3B7;
	Mon, 20 Jan 2025 10:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OQcMCde1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF5B10E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 10:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737369464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+QBiWAB7WXrij1p9KqyzufPbZJkbYwEdq6qWfUV9e4=;
 b=OQcMCde1/Q6CJ0LpwG9EOvf397/iWgq42yhyyiNjOeoRBEetWoSt3oRUMXhhb8iJbB3dBB
 f4lw/mlWJUl+PLh4Hmo3edPU6Su88YRDTIfrs1nVJydBZZIldoBRTI5maomooaI7wJY3ZR
 ljfkSWJKrtH9C+J0pA0OQxY79cccY/k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-MHqnK4BpMs-4Ck4X3TjDEQ-1; Mon, 20 Jan 2025 05:37:39 -0500
X-MC-Unique: MHqnK4BpMs-4Ck4X3TjDEQ-1
X-Mimecast-MFC-AGG-ID: MHqnK4BpMs-4Ck4X3TjDEQ
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-385e49efd59so1844438f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 02:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737369458; x=1737974258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7+QBiWAB7WXrij1p9KqyzufPbZJkbYwEdq6qWfUV9e4=;
 b=mKiT4Q5a2rfg9PBCzd05FfNPlUV+TUHRg3cvlMHWQqfLSQbe6zGXY9rMhE4NSj4c5M
 MCf2IEMRZTq28Y9O/FyRdcmzvO2EN6aKBWV6fLbaMgK2PR3JxiWRBji5crupLG32KYYB
 Hhwlg1tW5XldcV40vaiIQXF9XRa6kbjaSAgX1JiJ9BMjqwGuIUihnK7V2A4bskVHCgvc
 zn8NoF28YYEA993pSKRjgl7QY5dcCeQP5e3xEwVkDLoKhZtwYLLi6dslBKGejWulNiy/
 FgW1czhl+ODDIbdZwaHkPVkvpqSuC18222O0eRORo5SB3caoVr4MqeoDd6idLsPF37ja
 928A==
X-Gm-Message-State: AOJu0YxPOxvjB43J5kDfwEmrdHx6wnsCQLwt1edXpTefZhSBtzxIavD8
 N7aWcvjcpJcF8aJnpyyL+0SfbNRRuQF+0TUB8vHz2Ra+6ltqW2P1ETewm8COGKohvmGZ0EqptQR
 BmwIaGvLMr3LOs3QZOlz4eYbKN/tXtUx6ybH6v9uGE7zTg6KHhrsLkj56aYo4XyKUNg==
X-Gm-Gg: ASbGncsic9FdBquOL4ZThGVIhl8skUxhav3fQkPsTVn/zY0fl9FUd01f0eYYtOzP2eR
 oMsOC7p+jDGTHmMT4XzaJc218YN6AAhA3SZ1s/1oJ4O4xrhkqLEDuXOMpSqHds/UsiN1g1FzSnJ
 SP2h8G7x4gJ5BNP7EN8Gulq3m/CmmZ15jrbwxiU7F6mV04NN8t45B6DFmhi+sXDxuGj0RFA9FSb
 5TyKEvIEaZHIzC1d7kFZLgYesM8/VYbpdJo7GJqwUNNZ0tM2uFf+dghIqK7b2TOzhIiMED2kbB+
 UvzRt93ghReZXnLHFctK+/QlgBGaKXsnqw==
X-Received: by 2002:a5d:5848:0:b0:38b:dbf0:34f2 with SMTP id
 ffacd0b85a97d-38bf59f03c7mr11674219f8f.52.1737369458621; 
 Mon, 20 Jan 2025 02:37:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN0a2G+eBPVD65hV0y8EG0HQ2Nuwb25GP27VK2offsLe9HzRtQocv/maGfVmex7//ZVM6lHA==
X-Received: by 2002:a5d:5848:0:b0:38b:dbf0:34f2 with SMTP id
 ffacd0b85a97d-38bf59f03c7mr11674186f8f.52.1737369458181; 
 Mon, 20 Jan 2025 02:37:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3282a63sm10109522f8f.96.2025.01.20.02.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 02:37:37 -0800 (PST)
Message-ID: <cc444cd2-b6a8-49bd-8487-57c424d2fa5b@redhat.com>
Date: Mon, 20 Jan 2025 11:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/ast: Merge TX-chip detection code for Gen4 and
 later
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250117103450.28692-1-tzimmermann@suse.de>
 <20250117103450.28692-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250117103450.28692-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S00wrobFpVSEZRES5TDJpg8av7KmGenS5C8pb0zizUo_1737369459
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
> Gens 4 to 6 and Gen7 use the same pattern for detecting the installed
> TX chips. Merge the code into a single branch.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 40d3b7770cf18..b0d1b99ed532b 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -110,15 +110,18 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   			if (vgacra3 & AST_IO_VGACRA3_DVO_ENABLED)
>   				ast->tx_chip = AST_TX_SIL164;
>   		}
> -	} else if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
> +	} else {
>   		/*
> -		 * On AST GEN4+, look the configuration set by the SoC in
> +		 * On AST GEN4+, look at the configuration set by the SoC in
>   		 * the SOC scratch register #1 bits 11:8 (interestingly marked
>   		 * as "reserved" in the spec)
>   		 */
>   		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
>   					      AST_IO_VGACRD1_TX_TYPE_MASK);
>   		switch (jreg) {
> +		/*
> +		 * GEN4 to GEN6
> +		 */
>   		case AST_IO_VGACRD1_TX_SIL164_VBIOS:
>   			ast->tx_chip = AST_TX_SIL164;
>   			break;
> @@ -134,11 +137,13 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   			fallthrough;
>   		case AST_IO_VGACRD1_TX_FW_EMBEDDED_FW:
>   			ast->tx_chip = AST_TX_DP501;
> -		}
> -	} else if (IS_AST_GEN7(ast)) {
> -		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, AST_IO_VGACRD1_TX_TYPE_MASK) ==
> -		    AST_IO_VGACRD1_TX_ASTDP) {
> +			break;
> +		/*
> +		 * GEN7+
> +		 */
> +		case AST_IO_VGACRD1_TX_ASTDP:
>   			ast->tx_chip = AST_TX_ASTDP;
> +			break;
>   		}
>   	}
>   

