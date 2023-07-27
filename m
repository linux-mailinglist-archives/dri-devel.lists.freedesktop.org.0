Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A09B765849
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CD810E5B8;
	Thu, 27 Jul 2023 16:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F1C10E5B8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690474057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Su0g10iLHEY482b8Otv4NozvAkFc0iayLWU1qcjgX8E=;
 b=ZQruNRK4YmW4MuVvvi2wPeAWHeP3Apyl5ilIXvPVGH2ANfi47vlIq2Y6y6mTdOOMtF5iBG
 t29JhjNg+/Aayrq32skOvQEWnZc43rQUlGj2O47hbp08aaOLcrAPfLQzuJF1m+3W25ZGVD
 gzhLiO/xNS8T7/nCj2mwLVmmtNKHMGw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-vac0bwOPOdmJKx7k8SxwRw-1; Thu, 27 Jul 2023 12:07:34 -0400
X-MC-Unique: vac0bwOPOdmJKx7k8SxwRw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fd2dec82b7so6645875e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690474053; x=1691078853;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Su0g10iLHEY482b8Otv4NozvAkFc0iayLWU1qcjgX8E=;
 b=cq59Kr16afnRe3BPTj1Pi5swCz5WRzwsHMXADiRx2TNDbGySYSFnrF9lHJukZBb4Dx
 5ASWXXmrVVRzlgeRX/FzjuyX0S5n0zZo6tqtGUe8UlHpGqZWbtOWiVylpQwKUDw5CqHC
 LEuEW4mKzPVZClf/wn/yTY8/44cbRkhBTsjUShMx8zvH6GnVZd5KyP13FDK1/By/Y093
 +bQ/nzGjBIQRlF1YkN+qg7bbOzysMaLz4DBbE0ggMsYPkv3bidCqORkeIqZ6EEYo4R/C
 StqdXm3lPyKNJZhyBMf+ScR7mceNYb93AYhmEkiaNfwpyD9w3OMzX5Lj1UqSbhYYkFSG
 5QLw==
X-Gm-Message-State: ABy/qLaF5QMthlx8HjS1Vx7EAG9cZC6ySgy+SlMesL65nqrGOpxR8o0w
 4Ymdj/yrmVzZrPIlkXUIbKmx2BJWi8XorYkJ9KUzLvTQZIu2yrusrum9MZlK1mq0d+GFX33B6bp
 qkFE2pIGDn06gJbWMVIlWebDfQ22s
X-Received: by 2002:a5d:458a:0:b0:317:6965:ef4d with SMTP id
 p10-20020a5d458a000000b003176965ef4dmr2108305wrq.56.1690474053147; 
 Thu, 27 Jul 2023 09:07:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlECAlh3awhpT8gJi2UhFn5aOknusQVfcori49ZdU3m0m/tZnHwiyfBU4kPrb/SeWqKEEpMn5w==
X-Received: by 2002:a5d:458a:0:b0:317:6965:ef4d with SMTP id
 p10-20020a5d458a000000b003176965ef4dmr2108291wrq.56.1690474052761; 
 Thu, 27 Jul 2023 09:07:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t4-20020a0560001a4400b003176053506fsm2388126wry.99.2023.07.27.09.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:07:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, Arthur Grillo <arthurgrillo@riseup.net>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tests: Remove CONFIG_DRM_FBDEV_EMULATION on
 .kunitconfig
In-Reply-To: <86fcd546-c2db-41ca-a087-74c3cd5ce341@app.fastmail.com>
References: <20230726220325.278976-1-arthurgrillo@riseup.net>
 <86fcd546-c2db-41ca-a087-74c3cd5ce341@app.fastmail.com>
Date: Thu, 27 Jul 2023 18:07:31 +0200
Message-ID: <87lef1s5h8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: tales.aparecida@gmail.com, Helge Deller <deller@gmx.de>,
 mairacanal@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Thu, Jul 27, 2023, at 00:03, Arthur Grillo wrote:
>> Using the `kunit_tool` with the command:
>>
>> tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests/
>>
>> Lead to this error[0]. Fix it by expliciting removing the
>> CONFIG_DRM_FBDEV_EMULATION.
>>
>> [0]
>> ERROR:root:
>> WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>>   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
>>   Selected by [y]:
>>   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
>>
>
> I think that's a bug in the Kconfig files that should be fixed
> by enforcing the correct set of dependencies. I have not encountered
> this in my randconfig builds (with a lot of other fixes applied)
>
> In linux-next, CONFIG_VT cannot be disabled if CONFIG_EXPERT=n,
> so this does not happen.
>

>> diff --git a/drivers/gpu/drm/tests/.kunitconfig 
>> b/drivers/gpu/drm/tests/.kunitconfig
>> index 6ec04b4c979d..c50b5a12faae 100644
>> --- a/drivers/gpu/drm/tests/.kunitconfig
>> +++ b/drivers/gpu/drm/tests/.kunitconfig
>> @@ -1,3 +1,4 @@
>>  CONFIG_KUNIT=y
>>  CONFIG_DRM=y
>>  CONFIG_DRM_KUNIT_TEST=y
>> +CONFIG_DRM_FBDEV_EMULATION=n
>>
>> base-commit: 45b58669e532bcdfd6e1593488d1f23eabd55428
>
> Changing the local config should not be required after fixing
> the Kconfig files.
>

CONFIG_VT can only be disabled if CONFIG_EXPERT=y but I also see that it
does not default to 'y' if !UML. Also FRAMEBUFFER_CONSOLE depends on !UML
but DRM_FBDEV_EMULATION selects FRAMEBUFFER_CONSOLE if !EXPERT.

Maybe we should include !UML in that condition to? Something like this:

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 0d499669d653..734332f222ea 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -135,7 +135,7 @@ config DRM_DEBUG_MODESET_LOCK
 config DRM_FBDEV_EMULATION
        bool "Enable legacy fbdev support for your modesetting driver"
        depends on DRM
-       select FRAMEBUFFER_CONSOLE if !EXPERT
+       select FRAMEBUFFER_CONSOLE if (!EXPERT && !UML)
        select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
        default y
        help


With that I'm able to run the DRM kunit tests wihtout the mentioned
problem. But I'm not sure if that is the correct fix or not.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

