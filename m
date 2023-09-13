Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E7579EE2D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 18:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD3010E48A;
	Wed, 13 Sep 2023 16:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87D310E471
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 16:23:48 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b962535808so120038131fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694622226; x=1695227026;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1QrA3uGZF06KrP9j43FE5bJJzYHcP6Hm4nSeW3w90g=;
 b=BqGmOismV4dYiZIRehsL2UXb0BPfi3xO6b4UlILAzP3qdvzndjKAj5rQ/7p1bP5zjJ
 CbHEVndzLnAZiOKKE2dV3baRdhkw6k24DtcjIbpWVrwokZ3YfbviMgm+SPODg1EALlXy
 w3527gVBdd3zlMoWFFmOlYG9v3Mk0U1jFTAb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694622226; x=1695227026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q1QrA3uGZF06KrP9j43FE5bJJzYHcP6Hm4nSeW3w90g=;
 b=KX1PyIw5IjCf7C2e8I30Shil3FK3lk6CcUZJRdf60cVHMT60IhRPzAMd/A/ejIGNcq
 ohUHrCcPw6bp7Mn/rOxI82JhJwpuMmfGFkhi0hxqljvjAmBIvZowg0Szqp0sEsxGvi+B
 6s1MYPMgB7SULxbgXtOGFMKI+zEFaFCdv2+W5Nq7dI4Xglzl119En/ffPlYacD1HtqII
 JINwG0NANrB1/0u1eUoDif+TSjffYedghp4xK34yXCL5hDuO8n22QmPVsNUdA/cHjmQI
 E723brF8js2LHorRr03Lk67B87QrxaTOestJe1JbmsbJ6/twMgjVKDf1Z+n4XFlBLmdm
 AXtA==
X-Gm-Message-State: AOJu0Ywy8akGM+A36MPTEoo1EueLdpnJ6RyqRhXnyBXvsq16P3iJ3JKn
 vyEIimaXVAGQIc2dcofmYOQhPIIj0K9aOlUbIqRrDDw3
X-Google-Smtp-Source: AGHT+IG3T7yeGDj5CJ+l3KOo0uCp3JuSsj1Mg+qytA9vMXtDwrH4mfp+PPVBjwIzdJXqL1i68ZeRMg==
X-Received: by 2002:a2e:9e81:0:b0:2bf:a89c:d612 with SMTP id
 f1-20020a2e9e81000000b002bfa89cd612mr2723939ljk.21.1694622225837; 
 Wed, 13 Sep 2023 09:23:45 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 bu20-20020a170906a15400b00997d7aa59fasm8817716ejb.14.2023.09.13.09.23.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 09:23:45 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so18122a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 09:23:45 -0700 (PDT)
X-Received: by 2002:a50:a41e:0:b0:523:bdc9:48a9 with SMTP id
 u30-20020a50a41e000000b00523bdc948a9mr195524edb.0.1694622224847; Wed, 13 Sep
 2023 09:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
 <288af70dafc5e73d0fdfac71a33449385d4d6bd3.camel@crapouillou.net>
 <CAD=FV=VuJe7ACFw3pt1z=EAh14_Z4iTOc5VKJt24CGwZYjRpeQ@mail.gmail.com>
 <3prgpsxxnf3hzeqcpjs5r37nfojbkuwk4ezizrwfrcthm666k6@t2q2qcpnfkiu>
