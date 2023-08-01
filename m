Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC2B76B908
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 17:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C082510E11C;
	Tue,  1 Aug 2023 15:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964E610E11C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 15:50:00 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-48642554ef1so2318214e0c.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 08:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1690904999; x=1691509799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BVfX0h2uzn9NQ6tWmT3hQXyOnQWAigF13+02mKmOn6w=;
 b=EbuXw3UW+RvtZbXmked7DL0/dHEG2+Ukq5zcoR6V/uCRBMyFxla10zx57jr1wed2Tz
 L6/oH9twP2Kc0hnqafmzj6Vc/yAUpD/PnXuqkrwC7RAEc3mZWZYgCsTEu0sYcWsmJ9Ep
 WWiEoOG19pSZqvCGLl3znA2b5ONHrxY6EQelfYq/5HX8lfxrn8omE2pN9sFPw6Qfl86Z
 5JA9KG06n4C0csDvkfgFkyJNPfNub8JjD90t9H17lfWt52Bn0LKH6lkJsBpMctaMiiKD
 Cnwcd/Qtr/g0hrRsnarNkYTkZ50laDHCw5qc7pZBe6KuXLsPYb0m0Q6szbmqZGjbn/hx
 sQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690904999; x=1691509799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BVfX0h2uzn9NQ6tWmT3hQXyOnQWAigF13+02mKmOn6w=;
 b=QXv/ZIUOuYx5Pvwf0Y9qdVEbQtj1mpWJH89w65naegnnYHZZ2YLM59Wt7Id2YKH7bB
 1IXrEmnl3fy7GPw6+TZ6uxnLil1ygzwoPK9v+6PGQf7f4Qw/YdpmfOB1b/eIEL4ACoEk
 4+FbxpSNSu26hhvRkTebrh0/fT41CdpM2yWIt95L6BloW9ZMvK9NF5dJXvBQHUjSfNGa
 JvRnb02sKO78bWBHgNjtt3gGL0jFFQahHajF0dScmNIlQmBW2r9nX8V+tOsSPVWXd13T
 lZBGM6Gc0n9z3msN01wmrXQmH0VmwFC1rTOAdCp7zSMcpxXn9ouGCurPEDcNEFw5C4mv
 jR4A==
X-Gm-Message-State: ABy/qLY36EwhJVZSmUJW9lEQD6rTYOo8yhgj2k9kBI4x+LHmKItGjOrS
 2f1GOGFrYHUI4sHypbmyiS4SA0w+97kZ+WQ4BGfU3Q==
X-Google-Smtp-Source: APBJJlEY+XBOj2JJqfEkOLHyUKdbLiMOf8kX7yfPI+MKQ3cr+OLqubWvegopV+0vS7fSl4JfNA6azLUOYsmTIcAglU8=
X-Received: by 2002:a1f:52c3:0:b0:486:5719:f4e0 with SMTP id
 g186-20020a1f52c3000000b004865719f4e0mr2718640vkb.7.1690904999648; Tue, 01
 Aug 2023 08:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
 <CAMty3ZBnAw+VHXoZuSgZPmSTMYd-nxBw5cZ+OxLYxqrXRX=MNg@mail.gmail.com>
In-Reply-To: <CAMty3ZBnAw+VHXoZuSgZPmSTMYd-nxBw5cZ+OxLYxqrXRX=MNg@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 1 Aug 2023 16:49:44 +0100
Message-ID: <CAPY8ntDTv-dMxRgFOfcbBvH+qjoEOPdK_02OmUtRxtyumx6Q0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Fix improper bridge init order with
 pre_enable_prev_first
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan

My apologies for dropping the ball on this one, and thanks to Frieder
for the nudge.

