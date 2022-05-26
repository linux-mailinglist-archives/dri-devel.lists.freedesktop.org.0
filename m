Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C8E535194
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 17:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E04610E2C5;
	Thu, 26 May 2022 15:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178EC10E1C3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 15:42:30 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 s4-20020a4ac804000000b0040e93a35508so352100ooq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n3qAlBBeFNZ+aBiN6togZG6C5YO85T5AdGF+1zBN49Q=;
 b=LNeZtIBX+bOWD9mIM2QZXpdX6WjvRHSLWEP2lSAtqY2RGtmgC4uI0ByD2SrOR8Gn/C
 4GISyRYSnQz5XJf6zQ95LO7pedctMPzi1eqhI3kJNAjZFJG0XgYdl0iNysJjElmEP/YO
 w3qVbdfNem8fDY0R4sWLFbwufVJ1kfzgRhw6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n3qAlBBeFNZ+aBiN6togZG6C5YO85T5AdGF+1zBN49Q=;
 b=s6Ect3ZPRMWH2YgLZ0ludo+gzEAXKv/mdw4nHPH9bsECpiK8+LMYVCFo0ChP7zMCVZ
 ENMnpIYyD1fEnilofOBB18cX3LBM2qs9vA1Nj2TocwGQ1rO1aXDxmLmx/JCvior4sMjA
 u4F4w4qpkmmUdix1hwxcUFDW9NkRggNLqx1xfZo5yhXePnRYvyBaXq48TkZa2lshPZyR
 tRRkmkQcO1Ez4KUHqLY0NamU5Q2T1zW8XBW2zGidjAUQ8fwTBb3YmK4P/Gtt1h7tIpQZ
 S3G2qhQYtfmdXF6nEng9oyWB/TpIn9HcL+PtVXPDvcT2+/nGKxk8pO/y46y9dS1nl9Tz
 J0+A==
X-Gm-Message-State: AOAM533Oa9YnO5XBsUMCefD8BJx8Ad6+K4oTiIV4uY+jggfNavz/od2b
 jsW0QEEcUR4b/tlG/suAKJFAuRqA22Z+W8rUV22/ig==
X-Google-Smtp-Source: ABdhPJxQyvd/QD9jWHOhsULI65vBT79Z2iZL/7QARVVGluoa3p4MpGO4pbDMFwaxqzoo8wfw2Vtnarv7PDsGdIhhjbQ=
X-Received: by 2002:a4a:95c6:0:b0:35f:7f11:7055 with SMTP id
 p6-20020a4a95c6000000b0035f7f117055mr15159789ooi.87.1653579749268; Thu, 26
 May 2022 08:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <5857c510-9783-a483-8414-65d7350618d6@suse.de>
 <CAD=FV=X99EWmRk82ako7cL7BWPEsTG=L7VVBVDFX5qKc1MifSA@mail.gmail.com>
 <CAD=FV=U3Wywjev9tEhkL_zE1cV5NwEknH2YwHqyhd5TQtiJ=AQ@mail.gmail.com>
 <Yo4ufWm5WiXsnRX8@phenom.ffwll.local>
 <CAOw6vbLu7TzTppUYv1cynMvn+ykTuGiYBCNhN7FO2kYqZj4DUg@mail.gmail.com>
In-Reply-To: <CAOw6vbLu7TzTppUYv1cynMvn+ykTuGiYBCNhN7FO2kYqZj4DUg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 26 May 2022 17:42:18 +0200
Message-ID: <CAKMK7uHTkQjQ5=HOb0MtXD4JZRj3Szt5vm9gQZ6BixZ8LtUpxQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/probe-helper: Make 640x480 first if no EDID
To: Sean Paul <seanpaul@chromium.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@google.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 May 2022 at 03:28, Sean Paul <seanpaul@chromium.org> wrote:
>
> On Wed, May 25, 2022 at 9:26 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, May 23, 2022 at 05:59:02PM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Fri, May 20, 2022 at 5:01 PM Doug Anderson <dianders@chromium.org>=
 wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, May 16, 2022 at 3:28 AM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> > > > >
> > > > > Hi Douglas,
> > > > >
> > > > > I understand that you're trying to tell userspace that the modeli=
st has
> > > > > been made up, but it's not something that should be done via frag=
ile
> > > > > heuristics IMHO.
> > > > >
> > > > > I looked at the Chromium source code that you linked, but I canno=
t say
> > > > > whether it's doing the correct thing. It all depends on what your
> > > > > program needs.
> > > > >
> > > > > In that function, you could also search for 'DRM_MODE_TYPE_USERDE=
F'.
> > > > > It's the mode that the user specified on the kernel command line.=
 If
