Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5D8CFF75
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 13:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB3310EBB3;
	Mon, 27 May 2024 11:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="kksWOI0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 630 seconds by postgrey-1.36 at gabe;
 Mon, 27 May 2024 11:58:36 UTC
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360E210E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 11:58:35 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716810492; bh=pXheFYeAWfi+J/oHigZFL4ImqWPHDuO3tD3An/fuwbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kksWOI0+lODuu7gon+aY5FVIRM6zlYgSD/dXWUpWYaF5BKIMaW/A0N0nM1CdejpMa
 obTxpSrIYEkJToFjUfEipDx+gFGVs+pWfCwrTrOimwiwPQsmlQPa50ATEerFn+KZ/v
 jEfxbCtPftQ7WGRfIHmDLNjAScPRWrJin/ARvnSymg+7uvIqpsu/90n/pVHN5Vu2gj
 9s483rN/xP0CqlUFEDqiJwchacB3glQhpns4rXESAH7gix6B//PKMu/7y0HLmlYiM3
 h5kyEPO6B5Ub31+0znDFn3IlAA/u//ZMdr95YIOaQ7xmusqpLqUxez/BSZexGTNGXl
 sEEj2W6VRWuGw==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RBltNl1919357; Mon, 27 May 2024 14:47:55 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Tal Risin <trisin@habana.ai>
Subject: [PATCH 7/9] accel/habanalabs: expose server type in debugfs
Date: Mon, 27 May 2024 14:47:44 +0300
Message-Id: <20240527114746.1919292-7-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527114746.1919292-1-obitton@habana.ai>
References: <20240527114746.1919292-1-obitton@habana.ai>
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

From: Tal Risin <trisin@habana.ai>

Exposing server type through debugfs to enable easier access via
scripts.

Signed-off-by: Tal Risin <trisin@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 Documentation/ABI/testing/debugfs-driver-habanalabs | 6 ++++++
 drivers/accel/habanalabs/common/debugfs.c           | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/ABI/testing/debugfs-driver-habanalabs b/Documentation/ABI/testing/debugfs-driver-habanalabs
index a7a432dc4015..efbb78bedb8b 100644
--- a/Documentation/ABI/testing/debugfs-driver-habanalabs
+++ b/Documentation/ABI/testing/debugfs-driver-habanalabs
@@ -253,6 +253,12 @@ Description:    Triggers dump of monitor data. The value to trigger the operatio
                 When the write is finished, the user can read the "monitor_dump"
                 blob
 
+What:           /sys/kernel/debug/accel/<parent_device>/server_type
+Date:           Feb 2024
+KernelVersion:  6.11
+Contact:        trisin@habana.ai
+Description:    Exposes the device's server type, maps to enum hl_server_type.
+
 What:           /sys/kernel/debug/accel/<parent_device>/set_power_state
 Date:           Jan 2019
 KernelVersion:  5.1
diff --git a/drivers/accel/habanalabs/common/debugfs.c b/drivers/accel/habanalabs/common/debugfs.c
index de3ae2e47ec4..ca7677293a55 100644
--- a/drivers/accel/habanalabs/common/debugfs.c
+++ b/drivers/accel/habanalabs/common/debugfs.c
@@ -1717,6 +1717,11 @@ static void add_files_to_device(struct hl_device *hdev, struct hl_dbg_device_ent
 				root,
 				&hdev->device_release_watchdog_timeout_sec);
 
+	debugfs_create_u16("server_type",
+				0444,
+				root,
+				&hdev->asic_prop.server_type);
+
 	for (i = 0, entry = dev_entry->entry_arr ; i < count ; i++, entry++) {
 		debugfs_create_file(hl_debugfs_list[i].name,
 					0644,
-- 
2.34.1