On Wed, 12 Apr 2023 at 07:25, Jagan Teki <jagan@amarulasolutions.com> wrote=
:
>
> Hi Dave,
>
> Added Maxime, Laurent [which I thought I added before]
>
> On Tue, Mar 28, 2023 at 10:38=E2=80=AFPM Jagan Teki <jagan@amarulasolutio=
ns.com> wrote:
> >
> > For a given bridge pipeline if any bridge sets pre_enable_prev_first
> > flag then the pre_enable for the previous bridge will be called before
> > pre_enable of this bridge and opposite is done for post_disable.
> >
> > These are the potential bridge flags to alter bridge init order in orde=
r
> > to satisfy the MIPI DSI host and downstream panel or bridge to function=
.
> > However the existing pre_enable_prev_first logic with associated bridge
> > ordering has broken for both pre_enable and post_disable calls.
> >
> > [pre_enable]
> >
> > The altered bridge ordering has failed if two consecutive bridges on a
> > given pipeline enables the pre_enable_prev_first flag.
> >
> > Example:
> > - Panel
> > - Bridge 1
> > - Bridge 2 pre_enable_prev_first
> > - Bridge 3
> > - Bridge 4 pre_enable_prev_first
> > - Bridge 5 pre_enable_prev_first
> > - Bridge 6
> > - Encoder
> >
> > In this example, Bridge 4 and Bridge 5 have pre_enable_prev_first.
> >
> > The logic looks for a bridge which enabled pre_enable_prev_first flag
> > on each iteration and assigned the previou bridge to limit pointer
> > if the bridge doesn't enable pre_enable_prev_first flags.
> >
> > If control found Bridge 2 is pre_enable_prev_first then the iteration
> > looks for Bridge 3 and found it is not pre_enable_prev_first and assign=
s
> > it's previous Bridge 4 to limit pointer and calls pre_enable of Bridge =
3
> > and Bridge 2 and assign iter pointer with limit which is Bridge 4.
> >
> > Here is the actual problem, for the next iteration control look for
> > Bridge 5 instead of Bridge 4 has iter pointer in previous iteration
> > moved to Bridge 4 so this iteration skips the Bridge 4. The iteration
> > found Bridge 6 doesn't pre_enable_prev_first flags so the limit assigne=
d
> > to Encoder. From next iteration Encoder skips as it is the last bridge
> > for reverse order pipeline.
> >
> > So, the resulting pre_enable bridge order would be,
> > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5.
> >
> > This patch fixes this by assigning limit to next pointer instead of
> > previous bridge since the iteration always looks for bridge that does
> > NOT request prev so assigning next makes sure the last bridge on a
> > given iteration what exactly the limit bridge is.
> >
> > So, the resulting pre_enable bridge order with fix would be,
> > - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5, Bridge 4,
> >   Encoder.
> >
> > [post_disable]
> >
> > The altered bridge ordering has failed if two consecutive bridges on a
> > given pipeline enables the pre_enable_prev_first flag.
> >
> > Example:
> > - Panel
> > - Bridge 1
> > - Bridge 2 pre_enable_prev_first
> > - Bridge 3
> > - Bridge 4 pre_enable_prev_first
> > - Bridge 5 pre_enable_prev_first
> > - Bridge 6
> > - Encoder
> >
> > In this example Bridge 5 and Bridge 4 have pre_enable_prev_first.
> >
> > The logic looks for a bridge which enabled pre_enable_prev_first flags
> > on each iteration and assigned the previou bridge to next and next to
> > limit pointer if the bridge does enable pre_enable_prev_first flag.
> >
> > If control starts from Bridge 6 then it found next Bridge 5 is
> > pre_enable_prev_first and immediately the next assigned to previous
> > Bridge 6 and limit assignments to next Bridge 6 and call post_enable
> > of Bridge 6 even though the next consecutive Bridge 5 is enabled with
> > pre_enable_prev_first. This clearly misses the logic to find the state
> > of next conducive bridge as everytime the next and limit assigns
> > previous bridge if given bridge enabled pre_enable_prev_first.
> >
> > So, the resulting post_disable bridge order would be,
> > - Encoder, Bridge 6, Bridge 5, Bridge 4, Bridge 3, Bridge 2, Bridge 1,
> >   Panel.
> >
> > This patch fixes this by assigning next with previou bridge only if the
> > bridge doesn't enable pre_enable_prev_first flag and the next further
> > assign it to limit. This way we can find the bridge that NOT requested
> > prev to disable last.
> >
> > So, the resulting pre_enable bridge order with fix would be,
> > - Encoder, Bridge 4, Bridge 5, Bridge 6, Bridge 2, Bridge 3, Bridge 1,
> >   Panel.
> >
> > Validated the bridge init ordering by incorporating dummy bridges in
> > the sun6i-mipi-dsi pipeline
> >
> > Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to
> > alter bridge init order")
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Thanks for investigating and sorting this.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> > ---
> > Changes for v2:
> > - add missing dri-devel in CC
>
> Would you please look into this issue?
>
> Thanks,
> Jagan.
