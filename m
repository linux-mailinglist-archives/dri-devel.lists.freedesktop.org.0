Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50357309D8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 23:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985C110E46A;
	Wed, 14 Jun 2023 21:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F4E10E46A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 21:31:34 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-519608ddbf7so1299638a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 14:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686778291; x=1689370291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oh5nWE0pGFkoodtEGgImAH9t2K0gwbTAJWDqrg/URHU=;
 b=dd8fvg9BJ0eWmK5VmMgDPl/iV8qfCkbQpLH7iLrpmKj/TtjSSwn+vV19aDzp5Xyn/y
 mVHN8wM8n4jXrZlXBprRk/e+hh75RxLu5CruzitcZSuh4oibemRm7bZvkQ10WOksMFip
 NgI7Cy60HHCl6TVaM/OZd3FdyLLvJhRiVUp4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686778291; x=1689370291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oh5nWE0pGFkoodtEGgImAH9t2K0gwbTAJWDqrg/URHU=;
 b=Av2ha7798lIc6XDsHvyC4KDVlbpsa751w+WrATBE2NdPTyGn5NcgcjYm22lmyOxEtG
 qtfZuANHVy3u3Snj/H82MjMnRdpSwFWW7xg6SibJjo+RlhqMt/j+edGMsJKJalMkl1e8
 jTonB3Qlvamy7twenJppncj74+jDlzAScfBGP+vt5F9oQsAdulA9ofMIlC9iay6+AYLT
 y1V1fyZRztHj7ZIv1nqjMIj0e8YI+dXzm3oqtydSs2HA0Cq38fwThXV/rjgbnQbTFpeC
 Wegkmqn6VQ11+XjNXwHR3k6Dium2knkXX7npXY4BGK5NlVkjs12epbvStii/wHU/ig1s
 OgzA==
X-Gm-Message-State: AC+VfDyk2K0uN4iGuFfb1uWCmnYlh3L6hYzNf4Zdhq1QcneACJvNDhrf
 Izn0IxbgsLUJ5WvoDrKKvOJJapnwp+Hnx3SB0izdVRh1
X-Google-Smtp-Source: ACHHUZ6xfuxprTLXG+VrOi9JM2eVaX2UyNsOq+nsnMlywU74i78h0D80PFavTCgtGYdYARX33LhNbw==
X-Received: by 2002:aa7:d703:0:b0:514:95e8:566c with SMTP id
 t3-20020aa7d703000000b0051495e8566cmr7802224edq.42.1686778290966; 
 Wed, 14 Jun 2023 14:31:30 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 g16-20020aa7d1d0000000b0050bc4600d38sm8145721edp.79.2023.06.14.14.31.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 14:31:30 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so966a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 14:31:29 -0700 (PDT)
X-Received: by 2002:a50:9e65:0:b0:51a:2012:5b34 with SMTP id
 z92-20020a509e65000000b0051a20125b34mr1137ede.4.1686778289380; Wed, 14 Jun
 2023 14:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230612163256.1.I7b8f60b3fbfda068f9bf452d584dc934494bfbfa@changeid>
 <86ad3ffb-fbe2-9bed-751d-684994b71e9d@collabora.com>
