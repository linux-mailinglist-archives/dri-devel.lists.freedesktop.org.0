Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7A5817B8F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4FA10E2BD;
	Mon, 18 Dec 2023 19:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198B410E2B5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:58:13 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-6da69dd6e9fso1139991a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 11:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702929492; x=1703534292;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TExvyPMshsKZRshugEeoqTSg8C6PqbbJtiYqy+6emDE=;
 b=bCKJVx0BWeYOK8nzTvFzrTQPrqV5CVQ+PXRwINzPDYIpDO9tHoNbCnOkPuSdvmotO+
 DIJE/bb7VtpvvDVgDIyJhJrBjPuZFjh+7vSKMmC0lCYArALI1fWV15bDvNAqqNP1MpqS
 VOuL4KfaJC5xp1FI34+I/2YiaZvA4e5PE9Q/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702929492; x=1703534292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TExvyPMshsKZRshugEeoqTSg8C6PqbbJtiYqy+6emDE=;
 b=JfKvwixNd1QRKE2zUk55MD8MdjvgMvB2Sg7mVHA/YjGsvXv5vagfGSpQa/8RCF+JtW
 D/Nxhlvz6QInjmriHPYT2ZC5CIGyHmP1mIL0tyU3eC0aYT5Tblgb4R1j4PjCbxra4Py0
 slJCJW2fB9ujw7zKk+KDcAyvNm0E5KGFl5OA31wyGZbl+bRHpYa3+hgCKxb1NKA7gYG9
 8nBnegDnavvePL9qxndVnFUPUkumDEZSHaY+Lp0zjbtekHH9HcUdHXVE7J7RCfy3vLH8
 VbCroTcy/ffYEI9klzZ2cwSf9pIBstJhA+l7qvImV5XxsmbqnF2T21xTuG9blhrLdGmc
 AP8A==
X-Gm-Message-State: AOJu0YyfCFnoO2/eTA7E/9Q3a0+GP47qfjtOzoiaeXoTg7vkam8iJi51
 tgUkt42EdUMfbL5BWpjcAFADUiDB6AW176sG1P2PYHKv0yjSeDCfuSU=
X-Google-Smtp-Source: AGHT+IHB22ysO3kS9m/9A9mtuQpM+EA9FMi0Gbgum2tuC+lc4xYDjpJJMqB7CzMEmGN+NX/uQMkhWWQKkF72OWppQkU=
X-Received: by 2002:a0d:eb10:0:b0:5e4:a68a:cf9f with SMTP id
 u16-20020a0deb10000000b005e4a68acf9fmr3251147ywe.17.1702895332107; Mon, 18
 Dec 2023 02:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
 <CAMty3ZBnAw+VHXoZuSgZPmSTMYd-nxBw5cZ+OxLYxqrXRX=MNg@mail.gmail.com>
 <CAPY8ntDTv-dMxRgFOfcbBvH+qjoEOPdK_02OmUtRxtyumx6Q0w@mail.gmail.com>
 <CAMty3ZDpty-pgzm-UHg_jpDQs5RjPh+j+RN02Lqh39-wrj8ZtQ@mail.gmail.com>
 <CAMty3ZA0rjAufoSG62SChNoLyEoL=iT6f0rtSZJ=J+SiidytyA@mail.gmail.com>
In-Reply-To: <CAMty3ZA0rjAufoSG62SChNoLyEoL=iT6f0rtSZJ=J+SiidytyA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 18 Dec 2023 15:58:39 +0530
Message-ID: <CAMty3ZD5g7dKVyHirdos8o8PLYF2LAZCWKQtFtqUR8PruPOL0A@mail.gmail.com>
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

On Sun, Nov 26, 2023 at 9:41=E2=80=AFPM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
>
> On Mon, Nov 13, 2023 at 6:45=E2=80=AFPM Jagan Teki <jagan@amarulasolution=
s.com> wrote:
> >
> > On Tue, Aug 1, 2023 at 11:50=E2=80=AFAM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi Jagan
> > >
> > > My apologies for dropping the ball on this one, and thanks to Frieder
> > > for the nudge.
> > >
> > > On Wed, 12 Apr 2023 at 07:25, Jagan Teki <jagan@amarulasolutions.com>=
 wrote:
> > > >
> > > > Hi Dave,
> > > >
> > > > Added Maxime, Laurent [which I thought I added before]
> > > >
> > > > On Tue, Mar 28, 2023 at 10:38=E2=80=AFPM Jagan Teki <jagan@amarulas=
olutions.com> wrote:
> > > > >
> > > > > For a given bridge pipeline if any bridge sets pre_enable_prev_fi=
rst
> > > > > flag then the pre_enable for the previous bridge will be called b=
efore
> > > > > pre_enable of this bridge and opposite is done for post_disable.
> > > > >
> > > > > These are the potential bridge flags to alter bridge init order i=
n order
> > > > > to satisfy the MIPI DSI host and downstream panel or bridge to fu=
nction.
> > > > > However the existing pre_enable_prev_first logic with associated =
bridge
> > > > > ordering has broken for both pre_enable and post_disable calls.
> > > > >
> > > > > [pre_enable]
> > > > >
> > > > > The altered bridge ordering has failed if two consecutive bridges=
 on a
