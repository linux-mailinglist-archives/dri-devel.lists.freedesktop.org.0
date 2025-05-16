Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE78AB9A9B
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 12:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A5410EA4F;
	Fri, 16 May 2025 10:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="ZFlUC2+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BDB10EA4F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 10:56:18 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e7b7dd0ec01so193520276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 03:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747392975;
 x=1747997775; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wvq8SJtHkSgAHowZhDbqFL61WnW2AkvgYvOEybV9RGs=;
 b=ZFlUC2+efVr7+kgDXxtT0v3eSn8UR9m/hoaPbPpHP/HbxK6z0u0APFDORQ/PNC3wRb
 9rs0Uj0oBt6F41jpN35ROx1NnS0lIDeK9BBYiPGUQJyYugHpTnJuUv+TkFWa4q7wA98z
 iC1o0+LBw1JE9zej3IqAAVO3atTvzubqdKdbPKeN7SoqZWqC05JJbfCeEKsVhnqe8JZ8
 7d2EU4SJaR/P2htVYhJzoAiizsXm8P+ioC4EAsaFY9DnDifnLwNs6B061WutDn0oTJ5R
 9yLpRHJ5nYzhOaS7UNmcBa8R4rZ68tiynQlBsshkXojejZZ5iH4U2b7D+Y2GnOpLqxR5
 Pukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747392975; x=1747997775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wvq8SJtHkSgAHowZhDbqFL61WnW2AkvgYvOEybV9RGs=;
 b=OawSjK8J8nFT7UeTTPqioJDWS21ha/9FDcugdTdAEroJKvBT3I6IMdCkjwBrIXEjI5
 iTKlV41+REGgQQRdXXkmF00oekB0wuluymSWrenFijyczBoBEzt1p+ST/Af9R4uohznK
 FSsrQDkwswnZNRCfMaiqrr4e1GamBcfUpvF0H7F1x4NmeUIZME38/fCAXDC4AgXLOeN7
 a3M5fiL/O1CG7xIzFG6L72bcXZzSw3nwPJf48w4X1GT4L98Y2TsaG/rkfKp5mgWf3uJa
 f/UgjnLg+sJxcsvEuRvjG/1HCnsTyYLftzFJmSQ9Ixhlu9uDtRvn3P+KfpHsMskaNA2B
 9DHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvX3owZhYTWIqDJ/iHm3+22QFvOJVwtBfLyXRX9Eh5Nj9ZDoFD/NQHVgd6Lmjq+GnwuR6jzaqyzsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvAfuGp5dcYtSOo1mrKkFa/F5fXRbRAwOnyevW/QMwcmFtvZlq
 mXxKTR0aDV2QVpBJzMvGVkcO3Ksimr4PE9cGk8mL2CqvR4KSHLR12sRSNqw+Aa2qlppzXUonisg
 raY5L0NfENQ==
X-Gm-Gg: ASbGnctskV0f0N6YY0avSuMyiKW28UiPPOqbrhQCEzSBZ8yN+qtTut+SpVb0ZcVDiYq
 4W0S24sfaLvKH2zj3SKXs2gssJw7a8XYpJg0R6IWm/zTaA3OWGi8S33MrxA/6pX/Q1FoCbA3ZrA
 HYVVnN9vsWV1Ho3GwuJUXYW/Xzscpz1E54FUlgJWGBFba1tK2L4f4h6m1HePm5DjLzDQuKUFn6X
 Yc68u/KDs/XIjzMIs19KY77cdQv0n54xABkansAeEkTYxval+ktJZy9mDE/Czg/lTn4w1SFdloW
 5m+l2aewOBvvgNagokM/4tGUNXUtO+iaAbjXSd7x2toxWAn8Dji8A3zwb8PKu0j7quEjv1gNJSO
 Z53m05jVkm5CEug8zlJY=
