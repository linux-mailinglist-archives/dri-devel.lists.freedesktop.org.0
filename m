Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A43ACD9F3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 10:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2C110E096;
	Wed,  4 Jun 2025 08:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="v+lQWHdj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F366210E096
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 08:36:57 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-70e75f30452so44489047b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 01:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749026214;
 x=1749631014; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJmj/95wgXcHpVI6Ou9qJ8Nq5fJR29OVttEikN7mIco=;
 b=v+lQWHdjrz/+hjAVNMWIIj0Rl2uPeVf0JI7490pujRiUSGouBbOEzQPEIz1bIHipRI
 nxahMqoB24E0baHvsNZQ7O555jtCrxVMvpuxkyJmVF6lmnJ2MwRJ5xuy5w4RxSVtiIje
 YkEeloMazDEK6fTZ8YFyj7kRR9vn/o/k4o0dzpFexaYj2Gwao2J/qsZj00gUIFNoU/Ue
 +9KffLoNHUwQakLmU5Eo1l6WgUIroZdUPpW3ZijjfiN6NC/+J49spZU/UVOg0bgONOYY
 WhGUEuyaqgYU9bcz551lB8VJON/o93CEF6xi+9oEifMJeGhkyZNhYnqAZewDNcDnCGqA
 PQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749026214; x=1749631014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJmj/95wgXcHpVI6Ou9qJ8Nq5fJR29OVttEikN7mIco=;
 b=Rn3tDbqB6aDBm8/XoTUlG2ifpSkOJ733I6fy6DePIWRp7v5PtwRTB78zoRlyaZJVNN
 BAqpuoGuyCmAi1DAi4B/wQZ955dT2g32JHxOyqukecZ81p8MxbkHNn24QOhb/QJsnxHY
 QdR9Vge9Aa0rSTUFST8xd3+QpIV8bN3sFHLSv7ZspFi1QS+1Q14IlSK83RlTr8MJ74uX
 X2GKsH/KGwcRasTtI1rt0eT2nQ0lOxdld7B6UpEl8r0Z3Re9okHvg3yJ4jMkUwS48XFg
 A2sGuknVipG7wMKGVFJOhnrCW4IWNgWTMLj+i5s2OtU1gR+JY5vFRW9WP4xEpyLGvcc7
 cF5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyiGxrjrYGlvyipTsDaD7E8dpg+I19GUbuf6oL76dkV/pCo1CWurjtnxspLz8VmhSUryvdXG6ihvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw34ZQFF6sePkDfcZTZBpyxsle+JvqYYV0cDHZXGZ7E+G7OzJpe
 czfvAUlLe4hf48C88H7v7x9RbQHuk7OEv1gOLo0BTlGGts4V77LT+L7+fYabBdhalSju6rX1rE7
 gxerWScU=
X-Gm-Gg: ASbGncuKi1SjLkR5JVs970DrssHihWwSNi8OjqU+yJpRlfFyuQCn5Gu2Nv6x+NZeB9+
 1vuw/+aeNIPI+XqgRknp7Kyt7geCwn9LX/m+J5pdivAMotqR72XIXT47XicwyiTQUvV3YVFQYHK
 uvcn7Pbz8cjHQOI0LNyb56vnkXm9K7pTT3mcfaTSvsPWYKL5vRG+D0OTHAefzwLpNvedf9Ryzx1
 BlLAEYCZPJTKLVTEc1FbmIYoHG/F1Y+iGC4ZTwaTEpneRcPHSWNefIUgwFGLJEIN4y+jMksot6P
 /N6qmjiirX/mgascpNaafNGwrU7wWbAdYjYvZaV3L4C8hJP3N+d0okVqCo8W5GnNoxaaVQWRjYf
 sxvToYH0o6kIm6dtdc+c1pdB9xR7T+Q==
X-Google-Smtp-Source: AGHT+IEl/RVvCNhoB/8JgWAvEnLsCZuRlKUSp2JOXUjAbnhcSyf31pnnUPde7BKSQd7ecBzjLeWxDQ==
X-Received: by 2002:a05:690c:d0e:b0:70e:2d30:43eb with SMTP id
 00721157ae682-710d99f6a13mr23461997b3.12.1749026214511; 
 Wed, 04 Jun 2025 01:36:54 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-710e0e170afsm520677b3.96.2025.06.04.01.36.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 01:36:54 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e812fc35985so3197432276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 01:36:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXHAleG3DKNmyQXDP2e1C04YkeduqZb8tKHKJieuMnfZpOMqlRVNE7ehjZ3CcdMajTJtP6DBONCiZ4=@lists.freedesktop.org
X-Received: by 2002:a05:6902:2684:b0:e7d:cfd0:957f with SMTP id
 3f1490d57ef6-e8179c4e822mr2337109276.11.1749026214087; Wed, 04 Jun 2025
 01:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-1-237ac75ddb5e@tomeuvizoso.net>
 <2024813.jZfb76A358@diego>
In-Reply-To: <2024813.jZfb76A358@diego>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Jun 2025 10:36:42 +0200
X-Gmail-Original-Message-ID: <CAAObsKB6UDp-yBE3oNNn0GkiVN0TeYFkL5nzQCroUHaSK47tUA@mail.gmail.com>
X-Gm-Features: AX0GCFvL5nJeCruhYVKFwWz9ImMH3rGz7U0FgI_gqBjbHTrFFbFoGu46LHESGLo
Message-ID: <CAAObsKB6UDp-yBE3oNNn0GkiVN0TeYFkL5nzQCroUHaSK47tUA@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Wed, Jun 4, 2025 at 10:25=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Am Mittwoch, 4. Juni 2025, 09:57:14 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Tomeu Vizoso:
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
> > v6:
> > - Remove mention to NVDLA, as the hardware is only incidentally related
> >   (Kever Yang)
> > - Mark pclk and npu clocks as required by all clocks (Rob Herring)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 144 +++++++++++++=
++++++++
> >  1 file changed, 144 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9a5e9e213912d0997da2f6a=
e26189adf044dcc7b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,144 @@
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
> > +  Rockchip IP for accelerating inference of neural networks.
> > +
> > +  There is to be a node per each core in the NPU. In Rockchip's design=
 there
> > +  will be one core that is special and needs to be powered on before a=
ny of the
> > +  other cores can be used. This special core is called the top core an=
d should
> > +  have the compatible string that corresponds to top cores.
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
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  npu-supply: true
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: srst_a
> > +      - const: srst_h
> > +
> > +  sram-supply: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - iommus
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +  - npu-supply
> > +  - sram-supply
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core-top
>
> should be rockchip,rk3588-rknn-core-top I think
>
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
> > +
> > +        clock-names:
> > +          minItems: 4
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core
>
> should be rockchip,rk3588-rknn-core

Thanks. Actually, all the addOf section is not needed any more as we
now know that from a resources point of view all cores are the same.

Cheers,

Tomeu

> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 2
> > +        clock-names:
> > +          maxItems: 2
>
>
> Heiko
>
>
