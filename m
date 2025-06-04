Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CDCACD844
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 09:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18AC10E26A;
	Wed,  4 Jun 2025 07:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="rBAFGaNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD0C10E70C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 07:11:44 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-70e3ac940ecso48175097b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 00:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749021098;
 x=1749625898; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+nHXGLB1NoYThzl7RUIYtz2LHj026ykSFmZ3xBykhI=;
 b=rBAFGaNjppCsN60vMswIAe7PEe0hDKe6uq6bCO7JHD1JHWaHu2bfaXWaWTs7lDRIrH
 +elrZxplRZQQZNLu7exXG0AojRjnl1Ce1zzthCeGvwMECUHz23FYdjihEH4QpDBSO7vu
 W0+tDHgJv26sTlpvPRJkR+SFmj9jZBipuwmhIK8ml4f/o6JjzGG0UXnTXIyzIfitSkra
 ywm7JubXE/5LAFj+UMmW7lmZfawXRkM7q2QpVu80powFqNUxIh2ASvpbt5r70W3Kp2K+
 zzh+/cp5oEsCYrreIQ4YHSSDI7nP3wNP536713oxVcN4yBjYRfS6l9xD9/VsZR4mEOBr
 4ObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749021098; x=1749625898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+nHXGLB1NoYThzl7RUIYtz2LHj026ykSFmZ3xBykhI=;
 b=VUDgLmU8oHEzbLIoiCIXAg8PUrG0HVxPAB5Hf5k/c3YURK543WupY+EY6tFBONoZRP
 FmB5P4XT86jKmu6fM16a/ChXkvtJ7J78mLnrwAhqQohQzIm1yuOGly6331c/QWHDtMi1
 1wboQEmDsnukBX31fHC/LL9d6PIhmO0WI9VgBa5/OVhB71Fr8wD/J92buyKXYWjDmbOX
 0dvhSQa8wrJBiwxtToxlCagd6xGQCTcoerS5+e1x+PSYsYzDubqCGsn39yx/EbDHB6xI
 P37vb04YUXMPEWu9t39WUtVV9xK7O0SoUd5eZoRqDbIy/ri0fTHUQYRnVRkwNOEEe4+F
 6pAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Pz7xBElvSsm4WCQ1LVoTHsg4KWF0FQuAf6bGxDtiFIVagKarwEuqBgJjekTTu5jfvR+TUgmHYWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQvjGCi38faudbaT1vUU2YaWpubZodKyzzZ805GzylUjNkbIGf
 5qSli/Nb5zz3DBiMnitZLDJ/aI3x6bSe0jT1NA3zLwd6jokQRnbZ04vD6Uay6j3hQ8FIIkLeneT
 sxCNjk3jxVQ==
X-Gm-Gg: ASbGncumQSkpdXzMUclynJBrZmsjlqgzAAWf9dLHsH4/ya8tvnI8Jz1f5wjrYSiWUFS
 l96pHhoGgX/0CWd5KHtXb9H/T+cH+QMCKSEuv4vl7ZM7ErSnysfIQLYnEG7p6PrXTG1uskh/UPn
 jCRyKTuLY4H5HBRrAP1u1wi9NoWXRgZ7as/Rii4pUFJt7cWF8AJQ7SIXURRMU/nqm2Y1bhrEvYI
 4xGLis6f/QIGSNEp/Mg4PUdoXvDQuQR33VvLWLe5QdH4VNSDql6q6SkD7YpE60FiF2PBEqzlbkG
 keJ1jMW3pj7sir5vojeXZ2Lk3i7DbD4NljDqli9FCIUtxyfddg8+Rv5/QL7fCW09sx4BOt0JfDv
 WGa2gf3JQcuCCQAS15W+H/j6ME2s0CQ==
X-Google-Smtp-Source: AGHT+IHOICXli0y6HlsONxtF+FfTFnRu8z6r3utkS7HS/JFYSntho+c66AmjG00hBfwjwarlN3QGrw==
X-Received: by 2002:a05:690c:7407:b0:70f:8883:eb1a with SMTP id
 00721157ae682-710d9a22199mr23519967b3.6.1749021098526; 
 Wed, 04 Jun 2025 00:11:38 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-70f8acd994esm28924767b3.79.2025.06.04.00.11.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 00:11:37 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e812c817de0so3663605276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 00:11:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXq5AN0EApOvbCXERHvpSI93tU8wlp8dNR20gaELsYi+3FKBE0yPIOh3XV0sS468Waf+31J/n/gtr8=@lists.freedesktop.org
