Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169D6DE018
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 17:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A018410E24B;
	Tue, 11 Apr 2023 15:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D17710E24B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681228572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHG1My1VeRee6oD0THwhsG4DuSSnp1W6TQT/rZC0ASg=;
 b=cA1Y7abIGwZbQjfcpYKUzj8UcMNJPakrpkOLx4ZEnfiGrepijcjekaMpAdGLxFduNsUwzl
 g3O82nPKG1XuWRH2fP9AVKRwQ7N9rCLxIMfKdR0OITMBtuTowCs5n3itrnjfHUt/pu7p4M
 cqgXlnq5g15OvEmign73gQbMmd6gVKM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-v5mKCxjXP36YWIlB2V1lLA-1; Tue, 11 Apr 2023 11:56:11 -0400
X-MC-Unique: v5mKCxjXP36YWIlB2V1lLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o4-20020a05600c510400b003eea8d25f06so1877047wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 08:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681228570;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fHG1My1VeRee6oD0THwhsG4DuSSnp1W6TQT/rZC0ASg=;
 b=qwnjbP/kbALecb8ARnW3NP0Fwr3seIIcSf8qnwHsf3U8RLbK+xeOfvyId44wKw++cs
 t9iHFCo3IZKWjTU8OAy/6i/048KXDgPH/61lKpNQP9LqEi+4KHTdsVxCiI6fuUbCVX+u
 SIg0A8KYvBQYE7JLBD0Ia1y9D6lPqb2JT4js5W4bvWLR1jM/we7Y+LeR8EVqa+PIj31f
 /8J1ae+I7x8BiUdrwwc/FLJav11eD4r3ThpSE+9P4MhW424OWv5u6OwaDUdxiQMJba1Q
 +G9/9HzQvuMOau/Vx6p7EE3rLKveeRfHxNzgq3D3QWHiIDcqGceeLNRavTxGfRCaDFt9
 h/bg==
X-Gm-Message-State: AAQBX9f5aL6yp6tu+q1XsbuvI19ygA9otGYh3qvOMfvzMAXna76R7o6c
 FtwJ25IOBGJDM+FwCnc0C/3dYjsqWd0u0juoIIK77J74xx8fkctKFgXQyWQmSQw70bDBAUFO6NS
 vh55NumW+7deKDbkjAagFINbmTNCh0Onytxes
X-Received: by 2002:a1c:7412:0:b0:3f0:46ca:f201 with SMTP id
 p18-20020a1c7412000000b003f046caf201mr9582295wmc.1.1681228569903; 
 Tue, 11 Apr 2023 08:56:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350bxMxK5NVGyTTF89bFjPt0jmBke7OdQADtoxJTWNSTSc9tiBVnrm204jB22Qt7GFRjYkSmcEg==
X-Received: by 2002:a1c:7412:0:b0:3f0:46ca:f201 with SMTP id
 p18-20020a1c7412000000b003f046caf201mr9582275wmc.1.1681228569587; 
 Tue, 11 Apr 2023 08:56:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc858000000b003ef5b011b30sm17499378wml.8.2023.04.11.08.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 08:56:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pierre Asselin <pa@panix.com>, Pierre Asselin <pa@panix.com>
Subject: Re: [PATCH v3 01/13] firmware/sysfb: Fix EFI/VESA format selection
In-Reply-To: <2ca4fbdb87a335522c22551658576e55.squirrel@mail.panix.com>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-2-tzimmermann@suse.de>
 <4Psm6B6Lqkz1QXM@panix3.panix.com>
 <2ca4fbdb87a335522c22551658576e55.squirrel@mail.panix.com>
Date: Tue, 11 Apr 2023 17:56:08 +0200
Message-ID: <87zg7es99j.fsf@minerva.mail-host-address-is-not-set>
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
Cc: tzimmermann@suse.de, Pierre Asselin <pa@panix.com>, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Pierre Asselin" <pa@panix.com> writes:

Hello Pierre,

> Oh oh, I just reproduced the problem on a desktop tower, a Dell Precision
> T3610, probably 2019 vintage.  The only thing in common with the old
> laptop, that I can think of, is that both use the legacy BIOS.  The Dell
> has EFI but the graphics card may not support that; there is no integrated
> graphics, if I switch to EFI and lose the video I may not be able to switch
> back.
>

Can you please share you grub config file? It seems that is set to
GRUB_GFXMODE=1024x768x32 but the actual mode is set to 1024x768x24 ?

That is, it fails when the picked format is DRM_FORMAT_RGB8888 but
works when is DRM_FORMAT_XRGB888. I can't spot any error in Thomas'
patch so I wonder if the problem is with what grub is passing to the
kernel.

The mentioned vga=0x318 workaround that you mentioned makes the mode
passed to match the selected DRM_FORMAT_RGB888 which I guess is why
that worked for you.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

