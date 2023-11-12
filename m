Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F627E918D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 16:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FAB10E0C8;
	Sun, 12 Nov 2023 15:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C835610E0C8
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699804192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1iGUBaKM2azxvdhKt2504NIadxJuEuzBdu7h+LqBo+w=;
 b=dL2fOY+n9IQHfX8FcgAb1+apwkgg3BMUv9YD7JTchwYIVwtPS94p33eqG96aYy6c2S0ZWD
 yKXDUkdhv14d0xn8QNLMFfCH2k2EbeGExmiRzJ3+fGyFBXY7WSXWv3SqguS7sUBglNmOI+
 rDgmKkO1OIvLwUiqLppcgsjp+XtpBOA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-iBjG6xOjN6a_UqZd3FLmrw-1; Sun, 12 Nov 2023 10:49:51 -0500
X-MC-Unique: iBjG6xOjN6a_UqZd3FLmrw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40839252e81so23619325e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 07:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699804190; x=1700408990;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1iGUBaKM2azxvdhKt2504NIadxJuEuzBdu7h+LqBo+w=;
 b=j6jFJ9vXexMcq8JcA8M9Eh55Evd5qo5KTNcE9I4J/gnZpJcVsWyhh88PDXRHwM9KZk
 9LbJ5ddMB9KVcOanw0wtxy80DpNznxFqmgxcFIyXcbYZE4Aam6WJ63lGOSqsUqnly7dD
 mLoBUq01Va2/5FwC1S2dTgVNcmCPnNmM2D2o/mfAfk2gtgViAyucBVCB2T3OK7nIeJ6X
 BUEGTALB5h27Nc/w0GSvSUCMXIjxv7WIxs2EDo9I7Xxz0Ve3mxUywVKjxs8WTq8nMmV0
 pclYDUlhrI9xzD037t06SM/nhfqt7E+xE8NgLTGmFGyLg4fHmCeAHIsdkJ3xKyTlPrlR
 LmIA==
X-Gm-Message-State: AOJu0YxWurjv2PdbbzZw/InWMUTasIiHFmC+c0KqBcxb+7ZleN8dCPwr
 SnB7UuGII0xBHzNjymLntBxXBWn9pyCJ5DpMAtYsZrarszGgq334d+3ctVp4YSkn9T+LAGhahqi
 jWF/IyBE1mDlHqYupV/cY379uyKNL
X-Received: by 2002:a05:600c:450a:b0:409:375:5a44 with SMTP id
 t10-20020a05600c450a00b0040903755a44mr3732205wmo.24.1699804190081; 
 Sun, 12 Nov 2023 07:49:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUuuVMqtepn8YqkS2uXyv/BIU5zsNbbkXjFlgY9AV4c/T4BJKy5pu+jFjucMYUqC95FSxPsA==
X-Received: by 2002:a05:600c:450a:b0:409:375:5a44 with SMTP id
 t10-20020a05600c450a00b0040903755a44mr3732194wmo.24.1699804189595; 
 Sun, 12 Nov 2023 07:49:49 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z14-20020adff74e000000b0032f7865a4c7sm3530465wrp.21.2023.11.12.07.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 07:49:49 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andrew Worsley <amworsley@gmail.com>
Subject: Re: [PATCH] Fix failure of simpledrm probe when trying to grab FB
 from the EFI-based Framebuffer
In-Reply-To: <87a5rj9s37.fsf@minerva.mail-host-address-is-not-set>
References: <20231111042926.52990-1-amworsley@gmail.com>
 <20231111042926.52990-2-amworsley@gmail.com>
 <CA+Y=x3mF4jFX7PiJQ-1Gk9zyBE1mwZaF_GLYjSspT+mxtMn4GQ@mail.gmail.com>
 <87cywgac4r.fsf@minerva.mail-host-address-is-not-set>
 <CA+Y=x3nift8Xt_zT1na7D3ReRwy6Lh66Cszz9zkBpkz7tka20w@mail.gmail.com>
 <87a5rj9s37.fsf@minerva.mail-host-address-is-not-set>
Date: Sun, 12 Nov 2023 16:49:48 +0100
Message-ID: <877cmn9dk3.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>, "open
 list:DRM DRIVER FOR FIRMWARE FRAMEBUFFERS" <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

[...]

>
> Reported-by: Andrew Worsley <amworsley@gmail.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/of/platform.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>

Forgot to include the header file and just pointed out by the robot, so
need the following snippet too:

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f235ab55b91e..2894d03f4415 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -20,6 +20,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/sysfb.h>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

