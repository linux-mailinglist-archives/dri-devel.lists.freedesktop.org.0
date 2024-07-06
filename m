Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1C9290C3
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 06:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED2510E0A6;
	Sat,  6 Jul 2024 04:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lESmbGVD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B2E10E0A6
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2024 04:48:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6FF3360AF9;
 Sat,  6 Jul 2024 04:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF37C2BD10;
 Sat,  6 Jul 2024 04:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720241327;
 bh=13EXoUAPq38Cmaa3H/MBeovfbKWJYnIG97tCkbnyKZs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lESmbGVDMqXRU6rKjwgbcYKIlx2y+C9Lxjl6cPb+GfjTdeGkvYFj38pXSAt79OHIj
 t7xSxAM9n6sbwsv1x+L9u2JzvI1hyLmWuXUhhb2hYIVeIZzZpWCaR2t4aEMqSEBfsT
 1slxt7TOuTEDjWzOkaV22IEsPqWFNC14+F29hjN7YZV/dKu4KVL2f8g09uTiSs4oaT
 rfhEyi4al9FLz3h7iIkJGdjkupatGAyr39OiSvzCLy2I/RIh5osMkXEkUF0q0lNYnv
 Et6wf2LXZ2l4pHZY/kc/l3lErNf/xTXAZVVIxmcgulemnALe3nKHG8dxtYnuYur9lz
 P4wjBQSSuS10g==
Message-ID: <0986ea357075df5779f4b9cd90e298cb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e041466e-cfdc-46db-ae83-dcc04ed1af42@app.fastmail.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
 <20240703105454.41254-20-ryan@testtoast.com>
 <dc00b9daafe6a88ffaaaf4aace29e136.sboyd@kernel.org>
 <e041466e-cfdc-46db-ae83-dcc04ed1af42@app.fastmail.com>
Subject: Re: [PATCH v2 19/23] clk: sunxi-ng: ccu: add Display Engine 3.3
 (DE33) support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 05 Jul 2024 21:48:44 -0700
User-Agent: alot/0.10
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

Quoting Ryan Walklin (2024-07-05 01:39:15)
> Hi Stephen, thanks for reviewing.
>=20
> On Thu, 4 Jul 2024, at 11:02 AM, Stephen Boyd wrote:
> > Quoting Ryan Walklin (2024-07-03 03:51:09)
> >> +#include <linux/of_address.h>
> >
> > What is this include for?
> >
> for writel, however have confirmed this should instead be #include <asm/i=
o.h>, will correct for v3.

Include linux/io.h then.
