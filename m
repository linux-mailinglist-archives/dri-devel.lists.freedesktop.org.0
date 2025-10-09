Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745AABC914A
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BF510EA24;
	Thu,  9 Oct 2025 12:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Kp+njX92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710AE10EA24
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760013671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FI9IUs6cdFCZPBtj4UAlJVPMZ877VHf2YgfNKnNB7xQ=;
 b=Kp+njX92gH/UNFNk2UnWu79sr3VXv/XcvhTuJo4tSTRjv+vhqPSSaQtPZzLLqU9KH4fg6N
 U2raT74AjyBKd3mw7NyD8RR68bmzEHDOgBMte78HnfOpsMkrwzODWQYpdJ0asum3JZiBuK
 PztK9zlX9IWhSK6/OjJul15nUDo3iT0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-uwSL7PPyPXe8zi5ZAlirsg-1; Thu, 09 Oct 2025 08:41:10 -0400
X-MC-Unique: uwSL7PPyPXe8zi5ZAlirsg-1
X-Mimecast-MFC-AGG-ID: uwSL7PPyPXe8zi5ZAlirsg_1760013669
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3f4fbdf144dso611397f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 05:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760013668; x=1760618468;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FI9IUs6cdFCZPBtj4UAlJVPMZ877VHf2YgfNKnNB7xQ=;
 b=hGPc/bVj5Qf3jLu5Guho37+/WfrmsMf8k+7/4vnMskS/uwa5BCpTVEKPoiJNCOZ2F3
 lidCf0O6inpTIfOniukEtIBnSbHKIrnrKPjT+3BGpWVUd1HIC3cTENk9DAAZ0CA2ncXj
 ApdsABQtGPPkS1MEyGyZ5Bi4rPKY4vDmmG1LbRQW+sOJaNreEhedKzgYYd9qW0/85YSb
 /sQ1GBpPy088cdPCdVvEMz91lGnfXsWbxzadLFblPyWh8HWIwicp6r2j9YmEydALRpUb
 dLdZvexF9Mew2z/qE5KRQcnFEkc+iTO8aZxWLTTDA+GVPWWk2TwlZ2heofb1ObCQH5Z+
 aSSg==
X-Gm-Message-State: AOJu0YyDXZZ9qUjmFrcsKIXjUULXaKlAKBxDyyA7ftVGizibmeCbP6xv
 IsaXhllN+w/kl9Uzf0uaU4MFlsaOOMga3XmQW5no9/Prf7mJxQFSZB/YZUePBTjL8qk5sB4/iIZ
 0fTfoOWA3NboBsPXGUyzhjBot0WMtrDed0P75Osjur6OQN1aeIyv6hrcSCUKAn8bT1s0mff9Nra
 drIA==
X-Gm-Gg: ASbGncsx9yj7fpqubRRheYciPXo+22AYTKl/jw/lcWT6jL9jpK2WwtZocfMG9qdX/DT
 /iN/E8CBVxVGjQzqeX+UtQTtz58WUCyV6G7ATX9948Lo+byavA2WJJ4oRsHmoNgIuFU0Fx8Swny
 qLNB2E1r3XeBCA0D50/wAqkjZlK/jL2sJSJX0c2CMmOx8Gy6ZeVgzimLqIeQBnySBMBS7dDXmWR
 oYG4valPliV5tcE32a7em3wUfFhChch+3zyjgP0A0E5RhBymay5SfO19q69NeRqYoVF01KUsukP
 MFBnn4mStAVQwH0pWS5J04v2Z3UnITs3WI5oAAAhN00A4zFXQEwJ/PnOHtmucmxnh/y0HCurbtf
 eXZMIzyhOyA==
X-Received: by 2002:a5d:588b:0:b0:3ee:1368:a8e9 with SMTP id
 ffacd0b85a97d-4266e7befe4mr4790630f8f.17.1760013668372; 
 Thu, 09 Oct 2025 05:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvQU/yl63htVEWQXes5ojoQcqAYKct5dklubcG37IsSmqHfl/9Q226arLCACDkdsCRXyluAg==
