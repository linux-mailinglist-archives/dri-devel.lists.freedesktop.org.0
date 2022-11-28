Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D65F63AE20
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 17:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4513D10E070;
	Mon, 28 Nov 2022 16:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DFD10E070
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 16:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669654476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ODYLBId5HSbWWfqY1C8KLQq8qvNZk0ffN7vpKYm0Wzc=;
 b=aG+Ly+ZfcCl42m16mDmRkXfC/XCQciG7BWOxhz48GsuHk3TMOCEZrPG93E5gzjCYX1vTvy
 v/loxlu8K2Ow43pxOZDkL1A/0PzweOFj+fmsHHX8wFmG/LCY6oNioWlfYsL+SkSKjQWvNi
 K28ZVzxcgWy52Yi7bSZGieBuRXLazg8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-tRtCtx8UOy2QOjlp6Fqsfg-1; Mon, 28 Nov 2022 11:54:35 -0500
X-MC-Unique: tRtCtx8UOy2QOjlp6Fqsfg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r23-20020adfa157000000b00241bcae980cso2149903wrr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 08:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ODYLBId5HSbWWfqY1C8KLQq8qvNZk0ffN7vpKYm0Wzc=;
 b=tjYMNthKtQ3HttMwvEdDoNj1TRpAcqnTqJZP0521GuS+qWouun1x8XxlZsR/SVXuBG
 NsVSYEL5MeDxIwiwtjkJVJLuLBFT7i2+z8YW3VVo7NIhHHAAQ7wXCwhYDDU2RqKTIDNN
 V3fbdvtT9LMYTKvPvQR5EIjWMAQlR+587EEiq4EzDnliorhp1Knhnhlenxb/GILB+S4w
 2SFaTNBxQHDK4NC2n2ijW3hoV08Df52LbSJKlkTSXArbXlyzVa6W9n2sfOFg+7OzxKv1
 V+TZuagve3jR+aM3WIyoXksdZSW2Dh+gzEZz8VAFLe3nuq99GWOmqzde8sVkJNkzqQKH
 SckQ==
X-Gm-Message-State: ANoB5pmD8gCY81XKQfwlglMwnTF74uAxsZLEEvniuvbwqTfe980uAk7D
 dsurBJMLd5z5Mb6yufj0mkJmvYiRQThFtHBqk0jwVA7qiTUY3x4GQyiDf4Ss1nINTcGkvDOmxbe
 4e9UahM9FPKvKwhPMHiAHGrs3xnaN
X-Received: by 2002:a05:600c:4148:b0:3cf:5657:3791 with SMTP id
 h8-20020a05600c414800b003cf56573791mr27453848wmm.34.1669654473728; 
 Mon, 28 Nov 2022 08:54:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5B05xg5+SMQsPT2GDrXHA6th+7zmwgaicGFO3CywthXR+nhWr60Teku1KwhMBPewYnbKepqg==
X-Received: by 2002:a05:600c:4148:b0:3cf:5657:3791 with SMTP id
 h8-20020a05600c414800b003cf56573791mr27453834wmm.34.1669654473467; 
 Mon, 28 Nov 2022 08:54:33 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d8-20020a5d6dc8000000b002415dd45320sm11211883wrz.112.2022.11.28.08.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 08:54:33 -0800 (PST)
Message-ID: <efad098d-f2b8-f8e2-571f-08dd6f4dbcb2@redhat.com>
Date: Mon, 28 Nov 2022 17:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] drm: Only select I2C_ALGOBIT for drivers that actually
 need it
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Uwe,

Thanks for your patch.

On 9/12/22 11:15, Uwe Kleine-König wrote:
> While working on a drm driver that doesn't need the i2c algobit stuff I
> noticed that DRM selects this code even tough only 8 drivers actually use
> it. While also only some drivers use i2c, keep the select for I2C for the
> next cleanup patch. Still prepare this already by also selecting I2C for
> the individual drivers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Makes sense to me. It would be good to drop this dependency, specially now
that many distros have CONFIG_DRM=y to use simpledrm for early boot.

> Changes since v1
> (20210514100142.1182997-1-u.kleine-koenig@pengutronix.de) from
> 2021-05-14:
> 
>  - rebased to next-20220909
>    was something around v5.13-rc2 before, required to fix context
>    changes in the nouveau Kconfig file. git am -3 handled it just fine.
> 
> I reverified that no new drivers were added that need a corresponding
> select.
> 
> Best regards
> Uwe
> 
>  drivers/gpu/drm/Kconfig                 | 5 ++++-
>  drivers/gpu/drm/ast/Kconfig             | 2 ++
>  drivers/gpu/drm/gma500/Kconfig          | 2 ++
>  drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 ++
>  drivers/gpu/drm/i915/Kconfig            | 2 ++
>  drivers/gpu/drm/mgag200/Kconfig         | 2 ++
>  drivers/gpu/drm/nouveau/Kconfig         | 2 ++
>  7 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 198ba846d34b..593d7335b10a 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -13,7 +13,6 @@ menuconfig DRM
>  	select HDMI
>  	select FB_CMDLINE
>  	select I2C

Is I2C still required or was just a dependency of I2C_ALGOBIT ?

I'll wait a few days in case others want to review this change too
and then can push this to drm-misc-next. 

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

