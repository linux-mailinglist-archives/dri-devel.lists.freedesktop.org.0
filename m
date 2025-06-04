Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A85EACD869
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 09:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8795710E688;
	Wed,  4 Jun 2025 07:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="umCIhcq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBE010E688
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 07:19:41 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b2f1032e1c4so971999a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 00:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749021580;
 x=1749626380; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=egAKscK3QoP1kYQu5KkN3aoibVnnNSd6rVfa6InXH/s=;
 b=umCIhcq+luAuWsXc2ZBgDyFxoOb4lrYCbNUv3b5WwjgpI76Sj/FISp/42kLBO3TQ+k
 95iX3SKKZD7T4vNJcjbHULQYFos1b+dosgapl0f3qcFnRGAizXz6fEArelUyhDw39b1l
 9kBN7qWX4hlf7YUWsoAK11Rm5ARR77pNHa2NJm8QAnE435V7s1GJ2Rhy5SQSOyH5hF6L
 rwJ1F86LqiDCPWXTjp/gUcY7+28q9bzk3ftQn7s6OOh0s7+3Fp5ZebTSzopxXrPkGNKJ
 uVOvxPLW2gCq8YZK5Ld1csp4JKTwY/lgx8NtVBBGnGJLTKbyMxw2REEaQTbtuP0+bHa7
 I3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749021580; x=1749626380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=egAKscK3QoP1kYQu5KkN3aoibVnnNSd6rVfa6InXH/s=;
 b=FGx4+nIGZzAvjCAUGMyLzaixBlnZxn6A7sXuKNMfkEYHy/jNYz3FnCe2laTPErIv2i
 2RlWXEF8Z/dJoXppv+RXkyGR4C/0aq6+dO9coVf46beWyBDZnqq+c5MRBLxm+BGfHvge
 Q0IXzNGUPk2aeiiaY4gPwCrBiVwX2pfhmIEwfony6vTZRY66lZrbpLzsQgU0GA0vDDUt
 e6Ng8roa9kAxq1+6YeWhOQCJbwMZHqSvP0sKR3ZmlSAOsOq4MW2hsRDAFOw0JjbLu2Nl
 pbMRc6MrzrAS4dR7ap6uU/UUYryxSkPy1AM2Ij4AJOFgvMqMHA+FfFXhF968ufbV1zco
 d8BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwvgIza9vpLDwFbnmzyBKFAz447UateTX6Z5wDbVkYv8lPn7Wc+rzyTL/ueYsqex4pDY3nEGsuR0g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm6xBzq2z7QOim/1s3peb1yvuvRpR36sthYNVy2IaqrP+QFokG
 RcNFVD2Yxh01CqHhHhNhCdTS/c4rio5V22s3VBvHT3NeU7UvxHZnF6ufm7NZgP3hLQDqLkngsdh
 BThQI5wRpkw==
X-Gm-Gg: ASbGncsF1quZumHOIkS7ap48hoWakzcrYggLmyRa+LNTvm0OK5vbFObRrcGytroqlpr
 HxhtZxCTerxtZZwvJ3/jCG+DGA0yjHV15rrpaWlaH2QSpizRjuvdu92c9qjTY1zuJdcK5K9aQeC
 JDC+AGW2sYL1w81c7CBjBifirepGVGpZtqHbGhYBagmMIobqa4FJBJnL8+YLJxFOn3awON9XH2Y
 7ohbaE2VSex+2MdeIrbzlUzEfs1+PcILg1FfJcp2mP6o5j7VZ6rliZXTUPURfFu0WAjpuDPL/GJ
 zdJcnqWbCbpolBXaEJYREEtNFB6hLKTL5D11WVXFceAQevgtRCzRX5rS1xYDGiw4saR7HyoQlVT
 /0fSmHeVZWZ9lS70RmNupCWC/R/0ZBw==
X-Google-Smtp-Source: AGHT+IGe9dHe01rbqpfrNjM593XrnrssPhnS9RXPjnecHP6XtSJKguFzWipYKBzy5eo7/o1nkHMyUw==
X-Received: by 2002:a05:6a21:3992:b0:1f5:709d:e0c6 with SMTP id
 adf61e73a8af0-21d22c0e7afmr2581343637.42.1749021580356; 
 Wed, 04 Jun 2025 00:19:40 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com.
 [209.85.214.178]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afff71eesm10485896b3a.159.2025.06.04.00.19.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 00:19:40 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2347012f81fso80289565ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 00:19:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUbEkP+ejYIgP16KrFNAV0GxjU9FciTZ9xMEpDNyEIeHxfFqrbJ+6fC9Bpmc7qodDWP5DOpAwzq1N4=@lists.freedesktop.org
X-Received: by 2002:a05:6902:1009:b0:e7d:b06c:709d with SMTP id
 3f1490d57ef6-e8179dac9c2mr2086427276.37.1749021193915; Wed, 04 Jun 2025
 00:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
 <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Jun 2025 09:13:03 +0200
X-Gmail-Original-Message-ID: <CAAObsKCUusE68Bzce5fxukpOJ34M_w5vt7+gLSHZuMC8KXqtLA@mail.gmail.com>
X-Gm-Features: AX0GCFujZUaEEoiRSaHh2B6hjHyNEBOF25EbCsvQFur0Wj0AZ2p1QcOal7DajJE
Message-ID: <CAAObsKCUusE68Bzce5fxukpOJ34M_w5vt7+gLSHZuMC8KXqtLA@mail.gmail.com>
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

I asked Kever about it, and he confirmed that the core 0/top is
special in that it is able to relay register writes and share data
with the other cores.

Regards,

Tomeu

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
> clock. But based on the clock names, I'm guessing the aclk/hclk are
> not shared, but the npu and pclk are shared. Since you make the top
> core probe first, then it will enable the shared clocks and the
> non-top cores don't have to worry about them. If so, that is wrong as
> it is letting the software design define the bindings.
>
> Rob
