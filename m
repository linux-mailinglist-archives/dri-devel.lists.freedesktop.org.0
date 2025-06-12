Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB35AD6BAD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 11:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E098610E7BC;
	Thu, 12 Jun 2025 09:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z1jOB1PC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF4E10E7B9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749719301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NpWyKsT+xJ4hxiXo6iQBxwiOmkQzTVppYFXirYwjH6c=;
 b=Z1jOB1PClAfYnU+Ucb0Qptj0vdSIQBkGLsMaJVpyZKtDPGAwk9Lie0wrhbnqzjjXJdJF0C
 DFPx0GSdhiII3Rbghw5tdW11ixcpsFNMrD23MU8sarLSwAP9WVjv4ycfOtKj6G5fdXopLm
 6/L1P7THGJVKeOf76n2Ic+JAP3GaGWE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-r2_zVhJIMxCUJXZMZAt2Cw-1; Thu, 12 Jun 2025 05:08:19 -0400
X-MC-Unique: r2_zVhJIMxCUJXZMZAt2Cw-1
X-Mimecast-MFC-AGG-ID: r2_zVhJIMxCUJXZMZAt2Cw_1749719299
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4eee2398bso323148f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 02:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749719298; x=1750324098;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NpWyKsT+xJ4hxiXo6iQBxwiOmkQzTVppYFXirYwjH6c=;
 b=aAOXAdbxLGvkgIzVeg8TEFkH9O1hipvjywM8XR/ZunMzzFBtr8GxjyH0BNGu2Je3xW
 SwT16GXUSt8tn1jTTVdcFSI3RTDINOUGU7uqB8icwJS1jV07/PBjBGEYaT25ZTLa3h/B
 DBec1JJABly6C6a9UUDjWDJMymFuNYsKrDmRirege0/dQq+anDE3MHTQUAc1KXlYjxaH
 jeRuTndudAqikTXbZyCyi7r0Axo22r0qtKI85pDnwwxRntDukDBaA4ut1paCtPFgrIZo
 QLX1lcda+wNF9y81RjDpFBxQRvDBBq/f+foupliMOtPlWeumT8KzGI0UULPqZiCqgV3b
 d3LA==
X-Gm-Message-State: AOJu0Yy4wI1wdS0/gVSwv7zLUuAo6pLlYYfyzTBho+2UfVJe57LGbLVR
 yiLXTgGbmuzRgcjcXk3wGn/ZrJ6LT4R4AChHmegtLByep4dRtHQ3TFqSZ8pLmDZEMTPskQLh82B
 AbRYFmkZX0RZn0+/w6hKRn0ZrUnwCZCYWLNkYcyL3VPKYkUV4b2mBZIKBuX2zZyAdK+0OY/BFRh
 kidA==
X-Gm-Gg: ASbGncstE9NgSU6E6qW8d5sE/CQ21t6XOp/OlGWcd1/rWsS1SKBFUsJUPzZYWEe2fkK
 UBYwPDYu8pxN5yt9Vnm3WNJ0+bNi4QVKHn9pb2wj5AaRkQLuRxZ9ivZ8ubZKXekjaUmVFbmEgyj
 /5bBcw8nigSaV35n3qm29F96NVGBC6/To8+XZOWpVhnYveDMm6stxjhTc+XWPQ1qaPcXCfwtV3A
 PB/cWCD9QqfwNE8BxTSAXRigKvKbM/114EqCMcdPlwRA9rbG4A4RBl5XVAiZvx4hy1nH5j1ICbu
 Ol8W2wWq48d5iaj6sr2RJ7euCYmt1wzqsXszLEyd74B06QHOqG3XDg6pLU279Q==
X-Received: by 2002:a05:6000:1447:b0:3a1:fcd9:f2ff with SMTP id
 ffacd0b85a97d-3a558691957mr4300078f8f.12.1749719298437; 
 Thu, 12 Jun 2025 02:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEaEVx7yIbZAsJJTKMCr0VJaRQOeicZWif2nSq/RNrg6Kg9j8DMR42fv0Au/PCsIKlKO35Pg==
X-Received: by 2002:a05:6000:1447:b0:3a1:fcd9:f2ff with SMTP id
 ffacd0b85a97d-3a558691957mr4300048f8f.12.1749719297979; 
 Thu, 12 Jun 2025 02:08:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a561a3ce6bsm1370864f8f.49.2025.06.12.02.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 02:08:17 -0700 (PDT)
Message-ID: <1bf5e9a9-630a-4d64-a0fe-3f72a16779ce@redhat.com>
Date: Thu, 12 Jun 2025 11:08:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Do not include <linux/export.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250612084257.200907-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250612084257.200907-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6i_zBIgbJMwQ4rmV4X49D2F086HLLDPI-gvFfOVFY3g_1749719299
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

On 12/06/2025 10:42, Thomas Zimmermann wrote:
> Fix the compile-time warning
> 
>    drivers/gpu/drm/ast/ast_mode.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 7908087bcb5a..b4e8edc7c767 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -29,7 +29,6 @@
>    */
>   
>   #include <linux/delay.h>
> -#include <linux/export.h>
>   #include <linux/pci.h>
>   
>   #include <drm/drm_atomic.h>