X-Google-Smtp-Source: AGHT+IEau2qSay59UqZhxyUCd8OeYMcRhxSndoBUwKZqFpYrhjSkSgcxzQ8W34767IQs+s4Gh29zfw==
X-Received: by 2002:a05:6902:a81:b0:e75:c6bb:3414 with SMTP id
 3f1490d57ef6-e7b69e94a87mr3261392276.18.1747392974678; 
 Fri, 16 May 2025 03:56:14 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e7b6ac6a63dsm454802276.11.2025.05.16.03.56.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 03:56:13 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e7b5f81594fso1354857276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 03:56:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXHnjLPmFKEUU+thylT8z6Kg2XtgUboKLvys4L2DdtZiashRazurbyqpJusLO8LtZ4e+s1jhK5i8PE=@lists.freedesktop.org
X-Received: by 2002:a05:6902:1890:b0:e6d:e962:f317 with SMTP id
 3f1490d57ef6-e7b69d5b0d2mr3967716276.10.1747392973185; Fri, 16 May 2025
 03:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <3628015.iIbC2pHGDl@workhorse>
 <CAAObsKDYpDt15NePk7DZbfwXnn5uaJxCu-pwZd-+PDEi56C73A@mail.gmail.com>
 <6549034.lOV4Wx5bFT@workhorse>
In-Reply-To: <6549034.lOV4Wx5bFT@workhorse>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 12:56:02 +0200
X-Gmail-Original-Message-ID: <CAAObsKC_h2iQWsjeTQm71Q2Vp4yTne+xP5_zc+X2u-_sP8_CDg@mail.gmail.com>
X-Gm-Features: AX0GCFvfyIhbJSWWie1awNYiOYU4KhI_m0n6kxRk7hmgZ7cUnrZxeaiTgoKbzoU
Message-ID: <CAAObsKC_h2iQWsjeTQm71Q2Vp4yTne+xP5_zc+X2u-_sP8_CDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

On Fri, May 16, 2025 at 12:25=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Thursday, 15 May 2025 10:30:14 Central European Summer Time Tomeu Vizo=
so wrote:
> > On Wed, May 14, 2025 at 7:50=E2=80=AFPM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > On Wednesday, 14 May 2025 17:18:22 Central European Summer Time Tomeu=
 Vizoso wrote:
> > > > Hi Nicolas,
> > > >
> > > > Thanks for looking at this. Some thoughts below:
> > > >
> > > > On Fri, Apr 25, 2025 at 8:50=E2=80=AFPM Nicolas Frattaroli
> > > > <nicolas.frattaroli@collabora.com> wrote:
> > > > >
> > > > > On Tuesday, 25 February 2025 08:55:47 Central European Summer Tim=
e Tomeu Vizoso wrote:
> > > > > > Add the bindings for the Neural Processing Unit IP from Rockchi=
p.
> > > > > >
> > > > > > v2:
> > > > > > - Adapt to new node structure (one node per core, each with its=
 own
> > > > > >   IOMMU)
> > > > > > - Several misc. fixes from Sebastian Reichel
> > > > > >
> > > > > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > > > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.c=
om>
> > > > > > ---
> > > > > >  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++=
++++++++++++++++
> > > > > >  1 file changed, 152 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rkn=
n-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > > > > > new file mode 100644
> > > > > > index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f=
166cf13a9f4aa7c1901362a3f
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.=
yaml
> > > > > > @@ -0,0 +1,152 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml=
#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Neural Processing Unit IP from Rockchip
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > > > > +
> > > > > > +description:
> > > > > > +  Rockchip IP for accelerating inference of neural networks, b=
ased on NVIDIA's
> > > > > > +  open source NVDLA IP.
> > > > > > +
> > > > > > +properties:
> > > > > > +  $nodename:
> > > > > > +    pattern: '^npu-core@[a-f0-9]+$'
> > > > > > +
> > > > > > +  compatible:
> > > > > > +    oneOf:
> > > > > > +      - items:
> > > > > > +          - enum:
> > > > > > +              - rockchip,rk3588-rknn-core-top
> > > > > > +          - const: rockchip,rknn-core-top
> > > > > > +      - items:
> > > > > > +          - enum:
> > > > > > +              - rockchip,rk3588-rknn-core
> > > > > > +          - const: rockchip,rknn-core
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > >
> > > > > Hi Tomeu,
> > > > >
> > > > > as you probably know, RK3576 has quite a similar NPU. This is why=
 I'm currently
