Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327D9856701
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 16:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF6510E93A;
	Thu, 15 Feb 2024 15:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ml7LEJ/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DB010E93A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 15:15:10 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-563cf32e130so393548a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 07:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708010109; x=1708614909;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0S6qo+pjG4pQkQLOFKm/LBtGD/HT4X70qfMEKBvwsD8=;
 b=ml7LEJ/EspKokzXo6OeNU3YmViLgTVAdH+xsgWdrWuhv4OOOBTHAylVcB2DPKLZO+y
 2AvJC79xv1QcJiXQR4t8YHxnhJf/mxJFJYtnOsGXNlQ4/yP+4jodmmF/tQlU3Ae9WcSc
 moMngGt3l57//mQHapnrEsLeVDrP2f8u/iaGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708010109; x=1708614909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0S6qo+pjG4pQkQLOFKm/LBtGD/HT4X70qfMEKBvwsD8=;
 b=uNoKDKpPCNxcixaQat47Se2I6SEiVuOeF+s0AiMf0PYry1dILvYD8YDQ5zRlyidAQZ
 SLVqSwfEcGTBUMm9eEeoQuPZ/y+opKRT+XaVCx2SX2JVqs2IFFyy2Vp/GDLoWPlbYcxg
 NCFnF0UMU7qc4nUbFib/7bbUV+h+8XeTZ3WbFMUIF6E8qCqYBokUUOVOX9UGB+2U34q2
 +ATOSjrHiIkr+sv4J7BSvAqISeGsYNtFjfx3AjlNkVhpkfkovlSyIqjU+m17RQINXkzY
 S9WKNmzEcvs0RUZh1iMbPhe3ijB6eXAKLg9Mjpr1X0QafOY2d/GMEvKLcDcTZ8QLMskC
 YvjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvhKNj1c5xnq/2QBfx1gu+X3syp+nc4UZgst/r6QiMhSl0Z400BCxaxgMOh9fH6G5jS6hqotWNzRXL3K06pEnCjsuDZovQVsASkjDmcPId
X-Gm-Message-State: AOJu0YwcAbnKUiH69SRJWfK27E4POJlNNueb5eYFIDmY9LF9ZQDPSHo7
 hkrzHfdbcGJVj0O1mAS/Y23blpKTSXZhLBREtjgoTEEHaGBCR0okPJWg6U0YG2/TMc7ECkzJW+h
 CMMHl
X-Google-Smtp-Source: AGHT+IEl7LNJdJfxj/0YaP9Dak/TG045FbAOoud5kmeREgUvLRQR92WsKBqlUFGJLSVVEU9O4eDNdQ==
X-Received: by 2002:a17:906:81cc:b0:a3d:2970:32f1 with SMTP id
 e12-20020a17090681cc00b00a3d297032f1mr1740806ejx.8.1708010108971; 
 Thu, 15 Feb 2024 07:15:08 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 vb7-20020a170907d04700b00a3cfe376116sm654182ejc.57.2024.02.15.07.15.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 07:15:08 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-561f0f116ecso9577a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 07:15:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUSsMAkR4RjO4vpTMqe1WQgU4/2ymaWLhM6BuOjm7L25kviM7E5FH7vjJfK+DImyK1Cf19MLPjAKTR8fwMLyAcCzwlK72sJtRVeiqcuJpeY
X-Received: by 2002:a05:6402:128c:b0:562:a438:47ff with SMTP id
 w12-20020a056402128c00b00562a43847ffmr389580edv.6.1708009744921; Thu, 15 Feb
 2024 07:09:04 -0800 (PST)
MIME-Version: 1.0
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
 <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
 <87sf1u58k0.fsf@intel.com>
In-Reply-To: <87sf1u58k0.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Feb 2024 07:08:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
Message-ID: <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
To: Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org, 
 eizan@chromium.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Imre Deak <imre.deak@intel.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
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

Hi,

On Thu, Feb 15, 2024 at 2:24=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Wed, 14 Feb 2024, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Tue, Feb 13, 2024 at 10:25=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.=
org> wrote:
> >>
> >> On Wed, Feb 14, 2024 at 2:23=E2=80=AFPM Douglas Anderson <dianders@chr=
omium.org> wrote:
> >> >
> >> > If an eDP panel is not powered on then any attempts to talk to it ov=
er
> >> > the DP AUX channel will timeout. Unfortunately these attempts may be
> >> > quite slow. Userspace can initiate these attempts either via a
> >> > /dev/drm_dp_auxN device or via the created i2c device.
> >> >
> >> > Making the DP AUX drivers timeout faster is a difficult proposition.
> >> > In theory we could just poll the panel's HPD line in the AUX transfe=
r
> >> > function and immediately return an error there. However, this is
> >> > easier said than done. For one thing, there's no hard requirement to
> >> > hook the HPD line up for eDP panels and it's OK to just delay a fixe=
d
> >> > amount. For another thing, the HPD line may not be fast to probe. On
> >> > parade-ps8640 we need to wait for the bridge chip's firmware to boot
> >> > before we can get the HPD line and this is a slow process.
> >> >
> >> > The fact that the transfers are taking so long to timeout is causing
> >> > real problems. The open source fwupd daemon sometimes scans DP busse=
s
> >> > looking for devices whose firmware need updating. If it happens to
> >> > scan while a panel is turned off this scan can take a long time. The
> >> > fwupd daemon could try to be smarter and only scan when eDP panels a=
re
> >> > turned on, but we can also improve the behavior in the kernel.
> >> >
> >> > Let's let eDP panels drivers specify that a panel is turned off and
> >> > then modify the common AUX transfer code not to attempt a transfer i=
n
> >> > this case.
> >> >
> >> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> > ---
> >>
> >> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >
> > Thanks for the review!
> >
> > Given that this touches core DRM code and that I never got
> > confirmation that Jani's concerns were addressed with my previous
> > response, I'm still going to wait a little while before applying. I'm
> > on vacation for most of next week, but if there are no further replies
> > between now and then I'll plan to apply this to "drm-misc-next" the
> > week of Feb 26th. If someone else wants to apply this before I do then
> > I certainly won't object. Jani: if you feel this needs more discussion
> > or otherwise object to this patch landing then please yell. Likewise
> > if anyone else in the community wants to throw in their opinion, feel
> > free.
>
> Sorry for dropping the ball after my initial response. I simply have not
> had the time to look into this.
>
> It would be great to get, say, drm-misc maintainer ack on this before
> merging. It's not fair for me to stall this any longer, I'll trust their
> judgement.
>
> Reasonable?

I'd be more than happy for one of the drm-misc maintainers to Ack.
I'll move Maxime, Thomas, and Maarten to the "To:" line to see if that
helps get through their filters.

-Doug
