Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202256C1198
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 13:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F59B10E40D;
	Mon, 20 Mar 2023 12:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D15110E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679314364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDRN9XADCHW4KobnBjZyGXmUoJLZGTdT1A6DRUh7Iug=;
 b=AnamrtCy0ec9Jjrq4nAb2ognJwUBYo//j6Zgv8qtemnQbSUZVLZZjlPGPaUckt3XUk0wJa
 A05bPkaFBOorfgXOAX3g9qy85k1E/7RFoGj6g+Cy4XHq8UJKSwyKnAwt6dmQLcw4p/RFCp
 haMj9VxFswiKcPh6CIZZth9xBj5iZdg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-_xJRn_WQNo-TOI7PueilYQ-1; Mon, 20 Mar 2023 08:12:43 -0400
X-MC-Unique: _xJRn_WQNo-TOI7PueilYQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j36-20020a05600c1c2400b003ed245a452fso5441415wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 05:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679314361;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDRN9XADCHW4KobnBjZyGXmUoJLZGTdT1A6DRUh7Iug=;
 b=Gw4Sl9KDxFV7335u8M35U0MWKrGv8PJrs8iYxL1EVpMmEWU2ebQQtNZiy8VNhbBRVL
 OvKMzhueU8T8yRuP7nhj7pBXhYJ9wWvpyd35Qtwxdd4/lBRy4ZkMBKShgre5k7mv5LCj
 uSDQWItEG0QYqc411c8djOfh5ZGRK7US2UD5H00SbipRfxHWKc2SsHC2fjeOmS4vmMZG
 hdOFoY5tpvSszHc2XQ3nurj+cENsLVkFkLjfNDT8ljPoe7q0U5rmUkLZNXGWBQ5wS+R+
 pzHF1SO2ZW5r92DII9w4gkgX2EcyJXDrI3t3itLe/bo6rTe6G1g/Y549NCjNFp1uIXM4
 8GbA==
X-Gm-Message-State: AO0yUKV21tV72w7IkweGyJSPclMWFCzHizA1omQK8xhNa5nxZ03BvKXi
 UAyJ7E5AY+MRnOtkv6Z+O+3AUZYb8aM2vh6e7DDp/VlWh9zDcEHfrEAvYOJI0c4X0oWLgDaznSp
 F9sLX2EP9l79UZRZIT8Z5FX4r71/B
X-Received: by 2002:a05:600c:2299:b0:3ee:da1:135f with SMTP id
 25-20020a05600c229900b003ee0da1135fmr1095239wmf.7.1679314361793; 
 Mon, 20 Mar 2023 05:12:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set+umOOuG5X2xVwy2+bTR0qTb8LXpCVn0AZ49wk1ROM/wu6oxM+7I2UIaZAV5omtJqUkTfXqew==
X-Received: by 2002:a05:600c:2299:b0:3ee:da1:135f with SMTP id
 25-20020a05600c229900b003ee0da1135fmr1095226wmf.7.1679314361535; 
 Mon, 20 Mar 2023 05:12:41 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f20-20020a7bcd14000000b003e203681b26sm10324306wmj.29.2023.03.20.05.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 05:12:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Samuel =?utf-8?Q?=C4=8Cavoj?= <samuel@cavoj.net>
Subject: Re: [PATCH v2 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
In-Reply-To: <87706a167c1e490a12371e2edf0f34e3@cavoj.net>
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-8-tzimmermann@suse.de>
 <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
 <e881f6d6-0d2b-5775-68f2-35cc4d666d63@suse.de>
 <874jqfpw7k.fsf@minerva.mail-host-address-is-not-set>
 <87706a167c1e490a12371e2edf0f34e3@cavoj.net>
Date: Mon, 20 Mar 2023 13:12:40 +0100
Message-ID: <87v8ivoc3r.fsf@minerva.mail-host-address-is-not-set>
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

[...]

>>>> This call to sysfb_disable() has been causing trouble with regard to
>>>> VFIO. VFIO has been calling aperture_remove_conflicting_pci_devices=20
>>>> to
>>>> get rid of any console drivers (d173780620792c) using the device in
>>>> question, but now even unrelated drivers are getting killed. Example
>>>> situation:
>>>=20
>>> Which drivers do you use?
>
> This happens with either no drivers loaded or the proprietary nvidia
> driver. Nouveau is fine as it doesn't rely on efifb but brings its own.
>

Which is what all DRM drivers should do. If they want to make sure that a
fbdev will be present after the DRM driver probes, then should register an
emulated fbdev.

There was an attempt to workaround that in [0], in particular patch [1]
but that effort was not continued since the only DRM driver that would be
affected is the Nvidia proprietary driver that relies on efifb/simpledrm
to have a VT.

[0]: https://patchwork.kernel.org/project/dri-devel/list/?series=3D711019&a=
rchive=3Dboth
[1]: https://patchwork.kernel.org/project/dri-devel/patch/20230111154112.90=
575-11-daniel.vetter@ffwll.ch/

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

