Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870FE8039A5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 17:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4991010E393;
	Mon,  4 Dec 2023 16:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C3210E38A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701705947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QGdgnF2wcPg+WLImd2Z9FE8dDI6pQ1qHLPAqI4tPr8Y=;
 b=fUplA7B9+a0iPUYEM7fHkREtw1+mdg0xIYR3C8grqJQDPmyrIobqf/cJ6osBW+IKR0rfyb
 Ale7KgGzdw+at4SsHpbdC2R6RkrXs/WMHIVq7rScnombeOj9/DOhmlFeYBO9dRu2QDZ3O6
 kzwtk2RY9KofbeUieApzMU/9zeU4pg0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-OXkluMWDMWmXI3NIB9pG4g-1; Mon, 04 Dec 2023 11:05:40 -0500
X-MC-Unique: OXkluMWDMWmXI3NIB9pG4g-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3334b472196so675389f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 08:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701705932; x=1702310732;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=72Qq8SUAOQ029tY/AmkNsTOso8dRLQAyWrIEdI18AJU=;
 b=WS0hrZTYn1i151URMG/l7I9DQJZ6b3yrcsljags5xHPyr4kiq/Fqm9GO+9bx9Tbzkn
 dPfiBhUIjBH6NmLGOS1zUm7Vlgq9jOJr/enRTNejr6Q2wcSUDuyl0tx5wiWJFbR/udWS
 ZXriDzbbvYUGilbwaYtlpzMnERe7dp6uaSo16u0qPzrS7NdwJSHrKGfMB2fvXazmqaAQ
 kRjq0SpZ8yqre3HU0mkZTiC6xEEdTyVaI/zfXWlhHgD8d+btjbxms6HJKCb/RqqnVx+K
 CSpgyRyq0jHnlK9rhajoco4uY7ua3NJrVbdyhtGpJvzXZTHVN/moWYD7khMLCuV02dgw
 7pwQ==
X-Gm-Message-State: AOJu0YzbhiLF+Ww0XMVvTIzi2ZUgkdTFb+Tl171Vgm/jVrn2X9r407vf
 J1symPVX5spPdM4E6geZFpD4o98rta6oVg38boxrCun+ZWm8Vbl7JtghD2vKvYRVdYIl+QrcJGU
 J3Itp6AvhZv7Dl62/7da2gEDY4k6x
X-Received: by 2002:adf:f841:0:b0:333:38b1:2bde with SMTP id
 d1-20020adff841000000b0033338b12bdemr2460717wrq.100.1701705932206; 
 Mon, 04 Dec 2023 08:05:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO2c8RIk7FOWrdCK6Vi2bSTizrP/0htWBOg3sB5XZ8oHosjIGzLt0ctc0XtiZkgie4jvH15Q==
X-Received: by 2002:adf:f841:0:b0:333:38b1:2bde with SMTP id
 d1-20020adff841000000b0033338b12bdemr2460709wrq.100.1701705931899; 
 Mon, 04 Dec 2023 08:05:31 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05600010cc00b0033340aa3de2sm5284527wrx.14.2023.12.04.08.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 08:05:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
In-Reply-To: <CAL_Jsq+7AwuLt9pfX0zr8g=65zSVLUFzFds82ENaspEFQNK=gg@mail.gmail.com>
References: <20231113085305.1823455-1-javierm@redhat.com>
 <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
 <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
 <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
 <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>
 <58672ab8-99bf-4a2a-af79-031d1e8fcba0@suse.de>
 <87fs0mxlyp.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJbZ736iV+bRbSNNaimkbJLpB9MbeKLSct16Yi67ttFcw@mail.gmail.com>
 <87a5qqxq56.fsf@minerva.mail-host-address-is-not-set>
 <CAL_Jsq+7AwuLt9pfX0zr8g=65zSVLUFzFds82ENaspEFQNK=gg@mail.gmail.com>
Date: Mon, 04 Dec 2023 17:05:30 +0100
Message-ID: <87zfyqvtpx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frank Rowand <frowand.list@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Herring <robh@kernel.org> writes:

> On Mon, Dec 4, 2023 at 3:39=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Rob Herring <robh@kernel.org> writes:
>> > On Fri, Dec 1, 2023 at 4:21=E2=80=AFAM Javier Martinez Canillas

[...]

>>
>> > However, there might be one other issue with that and this fix. The DT
>> > simplefb can have resources such as clocks and regulators. With
>> > fw_devlink, the driver won't probe until those dependencies are met.
>> > So if you want the framebuffer console up early, then you may want to
>> > register the EFI framebuffer first and then handoff to the DT simplefb
>> > when it probes (rather than registering the device).
>> >
>> > But I agree, probably better to take this patch now and have those
>> > quirks instead of flat out not working.
>> >
>>
>> If we do that what's the plan? Are you thinking about merging this patch
>> through your OF tree or do you want to go through drm-misc with your ack=
?
>
> I can take it. Do we need this in 6.7 and stable?
>

IMO this can wait for v6.8 since is not a fix for a change introduced in
the v6.7 merge window and something that only happens on a very specific
setup (DT systems booting with u-boot EFI and providing an EFI-GOP table).

Also the -rc cycle is already in -rc5, so it seems risky to push a change
at this point. And distros can pick the patch if want to have it earlier.

> Rob
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

