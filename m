Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D5D86B978
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 21:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2103010E029;
	Wed, 28 Feb 2024 20:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KoUEvgto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17910E029
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 20:54:45 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a3e552eff09so32467166b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 12:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709153683; x=1709758483;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7yv2aZOYPyxqiCW7SC4YeHXcQrFeT9++J/3vRdLw6I=;
 b=KoUEvgto6oyndlJu0k9Qce/4aH6uF0cfOBokeO3NXkcDXOQiAJpOZlk+bWpN3l+KFo
 YXF8RgfG76j92WWurGPBJmuPkARB23fBIxLo33jnq+lv7l0wL5eF0YOvACc3pD3TGbpV
 d+BO/A8Ad3R4FlllWh74oZyNfuEk70Z4C1xBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709153683; x=1709758483;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j7yv2aZOYPyxqiCW7SC4YeHXcQrFeT9++J/3vRdLw6I=;
 b=KQR/KxsGVeLDk/GWrdurIMm3prZbGx7XXdSL7u0ATTgo6sBz3tr5gJSpyKaGwsDw5f
 U7HDGA9Yb9bIm/3BapfDqoGOvBQ3onowkpm8k2UodvuJ3FAXSLX2gsCtu9QlxQHutNup
 trxQgeoIN0AM6kJ/oc22mflP3gMF5d9aVFc1lpAuqvL55OkcGiSoRk16PnvpUZOoQ4Qs
 3byCv2Rav4phTwCzRHLWDGbBvUPiulz/Mah+gFIygM6ctUCKMVtI8NbaP+sSOwNSkCH+
 q/f+Bh5jPTB2qXPAwjt9/HBgJ1XtOozR0lIkPGcDsgeqtPNB/JwkW5hAPcZvF0E5Vt0K
 UK4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7nvMdRCgtZVVDWCdACoSxt6MSe1qjbamQAieOvfDx7Y/PrJR6n1cUEmI9Eq9JNOEWADx62xu7XD2YZFFhm8w4fhYgcNH74po18gBh4zbj
X-Gm-Message-State: AOJu0Ywx+/EcXJhmvM6JFpJFwnClta+UHVnF+TiQC9PV+vuGr4UGltBD
 XNU6Ay4+QjHx+YAl2NcInX2qZCiuuuAmKdag41Drf8Y1SB5YaMmzS43xoUQWBtcgf5pjmxfKcdb
 D+T27
X-Google-Smtp-Source: AGHT+IGpQJGHLHHcUmkUMubqgfhxbwFDp9rHjsvEPygzEx5Y6tYIGevuysa77VYf19ASvY57GHQKSw==
X-Received: by 2002:a17:906:48b:b0:a3f:3acf:c58b with SMTP id
 f11-20020a170906048b00b00a3f3acfc58bmr71166eja.13.1709153683473; 
 Wed, 28 Feb 2024 12:54:43 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 d12-20020a170906174c00b00a3e43b7e7b4sm2248048eje.143.2024.02.28.12.54.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 12:54:43 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5664623c311so440a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 12:54:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZmjxavZEC0Itcjk9L/e2L4rFmcn/zej2SvRKSo8849d8/trlKwUOMHUVtmdaU1U4YQdolVIrpyzEhmQ6Ccje4fmCYubuqYpJe44MS8Aci
X-Received: by 2002:a05:600c:b99:b0:412:a37b:4171 with SMTP id
 fl25-20020a05600c0b9900b00412a37b4171mr134980wmb.4.1709153305657; Wed, 28 Feb
 2024 12:48:25 -0800 (PST)
MIME-Version: 1.0
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
 <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
 <87sf1u58k0.fsf@intel.com>
 <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
 <cbcd981f-bd5d-477e-8482-d3414be17057@linaro.org>
 <CAD=FV=UtpL=Wy7jnUFkTF8WtMjWa3ZfJXsXDX=Q=j6o_6rd4AQ@mail.gmail.com>
 <b4266102-3354-4d4a-8368-c143b12dbead@linaro.org>
In-Reply-To: <b4266102-3354-4d4a-8368-c143b12dbead@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 12:48:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VQvC+JxVgtm=w8jFf+_caUoH=6QsKdfP5zzDFwORgC-Q@mail.gmail.com>
Message-ID: <CAD=FV=VQvC+JxVgtm=w8jFf+_caUoH=6QsKdfP5zzDFwORgC-Q@mail.gmail.com>
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

Hi,

