Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64C9ACAA70
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 10:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6483210E0F5;
	Mon,  2 Jun 2025 08:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="nMcmSQvm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C3A10E4D7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 08:15:20 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-70f86c9e3e7so38645257b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1748852119;
 x=1749456919; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IX5KaHY06tu+FKC0bEyE1X52oSF5H+UGj7sz8V9wh8Q=;
 b=nMcmSQvmsTAlWsRkGvKad6qzzXoCKXcIJmbu8kKHs3hEqZkxEzdFLv+1g3gz50h6//
 CXG298x9ni2Oz3gpoPttJnOW9m0VbBpMi1JO1YQBFUepqFk7ePEeE/GkJsN+ZXOcxZFM
 /6jx02J+Bw5DCaDPyYPqdYQ4ne9lP7ozzRVtyw7HveUZSEw38Odd9w8ol9Hxn6uLFrtt
 hP06+Mv0nAH4iu7Dx0QEAAJazYtDHPJmq6Vg58UhbnFXME7pgfxUWpGHFifGellYBRFZ
 gk099sR3uoY2Szu8hqRRbNeYBEd7rPSyCRheoaINTLYckdws7q1ZYKdp+la14+Nurg/S
 9dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748852119; x=1749456919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IX5KaHY06tu+FKC0bEyE1X52oSF5H+UGj7sz8V9wh8Q=;
 b=PQSAHpPtSR9NlaX/H9wif9/HN3Fmzj7InHgATZYJ9RxI5HWbi7vIh5dcghZpRaiiZm
 CdKKfuhJgjl6syDmaHpePdpWPIwl8VaSye6HF/b2u38MG2hUZvv6zU6xYVeRJqrom46H
 iQaOAmC48vib1M650B3PqHDrUeNn0rD9Jtx6jnHsslaee8MVnXMLoS1N8HFxyCmeO0j9
 z7qjmotPHfX8HYeesRTuW4Y1zEvJlFjJuTPLUbrlvzUFUqjGKtyQEKXl5WfZtX6kuD5k
 ISOelh4QgtenwpPno+KHuGzZsCvAdv7BniRCQlft+ZqRqL6cDMoo7S+EmXcWlOtTNp4t
 NjkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB4bGAwYHwD/UXPlFAFqSV4sblMZWi9xma/CeCGDMeuRkaEWYWVa5vbk7NFHs9tOYJoFSM0M7A+lU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2xPb4Y9GPP/JDU98wBry9y0Mz/7HwiWsl9pho+hQLAnQ6G3LA
 zQJbAxP6daPiBmDpYCs0pqZbOSWZSg4C0Dj7eZM6cm62h+/oyX0BKDpXBNg14eDFGoDu1R6EWAA
 yxh81Dbs=
X-Gm-Gg: ASbGnct6Weu9sp5ixln1A+uMuVBficJCxeVlmK7D/Q6kuxpyHECR1yxyWe7+8Ks9Seg
 IrPHnXl+FwZmmGEVHuVJGCfNE0PapW9H36HVMY3LZo4ISLYXYGZwZRZPfcw6GjTdZsgpO+KCu1f
 RQysvO9abxyOuDu3VsE8XbYGdu+Bm7mR9LfH8o76kNY7QNuZ17ZHAh3y/R6lGh7GMGB0GjQiuOt
 UK6/gReLcphBVh/ZJaVXdoAM5DGji72ZrZuR1w1uj2cTDippbPFGCZbwqQXmr2kU6zGlmC+TINB
 DIQlIIowtp8h9rieDqaXJoG3VNFwg3xFZ1cDmMQzgjUQi86B5pO7ODamOsj1cJ4v6ctcFzMcnPs
 Mwqy3mdiNhCt2eWhgfOgGE/d1kI36BO8SLVwOyIKG
X-Google-Smtp-Source: AGHT+IFlrt8264FL5GS6L11aqBloYT2e0SE6fDOFIQ6rapctxS/7yHU8OKR04m/gufgt7uxxOzPyoQ==
X-Received: by 2002:a05:690c:6e13:b0:70e:272c:95ae with SMTP id
 00721157ae682-70f97f30115mr179557827b3.32.1748852119303; 
 Mon, 02 Jun 2025 01:15:19 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-70f8ad20e89sm19658867b3.118.2025.06.02.01.15.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 01:15:19 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e812fc35985so1033215276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 01:15:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVL3fpygeePyK7qs7oWWJspF0YjmFSWupeKARaaoVBTTLrwCLYOGpqe7zesQvdT1bTg8Dx0fWHDAdE=@lists.freedesktop.org
