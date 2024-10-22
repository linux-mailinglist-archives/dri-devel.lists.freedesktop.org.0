Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDB59A94AA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 02:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A073510E098;
	Tue, 22 Oct 2024 00:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NZYelaK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE6910E098
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 00:20:59 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so3397280e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 17:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729556454; x=1730161254;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3AquQ/RobG5RLX7clJPy8zhYHtHRbpJxzenLLWw4qJQ=;
 b=NZYelaK5Yyyoyo2WmEhkS8xJvRKyGzuLZaaSQtan2Dv4/f0XP8MwMJkzSXQaXoIiqu
 p9h6oNfQKHoh8i3t/N7wAKkZ+10kdcFt6r9ZmgUKP0YfiLIDSApyOZyJ41TRYDid+E5K
 W9U7XfUohhXLVii19U/65Sf39jmD2f5dgvG7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729556454; x=1730161254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3AquQ/RobG5RLX7clJPy8zhYHtHRbpJxzenLLWw4qJQ=;
 b=DGnXqkv8zkRLJZ59qP/66mz7Rvp/qVOIR8raPStOYszRWSKYe3hxtRMxpvPVLQSjSt
 sMGFbz7bcaWukJ89Csnm8a/GbfN9Odbsp1LcGw4eN8k5gAkwG27+jDp4n9rMBlB5bQMp
 hZW2C2KsiEvE1X9pW/lXho152KBvOOW7yYkxDLaSCnCCyECjfqlVCd03OtXidCH4c881
 Wt+81Ds/eauRVElDSEZ30LoFRj30zGKC/rNtgQw8rUfXdOKQ/YE0ZV/4KPlsSgF6ytIT
 uCHh2RCwGe4hjMClccBwcI4zAEFcruxJL0RTWQ6tfA9j6mN3QlWslwRLjOPwrGIFeB1e
 Xqcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxy1pnPlUNttuokaEhCY2Fkcrm+7T3qLzLPfqt30Ad7FMovUbO8PYtq8vw+Ad50N1pdMP8xU7ZWiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzF+Lx7Tupxpv6hJ5PMD81Yu4KCPtek1I/ZgCk1p4nw0VHL1qh
 FO96lDra7Iwu6EXhl+hTMIyjT5Qrk0Us5IwBgCmWKZca2P2nQUKR5nlyv+seFHFkssshVvUSK/L
 BPw==
X-Google-Smtp-Source: AGHT+IHhc+OC0TQMIi0Wr39i29fEr1gIDNsLFwvaJuU8YxMNiMsW4bRO5XidYyGOGQ0SQBNmGRxkDA==
X-Received: by 2002:a05:6512:3b97:b0:536:a6c6:33f with SMTP id
 2adb3069b0e04-53a15218d07mr7279724e87.13.1729556454032; 
 Mon, 21 Oct 2024 17:20:54 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a2242040bsm613228e87.176.2024.10.21.17.20.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 17:20:53 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539e3f35268so3376634e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 17:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFcFvW1/v8F0ogF5pH0HCE9puI5eny6EF+/W+Ue8U/Kq+rH8mc0c8AD09jzsZjne2WChR9WvU6qkc=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3095:b0:533:d3e:16f5 with SMTP id
 2adb3069b0e04-53a15449e28mr6637115e87.38.1729556451668; Mon, 21 Oct 2024
 17:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
 <2024101855-judo-tattered-bc3c@gregkh>
 <20241018142522.GA28934@pendragon.ideasonboard.com>
 <2024101837-crushed-emphasis-b496@gregkh>
 <20241020143629.GC28934@pendragon.ideasonboard.com>
 <2024102119-oversweet-labored-aa07@gregkh>
 <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh>
 <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
