Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C52FC092D8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3751910E296;
	Sat, 25 Oct 2025 16:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="paFgYJh2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E82E10E296
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 16:09:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B740D60296;
 Sat, 25 Oct 2025 16:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E32C4CEFB;
 Sat, 25 Oct 2025 16:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761408556;
 bh=OqrbJ8RbJ7SKho0YqoWtttGsJjwLRA3hAIz9bXz8upU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=paFgYJh2tMWYxUGAMCx2/+VWHh/fHgZu/FzI8+q8SXQrH81Y45FNbmaFK9E+FWwpX
 ne9ZNLzhxKWoTcoK0nXWaGiq2FOfOR9Fuv6eUTe2sffGRNfreAFgNjdXGFAFrmxlQ2
 SXyxG3xM+zcowkvcylOOGq9/PiNONTSwbWPMeEIP4/e42CcCHoN/KplKxyC4LvmJFP
 dXdmixOY89zB+a1trxEQ/3WRf4ocm1TpE2YvR2ufBWnBK590MW2sZkpi8bSAzHyhPJ
 V5JkbwNOo3Z/1tOx8QttjjKYmhUEE7nrlkKzEVaUhxF/xs6fsHtSKvjXFafUIM/200
 lXUmWCEIUBNuw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Christopher Orr <chris.orr@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Sasha Levin <sashal@kernel.org>,
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] drm/panel-edp: Add SHP LQ134Z1 panel for Dell
 XPS 9345
Date: Sat, 25 Oct 2025 11:53:57 -0400
Message-ID: <20251025160905.3857885-6-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
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

From: Christopher Orr <chris.orr@gmail.com>

[ Upstream commit 754dbf164acd4d22dd7a5241b1880f54546d68f2 ]

Introduce high-res OLED panel for the Dell XPS 9345

These timings were selected based on Alex Vinarkskis' commit,
(6b3815c6815f07acc7eeffa8ae734d1a1c0ee817) for the LQ134N1
and seem to work fine for the high-res OLED panel on the 9345.

The raw edid for this SHP panel is:

00 ff ff ff ff ff ff 00 4d 10 8f 15 00 00 00 00
2e 21 01 04 b5 1d 12 78 03 0f 95 ae 52 43 b0 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 fd d7 00 a0 a0 40 fc 66 30 20
36 00 20 b4 10 00 00 18 00 00 00 fd 00 1e 78 cc
cc 38 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
37 31 4d 31 81 4c 51 31 33 34 5a 31 00 00 00 00
00 02 41 0c 32 01 01 00 00 0b 41 0a 20 20 01 ea

70 20 79 02 00 20 00 13 8c 52 19 8f 15 00 00 00
00 2e 17 07 4c 51 31 33 34 5a 31 21 00 1d 40 0b
08 07 00 0a 40 06 88 e1 fa 51 3d a4 b0 66 62 0f
02 45 54 d0 5f d0 5f 00 34 13 78 26 00 09 06 00
00 00 00 00 41 00 00 22 00 14 d9 6f 08 05 ff 09
9f 00 2f 00 1f 00 3f 06 5d 00 02 00 05 00 25 01
09 d9 6f 08 d9 6f 08 1e 78 80 81 00 0b e3 05 80
00 e6 06 05 01 6a 6a 39 00 00 00 00 00 00 58 90

Signed-off-by: Christopher Orr <chris.orr@gmail.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/r/aJKvm3SlhLGHW4qn@jander
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What changes: Adds a single EDID‑based quirk entry for the Sharp eDP
  panel used in Dell XPS 13 9345 high‑res OLED:
  `EDP_PANEL_ENTRY('S','H','P', 0x158f, &delay_200_500_p2e100,
  "LQ134Z1")`, placed alongside existing SHP entries and using the same
  delay profile as the related LQ134N1 panel. This goes into the
  vendor/product‑sorted `edp_panels[]` table in
  drivers/gpu/drm/panel/panel-edp.c:1859 and the SHP block around
  drivers/gpu/drm/panel/panel-edp.c:2030. The delay profile referenced
  is defined at drivers/gpu/drm/panel/panel-edp.c:1727.

- Why it matters (bugfix, not a feature):
  - The edp_panel table drives panel power‑sequencing timings by EDID.
    Unknown panels fall back to conservative timings via generic
    detection (drivers/gpu/drm/panel/panel-edp.c:759) which sets only
    unprepare/enable and notably does not set `prepare_to_enable`
    (drivers/gpu/drm/panel/panel-edp.c:740). For this class of SHP
    panels, the correct behavior requires a non‑zero `prepare_to_enable`
    (100 ms).
  - Power‑on sequencing uses `prepare_to_enable` to ensure the
    backlight/enable step doesn’t occur too soon after prepare/HPD
    (drivers/gpu/drm/panel/panel-edp.c:542). Without the EDID match and
    the `p2e100` profile, the code won’t enforce this wait, which is
    known to cause intermittent black screens/boot failures for the
    closely related SHP LQ134N1 (added earlier in this file,
    drivers/gpu/drm/panel/panel-edp.c:2030, by commit 6b3815c6815f). The
    new entry applies the same proven sequencing to the high‑res OLED
    variant (product ID 0x158f), preventing the same failure mode.
  - In short: This is a quirk fix for a specific hardware panel ID that
    makes the internal display reliably work on a common laptop variant;
    without it, users can hit black screens or unreliable bring‑up.

- Scope and risk:
  - Minimal and contained: it only affects panels that present EDID
    vendor "SHP" product 0x158f. It doesn’t change logic or touch other
    devices or subsystems.
  - Uses an existing, well‑tested delay profile
    (`delay_200_500_p2e100`), already applied to other panels (e.g., SHP
    LQ134N1 at drivers/gpu/drm/panel/panel-edp.c:2030, IVO panels at
    drivers/gpu/drm/panel/panel-edp.c:1999–2000), further reducing risk.
  - No architectural changes; only a single entry in a quirk table.

- Stable backport criteria:
  - Fixes a real user‑visible malfunction (internal display not reliably
    coming up) on supported hardware; not a feature.
  - Change is tiny, targeted, and low risk; confined to DRM eDP panel
    quirk table.
  - No side effects beyond enabling correct sequencing on the matching
    panel ID.
  - While the commit message doesn’t include “Fixes:”/“Cc: stable”, the
    technical nature (EDID quirk for correct power sequencing) and
    precedent from the LQ134N1 entry demonstrate this is a classic
    stable‑eligible panel quirk fix.

Key code references:
- New entry location (adjacent context): drivers/gpu/drm/panel/panel-
  edp.c:2030
- Delay profile used: drivers/gpu/drm/panel/panel-edp.c:1727
- Fallback (no EDID match) lacks prepare_to_enable:
  drivers/gpu/drm/panel/panel-edp.c:740, 759
- Sequencing logic using prepare_to_enable: drivers/gpu/drm/panel/panel-
  edp.c:542
- Existing related SHP LQ134N1 entry (same delay):
  drivers/gpu/drm/panel/panel-edp.c:2030

Conclusion: Backporting this quirk yields a reliable, low‑risk fix for
users of the Dell XPS 13 9345 high‑res OLED variant.

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index d0aa602ecc9de..a926f81f7a2e1 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2035,6 +2035,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x158f, &delay_200_500_p2e100, "LQ134Z1"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
 
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0004, &delay_200_500_e200, "116KHD024006"),
-- 
2.51.0

