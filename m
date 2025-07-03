Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A449AF7023
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 12:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C950C10E180;
	Thu,  3 Jul 2025 10:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cL7GnRp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1D10E180
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751538514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LaAcFiW69r3gu0tmoazv0O8QwVc2WIH1/74BxY5Iwis=;
 b=cL7GnRp/H0u9zjCQRlNr8Uk8KuzFMhSF7dMGZfXbnynlkGL7mHsMdsjCV3UJcAe886Z6UW
 OGeNmtmXjI5G8Z/dFjVaOrLkVsycQ16ukIkr3TckrgoLfZKPmJzNnh5sLJ8nJnPcEHhT0m
 /fo6h/yYlaS4qMowHOPcNgzk8zWVFPA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-PiCUYUxlNjSnuc4FsoFC9A-1; Thu, 03 Jul 2025 06:28:32 -0400
X-MC-Unique: PiCUYUxlNjSnuc4FsoFC9A-1
X-Mimecast-MFC-AGG-ID: PiCUYUxlNjSnuc4FsoFC9A_1751538512
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45311704cdbso35536845e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 03:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538511; x=1752143311;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LaAcFiW69r3gu0tmoazv0O8QwVc2WIH1/74BxY5Iwis=;
 b=Wvmf7fGwp3gLUqy45EKg22yys+ISxXK9GWtFHgOzmgMN27zfZnn1HfcK2c1BpQwjqF
 jEd2s3Bq3rPw5n3McjYoFNgGvB9q/ykkLp5V/jmgScRrgpSgMPFieF8cG4zc44WOZp+o
 B/rk1JuQgmicaE/LASob140ZNZXSlsOmJScMh2FJkrQM1Bd9sykYtslxsLAQkFd9TE//
 T9BAgtTGwsmdqZZ7P/vpDXkZ/kMPn2EydrStN+zcfft34T6ixJ8+MLP5tb3M4NjdFb38
 O5n5Io1leF8E9xPoCHbnRrPRiQpzLN/+d5Qd7ugxigzVBionZCU4OufyauvuGrH5tIZr
 o3CQ==
X-Gm-Message-State: AOJu0YwRcRIWZeAFeTagK1UhW20qDfX9iHJ1Gg7Uh58eD5uuHY2ckwZ/
 RP1IurG+q09sYch0OIEPbkCpEJ7res7lESeiBskMjbut+QSSnI/ZKfk9I7yZqegVGJ1Mp9Qkoz4
 n0PNd6dA/YyqLD29SZ06aHEcmCfOCltUAG1phUDHxYKmgB0UccQw7Zrf1NdH5mASJeKcidg==
X-Gm-Gg: ASbGncsd98GF9F4mf75ImGuIPOK6mhv+f5kVbVvf6bwLHJGjyUxf50TQgCUjv+Wvg1U
 //LcwMQEsDWDnAOu/LHnSru1+w5qe5MUStD8HxEBrCZi5lZ7r8PA5gQkL4cswQDQ4+0pry9EPqo
 GWHo7pwIa5RsJ+5cW4abU6dUFsLfu9morr4BtBpGyM5vWH/joq6VQpyB2oEpU5fbBRq3BOOBkb4
 +SwvnWYzdvH38nSUsVsoK7O79XMA7Xl+PeqRoKto8/Ek4waPUnKfcfz0yBVvMqGTxzRsYvPcdGK
 Xkq9yewpS9nAUJDh9LbPJvWwPH+JRsjZYC40hGcMUel2kl0U1GV/5bJyqWzhiw==
X-Received: by 2002:a05:6000:2509:b0:3a4:f7ae:77ca with SMTP id
 ffacd0b85a97d-3b1fdc20aa1mr5041074f8f.3.1751538511453; 
 Thu, 03 Jul 2025 03:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3KlWSyz2+pP4BD7fFEtOiIOGcNVK4ILkaYVC6Z8liUuP1VU/dAuZyYZVSJ6e4NDBQ+UZYwA==
X-Received: by 2002:a05:6000:2509:b0:3a4:f7ae:77ca with SMTP id
 ffacd0b85a97d-3b1fdc20aa1mr5041001f8f.3.1751538510250; 
 Thu, 03 Jul 2025 03:28:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52a26sm18474636f8f.51.2025.07.03.03.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 03:28:29 -0700 (PDT)
Message-ID: <e1784cd6-2bfa-4939-ab8f-fd81b46dc21b@redhat.com>
Date: Thu, 3 Jul 2025 12:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/ast: Move Gen7+ POST code to separate source
 file
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250702132431.249329-1-tzimmermann@suse.de>
 <20250702132431.249329-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250702132431.249329-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sxEr3Oo7UAr7oDMHF6ApxhOpUU2w113JcymWV-KUFDU_1751538512
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
> Move POST code for Gen7+ to separate source file and hide it in
> ast_2600_post(). There's not much going on here except for enabling
> the DP transmitter chip.

Thanks, it looks good to me.

Only a cosmetic comment below.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/Makefile   |  1 +
>   drivers/gpu/drm/ast/ast_2600.c | 46 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_drv.h  |  3 +++
>   drivers/gpu/drm/ast/ast_post.c |  8 +++---
>   4 files changed, 53 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/gpu/drm/ast/ast_2600.c
> 
> diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
> index 8d09ba5d5889..0f09e0fa741b 100644
> --- a/drivers/gpu/drm/ast/Makefile
> +++ b/drivers/gpu/drm/ast/Makefile
> @@ -4,6 +4,7 @@
>   # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>   
>   ast-y := \
> +	ast_2600.o \
>   	ast_cursor.o \
>   	ast_ddc.o \
>   	ast_dp501.o \
> diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
> new file mode 100644
> index 000000000000..556571efa0b2
> --- /dev/null
> +++ b/drivers/gpu/drm/ast/ast_2600.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2012 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portions
> + * of the Software.
> + */
> +/*
> + * Authors: Dave Airlie <airlied@redhat.com>
> + */
> +
> +#include "ast_drv.h"
> +
> +/*
> + * POST
> + */
> +
> +int ast_2600_post(struct ast_device *ast)
> +{
> +	int ret;
> +
> +	if (ast->tx_chip == AST_TX_ASTDP) {
> +		ret = ast_dp_launch(ast);
> +		if (ret)
> +			return ret;

That can be simplified, as the ret variable isn't useful.

if (ast->tx_chip == AST_TX_ASTDP)
	return ast_dp_launch(ast0);

> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 2ee402096cd9..570c2fe98b58 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -417,6 +417,9 @@ struct ast_crtc_state {
>   
>   int ast_mm_init(struct ast_device *ast);
>   
> +/* ast_2600.c */
> +int ast_2600_post(struct ast_device *ast);
> +
>   /* ast post */
>   int ast_post_gpu(struct ast_device *ast);
>   u32 ast_mindwm(struct ast_device *ast, u32 r);
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 36542d266f9c..03a7367bdc71 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -348,11 +348,9 @@ int ast_post_gpu(struct ast_device *ast)
>   	ast_set_def_ext_reg(ast);
>   
>   	if (AST_GEN(ast) >= 7) {
> -		if (ast->tx_chip == AST_TX_ASTDP) {
> -			ret = ast_dp_launch(ast);
> -			if (ret)
> -				return ret;
> -		}
> +		ret = ast_2600_post(ast);
> +		if (ret)
> +			return ret;
>   	} else if (AST_GEN(ast) >= 6) {
>   		if (ast->config_mode == ast_use_p2a) {
>   			ast_post_chip_2500(ast);