In-Reply-To: <86ad3ffb-fbe2-9bed-751d-684994b71e9d@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Jun 2023 14:31:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGN7NEFjtAAr+y_Vfth0MKL875B1+mqzmy3yAfteNxuQ@mail.gmail.com>
Message-ID: <CAD=FV=XGN7NEFjtAAr+y_Vfth0MKL875B1+mqzmy3yAfteNxuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Drop the ability of ps8640 to fetch
 the EDID
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Pin-yen Lin <treapking@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 14, 2023 at 1:22=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 13/06/23 01:32, Douglas Anderson ha scritto:
> > In order to read the EDID from an eDP panel, you not only need to
> > power on the bridge chip itself but also the panel. In the ps8640
> > driver, this was made to work by having the bridge chip manually power
> > the panel on by calling pre_enable() on everything connectorward on
> > the bridge chain. This worked OK, but...
> >
> > ...when trying to do the same thing on ti-sn65dsi86, feedback was that
> > this wasn't a great idea. As a result, we designed the "DP AUX"
> > bus. With the design we ended up with the panel driver itself was in
> > charge of reading the EDID. The panel driver could power itself on and
> > the bridge chip was able to power itself on because it implemented the
> > DP AUX bus.
> >
> > Despite the fact that we came up with a new scheme, implemented in on
> > ti-sn65dsi86, and even implemented it on parade-ps8640, we still kept
> > the old code around. This was because the new scheme required a DT
> > change. Previously the panel was a simple "platform_device" and in DT
> > at the top level. With the new design the panel needs to be listed in
> > DT under the DP controller node. The old code allowed us to properly
> > fetch EDIDs with ps8640 with the old DTs.
> >
> > Unfortunately, the old code stopped working as of commit 102e80d1fa2c
> > ("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs"). There
> > are cases at bootup where connector->state->state is NULL and the
> > kernel crashed at:
> > * drm_atomic_bridge_chain_pre_enable
> > * drm_atomic_get_old_bridge_state
> > * drm_atomic_get_old_private_obj_state
> >
> > A bit of digging was done to see if there was an easy fix but there
> > was nothing obvious. Instead, the only device using ps8640 the "old"
> > way had its DT updated so that the panel was no longer a simple
> > "platform_deice". See commit c2d94f72140a ("arm64: dts: mediatek:
> > mt8173-elm: Move display to ps8640 auxiliary bus") and commit
> > 113b5cc06f44 ("arm64: dts: mediatek: mt8173-elm: remove panel model
> > number in DT").
> >
> > Let's delete the old, crashing code so nobody gets tempted to copy it
> > or figure out how it works (since it doesn't).
> >
> > NOTE: from a device tree "purist" point of view, we're supposed to
> > keep old device trees working and this patch is technically "against
> > policy". Reasons I'm still proposing it anyway:
> > 1. Officially, old mt8173-elm device trees worked via the "little
> >     white lie" approach. The DT would list an arbitrary/representative
> >     panel that would be used for power sequencing. The mode information
> >     in the panel driver would then be ignored / overridden by the EDID
> >     reading code in ps8640. I don't feel too terrible breaking DTs that
> >     contained the wrong "compatible" string to begin with. NOTE that
> >     any old device trees that _didn't_ lie about their compatible will
> >     still work because the mode information will come from the
> >     hardcoded panels in panel-edp.
> > 2. The only users of the old code were Chromebooks and Chromebooks
> >     don't bake their DTs into the BIOS (they are bundled with the
> >     kernel). Thus we don't need to worry about breaking someone using
> >     an old DT with a new kernel.
> > 3. The old code was crashing anyway. If someone wants to fix the old
> >     code instead of deleting it then they have my blessing, but without
> >     a proper fix the old code isn't useful.
> >
> > I'll list this as "Fixing" the code that made the old code start
> > failing. There's not lots of reason to bring this back any further
> > than that.
>
> Hoping to see removal of non-aux EDID reading code from all drivers that =
can
> support aux-bus is exactly why I moved Elm to the proper... aux-bus.. so.=
..
>
> Yes! Let's go!
>
> >
> > Fixes: 102e80d1fa2c ("drm/bridge: ps8640: Use atomic variants of drm_br=
idge_funcs")
>
> ...but this Fixes tag will cause this commit to be backported to kernel v=
ersions
> before my commit moving Elm to aux-bus, and break display on those.
>
> I would suggest to either find a different Fixes tag, or don't add any, s=
ince
> technically this is a deprecation commit. We could imply that the old tec=
hnique
> is deprecated since kernel version X.Y and get away with it.
>
> Otherwise, if you want it backported *anyway*, the safest way would be to=
 Cc it
> to stable and explicitly say which versions should it be backported to.

The problem is that, as I understand it, as of commit 102e80d1fa2c
("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs"),
things are broken anyway and you'll get a crash at bootup. However, if
you start at that commit and apply ${SUBJECT} patch, things actually
end up being less broken. It won't crash anymore and on any boards
that actually have the display that's specified in the DT compatible
the screen should actually work. Thus even without your patch to move
things over to the aux-bus it's still an improvement to take
${SUBJECT} patch on any kernels that have that commit.

I don't have an 'elm' device easily accessible, but I can figure out
how to get one if needed to confirm that's true. However, maybe it's
easy for you or Pin-Yen to confirm.

If my understanding is incorrect, I have no objection to removing the
Fixes tag. I'd probably have to update the commit message a bunch too
because that was part of my justification for landing the patch in the
first place.
