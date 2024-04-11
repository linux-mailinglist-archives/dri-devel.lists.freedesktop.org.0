Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17278A0736
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 06:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1251A10ED58;
	Thu, 11 Apr 2024 04:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DIlKYruZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1741A10EDFE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 04:42:25 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-696609f5cf2so43179956d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 21:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712810541; x=1713415341;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tQKdlV+ay3gMLnnYt6AkOPG1L2MnkbXIzuX0mw97TKE=;
 b=DIlKYruZaRzhnIAfLJXHAHiZXgcKe4KlhNRJgFMeDktS1kn0RqpHHzO+InGzUfHBKo
 YX1qCZYTUVWW+DDe8mD/oeLNqdG0QGZJSPg38AnTTqD9Tm8G0mEjhAFUla4cilkV2Fm2
 1FIe5mckNRK82vlQpeKpRnHHRqBlP3RzkmR7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712810541; x=1713415341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tQKdlV+ay3gMLnnYt6AkOPG1L2MnkbXIzuX0mw97TKE=;
 b=QQhS6D1kpTvqpmdpcXCsBPbEhKeTqGwtLUkGBkCStViYyOu4gSXSM0f3J6dk/Fpgn2
 W7zn146GcSF+iuZKLKiZHqeA6kV4YGwklSJ3yO5innZvMHug06JhqTPYx10g87citWHc
 dx/RQYyZw9HNxsCIDY5L32hrWeEmuSlhGTybhWtCBBb05mi1BDkBPMyLAioWjM3trfMG
 lKKqnxy+AKuP58FJGhx7a1Is1g8PuM21NJ3MDTOj5sTwuUSZo/8kxrRdnxuwJtmSZwKm
 ke3A3U+iKqe1EQzReCSrycZ8ckhrtx6TP2d6OtmTfOEeR2pj+devZRwFb5VngJX1/UKP
 2/0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOLy+/jWauVf96IkJxyhu36/oEzIeHWltu8FxgBbHBcG+JQqcaTpmjcSctpnB6rWk/S2IknBCubAn2k5X02vz1fObumYhmpc6HAvHfWVw6
X-Gm-Message-State: AOJu0YzYPi6B8smfXjMtkkb9RxEH6CHcTN8r7TPKN130rMnPiCv6HMqr
 kGv4bYMJJ0gXqcGS0Xn9StEv3rjSVQURdGwu2hFYyyxdBe4Te07SohUhfTGP6IXF0ONBZVx3Kjq
 Z5Q==
X-Google-Smtp-Source: AGHT+IGtIJe5v/gG9/uM2SCbv9vRPLT6cX+6IvPXV7BmobEE8cY9cTjamNmIZb7642QSJr8/uhK6wA==
X-Received: by 2002:a05:6214:e6c:b0:691:8b3a:5acb with SMTP id
 jz12-20020a0562140e6c00b006918b3a5acbmr5533985qvb.13.1712810541469; 
 Wed, 10 Apr 2024 21:42:21 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178]) by smtp.gmail.com with ESMTPSA id
 r2-20020ad44042000000b006915ae114efsm460014qvp.52.2024.04.10.21.42.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 21:42:20 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4348110e888so138461cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 21:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzlvcMv9FHuUPrZ2JR7yNgHMlKwmLDo9xAh2zB5A1BPSVVYq8Iw3bMV5ze+aUpPo1s0l/Ypac5tiawc9ZI1fMUegjxzErhI/5/KqCNCSJJ
X-Received: by 2002:a05:622a:4c0b:b0:431:f7fb:1c77 with SMTP id
 ey11-20020a05622a4c0b00b00431f7fb1c77mr197018qtb.22.1712810539067; Wed, 10
 Apr 2024 21:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240408073623.186489-1-j-choudhary@ti.com>
 <CAD=FV=V6vUgcPn0zhA+9k4cHVpqqeSVCSJG23XEE5KMAHUCCoQ@mail.gmail.com>
 <279a1467-9ba4-449c-9076-9b2acef9336c@ti.com>
In-Reply-To: <279a1467-9ba4-449c-9076-9b2acef9336c@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Apr 2024 21:42:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVs56wPGMVwuuwvHN8ob2bUeX1U-G=Zt_xGeGMyuchQA@mail.gmail.com>
Message-ID: <CAD=FV=VVs56wPGMVwuuwvHN8ob2bUeX1U-G=Zt_xGeGMyuchQA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix ti_sn_bridge_set_dsi_rate
 function
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, andersson@kernel.org, 
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, 
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

