Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997DA8070EE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1150A10E721;
	Wed,  6 Dec 2023 13:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194EA10E723
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:31:22 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-db548cd1c45so4868817276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 05:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701869481; x=1702474281;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FewHbthA5tIi/+DoNr+3p8lXbtSbIVFpc9WJQbitIjE=;
 b=LUrHeKF81vA+2QquHCiWA+QKMh4bhumaWZErEHMDp4XtM7XKMryCuBFXfdHK3+d+Pk
 4OpNjxmsmNW+2XOQSK9g7N741n4V4aO2G3iyl1vqYBTf4C4zM6C2Ud4h1hYZiiXfbJzP
 rSXfkALyHCp5iCVkb0hhgXMzbUSmjd4PnVi58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701869481; x=1702474281;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FewHbthA5tIi/+DoNr+3p8lXbtSbIVFpc9WJQbitIjE=;
 b=i8zHfdkqGLJU1/yfZ5MuaxQvO/8mC57V+7YnSdYu5u9PIh/h7gungTZ+0aMsHFG4D0
 X2zk5Y5SXrO8pOMAjUuS0r5qQa41UFPlDatVKpto4fIUK8trgPU4UhTENSUZqa70JUJA
 aszA97RmGMhUHIuT+8LBH7bXkzLrF1+JQtsrrww7JTKQn6jMqJHWKgrSu1Z2pyxZxCKA
 kRDDfx9hLW7UpxI8yONwfyp2Daj8Q6++SQzwJDOfyFQvX0LcRzvpxhVgAuQiL1DsXbKZ
 fccM1qLo2erwvb8meAuJe9sbADTsSr5NkO5Vu+qrhmkBn0bsPfnxZjhqagrO+yWF678z
 EJfA==
X-Gm-Message-State: AOJu0Yw7B4l8wnBsNALV7pAHNIovxwzIXJQ/bUNF2FFZMBLWhnsKNtWf
 NAL18/GERoZkUkTA6Py9tpgZxiT+nnGpMLpwDoP+8A==
X-Google-Smtp-Source: AGHT+IGkU1/QHUGepldrjZH1LMdVc1asZvayNB5NfRB3ai5lxSqWKfAcrwb0/nHUGw2DBbJuz0gdjyFX582NfXzVXRI=
X-Received: by 2002:a25:260c:0:b0:db5:483d:b4f3 with SMTP id
 m12-20020a25260c000000b00db5483db4f3mr637943ybm.36.1701869481167; Wed, 06 Dec
 2023 05:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
 <20231205105341.4100896-3-dario.binacchi@amarulasolutions.com>
 <CAPY8ntAALKiTEG6qyFO=qVqSLUW9x8AMfPMc_TUwC3z8tJ7Kzw@mail.gmail.com>
 <CABGWkvq-fJTDFPB=389XbHW_SLt6BQr-BhjZqZ+01i3v8EaYwA@mail.gmail.com>
In-Reply-To: <CABGWkvq-fJTDFPB=389XbHW_SLt6BQr-BhjZqZ+01i3v8EaYwA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 6 Dec 2023 19:01:10 +0530
Message-ID: <CAMty3ZBdCW=Rak8gMin8bt9JnFChAu6nw9n6xQyCSZw=63BukA@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] drm/bridge: Fix a use case in the bridge disable
 logic
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario,

On Wed, Dec 6, 2023 at 6:57=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> Hi Dave and Jagan,
>
> On Tue, Dec 5, 2023 at 4:39=E2=80=AFPM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Dario
> >
> > On Tue, 5 Dec 2023 at 10:54, Dario Binacchi
> > <dario.binacchi@amarulasolutions.com> wrote:
> > >
> > > The patch fixes the code for finding the next bridge with the
> > > "pre_enable_prev_first" flag set to false. In case this condition is
> > > not verified, i. e. there is no subsequent bridge with the flag set t=
o
> > > false, the whole bridge list is traversed, invalidating the "next"
> > > variable.
> > >
> > > The use of a new iteration variable (i. e. "iter") ensures that the v=
alue
> > > of the "next" variable is not invalidated.
> >
> > We already have https://patchwork.freedesktop.org/patch/529288/ that
> > has been reviewed (but not applied) to resolve this. What does this
> > version do differently and why?
>
> My patches only affect drm_atomic_bridge_chain_post_disable(), whereas
> Jagan's patch affects both
> drm_atomic_bridge_chain_post_disable() and drm_atomic_bridge_chain_pre_en=
able().
> I tested Jagan's patch on my system with success and I reviewed with
> Michael Trimarchi the
> drm_atomic_bridge_chain_pre_enable() fixing and we think it's okay.
> We also believe that our changes to post_disable() are better, as we
> set the 'next' variable only when required,
> and the code is more optimized since the list_is_last() is not called
> within the loop.
> Would it be possible to use Jagan's patch for fixing
> drm_atomic_bridge_chain_pre_enable() and mine for
> fixing drm_atomic_bridge_chain_post_disable()?
>

Can you please share the post-disabled bridge chain list with the
below example before and after your change?

Example:
- Panel
- Bridge 1
- Bridge 2 pre_enable_prev_first
- Bridge 3
- Bridge 4 pre_enable_prev_first
- Bridge 5 pre_enable_prev_first
- Bridge 6
- Encoder

Thanks,
Jagan.
