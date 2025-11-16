Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB1BC61412
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 13:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2379E10E04B;
	Sun, 16 Nov 2025 12:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KEolHyBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8167B10E04B
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 12:00:50 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b736cd741c1so329889566b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 04:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763294449; x=1763899249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8FaqKEjgD4Y2LjTTGKyATQQX3MWIGa2bobHCkDv5PE=;
 b=KEolHyBqPME0xl2lb4DURGnAbhVsDc4r7wnS/GbbdV3rI/FEc7qNZExnvxSjh2Kq7B
 HxUvd/xHngNdMytFvF6wzHL87h1Y9nnkixLq+ySezCFokEizZhuh81ScPsYSubDF9TQ/
 MxMmDxxzEasDHfEglGXiP6s8MPMxDdwrYY0SSb7gg96lLTvMDozMnNWaTBzqJBuFVb8K
 4GdtxR0a4zOpenqj7C4sYTfLNeJFW42QiDbyMqDSslljLYnbQ7+aGXwcgcUvtX5OBhqe
 3J5Gk/uYUEtrMM2kYW8iO0MpCV6lI4MHwbDULA+1xFgclGZXC25NqugJ1pj+xB5c8o+D
 skcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763294449; x=1763899249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y8FaqKEjgD4Y2LjTTGKyATQQX3MWIGa2bobHCkDv5PE=;
 b=li/anvL0DuFjtfTcMquCzLdjUI44HG+RwROaTYj51C0KXJpNCqXx1/lYlPcDI9aO+4
 POjr8jJrs2eFy+PznlC0CuW8XNlbbufkT+8PWY1zgU0axlMHButG9qdpQgVQaghqvbsR
 jWE1kK3RPaP8Shsr6mrEiauvnrbwX+7Lmyaxxu+0VuJ4qHOzCCgJgAG44vd+NiTFwHoX
 SHF7/5C4goTwuBo+OzSTrPfa4pmRmumlsWYceZz4RE1Hf6USccJKG/IfzBNNvniDv+gY
 vSKusLTdBTQXH0fnZ8diuUXhRm1r4lHrPGzyDzOvfie1a7/QbY3N5l11Uv8e78eeqc6x
 0buQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3PcBju8L5Zf/OesoYXSG5ZJC/C3cOygZQNFevIjWJGJtfms09zpRBSzKIUuTJD24H35Rk+GUHyc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOLeRtwAAgfWMMA8piOiVqVUuwwLYx8T/VqySuJzGJlxGjLjY+
 FNMUQN7QRmF5cRMGhx5955TQgm4C1mg26976j0zY59qy2/SwMthRgx97
X-Gm-Gg: ASbGncuzSYjYpurnPyealdbh+x2cSbBnOp4LHCVNs5QZlkpPXGYSl87qWpfAyjWjipg
 fWrQ4Gbuh60YY/NBRB5spCn6ZypWhAKRCIGJYpmimL22aGChN+Sq2fU28eciN79AIrPlhc/DCuC
 idQsHDyxLlmEj/JsL9eNC8dhpRDOl6Q8BGl1mQyiSLtZQC/F/cCG8FVaP81SkaHm0FBOaGZAxmP
 fKKhJuUTnFqZnilPKWRWNRlaJn0K0CKQd2qezTxAQT0B/PZdJXfNaPQu3DCc0SdwR7qSX5HEzU+
 jYvB/twl79ZpGgNsA66iZWEFRxOjumH2Viaf1Q0YJIT0yVW2araC2uQtunOj8FzMhBWtunWDRRE
 pL/W81rkUmIMTtu7IuiGpHYHSOVVbm7LrqpswfwScyELXch20kiIhRTtJInKG2q72x/Tl7DbPDE
 X6/Ah0kRgJf4rOMCuQPLSVZXiehmCCh+4VETLwcmGeNRdbAqHghDP4vPTXn+HZ3tfmaqtBzNNar
 UzwOACq9BG/l6l8
X-Google-Smtp-Source: AGHT+IFWFubjCIweyb9YCoKzVFcXXsXAAvddERhRBpi3vJIG1VQ4HjCz6c3ATn4RBI8dMcQCX4ffyw==
X-Received: by 2002:a17:907:96a8:b0:b73:989d:3a86 with SMTP id
 a640c23a62f3a-b73989d3e2bmr79438866b.40.1763294448767; 
 Sun, 16 Nov 2025 04:00:48 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad48dcsm826174066b.25.2025.11.16.04.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 04:00:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33
 binding
Date: Sun, 16 Nov 2025 13:00:47 +0100
Message-ID: <10753322.nUPlyArG6x@jernej-laptop>
In-Reply-To: <4b4ebcc2-491a-42d3-9758-60de80ce5eb6@kernel.org>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251116-pigeon-of-optimal-blizzard-2cb3b3@kuoka>
 <4b4ebcc2-491a-42d3-9758-60de80ce5eb6@kernel.org>
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

Dne nedelja, 16. november 2025 ob 12:33:55 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On 16/11/2025 12:33, Krzysztof Kozlowski wrote:
> > On Sat, Nov 15, 2025 at 03:13:46PM +0100, Jernej Skrabec wrote:
> >> As it turns out, current H616 DE33 binding was written based on
> >> incomplete understanding of DE33 design. Namely, planes are shared
> >> resource and not tied to specific mixer, which was the case for previo=
us
> >> generations of Display Engine (DE3 and earlier).
> >>
> >> This means that current DE33 binding doesn't properly reflect HW and
> >> using it would mean that second mixer (used for second display output)
> >> can't be supported.
> >>
> >> Update DE33 mixer binding so instead of referencing planes register
> >> space, it contains phandle to newly introduced DE33 planes node.
> >>
> >> There is no user of this binding yet, so changes can be made safely,
> >> without breaking any backward compatibility.
> >=20
> > And why would you configure statically - per soc - always the same plane
> > as per mixer? If you do that, it means it is really fixed and internal
> > to display engine thus should not be exposed in DT.

Not sure I understand what you mean. H616 SoC has 6 planes which are
represented with single DE33 planes node (see previous DT binding).=20
Driver has to decide initial allocation. For example, 3 planes for each
mixer. However, nothing prevents to allocate 1 plane to first mixer and
5 to other. You can even allocate all 6 planes to one mixer and none to
the other, if board has only one output enabled.

In any case, plane allocation is runtime decision and has nothing to do
with DT. Since planes are shared resource, their register space can't be
assigned to only one mixer.

See [1] for example how this would look like.

> >=20
> > Describing each IP block resource in DT is way too granular.
> >=20
>=20
> BTW, everything is update, thus subject is really non-informative.

I guess "fix" would be more descriptive.

Best regards,
Jernej

[1] https://github.com/jernejsk/linux-1/blob/d93d56d92db52c7ff228c0532a1045=
de02e0662c/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi#L181-L235



