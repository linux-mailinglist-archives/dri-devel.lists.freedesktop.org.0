Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 531B5731B64
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 16:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A4110E504;
	Thu, 15 Jun 2023 14:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B3410E504
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 14:30:49 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-519b771f23aso2271430a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686839445; x=1689431445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=04jEXUdrrSwU5Xd9HQj3J49NirU0pS8GLPvuDSKUyoA=;
 b=WgvTjje3R41NjGq8lMq9y+GYruempIy+uPf3hPbxeqPXGpmjOrp1Qabp8zxmGOY473
 FZ/RJM1EArfflQny+YHlJw37HbKjt9HJ6PAejxPGSn5sM3z4gbjSI1sGqzbrp0d1cZWM
 wAvWR2gEgSK1Bfw2whsycosuap/cZj8rGv1pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686839445; x=1689431445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=04jEXUdrrSwU5Xd9HQj3J49NirU0pS8GLPvuDSKUyoA=;
 b=X/F5eEMTwaT/S3AvLimPyvHfEmkNbjbq8qd0U/Ssumaw1JBTOP2VFnxN8B2OsT94sA
 zjewOsQplZCZUyo2V5JqFe2omfJVeb/gXcQn1UlymRtn1tS3o5wX2yqzR02lSBinHnVE
 ZpdZXyYRr2m6cY400KBlMtKyVcj9yGRsxyR4mmm1aieUATnVkbHcyddipXbP+aCaAiTo
 bUmvnFvXDBlRSwjsGhov5RrxFVh++k2j5EOcq1fpmXIOKSaVsr2zZM4q4ZQVwdpFI9tk
 ZJJVUXRPVm+lv38t1Fv+kxVjmcYnfQOr0o8k9xlYcONEK0B+MyNRM8IbEVn3pZNIRQGa
 /Djg==
X-Gm-Message-State: AC+VfDzFwiK/mAXirytJOckJOGqXS2N687q0O5JMpDl0fy7K5k7Arg2g
 s6rucFopWEI6rq6Y3Szr6g8d6iEG4NzvIbDMx99DzQiu
X-Google-Smtp-Source: ACHHUZ6rSCXe0ntgyOU0XLzgkowvyWE5xlxzAV1g32OwTsRDZP66yY27Ys6idBu17bo676zbkFDQ5w==
X-Received: by 2002:aa7:c557:0:b0:516:9f9a:a3a with SMTP id
 s23-20020aa7c557000000b005169f9a0a3amr12553315edr.1.1686839444776; 
 Thu, 15 Jun 2023 07:30:44 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 x6-20020aa7d386000000b00514bb73b8casm8857618edq.57.2023.06.15.07.30.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 07:30:42 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-3f81b83b8d5so98835e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 07:30:42 -0700 (PDT)
X-Received: by 2002:a05:600c:5196:b0:3f7:3654:8d3 with SMTP id
 fa22-20020a05600c519600b003f7365408d3mr168273wmb.2.1686839442384; Thu, 15 Jun
 2023 07:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230612163256.1.I7b8f60b3fbfda068f9bf452d584dc934494bfbfa@changeid>
 <86ad3ffb-fbe2-9bed-751d-684994b71e9d@collabora.com>
 <CAD=FV=XGN7NEFjtAAr+y_Vfth0MKL875B1+mqzmy3yAfteNxuQ@mail.gmail.com>
 <CAEXTbpcaG1h-AD3SEkznefimMGmvEUtTwQBV9MQ9c+Q-Q+z6GA@mail.gmail.com>
In-Reply-To: <CAEXTbpcaG1h-AD3SEkznefimMGmvEUtTwQBV9MQ9c+Q-Q+z6GA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Jun 2023 07:30:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vz4d6WZanHRY_6CdOSCVqxiWxs3mDwi_Vw27aDpdzuZg@mail.gmail.com>
Message-ID: <CAD=FV=Vz4d6WZanHRY_6CdOSCVqxiWxs3mDwi_Vw27aDpdzuZg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Drop the ability of ps8640 to fetch
 the EDID
