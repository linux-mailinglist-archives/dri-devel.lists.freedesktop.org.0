Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF23B770655
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 18:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB0B10E03A;
	Fri,  4 Aug 2023 16:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7648B10E03A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 16:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691167905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+vP0dlW9cj+ApxHox6i9vs6i/QXMBGte1ysC4SvGPpc=;
 b=iE5Nxw9fMVwDHCCL6d/j5NQnN21fA8VXu49S4F7bc/p0bczRw6fGvd/YVedMXbyyYWPp9d
 VQ29/d5BUj+qYYmVLWns0888urZm6AWGg4DpWZJOM5ahRC/x1jXcfKj6DDEzvmfNRzj4PR
 QSIaSMDFdI3S3VYql5VGOsQkSuWli0M=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-2RznOHqGORaUlZuTim0KUg-1; Fri, 04 Aug 2023 12:51:42 -0400
X-MC-Unique: 2RznOHqGORaUlZuTim0KUg-1
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-3a72b2a52e5so3729183b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 09:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691167901; x=1691772701;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+vP0dlW9cj+ApxHox6i9vs6i/QXMBGte1ysC4SvGPpc=;
 b=Xkc9fKRMjIJo5gF1W27GSfNBvIxB1VeNRLWfCDsQEFYWgIOHJpVvUh9kOV3GLlI8mw
 z/oARxF/SwvE06GBRituxNjHXUmVU/GNV2916XK1c163BeJqsGKY/ouUuO5+QMah4y8u
 Dr8gs4zPyQKqWQYyAVNwcmf9QXvW/eSRfB14GDa1N46Dvz4Yj4qWpzkX+vHPnrm7Bi9R
 So+3S76JUgxnIu2Q/uaVGgB93GCwoKEjykyCxAREXLb84R7xsspa7JSAXbMhr4DTanxB
 UlCSLcZVG1RMBMqXD0ayNIhoxy6fe9yt4JFhsmj31s77XRg8yUwc9EHQcHC90vl6GZ1J
 Pw8g==
X-Gm-Message-State: AOJu0YwOjMxkr0k8UgqtwUbVRfFESeLT9YDVF3/zIga5RW3tn534MK+o
 0IT9lXyPRGpsc7lJD+RiT8gEYe3YS+Yw3ucHx7C29O8h5fRAeh6JLeVivnrrv8ehURo9UMEeGlQ
 1tqD/O25awj6tT2cbS7ALlHTpTlnjdbROoUdc
X-Received: by 2002:a05:6808:e88:b0:3a1:d1d9:d59c with SMTP id
 k8-20020a0568080e8800b003a1d1d9d59cmr3264673oil.33.1691167901377; 
 Fri, 04 Aug 2023 09:51:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTPxIsm1c2cbX9Vb17Ch6ysG77QB/wTtj/fSLqgqSPY1KXpy+17/4mg3wGKDD4xNAKQ91FXg==
X-Received: by 2002:a05:6808:e88:b0:3a1:d1d9:d59c with SMTP id
 k8-20020a0568080e8800b003a1d1d9d59cmr3264664oil.33.1691167901150; 
 Fri, 04 Aug 2023 09:51:41 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 i10-20020a056808030a00b003a3611eb6ddsm1203016oie.19.2023.08.04.09.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 09:51:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arthur Grillo <arthurgrillo@riseup.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: Drop select FRAMEBUFFER_CONSOLE for
 DRM_FBDEV_EMULATION
In-Reply-To: <7950bcea-0f15-da2e-e4f7-4bfa474a420f@riseup.net>
References: <20230804125156.1387542-1-javierm@redhat.com>
 <7950bcea-0f15-da2e-e4f7-4bfa474a420f@riseup.net>
Date: Fri, 04 Aug 2023 18:51:38 +0200
Message-ID: <87pm42g38l.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arthur Grillo <arthurgrillo@riseup.net> writes:

> On 04/08/23 09:51, Javier Martinez Canillas wrote:
>> The commit c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev
>> emulation is enabled") changed DRM_FBDEV_EMULATION from 'depends on FB'
>> to an effective 'select FB_CORE', so any config that previously had DRM=y
>> and FB=n now has FB_CORE=y and FRAMEBUFFER_CONSOLE=y.
>> 
>> This leads to unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>> as reported by Arthur Grillo, e.g:
>> 
>> WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>>   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
>>   Selected by [y]:
>>   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
>> 
>> Arnd Bergmann suggests to drop the select FRAMEBUFFER_CONSOLE for the
>> DRM_FBDEV_EMULATION Kconfig symbol, since a possible use case could
>> be to enable DRM fbdev emulation but without a framebuffer console.
>> 
>> Fixes: c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled")
>> Reported-by: Arthur Grillo <arthurgrillo@riseup.net>
>> Closes: https://lore.kernel.org/dri-devel/20230726220325.278976-1-arthurgrillo@riseup.net
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>
> Greate patch! I was about to send the same one XD.
>
> Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

