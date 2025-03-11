Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E27FA5C205
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD02E10E5B0;
	Tue, 11 Mar 2025 13:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hEG5YaSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72A810E5B0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741698634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=944D4n0vLRwcaE2Um6mIWiTCltJjVUqV1XQGRMw9gwM=;
 b=hEG5YaSap2TzI8kVjgZSjbvs3srp79r/HTuu36PTvT5m5ffA2TenQFHAjAZzF/r2OOcTvh
 5//QC3kKegqlFsDmbfBOjjvynd+6qX1uZu9sQT0IAwChyCu5/DYCiH+kxzIccXcrUFSn9b
 xnq05rtP9H4ox5xN+BD7AHFAiKNjTag=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-XG2yLDfZOmaB4Qf2cTAmNw-1; Tue, 11 Mar 2025 09:10:33 -0400
X-MC-Unique: XG2yLDfZOmaB4Qf2cTAmNw-1
X-Mimecast-MFC-AGG-ID: XG2yLDfZOmaB4Qf2cTAmNw_1741698632
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf5196c25so12835425e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741698632; x=1742303432;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=944D4n0vLRwcaE2Um6mIWiTCltJjVUqV1XQGRMw9gwM=;
 b=jsiJHawgYKORr0WmXU1wLB0yMJIleKNFYhnynqs2knooNKDml7tWWa628vl0NbVR/7
 eQTBvZmdQ+jvdy/7ZDMK6Kx2Q+kyFlvqVaY4b8oWSXzpMVAosOv4xafd148ggTUPwBtO
 BzVtOe9/nFWVGuSLvwtcDcvFJfUcKuCSqLZ0lexCJvuRlHTMpRUu37r22tpiIHcPK8th
 2Y8ApHHRF+uhVbOKShXzeOYsDYgKHJ9hhDPPJcHXOLRFHemRzMcZwOgEwsmTkFSJry15
 MN2i9qtRnKOi601+tIR0jSsugiYQZH8mSmuNhh4KrKrFm1c/sXb+UrWLA559tKZVHFy3
 4Jqw==
X-Gm-Message-State: AOJu0Yxr6rzIzM8ZouYh8DGOzYmVIhtOLS1ylbax8qNsYQmzsc0jG3+U
 dxaKWxjotGzOkgvz7smvIovJQN2TebZuKwYZ2Quo8hnKXMHhMEtSi18GJNV88kUZLT3nkXXKRBV
 kWITURepo/2nHS8MOSKcKHlT/M+I8dZ4LNg4sbiwAsAoZrPAw40rt5oNIB6tv1Y51TQ==
X-Gm-Gg: ASbGncugEzNg1EbdbHcWqTl4C6k3T2cQbveC8fb0djLNpYe2/Cpxa/vHHskc/2Hk01f
 sTGNrVfIT9jlqbaoEr1RLyl6fhtq7Cq/Zu9iK/XnUoaqEGGDSmk2jtPodwnSr+saKcs+BcjPRBk
 pj4qFSpEV3VIywVoAYEFDT3psBukGkJzt82En2hGuW2p+EitYAELQ0nZz7xSHVzkFMYrsQLUn5M
 1iZH6Yx/lASwmn9ItCLzHlhwE7gU6HECoZuBn/U/Piu5vGDD65HH1SZx89PqtgL9s9gixu7n0KH
 fudi69i44TwEN9YLbAMm/YFgW7s5rsfU/JiWTTX2/1DxiuYIPXq8YKc=
X-Received: by 2002:a5d:64cd:0:b0:390:f2f1:2a17 with SMTP id
 ffacd0b85a97d-39132da9d2amr14804260f8f.53.1741698632362; 
 Tue, 11 Mar 2025 06:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjqdBYcmOa91dqLDKgZcrN7Q9VYgkpKysNMjuSskaRC2HxxBOLnLaXa+UlMlxezDWhOWh21w==
X-Received: by 2002:a5d:64cd:0:b0:390:f2f1:2a17 with SMTP id
 ffacd0b85a97d-39132da9d2amr14804231f8f.53.1741698631926; 
 Tue, 11 Mar 2025 06:10:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cfcbdd0a7sm55255245e9.11.2025.03.11.06.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:10:31 -0700 (PDT)
Message-ID: <c83563fd-3260-479c-a6fb-40e5dbbd1183@redhat.com>
Date: Tue, 11 Mar 2025 14:10:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/ast: cursor: Drop page alignment
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305163207.267650-1-tzimmermann@suse.de>
 <20250305163207.267650-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250305163207.267650-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HFZDPN7hIL8p-_sWCJJPHCpwmeZHFs3akM0t7nSK3nM_1741698632
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
> The cursor scanout address requires alignment to a multiple of 8,
> but does not require page alignment. Change the offset calculation
> accordingly. Frees up a few more bytes for the primary framebuffer.
> 
The framebuffer is page aligned, so I'm not sure you can use the extra 
bytes.
Otherwise, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_cursor.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index cb0c48d47207..5ee724bfd682 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -58,7 +58,7 @@ long ast_cursor_vram_offset(struct ast_device *ast)
>   	if (size > ast->vram_size)
>   		return -EINVAL;
>   
> -	return PAGE_ALIGN_DOWN(ast->vram_size - size);
> +	return ALIGN_DOWN(ast->vram_size - size, SZ_8);
>   }
>   
>   static u32 ast_cursor_calculate_checksum(const void *src, unsigned int width, unsigned int height)

