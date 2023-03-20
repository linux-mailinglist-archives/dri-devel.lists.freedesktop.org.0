Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D66E96C0E6A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D42110E2E1;
	Mon, 20 Mar 2023 10:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BCC10E2E1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679307188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSnzwW7UPKuaqTZOLIpRiKigYq3lgNu+HAeDIr5Zgck=;
 b=eJeoh/by8DVonC3SGtV5WxI5rOP1exsMjtO9dYJdjvC6XNmNAaHMGL/EQH5E/qoO6jwqym
 r7JWinoeoNmwLci9kLQrJm3rNF2844k70fDVd0ek4UhvgDYJTDKZvh9wZwcdyVVjBSgPhs
 KLhmCs3cTkwsXPL25CkxtXsaBtCjy1A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-olm4lDCmPmWYAsF1RkmlrA-1; Mon, 20 Mar 2023 06:13:06 -0400
X-MC-Unique: olm4lDCmPmWYAsF1RkmlrA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v8-20020a05600c470800b003ed3b575374so5282632wmo.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 03:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307185;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GSnzwW7UPKuaqTZOLIpRiKigYq3lgNu+HAeDIr5Zgck=;
 b=HRkiM2SceCQ8pQv5xAYVeFDlh1BLWtZetCRkd0Us9jdN4PnH/biB7zU6SUltcUdgjA
 vhy9gsBr1SuwP+RL6mTQae+ONqTSgErhHx7ww3QQMUMgqHDIC7e/WYGbK6HWwpYAwq2J
 GiGO5bIUfzgptUUrg8Y2WeDogUTaV3ish6P7YmBVzC5e65Mch7tA9rfINzU1hTmZW0EH
 y2zu7Fotrlt9sAp4ocrRw4imn6CoGvbzsDLYXY2LD3K/BVkx/WAOx7CSfOv7OwBR8xs9
 VCw/VawmGjTeSHUSpYAfGjVUhGnYVPq+O3jg/uA/pj/xeUMwahwyj3PKHvjl4T2RJCS3
 ETEw==
X-Gm-Message-State: AO0yUKVOAjmpJuZEuXY7AoR8WEoMECMtNEjfu/wuM9wTGo1Wd9+EAIVL
 WeKIqUbazUKgdTGmqiPheyc3wQCzsj2bRJ3zZZlDo5Qs6uZ2E+adGnYQ8N/mGB2WY21O7c4hSlm
 DmV8Hw0hbny/tAOCDpY0oVVmp8vgX
X-Received: by 2002:a5d:6641:0:b0:2cf:ee25:18ce with SMTP id
 f1-20020a5d6641000000b002cfee2518cemr12035363wrw.27.1679307185471; 
 Mon, 20 Mar 2023 03:13:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set9OeXpxkU5FURZ6oRBmhf/UzB6dC4DewSocuWG17weImBIk36LE0SaKHYby/aSC/aNU62Rn7Q==
X-Received: by 2002:a5d:6641:0:b0:2cf:ee25:18ce with SMTP id
 f1-20020a5d6641000000b002cfee2518cemr12035341wrw.27.1679307185135; 
 Mon, 20 Mar 2023 03:13:05 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b18-20020adff912000000b002c567881dbcsm8451733wrr.48.2023.03.20.03.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:13:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Samuel =?utf-8?Q?=C4=8Cavoj?=
 <samuel@cavoj.net>
Subject: Re: [PATCH v2 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
In-Reply-To: <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-8-tzimmermann@suse.de>
 <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
 <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
Date: Mon, 20 Mar 2023 11:13:03 +0100
Message-ID: <874jqfpw7k.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 deller@gmx.de, linux-staging@lists.linux.dev,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 maxime@cerno.tech, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If a driver asked to unregister a platform =
device registered by
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * sysfb, then can be assumed that this is a d=
river for a display
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * that is set up by the system firmware and h=
as a generic driver.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Drivers for devices that don't have a gener=
ic driver will never
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * ask for this, so let's assume that a real d=
river for the display
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * was already probed and prevent sysfb to reg=
ister devices later.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 sysfb_disable();
>>=20
>> This call to sysfb_disable() has been causing trouble with regard to
>> VFIO. VFIO has been calling aperture_remove_conflicting_pci_devices to
>> get rid of any console drivers (d173780620792c) using the device in
>> question, but now even unrelated drivers are getting killed. Example
>> situation:
>
> Which drivers do you use?
>

Also, what kernel version?

[...]

>>=20
>> Machine has two GPUs and uses efifb for the console. Efifb registers
>> with the aperture system the efi framebuffer region, which is covered
>> by a BAR resource of GPU 1. VFIO grabs GPU 2 and calls
>> aperture_remove_conflicting_pci_devices(GPU 2). GPU 2 has no overlap
>> with the efifb on GPU1 but the efifb is killed regardless due to
>> the unconditional call to sysfb_disable(). The console switches
>> to dummy and locks up from the user perspective.
>> This seems unnecessary, as the device is unrelated.
>>=20

That's a bug indeed but I thought that was already fixed...

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

