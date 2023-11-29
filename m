Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DE07FD1D5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 10:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6D210E231;
	Wed, 29 Nov 2023 09:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C944B10E231
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701249225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uDZQFgyX8mhP1euyePINbxQgL+bh5j5l6Xm7X/l4RM=;
 b=SjH6tPQVwZnyDr1BbVlJjcXsnG2/qXz92LTWItIZpLlnvYZhmDLMsWMsDP81P6xKZKH/UI
 kMYQ4jrfrbY0ZBC2RvNdThXDg8CE2Lucurge9cAf4v7iybQzhxQg6ENQsDtvSCNMPuXRCK
 QWakYsMeKDd1TPZ+FauAQ0agWg+6OZk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-3fVohPTPOFeMiy20wR6z6g-1; Wed, 29 Nov 2023 04:13:44 -0500
X-MC-Unique: 3fVohPTPOFeMiy20wR6z6g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-332fcd4b871so481146f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 01:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701249223; x=1701854023;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kIYj+dPIHz9wh4jZWRbFtDazrWkkAFhwhKwEoYrxKL0=;
 b=DFnRmmkET5UMV9dKEoTC6tEClY39GDp9FDj9ku2deUCU+fWvcP681hlkEkyk4ceONg
 i0yJg8+Q9Qdnmgv9DrdCQhoFfqIg0qOJXFhCqLTIqR3iMN3j0AHd8YtoQg1pEYW1I1DH
 vhmlfxaNJdTKAQfmPv5El5I+gicavELafzJQvHM6f5D6YzzK0/79B0sluRrVEVzwW7fs
 EYKd4rA/6lkQu4WatXVOfGJn4fTo0ULQlK5/6O3LYVf/0Paiq4ADGtUyUwbTGfSQcSjB
 dXBAZRkcIn3djymyJN4dj0wFqFeQB8yR8U2psNHVakgwueeytkwH6jy09f0qdMN90BDG
 gY8g==
X-Gm-Message-State: AOJu0YyTwiN2SQbK9qnXXk51GyJQSGZOhVNzJ3HE67IRujxmZS/RPhFj
 +uYBy6ExAncP1gQ1ncN3XRzo+MVpNC/6pBuNdeMCYxWl9Rhxv545BWYOxuLNbvhgMmeUekvNOq2
 5ekN1JCHIgOx5/6qu3ojBBastM/Qh
X-Received: by 2002:adf:ea8e:0:b0:332:e697:3a71 with SMTP id
 s14-20020adfea8e000000b00332e6973a71mr13333906wrm.6.1701249223143; 
 Wed, 29 Nov 2023 01:13:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvyYHuJQs5X4V3XyuYjwI49kog32cJUAVoY1DIBgpPDUYBZhyF5OcuS+STu+1xnZIf6CDspg==
X-Received: by 2002:adf:ea8e:0:b0:332:e697:3a71 with SMTP id
 s14-20020adfea8e000000b00332e6973a71mr13333879wrm.6.1701249222789; 
 Wed, 29 Nov 2023 01:13:42 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r5-20020a5d6c65000000b00332f6202b82sm11783958wrz.9.2023.11.29.01.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 01:13:42 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [PATCH] drm/imagination: DRM_POWERVR should depend on ARCH_K3
In-Reply-To: <CAMuHMdVTZ8LT1yU3e1bbJODecy96TaMX1hq_swqmT6L+mbH3aQ@mail.gmail.com>
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
 <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
 <7hee65pmdl5pajm2kgqld22xfi4iox4s2psswu2mdlfk6u6f7x@w4ecogdx6uj6>
 <CAMuHMdVTZ8LT1yU3e1bbJODecy96TaMX1hq_swqmT6L+mbH3aQ@mail.gmail.com>
Date: Wed, 29 Nov 2023 10:13:41 +0100
Message-ID: <87cyvsc46y.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Nishanth Menon <nm@ti.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Maxime,
>
> On Wed, Nov 29, 2023 at 9:35=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
>> On Tue, Nov 28, 2023 at 08:16:18PM +0100, Geert Uytterhoeven wrote:
>> > On Tue, Nov 28, 2023 at 8:03=E2=80=AFPM Javier Martinez Canillas
>> > <javierm@redhat.com> wrote:
>> > > Geert Uytterhoeven <geert+renesas@glider.be> writes:
>> > > > The Imagination Technologies PowerVR Series 6 GPU is currently onl=
y
>> > > > supported on Texas Instruments K3 AM62x SoCs.  Hence add a depende=
ncy on
>> > > > ARCH_K3, to prevent asking the user about this driver when configu=
ring a
>> > > > kernel without Texas Instruments K3 Multicore SoC support.
>> > > >
>> > > > Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton PowerVR dr=
iver")
>> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> > > In any case, I agree with you that restricting to only K3 makes sens=
e.
>> >
>> > I am looking forward to adding || SOC_AM33XX || ARCH_RENESAS || ...,
>> > eventually ;-)
>>
>> I disagree. This is to handle a generic IP, just like panfrost, lima, or
>> etnaviv, and we certaintly don't want to maintain the Kconfig list of
>> every possible architecture and SoC family it might or might not be
>> found.
>
> While PowerVR is a generic IP, I believe it needs a non-generic
> firmware, which is currently only available for AM62x SoCs.
> Once it becomes truly generic, I'm happy to drop all platform
> dependencies.  Until then, there is no point in asking everyone who
> configures an arm64 kernel about this driver, unless they also enabled
> K3 support.
>

That's true but it will require a Kconfig patch every time that there is a
design with a different SoC using this generic IP.

So when should be added? Once there's an upstream DTS that has a GPU device=
?
Once there's a firmware for it in linux-firmware?

I like the guideline of not having a depends on for generic IP and only hav=
e
for IP that can only be used in designs with a SoC from the same vendor.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

