Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5557391BBFF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBA610EC00;
	Fri, 28 Jun 2024 09:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JbD/J0Hd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0261C10EC00
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719568658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=laKyQjzuGJs9/h1VzsRIrHIKRkUaSMK0hzZlfsvi8kk=;
 b=JbD/J0HdqP7VLC27ycNWwHpEzWddkdxaWMsWJ+iV1RlgzdAXUby1oE6UBgAgT2oXKY7uqX
 6E2Wx4cCvgEpLPJdZv/5v/OSkecmZXvaBBqoAlUs7WtnfkY59QHTD1xJyHz2V507KK4qxn
 sssNWQ2hx7w750BCcRj7Kpp7Lm2i5Zw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-JqlpcOgoNi2Y9dG8vtfHXw-1; Fri, 28 Jun 2024 05:57:36 -0400
X-MC-Unique: JqlpcOgoNi2Y9dG8vtfHXw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42490ae735dso5131875e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719568655; x=1720173455;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=laKyQjzuGJs9/h1VzsRIrHIKRkUaSMK0hzZlfsvi8kk=;
 b=K8cuJoxxskh0r7sC06SLgJVA7gLniCuVkwXVnMngTy8DOaQfLQerQWI3fY6U/hCHT0
 dU6zfzWle/MXimAvRMv9yF2LYICoHEpjDarvzIFUdmSPXtO/6dEG5iZUDG0v/0o4YL97
 lmFq32GZgo88hbyrsG4uGqfRWCnLELEk4w6WCSZUAxtbnCquKm/3is5TOvg/tsiGCq5p
 Fe9imh4pX4GK2Rbx+6V9KrPsWPAh2v8K5SaymFBR7WK8Zcexs648p9TkTZaeSiO7culi
 cM0vS8E0IvVSE32IgH5ozZsFQ9QG7HtAlvkJgj1xrHhq2NWBZ2PtcjmbG9beMYj1+xaO
 Ua/w==
X-Gm-Message-State: AOJu0YykXmJdn98ej2RdvfIvbPLcEiERipdJRFn6ZFYPBL3EhcvU34UV
 1zeGAqYHRuF6MJUyRWM/Dh3Hb7s8kTAH5LROd9YRC7w4TNY4eh+lslrxxmNTQQ0jLITzC+Mh2Pg
 SWkwrUs8KWcLFbE+GTAQZ5U7ux5i7i+EnSVATyAdJij8WgBbXpDNSxnaNYul65goWGA==
X-Received: by 2002:a05:600c:748:b0:424:a58f:cc9a with SMTP id
 5b1f17b1804b1-424a58fd1dcmr90620235e9.12.1719568655439; 
 Fri, 28 Jun 2024 02:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0Zf0nV5G4jlVBNmIbq9uetxkCuXUbDcI2OR6bR6eknzBuKzqKX2Zn6nLkNpvQTI7BD1zf+A==
X-Received: by 2002:a05:600c:748:b0:424:a58f:cc9a with SMTP id
 5b1f17b1804b1-424a58fd1dcmr90620105e9.12.1719568655221; 
 Fri, 28 Jun 2024 02:57:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c172csm27185445e9.41.2024.06.28.02.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:57:34 -0700 (PDT)
Message-ID: <d94e6a1c-2b17-467b-afee-1f446e8cf1a1@redhat.com>
Date: Fri, 28 Jun 2024 11:57:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/ast: Use drm_atomic_helper_commit_tail() helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <20240627153638.8765-1-tzimmermann@suse.de>
 <20240627153638.8765-9-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240627153638.8765-9-tzimmermann@suse.de>
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



On 27/06/2024 17:27, Thomas Zimmermann wrote:
> Ast has no special requirements for runtime power management. So
> replace drm_atomic_helper_commit_tail_rpm() with the regular helper
> drm_atomic_helper_commit_tail().

Thanks, it looks good te me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index d130c96edf35..dc8f639e82fd 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1865,7 +1865,7 @@ static void ast_mode_config_helper_atomic_commit_tail(struct drm_atomic_state *s
>   	 * the I/O-register lock. Released in atomic_flush().
>   	 */
>   	mutex_lock(&ast->modeset_lock);
> -	drm_atomic_helper_commit_tail_rpm(state);
> +	drm_atomic_helper_commit_tail(state);
>   	mutex_unlock(&ast->modeset_lock);
>   }
>   

