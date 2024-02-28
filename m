Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC18A86B52F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 17:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB35510E106;
	Wed, 28 Feb 2024 16:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nOYVKuHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256CC10E106
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:40:44 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so1813343a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 08:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709138440; x=1709743240;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=In3p83V6zrI+MWpNKueg5JQ5LR0pNF8Pef8UBUpES94=;
 b=nOYVKuHeJiR4n0N22zNsYRJMSpGUaLVevbl6IIrBhSqmQcsW8ZkYhEwu9Ddl57YXTv
 ZFicbOkdjvOALc3QE2MR2d2+f72q2aIirNDPhGaMBb0BLjTmw3awvZCXtyponNft5+YL
 j4VM+Tz6qyC/c505nPMGxq021r13Y/ppQJpmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709138440; x=1709743240;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=In3p83V6zrI+MWpNKueg5JQ5LR0pNF8Pef8UBUpES94=;
 b=BWhRJADM9nkKf3wT1m2ZFjwbFKQDLmRIjPar+Ox3tHlnCm5Cw8j/vPui4vtShhHzX/
 lVPdvv+4PfRMyrjESUy7ZV0Hh+AQEXREm1L6GN01SAtm6EMF7zjFIk37jA9/MP++H+XQ
 5GsaskpDxUkkpKi/LBeKqdKHYDGaFo7Ehf+oBGDA9FipILEvlvJ2fPtg1RtsSbNNrKKe
 1qksySy2rBSJWa7L85MMkVSOSn3pkqlGefzStlyDN5qIptLjnc5/Sw2xTNSGli+h1dsf
 GIL9Jol1ObXNrgiaLzhj+piyE7KDJMdkIKwpaQzgIY9NlHn+qbAxrrfbtP4oK/dfScAC
 5IWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPwpVa1db5bWsnmeIIt1DrQ4mCGsU8F4jEAoIgF+Gq1MpAQ4CT8yHCdGqJ8i8quU1w1/BebpL/y/FClQqABIJ7m/PhmDWXE9rQu6zz4IQ+
X-Gm-Message-State: AOJu0YwlVy3ye4dPphIuR2uqq5wOYtEisxg0GSmRALBK73nst17FDn14
 dAIVTLS3GNFS9kqkJsVh0QZJTDG7eE6JLiJnogdBNIuU+Kd2leor+MZb3xz1ajtrhtnN9wbug2w
 0RmLc
X-Google-Smtp-Source: AGHT+IH8eBjbflL7a3GQwWXIe/L+UlnUP0p5wDZj0xSOhpqQ5cxmzWgWNkiBhrkza8TY1safa+4JAw==
X-Received: by 2002:a17:906:d193:b0:a43:3066:ef13 with SMTP id
 c19-20020a170906d19300b00a433066ef13mr2449553ejz.37.1709138439888; 
 Wed, 28 Feb 2024 08:40:39 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 h6-20020a1709060f4600b00a4323d1b18fsm2026680ejj.34.2024.02.28.08.40.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 08:40:38 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4129a748420so90505e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 08:40:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUE2YSAGEQFRFKaJ2DiLLGn3OaFYDaDc49Oh61cSBfLEZz7kl4TfTLWgfHuy5js4ME17rI+QhiM51Zc9Cb8HjDmcgFu6B+5mqtQ6HjxPMQP
X-Received: by 2002:a05:600c:1e24:b0:412:acde:4839 with SMTP id
 ay36-20020a05600c1e2400b00412acde4839mr68722wmb.3.1709138438231; Wed, 28 Feb
 2024 08:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
 <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
 <87sf1u58k0.fsf@intel.com>
 <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
 <cbcd981f-bd5d-477e-8482-d3414be17057@linaro.org>
In-Reply-To: <cbcd981f-bd5d-477e-8482-d3414be17057@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 08:40:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UtpL=Wy7jnUFkTF8WtMjWa3ZfJXsXDX=Q=j6o_6rd4AQ@mail.gmail.com>
Message-ID: <CAD=FV=UtpL=Wy7jnUFkTF8WtMjWa3ZfJXsXDX=Q=j6o_6rd4AQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
To: neil.armstrong@linaro.org
Cc: Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org,
 eizan@chromium.org, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Imre Deak <imre.deak@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, 
 linux-kernel@vger.kernel.org
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

