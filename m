Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03985AB6F79
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9E310E661;
	Wed, 14 May 2025 15:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="R09PI0Fm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB48110E669
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 15:18:38 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-7081165a238so55255577b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747235917;
 x=1747840717; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDddi59QfQosyfazvmWzWcoS6I1hEYTqzvGT0OXdo3s=;
 b=R09PI0FmUU6pQcql4BXiFOaW0Wti7HroiD+NFrm2fSUligE+u9PHQrIfiTpUkD482u
 BcylyH6e7TYgGWuXJn9zVO9IoxO+l6RFzhqDHZe3OtxNj0bj/m9EoVUuMSGw/+XRHc3a
 PdaAO813HL3Irh52/3QbuvePZX0vHU6ISkpdYJqT8vRFQ9pN6LVK9E1lFelsX5H0Shi0
 i7pwPv2Pn5IFKsXKTCpYJE16/7pOdkrZO+h1dVHrVWm22ceT7WtmGxLMrK1KldpaJuRT
 zeXM8w+bXcAtiqyDDaVoq0bS2BsGGImRJYIRJTb3SVsQQfOKJBO4F7lWuIVgjpfgH1GI
 Ltug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747235917; x=1747840717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDddi59QfQosyfazvmWzWcoS6I1hEYTqzvGT0OXdo3s=;
 b=mjul9iGc6uAhfSNb1k2rnKRkLS2/YtZCvRv5HCauN3752+kWT56Gob257TKCYb4ilw
 RFDcDIbbihDNN97pAFpYQ7EsusaA5mQkn5NBNnKoI4CajFDmKUHfO3v/gwh78MULmVG7
 vOzuV97axQ5NKi5hPriKeOL2VwQ8zFu4JC3451PUsdfQIS9EBcR3EclLPuQA9hzuIDAH
 VJAll+Lj8yGPSFAr9AMsATuOSfLINpwv9pAw8pb3QH0j1gKQnIUzhXlH1BB0h76GD892
 qvi6C6oXiwsOMmwl+35IVGA0+Z4tEqYvaXEs+OyQe0bt2DyAnU4CQtzgKOcmJNRYxzh3
 oHtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsFIWZHJ+vlXHRdTamVMFJxvG3KRMzbxBSqrTRHr98x/IzD7gcwAWeXmuNuxIYCYaaI/XM8MuOEgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwicAiIQCUtE6nWP4T6213eaMMd3JuXTeIkIYuiYIQx0g82d0F2
 rq1vzdjFNp37ArHzrJnPS5FixXjeB2b4/f+0VyyT1p0jd/HDZifeB7TuD/lLVq4AhyDyQoC4A6F
 3ACzniA==
X-Gm-Gg: ASbGncs01k7eyxm99ZYB1kgy5dw0zKi+S26hrAYPZHp6XQ+U+sB4VuVJp/l3z5IlC7L
 41r8qUml5T/3Z8HLUeYSdDVe1uTTvyPW/gRW2GsPW4n1fzmmZFNS20pHXj1l/vMR+6MFadKk10n
 YaNgzQsdUPxHu3Dko8QMJcyex9oBoxBiXMyp5CErZti7jwvKjUi6hbyRoQfc3rjSFx8Zjr7gtMV
 i8NEmbGquwT7EG3UHECoYhFDn66F4VJkVGsrqzY2MpDxvAne+4Hp5XpIyhzKFbsqUhl+iIRH5/x
 dvvRhN0X2j5w+rwjHk5/FGrJo2/f5XnOvymg3XswAa0u6eOtngfB4QpH5ue6FM9AqeruI6mqSnF
 xS5dTDzqetU1e05nSD4g=
X-Google-Smtp-Source: AGHT+IFjykihT06nBfMBdI+TowJ9MeVj/38a/vOW+Tk2PlVewkI2gmz3Ni94jm2l0IMb/t0Kb+5+Dg==
X-Received: by 2002:a05:690c:28b:b0:709:47d0:3ee0 with SMTP id
 00721157ae682-70c7f12ab67mr60463987b3.11.1747235917191; 
 Wed, 14 May 2025 08:18:37 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-70a3d8d9426sm29759367b3.52.2025.05.14.08.18.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 08:18:36 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e740a09eb00so6479943276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 08:18:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVyE5HBmjbPQOpZgPJ4vo3bmPwaZXNB+55BTZ4mSjORbWtey8S0VGyNPoS+xOR0MBvj0a7D/mLGSJk=@lists.freedesktop.org
