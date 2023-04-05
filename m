Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D506D851B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 19:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD83B10E1DE;
	Wed,  5 Apr 2023 17:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF9710E1DE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 17:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680716641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+OOQA9PZQd4PUwJ9BuG68QxiObq/aqDA99CcsUtChQ=;
 b=cViaJDKLO0LoruADgKOBLt1JzBdwaXIeP7RMt2R6cFaQXoldi7NnYJWnNH2efAxvq13f2D
 aFw+KwnYvIpcMH7ZO9nqt9QMFWQwNf7HiAcVHceX0PPuvmDDEi1CBgwXc/hJANEavVJnDg
 PP7UTm/mfoKBnB9WdQAG+zTjCVJ50p8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-ciXJo3nCOy-qBNpSWy8Uvg-1; Wed, 05 Apr 2023 13:44:00 -0400
X-MC-Unique: ciXJo3nCOy-qBNpSWy8Uvg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n11-20020a05600c3b8b00b003f04739b77aso7479701wms.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 10:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680716639;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1+OOQA9PZQd4PUwJ9BuG68QxiObq/aqDA99CcsUtChQ=;
 b=JPatzHbHxLYfnBYd3eJ30/iRWIqfV9CF6KsFxntNjy6Sn/WZiF+v5aWC1OC2cIvJQK
 ibpNL1MbuMxHLdeKR299KADQ4RCTQxpK0GLKhnJ5z0VPU0Aot2GbNbR+yn4cBX9TmFjg
 cIumFNycVpcXtmtBZg+alxAE2JatxH2Oh1+zuo59Jp/TJ0KL0ww7O2bqRftoofvCcSOQ
 3TVQMvJWNiyZDNFqBy8TxSKFAONHpxGuKx4ozPrhHXk+Jf8jYuZyFYOX9pt0qgz4lJlr
 aqEMyC7LsACqed4R6QFX2Ylr4QeqA1c/C6AMNHeCByriK7rPcNkCNX4VXtyHBDhQCaST
 Q+jQ==
X-Gm-Message-State: AAQBX9db9z6lDbNZPopDNbfKIR5nQ3qaOSzCXfYsC96OqnLmkMXblYQO
 e68bvDOt/ng0CMrf603M5Dl6AO+F9zU8DRUaPq4OwCYwaU0Iwd05aW5COjaX7sCY0YxumvkBwYg
 m26jbR8CtKUZgz3leqJ12rWe6tTGs
X-Received: by 2002:a5d:6687:0:b0:2cf:6089:2408 with SMTP id
 l7-20020a5d6687000000b002cf60892408mr2387266wru.0.1680716639463; 
 Wed, 05 Apr 2023 10:43:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350bWGWG/CFxOJpT4iJdtG1Z00et7x2nuFjcUkxrAgqJ6h7Q++2YgYaFAieGG1eAWq6oDMkXL4w==
X-Received: by 2002:a5d:6687:0:b0:2cf:6089:2408 with SMTP id
 l7-20020a5d6687000000b002cf60892408mr2387257wru.0.1680716639182; 
 Wed, 05 Apr 2023 10:43:59 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o18-20020adfe812000000b002daf0b52598sm15610073wrm.18.2023.04.05.10.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 10:43:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
In-Reply-To: <CAKMK7uGbPWE5mg2+ojxxEdfknDzmjDr+5n_y-t-nYNzDFE21EA@mail.gmail.com>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
 <ZC04hoHywz0ySzAW@phenom.ffwll.local>
 <3fd03c4c-3be6-e56b-faec-bd67a58cda09@suse.de>
 <ZC1BlNCbXPlmAhj0@phenom.ffwll.local>
 <eee11545-2a78-4556-be82-5178ea09d0d8@suse.de>
 <877cuqd1f8.fsf@minerva.mail-host-address-is-not-set>
 <ZC11J3og4Kc9ta6m@phenom.ffwll.local>
 <242ab20f-affe-b55a-6068-5ea634705cf6@suse.de>
 <ZC2beu/9inolwIlr@phenom.ffwll.local>
 <87bkk29smu.fsf@minerva.mail-host-address-is-not-set>
 <CAKMK7uGbPWE5mg2+ojxxEdfknDzmjDr+5n_y-t-nYNzDFE21EA@mail.gmail.com>
Date: Wed, 05 Apr 2023 19:43:58 +0200
Message-ID: <875yaa9qch.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel@ffwll.ch> writes:

> On Wed, 5 Apr 2023 at 18:54, Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Daniel Vetter <daniel@ffwll.ch> writes:

[...]

>>
>> Yeah, agreed that if vga_remove_vgacon() isn't enough and another helper
>> is needed then starts to get a little silly. Maybe one option is to add a
>> 3rd param to aperture_remove_conflicting_pci_devices() and skip the logic
>> to iterate over PCI bars and call aperture_remove_conflicting_devices() ?
>
> The thing I don't get: Why does this matter for gma500 and not any of
> the other pci devices? Look at your gpu, realize there's a lot more

Yes, I don't know why gma500 is special in that sense but I'm not familiar
with that hardware to have an opinion on this.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