X-Received: by 2002:a05:6902:6c12:b0:e81:4200:e227 with SMTP id
 3f1490d57ef6-e8179ef4b9amr1895455276.40.1749021096375; Wed, 04 Jun 2025
 00:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
 <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
 <CAAObsKDE33kZ27XbgeWBqQzrZXDHwHzp2Q6A7y_osC50UG-n7g@mail.gmail.com>
In-Reply-To: <CAAObsKDE33kZ27XbgeWBqQzrZXDHwHzp2Q6A7y_osC50UG-n7g@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Jun 2025 09:11:25 +0200
X-Gmail-Original-Message-ID: <CAAObsKCZiBmy2kBm76V0cWfsLBbHnKzG4CS-bRUBc25k22K20A@mail.gmail.com>
X-Gm-Features: AX0GCFuzVw9QOJbPU8rAaiE__0pakSdSWD2x8uriT207nU1DMDYnxHzJRzNlcz4
Message-ID: <CAAObsKCZiBmy2kBm76V0cWfsLBbHnKzG4CS-bRUBc25k22K20A@mail.gmail.com>
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

On Wed, May 28, 2025 at 5:34=E2=80=AFPM Tomeu Vizoso <tomeu@tomeuvizoso.net=
> wrote:
>
> On Wed, May 28, 2025 at 3:41=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Tue, May 20, 2025 at 5:27=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso=
.net> wrote:
> > >
> > > Add the bindings for the Neural Processing Unit IP from Rockchip.
> > >
> > > v2:
> > > - Adapt to new node structure (one node per core, each with its own
> > >   IOMMU)
> > > - Several misc. fixes from Sebastian Reichel
> > >
> > > v3:
> > > - Split register block in its constituent subblocks, and only require
> > >   the ones that the kernel would ever use (Nicolas Frattaroli)
> > > - Group supplies (Rob Herring)
> > > - Explain the way in which the top core is special (Rob Herring)
> > >
> > > v4:
> > > - Change required node name to npu@ (Rob Herring and Krzysztof Kozlow=
ski)
> > > - Remove unneeded items: (Krzysztof Kozlowski)
> > > - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> > > - Add reg-names to list of required properties (Krzysztof Kozlowski)
> > > - Fix example (Krzysztof Kozlowski)
> > >
> > > v5:
> > > - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> > > - Streamline compatible property (Krzysztof Kozlowski)
> > >
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > ---
> > >  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 147 +++++++++++=
++++++++++
> > >  1 file changed, 147 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rk=
nn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..9eb426367afcbc03c387d=
43c4b8250cdd1b9ee86
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core=
.yaml
> > > @@ -0,0 +1,147 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yam=
l#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Neural Processing Unit IP from Rockchip
> > > +
> > > +maintainers:
> > > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > +
> > > +description:
> > > +  Rockchip IP for accelerating inference of neural networks, based o=
n NVIDIA's
> > > +  open source NVDLA IP.
> > > +
> > > +  There is to be a node per each core in the NPU. In Rockchip's desi=
gn there
> > > +  will be one core that is special and needs to be powered on before=
 any of the
> > > +  other cores can be used. This special core is called the top core =
and should
> > > +  have the compatible string that corresponds to top cores.
> >
> > Is this really a distinction in the h/w? If you change which core is
> > the top one in the DT, does it still work?
>
> No, I really need to power on that one before the others can work (the
> first core is also marked as special in a diagram in the TRM).
>
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: '^npu@[a-f0-9]+$'
> > > +
> > > +  compatible:
> > > +    enum:
> > > +      - rockchip,rk3588-rknn-core-top
> > > +      - rockchip,rk3588-rknn-core
> > > +
> > > +  reg:
> > > +    maxItems: 3
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: pc
> > > +      - const: cna
> > > +      - const: core
> > > +
> > > +  clocks:
> > > +    minItems: 2
> > > +    maxItems: 4
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: aclk
> > > +      - const: hclk
> > > +      - const: npu
> > > +      - const: pclk
> > > +    minItems: 2
> >
> > It is odd that the non-top cores only have bus clocks and no module
> > clock. But based on the clock names, I'm guessing the aclk/hclk are
> > not shared, but the npu and pclk are shared. Since you make the top
> > core probe first, then it will enable the shared clocks and the
> > non-top cores don't have to worry about them. If so, that is wrong as
> > it is letting the software design define the bindings.
>
> Yes, I think it's probably as you say, but I don't know how I could
> check. Maybe Kever, Heiko or Sebastian would have any ideas?

So I talked with Kever and Heiko about this, and the npu and pclk
clocks are indeed shared among cores.

Regards,

Tomeu
