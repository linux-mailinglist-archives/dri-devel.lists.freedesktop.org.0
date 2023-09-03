Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F00C790BD7
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 14:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AD010E010;
	Sun,  3 Sep 2023 12:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C2210E0C9
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693743213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGYonxUo2QXyxKtXMfE23JNn8MTKGMm1EEAtm3NSkTY=;
 b=agrVIOTMsB0rD+3eKraxwqSwVVDnMxvP3CcAzGCVTOtEdtNJKMav0O8uZ95nag8xF09rOr
 Is+oyYwmpUu4c+R6aacCcxq7KwvQqMYkR+0FNWixqCy3aF2WYSPNUS7hRhA3ZUzOCJiWfp
 j5LkFM+TvYSCH+EKkWzAP7B2Oah1LQU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-TwtKAu2sO8ucdB5H27BgyA-1; Sun, 03 Sep 2023 08:13:28 -0400
X-MC-Unique: TwtKAu2sO8ucdB5H27BgyA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9a57ec840e2so167222066b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 05:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693743207; x=1694348007;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VGYonxUo2QXyxKtXMfE23JNn8MTKGMm1EEAtm3NSkTY=;
 b=GAXLV+YrPqe1fRBlqUgApXPWLoMDc7JtfF3BtTjugitY4OoXZcu9YX7M1EVz/GHnr1
 SHSCyGC+5Jf5FTjIRGjmmFMx9pvgnI0B6seCKeDnuuJYKS5wy/22r6x2V/ZdR222F4h+
 YA7cEmdcZY96XEdsuIbcD0tFWHnxAInufKNdGOv7co61okzRN98p/GjhHQ2qnE273ojz
 l+UU26L8BkdUYA+BVqV/x1Uw252qVft2TZiJCS3ehimkX9rUSK0grAX2yOBrrCILAKw/
 FTVpggHJcU9mslFgLLg2U+uzQNrqaPS0c9Xbr3xBqWVwXmwAlm4quNH+kFLhxHu2s1gt
 TOZw==
X-Gm-Message-State: AOJu0YzP+3PPqppKRe69R7esCzIvyqbJwH+CiBMy89W75W01pNhG6J9a
 rChepmF1wZdqdlNYslUGAmbwaDrHCajnhrfM1jbg9fQ7XDuY1p/g0aGKVmeJF48d+B2UBEyI7fy
 l6/2DJooggJfA5CEis4lLVcZY75cm
X-Received: by 2002:a17:906:51c5:b0:99c:5056:4e31 with SMTP id
 v5-20020a17090651c500b0099c50564e31mr8349153ejk.15.1693743207262; 
 Sun, 03 Sep 2023 05:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeTz4OyosE0kQWSXeu9mrD9R+/Vb6z7O6gSkZJ/cI3YDM6HvSQJrTFjswILZUO3ztoxmInIw==
X-Received: by 2002:a17:906:51c5:b0:99c:5056:4e31 with SMTP id
 v5-20020a17090651c500b0099c50564e31mr8349141ejk.15.1693743206927; 
 Sun, 03 Sep 2023 05:13:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 mf25-20020a170906cb9900b0099d804da2e9sm4726679ejb.225.2023.09.03.05.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 05:13:26 -0700 (PDT)
Message-ID: <bf38351a-3000-7288-5636-f6e46315c3ad@redhat.com>
Date: Sun, 3 Sep 2023 14:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm: gm12u320: Fix the timeout usage for usb_bulk_msg()
To: Jinjie Ruan <ruanjinjie@huawei.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20230903085547.1577439-1-ruanjinjie@huawei.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230903085547.1577439-1-ruanjinjie@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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

Hi Jinjie,

On 9/3/23 10:55, Jinjie Ruan wrote:
> The timeout arg of usb_bulk_msg() is ms already and it has convert it
> to jiffies by msecs_to_jiffies() in usb_start_wait_urb(). So fix the usage
> by remove the redundant msecs_to_jiffies() in the macros.
> 
> Fixes: 77b8cabf3d52 ("drm/gm12u320: Move driver to drm/tiny")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Good catch, thank you.

> ---
>  drivers/gpu/drm/tiny/gm12u320.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index c5bb683e440c..31fa50c665d1 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -70,10 +70,10 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less bright, more silent)");
>  #define READ_STATUS_SIZE		13
>  #define MISC_VALUE_SIZE			4
>  
> -#define CMD_TIMEOUT			msecs_to_jiffies(200)
> -#define DATA_TIMEOUT			msecs_to_jiffies(1000)
> +#define CMD_TIMEOUT			200
> +#define DATA_TIMEOUT			1000
>  #define IDLE_TIMEOUT			msecs_to_jiffies(2000)
> -#define FIRST_FRAME_TIMEOUT		msecs_to_jiffies(2000)
> +#define FIRST_FRAME_TIMEOUT		2000

Lets be consistent here and change all *_TIMEOUT defines to
be in milliseconds.

And then in the 1 place where IDLE_TIMEOUT is used, change
"IDLE_TIMEOUT" to "msecs_to_jiffies(IDLE_TIMEOUT)"

REgards,

Hans





>  
>  #define MISC_REQ_GET_SET_ECO_A		0xff
>  #define MISC_REQ_GET_SET_ECO_B		0x35

