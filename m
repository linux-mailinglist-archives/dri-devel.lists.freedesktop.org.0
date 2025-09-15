Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3882B57F29
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BA710E4CF;
	Mon, 15 Sep 2025 14:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cm8h8W+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4D210E4CF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:36:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2EBA641A52;
 Mon, 15 Sep 2025 14:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6236C4CEF1;
 Mon, 15 Sep 2025 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757947005;
 bh=RLaJFRiH9fUacA+g8XK++lLAVHNIs8PaxaaH9y0/D68=;
 h=From:To:Cc:Subject:Date:From;
 b=Cm8h8W+NHQQgUhYx7vuPgMU2GxX/rYcW6cDGMwdYtftGZM+ds2S4gGgbjvadMuJW7
 uZz0cIIRb13Y9XNXQ2fP+Kbeai4RTWs9XFrsDSCg1QrqimGWm2f6C2u70A1bnccP7W
 79OZAe5oGfLp6K7kRzxFjwwC4E5M/EOVJNlXODnpq7THhEyOk3D61bKy2eekpyWq2+
 Pi8dbMS52WvF/SCwrCRDLI/0U7MZjzsMOT9x0Zh+rynSjKen3EDQbD/0PMk6cTqtOx
 R/TzC+Tef7diO72p98ly74SUmGgETUy2IypawrudL66x3Uhe1XwzdDzLrdnKnHzGIH
 tKTGhk0/3ltrw==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Davis <afd@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Michael Walle <mwalle@kernel.org>
Subject: [PATCH 0/3] drm/imagination: add AM62P/AM67A/J722S support
Date: Mon, 15 Sep 2025 16:34:37 +0200
Message-Id: <20250915143440.2362812-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The AM62P and AM67A/J722S feature the same BXS-4 GPU as the J721S2.
In theory, one have to just add the DT node. But it turns out, that
the clock handling is not working. If I understood Nishan Menon
correct, it is working on the J721S2 because there, the clock is
shared, while on the AM62P the GPU has its own PLL.
In the latter case, the driver will fail with a WARN() because the
queried clock rate is zero due to a wrong cached value.

This was tested on an AM67A.

v1:
 - Don't set the clock to 800MHz in the soc dtsi. 800MHz is only
   possible if the core voltage is 0.85V. Just use the hardware
   default of 720MHz. A board device tree can set the 800MHz if
   applicable. Thanks Nishan.
 - Also add the new compatible to a conditional in the DT schema.
   Thanks Andrew.
 - Dropped the wrong of_clk_set_defaults() and instead disable
   caching of the clock rate.

RFC: https://lore.kernel.org/r/20250716134717.4085567-1-mwalle@kernel.org/

Michael Walle (3):
  dt-bindings: gpu: img: Add AM62P SoC specific compatible
  clk: keystone: don't cache clock rate
  arm64: dts: ti: add GPU node

 .../devicetree/bindings/gpu/img,powervr-rogue.yaml    |  2 ++
 .../arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 11 +++++++++++
 drivers/clk/keystone/sci-clk.c                        |  8 ++++++++
 3 files changed, 21 insertions(+)

-- 
2.39.5

