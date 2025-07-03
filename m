Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3457AF7520
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 15:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34C210E836;
	Thu,  3 Jul 2025 13:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CIzjlP14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA9F10E836
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751548250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+S8ciVy3WikUqp5lv4ltFVKzoLHhNjZXwxxRHw3olbw=;
 b=CIzjlP14uwyy2N37Yk2OcwFRkiP/GHXVjLsTP1XDdR/8fPBQZF0PUXdyN8AS6i+jHxD59l
 V1vX1MoP9FG+hTVfjo0LgjHDTKX99kG6dfboKGm/+LRZCkOcnYU4tdrcuZJIIrKa4zYQ74
 bPKTznLb+fG9JWdJpdUtWzk5oZHOsrc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-HLaqk03MPiy1ZNLgJi5YSw-1; Thu, 03 Jul 2025 09:10:48 -0400
X-MC-Unique: HLaqk03MPiy1ZNLgJi5YSw-1
X-Mimecast-MFC-AGG-ID: HLaqk03MPiy1ZNLgJi5YSw_1751548247
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45320bfc18dso5119245e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 06:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751548247; x=1752153047;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+S8ciVy3WikUqp5lv4ltFVKzoLHhNjZXwxxRHw3olbw=;
 b=ci8E73bVzNxkzuagouO1E5bNl6ZiybSICjgZXJj/rCtij90i47DcmM8vRN0sgDuEoP
 6p01N+nkDaz+golnVJOx7mp2ZlmkUMTvy2b8RI63pq5o+HWaovpuUgPG9ascjFifOljK
 olMQ/uh9CZndplchA/fxjqZkXWDNeYPxI7D8Pez9YrzMXRlTfELn/0/SFECV+bttRp1g
 tmaU4i2HD1WKnjdNtdgAGAH8ubH+TxfEIS9MhTOHMZdFNSSLRKo9l2PDv/6fXTxQO2bp
 3aRLv6ez780ksJE46jaQCXVfCAP8zIxYtM2YoRZCsDvQrrYtygsoTJXg8QIGHWOW8tCP
 i4gQ==
X-Gm-Message-State: AOJu0YygLRu65AJrohwzFVlIRXJHwyNkxyo3uq/zMEkKOugIMcWhvwjC
 b+eljLwRCRTSczpifMizpGpeJK7XJ7L5kaZyH4XAPUsxRyPHT3c6fTdSphJe4P25XTjFOSysx4n
 AHOrz/NUloUOSe01gvI9JjcA4YRTDu+XR+Nv62lU5TXLtz2feaUu/1XxgcIjom3BOEWLu3A==
X-Gm-Gg: ASbGncsvNS6Y7yMfyLJYoQSh85XiY0+Ll3yUIgYU/PmqeYlLBDuozB+yqFH7lp0macH
 /XcJpk5cq5YnmlGi4eW92qqc7vPLEjeT3skqBpfHe2G+Z3omsHR+jvAx0yZOuKkGblY79NusHJn
 kKb/33ITUcjwLImYTIaxx7GsnKehneD1lRUVmF9KrOqvKS8eRv1S4Hwfplli7kF9pMsP8aRMGRL
 1ti51WcTjndCUFJIaeQN1oLjIzTgj6c6yKRaOJu1HGVtLaBA4A7ENZ7a66SZFvdYAlCxFAHMGfm
 an2fbducTYPLW+8cSW1BFnDPKm8/eW41B3S2K9AsZg2xtCLv1miKxmjt4u+uqQ==
X-Received: by 2002:a05:600c:524d:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-454ab33e67cmr30351525e9.10.1751548247099; 
 Thu, 03 Jul 2025 06:10:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrACkY4vRBuNPFAS2e/Fgxr478/A1BsBWwZBZpw/xbEJGZiFRXPSQcYGaql+8CxS3qsnRUVw==
X-Received: by 2002:a05:600c:524d:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-454ab33e67cmr30350895e9.10.1751548246527; 
 Thu, 03 Jul 2025 06:10:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bac9dasm26115935e9.38.2025.07.03.06.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 06:10:45 -0700 (PDT)
Message-ID: <8edf6d6c-6ccb-4697-a3b2-835a9b347cb1@redhat.com>
Date: Thu, 3 Jul 2025 15:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] drm/ast: Move struct ast_dramstruct to ast_post.h
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250702132431.249329-1-tzimmermann@suse.de>
 <20250702132431.249329-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250702132431.249329-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oZA3D6hkEB-goFob8RwyWan1J4mvLs_fTqu9VZ2dJi4_1751548247
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
> Declare struct ast_dramstruct in ast_post.h and remove its original
> header file.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2000.c        |  2 +-
>   drivers/gpu/drm/ast/ast_2100.c        |  2 +-
>   drivers/gpu/drm/ast/ast_dram_tables.h | 11 -----------
>   drivers/gpu/drm/ast/ast_post.h        |  6 ++++++
>   4 files changed, 8 insertions(+), 13 deletions(-)
>   delete mode 100644 drivers/gpu/drm/ast/ast_dram_tables.h
> 
> diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
> index 099c90e1402f..b2ad2ea5056b 100644
> --- a/drivers/gpu/drm/ast/ast_2000.c
> +++ b/drivers/gpu/drm/ast/ast_2000.c
> @@ -28,8 +28,8 @@
>   
>   #include <linux/delay.h>
>   
> -#include "ast_dram_tables.h"
>   #include "ast_drv.h"
> +#include "ast_post.h"
>   
>   /*
>    * POST
> diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
> index f41c778e02da..ee40f3911ca4 100644
> --- a/drivers/gpu/drm/ast/ast_2100.c
> +++ b/drivers/gpu/drm/ast/ast_2100.c
> @@ -28,8 +28,8 @@
>   
>   #include <linux/delay.h>
>   
> -#include "ast_dram_tables.h"
>   #include "ast_drv.h"
> +#include "ast_post.h"
>   
>   /*
>    * POST
> diff --git a/drivers/gpu/drm/ast/ast_dram_tables.h b/drivers/gpu/drm/ast/ast_dram_tables.h
> deleted file mode 100644
> index 6c191e2c4e6c..000000000000
> --- a/drivers/gpu/drm/ast/ast_dram_tables.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef AST_DRAM_TABLES_H
> -#define AST_DRAM_TABLES_H
> -
> -/* DRAM timing tables */
> -struct ast_dramstruct {
> -	u16 index;
> -	u32 data;
> -};
> -
> -#endif
> diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
> index 314fa0475c79..3a55c32a7eb7 100644
> --- a/drivers/gpu/drm/ast/ast_post.h
> +++ b/drivers/gpu/drm/ast/ast_post.h
> @@ -7,6 +7,12 @@
>   
>   struct ast_device;
>   
> +/* DRAM timing tables */
> +struct ast_dramstruct {
> +	u16 index;
> +	u32 data;
> +};
> +
>   u32 __ast_mindwm(void __iomem *regs, u32 r);
>   void __ast_moutdwm(void __iomem *regs, u32 r, u32 v);
>   

