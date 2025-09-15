Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364B0B5766F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9013410E41E;
	Mon, 15 Sep 2025 10:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="WMazPnXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8B210E415
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:33:25 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-80e3612e1a7so711357085a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 03:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1757932404; x=1758537204;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvFr0tTlDypZC06Z38K7ue640mYssd20VwglOC4ESaQ=;
 b=WMazPnXEza3bGQW/Yr3NyOCuxl2GWSvc6bEf8IhaGLr4DMjORKW16wq2+D0+SDfp0q
 I3vBkZDHqL/PI0NuYWEm0YEvIwh7Qf9Vk8/nwLFveG1WcsmZcMyoaaL84vYZrge5LMfA
 9TE6sv7o1G2NoE08jamL36ywwFlqqgNJSaX5yjwyUWor5FmMokmCwJ4hytpkkGStMGMk
 hXHMmLnxAjOI/WHLeePD9IezNX3o5Md7CbC8bSr0jXcCw3ernd2RjR7BeS4qWUEAZm6x
 mLBQ7Uv8biBuMWmXu/WEoSSiAbahd5gcd/PpxYu2X4Hw7n88nsAv6qNzRB+xWE3N2D7d
 NB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757932404; x=1758537204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvFr0tTlDypZC06Z38K7ue640mYssd20VwglOC4ESaQ=;
 b=iCGNNZHnSNq5hJmGbyH1dAXtR1d9HDImwBN9sZoRYI63ntiVZ4kDIjtsVPUNcP6jgG
 A7N/FXqRNHbmERuhLvunfC2mULEVXmBzRm+SnFUjn9CmHCpvfZx65LSXFQ5OvxTggHbq
 poKJsc8sMR3QFqGDh/qOv0kBGlvw9hA++QSdDVXuX/8veW/xqd8Fj1jc1McaQ7SA4od1
 E0T5SdTg1+Q3B70Ps7N30LswPL4dt7nz/TRfXfM30WHRB42HomWkAXnc4fRtprJv925h
 2KLL2CLhDdeRvti19wttmdLUMLJmH9ehXsGUqbdISpEzStvyEogeR9EE31usfMXTOpY2
 izOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJFW8xtxnexiIKZlNhrHV1+irizkc+y40pHURILrEf/EpoPSId5Ym6+BeNYIxBrQIojtZm52rsocU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7oy9Tiy7Ucp9ksPSy2LFlc7TokCjsvjxUOO28NW8Clxt+Q+n/
 ynmOCN6KJt72lfd8JDb693hNcvJy1F+bqq/N7qkSzDfRfET4qTNh2VEpDchf9JG9Om+ZiEAhSGM
 69OtpnWcAjPSUIWhc2brcBK+rGdk0Teg9lCraEb+1Hg==
X-Gm-Gg: ASbGncs1gw+QlHxFV4/4udkNNf/Rfc3npmvRpgKIoo7lmYnVHOyit0/TMHK9PcTtL4d
 JRvz1OScTuyQV51bIT1jLZnHtVjBAACNQHohkdRKNjJuq5Sy4eHUVJcAhCWddjj43ZSXiYR7+hl
 KEdKS06F74yLhgukVvjqBKISRYZO01OV06F+vRNhQ40nPC1Dx4ql3qyV+ioCaNTcW6sytS9MSbh
 +Ur8R6hFPMpsrJx9mK6EqEJl3KbndwfEo9ORQ3RfNeTyaxjuYqdKgyJUSV7T4I=
X-Google-Smtp-Source: AGHT+IF+Z1B4MRX5EBlqfXHkIVbSCxwNked+w+4oV1jp/LLImuEn0EZibPfUOhyWgb+M6jZgGafVWZNoqfIPpNi62BE=
X-Received: by 2002:a05:620a:2590:b0:804:6af0:277a with SMTP id
 af79cd13be357-8240094485amr1498230385a.70.1757932401680; Mon, 15 Sep 2025
 03:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
 <aMMDxIWN9TadgVyw@xpredator>
 <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
