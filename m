Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747568B2A9E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 23:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D75F10E6B0;
	Thu, 25 Apr 2024 21:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="WjtyWowr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2638910E6B0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 21:24:28 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6f0b9f943cbso1391887b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 14:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714080267; x=1714685067;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ra+gBoWOeuJuI+Ezc3sgY9mFyzgfI39aGWs6cfLFtkw=;
 b=WjtyWowrVatrsHCb9apEGejc9j11qifk/TPnW56cqbpYsyEyBQYaWDBIcAgGTdqdJ/
 nH+yjC3KU22z9Mq5q0w0Mj2AoMZFOntDgdqhB8f8FzueTvxsK5pylL4OHH792PMS1nmw
 4chUoyuH13IIvXumiLF8W9YU/v56O/wsn75Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714080267; x=1714685067;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ra+gBoWOeuJuI+Ezc3sgY9mFyzgfI39aGWs6cfLFtkw=;
 b=aNZQEwInJRMCLgmV1TtxU5XvLbSi9ktAuWQrgHuf1Sq4uT591zr4cYgxetWNwMukJk
 grg6ZYgeONClJ/4QSk2Arc/t19v6AILFOXkqloScrProW2GJpikumqxEzs5las1Ccgv3
 l5B7okkjQjunLVxmq3ZScGORP8fRZpdtWsLnRlcEhJh2o0yJuHJxjACJ/Sg4+od69BLi
 qTEqMilqIc0TYsz2biNhjhpM3U4Mi6Pm7QQBR9ClZjmqDGmFCaUF35DZay1zH1lMtuKc
 gt0BMLDk2KEhAtGDQvfqmib0Gqs2ki1pLZSTZsW+pu1MZifiwqLQdJcOXmYa8A7xb6or
 InyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB8hrrYVC4mB3yDvteeWSrclw/J/2jpsEo7SDr6xmVtFw5lnYlDkMZTxh6n3Xs7y5IPO+Q4xYk/9SJfo5Mt6/LLakHkfqmT76NISiH4ixF
X-Gm-Message-State: AOJu0YwoAHJhEtRw8MAd/vesz5oH/Nxobh1F2o0PCyF3BZDh1rem4U6d
 HzmrfBr/wjtcffb3wH+Ijdz2B1eZdJ9DC5436ChTXam/w+9pxdb5fek9r3+tlg==
X-Google-Smtp-Source: AGHT+IFjRI1KL92CI5//kxL5g2K5AdC261aXqb0p/mvglOwYKbX0B59aSLlt6Vxzy9YL74iEhxcDrw==
X-Received: by 2002:a05:6a20:d41f:b0:1aa:9c29:b98d with SMTP id
 il31-20020a056a20d41f00b001aa9c29b98dmr968628pzb.24.1714080267556; 
 Thu, 25 Apr 2024 14:24:27 -0700 (PDT)
Received: from [10.211.41.59] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 b1-20020a170902d50100b001e2b8c91f04sm14230143plg.22.2024.04.25.14.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 14:24:27 -0700 (PDT)
Message-ID: <e2569ac9-85ba-46b2-a285-161ddf3b3cd3@broadcom.com>
Date: Thu, 25 Apr 2024 14:24:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Fix invalid reads in fence signaled events
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, zdi-disclosures@trendmicro.com,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240425192748.1761522-1-zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20240425192748.1761522-1-zack.rusin@broadcom.com>
Content-Type: text/plain; charset=UTF-8
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

On 4/25/24 12:27, Zack Rusin wrote:
> Correctly set the length of the drm_event to the size of the structure
> that's actually used.
> 
> The length of the drm_event was set to the parent structure instead of
> to the drm_vmw_event_fence which is supposed to be read. drm_read
> uses the length parameter to copy the event to the user space thus
> resuling in oob reads.
> 
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: 8b7de6aa8468 ("vmwgfx: Rework fence event action")
> Reported-by: zdi-disclosures@trendmicro.com # ZDI-CAN-23566
> Cc: David Airlie <airlied@gmail.com>
> CC: Daniel Vetter <daniel@ffwll.ch>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: <stable@vger.kernel.org> # v3.4+
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> index 2a0cda324703..5efc6a766f64 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -991,7 +991,7 @@ static int vmw_event_fence_action_create(struct drm_file *file_priv,
>  	}
>  
>  	event->event.base.type = DRM_VMW_EVENT_FENCE_SIGNALED;
> -	event->event.base.length = sizeof(*event);
> +	event->event.base.length = sizeof(event->event);
>  	event->event.user_data = user_data;
>  
>  	ret = drm_event_reserve_init(dev, file_priv, &event->base, &event->event.base);

LGTM!

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

Thanks,

Maaz Mombasawala <maaz.mombasawala@broadcom.com>