On Wed, Feb 28, 2024 at 8:52=E2=80=AFAM <neil.armstrong@linaro.org> wrote:
>
> On 28/02/2024 17:40, Doug Anderson wrote:
> > Neil,
> >
> > On Thu, Feb 15, 2024 at 8:53=E2=80=AFAM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> Hi Doug,
> >>
> >> On 15/02/2024 16:08, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Thu, Feb 15, 2024 at 2:24=E2=80=AFAM Jani Nikula <jani.nikula@inte=
l.com> wrote:
> >>>>
> >>>> On Wed, 14 Feb 2024, Doug Anderson <dianders@chromium.org> wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On Tue, Feb 13, 2024 at 10:25=E2=80=AFPM Hsin-Yi Wang <hsinyi@chrom=
ium.org> wrote:
> >>>>>>
> >>>>>> On Wed, Feb 14, 2024 at 2:23=E2=80=AFPM Douglas Anderson <dianders=
@chromium.org> wrote:
> >>>>>>>
> >>>>>>> If an eDP panel is not powered on then any attempts to talk to it=
 over
> >>>>>>> the DP AUX channel will timeout. Unfortunately these attempts may=
 be
> >>>>>>> quite slow. Userspace can initiate these attempts either via a
> >>>>>>> /dev/drm_dp_auxN device or via the created i2c device.
> >>>>>>>
> >>>>>>> Making the DP AUX drivers timeout faster is a difficult propositi=
on.
> >>>>>>> In theory we could just poll the panel's HPD line in the AUX tran=
sfer
> >>>>>>> function and immediately return an error there. However, this is
> >>>>>>> easier said than done. For one thing, there's no hard requirement=
 to
> >>>>>>> hook the HPD line up for eDP panels and it's OK to just delay a f=
ixed
> >>>>>>> amount. For another thing, the HPD line may not be fast to probe.=
 On
> >>>>>>> parade-ps8640 we need to wait for the bridge chip's firmware to b=
oot
> >>>>>>> before we can get the HPD line and this is a slow process.
> >>>>>>>
> >>>>>>> The fact that the transfers are taking so long to timeout is caus=
ing
> >>>>>>> real problems. The open source fwupd daemon sometimes scans DP bu=
sses
> >>>>>>> looking for devices whose firmware need updating. If it happens t=
o
> >>>>>>> scan while a panel is turned off this scan can take a long time. =
The
> >>>>>>> fwupd daemon could try to be smarter and only scan when eDP panel=
s are
> >>>>>>> turned on, but we can also improve the behavior in the kernel.
> >>>>>>>
> >>>>>>> Let's let eDP panels drivers specify that a panel is turned off a=
nd
> >>>>>>> then modify the common AUX transfer code not to attempt a transfe=
r in
> >>>>>>> this case.
> >>>>>>>
> >>>>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>>>> ---
> >>>>>>
> >>>>>> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >>>>>
> >>>>> Thanks for the review!
> >>>>>
> >>>>> Given that this touches core DRM code and that I never got
> >>>>> confirmation that Jani's concerns were addressed with my previous
> >>>>> response, I'm still going to wait a little while before applying. I=
'm
> >>>>> on vacation for most of next week, but if there are no further repl=
ies
> >>>>> between now and then I'll plan to apply this to "drm-misc-next" the
> >>>>> week of Feb 26th. If someone else wants to apply this before I do t=
hen
> >>>>> I certainly won't object. Jani: if you feel this needs more discuss=
ion
> >>>>> or otherwise object to this patch landing then please yell. Likewis=
e
> >>>>> if anyone else in the community wants to throw in their opinion, fe=
el
> >>>>> free.
> >>>>
> >>>> Sorry for dropping the ball after my initial response. I simply have=
 not
> >>>> had the time to look into this.
> >>>>
> >>>> It would be great to get, say, drm-misc maintainer ack on this befor=
e
> >>>> merging. It's not fair for me to stall this any longer, I'll trust t=
heir
> >>>> judgement.
> >>>>
> >>>> Reasonable?
> >>>
> >>> I'd be more than happy for one of the drm-misc maintainers to Ack.
> >>> I'll move Maxime, Thomas, and Maarten to the "To:" line to see if tha=
t
> >>> helps get through their filters.
> >>
> >> I'll like some test reports to be sure it doesn't break anything,
> >> then I'll be happy to give my ack !
> >
> > Are you looking for any more test reports at this point? Eizan did
> > some testing and provided a tag, though this was also on ChromeOS.
> > Steev also tested on two non-ChromeOS environments and provided his
> > tag. It's also been another two weeks of this being rolled out to some
> > Chromebook users and I haven't heard any reports of problems. If
> > somehow something was missed, I'm happy to follow-up and provide
> > additional fixes if some report comes in later.
>
> Sure, thx I think you can apply it now
>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Pushed to drm-misc-next.

8df1ddb5bf11 drm/dp: Don't attempt AUX transfers when eDP panels are not po=
wered
