Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7253B7EA424
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 21:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B74110E40B;
	Mon, 13 Nov 2023 20:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B5310E09E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 13:15:19 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-da30fd994fdso4551635276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 05:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699881319; x=1700486119;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L4J9L/OCrmZEAUCARuzc0AkzKVP1ZOLy75hxW10akIQ=;
 b=WSceM0kXg209GmlqxzCF/15lZKeOhuRgCOSyobvIm5sOvyvm8gA4eI5d2UU7nkx6qq
 Ld44zS0Fbo4a2YrlCYPA4nbvjyErviQOZiAtp6K9/Ahoxj8DKPz8O3+/aP79KQ6j7QfH
 CgcwpcZTGNnD+B1oG9WS68cOJFzk0kK/LxBBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699881319; x=1700486119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L4J9L/OCrmZEAUCARuzc0AkzKVP1ZOLy75hxW10akIQ=;
 b=Rs7Lh1goZCtZsKxwGcTWiYyvUKskl+zIjg6jwqW8P5dx75p08Me1IxHcjIgDJ226BY
 Cml3oNh3e7GL5l0wFDoFNlMCU+0KMQQjtVMnlhUK+EcEHaB5wf9rO3YAewr9b7Ej95cx
 cPLSrjFvyy1cUict8QS9/DyiT+7Ns0ZRTfBgziK4/A4JTqAVuKmODrbXIZ5YlV15ijcE
 yO8HQgTE3ePPAWvOubt6VTCKH+WVP2HGU5OVtemFLUsJ+JkzE8p+SeZ0IytKHzY1raVy
 zSUgSppu29XZ2A0uA0EVwG9BJ10U29MAA3/1gHK9d63WDXJMIpw5W+fRgMRQmLk1frxu
 GL8w==
X-Gm-Message-State: AOJu0YwoJLJezt5Gat/60Ek/NvqyO0ou2hgquJRLP5pszGQ7mN5XKQDW
 3b3+glovsh4bHBP2PeHaTGMQB//VLTb0r5yxqT9dvg==
X-Google-Smtp-Source: AGHT+IET6zpXhwQZhQRUdi4km+AMqCVW29p1ychoAlcccGLWuU0gHf7TzqFsK41GeYRePbcgtL2RpTCuBpXje+uGYJI=
X-Received: by 2002:a25:3288:0:b0:da0:8955:34f7 with SMTP id
 y130-20020a253288000000b00da0895534f7mr3341128yby.23.1699881319000; Mon, 13
 Nov 2023 05:15:19 -0800 (PST)
MIME-Version: 1.0
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
 <CAMty3ZBnAw+VHXoZuSgZPmSTMYd-nxBw5cZ+OxLYxqrXRX=MNg@mail.gmail.com>
 <CAPY8ntDTv-dMxRgFOfcbBvH+qjoEOPdK_02OmUtRxtyumx6Q0w@mail.gmail.com>
