Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ABF4B6EF0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 15:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A01410E529;
	Tue, 15 Feb 2022 14:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196C410E529;
 Tue, 15 Feb 2022 14:38:58 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id m25so17426699qka.9;
 Tue, 15 Feb 2022 06:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0ow2l97FBadE8xYyNQO77wV9BV8c9FeJliZ8Zblp7o=;
 b=OvCv7l+IVLWiIYmrA/eyOyIiGsNr6rEC7SJ7SI0ykniYkMXuIlbJcyiIniSJZegR2Q
 ltJkoPKJSaCAcHmU2ItgB4h4Q2BMMyJpPrb5qq2ol+JxDJQhMIir73svlUhYVpbFqcEI
 tJVivfur2J2rZ4jI/Uqc9oeXE3FMfu6wIDttguFk/9lgOFkcevAPJYhU6Zj7Fx8tZCuW
 ehg5xjdZQpWY7QJ1PPdvodk1qObW598mPzqHm2H6yM7E6tmgab8eRc6qu2hOx6UhhA7v
 NZkXXBD8h4kSdipkJVyWNWpwOCY2NbcsJRpT8LKWTFz26koS2tf+T93JWDH2qnn2Vihr
 UoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0ow2l97FBadE8xYyNQO77wV9BV8c9FeJliZ8Zblp7o=;
 b=TMOcakJHoxIePCtZISQIrAN/IslFY1yc+N5BTp1AuRCZHSdRp3goRTWTAy2koJipsk
 S8rA5bgqHaGuj9j9vDxtTAq2IVAa13CLYgdBzgRJbnPT5YfuASaCeBP7XR61XyMv2Wa8
 en1i5CYNoYsbrZOd70+Euevg7hve66Rb/6o/faOGvidjY10toKOThNZbbN18UD2sbMdL
 LKson9od0ElDTglANGWPnSgVB0doMAKvZhA3vcycUN0oaqfTtYbi61nBizksey5a8reR
 bcEXnRXSwstOmeA2Vc+9oYLnnEF93MhJWvGjzsJxcj2lEl+82s3LVD87gz6v9Ed3bj26
 GNxA==
X-Gm-Message-State: AOAM531E0f5D7Emz3Q2BiSh5UD4YsDwwwPCtKALn/p+MFbm6lGZ7z7rg
 D+4aFgpW6CtygN0AYFONevBLD/8L99OkRPgIEyk=
X-Google-Smtp-Source: ABdhPJzqxLfXDw78xLjeX6QcKbH1M0Mn2Y5YmSQ2IiVXkB4upL2T729wSv3PGfvAcUcBZDUXQTcovh+9YqwVs83tlCM=
X-Received: by 2002:a05:620a:4042:: with SMTP id
 i2mr2065887qko.592.1644935937193; 
 Tue, 15 Feb 2022 06:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
In-Reply-To: <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 15 Feb 2022 14:38:45 +0000
Message-ID: <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Feb 2022 at 13:55, Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, February 15th, 2022 at 13:04, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > Greetings everyone,
> >
> > Padron for joining in so late o/
> >
> > On Tue, 8 Feb 2022 at 08:42, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > drm_dev_register() sets connector->registration_state to
> > > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > > drm_connector_set_panel_orientation() is first called after
> > > drm_dev_register(), it will fail several checks and results in following
> > > warning.
> > >
> > > Add a function to create panel orientation property and set default value
> > > to UNKNOWN, so drivers can call this function to init the property earlier
> > > , and let the panel set the real value later.
> > >
> >
> > The warning illustrates a genuine race condition, where userspace will
> > read the old/invalid property value/state. So this patch masks away
> > the WARNING without addressing the actual issue.
> > Instead can we fix the respective drivers, so that no properties are
> > created after drm_dev_register()?
> >
> > Longer version:
> > As we look into drm_dev_register() it's in charge of creating the
> > dev/sysfs nodes (et al). Note that connectors cannot disappear at
> > runtime.
> > For panel orientation, we are creating an immutable connector
> > properly, meaning that as soon as drm_dev_register() is called we must
> > ensure that the property is available (if applicable) and set to the
> > correct value.
>
> Unfortunately we can't quite do this. To apply the panel orientation quirks we
> need to grab the EDID of the eDP connector, and this happened too late in my
> testing.
>
> What we can do is create the prop early during module load, and update it when
> we read the EDID (at the place where we create it right now). User-space will
> receive a hotplug event after the EDID is read, so will be able to pick up the
> new value if any.

Didn't quite get that, are you saying that a GETPROPERTY for the EDID,
the ioctl blocks or that we get an empty EDID?

The EDID hotplug even thing is neat - sounds like it also signals on
panel orientation, correct?
On such an event, which properties userspace should be re-fetching -
everything or guess randomly?

Looking through the documentation, I cannot see a clear answer :-\

Thanks
Emil
