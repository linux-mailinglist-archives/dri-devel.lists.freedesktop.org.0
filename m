Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24C57255C3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 09:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B2D10E44D;
	Wed,  7 Jun 2023 07:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82A710E44D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 07:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686123339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rVXKtyFuQelZnCduaFGaTWYRY9d93/7uXkVVq77/kek=;
 b=CwuqI489c8L2M/pXFsPxJ8FXHy7FRAPQ+5n02PDCFmeiHqWFqFi2M8YzgbPSY4TyapaQj1
 3PSa0wp1HVdsq3BoVKyhSOY3YbrEp1NCQnZb4tYX3IYR+Dq/ZTv4h0i0AT9NUtHWrnse77
 nGp7wWjNeuPoUoiUnSqCmWf2Q2WBagQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-wuE_Q66ROeCkOEGOjCeDsg-1; Wed, 07 Jun 2023 03:35:38 -0400
X-MC-Unique: wuE_Q66ROeCkOEGOjCeDsg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30ae4ed92eeso3064364f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 00:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686123337; x=1688715337;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rVXKtyFuQelZnCduaFGaTWYRY9d93/7uXkVVq77/kek=;
 b=CH6VqhXEmVg+P/1hHl/CfbLl/EtGYkobjBScArr71xtUnJqZXGMbUcd/bG8iCNytWf
 iZPcrA5Zw7zyG5yfeRJdS7xc7QtRwUYnoOoBK5S0GkQypYyM5DLFlL+JE1yIljb2lcUZ
 7ka8l3moqxTDWcEos7c32eAMTR73pc/rs9sJwlfTeMmBffIf2lzuq1RAVHCCa5Pfleci
 s25B3m7exkTI4gEiuJEFN+wU97SULLJuJRX+Dgg5ZObfSTp1nJFEjp1OK4kIxZZh8WRi
 q2ko3EU87axYJ8dOOz6exQTioLJdFqWzBMmakE05V7FWN4GV5zFMWs7wlfwn0mT6Gk86
 rHCA==
X-Gm-Message-State: AC+VfDwRd+dk04orARGxh9E8Hq2cFVYW31A+sZh8i6nlL9Xe2etHTAyy
 w3hFcms162o8lkz6G4AxjJwUq7fFJ+zwrcpmO9vUMzhTvqyKAR4qgC032liVFsNK7lCp2WT10jL
 wMDh8zqYp6r6TKQH2++L1HWMGCa9E
X-Received: by 2002:adf:e94c:0:b0:30e:3ccf:d4b1 with SMTP id
 m12-20020adfe94c000000b0030e3ccfd4b1mr3545202wrn.4.1686123337741; 
 Wed, 07 Jun 2023 00:35:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7c4uJeHgefHAPZBCPOj0COJN3FPjwSoURcR8FFlOhwLdItHYCa5GZjGrjPHZg2iimtHbMokg==
X-Received: by 2002:adf:e94c:0:b0:30e:3ccf:d4b1 with SMTP id
 m12-20020adfe94c000000b0030e3ccfd4b1mr3545188wrn.4.1686123337473; 
 Wed, 07 Jun 2023 00:35:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s15-20020a5d69cf000000b0030af31c8c63sm14618215wrw.47.2023.06.07.00.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 00:35:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 03/30] backlight/lv5207lp: Compare against struct
 fb_info.device
In-Reply-To: <20230605144812.15241-4-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-4-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:35:36 +0200
Message-ID: <875y7zhghj.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Struct lv5207lp_platform_data refers to a platform device within
> the Linux device hierarchy. The test in lv5207lp_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

