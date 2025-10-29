Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F435C1DB2E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 00:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4D410E86F;
	Wed, 29 Oct 2025 23:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gOVxPk3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2E910E86F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 23:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761781093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQVXQhmywwNDhXjEHeNci/tD1xAS4rlDBizu8EsOzts=;
 b=gOVxPk3EDZwJ6McBI+ecmDfFjrI+MZHez/jglyUUtCeGtYiWK3KpSTI40DFNX7PnhvfTzr
 oYTOF3OSLq7Em83TQbIYkGoRHojQcfqP8zoRs3yR2M3shVZQ0QX1C4LahaG2yq/RWtVpaP
 wSt3mzqopfVkR9ULdwucxuUjLA+WrBY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-X1i4Cr5sMLm4TvuZRkATQg-1; Wed, 29 Oct 2025 19:38:11 -0400
X-MC-Unique: X1i4Cr5sMLm4TvuZRkATQg-1
X-Mimecast-MFC-AGG-ID: X1i4Cr5sMLm4TvuZRkATQg_1761781090
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-429b7b46eebso91270f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 16:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761781090; x=1762385890;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PQVXQhmywwNDhXjEHeNci/tD1xAS4rlDBizu8EsOzts=;
 b=stVBXoMGY/s1fVs6GRrlvUIy+Hlsoezvaowq+drvxWYvpto61QvGNxDDzLvAgVONWY
 zXXG/ErFcT8opoJ70vQDS73E2XKcGINI8w4RJyjGWP8BRC+kl4Cp+1dte+11kO0/rN3d
 oWHdtc5tnO2+KvhBQceCfl2NSDuYMnF1BB/LRg4Ow1BJU11V69IiAJZNLLREudNzo5g9
 AGtRaiSWdJjlHQsQ5aNaXwK95VVk2CzO4NfnfX9kBBjeXAbUTDbEGojnEoDBTZISuy1N
 LZQOuI5jeqiszCyAalhr2TQuvnSFIATl7zYbUcDDvZ8buqQ6c+EHRALMxBIYsGIXwBvl
 68pQ==
X-Gm-Message-State: AOJu0YyuuFlIuM4wRFBdUe+pnxoM7Q5isCjFlJkXqg5SzQb1SUfklPT7
 5EVPxTTtOb+WIrwSNBR43M4f7QBUtF4MJCL+EnnWymbBuItwAWzICtdvgQZ4+bLsDb2TKs8Evb2
 3EqUyBLgyZPRRlFOG/QuaetP7kbu8gQuyRllyy1abSCSlI/Fij6Yy5+LsT6kuWFUuu4YKhA==
X-Gm-Gg: ASbGncuSEf48NEaM9MZikRKjfMblvUPQ+f+Br/JouTdGwb1My4scXMGYGBE0F1W0edy
 rnjCqTzNlyHuBtrTBlVr8LIP5vCPgFKYA7QmKsn/OE/aUvgrJqiWrEwyWykX+XXrQlHLxD+vDun
 bdV7dQVLKHXCHhsW8lMFtOWi71zbgj2xrHGfd+7cZRBLqDow2VK8nqXvzXRUFI8qpJlZ3lDF5LR
 u6DtZ/cf6mfYLayvICj8PqqdFg6zJ74xPoLqgJ02cKMWfnKiBkv6hyjLAfbs41ThwPRMCf3b/V/
 wbgDG2Jq54vjm659B5dqaS3nEVUQbKM5YtFGl+qLZGhMcHbqzXQ7I11uzfXisG046r0ApxXwY7d
 VKr9XNnJzn2dHQQUNAsYMrhVMJFJ6/nc6UCePNaI=
X-Received: by 2002:a5d:5c89:0:b0:407:7a7:1cb6 with SMTP id
 ffacd0b85a97d-429b4ca3e2emr1008020f8f.55.1761781090460; 
 Wed, 29 Oct 2025 16:38:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1uEuB+3v8AoscTZsHMuW4VKp5DpDnedQw28SoYh2t0KnxCPl65xDRR4J3Kh76yfotw/qtRQ==
X-Received: by 2002:a5d:5c89:0:b0:407:7a7:1cb6 with SMTP id
 ffacd0b85a97d-429b4ca3e2emr1007999f8f.55.1761781090028; 
 Wed, 29 Oct 2025 16:38:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952e3201sm28696727f8f.47.2025.10.29.16.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 16:38:08 -0700 (PDT)
Message-ID: <45733336-720f-484c-b683-66dda19042f7@redhat.com>
Date: Thu, 30 Oct 2025 00:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Clear preserved bits from register output value
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 pschneider1968@googlemail.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Nick Bowler <nbowler@draconx.ca>,
 Douglas Anderson <dianders@chromium.org>, stable@vger.kernel.org
References: <20251024073626.129032-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251024073626.129032-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QzXkRvH5DxhHqj_kzsUo4pWZtGqTzDzBayMWha1-Zvs_1761781090
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

On 24/10/2025 09:35, Thomas Zimmermann wrote:
> Preserve the I/O register bits in __ast_write8_i_masked() as specified
> by preserve_mask. Accidentally OR-ing the output value into these will
> overwrite the register's previous settings.
> 
> Fixes display output on the AST2300, where the screen can go blank at
> boot. The driver's original commit 312fec1405dd ("drm: Initial KMS
> driver for AST (ASpeed Technologies) 2000 series (v2)") already added
> the broken code. Commit 6f719373b943 ("drm/ast: Blank with VGACR17 sync
> enable, always clear VGACRB6 sync off") triggered the bug.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Peter Schneider <pschneider1968@googlemail.com>
> Closes: https://lore.kernel.org/dri-devel/a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com/
> Tested-by: Peter Schneider <pschneider1968@googlemail.com>
> Fixes: 6f719373b943 ("drm/ast: Blank with VGACR17 sync enable, always clear VGACRB6 sync off")
> Fixes: 312fec1405dd ("drm: Initial KMS driver for AST (ASpeed Technologies) 2000 series (v2)")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Nick Bowler <nbowler@draconx.ca>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v3.5+
> ---
>   drivers/gpu/drm/ast/ast_drv.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 7be36a358e74..787e38c6c17d 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -298,13 +298,13 @@ static inline void __ast_write8_i(void __iomem *addr, u32 reg, u8 index, u8 val)
>   	__ast_write8(addr, reg + 1, val);
>   }
>   
> -static inline void __ast_write8_i_masked(void __iomem *addr, u32 reg, u8 index, u8 read_mask,
> +static inline void __ast_write8_i_masked(void __iomem *addr, u32 reg, u8 index, u8 preserve_mask,
>   					 u8 val)
>   {
> -	u8 tmp = __ast_read8_i_masked(addr, reg, index, read_mask);
> +	u8 tmp = __ast_read8_i_masked(addr, reg, index, preserve_mask);
>   
> -	tmp |= val;
> -	__ast_write8_i(addr, reg, index, tmp);
> +	val &= ~preserve_mask;
> +	__ast_write8_i(addr, reg, index, tmp | val);
>   }
>   
>   static inline u32 ast_read32(struct ast_device *ast, u32 reg)

