Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED4185C080
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202A810E4CC;
	Tue, 20 Feb 2024 16:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NEXRpdpG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E94710E4D0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 19C75611E0;
 Tue, 20 Feb 2024 16:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3ADBC43399;
 Tue, 20 Feb 2024 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444902;
 bh=kXLVhT3LdweT4J+K9+WVLoauc3wapckO+u2vZBKTH68=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NEXRpdpGH6MwA92FWbpu3Y3VQUFDBGgA4ilODS2marXJyfiJ4FT1OqQBbkNPifnSR
 u1ztKFlbnfZfDdofPn+hDNBM/Uxrrfg9KognQYKMXKsBMuXgjdWaeKmUBoc3q32u/b
 bomZwwROb6UODcN6H2KpMVkinuW+2ZqmwpiJsb69LY7e3D57peVRoToXBliILggDjg
 g5DKJB+YSCzjEM6EgZoatMot49EVAAtvisAv3fSYB/n+4WZe58oG2yQ6Z8v+7XX6jJ
 MxTpSA2jbyQMBwjByjf1SHjpej8ySkraSpaOlLBDwv1VyPebU5XrCUukEp/veJsBDm
 F5b3pFS0hhkUw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Avri Kehat <akehat@habana.ai>
Subject: [PATCH 06/13] accel/habanalabs: fix debugfs files permissions
Date: Tue, 20 Feb 2024 18:01:22 +0200
Message-Id: <20240220160129.909714-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220160129.909714-1-ogabbay@kernel.org>
References: <20240220160129.909714-1-ogabbay@kernel.org>
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

From: Avri Kehat <akehat@habana.ai>

debugfs files are created with permissions that don't align
with the access requirements.

Signed-off-by: Avri Kehat <akehat@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/debugfs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/common/debugfs.c b/drivers/accel/habanalabs/common/debugfs.c
index 01f071d52570..ab0fe74b49d0 100644
--- a/drivers/accel/habanalabs/common/debugfs.c
+++ b/drivers/accel/habanalabs/common/debugfs.c
@@ -1643,19 +1643,19 @@ static void add_files_to_device(struct hl_device *hdev, struct hl_dbg_device_ent
 				&hl_data64b_fops);
 
 	debugfs_create_file("set_power_state",
-				0200,
+				0644,
 				root,
 				dev_entry,
 				&hl_power_fops);
 
 	debugfs_create_file("device",
-				0200,
+				0644,
 				root,
 				dev_entry,
 				&hl_device_fops);
 
 	debugfs_create_file("clk_gate",
-				0200,
+				0644,
 				root,
 				dev_entry,
 				&hl_clk_gate_fops);
@@ -1667,13 +1667,13 @@ static void add_files_to_device(struct hl_device *hdev, struct hl_dbg_device_ent
 				&hl_stop_on_err_fops);
 
 	debugfs_create_file("dump_security_violations",
-				0644,
+				0400,
 				root,
 				dev_entry,
 				&hl_security_violations_fops);
 
 	debugfs_create_file("dump_razwi_events",
-				0644,
+				0400,
 				root,
 				dev_entry,
 				&hl_razwi_check_fops);
@@ -1706,7 +1706,7 @@ static void add_files_to_device(struct hl_device *hdev, struct hl_dbg_device_ent
 				&hdev->reset_info.skip_reset_on_timeout);
 
 	debugfs_create_file("state_dump",
-				0600,
+				0644,
 				root,
 				dev_entry,
 				&hl_state_dump_fops);
@@ -1724,7 +1724,7 @@ static void add_files_to_device(struct hl_device *hdev, struct hl_dbg_device_ent
 
 	for (i = 0, entry = dev_entry->entry_arr ; i < count ; i++, entry++) {
 		debugfs_create_file(hl_debugfs_list[i].name,
-					0444,
+					0644,
 					root,
 					entry,
 					&hl_debugfs_fops);
-- 
2.34.1

