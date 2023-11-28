Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3E7FC43D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 20:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7164C10E172;
	Tue, 28 Nov 2023 19:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A119310E172
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701199614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MS3bSC/lh7WFrp63LfDhGI9l2oiNjApvavz8PpRiwhM=;
 b=Ui53o74e3cph4AxCFPNAowm/eVVtFNsaQYyqUmtwQ6A9770EGkvk7h5XydO9b4jcHG4U/V
 em2n0PPK+QnmUXklIV2UqL9aYCsi7GCqC4oDXUme64SWUDMfy+56FMMOPcajcNFlrJP1bb
 f+JTzX40Ejd4adACwMoiie5xuVqPuxA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-j7PLfpo-OUyHvqjxdwy7iA-1; Tue, 28 Nov 2023 14:26:53 -0500
X-MC-Unique: j7PLfpo-OUyHvqjxdwy7iA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40b23aef363so38174805e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 11:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701199612; x=1701804412;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MS3bSC/lh7WFrp63LfDhGI9l2oiNjApvavz8PpRiwhM=;
 b=sQx5a1AW4v3xqFV2g3QKQlRdcHdxePe/scA+/WCmC2KsDbhffJKjbh7R9KVtg0WZ8h
 UOA++2MJkSzXjQZImKyMfqEVsRoZm9K9KpiB2Zw6fcp5RMd66C/HApId+cngu6zJXqZ9
 CkZQbMY0rFY/WnGFgSsRM0s+ux6lIJHmD/fk7tys78yLMUUM89OBt1hlYZJkTBaPtxQX
 U28m75GOAnDEtHwiiXV4lrxSwsYDoIewCS3lBImFO3OyZuflV+GHkSQ/HCAk47GEdnFR
 /jxGJyipEOD7wfG29//EU4yMkBQja/IsUkUz76NQntJfah7hGtqLIdh+ZJNMe+GxZF/a
 aYHA==
X-Gm-Message-State: AOJu0YyQadVEAmlNceDTbuy4ILn1JXDMKcmQwRdl3lSc23BgpdypqVLe
 2ZkDQPCUXRauxuK/pRoem9OZR6m6cTMRJ7IkApYZZrtqEcQbm4sMVvcXGR8EH5zYnuGWmdhoJVf
 LEkher9OOgROWpPFYMqvJ4OCAHyY6
X-Received: by 2002:a5d:698f:0:b0:333:a30:1084 with SMTP id
 g15-20020a5d698f000000b003330a301084mr2562152wru.36.1701199612456; 
 Tue, 28 Nov 2023 11:26:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgXVVnlAR7W0JMvI7O0Q/Or9OcgM4j86TTiRG31fyoyYCrlzYqVF+Thl0Tirl17AB6LtZAoQ==
X-Received: by 2002:a5d:698f:0:b0:333:a30:1084 with SMTP id
 g15-20020a5d698f000000b003330a301084mr2562142wru.36.1701199612107; 
 Tue, 28 Nov 2023 11:26:52 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s18-20020a5d6a92000000b00332eaede976sm12668449wru.86.2023.11.28.11.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 11:26:51 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/imagination: DRM_POWERVR should depend on ARCH_K3
In-Reply-To: <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
 <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
Date: Tue, 28 Nov 2023 20:26:51 +0100
Message-ID: <87il5lbrwk.fsf@minerva.mail-host-address-is-not-set>
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
 Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Matt Coster <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,
>
> On Tue, Nov 28, 2023 at 8:03=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Geert Uytterhoeven <geert+renesas@glider.be> writes:
>> > The Imagination Technologies PowerVR Series 6 GPU is currently only
>> > supported on Texas Instruments K3 AM62x SoCs.  Hence add a dependency =
on
>> > ARCH_K3, to prevent asking the user about this driver when configuring=
 a
>> > kernel without Texas Instruments K3 Multicore SoC support.
>> >
>> > Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton PowerVR driver=
")
>> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> > ---
>>
>> Indeed. Although I wonder what is the supposed policy since for example
>> the DRM_PANFROST symbol only depends on ARM || ARM64 and others such as
>
> I think ARM Mali is sufficiently ubiquitous on ARM/ARM64 systems to
> have just an ARM/ARM64 dependency...
>

Fair.

>> DRM_ETNAVIV don't even have an SoC or architecture dependency.
>
> Vivante GPUs are found in DTS files on at least 4 architectures.
> Might be worthwhile to add some dependencies, though...
>

Yeah, that's what I was thinking.

>> In any case, I agree with you that restricting to only K3 makes sense.
>
> I am looking forward to adding || SOC_AM33XX || ARCH_RENESAS || ...,
> eventually ;-)
>

Same! :)

>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --=20
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