X-Received: by 2002:a5d:588b:0:b0:3ee:1368:a8e9 with SMTP id
 ffacd0b85a97d-4266e7befe4mr4790607f8f.17.1760013667929; 
 Thu, 09 Oct 2025 05:41:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8efffasm34541329f8f.41.2025.10.09.05.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 05:41:06 -0700 (PDT)
Message-ID: <4ff58972-af7b-4d7a-8225-575b62d98a32@redhat.com>
Date: Thu, 9 Oct 2025 14:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/ast: Store CRTC memory request threshold in
 device quirks
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20251007150343.273718-1-tzimmermann@suse.de>
 <20251007150343.273718-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251007150343.273718-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NWlGBqI7a0urPDJ8a_NuYNgUaGCoDzfllZbZQ2Mk-pk_1760013669
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

On 10/7/25 16:54, Thomas Zimmermann wrote:
> Store each hardware's CRTC memory threshold in the specific instance
> of struct ast_device_quirks. Removes the calls to IS_AST_GENn() from
> ast_set_crtthd_reg().
> 
> The values stored in the registers appear to be plain limits. Hence
> write them in the driver in decimal format instead of hexadecimal.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_2000.c |  2 ++
>   drivers/gpu/drm/ast/ast_2100.c |  2 ++
>   drivers/gpu/drm/ast/ast_2200.c |  2 ++
>   drivers/gpu/drm/ast/ast_2300.c |  2 ++
>   drivers/gpu/drm/ast/ast_2400.c |  2 ++
>   drivers/gpu/drm/ast/ast_2500.c |  2 ++
>   drivers/gpu/drm/ast/ast_2600.c |  2 ++
>   drivers/gpu/drm/ast/ast_drv.h  |  5 +++++
>   drivers/gpu/drm/ast/ast_mode.c | 19 +++++--------------
>   9 files changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
> index ae4d7a2a0ec8..fa3bc23ce098 100644
> --- a/drivers/gpu/drm/ast/ast_2000.c
> +++ b/drivers/gpu/drm/ast/ast_2000.c
> @@ -212,6 +212,8 @@ void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post)
>   }
>   
>   static const struct ast_device_quirks ast_2000_device_quirks = {
> +	.crtc_mem_req_threshold_low = 31,
> +	.crtc_mem_req_threshold_high = 47,
>   };
>   
>   struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
> index 01e064e67cf7..05aeb0624d41 100644
> --- a/drivers/gpu/drm/ast/ast_2100.c
> +++ b/drivers/gpu/drm/ast/ast_2100.c
> @@ -433,6 +433,8 @@ static void ast_2100_detect_widescreen(struct ast_device *ast)
>   }
>   
>   static const struct ast_device_quirks ast_2100_device_quirks = {
> +	.crtc_mem_req_threshold_low = 47,
> +	.crtc_mem_req_threshold_high = 63,
>   };
>   
>   struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/ast/ast_2200.c b/drivers/gpu/drm/ast/ast_2200.c
> index 46b6fc6cf7eb..b64345d11ffa 100644
> --- a/drivers/gpu/drm/ast/ast_2200.c
> +++ b/drivers/gpu/drm/ast/ast_2200.c
> @@ -44,6 +44,8 @@ static void ast_2200_detect_widescreen(struct ast_device *ast)
>   }
>   
>   static const struct ast_device_quirks ast_2200_device_quirks = {
> +	.crtc_mem_req_threshold_low = 47,
> +	.crtc_mem_req_threshold_high = 63,
>   };
>   
>   struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/ast/ast_2300.c b/drivers/gpu/drm/ast/ast_2300.c
> index b76a80d6aea6..5f50d9f91ffd 100644
> --- a/drivers/gpu/drm/ast/ast_2300.c
> +++ b/drivers/gpu/drm/ast/ast_2300.c
> @@ -1408,6 +1408,8 @@ static void ast_2300_detect_widescreen(struct ast_device *ast)
>   }
>   
>   static const struct ast_device_quirks ast_2300_device_quirks = {
> +	.crtc_mem_req_threshold_low = 96,
> +	.crtc_mem_req_threshold_high = 120,
>   };
>   
>   struct drm_device *ast_2300_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/ast/ast_2400.c b/drivers/gpu/drm/ast/ast_2400.c
> index 2b41ff69ab0b..2e6befd24f91 100644
> --- a/drivers/gpu/drm/ast/ast_2400.c
> +++ b/drivers/gpu/drm/ast/ast_2400.c
> @@ -45,6 +45,8 @@ static void ast_2400_detect_widescreen(struct ast_device *ast)
>   }
>   
>   static const struct ast_device_quirks ast_2400_device_quirks = {
> +	.crtc_mem_req_threshold_low = 96,
> +	.crtc_mem_req_threshold_high = 120,
>   };
>   
>   struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
> index 6d305a8ccc51..416bce9ea757 100644
> --- a/drivers/gpu/drm/ast/ast_2500.c
> +++ b/drivers/gpu/drm/ast/ast_2500.c
> @@ -619,6 +619,8 @@ static void ast_2500_detect_widescreen(struct ast_device *ast)
>   }
>   
>   static const struct ast_device_quirks ast_2500_device_quirks = {
> +	.crtc_mem_req_threshold_low = 96,
> +	.crtc_mem_req_threshold_high = 120,
>   };
>   
>   struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
> index df3b429e8174..bb0a50b25766 100644
> --- a/drivers/gpu/drm/ast/ast_2600.c
> +++ b/drivers/gpu/drm/ast/ast_2600.c
> @@ -60,6 +60,8 @@ static void ast_2600_detect_widescreen(struct ast_device *ast)
>   }
>   
>   static const struct ast_device_quirks ast_2600_device_quirks = {
> +	.crtc_mem_req_threshold_low = 160,
> +	.crtc_mem_req_threshold_high = 224,
>   };
>   
>   struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 2a2c28693dc6..926e1c7de6f8 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -165,6 +165,11 @@ to_ast_connector(struct drm_connector *connector)
>    */
>   
>   struct ast_device_quirks {
> +	/*
> +	 * CRTC memory request threshold
> +	 */
> +	unsigned char crtc_mem_req_threshold_low;
> +	unsigned char crtc_mem_req_threshold_high;
>   };
>   
>   struct ast_device {
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index a9ffda1b1dea..da374af9596d 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -410,20 +410,11 @@ static void ast_set_color_reg(struct ast_device *ast,
>   
>   static void ast_set_crtthd_reg(struct ast_device *ast)
>   {
> -	/* Set Threshold */
> -	if (IS_AST_GEN7(ast)) {
> -		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa7, 0xe0);
> -		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa6, 0xa0);
> -	} else if (IS_AST_GEN6(ast) || IS_AST_GEN5(ast) || IS_AST_GEN4(ast)) {
> -		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa7, 0x78);
> -		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa6, 0x60);
> -	} else if (IS_AST_GEN3(ast) || IS_AST_GEN2(ast)) {
> -		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa7, 0x3f);
> -		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa6, 0x2f);
> -	} else {
> -		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa7, 0x2f);
> -		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa6, 0x1f);
> -	}
> +	u8 vgacra6 = ast->quirks->crtc_mem_req_threshold_low;
> +	u8 vgacra7 = ast->quirks->crtc_mem_req_threshold_high;
> +
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xa7, vgacra7);
> +	ast_set_index_reg(ast, AST_IO_VGACRI, 0xa6, vgacra6);
>   }
>   
>   static void ast_set_sync_reg(struct ast_device *ast,