In-Reply-To: <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 15 Sep 2025 12:33:08 +0200
X-Gm-Features: Ac12FXw62vBPv1fp3j8HsSzUqTsHYoQOTjReF6D7hVvUP8qKG97kjDvdxpZjPYc
Message-ID: <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org, 
 wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com, 
 mripard@kernel.org, daniel.stone@collabora.com, jani.nikula@linux.intel.com, 
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com, 
 christian.koenig@amd.com, derek.foreman@collabora.com
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

Hi Dmitry,

On Mon, 15 Sept 2025 at 02:57, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Thu, Sep 11, 2025 at 08:15:48PM +0300, Marius Vlad wrote:
> > On Thu, Sep 11, 2025 at 04:50:59PM +0300, Dmitry Baryshkov wrote:
> > > It's unclear, who should be combining this data: should it be the ker=
nel
> > > or the userspace.
> >
> > Userspace. I've went a bit into why that is in the cover letter. That
> > was a pain point in the previous versions raised by other folks. Driver=
s
> > are free to advertise whatever color formats their HW supports. To
> > filter what panel/display supports userspace would look at the EDID and=
 do an
> > intersection with the ones with the driver. This not uncommon, userspac=
e
> > already looks today at the EDID for color management / HDR purposes. Th=
ere's
> > just too much for the kernel to handle and rather than offloading that
> > to the kernel, people suggested previously to let userspace handle that=
.
> >
> > > From my POV deferring this to the userspace doesn't make sense: there
> > > will be different quirks for monitors / panels, e.g. the EDID wrongly
> > > advertising YUV or not advertising a knowlingly-working capability.
> >
> > Yeah, for sure. There have been some folks also raising that and discus=
sing
> > that a bit further in previous thread on similar topic:
> > https://lore.kernel.org/dri-devel/TY4PR01MB14432B688209B2AA416A95228983=
EA@TY4PR01MB14432.jpnprd01.prod.outlook.com/
> >
> > Note that people have added quirks into libdisplay-info library to
> > overcome these limitations. It is far more easier to that into a librar=
y
> > than in the kernel.
>
> This forces everybody who wishes to use this property to use that
> library (or to duplicate the code, making it spread over different
> projects).

This really is already the case though. There is far more than the
kernel can parse and handle in connector modes - and far more than it
makes sense for the kernel to do.

The kernel absolutely should have enough to support simple usecases,
e.g. console and splash screen, to make sure that they work out of the
box no matter what. But once you get into HDR/YUV/VRR/stereo/etc
usecases, it doesn't make sense for the kernel to abstract the EDID
parsing so much that userspace never needs to touch it - it makes the
kernel just a lossy middle barrier. So if you look just at
compositors, all the big four of KWin, Mutter, Weston, and wlroots,
all use libdisplay-info to parse the EDID. And that's fine - they also
use libevdev and libinput to handle raw input data, and libxkbcommon
to deal with the pain that is keyboards.

> > > I think that the property should reflect the kernel view on the possi=
ble
> > > formats, which should be updated during get_modes() (or every time ED=
ID
> > > is being read).
> >
> > The property advertises the supported color formats by display driver.
> > Userspace just filters these out based on what the sink supports. This
> > could just a policy in the compositor / UI.  There's nothing preventing
> > you to force push from those advertised formats.
>
> What is the expected behaviour if userspace asks for the colorspace
> which is supported by the driver but not by the display?

Quite possibly just a failure to display. Same as if the driver
guesses it wrong - including for reasons it can never statically
detect (e.g. buying a 10m-long uncertified HDMI cable which drops
signal, or having the cable pulled around a 90=C2=B0 bend making it very
marginal for transmission).

> > > And that's not to mention that there are enough use-cases where the
> > > connector doesn't have EDID at all.
> > Totally. But what would be the expectation in that case? Drivers can
> > still advertise 'Auto' if they'd like.
>
> I'm trying to point out that this complicates userspace: it is now
> required to handle EDID and non-EDID cases for no practical reason. For
> all other usecases it is enough to query available modes from the
> kernel.

But not 'now', because that's been happening for years. And not 'no
practical reason', because in order to support features the kernel has
no involvement in (colour management and HDR as a large part), you
need to see the full EDID.

Cheers,
Daniel