In-Reply-To: <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Oct 2024 17:20:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
Message-ID: <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Oct 21, 2024 at 1:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Greg,
>
> On Mon, Oct 21, 2024 at 10:23=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, Oct 21, 2024 at 9:27=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > > On Mon, Oct 21, 2024 at 08:58:30AM +0200, Geert Uytterhoeven wrote:
> > > > On Mon, Oct 21, 2024 at 8:39=E2=80=AFAM Greg KH <gregkh@linuxfounda=
tion.org> wrote:
> > > > > On Sun, Oct 20, 2024 at 05:36:29PM +0300, Laurent Pinchart wrote:
> > > > > > On Fri, Oct 18, 2024 at 04:31:21PM +0200, Greg KH wrote:
> > > > > > > On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wr=
ote:
> > > > > > > > On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > > > > > > > > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoe=
ven wrote:
> > > > > > > > > > On Fri, Oct 18, 2024 at 3:10=E2=80=AFPM Laurent Pinchar=
t wrote:
> > > > > > > > > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytte=
rhoeven wrote:
> > > > > > > > > > > > Each bridge instance creates up to four auxiliary d=
evices with different
> > > > > > > > > > > > names.  However, their IDs are always zero, causing=
 duplicate filename
> > > > > > > > > > > > errors when a system has multiple bridges:
> > > > > > > > > > > >
> > > > > > > > > > > >     sysfs: cannot create duplicate filename '/bus/a=
uxiliary/devices/ti_sn65dsi86.gpio.0'
> > > > > > > > > > > >
> > > > > > > > > > > > Fix this by using a unique instance ID per bridge i=
nstance.
> > > > > > > > > > >
> > > > > > > > > > > Isn't this something that should be handled by the AU=
X core ? The code
> > > > > > > > > > > below would otherwise need to be duplicated by all dr=
ivers, which seems
> > > > > > > > > > > a burden we should avoid.
> > > > > > > > > >
> > > > > > > > > > According to the documentation, this is the responsibil=
ity of the caller
> > > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include=
/linux/auxiliary_bus.h#L81
> > > > > > > > > > I believe this is the same for platform devices.
> > > > > > > > > > See also the example at
> > > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include=
/linux/auxiliary_bus.h#L116
> > > > > > > > > >
> > > > > > > > > > Note: the platform bus supports PLATFORM_DEVID_AUTO, bu=
t the auxiliary
> > > > > > > > > > bus does not.
> > > > > > > > >
> > > > > > > > > Yes, it does not as it's up to the caller to create a uni=
que name, like
> > > > > > > > > your patch here does.  I'd argue that platform should als=
o not do
> > > > > > > > > automatic device ids, but that's a different argument :)
> > > > > > > >
> > > > > > > > __auxiliary_device_add() creates the device name with
> > > > > > > >
> > > > > > > >   dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxd=
ev->id);
> > > > > > > >
> > > > > > > > I'm not calling for a PLATFORM_DEVID_AUTO-like feature here=
, but
> > > > > > > > shouldn't the first component of the device name use the pa=
rent's name
> > > > > > > > instead of the module name ?
> > > > > > >
> > > > > > > Why would the parent's name not be the module name?  That nam=
e is
> > > > > > > guaranteed unique in the system.  If you want "uniqueness" wi=
thin the
> > > > > > > driver/module, use the name and id field please.
> > > > > > >
> > > > > > > That's worked well so far, but to be fair, aux devices are pr=
etty new.
> > > > > > > What problem is this naming scheme causing?
> > > > > >
> > > > > > Auxiliary devices are created as children of a parent device. W=
hen
> > > > > > multiple instances of the same parent type exist, this will be =
reflected
> > > > > > in the /sys/devices/ devices tree hierarchy without any issue. =
The
> > > > > > problem comes from the fact the the auxiliary devices need a un=
ique name
> > > > > > for /sys/bus/auxialiary/devices/, where we somehow have to diff=
erenciate
> > > > > > devices of identical types.
> > > > > >
> > > > > > Essentially, we're trying to summarize a whole hierarchy (path =
in
> > > > > > /sys/devices/) into a single string. There are different ways t=
o solve
> > > > > > this. For platform devices, we use a device ID. For I2C devices=
, we use
> > > > > > the parent's bus number. Other buses use different schemes.
> > > > > >
> > > > > > Geert's patch implements a mechanism in the ti-sn65dsi86 driver=
 to
