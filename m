Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D43F8776F6
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 14:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A691110E0C6;
	Sun, 10 Mar 2024 13:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="IcxkRY0Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F52410E0C6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 13:22:14 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Tt0tp1rRlz9spD;
 Sun, 10 Mar 2024 14:22:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1710076930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7pDxrp57wx9o7KlpdNomdNkpvEajcJRh1HWy8ymb1TQ=;
 b=IcxkRY0ZfCl+CWr6HBvQUc0iV8ZKtTO66RsauQCGeLaUidZo1DTj3oAFF0BRhU13NianJC
 1rEyqW5NF+xKAGn69TPbf38fHNWUB3Kjs5aFKiKCrLxFXmCiV00sPvc/mh/+XyQKUlfchQ
 RJY9VzLTUslf67dVSZbAkB22Q3EmSAs1jXnYwUlPApYOKpcPIsP0ilxbzBhki81LdR1P0x
 2ZU+EnFEXR8dNa0NDrfRWYxpw4fxVWnzHjPsmAKlNBjD6HiZsjIUApGqMFU7rM/k5EchJy
 5dLfwOB5VzTfdmlT/w5aywrW8a4n9ga/MtaS3Gfmr5f1sljsjxPI7QtSkNfDrA==
From: Frank Oltmanns <frank@oltmanns.dev>
Subject: [PATCH v4 0/5] Pinephone video out fixes (flipping between two frames)
Date: Sun, 10 Mar 2024 14:21:10 +0100
Message-Id: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMaz7WUC/33N0QrCIBQG4FcJrzP0aOa66j2iC6dnTVg65pBi7
 N1zgwhidPn/h/87E0k4eEzkvJvIgNknH0MJcr8jtjXhjtS7kgkwEBy4pr0P2LcxIO27jjb+iYk
 ya13jEE4CJSnLfsD1UIbXW8mtT2McXuuTzJf2v5c5ZRRB6FqhU87yS+zGhwkhHRxmspAZPoxkw
 I7bDBSmUkYqA07bqt5gxJcRTG4zYmGkqTXoBlRlfph5nt/WupvcRwEAAA==
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Frank Oltmanns <frank@oltmanns.dev>, stable@vger.kernel.org, 
 Diego Roversi <diegor@tiscali.it>, Erico Nunes <nunes.erico@gmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3141; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=dw/JY7X0b1qIdVh3YqU3FmxjxhhOr+GpN4Q08vUxodw=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBl7bP5B8rBUL/f+zksM5cLQwOBM5UrlgbQZQd5X
 nem3BA//m+JAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZe2z+QAKCRCaaaIIlErT
 x+trC/4xNVjCoMGliDsJxBS1gmnUIXkpwRCAmpBcLNTFd06mbn5edQXj1n6fGGcsCyJUnVZg2ZM
 pTz4c4lenL+0cYZHrkNXk5sHZqDYEE1VKsV6kKqsSBS7/361lEZiwtmAu/2/yqWDQPGgVjqPX4u
 semTG1gvzKNvFu/Dhm1MSgO3VCvvfx8xX8hwiQXvSOOBoVNmfw7vtP+zO4w2wTyS9jWGI3Tq/ZB
 FyVozS8DcPf+ADw1z4cShXxU2lXMZIisKiXL0LD5edCE1iz7P55NJPYrz76okDbCYxmBBCZTY62
 OsMi3NkmCa2f4vtdsBtQ0Pdc7gSayyUQK5VV2Wm8fvr3L9me5Hta67WyC+Yo5bfEFQyJ37iD8yv
 dSwYAtfBeiuX6qywJvd/gXIVIA6St5vlfJRTAwZ9CZY0b0w8RdutOVJixFM+YkhnHIWy6yzTV5J
 y3qAwYR1XkIOc1iKk7fyniLzYpzDTCH0yBZW4cTTanNPJ5zfxsOF2TSJwSj6NKRuqMrQE=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
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

On some pinephones the video output sometimes freezes (flips between two
frames) [1]. It seems to be that the reason for this behaviour is that
PLL-MIPI is outside its limits, and the GPU is not running at a fixed
rate.

In this patch series I propose the following changes:
  1. sunxi-ng: Adhere to the following constraints given in the
     Allwinner A64 Manual regarding PLL-MIPI:
      * M/N <= 3
      * (PLL_VIDEO0)/M >= 24MHz
      * 500MHz <= clockrate <= 1400MHz

  2. Remove two operating points from the A64 DTS OPPs, so that the GPU
     runs at a fixed rate of 432 MHz.

Note, that when pinning the GPU to 432 MHz the issue [1] completely
disappears for me. I've searched the BSP and could not find any
indication that supports the idea of having the three OPPs. The only
frequency I found in the BPSs for A64 is 432 MHz, which has also proven
stable for me.

I very much appreciate your feedback!

[1] https://gitlab.com/postmarketOS/pmaports/-/issues/805

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
Changes in v4:
- sunxi-ng: common: Address review comments.
- Link to v3: https://lore.kernel.org/r/20240304-pinephone-pll-fixes-v3-0-94ab828f269a@oltmanns.dev

Changes in v3:
- dts: Pin GPU to 432 MHz.
- nkm and a64: Move minimum and maximum rate handling to the common part
  of the sunxi-ng driver.
- Removed st7703 patch from series.
- Link to v2: https://lore.kernel.org/r/20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev

Changes in v2:
- dts: Increase minimum GPU frequency to 192 MHz.
- nkm and a64: Add minimum and maximum rate for PLL-MIPI.
- nkm: Use the same approach for skipping invalid rates in
  ccu_nkm_find_best() as in ccu_nkm_find_best_with_parent_adj().
- nkm: Improve names for ratio struct members and hence get rid of
  describing comments.
- nkm and a64: Correct description in the commit messages: M/N <= 3
- Remove patches for nm as they were not needed.
- st7703: Rework the commit message to cover more background for the
  change.
- Link to v1: https://lore.kernel.org/r/20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev

---
Frank Oltmanns (5):
      clk: sunxi-ng: common: Support minimum and maximum rate
      clk: sunxi-ng: a64: Set minimum and maximum rate for PLL-MIPI
      clk: sunxi-ng: nkm: Support constraints on m/n ratio and parent rate
      clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m ratio and parent rate
      arm64: dts: allwinner: a64: Run GPU at 432 MHz

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  8 --------
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         | 14 +++++++++-----
 drivers/clk/sunxi-ng/ccu_common.c             | 19 +++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_common.h             |  3 +++
 drivers/clk/sunxi-ng/ccu_nkm.c                | 21 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_nkm.h                |  2 ++
 6 files changed, 54 insertions(+), 13 deletions(-)
---
base-commit: dcb6c8ee6acc6c347caec1e73fb900c0f4ff9806
change-id: 20231218-pinephone-pll-fixes-0ccdfde273e4

Best regards,
-- 
Frank Oltmanns <frank@oltmanns.dev>