Neil,

On Thu, Feb 15, 2024 at 8:53=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi Doug,
>
> On 15/02/2024 16:08, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Feb 15, 2024 at 2:24=E2=80=AFAM Jani Nikula <jani.nikula@intel.=
com> wrote:
> >>
> >> On Wed, 14 Feb 2024, Doug Anderson <dianders@chromium.org> wrote:
> >>> Hi,
> >>>
> >>> On Tue, Feb 13, 2024 at 10:25=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromiu=
m.org> wrote:
> >>>>
> >>>> On Wed, Feb 14, 2024 at 2:23=E2=80=AFPM Douglas Anderson <dianders@c=
hromium.org> wrote:
> >>>>>
> >>>>> If an eDP panel is not powered on then any attempts to talk to it o=
ver
> >>>>> the DP AUX channel will timeout. Unfortunately these attempts may b=
e
> >>>>> quite slow. Userspace can initiate these attempts either via a
> >>>>> /dev/drm_dp_auxN device or via the created i2c device.
> >>>>>
> >>>>> Making the DP AUX drivers timeout faster is a difficult proposition=
.
> >>>>> In theory we could just poll the panel's HPD line in the AUX transf=
er
> >>>>> function and immediately return an error there. However, this is
> >>>>> easier said than done. For one thing, there's no hard requirement t=
o
> >>>>> hook the HPD line up for eDP panels and it's OK to just delay a fix=
ed
> >>>>> amount. For another thing, the HPD line may not be fast to probe. O=
n
> >>>>> parade-ps8640 we need to wait for the bridge chip's firmware to boo=
t
> >>>>> before we can get the HPD line and this is a slow process.
> >>>>>
> >>>>> The fact that the transfers are taking so long to timeout is causin=
g
> >>>>> real problems. The open source fwupd daemon sometimes scans DP buss=
es
> >>>>> looking for devices whose firmware need updating. If it happens to
> >>>>> scan while a panel is turned off this scan can take a long time. Th=
e
> >>>>> fwupd daemon could try to be smarter and only scan when eDP panels =
are
> >>>>> turned on, but we can also improve the behavior in the kernel.
> >>>>>
> >>>>> Let's let eDP panels drivers specify that a panel is turned off and
> >>>>> then modify the common AUX transfer code not to attempt a transfer =
in
> >>>>> this case.
> >>>>>
> >>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>> ---
> >>>>
> >>>> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >>>
> >>> Thanks for the review!
> >>>
> >>> Given that this touches core DRM code and that I never got
> >>> confirmation that Jani's concerns were addressed with my previous
> >>> response, I'm still going to wait a little while before applying. I'm
> >>> on vacation for most of next week, but if there are no further replie=
s
> >>> between now and then I'll plan to apply this to "drm-misc-next" the
> >>> week of Feb 26th. If someone else wants to apply this before I do the=
n
> >>> I certainly won't object. Jani: if you feel this needs more discussio=
n
> >>> or otherwise object to this patch landing then please yell. Likewise
> >>> if anyone else in the community wants to throw in their opinion, feel
> >>> free.
> >>
> >> Sorry for dropping the ball after my initial response. I simply have n=
ot
> >> had the time to look into this.
> >>
> >> It would be great to get, say, drm-misc maintainer ack on this before
> >> merging. It's not fair for me to stall this any longer, I'll trust the=
ir
> >> judgement.
> >>
> >> Reasonable?
> >
> > I'd be more than happy for one of the drm-misc maintainers to Ack.
> > I'll move Maxime, Thomas, and Maarten to the "To:" line to see if that
> > helps get through their filters.
>
> I'll like some test reports to be sure it doesn't break anything,
> then I'll be happy to give my ack !

Are you looking for any more test reports at this point? Eizan did
some testing and provided a tag, though this was also on ChromeOS.
Steev also tested on two non-ChromeOS environments and provided his
tag. It's also been another two weeks of this being rolled out to some
Chromebook users and I haven't heard any reports of problems. If
somehow something was missed, I'm happy to follow-up and provide
additional fixes if some report comes in later.

Thanks!

-Doug