> > > > > Chromium's automatic mode selection fails, you'd give your users =
direct
> > > > > control over it.
> > > >
> > > > That doesn't really work for Chrome OS. Certainly a kernel hacker
> > > > could do this, but it's not something I could imagine us exposing t=
o
> > > > an average user of a Chromebook.
> > > >
> > > >
> > > > > When there's no flagged mode or if
> > > > > /sys/class/drm/card<...>/status contains "unconnected", you can a=
ssume
> > > > > that the modelist is artificial and try the modes in an appropria=
te order.
> > > >
> > > > So "no flagged" means that nothing is marked as preferred, correct?
> > > >
> > > > ...so I guess what you're suggesting is that the order that the ker=
nel
> > > > is presenting the modes to userspace is not ABI. If there are no
> > > > preferred modes then userspace shouldn't necessarily assume that th=
e
> > > > first mode returned is the best mode. Instead it should assume that=
 if
> > > > there is no preferred mode then the mode list is made up and it sho=
uld
> > > > make its own decisions about the best mode to start with. If this i=
s
> > > > the ABI from the kernel then plausibly I could convince people to
> > > > change userspace to pick 640x480 first in this case.
> > > >
> > > > > If we really want the kernel to give additional guarantees, we sh=
ould
> > > > > have a broader discussion about this topic IMHO.
> > > >
> > > > Sure. I've added St=C3=A9phane Marchesin to this thread in case he =
wants to
> > > > chime in about anything.
> > > >
> > > > Overall, my take on the matter:
> > > >
> > > > * Mostly I got involved because, apparently, a DP compliance test w=
as
> > > > failing. The compliance test was upset that when it presented us wi=
th
> > > > no EDID that we didn't default to 640x480. There was a push to make=
 a
> > > > fix for this in the Qualcomm specific driver but that didn't sit ri=
ght
> > > > with me.
> > > >
> > > > * On all devices I'm currently working with (laptops), the DP is a
> > > > secondary display. If a user was trying to plug in a display with a
> > > > bad EDID and the max mode (1024x768) didn't work, they could just u=
se
> > > > the primary display to choose a different resolution. It seems
> > > > unlikely a user would truly be upset and would probably be happy th=
ey
> > > > could get their broken display to work at all. Even if this is a
> > > > primary display, I believe there are documented key combos to chang=
e
> > > > the resolution of the primary display even if you can't see anythin=
g.
> > > >
> > > > * That all being said, defaulting to 640x480 when there's no EDID m=
ade
> > > > sense to me, especially since it's actually defined in the DP spec.=
 So
> > > > I'm trying to do the right thing and solve this corner case. That
> > > > being said, if it's truly controversial I can just drop it.
> > > >
> > > >
> > > > So I guess my plan will be to give St=C3=A9phane a little while in =
case he
> > > > wants to chime in. If not then I guess I'll try a Chrome patch...
> > > > ...and if that doesn't work, I'll just drop it.
> > >
> > > OK, this userspace code seems to work:
> > >
> > > https://crrev.com/c/3662501 - ozone/drm: Try 640x480 before picking
> > > the first mode if no EDID
> > >
> > > ...so we'll see how review of that goes. :-)
>
> Mirroring some of my comments on that review here :-)
>
> IMO, this should be addressed in the kernel, or not at all. The kernel
> ensures other aspects of DisplayPort implementation are compliant, so
> I don't think this would be any exception. Further, the kernel is the
> one creating the "safe" mode list, so it seems odd that userspace
> would override that. Finally, relying on every userspace to do the
> right thing is asking for trouble (we have 3 places which would need
> this logic in CrOS).

Oh I missed the part that this is defined in the DP spec as _the_ fallback =
mode.

I think the probe helpers could check whether it's a DP connector and
then dtrt per DP spec? I think that should have a solid chance of
avoiding the regression mess, since the really shoddy stuff tends to
be VGA/HDMI.

Also if DP says only 640x480 should be the fallback if there's no
other mode list source, then I think we should trim it down to only
that. But also only for DP.

Also ofc that patch should reference the right DP spec sections :-)
-Daniel

>
> >
> > Yeah it sucks a bit but I'm mildly afraid that if we muck around with t=
he
> > absolute fallback mode list in upstream we get whacked by a regression
> > report :-/
>
> Yeah, this seems likely (unfortunately).
>
> >
> > There's the additional fun that on modern displays probably 720p (or ma=
ybe
> > 720i) is a lot more likely to work than anything else really, so best w=
e
> > can do here maybe is to make it an uapi guarantee that if there's no
> > preferred mode, then most likely the kernel invent random noise out of
> > thin air, and userspace has to be careful and do its own magic heuristi=
cs.
> > Or maybe we should add a flag for "this stuff is invented, buyer beware=
".
> >
>
> This seems like a reasonable compromise. Perhaps marking 640x480 as
> preferred would be a middle road?
>
> > I think clarifying that would be good. Changing defaults feels a bit to=
o
> > risky, we had some really hilarious regression reports in the past alon=
g
> > the lines of the infamous xkcd.
>
> FWIW, I don't really have a strong opinion as to whether this should
> be fixed or not. I have a hard time believing that either 1024x768 or
> 640x480 would result in a happy result for the user, so we're really
> just choosing a mode which is bad enough for the user to
> unplug/replug. If 640x480 makes the compliance machine happy, I
> suppose that's a compelling reason, but I don't really feel like this
> is worth special casing each userspace.
>
> Sean
>
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
