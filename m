Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F50AC6CE7
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 17:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5E210E617;
	Wed, 28 May 2025 15:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="voWpEW19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5882310E617
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 15:35:11 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e7da099de49so3324402276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1748446510;
 x=1749051310; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xxvQd++y7EnTgMMEVQbGeZAD8fz0r4wC/tmiy3K++8=;
 b=voWpEW19Cj1Oqn90RDXn/U0QSeKLGg0zf6CJNBrhTBJ7hMgoi5i4XK2rVqqPT9Gvp/
 LkMsArKUqhGrB4KnpxmX1P4fs63Kj537Xc6qBBfx0m3dIs9nB0D7DNdnNYbzEDP1QzmE
 jvvL1E8/mWzZh/hkgaoSlW4NHLSFPgCNT4WrWtG36AGeNrUGyTUiT+G1MXJUPOdlUH+U
 q+ik3D2iq8fp+MtJcRahtd/aqGSriNisrsxnh0aOmE21qBK/DlbXJ7lUerz5jX6VUAVE
 qcw+BycaFKjsxIViqv7PyjXXiPGgPQi29OtO2Io5aXYRlZ0h5FsRJwK86Bc3MjD/ffU7
 FdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748446510; x=1749051310;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xxvQd++y7EnTgMMEVQbGeZAD8fz0r4wC/tmiy3K++8=;
 b=diO4jkfV7QLaZz0cfZb2sQ83ue20pDclzPiSc+coWO5WMrsKVL4Xzp483ErE8dky2B
 eS+HBDYtFksiTjF2JK8qCgDDu45jPw3QvayrxoSpGTsgte+ioVJ8opbjZCDvnchqUiSJ
 jCAavuUfrB/ty2VfZa2fsnn45zFvoMurNc+oqtFjaNcBI4ywtqCH5WbprWsanw+5F0O3
 qDdkwM3U43zDbdmylz6QIJBVqnYBiK+zHVmqKEB/i089Gy9NF26QiYabo9AMOJSy+Oft
 8tkitGTcgdKem2XkVQIu+182YWvd6WiF97XtK+wikmQjzpofMCB9lT8ld9/DJ9KGFQnt
 FR4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy5u2oBhRFG2wTIG5ePBcu5gxM/17k9mf+6Os7GKvbU6N7RH7WtkvZ84RgL42R38dgDO4r/iQi30k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZzHVkAve04viJU4pH7cARsE1wBsSrrXh0XvPOF4GN4lapwMWv
 k7QrMh/W36UElVPnx/TltPsWDXF9vlXiZiRHi3aEMnhklGAJ2P4qNbOlxh/PpDHp1hhYYZpUWTF
 qqhaXNFVfig==
X-Gm-Gg: ASbGnctg7/IiKfDgolLFkxDOjYCjrjgEEkDzgcoRAPYpOQEimKmzF/ZlTMFohRcxO5d
 vTdG/eHitilLi0sISUPkcftmTL/uvjW6Qq9gWv0lJMKk4w8vy/R6jR0WF1VVg68n5rnk63ZT7I0
 AaKWRULwvdBiswFsjtTGxQH/0P4r6R2M+aRD7QkV38/TW7TFRgQZjo0hKQ+fgwRpscJZKSADTzE
 9sxO2HG8Dhj+MZFm/qskJLofq8Rfcw/rJAnsQs5VkRCUH6YYbGzTuPiLadM3h3GpZz2LIKngdvN
 zZp7OMyvxtiPKmiqoK9aKyu9fXEsaaH3ciVXU0PvgtVFNU4llNtFM0l8JbXSNSwho4C78atkhZu
 6eJov5bO/K8mCjJq/XR0=
X-Google-Smtp-Source: AGHT+IE0pB9j0xz6rphB0HWVeEmRHJTh4xTdA+IFP0CktkvOgN2KfgbubHNzT1uXdg2F1mqX24TOqQ==
X-Received: by 2002:a05:6902:1021:b0:e7d:ca07:a144 with SMTP id
 3f1490d57ef6-e7dca07a23dmr8541789276.5.1748446510363; 
 Wed, 28 May 2025 08:35:10 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e7f5dde404dsm311811276.26.2025.05.28.08.35.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 08:35:09 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e731a56e111so3785595276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 08:35:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXDDZDXYeGvLtAQ9Iy5tuejF6wT9Pcr2fRHSc7hvzG4F93mC2UA4xRxzVjGLNKvE0YAZoT6OpelUuk=@lists.freedesktop.org
X-Received: by 2002:a05:6902:1021:b0:e7d:ca07:a144 with SMTP id
 3f1490d57ef6-e7dca07a23dmr8541656276.5.1748446509068; Wed, 28 May 2025
 08:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
 <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 28 May 2025 17:34:57 +0200
X-Gmail-Original-Message-ID: <CAAObsKDE33kZ27XbgeWBqQzrZXDHwHzp2Q6A7y_osC50UG-n7g@mail.gmail.com>
X-Gm-Features: AX0GCFtwrQfY2JjemntUXNTLyymu_4uxtqwB53YlQ42a11mlnVkp6EMD0QhiJuw
Message-ID: <CAAObsKDE33kZ27XbgeWBqQzrZXDHwHzp2Q6A7y_osC50UG-n7g@mail.gmail.com>
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

No, I really need to power on that one before the others can work (the
first core is also marked as special in a diagram in the TRM).

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

Yes, I think it's probably as you say, but I don't know how I could
check. Maybe Kever, Heiko or Sebastian would have any ideas?

Thanks,

Tomeu
