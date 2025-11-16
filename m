Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C872C613C4
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 12:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3760110E2AD;
	Sun, 16 Nov 2025 11:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hxIclktg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D8910E2AD
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 11:44:11 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b737502f77bso219104066b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763293450; x=1763898250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e0FdCBKLZNmvA5H65lDRryOm2kL/lm5kmNUU93njJEQ=;
 b=hxIclktgWf4ceBD+UaO0VrNKtnzQbjRCsmG9dC5imAV52gY1f7qdQn7WmKSUSiGP68
 1sKg6e6goYOA8dLn27ZG++iSOi4GSJ/CFopsrMDNqVT/mL+h+QHYfzg/fAD08rmVjG6j
 beOQVu0/QF7plD+avawtnzfW6FDEX1msAyLEG549eqNCR9JqDm5gf+CBGDcYsNd5M+BQ
 Kft41VBRNqR/4c+6znReTP0IfQvVVnKnMpttoA54WNE1CWZDu2icWtUaJm3AgrtmYo2a
 MWQ+G1joj0EZLFSg4G9PJBBry2dkwCgPUfmcfMwFDbayw6Dmburil7Nh6i8ie8MxoAev
 G3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763293450; x=1763898250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e0FdCBKLZNmvA5H65lDRryOm2kL/lm5kmNUU93njJEQ=;
 b=NNlQHvo6KzacWn+fFxaydhzSToQSZwDbu92Y4IHHsf7jXWeQVoq2bCHwhcbxYrilCi
 nN6sfuKm6d89pxe/wraqP3MCwFUQKx2BzF17b+NwFmrqXStnSDDPd6FVRPW0D+0I3mYD
 mcbJbaLVbfg4mpjLJzIfCbwNlZYZ1uf4rrdlM7wHqQUX6oKa3JHdpu2G52l5nvqDvPYm
 xcY9dKfdee0tW1m75nGgiAv4fIinlpN3U+LjAk0wZcSeHX1FDfHo2qazi2Pt1Mde1I/q
 Guv0CdC/qPaprYEwVWSbSzbVNRoZP30p4wiJqTSb7sBRpJnrCHTD5XuIoE8iafUoYpGS
 Lwgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQz3Fg+fy5R7EtRPH9GnPSI0u1O2KgCpU4cRjMaPQ6BJjsUxYj2BtWaK18Wz1yWpuO6ypp5q1AQ3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQJz6EgQYay+xwVjq64tf4Z7RyT4tDl5IZJ8z8k4bJrbItszOn
 FpLNQptEOwWKzmIMUXEIDbXrr6/1J2Mhi3FOWW5xMK9Hh3s9++QhhZdW
X-Gm-Gg: ASbGncvIk3OO5CSjnt0W8Q/e8fzke/iT2kd1894up0/LjxiTRi3xRXgWzjlw2M8cpj2
 UKGUMWW7jXiiRewsdQFVAJGxOYwA26/pEfpN6Dhxm8/U13r9hzO3jy1XFhYpmL321tym3GjrVui
 +Ox1Oqs09Zv92BOjiBDTxtBG2KmUNCCFxzunusLI2glxTv9KGOfvQbuI3LzevkPPrS7yu4BS5ri
 Rp9E16Oyd2eTHwjSoN0c22XEhyloZWGgR1RlSMFHdNlLBb3bPDW1FLZN5nB+svuIBsS+75xzrsD
 0G5vFsmcXqnMt/JCpQnTFWnDBEbo60X2Wd83qKPO+m961qxK/ap71nhEh7ClHpDup2AjctDLLye
 veUspNdPo/MlkDO/EzhGv8ZL+WFlMcId9Spcwhy8FzFv/kubnsHrusT9u0dR/jWHWd7/WP7EN5r
 dYud7tS/KsNsLRfpostHuwRyctRE3gnv6cDjGjzkapeERwpZR/qDi5+aqPwDg7IMVM9wQ2
X-Google-Smtp-Source: AGHT+IF71fotOguLRbTRHhdoPXFXtZCCxjXGGJnugEk1v1pjxqWMpiA2cn4S56S/ok6Kp7QddGfEdA==
X-Received: by 2002:a17:907:fdcb:b0:b73:8757:68ad with SMTP id
 a640c23a62f3a-b7387577ab2mr403687966b.47.1763293450183; 
 Sun, 16 Nov 2025 03:44:10 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81172sm820527166b.15.2025.11.16.03.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 03:44:09 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Date: Sun, 16 Nov 2025 12:44:08 +0100
Message-ID: <4691137.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-5-jernej.skrabec@gmail.com>
 <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi!

Dne nedelja, 16. november 2025 ob 12:29:27 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
> > Allwinner Display Engine 3.3 contains planes, which are shared resources
> > between all mixers present in SoC. They can be assigned to specific
> > mixer by using registers which reside in display clocks MMIO.
> >=20
> > Add a binding for them.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/allwinner=
,sun50i-h616-de33-planes.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i=
=2Dh616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwin=
ner,sun50i-h616-de33-planes.yaml
> > new file mode 100644
> > index 000000000000..801e5068a6b5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-d=
e33-planes.yaml
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-=
planes.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner H616 Display Engine 3.3 planes
> > +
> > +maintainers:
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +description: |
>=20
> Do not need '|' unless you need to preserve formatting.
>=20
> > +  Display Engine 3.3 planes are independent of mixers, contrary to
> > +  previous generations of Display Engine. Planes can be assigned to
> > +  mixers independently and even dynamically during runtime.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun50i-h616-de33-planes
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  allwinner,plane-mapping:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Phandle of Display Engine clock node
>=20
> You description is almost duplicating property name. You need to explain
> here how this device uses them.

So I guess I can copy commit description here? It is needed to
access registers from different core, so it can assign (map)
planes between mixers at runtime.

>=20
> Esxpecially that clocks do not go via custom properties.

This has nothing to do with clocks per se, it's just that registers
that driver needs to access for mapping planes between mixers
are in IP core which takes care mostly for clocks and resets.

Best regards,
Jernej

>=20
> Best regards,
> Krzysztof
>=20
>=20




