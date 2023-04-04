Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EB16D5F23
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 13:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7684E10E208;
	Tue,  4 Apr 2023 11:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8717110E208
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680608206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojOFhnhp4SsyD0rEUsce5/2jxSoNGXx6ELi80cUBriI=;
 b=P0cgxf+G5VInhk/EbrcA/bbDZ3f4XrwrL0KoHfPqvKBU/r1dDtcJWRGqXLEQIx7TeOguwi
 HxbgHeLcrYBRYs8rkyRoiW62Q14UHtT2U6dvdkhfoapJkgIUUaxfnzizQXort4CYRgqlrK
 TANzUewYPIf5UeHwsP3TW8Yt1tqYUXo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-bLrkoDv7Pr25Tn61PU7Ceg-1; Tue, 04 Apr 2023 07:36:45 -0400
X-MC-Unique: bLrkoDv7Pr25Tn61PU7Ceg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j27-20020a05600c1c1b00b003edd2023418so17650866wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 04:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680608204;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ojOFhnhp4SsyD0rEUsce5/2jxSoNGXx6ELi80cUBriI=;
 b=LA3VTodXeFDdVg7PUYumdJtUM46f7/ztIAS6u/ZR8Km1JijBQezMUKbnJmUsxfthRC
 xpqx/IN3OE9AEggRKyh87UFmc2izY7bKncGEn9sH9eBVolOZ78Ws++uNZwy02LG1V18N
 XNuVqSRnd8z2tZH2PvshTlC3OQA1LiTEaa2E0erUR4Q8rivwStm61n9jeQzoeIfu5z3y
 tVIhL+HV/MLZJdcCT/MEf1LZgbjZ/VoDqf5W3W6f1uhBvvGSYcje1PqN67HPCb9gOo9Q
 RfT0iUAjlFd5CmPIezu2Dr5yNelPxwSpyQXYXORfZmfAqYtxeeM1ewK+Z3h4cC27dF+x
 aZSA==
X-Gm-Message-State: AAQBX9fYGTiCuNCWzIxpMS0HzeuVaOR3ozceWSoBGPJQlGuH7zyfjMuk
 M6OZBPQxyXwx0xo1Qz8al9I722xwszrv/Tdl285N0FpgchMQbauP26jl0fctcbu7iSmgu4ghO4H
 j+bva740s1T6kyIt4PicDxXSIk+OI
X-Received: by 2002:a7b:ce99:0:b0:3ea:e4f8:be09 with SMTP id
 q25-20020a7bce99000000b003eae4f8be09mr1997459wmj.30.1680608204167; 
 Tue, 04 Apr 2023 04:36:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZBl7sxG9qT96buUn7fCxResMaGdQnJeglH7Vd76qcVabWIRkxQ82wcbXV5wbZuVW0Aj/hJaw==
X-Received: by 2002:a7b:ce99:0:b0:3ea:e4f8:be09 with SMTP id
 q25-20020a7bce99000000b003eae4f8be09mr1997442wmj.30.1680608203876; 
 Tue, 04 Apr 2023 04:36:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y5-20020a05600c364500b003ee0d191539sm15036395wmq.10.2023.04.04.04.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 04:36:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Samuel =?utf-8?Q?=C4=8Cavoj?= <samuel@cavoj.net>
Subject: Re: [PATCH v2 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
In-Reply-To: <e556191a3cc9730f3d83c7aaea7d3b3e@cavoj.net>
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-8-tzimmermann@suse.de>
 <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
 <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
 <874jqfpw7k.fsf@minerva.mail-host-address-is-not-set>
 <87706a167c1e490a12371e2edf0f34e3@cavoj.net>
 <87v8ivoc3r.fsf@minerva.mail-host-address-is-not-set>
 <e556191a3cc9730f3d83c7aaea7d3b3e@cavoj.net>
Date: Tue, 04 Apr 2023 13:36:42 +0200
Message-ID: <87wn2rdgl1.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, deller@gmx.de,
 linux-staging@lists.linux.dev, Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samuel =C4=8Cavoj <samuel@cavoj.net> writes:

Hello Samuel,

> On 2023-03-20 13:12, Javier Martinez Canillas wrote:
>> Samuel =C4=8Cavoj <samuel@cavoj.net> writes:
>>=20
>> [...]
>>=20
>>>>>> This call to sysfb_disable() has been causing trouble with regard=20
>>>>>> to
>>>>>> VFIO. VFIO has been calling aperture_remove_conflicting_pci_devices
>>>>>> to
>>>>>> get rid of any console drivers (d173780620792c) using the device in
>>>>>> question, but now even unrelated drivers are getting killed.=20
>>>>>> Example
>>>>>> situation:
>>>>>=20
>>>>> Which drivers do you use?
>>>=20
>>> This happens with either no drivers loaded or the proprietary nvidia
>>> driver. Nouveau is fine as it doesn't rely on efifb but brings its=20
>>> own.
>>>=20
>>=20
>> Which is what all DRM drivers should do. If they want to make sure that=
=20
>> a
>> fbdev will be present after the DRM driver probes, then should register=
=20
>> an
>> emulated fbdev.
>
> I don't see how this is specific to Nvidia or DRM drivers.
>

Not specific to Nvidia per se but as mentioned it only affected Nvidia due
that driver relying on a different graphics driver to get a VT console.

> The efifb is killed if vfio-pci (or another driver which uses the
> aperture system to remove conflicting drivers) is bound to ANY pci
> device, regardless of whether it's nvidia's fault for not implementing
> a framebuffer. Fair enough, I agree that they should, but
> I for one expect my efifb to not die at a random time
> when a random unrelated driver does a random thing with another
> unrelated GPU.
>

There was a patch series to address that:

https://patchwork.kernel.org/project/dri-devel/list/?series=3D711019&archiv=
e=3Dboth

In particular, this patch:

https://patchwork.kernel.org/project/dri-devel/patch/20230111154112.90575-1=
1-daniel.vetter@ffwll.ch/

> Or is the efifb considered a stop-gap solution the only purpose of
> which is early boot--before another GPU driver is loaded?
>

All the firmware-provided graphics drivers are really a best effort IMO,
that is something only to be used to get early video output and any in the
case of "nomodeset" (i.e: some distros have a "Safe graphics mode" boot
entry that prevents DRM drivers to be loaded but used for troubleshooting.

But as soon as a real DRM driver is probed (either in the host or a guest
when the device is passed-through), I believe that is very likely that it
won't work anymore. In other words, is not a robust way to get output and
is just a best effort.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

