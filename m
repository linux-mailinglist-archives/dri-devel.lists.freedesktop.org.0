Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FD9A8A7B3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 21:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8860410E157;
	Tue, 15 Apr 2025 19:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RfayyldT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A50B10E157
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 19:21:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E493843724;
 Tue, 15 Apr 2025 19:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CA2C4CEE7;
 Tue, 15 Apr 2025 19:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744744878;
 bh=F5rxfM3HBLUV9EsAxVV/S4HyqTLHIQEFX/F0OYm1roM=;
 h=From:To:Cc:Subject:Date:From;
 b=RfayyldTLQ3AiSG7wBs1u9VQtB/NvlkiJtFzyWd6WUieFliywLuEfjixuHf+XenBH
 eJnbSdi/jbumAr6s5a/MhlWehWvSYp+387pYWgPN4U4qwZ5LCDCSKsFBqrVM13ZJmD
 YVuEhK99NnCc1sGFcnWlenwQPPIwFeQ9Ow9P7aNubQ0hs/NiijrRRvLtAaGkSb3JqS
 oLvqUfH6K8BupI/Qt2vhFeZx2FI+r7bRkzZx+bKLT6LVaLocvXoYE7muU7SwY5svjW
 VjI5T0M+tQ5/YsGlPvAGSkZ1fzHZdcBj/KID0+d5vB2bTuBdfly74lUYM5tnUFabwi
 5Do/PGAIN0fUw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com, lee@kernel.org, danielt@kernel.org,
 jingoohan1@gmail.com
Cc: Lennart Poettering <lennart@poettering.net>,
 richard.purdie@linuxfoundation.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] docs: backlight: Clarify `actual_brightness`
Date: Tue, 15 Apr 2025 14:20:59 -0500
Message-ID: <20250415192101.2033518-1-superm1@kernel.org>
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

Cc: Lee Jones <lee@kernel.org>
Cc: Lennart Poettering <lennart@poettering.net>
Cc: richard.purdie@linuxfoundation.org
Link: https://github.com/systemd/systemd/pull/36881
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2:
 * Add more explanation
---
 Documentation/ABI/stable/sysfs-class-backlight | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-class-backlight b/Documentation/ABI/stable/sysfs-class-backlight
index 6102d6bebdf9a..40b8c46b95b28 100644
--- a/Documentation/ABI/stable/sysfs-class-backlight
+++ b/Documentation/ABI/stable/sysfs-class-backlight
@@ -26,7 +26,12 @@ Date:		March 2006
 KernelVersion:	2.6.17
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
-		Show the actual brightness by querying the hardware.
+		Show the actual brightness by querying the hardware. Due
+		to implementation differences in hardware this may not
+		match the value in 'brightness'. For example some hardware
+		may treat blanking differently or have custom power saving
+		features. Userspace should generally use the values in
+		'brightness' to make decisions.
 Users:		HAL
 
 What:		/sys/class/backlight/<backlight>/max_brightness
-- 
2.43.0

