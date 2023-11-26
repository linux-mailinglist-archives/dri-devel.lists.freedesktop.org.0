Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18557F93AC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 17:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BBB10E124;
	Sun, 26 Nov 2023 16:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9E710E124
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 16:11:48 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5cc642e4c69so33850257b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 08:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701015107; x=1701619907;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tHFbc4WSceWjUdUeGQEEpLKGiDipKThE8kWXbKIqlLs=;
 b=NtQDueXknaaJBUaoMswpjsCNRimP42tGBG3VaVrDdfYDF/fLssAOJpY49kQI87TBpK
 bsofB+rkTZ6boHTahCHMDvNTM+AcXuAmYcpZMVkjmDAmmmRGYK0ls0kww96Ljfc4/MSc
 BsyXXcIaIHAj2qRAmFiI3AEbd/cdT0aMvy+fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701015107; x=1701619907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tHFbc4WSceWjUdUeGQEEpLKGiDipKThE8kWXbKIqlLs=;
 b=FO5v6u3dlSqZNfaSjfQ8recan8WIzPAjnOn35QTKPjWUGT1VpJzo2VGjaqFCS/Z18A
 Bw6CAiZ35iR6P4VsVKP+yL6rCk8nazMOTDMrwsH8Ky90dCn1n4Juo0S/+Jw0bF/q7V86
 ocRUwcExJvGQuVuSqdynHVtna94rOPb4CSzZnaz3HfgVW+8VriGuTdadAGn3CWvnXmZc
 K92+vCG1Z/fv3ad0I0xbiIjqhavoHnGJUkdI0Lr6ax5r/Iee/VJQe9tj0/5mahZnjIBa
 K/l76BKycL6Dgao7DuCC/3PWwwwuNU+3tMUjOKlR4IaYKb2EAZFbsPxlnSAb7uBcEh8H
 VL7w==
X-Gm-Message-State: AOJu0YztwATo+rcrLxJZ7GYvOHyDlXnVxCWKVIR6RJmA3rGQGyRwp86k
 Kn63zlOw/4GiuimY1kjUSShIrirMEkNM1vaJnf570Q==
X-Google-Smtp-Source: AGHT+IGvdVRNl7cuBEO4Hu/G6r0LeXI2tBUZzI4wgDmyQHZnvA7tC8NwqEvZLjrz6sZkudMRJRivvnNF/kndhVqzq/E=
X-Received: by 2002:a0d:f0c1:0:b0:5ca:3251:570c with SMTP id
 z184-20020a0df0c1000000b005ca3251570cmr3748160ywe.35.1701015107285; Sun, 26
 Nov 2023 08:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
 <CAMty3ZBnAw+VHXoZuSgZPmSTMYd-nxBw5cZ+OxLYxqrXRX=MNg@mail.gmail.com>
 <CAPY8ntDTv-dMxRgFOfcbBvH+qjoEOPdK_02OmUtRxtyumx6Q0w@mail.gmail.com>
 <CAMty3ZDpty-pgzm-UHg_jpDQs5RjPh+j+RN02Lqh39-wrj8ZtQ@mail.gmail.com>
