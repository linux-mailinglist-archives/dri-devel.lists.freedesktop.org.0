Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8933990670A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 10:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB0D10E2D0;
	Thu, 13 Jun 2024 08:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Cy69vvtD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947BF10E0EB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718267884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdO1WJIrqIg61hN5vELUIZIHcL7hxfeUZFi824LjBqU=;
 b=Cy69vvtD0izzHRHEwqCf+3ehGIxqtqNd8ZB3Rs9uCjfSMxZUKDK0RGYbPmXTvG+rbWKrD0
 Zcl5TxMjDqlSvKNZ3++TJ5et0gwFEAA9q8mySbgOlK8Bmx+g1pt1yM65RNh78lWj0a8wGy
 DNPHFrov7q9p9p7i5CJrPDk1FyAR3LI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-LcFGy0VcPKaChQJu4y6DIQ-1; Thu, 13 Jun 2024 04:38:01 -0400
X-MC-Unique: LcFGy0VcPKaChQJu4y6DIQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-357766bb14fso420309f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 01:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718267879; x=1718872679;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YdO1WJIrqIg61hN5vELUIZIHcL7hxfeUZFi824LjBqU=;
 b=ceCq8HL+wxwPuq0mn6AU8YMqo1X/FzBY5zK8UWuYGPyjb3pw7rSa6Nzl4vUw1LqRxW
 cZ0xWDJtNzXtXvlQgUTpk7WHhySQ25mDPPO8NGhEtdsE4NjIlW5zisSoLM4rC23ycrI3
 WtcRaivlOR6GuTr71skZARNHKM6bkICGOtmYgEukCaEcTJf+/PBuduKu34zNDZhWOhhb
 dHQI3k9ahp8qN8IK6d06W/DtEOrbO3l5PrD+GqienG14abTSSXRR6gL0Uf3k3Netko23
 A5DUYVxtSjxd34z4TBc++vgpzphPbbBUyuXpSxyU44DgfHjLEs1YIc56hFZE/iKxYhdO
 6rRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ9XB6lJ4UTVFFW51hOyePuhlnrFsKk5HHU4Sl5wnH2HtmcY3W9KrXwenYlDndNvQtA+mn66YksPMCTys/LnkIvUvt61aaj5QCpsUTEwkq
X-Gm-Message-State: AOJu0YwJkP1lShiGf7XGRvZ1LF0+1q4UE/QwBtOFX/66PJtfnWzSA4ZV
 +D9DBkI1Kfty2Cx4sDeh3+grZKAUxYa4dsfdL75iJ+K5DWVX4w1iWS9HoiAd1GxBIPkeSoVsIqi
 b8tJTefpu8TE94oYzmWhUW6QyvwiAl8p8IYINRFfTjUPy3DS37IUq0rH+FoZUkwDLqEPfADNX1Q
 ==
X-Received: by 2002:a05:6000:1563:b0:360:775d:f917 with SMTP id
 ffacd0b85a97d-360775dfd15mr630602f8f.4.1718267879568; 
 Thu, 13 Jun 2024 01:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqGjyQ/umCl2P9LZ32xVZd+McgCS7SCUcfkDyw5neb2L6t38GU4AsvVfow9TXTVGdrXdS6/Q==
X-Received: by 2002:a05:6000:1563:b0:360:775d:f917 with SMTP id
 ffacd0b85a97d-360775dfd15mr630592f8f.4.1718267879169; 
 Thu, 13 Jun 2024 01:37:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750ad177sm1011707f8f.56.2024.06.13.01.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 01:37:58 -0700 (PDT)
Message-ID: <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
Date: Thu, 13 Jun 2024 10:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718199918.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <cover.1718199918.git.geert+renesas@glider.be>
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



On 12/06/2024 15:54, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> If drm/panic is enabled, a user-friendly message is shown on screen when
> a kernel panic occurs, together with an ASCII art penguin logo.
> Of course we can do better ;-)
> Hence this patch series extends drm/panic to draw the monochrome
> graphical boot logo, when available, preceded by the customary fix.

Thanks for your patch.

I've tested it, and it works great.

You need to rebase your series on top of drm-misc-next, because it 
conflicts with a series I pushed last week:
https://patchwork.freedesktop.org/series/134286/

This rebase should simplify the draw_logo_mono() function.

> 
> This has been tested with rcar-du.
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (3):
>    drm/panic: Fix off-by-one logo size checks
>    drm/panic: Rename logo to logo_ascii
>    drm/panic: Add support for drawing a monochrome graphical logo
> 
>   drivers/gpu/drm/drm_panic.c | 81 +++++++++++++++++++++++++++++++++----
>   drivers/video/logo/Kconfig  |  2 +
>   2 files changed, 75 insertions(+), 8 deletions(-)
> 

