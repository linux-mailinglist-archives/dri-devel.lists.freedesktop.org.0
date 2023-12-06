Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E40DF807162
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BE910E053;
	Wed,  6 Dec 2023 13:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E9910E053
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:57:19 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a1915034144so112175866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 05:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701871037; x=1702475837;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6leibc9KVGhDFO57vzUjuEC1g9Shhhw6R6lNbUnfvA=;
 b=Lctlh6ChOc4+DSXkKJrwiNtKQHgNpLJffjk2J3qD9ETrdOJskiNe4g4zVKUovul2CA
 jBfMgCMpH/+6rANjQxmY0T0td0MNdalCOqan86zJAWINPpd94RO85cOWgp7dA+D2kfs5
 zGStH9B66C8XDdn7GhmwCzEpKHrcD1dAg4Nhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701871037; x=1702475837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i6leibc9KVGhDFO57vzUjuEC1g9Shhhw6R6lNbUnfvA=;
 b=ViuKs9AV708KKZ/Y6Nyxb3ZSLFgocjKOhRt9NqAEk0hu47+0LYhkcDWTxb7RvaO2jX
 NjEwi2emtRDLYjmFuPX87vfWLuCgnUK+jJ24Rm+FDSdQDKWqFCl/2nycuBWP5Hk7K0fB
 iVRGUinJyLNjW9mqMaIhx2MMaBrYpY7kST1/opqye13cRIDVgdpzjqvH0i270s+pReuj
 zaX/08h89jUvglQxkCWMkvz8UJFH6NwAIBJz1qanzEIr0Be1VqUOh3NkHkQLUUbyQaLm
 uguxKzy257zbFp2nWgBBKl3scI+H1EOsK8f2mqQd89B9Ked6BXPxzWhAwt4o5B1tvvbq
 zSMQ==
X-Gm-Message-State: AOJu0YzZxYd/nVTmG52rCbXl0C5SlX97BZL3p4QC/1Gke+pIz4sTCaTi
 AAXPLPSgMJu7Pwf9enti0cyduH3k30BAK0vFlvjlRg==
X-Google-Smtp-Source: AGHT+IG/PobLNSg+zy1WHv7BVtLTlt7MPeES0U4v/oNNLHDezYqyvRUZLZjOALXehIib1IwlHg77PgQRGzr0Rpof0Xk=
X-Received: by 2002:a17:906:3f08:b0:a14:d6e2:fb1f with SMTP id
 c8-20020a1709063f0800b00a14d6e2fb1fmr615826ejj.10.1701871037673; Wed, 06 Dec
 2023 05:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
 <20231205105341.4100896-3-dario.binacchi@amarulasolutions.com>
 <CAPY8ntAALKiTEG6qyFO=qVqSLUW9x8AMfPMc_TUwC3z8tJ7Kzw@mail.gmail.com>
 <CABGWkvq-fJTDFPB=389XbHW_SLt6BQr-BhjZqZ+01i3v8EaYwA@mail.gmail.com>
 <CAMty3ZBdCW=Rak8gMin8bt9JnFChAu6nw9n6xQyCSZw=63BukA@mail.gmail.com>
In-Reply-To: <CAMty3ZBdCW=Rak8gMin8bt9JnFChAu6nw9n6xQyCSZw=63BukA@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 6 Dec 2023 14:57:06 +0100
Message-ID: <CAOf5uwm_YmXz0A6nuCbJh+iszwqWyQkRRKATKyWZ33YUgZmEnw@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] drm/bridge: Fix a use case in the bridge disable
 logic
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan

On Wed, Dec 6, 2023 at 2:31=E2=80=AFPM Jagan Teki <jagan@amarulasolutions.c=
om> wrote:
>
> Hi Dario,
>
> On Wed, Dec 6, 2023 at 6:57=E2=80=AFPM Dario Binacchi
> <dario.binacchi@amarulasolutions.com> wrote:
> >
> > Hi Dave and Jagan,
> >
> > On Tue, Dec 5, 2023 at 4:39=E2=80=AFPM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi Dario
> > >
> > > On Tue, 5 Dec 2023 at 10:54, Dario Binacchi
> > > <dario.binacchi@amarulasolutions.com> wrote:
> > > >
> > > > The patch fixes the code for finding the next bridge with the
> > > > "pre_enable_prev_first" flag set to false. In case this condition i=
s
> > > > not verified, i. e. there is no subsequent bridge with the flag set=
 to
> > > > false, the whole bridge list is traversed, invalidating the "next"
> > > > variable.
> > > >
> > > > The use of a new iteration variable (i. e. "iter") ensures that the=
 value
> > > > of the "next" variable is not invalidated.
> > >
> > > We already have https://patchwork.freedesktop.org/patch/529288/ that
> > > has been reviewed (but not applied) to resolve this. What does this
> > > version do differently and why?
> >
> > My patches only affect drm_atomic_bridge_chain_post_disable(), whereas
> > Jagan's patch affects both
> > drm_atomic_bridge_chain_post_disable() and drm_atomic_bridge_chain_pre_=
enable().
> > I tested Jagan's patch on my system with success and I reviewed with
> > Michael Trimarchi the
> > drm_atomic_bridge_chain_pre_enable() fixing and we think it's okay.
> > We also believe that our changes to post_disable() are better, as we
> > set the 'next' variable only when required,
> > and the code is more optimized since the list_is_last() is not called
> > within the loop.
> > Would it be possible to use Jagan's patch for fixing
> > drm_atomic_bridge_chain_pre_enable() and mine for
> > fixing drm_atomic_bridge_chain_post_disable()?
> >
>
> Can you please share the post-disabled bridge chain list with the
> below example before and after your change?

We have already git commit the description in how the patch affects
the post_disable. As Dario
reported your patch is ok even in our use case. We don't have a real
use case as the one you describe.

Can we know how you test it in this use case here? Can you test our
patches of post_disable?

Thanks
Michael

>
> Example:
> - Panel
> - Bridge 1
> - Bridge 2 pre_enable_prev_first
> - Bridge 3
> - Bridge 4 pre_enable_prev_first
> - Bridge 5 pre_enable_prev_first
> - Bridge 6
> - Encoder
>
> Thanks,
> Jagan.