On Wed, Apr 10, 2024 at 4:42=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> Hello Doug,
>
> Thanks for the review.
>
> On 08/04/24 14:33, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Apr 8, 2024 at 12:36=E2=80=AFAM Jayesh Choudhary <j-choudhary@t=
i.com> wrote:
> >>
> >> Due to integer calculations, the rounding off can cause errors in the =
final
> >> value propagated in the registers.
> >> Considering the example of 1080p (very common resolution), the mode->c=
lock
> >> is 148500, dsi->lanes =3D 4, and bpp =3D 24, with the previous logic, =
the DSI
> >> clock frequency would come as 444 when we are expecting the value 445.=
5
> >> which would reflect in SN_DSIA_CLK_FREQ_REG.
> >> So move the division to be the last operation where rounding off will =
not
> >> impact the register value.
> >
> > Given that this driver is used on a whole pile of shipping Chromebooks
> > and those devices have been working just fine (with 1080p resolution)
> > for years, I'm curious how you noticed this. Was it actually causing
> > real problems for you, or did you notice it just from code inspection?
> > You should include this information in the commit message.
>
> I am trying to add display support for TI SoC which uses this particular
> bridge. While debugging, I was trying to get all the register value in
> sync with the datasheet and it was then that I observed this issue while
> inspecting the code.
> Maybe Chromebooks are using different set of parameters which does not
> expose this issue. Since parameters for my display (mentioned in commit
> message) yields the frequency at the border, I saw this issue. My debug
> is still ongoing but since the value is not in sync with the
> documentation, I sent out this patch.

OK, sounds good. It would be good to include some of this type of into
in the patch description for the next version.


> > I'm travelling for the next two weeks so I can't actually check on a
> > device to see if your patch makes any difference on hardware I have,
> > but I'd presume that things were working "well enough" with the old
> > value and they'll still work with the new value?
> >
> >
>
> Yes, ideally they should still work well with this change.

OK, I can validate it in a few weeks.


> >> Also according to the SN65DSI86 datasheet[0], the minimum value for th=
at
> >> reg is 0x08 (inclusive) and the maximum value is 0x97 (exclusive). So =
add
> >> check for that.
> >
> > Maybe the range checking should be a separate patch?
>
> Check should be done before propagating the register value so I added it
> in the same function and hence in the same patch.

I was thinking you could have patch #1 add the checks. ...then patch
#2 could fix the math.


> >> -#define MIN_DSI_CLK_FREQ_MHZ   40
> >> +/*
> >> + * NOTE: DSI clock frequency range: [40MHz,755MHz)
> >> + * DSI clock frequency range is in 5-MHz increments
> >> + * So minimum frequency 40MHz translates to 0x08
> >> + * And maximum frequency 755MHz translates to 0x97
> >> + */
> >> +#define MIN_DSI_CLK_RANGE      0x8
> >> +#define MAX_DSI_CLK_RANGE      0x97
> >
> > It's a little weird to call this min/max and have one be inclusive and
> > one be exclusive. Be consistent and say that this is the minimum legal
> > value and the maximum legal value. I think that means the MAX should
> > be 0x96.
>
> The comment above does specify the inclusive/exclusive behavior.
> Since a value corresponds to 5MHz range, associating the value with
> the range makes more sense if I keep it 0x97 (0x97 * 5 -> 755MHz)
> 0x96 corresponds to the range of [750Mz,755MHz).
>
> If this argument does not make sense, I can change it to 0x96 and handle
> it with the inequalities in the function call.

Right that the comment is correct so that's good, but I'd still like
to see the constants changing. For instance, if I had code like this:

/*
 * I know 2 * 2 is not really 5, but it makes my math work out
 * so we'll just define it that way.
 */
#define TWO_TIMES_TWO 5

...and then later you had code:

if (x * y >=3D TWO_TIMES_TWO)

When you read the code you probably wouldn't go back and read the
comment so you'd be confused. AKA the above would be better as:

#define TWO_TIMES_TWO 4

if (x * y > TWO_TIMES_TWO)

Better to make the name of the #define make sense on its own. In this
case "min" and "max" should be the minimum legal value and the maximum
legal value, not "one past".


> >> +        */
> >> +       bit_rate_khz =3D mode->clock *
> >> +                      mipi_dsi_pixel_format_to_bpp(pdata->dsi->format=
);
> >> +
> >> +       /*
> >> +        * For each increment in val, frequency increases by 5MHz
> >> +        * and the factor of 1000 comes from kHz to MHz conversion
> >> +        */
> >> +       val =3D (bit_rate_khz / (pdata->dsi->lanes * 2 * 1000 * 5)) & =
0xFF;
> >> +
> >> +       if (val >=3D MAX_DSI_CLK_RANGE || val < MIN_DSI_CLK_RANGE) {
> >> +               drm_err(pdata->bridge.dev,
> >> +                       "DSI clock frequency not in the supported rang=
e\n");
> >> +               return -EINVAL;
> >> +       }
> >
> > Shouldn't the above be in atomic_check()? There's a reason why
> > atomic_enable() can't return error codes.
>
> Oops.
> I will handle it how we are handling errors in case of link_training:
> https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/ti-s=
n65dsi86.c#L1152
>
> That should be okay I guess?

I'm pretty sure it should be in atomic_check(). The atomic_check() is
supposed to confirm that all parameters are within valid ranges and
the enable function shouldn't fail because the caller passed bad
parameters. Specifically this could allow the caller to try different
parameters and see if those would work instead.

In the case of the link training failure it's not something we could
have detected until we actually tried to enable, so there's no choice.

-Doug
