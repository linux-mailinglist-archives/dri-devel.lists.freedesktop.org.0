Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B3689D138
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 05:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ED8112674;
	Tue,  9 Apr 2024 03:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PmwTCyD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DEF1127FD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 03:39:46 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-516d487659bso5081678e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 20:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712633984; x=1713238784;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKPZzs2J4lIrxwzL7Z1BludJY/XdSD/M6/ANxlIo6/0=;
 b=PmwTCyD8reuLLVCCOGpGGpeWoOWa0vOlVuP+jqJ5qaf8f9yyXE9UDB4vhOEeqxoU23
 XeTJ8DP4Cw5N6qfqJ0IqXjD6pAb58lZk2ss1v//k5ypH+hxeljaoDGkxj7DNLCQAJqWR
 lkNSOMaAy6xotJmzHJ8lAB+6G9U3O9DeX8zh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712633984; x=1713238784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKPZzs2J4lIrxwzL7Z1BludJY/XdSD/M6/ANxlIo6/0=;
 b=SuHRLU0k43QS0t0BGnUJLBNfJ+KoEOMmifmkbgGRskI4eK/8yGwDGP447NmHjNLj2c
 vy1u6GmX5LYZug4LJsSYU+x9+Hl5PIunzEeVNVPcQLEBwryjp+BfNUWQMjvdf3adobG9
 PhE9nHP47w6f1m5EhiSPzl88WA+YvSWIQ/iDYJZb7WaT1uWMB4isODhhCxIhp/xqFi8b
 T2e+xgsFiMk6wuHMkaBHoDB9rfbbjOMqN8SsoaXTFPcXk+/BBuYgu5lKJfevjMXbL9ez
 2Ivpo9rpBgm+E7CJZJOPyAmwEFm5a47MFVkcoradlFiuIsAqOusV92z1Pi37RbqCAhDr
 i0tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWw+8Lfkb4wf92Qvq8Ic2MYLTvqtJRZh44eXI4oOhwe3UY+J94f2HZWVJMq4T224h64CcircfkKF9qBXvwbnE8wpjo3oREdNGJMotrFpa2
X-Gm-Message-State: AOJu0YyKcJE5FJ651M3bdJSZxzRQsi8jc8BUYUxKadKrcVjI6FKroJnF
 7KEtysTn3+Y6JS7rLYewFcDRY+t7Dvw/GJbIrZ0Yv6gCZ4aYl7vtpux9SkZmIRpBT4saekWrBSG
 H+lwK+JQ19McPyNOxwmGVD5Fsq0LRJUw+M8o/
X-Google-Smtp-Source: AGHT+IFba+BrwCMiOouL0a7dqzF+zOfyVTmCHkiqgDT24USb8iVyp548tZZRYidWDUI6/w60evjxT4xx96AaXSCW7qY=
X-Received: by 2002:ac2:43b6:0:b0:516:c099:e785 with SMTP id
 t22-20020ac243b6000000b00516c099e785mr6549819lfl.20.1712633983546; Mon, 08
 Apr 2024 20:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240404081635.91412-1-angelogioacchino.delregno@collabora.com>
 <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5F9rfTVDExKSCF7fBKwR+HijNzFYE6+4aHKw3ZP81DG9w@mail.gmail.com>
 <5e385c2e-6509-4347-96a5-4606b32d20ff@collabora.com>
In-Reply-To: <5e385c2e-6509-4347-96a5-4606b32d20ff@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 9 Apr 2024 11:39:32 +0800
Message-ID: <CAGXv+5HkKZr0tDPhS9qVs=Uw7YYpfFYaC2Qf4Suv7RznUNWVsQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
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

On Mon, Apr 8, 2024 at 6:16=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 08/04/24 05:20, Chen-Yu Tsai ha scritto:
> > On Thu, Apr 4, 2024 at 4:16=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
> >> per HW instance (so potentially up to six displays for multi-vdo SoCs)=
.
> >>
> >> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
> >> so it only supports an output port with multiple endpoints - where eac=
h
> >> endpoint defines the starting point for one of the (currently three)
> >> possible hardware paths.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++=
++
> >>   1 file changed, 23 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,m=
msys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.y=
aml
> >> index b3c6888c1457..90758bb5bcb1 100644
> >> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya=
ml
> >> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya=
ml
> >> @@ -93,6 +93,29 @@ properties:
> >>     '#reset-cells':
> >>       const: 1
> >>
> >> +  port:
> >> +    $ref: /schemas/graph.yaml#/properties/port
> >> +    description:
> >> +      Output port node. This port connects the MMSYS/VDOSYS output to
> >> +      the first component of one display pipeline, for example one of
> >> +      the available OVL or RDMA blocks.
> >> +      Some MediaTek SoCs support up to three display outputs per MMSY=
S.
> >> +    properties:
> >> +      endpoint@0:
> >> +        $ref: /schemas/graph.yaml#/properties/endpoint
> >> +        description: Output to the primary display pipeline
> >> +
> >> +      endpoint@1:
> >> +        $ref: /schemas/graph.yaml#/properties/endpoint
> >> +        description: Output to the secondary display pipeline
> >> +
> >> +      endpoint@2:
> >> +        $ref: /schemas/graph.yaml#/properties/endpoint
> >> +        description: Output to the tertiary display pipeline
> >> +
> >> +      required:
> >> +        - endpoint@0
> >> +
> >
> > Technically the mmsys device serves as an glue layer for the display
> > pipeline, providing things like clock control and signal routing; the
> > device itself is not part of the pipeline, and probably shouldn't be
> > part of the graph?
> >
>
> That is (only) partially true: in the case of older SoCs, the MMSYS can o=
nly
> connect to a single first IP of the pipeline, but in the case of newer on=
es,
> and especially (but not limited to) MT8195 onwards having multiple instan=
ces
> of VDOSYS, that really becomes part of the pipeline.
>
> This is not because of the possible different first IP in the pipeline, b=
ut
> because of support for dual-interface (DSI and DP) that, in even newer So=
Cs,
> can be done with cross-mmsys (cross-vdosys, actually...) as some of those=
 do
> have the two in different VDOs.
>
> So yes, this can be done without the graph in MMSYS *in this precise mome=
nt in
> time*, but we'll anyway end up adding it sooner than later - and I'm doin=
g this
> right now, instead of later, because it's also simplifying the implementa=
tion
> so like that I'm "catching two birds with one stone" :-)

I see. Thanks for sorting it out. We had something similar on Allwinner
platforms but it was never as complex or flexible as this.

ChenYu

> Cheers,
> Angelo
>
> > ChenYu
> >
> >>   required:
> >>     - compatible
> >>     - reg
> >> --
> >> 2.44.0
> >>
>
>
