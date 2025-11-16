Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84091C61475
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 13:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F83F10E2B5;
	Sun, 16 Nov 2025 12:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PvLkQbKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588DE10E2B5
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 12:10:39 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-64074f01a6eso5780473a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 04:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763295038; x=1763899838; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BnsF6JeZIC4Q2fWv2jeLUTcHN7i4Xl69LvES25j5B6Y=;
 b=PvLkQbKyi/vW/jSXSKHyvgCk+nsQL/U+s0YrCqs521UxvqV6r8id1yuARZyNaKePT/
 qHFyt+btDXH84WviM5cnFCFlkrfbZWuMYJfBWN5QDzgWBtlwHRUfLT6Zf/CFsdY+qOVz
 0JXEXvl1L/eJOWh4XWH/DxaIpz3CDUX2M2xBbO1a1Z0fYBqi6mZImFBkW+zrsNp/f7iK
 AO+QHA/lLquhOouvGcqLpR2UZL6bFFINzIzcL92YKpaQHAYtPiauKHvLbD5lW+Mk+K+H
 vJ8fk7YFsnvNh8qP+WXbNruYzH1AdxEdiSU/4PmVd/5o0/JzA+Vqj4Ls44N89+bAoqbC
 kmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763295038; x=1763899838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BnsF6JeZIC4Q2fWv2jeLUTcHN7i4Xl69LvES25j5B6Y=;
 b=taO7SGwoT8RdtaFMMACZfikE6iE+kgsPqqidqZ58GfwBOYWIUWKxHXHRoMgDD8swOP
 GogMI/JgZSIOrwTjxvG6lkWiTHSNbddRKCPlNx99vawlNsMQSW8Zpu76HM31aNnFe1Bh
 gwX+iL4dr/3MUHoPe/xZNy6Ov7uyZjkwYbN4coJQ9SRFVUb5h+aep9iXx/cz977khjLz
 2DVxjv9T+cCxMNxlWIC2IqpZaBDuOeyFtal9fUI7DYvEAd4R8JYZCsVHdVaNJkbTmvcM
 IVB+bZBUix5S9entSdOBQM+qCRhpBi3m/1qIc41bRv7cYX5ZITgxYPDmWVXAzt30l223
 AMHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnafVg+SzheK6k7/NFuA2B+0Pi6+fpDmXjdglACjZl+K7B8r5qzM1BudumArw/8X108qndqjo1XSs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymsictXyYwsEL3c1c9fGB9daSdz96wKnOuuUNCgLptAtFddIYW
 bW7JpuJNQif5EzVEwyxmUIXB3MICmN96RyC4/LvZP36s4V9q8KbDlSqgoKVDag==
X-Gm-Gg: ASbGnctaS+jxXwLvzj917gdOaJ1L50/kQnsS9ubInMAFJuEEtBYy2ykAZrcpfsW+qT0
 CrUUINqFyPH1vWszAAleVuyQme51cMrVadhQwlj4MxHA2aX7OxvvN+JgVDZ7UiKwfC/bMNBi6/c
 N1qwS/U1dQOYpk5pUvyR85DpFr6LUPoIaC4XtSWkLv1bJeDqxB4hnwKp7kknOUJWSdmKpRzIH9t
 XrHC1m2OKSFx1BqUDn3BiQQJAJIC8m6ekeXi1dos2FzInDXBewdt6fDN0mq/HlwE/fyzR8bvRYH
 Ft34RdOMShnbetZz0PkQtn2f/eSvG6govBmekkcbRXsiCgcOZYWj3ZylpZcZYYUBPTPDRX49QU0
 QGs6tn2EkaEOpe2UWMlce1WMhQUQ50gyOkXD7+vw6ZjarlhMZiTGaaQDbb781eCJFvcPs7hkGcw
 SLFhGh7x8wfcQFlAt4AjTGoq1iQeE164F7gByb6SaHwaxlCeNjKYiCUVvZWA==
X-Google-Smtp-Source: AGHT+IG5Pb4oZTy+N/ijhNzo5h6b+rv9IQmhgKS6Icb7AJg8wd0rdoZ0YkfWkZADk7dGg/KIAneikA==
X-Received: by 2002:a05:6402:5112:b0:641:9aac:e4bd with SMTP id
 4fb4d7f45d1cf-64350e9ed21mr8531044a12.26.1763295037690; 
 Sun, 16 Nov 2025 04:10:37 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b1fadsm8008375a12.31.2025.11.16.04.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 04:10:37 -0800 (PST)
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
Date: Sun, 16 Nov 2025 13:10:35 +0100
Message-ID: <3659815.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <f8979d59-0f71-438f-92ec-bf1077279dce@kernel.org>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <4691137.LvFx2qVVIh@jernej-laptop>
 <f8979d59-0f71-438f-92ec-bf1077279dce@kernel.org>
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

Dne nedelja, 16. november 2025 ob 12:49:45 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On 16/11/2025 12:44, Jernej =C5=A0krabec wrote:
> > Hi!
> >=20
> > Dne nedelja, 16. november 2025 ob 12:29:27 Srednjeevropski standardni =
=C4=8Das je Krzysztof Kozlowski napisal(a):
> >> On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
> >>> Allwinner Display Engine 3.3 contains planes, which are shared resour=
ces
> >>> between all mixers present in SoC. They can be assigned to specific
> >>> mixer by using registers which reside in display clocks MMIO.
> >>>
> >>> Add a binding for them.
> >>>
> >>> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>> ---
> >>>  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++=
++
> >>>  1 file changed, 44 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/display/allwinn=
er,sun50i-h616-de33-planes.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun5=
0i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwin=
ner,sun50i-h616-de33-planes.yaml
> >>> new file mode 100644
> >>> index 000000000000..801e5068a6b5
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616=
=2Dde33-planes.yaml
> >>> @@ -0,0 +1,44 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de3=
3-planes.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Allwinner H616 Display Engine 3.3 planes
> >>> +
> >>> +maintainers:
> >>> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> >>> +
> >>> +description: |
> >>
> >> Do not need '|' unless you need to preserve formatting.
> >>
> >>> +  Display Engine 3.3 planes are independent of mixers, contrary to
> >>> +  previous generations of Display Engine. Planes can be assigned to
> >>> +  mixers independently and even dynamically during runtime.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - allwinner,sun50i-h616-de33-planes
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  allwinner,plane-mapping:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description: Phandle of Display Engine clock node
> >>
> >> You description is almost duplicating property name. You need to expla=
in
> >> here how this device uses them.
> >=20
> > So I guess I can copy commit description here? It is needed to
> > access registers from different core, so it can assign (map)
> > planes between mixers at runtime.
>=20
>=20
> "to assign (map) planes between mixers." is enough.
>=20
> But it looks unfortunately like a spaghetti.
>=20
> Your mixer binding references via phandle this planes. These planes
> reference via phandle some other region to configure planes between mixer=
s.
>=20
> Isn't this the job of this device?

It is a bit confusing, yes. There is no clean split in register space
for some functionality. Register space for this node on H616 SoC
represents 6 planes (each plane consist of framebuffer management, CSC
unit, scaler, etc.) but not actual registers which tell to which mixer
they are currently assigned.

Best regards,
Jernej


