Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369CE97A2D9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A974D10E367;
	Mon, 16 Sep 2024 13:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AefOEein";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F7710E368
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726492892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owYKdGHBTmM1pDuGG7MXjVqzNLJMFx1ucn2pXmmitXc=;
 b=AefOEein3bW+MfEs3buBs4tTbyaM9cl/v4juyHx4KsRq70VEMjIYFqYTSOzyLS7lnfQdpR
 mTBO3MPuq4L1/DaoTSJEvalFWnDq4NBAKOAOJFvMf57DwZF2vafXGmXmp38zn1Z2ABilaz
 sZ1l9BznS53+mfqGIIuUvkZjav2elog=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-vDLdgIkfPeO120kJXUhR3Q-1; Mon, 16 Sep 2024 09:21:31 -0400
X-MC-Unique: vDLdgIkfPeO120kJXUhR3Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374bfc57e2aso2308196f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 06:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726492890; x=1727097690;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=owYKdGHBTmM1pDuGG7MXjVqzNLJMFx1ucn2pXmmitXc=;
 b=kP6DjPT4FuQOVQoSzaVYZNB/8YD8jfTticr6Ot8pWukI0V64x6vx8ZazyA3F30iw7a
 oAz4GdUD+alp14LLec/0t4i25zuwMoRj1tVeoVemxHcICJRnIU5n+mgPK8r4dlJPEHXs
 0+quLRlXR/lG6YFmOY4HjL09UBadMVPjoblic2fwfoF+XV0093xqRFj3cVBd1z0YNzaY
 6WXkRdPgA82U9ZIr/no8aFbR84+s3YSXeDoNknk5nBb9tW4tivgqeORru0bGsaLVmrf6
 jF3LChqs2jFfvQo9Ne7aS4RAPiKmtKLtfgA0b4FgJuWsSd87X0sQJH1doHtiZMgVDg08
 UPbQ==
X-Gm-Message-State: AOJu0YyqARjMsn3rZjOedfzgar/Bg5y9X2lrQ4XQzbyGytO30t8LC/ko
 x35wecExzJpzn68uD0jnNRYonn83B6EvPTXF1ruHcEw8mvHSRkHSymvRL+foNOvZC4LrpYkIC4c
 2ag3Q9zmnReU1G7nG5gxLofIS1FhyGGlhMGqdEGzYacqlefhF/7t+n1zQENyVZC5iWg==
X-Received: by 2002:adf:a387:0:b0:374:c3a3:1f4f with SMTP id
 ffacd0b85a97d-378c2cfeac4mr7401332f8f.24.1726492889989; 
 Mon, 16 Sep 2024 06:21:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+TPe7ojQg6VjE+GD4v9sZeanBoQ9XLkh9T2fjzCsUXGYJe2yHy2Hs0vff0gEcL5Gh/XT/rA==
X-Received: by 2002:adf:a387:0:b0:374:c3a3:1f4f with SMTP id
 ffacd0b85a97d-378c2cfeac4mr7401310f8f.24.1726492889532; 
 Mon, 16 Sep 2024 06:21:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73e8364sm7231772f8f.43.2024.09.16.06.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 06:21:29 -0700 (PDT)
Message-ID: <db0665e4-5efd-4809-b5b2-652e6421636e@redhat.com>
Date: Mon, 16 Sep 2024 15:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/ast: Warn about unsupported TX chips
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240916082920.56234-1-tzimmermann@suse.de>
 <20240916082920.56234-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240916082920.56234-4-tzimmermann@suse.de>
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
> A number of TX chips are listed in VGACRD1, but not supported by
> the ast driver. Whether any existing product uses such a chip is
> unknown. Warn if the driver encounters any. We can then add
> support as necessary.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 7289bdc6066e..bc37c65305d4 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -76,7 +76,22 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	};
>   
>   	struct drm_device *dev = &ast->base;
> -	u8 jreg;
> +	u8 jreg, vgacrd1;
> +
> +	/*
> +	 * Several of the listed TX chips are not explicitly supported
> +	 * by the ast driver. If these exist in real-world devices, they
> +	 * are most likely reported as VGA or SIL164 outputs. We warn here
> +	 * to get bug reports for these devices. If none come in for some
> +	 * time, we can begin to fail device probing on these values.
> +	 */
> +	vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, AST_IO_VGACRD1_TX_TYPE_MASK);
> +	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_ITE66121_VBIOS,
> +		 "ITE IT66121 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
> +	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_CH7003_VBIOS,
> +		 "Chrontel CH7003 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
> +	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_ANX9807_VBIOS,
> +		 "Analogix ANX9807 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
>   
>   	/* Check 3rd Tx option (digital output afaik) */
>   	ast->tx_chip = AST_TX_NONE;