> > > > > given pipeline enables the pre_enable_prev_first flag.
> > > > >
> > > > > Example:
> > > > > - Panel
> > > > > - Bridge 1
> > > > > - Bridge 2 pre_enable_prev_first
> > > > > - Bridge 3
> > > > > - Bridge 4 pre_enable_prev_first
> > > > > - Bridge 5 pre_enable_prev_first
> > > > > - Bridge 6
> > > > > - Encoder
> > > > >
> > > > > In this example, Bridge 4 and Bridge 5 have pre_enable_prev_first=
.
> > > > >
> > > > > The logic looks for a bridge which enabled pre_enable_prev_first =
flag
> > > > > on each iteration and assigned the previou bridge to limit pointe=
r
> > > > > if the bridge doesn't enable pre_enable_prev_first flags.
> > > > >
> > > > > If control found Bridge 2 is pre_enable_prev_first then the itera=
tion
> > > > > looks for Bridge 3 and found it is not pre_enable_prev_first and =
assigns
> > > > > it's previous Bridge 4 to limit pointer and calls pre_enable of B=
ridge 3
> > > > > and Bridge 2 and assign iter pointer with limit which is Bridge 4=
.
> > > > >
> > > > > Here is the actual problem, for the next iteration control look f=
or
> > > > > Bridge 5 instead of Bridge 4 has iter pointer in previous iterati=
on
> > > > > moved to Bridge 4 so this iteration skips the Bridge 4. The itera=
tion
> > > > > found Bridge 6 doesn't pre_enable_prev_first flags so the limit a=
ssigned
> > > > > to Encoder. From next iteration Encoder skips as it is the last b=
ridge
> > > > > for reverse order pipeline.
> > > > >
> > > > > So, the resulting pre_enable bridge order would be,
> > > > > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5.
> > > > >
> > > > > This patch fixes this by assigning limit to next pointer instead =
of
> > > > > previous bridge since the iteration always looks for bridge that =
does
> > > > > NOT request prev so assigning next makes sure the last bridge on =
a
> > > > > given iteration what exactly the limit bridge is.
> > > > >
> > > > > So, the resulting pre_enable bridge order with fix would be,
> > > > > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5, Bridge=
 4,
> > > > >   Encoder.
> > > > >
> > > > > [post_disable]
> > > > >
> > > > > The altered bridge ordering has failed if two consecutive bridges=
 on a
> > > > > given pipeline enables the pre_enable_prev_first flag.
> > > > >
> > > > > Example:
> > > > > - Panel
> > > > > - Bridge 1
> > > > > - Bridge 2 pre_enable_prev_first
> > > > > - Bridge 3
> > > > > - Bridge 4 pre_enable_prev_first
> > > > > - Bridge 5 pre_enable_prev_first
> > > > > - Bridge 6
> > > > > - Encoder
> > > > >
> > > > > In this example Bridge 5 and Bridge 4 have pre_enable_prev_first.
> > > > >
> > > > > The logic looks for a bridge which enabled pre_enable_prev_first =
flags
> > > > > on each iteration and assigned the previou bridge to next and nex=
t to
> > > > > limit pointer if the bridge does enable pre_enable_prev_first fla=
g.
> > > > >
> > > > > If control starts from Bridge 6 then it found next Bridge 5 is
> > > > > pre_enable_prev_first and immediately the next assigned to previo=
us
> > > > > Bridge 6 and limit assignments to next Bridge 6 and call post_ena=
ble
> > > > > of Bridge 6 even though the next consecutive Bridge 5 is enabled =
with
> > > > > pre_enable_prev_first. This clearly misses the logic to find the =
state
> > > > > of next conducive bridge as everytime the next and limit assigns
> > > > > previous bridge if given bridge enabled pre_enable_prev_first.
> > > > >
> > > > > So, the resulting post_disable bridge order would be,
> > > > > - Encoder, Bridge 6, Bridge 5, Bridge 4, Bridge 3, Bridge 2, Brid=
ge 1,
> > > > >   Panel.
> > > > >
> > > > > This patch fixes this by assigning next with previou bridge only =
if the
> > > > > bridge doesn't enable pre_enable_prev_first flag and the next fur=
ther
> > > > > assign it to limit. This way we can find the bridge that NOT requ=
ested
> > > > > prev to disable last.
> > > > >
> > > > > So, the resulting pre_enable bridge order with fix would be,
> > > > > - Encoder, Bridge 4, Bridge 5, Bridge 6, Bridge 2, Bridge 3, Brid=
ge 1,
> > > > >   Panel.
> > > > >
> > > > > Validated the bridge init ordering by incorporating dummy bridges=
 in
> > > > > the sun6i-mipi-dsi pipeline
> > > > >
> > > > > Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first=
 to
> > > > > alter bridge init order")
> > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >
> > > Thanks for investigating and sorting this.
> > >
> > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >
> > > > > ---
> > > > > Changes for v2:
> > > > > - add missing dri-devel in CC
> > > >
> > > > Would you please look into this issue?
> >
> > These still not been picked it yet, can any one pull these two fixes?
>
> Ping!

Ping!

Thanks,
Jagan.