In-Reply-To: <CAPY8ntDTv-dMxRgFOfcbBvH+qjoEOPdK_02OmUtRxtyumx6Q0w@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 13 Nov 2023 08:15:07 -0500
Message-ID: <CAMty3ZDpty-pgzm-UHg_jpDQs5RjPh+j+RN02Lqh39-wrj8ZtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Fix improper bridge init order with
 pre_enable_prev_first
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 13 Nov 2023 20:01:09 +0000
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 1, 2023 at 11:50=E2=80=AFAM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Jagan
>
> My apologies for dropping the ball on this one, and thanks to Frieder
> for the nudge.
>
> On Wed, 12 Apr 2023 at 07:25, Jagan Teki <jagan@amarulasolutions.com> wro=
te:
> >
> > Hi Dave,
> >
> > Added Maxime, Laurent [which I thought I added before]
> >
> > On Tue, Mar 28, 2023 at 10:38=E2=80=AFPM Jagan Teki <jagan@amarulasolut=
ions.com> wrote:
> > >
> > > For a given bridge pipeline if any bridge sets pre_enable_prev_first
> > > flag then the pre_enable for the previous bridge will be called befor=
e
> > > pre_enable of this bridge and opposite is done for post_disable.
> > >
> > > These are the potential bridge flags to alter bridge init order in or=
der
> > > to satisfy the MIPI DSI host and downstream panel or bridge to functi=
on.
> > > However the existing pre_enable_prev_first logic with associated brid=
ge
> > > ordering has broken for both pre_enable and post_disable calls.
> > >
> > > [pre_enable]
> > >
> > > The altered bridge ordering has failed if two consecutive bridges on =
a
> > > given pipeline enables the pre_enable_prev_first flag.
> > >
> > > Example:
> > > - Panel
> > > - Bridge 1
> > > - Bridge 2 pre_enable_prev_first
> > > - Bridge 3
> > > - Bridge 4 pre_enable_prev_first
> > > - Bridge 5 pre_enable_prev_first
> > > - Bridge 6
> > > - Encoder
> > >
> > > In this example, Bridge 4 and Bridge 5 have pre_enable_prev_first.
> > >
> > > The logic looks for a bridge which enabled pre_enable_prev_first flag
> > > on each iteration and assigned the previou bridge to limit pointer
> > > if the bridge doesn't enable pre_enable_prev_first flags.
> > >
> > > If control found Bridge 2 is pre_enable_prev_first then the iteration
> > > looks for Bridge 3 and found it is not pre_enable_prev_first and assi=
gns
> > > it's previous Bridge 4 to limit pointer and calls pre_enable of Bridg=
e 3
> > > and Bridge 2 and assign iter pointer with limit which is Bridge 4.
> > >
> > > Here is the actual problem, for the next iteration control look for
> > > Bridge 5 instead of Bridge 4 has iter pointer in previous iteration
> > > moved to Bridge 4 so this iteration skips the Bridge 4. The iteration
> > > found Bridge 6 doesn't pre_enable_prev_first flags so the limit assig=
ned
> > > to Encoder. From next iteration Encoder skips as it is the last bridg=
e
> > > for reverse order pipeline.
> > >
> > > So, the resulting pre_enable bridge order would be,
> > > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5.
> > >
> > > This patch fixes this by assigning limit to next pointer instead of
> > > previous bridge since the iteration always looks for bridge that does
> > > NOT request prev so assigning next makes sure the last bridge on a
> > > given iteration what exactly the limit bridge is.
> > >
> > > So, the resulting pre_enable bridge order with fix would be,
> > > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5, Bridge 4,
> > >   Encoder.
> > >
> > > [post_disable]
> > >
> > > The altered bridge ordering has failed if two consecutive bridges on =
a
> > > given pipeline enables the pre_enable_prev_first flag.
> > >
> > > Example:
> > > - Panel
> > > - Bridge 1
> > > - Bridge 2 pre_enable_prev_first
> > > - Bridge 3
> > > - Bridge 4 pre_enable_prev_first
> > > - Bridge 5 pre_enable_prev_first
> > > - Bridge 6
> > > - Encoder
> > >
> > > In this example Bridge 5 and Bridge 4 have pre_enable_prev_first.
> > >
> > > The logic looks for a bridge which enabled pre_enable_prev_first flag=
s
> > > on each iteration and assigned the previou bridge to next and next to
> > > limit pointer if the bridge does enable pre_enable_prev_first flag.
> > >
> > > If control starts from Bridge 6 then it found next Bridge 5 is
> > > pre_enable_prev_first and immediately the next assigned to previous
> > > Bridge 6 and limit assignments to next Bridge 6 and call post_enable
> > > of Bridge 6 even though the next consecutive Bridge 5 is enabled with
> > > pre_enable_prev_first. This clearly misses the logic to find the stat=
e
> > > of next conducive bridge as everytime the next and limit assigns
> > > previous bridge if given bridge enabled pre_enable_prev_first.
> > >
> > > So, the resulting post_disable bridge order would be,
> > > - Encoder, Bridge 6, Bridge 5, Bridge 4, Bridge 3, Bridge 2, Bridge 1=
,
> > >   Panel.
> > >
> > > This patch fixes this by assigning next with previou bridge only if t=
he
> > > bridge doesn't enable pre_enable_prev_first flag and the next further
> > > assign it to limit. This way we can find the bridge that NOT requeste=
d
> > > prev to disable last.
> > >
> > > So, the resulting pre_enable bridge order with fix would be,
> > > - Encoder, Bridge 4, Bridge 5, Bridge 6, Bridge 2, Bridge 3, Bridge 1=
,
> > >   Panel.
> > >
> > > Validated the bridge init ordering by incorporating dummy bridges in
> > > the sun6i-mipi-dsi pipeline
> > >
> > > Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to
> > > alter bridge init order")
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Thanks for investigating and sorting this.
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> > > ---
> > > Changes for v2:
> > > - add missing dri-devel in CC
> >
> > Would you please look into this issue?

These still not been picked it yet, can any one pull these two fixes?

Thanks,
Jagan.
