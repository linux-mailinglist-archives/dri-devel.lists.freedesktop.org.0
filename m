Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DACDA815C5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 21:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BC310E283;
	Tue,  8 Apr 2025 19:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LRm0gUHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E2E10E283
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 19:27:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 47579451A1;
 Tue,  8 Apr 2025 19:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182EDC4CEE5;
 Tue,  8 Apr 2025 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744140461;
 bh=1nJbBDFh6oitUst+PBO9XClnNvX8SJl/gbJ4B7oS8wM=;
 h=From:To:Cc:Subject:Date:From;
 b=LRm0gUHHhLBoNfRJaYuqHacI8HdGAQ6ymvgxS5NRfprxFQaX/TJvYVYNspc0R88u9
 a4tVowMx1OVGGPKnlR5bUs4Bw79hBoVaiLyKj5AXqW75lpnCdA1hfjbJwpmz12ziKx
 qYzaLkRGxvNwGAh0vW71RdyG4ThsPrT69CZdwwW2CpEH2DFhx0V+25agijfnGzaDau
 eTD9+3QRimifJdbTjddf/YEpnXoylzN49P8kRAW0TBYtsuK8LPxWlByeSsPzHqqaS0
 VZXDcw0NpDlNDFNQ4W0Oyf8G1mlAZa6lv909n0hHHfBBq/aRlv4vb0RTNUTlxed7gF
 eBOwYZEQa4Lbg==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com, lee@kernel.org, danielt@kernel.org,
 jingoohan1@gmail.com
Cc: Lennart Poettering <lennart@poettering.net>,
 richard.purdie@linuxfoundation.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] docs: backlight: Clarify `actual_brightness`
Date: Tue,  8 Apr 2025 14:27:28 -0500
Message-ID: <20250408192729.4091391-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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

From: Mario Limonciello <mario.limonciello@amd.com>

Currently userspace software systemd treats `brightness` and
`actual_brightness` identically due to a bug found in an out of tree
driver.

This however causes problems for in-tree drivers that use brightness
to report user requested `brightness` and `actual_brightness` to report
what the hardware actually has programmed.

Clarify the documentation to match the behavior described in commit
6ca017658b1f9 ("[PATCH] backlight: Backlight Class Improvements").

Cc: Lennart Poettering <lennart@poettering.net>
Cc: richard.purdie@linuxfoundation.org
Link: https://github.com/systemd/systemd/pull/36881
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 Documentation/ABI/stable/sysfs-class-backlight | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-class-backlight b/Documentation/ABI/stable/sysfs-class-backlight
index 6102d6bebdf9a..909cacde85041 100644
--- a/Documentation/ABI/stable/sysfs-class-backlight
+++ b/Documentation/ABI/stable/sysfs-class-backlight
@@ -26,7 +26,9 @@ Date:		March 2006
 KernelVersion:	2.6.17
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
-		Show the actual brightness by querying the hardware.
+		Show the actual brightness by querying the hardware. This
+		takes into account other factors besides the value programmed
+		for 'brightness' and may not match the value in 'brightness'.
 Users:		HAL
 
 What:		/sys/class/backlight/<backlight>/max_brightness
-- 
2.43.0