To: Pin-yen Lin <treapking@chromium.org>
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
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 15, 2023 at 1:47=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Hi Doug,
>
> On Thu, Jun 15, 2023 at 5:31=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Wed, Jun 14, 2023 at 1:22=E2=80=AFAM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > >
> > > Il 13/06/23 01:32, Douglas Anderson ha scritto:
> > > > In order to read the EDID from an eDP panel, you not only need to
> > > > power on the bridge chip itself but also the panel. In the ps8640
> > > > driver, this was made to work by having the bridge chip manually po=
wer
> > > > the panel on by calling pre_enable() on everything connectorward on
> > > > the bridge chain. This worked OK, but...
> > > >
> > > > ...when trying to do the same thing on ti-sn65dsi86, feedback was t=
hat
> > > > this wasn't a great idea. As a result, we designed the "DP AUX"
> > > > bus. With the design we ended up with the panel driver itself was i=
n
> > > > charge of reading the EDID. The panel driver could power itself on =
and
> > > > the bridge chip was able to power itself on because it implemented =
the
> > > > DP AUX bus.
> > > >
> > > > Despite the fact that we came up with a new scheme, implemented in =
on
> > > > ti-sn65dsi86, and even implemented it on parade-ps8640, we still ke=
pt
> > > > the old code around. This was because the new scheme required a DT
> > > > change. Previously the panel was a simple "platform_device" and in =
DT
> > > > at the top level. With the new design the panel needs to be listed =
in
> > > > DT under the DP controller node. The old code allowed us to properl=
y
> > > > fetch EDIDs with ps8640 with the old DTs.
> > > >
> > > > Unfortunately, the old code stopped working as of commit 102e80d1fa=
2c
> > > > ("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs"). Th=
ere
> > > > are cases at bootup where connector->state->state is NULL and the
> > > > kernel crashed at:
> > > > * drm_atomic_bridge_chain_pre_enable
> > > > * drm_atomic_get_old_bridge_state
> > > > * drm_atomic_get_old_private_obj_state
> > > >
> > > > A bit of digging was done to see if there was an easy fix but there
> > > > was nothing obvious. Instead, the only device using ps8640 the "old=
"
> > > > way had its DT updated so that the panel was no longer a simple
> > > > "platform_deice". See commit c2d94f72140a ("arm64: dts: mediatek:
> > > > mt8173-elm: Move display to ps8640 auxiliary bus") and commit
> > > > 113b5cc06f44 ("arm64: dts: mediatek: mt8173-elm: remove panel model
> > > > number in DT").
> > > >
> > > > Let's delete the old, crashing code so nobody gets tempted to copy =
it
> > > > or figure out how it works (since it doesn't).
> > > >
> > > > NOTE: from a device tree "purist" point of view, we're supposed to
> > > > keep old device trees working and this patch is technically "agains=
t
> > > > policy". Reasons I'm still proposing it anyway:
> > > > 1. Officially, old mt8173-elm device trees worked via the "little
> > > >     white lie" approach. The DT would list an arbitrary/representat=
ive
> > > >     panel that would be used for power sequencing. The mode informa=
tion
> > > >     in the panel driver would then be ignored / overridden by the E=
DID
> > > >     reading code in ps8640. I don't feel too terrible breaking DTs =
that
> > > >     contained the wrong "compatible" string to begin with. NOTE tha=
t
> > > >     any old device trees that _didn't_ lie about their compatible w=
ill
> > > >     still work because the mode information will come from the
> > > >     hardcoded panels in panel-edp.
> > > > 2. The only users of the old code were Chromebooks and Chromebooks
> > > >     don't bake their DTs into the BIOS (they are bundled with the
> > > >     kernel). Thus we don't need to worry about breaking someone usi=
ng
> > > >     an old DT with a new kernel.
> > > > 3. The old code was crashing anyway. If someone wants to fix the ol=
d
> > > >     code instead of deleting it then they have my blessing, but wit=
hout
> > > >     a proper fix the old code isn't useful.
> > > >
> > > > I'll list this as "Fixing" the code that made the old code start
> > > > failing. There's not lots of reason to bring this back any further
> > > > than that.
> > >
> > > Hoping to see removal of non-aux EDID reading code from all drivers t=
hat can
> > > support aux-bus is exactly why I moved Elm to the proper... aux-bus..=
 so...
> > >
> > > Yes! Let's go!
> > >
> > > >
> > > > Fixes: 102e80d1fa2c ("drm/bridge: ps8640: Use atomic variants of dr=
m_bridge_funcs")
> > >
> > > ...but this Fixes tag will cause this commit to be backported to kern=
el versions
> > > before my commit moving Elm to aux-bus, and break display on those.
> > >
> > > I would suggest to either find a different Fixes tag, or don't add an=
y, since
> > > technically this is a deprecation commit. We could imply that the old=
 technique
> > > is deprecated since kernel version X.Y and get away with it.
> > >
> > > Otherwise, if you want it backported *anyway*, the safest way would b=
e to Cc it
> > > to stable and explicitly say which versions should it be backported t=
o.
> >
> > The problem is that, as I understand it, as of commit 102e80d1fa2c
> > ("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs"),
> > things are broken anyway and you'll get a crash at bootup. However, if
> > you start at that commit and apply ${SUBJECT} patch, things actually
> > end up being less broken. It won't crash anymore and on any boards
> > that actually have the display that's specified in the DT compatible
> > the screen should actually work. Thus even without your patch to move
> > things over to the aux-bus it's still an improvement to take
> > ${SUBJECT} patch on any kernels that have that commit.
> >
> > I don't have an 'elm' device easily accessible, but I can figure out
> > how to get one if needed to confirm that's true. However, maybe it's
> > easy for you or Pin-Yen to confirm.
>
> The crash was there, but then commit 4fb912e5e190 ("drm/bridge:
> Introduce pre_enable_prev_first to alter bridge init order") added a
> NULL check on the state object in
> drm_atomic_bridge_chain_pre_enable(), which prevents the kernel crash
> on the latest kernel. And now the panel on "elm" Chromebook is
> actually working without an "aux-bus" node seemingly because the
> userspace is patient enough to keep retrying until the connector gets
> its state initialized. My elm device crashes again after reverting
> commit 4fb912e5e190.

Oh, right! I forgot about that. Commit 4fb912e5e190 ("drm/bridge:
Introduce pre_enable_prev_first to alter bridge init order") as a side
effect caused the crash not to happen, but that also essentially made
the pre-enable a "no-op".

Hmmm, maybe I'll re-post this patch and add that extra note in and
remove the Fixes tag just to keep it from being controversial. I'll
plan to do that ~tomorrow unless there are objections.

-Doug