In-Reply-To: <CAMty3ZDpty-pgzm-UHg_jpDQs5RjPh+j+RN02Lqh39-wrj8ZtQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 26 Nov 2023 21:41:35 +0530
Message-ID: <CAMty3ZA0rjAufoSG62SChNoLyEoL=iT6f0rtSZJ=J+SiidytyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Fix improper bridge init order with
 pre_enable_prev_first
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 13, 2023 at 6:45=E2=80=AFPM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
>
> On Tue, Aug 1, 2023 at 11:50=E2=80=AFAM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Jagan
> >
> > My apologies for dropping the ball on this one, and thanks to Frieder
> > for the nudge.
> >
> > On Wed, 12 Apr 2023 at 07:25, Jagan Teki <jagan@amarulasolutions.com> w=
rote:
> > >
> > > Hi Dave,
> > >
> > > Added Maxime, Laurent [which I thought I added before]
> > >
> > > On Tue, Mar 28, 2023 at 10:38=E2=80=AFPM Jagan Teki <jagan@amarulasol=
utions.com> wrote:
> > > >
> > > > For a given bridge pipeline if any bridge sets pre_enable_prev_firs=
t
> > > > flag then the pre_enable for the previous bridge will be called bef=
ore
> > > > pre_enable of this bridge and opposite is done for post_disable.
> > > >
> > > > These are the potential bridge flags to alter bridge init order in =
order
> > > > to satisfy the MIPI DSI host and downstream panel or bridge to func=
tion.
> > > > However the existing pre_enable_prev_first logic with associated br=
idge
> > > > ordering has broken for both pre_enable and post_disable calls.
> > > >
> > > > [pre_enable]
> > > >
> > > > The altered bridge ordering has failed if two consecutive bridges o=
n a
> > > > given pipeline enables the pre_enable_prev_first flag.
> > > >
> > > > Example:
> > > > - Panel
> > > > - Bridge 1
> > > > - Bridge 2 pre_enable_prev_first
> > > > - Bridge 3
> > > > - Bridge 4 pre_enable_prev_first
> > > > - Bridge 5 pre_enable_prev_first
> > > > - Bridge 6
> > > > - Encoder
> > > >
> > > > In this example, Bridge 4 and Bridge 5 have pre_enable_prev_first.
> > > >
> > > > The logic looks for a bridge which enabled pre_enable_prev_first fl=
ag
> > > > on each iteration and assigned the previou bridge to limit pointer
> > > > if the bridge doesn't enable pre_enable_prev_first flags.
> > > >
> > > > If control found Bridge 2 is pre_enable_prev_first then the iterati=
on
> > > > looks for Bridge 3 and found it is not pre_enable_prev_first and as=
signs
> > > > it's previous Bridge 4 to limit pointer and calls pre_enable of Bri=
dge 3
> > > > and Bridge 2 and assign iter pointer with limit which is Bridge 4.
> > > >
> > > > Here is the actual problem, for the next iteration control look for
> > > > Bridge 5 instead of Bridge 4 has iter pointer in previous iteration
> > > > moved to Bridge 4 so this iteration skips the Bridge 4. The iterati=
on
> > > > found Bridge 6 doesn't pre_enable_prev_first flags so the limit ass=
igned
> > > > to Encoder. From next iteration Encoder skips as it is the last bri=
dge
> > > > for reverse order pipeline.
> > > >
> > > > So, the resulting pre_enable bridge order would be,
> > > > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5.
> > > >
> > > > This patch fixes this by assigning limit to next pointer instead of
> > > > previous bridge since the iteration always looks for bridge that do=
es
> > > > NOT request prev so assigning next makes sure the last bridge on a
> > > > given iteration what exactly the limit bridge is.
> > > >
> > > > So, the resulting pre_enable bridge order with fix would be,
> > > > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5, Bridge 4=
,
> > > >   Encoder.
> > > >
> > > > [post_disable]
> > > >
> > > > The altered bridge ordering has failed if two consecutive bridges o=
n a
> > > > given pipeline enables the pre_enable_prev_first flag.
> > > >
> > > > Example:
> > > > - Panel
> > > > - Bridge 1
> > > > - Bridge 2 pre_enable_prev_first
> > > > - Bridge 3
> > > > - Bridge 4 pre_enable_prev_first
> > > > - Bridge 5 pre_enable_prev_first
> > > > - Bridge 6
> > > > - Encoder
> > > >
> > > > In this example Bridge 5 and Bridge 4 have pre_enable_prev_first.
> > > >
> > > > The logic looks for a bridge which enabled pre_enable_prev_first fl=
ags
> > > > on each iteration and assigned the previou bridge to next and next =
to
> > > > limit pointer if the bridge does enable pre_enable_prev_first flag.
> > > >
> > > > If control starts from Bridge 6 then it found next Bridge 5 is
> > > > pre_enable_prev_first and immediately the next assigned to previous
> > > > Bridge 6 and limit assignments to next Bridge 6 and call post_enabl=
e
> > > > of Bridge 6 even though the next consecutive Bridge 5 is enabled wi=
th
> > > > pre_enable_prev_first. This clearly misses the logic to find the st=
ate
> > > > of next conducive bridge as everytime the next and limit assigns
> > > > previous bridge if given bridge enabled pre_enable_prev_first.
> > > >
> > > > So, the resulting post_disable bridge order would be,
> > > > - Encoder, Bridge 6, Bridge 5, Bridge 4, Bridge 3, Bridge 2, Bridge=
 1,
> > > >   Panel.
> > > >
> > > > This patch fixes this by assigning next with previou bridge only if=
 the
> > > > bridge doesn't enable pre_enable_prev_first flag and the next furth=
er
> > > > assign it to limit. This way we can find the bridge that NOT reques=
ted
> > > > prev to disable last.
> > > >
> > > > So, the resulting pre_enable bridge order with fix would be,
> > > > - Encoder, Bridge 4, Bridge 5, Bridge 6, Bridge 2, Bridge 3, Bridge=
 1,
> > > >   Panel.
> > > >
> > > > Validated the bridge init ordering by incorporating dummy bridges i=
n
> > > > the sun6i-mipi-dsi pipeline
> > > >
> > > > Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first t=
o
> > > > alter bridge init order")
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >
> > Thanks for investigating and sorting this.
> >
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > > > ---
> > > > Changes for v2:
> > > > - add missing dri-devel in CC
> > >
> > > Would you please look into this issue?
>
> These still not been picked it yet, can any one pull these two fixes?

Ping!