> > > > > > handle this, and assign an id managed by the parent. In a sense=
 we could
> > > > > > consider this to be similar to what is done for I2C, where the =
bus
> > > > > > number is also a property of the parent. However, the big diffe=
rence is
> > > > > > that the I2C bus number is managed by the I2C subsystem, while =
here the
> > > > > > id is managed by the ti-sn65dsi86 driver, not by the auxiliary =
device
> > > > > > core. This would require duplicating the same mechanism in ever=
y single
> > > > > > driver creating auxiliary devices. This strikes me as a fairly =
bad idea.
> > > > > > The problem should be solved by the core, not by individual dri=
vers.
> > > > >
> > > > > The "id" is just a unique number, it is "managed" by the thing th=
at is
> > > > > creating the devices themselves, not the aux core code.  I don't =
see why
> > > > > the i2c bus number has to match the same number that the ti drive=
r
> > > > > creates, it could be anything, as long as it doesn't match anythi=
ng else
> > > > > currently created by that driver.
> > > >
> > > > Laurent does not say it has to match the i2c bus number.
> > > > He does think the auxilliary bus should provide a mechanism to
> > > > allocate these IDs (e.g. usin g AUX_DEVID_AUTO?).
> > >
> > > As this is the first subsystem to ask for such a thing, I didn't thin=
k
> > > it was needed, but the aux subsystem is new :)
> > >
> > > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > > in the TI driver does sound like a good idea to me...
> > >
> > > Great!
>
> > With the I2C adapter numbers, that becomes:
> >
> >     /sys/bus/auxiliary/devices
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.4
> >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.4
> >     =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.4
> >
> > > adapter->nr instead like other aux subsystems already do.
>
> Unfortunately the devil is in the details, as usual: there can be
> multiple instances of the sn65dsi86 bridge on a single I2C bus,
> so adapter->nr is not guaranteed to generate a unique name.

In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
chip is always at bus address 0x2d so you can't have more than one on
the same bus. Unless you added something funky atop it (like a mux of
some sort) you might be OK.


> Changing the auxiliary bus to use the parent's name instead of the
> module name, as suggested by Laurent, would fix that.

Right. On my system dev_name() of the sn65dsi86 device is "2-002d". If
we had a second on i2c bus 4, we'd have:

    /sys/bus/auxiliary/devices
    =E2=94=9C=E2=94=80=E2=94=80 2-002d.gpio.0
    =E2=94=9C=E2=94=80=E2=94=80 2-002d.pwm.0
    =E2=94=9C=E2=94=80=E2=94=80 2-002d.aux.0
    =E2=94=9C=E2=94=80=E2=94=80 2-002d.bridge.0
    =E2=94=9C=E2=94=80=E2=94=80 4-002d.gpio.0
    =E2=94=9C=E2=94=80=E2=94=80 4-002d.pwm.0
    =E2=94=9C=E2=94=80=E2=94=80 4-002d.aux.0
    =E2=94=94=E2=94=80=E2=94=80 4-002d.bridge.0

...and I think that's guaranteed to be unique because all the i2c
devices are flat in "/sys/bus/i2c/devices".

In any case, I've been standing on the sidelines because really any of
these ideas are fine to me.

Using the parent name is nice because it's completely automatic and
that's nice. It's a bigger change to paths / device names, though. I
could see it breaking someone somewhere.

The patch that Geert originally posted has the advantage of not
breaking things in case there's someone out there that wrote bad
userspace code and somehow hardcoded some old sysfs path. Others could
disagree, but IMO if it's easy it's nice to keep the sysfs paths
consistent even though it's not really an ABI promise. :-P I'm always
surprised how often people seem to hardcode paths like this. Sometimes
there's not a great alternative, but sometimes people just do it
because they don't know better...

The adapter->nr also seems OK to me in that it's a simple/small change.

Anyway, I'm happy to let others fight out for their favorite, but I
don't have a strong enough opinion to really argue one way or the
other...

-Doug