X-Received: by 2002:a05:6902:1ac6:b0:e75:b4df:869 with SMTP id
 3f1490d57ef6-e7b3d70dc1dmr4699203276.48.1747235915800; Wed, 14 May 2025
 08:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net>
 <14333638.uLZWGnKmhe@workhorse>
In-Reply-To: <14333638.uLZWGnKmhe@workhorse>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 May 2025 17:18:22 +0200
X-Gmail-Original-Message-ID: <CAAObsKAkMhgQsi6hLjbfS5wDaUz-hPQiZn7dVvn+6kDv0_jo9Q@mail.gmail.com>
X-Gm-Features: AX0GCFuozUHqFw-Ua1grRU5Zmez8kXjNLPgWkTD1GO7aODfE11uHKf0wUS78uCM
Message-ID: <CAAObsKAkMhgQsi6hLjbfS5wDaUz-hPQiZn7dVvn+6kDv0_jo9Q@mail.gmail.com>
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

Hi Nicolas,

Thanks for looking at this. Some thoughts below:

On Fri, Apr 25, 2025 at 8:50=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 25 February 2025 08:55:47 Central European Summer Time Tomeu =
Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++++=
++++++++
> >  1 file changed, 152 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.y=
aml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf13a=
9f4aa7c1901362a3f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > @@ -0,0 +1,152 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks, based on =
NVIDIA's
> > +  open source NVDLA IP.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu-core@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core-top
> > +          - const: rockchip,rknn-core-top
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core
> > +          - const: rockchip,rknn-core
> > +
> > +  reg:
> > +    maxItems: 1
>
> Hi Tomeu,
>
> as you probably know, RK3576 has quite a similar NPU. This is why I'm cur=
rently
> poking at this patch series. One of the differences I ran into was that t=
he
> IOMMU of each NPU core now sits within the reg address space range of the=
 core
> as described by the single reg item binding and assumed by the driver.

But this is not a difference, right?

> This seemed weird to me at first, since I would've guessed the cores woul=
d be
> exactly the same, but I noticed that they kind of still are; the RK3588's=
 NPU
> also has a "hole" between 0x2000 and 0x2fff on each core, which is where =
RK3576
> put its IOMMU.

So this is the same in both RK3576 and RK3588, right?

> This is some information I gleaned from the RK3588 TRM, specifically sect=
ion
> 36.4.1 "Internal Address Mapping", which shows where each "part" of the N=
PU core
> has its address space.
>
> Right now we just represent this as a single reg item per core. I've play=
ed
> with the idea of splitting this up into the distinct ranges the TRM lists=
 and
> giving each a reg-names entry, but this would require a major rework of t=
he
> driver from what I can tell, including to the auto-generated register hea=
der.
>
> For now, my hack on RK3576 is to just ioremap the range defined by resour=
ce
> start to resource end inside rocket manually if I get -EBUSY trying to io=
remap
> the resource proper. This is quite an ugly hack though, it means the IOMM=
U node
> still has its address overlapping with another node in the DT, and it als=
o means
> we have an unavoidable error message printed into the kernel log. This is=
 also
> what the vendor driver seems to do.
>
> What do you reckon is a reg setup in the binding that is both reasonable =
to
> implement in the driver while accurately describing the hardware?

Guess we could go with some smaller granularity and have 3 register
areas per core, instead of 10:

- CORE: PC+CNA (0x0000 ~ 0x1fff)
- AUX: CORE+DPU+PPU+DDMA+SDMA (0x3000 ~ 0x9fff)
- GLOBAL (0xf000 ~ 0xf004)

So the IOMMU on all the known SoCs can have its own regmap. I have
chosen to call the first one CORE because these are the components
that are absolutely needed in any NPU that is oriented towards
convolutional networks (convolutions, basically). I have named the
second AUX because it contains hardware units that are optional and
are used to implement operations that may be common but that aren't as
computational expensive as convolutions and thus might be skipped in
lower-end versions of the IP.

What do you think?

Regards,

Tomeu

> The RK3568, which uses a similar NPU design has the IOMMU at an offset of=
 0xb000
> from the core's start of PC, so probably after any core specifics but bef=
ore the
> global registers if I hazard a guess.
>
> For those without access to the TRM: splitting this up into multiple reg =
items
> per core precisely the way the TRM does it would result in no less than 1=
0 reg
> items on RK3588, if I count correctly.
>
> Kind regards,
> Nicolas Frattaroli
>
>
