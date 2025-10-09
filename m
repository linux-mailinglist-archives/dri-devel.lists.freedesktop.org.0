Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD28BC9E6B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 18:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCD810EA9E;
	Thu,  9 Oct 2025 16:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VhR/Yw1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463C310EA9E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 16:00:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 859CC62378;
 Thu,  9 Oct 2025 16:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF05C4CEF7;
 Thu,  9 Oct 2025 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760025639;
 bh=4devUkiUJ45SxtTYFgo9akTiO+CNe1YAFZ2rg7soOG8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VhR/Yw1Me7FBGrHAnWdE7k+o6g4EiqvHMMTL/zTh3qh4KaKDBy/OPM5Gj349NO5Mg
 6Jg4HQwa5NN94DDQbOAWGguPUdMVxe5Jw6bWIG5AP7CUh1VUsVxfVrkJfRCym/SxOE
 fCR0OmntjhCSR69pBozkTKAMJye7Om7o/Jx1k46AZ4dCYHzsUBjq+kx7Mb8nqxLknw
 n3Jb13KbhQof5C3iSBmIZ5zC5BHuJAQgRxed3yAqUOiyCi5ezr0H8g9PWRwAer9E6x
 2tDPsk/iPsT4EOVOrtb8dvlLl8Wu0PiZuDPbvEHBl3cvs7EjrXyz67ZjfDbGZcJcIG
 atSaP9lzYgJvg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Svyatoslav Ryhel <clamor95@gmail.com>,
 "Daniel Thompson (RISCstar)" <danielt@kernel.org>,
 Lee Jones <lee@kernel.org>, Sasha Levin <sashal@kernel.org>,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17-5.4] video: backlight: lp855x_bl: Set correct
 EPROM start for LP8556
Date: Thu,  9 Oct 2025 11:55:56 -0400
Message-ID: <20251009155752.773732-90-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
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

From: Svyatoslav Ryhel <clamor95@gmail.com>

[ Upstream commit 07c7efda24453e05951fb2879f5452b720b91169 ]

According to LP8556 datasheet EPROM region starts at 0x98 so adjust value
in the driver accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: "Daniel Thompson (RISCstar)" <danielt@kernel.org>
Link: https://lore.kernel.org/r/20250909074304.92135-2-clamor95@gmail.com
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Explanation
- What changed: The LP8556 EPROM start constant is corrected from 0xA0
  to 0x98. See drivers/video/backlight/lp855x_bl.c:25 (old 0xA0; commit
  changes to 0x98). The end remains 0xAF
  (drivers/video/backlight/lp855x_bl.c:26).
- How it’s used: The valid ROM window for a given chip is enforced by
  lp855x_is_valid_rom_area(), which selects the [start, end] range based
  on chip ID and filters all ROM writes against it:
  - Range selection for LP8556 uses these macros
    (drivers/video/backlight/lp855x_bl.c:114-116).
  - The write loop applies this filter when programming platform/DT-
    provided ROM entries (drivers/video/backlight/lp855x_bl.c:193-204),
    skipping any address outside the range.
  - DT parsing populates the ROM programming list
    (drivers/video/backlight/lp855x_bl.c:342-360), so the incorrect
    start value causes any LP8556 ROM entries in 0x98–0x9F to be
    silently ignored.

Why this matters
- Functional bug for LP8556: According to the commit message (datasheet
  reference), the LP8556 ROM region begins at 0x98. With the current
  code, addresses 0x98–0x9F are wrongly rejected by
  lp855x_is_valid_rom_area(), so intended ROM configuration may not be
  applied to LP8556 devices. This can lead to misconfiguration of
  backlight behavior on boards that rely on these addresses.
- The change is strictly a correction: It expands the accepted range for
  LP8556 to the true datasheet range [0x98..0xAF]. It does not alter
  behavior for other chips (LP8550/1/2/3 use LP855X_EEPROM_START/END at
  0xA0–0xA7, and LP8555/7 use their own ranges; see
  drivers/video/backlight/lp855x_bl.c:23-24,35-38).

Risk and regression assessment
- Small, contained fix: One-line macro change in a single driver file;
  no API/ABI or architectural changes.
- Low regression risk:
  - Only affects LP8556 and only the ROM programming acceptance window.
  - In-tree DTs for LP8556 commonly use 0xA0+ (e.g.,
    arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-
    castor.dts:41), so existing configurations remain unaffected.
  - ACPI-enumerated LP8556 systems do not use ROM programming path (they
    read back registers), so they are unaffected by the range check.
  - Security impact: none; this is a correctness change to permitted I2C
    write addresses for the device’s configuration space.

Stable backport criteria
- Fixes a real bug: Corrects the ROM region mapping for LP8556 so valid
  configuration writes are no longer dropped.
- Minimal and clearly scoped: One constant change; code paths only in a
  leaf driver.
- No feature addition or architectural refactor.
- Touches a non-critical subsystem (backlight), and the behavior change
  is limited to enabling previously valid writes per datasheet.
- Reviewed-by and signed-off chain present; commit rationale is clear
  and tied to the datasheet.

Conclusion
- This is a safe, data-sheet-backed correctness fix that can affect
  actual device behavior for LP8556 users relying on 0x98–0x9F
  configuration. It is small, low risk, and appropriate for stable
  backporting.

 drivers/video/backlight/lp855x_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index 7075bfab59c4d..d191560ce285f 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -22,7 +22,7 @@
 #define LP855X_DEVICE_CTRL		0x01
 #define LP855X_EEPROM_START		0xA0
 #define LP855X_EEPROM_END		0xA7
-#define LP8556_EPROM_START		0xA0
+#define LP8556_EPROM_START		0x98
 #define LP8556_EPROM_END		0xAF
 
 /* LP8555/7 Registers */
-- 
2.51.0