> > > > > poking at this patch series. One of the differences I ran into wa=
s that the
> > > > > IOMMU of each NPU core now sits within the reg address space rang=
e of the core
> > > > > as described by the single reg item binding and assumed by the dr=
iver.
> > > >
> > > > But this is not a difference, right?
> > >
> > > It is. E.g. on RK3588, you use reg =3D <0x0 0xfdab0000 0x0 0x9000>; f=
or
> > > rknn_core_top, and rknn_mmu_top then sits at 0xfdab9000, which is jus=
t
> > > outside the reg range of the rknn_core_top node. That means acquiring=
 the
> > > iomem as a resource succeeds for you, whereas for me it fails.
> >
> > Ah, got it now, thanks.
> >
> > > >
> > > > > This seemed weird to me at first, since I would've guessed the co=
res would be
> > > > > exactly the same, but I noticed that they kind of still are; the =
RK3588's NPU
> > > > > also has a "hole" between 0x2000 and 0x2fff on each core, which i=
s where RK3576
> > > > > put its IOMMU.
> > > >
> > > > So this is the same in both RK3576 and RK3588, right?
> > >
> > > Yes, both RK3576 and RK3588 have a hole in the same area. RK3562 also=
 has
> > > the same hole. RK3568 doesn't have the offsets for the individual par=
ts of
> > > the NPU in the TRM, making all the relative register offsets the TRM =
then
> > > goes on to document completely pointless as it omits what those offse=
ts
> > > are based on, so we don't know if it has a hole there. I vaguely reca=
ll
> > > that it has the IOMMU either before or past the global range (not sur=
e if
> > > I wrote these findings down anywhere?), so if it has a hole at 0x2000
> > > then it's unused like on the RK3588. I don't have access to the RV110=
6
> > > Part 2 TRM where the NPU is described, so I don't know whether that h=
as a
> > > hole there unless we dig into the downstream code.
> > >
> > > >
> > > > > This is some information I gleaned from the RK3588 TRM, specifica=
lly section
> > > > > 36.4.1 "Internal Address Mapping", which shows where each "part" =
of the NPU core
> > > > > has its address space.
> > > > >
> > > > > Right now we just represent this as a single reg item per core. I=
've played
> > > > > with the idea of splitting this up into the distinct ranges the T=
RM lists and
> > > > > giving each a reg-names entry, but this would require a major rew=
ork of the
> > > > > driver from what I can tell, including to the auto-generated regi=
ster header.
> > > > >
> > > > > For now, my hack on RK3576 is to just ioremap the range defined b=
y resource
> > > > > start to resource end inside rocket manually if I get -EBUSY tryi=
ng to ioremap
> > > > > the resource proper. This is quite an ugly hack though, it means =
the IOMMU node
> > > > > still has its address overlapping with another node in the DT, an=
d it also means
> > > > > we have an unavoidable error message printed into the kernel log.=
 This is also
> > > > > what the vendor driver seems to do.
> > > > >
> > > > > What do you reckon is a reg setup in the binding that is both rea=
sonable to
> > > > > implement in the driver while accurately describing the hardware?
> > > >
> > > > Guess we could go with some smaller granularity and have 3 register
> > > > areas per core, instead of 10:
> > > >
> > > > - CORE: PC+CNA (0x0000 ~ 0x1fff)
> > > > - AUX: CORE+DPU+PPU+DDMA+SDMA (0x3000 ~ 0x9fff)
> > > > - GLOBAL (0xf000 ~ 0xf004)
> > > >
> > > > So the IOMMU on all the known SoCs can have its own regmap. I have
> > > > chosen to call the first one CORE because these are the components
> > > > that are absolutely needed in any NPU that is oriented towards
> > > > convolutional networks (convolutions, basically). I have named the
> > > > second AUX because it contains hardware units that are optional and
> > > > are used to implement operations that may be common but that aren't=
 as
