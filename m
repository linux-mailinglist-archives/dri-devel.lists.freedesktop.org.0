Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 884D26E073C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 08:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26DE10E912;
	Thu, 13 Apr 2023 06:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF8910E912
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 06:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681368902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EtHuO00FJiC5lOLplpzGnRuAlZl/i1NIHOiXXk9MsdA=;
 b=GQ1M8svO/pk6GgL8ftUHgLeCjZqfzDUQBrWgD8AMVpbnHwL+8e5Ry0gxiM+QgGDHHZckVr
 jwHwPUCK3h6xYdGPjZ0hMUBZS6ELYPkMIrL+hyCQHvQzjDVYSzXgxeV6OwfUdZveRPiHRs
 q+05esg4VTkf9AC5Kz8KgXhlzV6P+V8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-4c0XYvsWOxS_XSIfK6Fq1g-1; Thu, 13 Apr 2023 02:55:01 -0400
X-MC-Unique: 4c0XYvsWOxS_XSIfK6Fq1g-1
Received: by mail-wr1-f71.google.com with SMTP id
 c30-20020adfa31e000000b002f614bed058so51258wrb.16
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 23:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681368900; x=1683960900;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EtHuO00FJiC5lOLplpzGnRuAlZl/i1NIHOiXXk9MsdA=;
 b=aDLczMP1ymbK1xI0yzql6Qvypqb+Lj6mb/AOcBnMSOsG1W/UVVRABpbWO2d0AuH92P
 7vxvBVOBy6mAY+Bk4kgnb00xTY1i2qgi7jBAy2K32wC5QZzKPtb2HkI5sTkrlrVPpu9U
 SNGkSCalJpPj4SsZtDMurgelP+hUgCka6rAEfg7b+MVzrg8w1TBRtMT9erRfuk2O90we
 kA0dTv9t//x0ccIuoeLonXugk/BOMOQSDQgALNjpZtII0m4xozyLBc0JFUbM3R2fg24V
 Wd+Fh+RraF2oX2P1VABW+SwT6ONe/Rj62Z1lCfmaj81GWaV+mK3pwsn5ANAumZVyIni5
 TUqw==
X-Gm-Message-State: AAQBX9f5ERL5tLldWQEjsxc/gfNVBZMRGdNyJ4N7dQDusrtuSosBqjtv
 3um1obGzKrxLBRtw7HcEz4SNg2eviMBPTTfrnej6Nrh6/03s/aiaYjTUyUo8gOQvtZ5irB8OT6R
 rB6s+fWu53JhQ1fahJEm673o3Acbs
X-Received: by 2002:a05:6000:1b8c:b0:2ef:bada:2f04 with SMTP id
 r12-20020a0560001b8c00b002efbada2f04mr517211wru.59.1681368900062; 
 Wed, 12 Apr 2023 23:55:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z0EZAgpIJMAOpMZ9YL49SvFC6ZDtVmPWTNAfJenweN0E8xHCZ6+EAumcDzrno3Pk/W5NtMoQ==
X-Received: by 2002:a05:6000:1b8c:b0:2ef:bada:2f04 with SMTP id
 r12-20020a0560001b8c00b002efbada2f04mr517202wru.59.1681368899789; 
 Wed, 12 Apr 2023 23:54:59 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4c90000000b002c7163660a9sm560860wrs.105.2023.04.12.23.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 23:54:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pierre Asselin <pa@panix.com>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
In-Reply-To: <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
 <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
 <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
 <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
Date: Thu, 13 Apr 2023 08:54:58 +0200
Message-ID: <87r0souv99.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Pierre Asselin <pa@panix.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Pierre Asselin" <pa@panix.com> writes:

[...]

> [    3.343433] sysfb: si->rsvd_size 0 si->rsvd_pos 0

Thanks for confirming this. I was expected that as mentioned since it was
the only reasonable explanation for your problem.

[...]

> What if _depth is low but the rsvd_ are right ?
> Then _width and _linelength would be inconsistent with _depth but
> consistent with the recomputed bits_per_pixel ?  How many ways can the
> firmware lie ?
>

I don't know. But in your case the firmware is not reporting the mode
correctly since it is setting a framebuffer of 1024x768 and xRGB but
is not reporting si->rsvd_size=8 and si->rsvd_pos=24 as it should.

One option is to have a DMI match table similar to what we already have
for EFI machines in drivers/firmware/efi/sysfb_efi.c but also for BIOS.

The question then is if we can trust other systems to report a proper
rsvd_size and rsvd_pos...

> We need more testers, don't we ?
>

It's tricky, yes.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