In-Reply-To: <3prgpsxxnf3hzeqcpjs5r37nfojbkuwk4ezizrwfrcthm666k6@t2q2qcpnfkiu>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 09:23:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSTP2g1RttMu_9+AGQbMK87MzQO+tw1cZBEJ3g-jAmYg@mail.gmail.com>
Message-ID: <CAD=FV=VSTP2g1RttMu_9+AGQbMK87MzQO+tw1cZBEJ3g-jAmYg@mail.gmail.com>
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call drm_atomic_helper_shutdown()
 at shutdown time
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 6, 2023 at 1:39=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> On Tue, Sep 05, 2023 at 01:16:08PM -0700, Doug Anderson wrote:
> > > > ---
> > > > This commit is only compile-time tested.
> > > >
> > > > NOTE: this patch touches a lot more than other similar patches sinc=
e
> > > > the bind() function is long and we want to make sure that we unset
> > > > the
> > > > drvdata if bind() fails.
> > > >
> > > > While making this patch, I noticed that the bind() function of this
> > > > driver is using "devm" and thus assumes it doesn't need to do much
> > > > explicit error handling. That's actually a bug. As per kernel docs
> > > > [1]
> > > > "the lifetime of the aggregate driver does not align with any of th=
e
> > > > underlying struct device instances. Therefore devm cannot be used a=
nd
> > > > all resources acquired or allocated in this callback must be
> > > > explicitly released in the unbind callback". Fixing that is outside
> > > > the scope of this commit.
> > > >
> > > > [1] https://docs.kernel.org/driver-api/component.html
> > > >
> > >
> > > Noted, thanks.
> >
> > FWIW, I think that at least a few other DRM drivers handle this by
> > doing some of their resource allocation / acquiring in the probe()
> > function and then only doing things in the bind() that absolutely need
> > to be in the bind. ;-)
>
> That doesn't change much. The fundamental issue is that the DRM device
> sticks around until the last application that has an open fd to it
> closes it.
>
> So it doesn't have any relationship with the unbind/remove timing, and
> for all we know it can be there indefinitely, while the application
> continues to interact with the driver.

I spent some time thinking about similar issues recently and, assuming
my understanding is correct, I'd at least partially disagree.

Specifically, I _think_ the only thing that's truly required to remain
valid until userspace closes the last open "fd" is the memory for the
"struct drm_device" itself, right? My understanding is that this is
similar to how "struct device" works. The memory backing a "struct
device" has to live until the last client releases a reference to it
even if everything else about a device has gone away. So if it was all
working perfectly then if the Linux driver backing the "struct
drm_device" goes away then we'd release resources and NULL out a bunch
of stuff in the "struct drm_device" but still keep the actual "struct
drm_device" around since userspace still has a reference. Pretty much
all userspace calls would fail, but at least they wouldn't crash. Is
that roughly the gist?

Assuming that's correct, then _most_ of the resource acquiring /
memory allocation can still happen in the device probe() routine and
can still use devm as long as we do something to ensure that any
resources released are no longer pointed to by anything in the "struct
drm_device".

To make it concrete, I think we want this (feel free to correct). For
simplicity, I'm assuming a driver that _doesn't_ use the component
framework:

a) Linux driver probe() happens. The "struct drm_device" is allocated
in probe() by devm_drm_dev_alloc(). This takes a reference to the
"struct drm_device". The device also acquires resources / allocates
memory.

b) Userspace acquires a reference to the "struct drm_device". Refcount
is now 2 (one from userspace, one from the Linux driver).

c) The Linux driver unbinds, presumably because userspace requested
it. From earlier I think we decided that we can't (by design) block
unbind. Once unbind happens then we shouldn't try to keep operating
the device and the driver should stop running. As part of the unbind,
the remove() is called and also "devm" resources are deallocated. If
any of the things freed are pointed to by the "struct drm_device" then
the code needs to NULL them out at this time. Also we should make sure
that any callback functions that userspace could cause to be invoked
return errors. Our code could go away at any point here since
userspace could "rmmod" our module.

d) Eventually userspace releases the reference and the "struct
drm_device" memory gets automatically freed because it was allocated
by devm_drm_dev_alloc()


NOTE: potentially some things could be allocated / managed by
drmm_xyz() function, like drmm_kmalloc() and that could simplify some
things. However, it's not a panacea for everything. Specifically once
the Linux driver unbind finishes then the device isn't functional
anymore.



-Doug