> > > > computational expensive as convolutions and thus might be skipped i=
n
> > > > lower-end versions of the IP.
> > > >
> > > > What do you think?
> > >
> > > I'm personally fine with this approach. I've floated a two-area appro=
ach
> > > to Sebastian Reichel before who, as far as I can recall, expressed hi=
s
> > > distaste for  it as it seemed like an arbitrary division. I do concur=
 in
> > > that, it seems very arbitrary, so it's hard to say whether the bindin=
gs
> > > maintainers would let us get away with it if they get wind of it.
> > > Unfortunately they are Cc'd on this E-Mail, so the cat is out of the =
bag
> > > in this regard.
> >
> > Actually, after thinking a bit more about it I'm leaning towards only
> > having the PC, CNA and CORE areas in the DT, as those are the only
> > ones that should be accessible from the CPU.
>
> That does make sense to me. I've just checked the RK3576 specific reg
> fiddling code I hacked in and it doesn't appear to be writing to any
> other areas either.

Cool.

> >
> > The registers for the other units should be set by the PC, as it reads
> > the command stream.
> >
> > So three register areas that can be set to wherever Rockchip has
> > placed them, and we just ignore the others in the kernel, as we don't
> > have any business messing with them ourselves.
> >
> > What do you think?
>
> This seems like a good solution. Any further reg ranges that are used in
> other variants (e.g. RK3562/RK3576 and maybe RV1106) introduce something
> called "CBUF" and I'm not yet sure if that'll need any writes to its regs
> from the driver, but if it does then it's easy to add another range for i=
t
> in the binding for just those compatibles.

Do you have any further info on those CBUF regs? In the NVDLA
documentation, CBUF is the block that handles the Convolution Buffer,
but on the RK3588 it is part of the CNA block.

In any case, I don't think the kernel will have to do anything about it.

Cheers,

Tomeu

> >
> > Thanks,
> >
> > Tomeu
>
> Kind regards,
> Nicolas Frattaroli
>
> >
> > > What speaks for the 3 register area split is that anything that bring=
s
> > > more holes and doubly mapped things into the AUX area is probably goi=
ng
> > > to be so radically different it'll ideally have its own binding anywa=
y,
> > > or needs more than just a compatible added to the binding.
> > >
> > > I think as far as arbitrary splits goes, the one you propose is proba=
bly
> > > the one most closely aligned with reality. Certain register areas do
> > > seem like something they'd never move away from its corresponding
> > > companion, whereas adding parts to the AUX area or removing from it i=
s
> > > probably going to be quite common. So it can essentially be treated a=
s
> > > the area where optional things will most likely land as you pointed o=
ut,
> > > which then don't need more bindings fiddling to add those optional th=
ings
> > > as explicitly named areas in the bindings as long as we treat it as j=
ust
> > > one opaque area s far as the binding is concerned.
> > >
> > > Also, unless there's some virtual combined sparse iomem API in the ke=
rnel
> > > that I'm not aware of, that's probably the easiest path forward for t=
he
> > > driver as well.
> > >
> > > >
> > > > Regards,
> > > >
> > > > Tomeu
> > >
> > > Kind regards,
> > > Nicolas Frattaroli
> > >
> > > >
> > > > > The RK3568, which uses a similar NPU design has the IOMMU at an o=
ffset of 0xb000
> > > > > from the core's start of PC, so probably after any core specifics=
 but before the
> > > > > global registers if I hazard a guess.
> > > > >
> > > > > For those without access to the TRM: splitting this up into multi=
ple reg items
> > > > > per core precisely the way the TRM does it would result in no les=
s than 10 reg
> > > > > items on RK3588, if I count correctly.
> > > > >
> > > > > Kind regards,
> > > > > Nicolas Frattaroli
> > > > >
> > > > >
> > > >
> > >
> > >
> > >
> > >
> >
>
>
>
>
