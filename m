Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894E77027C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 16:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DBE10E711;
	Fri,  4 Aug 2023 14:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8AA10E711
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 14:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691157801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rM0KkvOUv4Nz/Z5qH0iBKJPwNP5wSyX/+jjNpzRgOhU=;
 b=V/drah5YBOKDkHWsLCQJ0v0/Wvr6U53OsQQmx26OE++Rw8Rn+oEJ1V448EJb8mhZ1HYudM
 7qUuwZD1GndQqVRkPrJygNSebpHpym9jWCC33A2NubdX9FjYBlpvCjxZ4UiDWi7DbcPTLP
 YtPC3liyr1xvbLBUbgQvhQLyU/14Dtw=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-anLLqdE4OQe6-zWpZwpp6g-1; Fri, 04 Aug 2023 10:03:19 -0400
X-MC-Unique: anLLqdE4OQe6-zWpZwpp6g-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6bb23d4b3b7so3330458a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 07:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691157799; x=1691762599;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rM0KkvOUv4Nz/Z5qH0iBKJPwNP5wSyX/+jjNpzRgOhU=;
 b=FycfJDZ4Wnf/dnTPJ+4JYGxRW8f0dLqh+qAq2YGtKB/WpnUK3N8L3gwk+qX61v6FlJ
 PLHvFJQCAcpXGkeAK9k1+WT4lBLdjpMab8QNwfjZO8BrklK9G2T8Nk4qWdsf7Toek/Tm
 eGkrfU68F/yyfhcZ2f2Sbx8jBKC26YZ9OmVXp3laVYCavv0i0Grlqfvsb+vpvzLC3rBJ
 W/cxmLeKDr2stHUXGbUsmKqmGv0aC7TLPaGHurmxpzZtp64xPHIcJxylHt9vCE9UWbYS
 pkpa52fPHAXmEuVqcAeJzIqE/bdTxwHwiseDqa0GtOr0Hwf5SHA/bMolLJg1+uRLeeoA
 fPuA==
X-Gm-Message-State: AOJu0YzyCjT0hDcs2mOLHA/m6l5ALhGPX/waMYeWgFqxxGBO7LWZTwiN
 0IjZ+q0gI9QBTVMcy4V2pPusJ54e7svr22mTtHxTmLbtH/qBZkHIRukGvUbC2osXRJDMUiFQWpI
 CbaMzoRSOTYu4N9/w37oNckeVw/Ar
X-Received: by 2002:a05:6870:2320:b0:1b7:89b5:7c11 with SMTP id
 w32-20020a056870232000b001b789b57c11mr2102328oao.9.1691157798824; 
 Fri, 04 Aug 2023 07:03:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUV/leL4jrrZoKlc3LvgjHnG2JMNaqpN35nghURvLsFst5MZv4asGQ4fgwScpSVrKsB7d8LA==
X-Received: by 2002:a05:6870:2320:b0:1b7:89b5:7c11 with SMTP id
 w32-20020a056870232000b001b789b57c11mr2102301oao.9.1691157798536; 
 Fri, 04 Aug 2023 07:03:18 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 y1-20020a056870388100b001b047298a44sm1111240oan.52.2023.08.04.07.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 07:03:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Drop select FRAMEBUFFER_CONSOLE for
 DRM_FBDEV_EMULATION
In-Reply-To: <19a2a2a0-2f35-4c4e-926c-47b75e6f9353@app.fastmail.com>
References: <20230804125156.1387542-1-javierm@redhat.com>
 <CAKMK7uH=7m=2Y0SxPm2Q1J+u2MRWHNQrYy7M5se7Ua9ZA19y=A@mail.gmail.com>
 <19a2a2a0-2f35-4c4e-926c-47b75e6f9353@app.fastmail.com>
Date: Fri, 04 Aug 2023 16:03:15 +0200
Message-ID: <87sf8ygb18.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Fri, Aug 4, 2023, at 15:07, Daniel Vetter wrote:
>> On Fri, 4 Aug 2023 at 14:52, Javier Martinez Canillas
>> <javierm@redhat.com> wrote:
>>>
>>> The commit c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev
>>> emulation is enabled") changed DRM_FBDEV_EMULATION from 'depends on FB'
>>> to an effective 'select FB_CORE', so any config that previously had DRM=y
>>> and FB=n now has FB_CORE=y and FRAMEBUFFER_CONSOLE=y.
>>>
>>> This leads to unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>>> as reported by Arthur Grillo, e.g:
>>>
>>> WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>>>   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
>>>   Selected by [y]:
>>>   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
>>>
>>> Arnd Bergmann suggests to drop the select FRAMEBUFFER_CONSOLE for the
>>> DRM_FBDEV_EMULATION Kconfig symbol, since a possible use case could
>>> be to enable DRM fbdev emulation but without a framebuffer console.
>>>
>>> Fixes: c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled")
>>> Reported-by: Arthur Grillo <arthurgrillo@riseup.net>
>>> Closes: https://lore.kernel.org/dri-devel/20230726220325.278976-1-arthurgrillo@riseup.net
>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>
>> Yeah originally this was just to help people not misconfigure their
>> kernels and end up with a black screen. But select is really not a
>> nice way to do that, imo we could drop the FB_CORE select too :-)
>
> Droping the 'FB_CORE' select only works if we make FB_CORE user
> visible and add a 'depends on' for it instead. Not sure this
> is any better since this would only ever be used when either
> CONFIG_FB or CONFIG_DRM_FBDEV_EMULATION is enabled.
>

Agreed.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