X-Received: by 2002:a05:6902:723:b0:e7d:d830:41e0 with SMTP id
 3f1490d57ef6-e7f81e05026mr18622596276.12.1748852118798; Mon, 02 Jun 2025
 01:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
 <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 2 Jun 2025 10:15:07 +0200
X-Gmail-Original-Message-ID: <CAAObsKBPywWbe43AeY24P_13zH5m_BCb9arAhf+FVq+w=Z3j6A@mail.gmail.com>
X-Gm-Features: AX0GCFvNhfOr4abfwc18aAyYDuAfUB75c0n6dwgqbzT_BxLwdikrZIB5A8pfreA
Message-ID: <CAAObsKBPywWbe43AeY24P_13zH5m_BCb9arAhf+FVq+w=Z3j6A@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Kever Yang <kever.yang@rock-chips.com>
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

Hi Rob,

[adding Kever to CC]

On Wed, May 28, 2025 at 3:41=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, May 20, 2025 at 5:27=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.n=
et> wrote:
> >
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > v3:
> > - Split register block in its constituent subblocks, and only require
> >   the ones that the kernel would ever use (Nicolas Frattaroli)
> > - Group supplies (Rob Herring)
> > - Explain the way in which the top core is special (Rob Herring)
> >
> > v4:
> > - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowsk=
i)
> > - Remove unneeded items: (Krzysztof Kozlowski)
> > - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> > - Add reg-names to list of required properties (Krzysztof Kozlowski)
> > - Fix example (Krzysztof Kozlowski)
> >
> > v5:
> > - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> > - Streamline compatible property (Krzysztof Kozlowski)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 147 +++++++++++++=
++++++++
> >  1 file changed, 147 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9eb426367afcbc03c387d43=
c4b8250cdd1b9ee86
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,147 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
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
> > +  There is to be a node per each core in the NPU. In Rockchip's design=
 there
> > +  will be one core that is special and needs to be powered on before a=
ny of the
> > +  other cores can be used. This special core is called the top core an=
d should
> > +  have the compatible string that corresponds to top cores.
>
> Is this really a distinction in the h/w? If you change which core is
> the top one in the DT, does it still work?
>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3588-rknn-core-top
> > +      - rockchip,rk3588-rknn-core
> > +
> > +  reg:
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    items:
> > +      - const: pc
> > +      - const: cna
> > +      - const: core
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +    minItems: 2
>
> It is odd that the non-top cores only have bus clocks and no module
> clock.

I'm not sure I get what you mean by module clock, but the TRM says this:

"36.5.2 Clock and Reset
1.5.2.1 Clock Domains
RKNN has two clock domains, one is AHB clock, the other is AXI clock.
AHB clock, which is
the clock for AHB interface, while AXI clock, which is the clock for
AXI interface. AXI clock
also used for core clock for every Calculate Core and Control Core.
Clock frequency can be
controlled by CRU, please refer to the relevant sections. Automatic
localized clock gating is
employed throughout the design in order to minimize the dynamic power
consumption.
Almost all of the flip-flops are clock gated in the design. Block
level clock gating also
implemented in every separate block. If a block and the interface to
the block are both idle,
then the clock of that block will be gated automatically. This feature
can be disabled by
software."

So maybe the AXI (aclk?) clock is being used as what you called the
module clock?

> But based on the clock names, I'm guessing the aclk/hclk are
> not shared, but the npu and pclk are shared. Since you make the top
> core probe first, then it will enable the shared clocks and the
> non-top cores don't have to worry about them. If so, that is wrong as
> it is letting the software design define the bindings.

I don't really know what the pclk and npu clk are needed for, but in
the TRM I'm seeing references to the pclk being related to the core 0
(TOP):

pclk_nputop_root_sel
pclk_nputop_biu_en

Couldn't find similar references to the "npu" clock though.

Cheers,

Tomeu
