Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D2C70494B
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879AA10E334;
	Tue, 16 May 2023 09:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DB010E330
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6F8F61943;
 Tue, 16 May 2023 09:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1118DC433EF;
 Tue, 16 May 2023 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684229439;
 bh=6ZyyFG8mV1jRJa4Pov4WC5PWy4ci9vNqitLnGgu2V3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YqgswFze4JQJ4q2shN+4+ItTAtVCZw4bYPdHh4P11eb6RYLBhnG1FigN1HmnNXlFf
 RDjrXpDTBSepY9QsjVZ22BsQkKDUtXp4APddFHYZrZrI7yt/6lCMd5hTH/kIK2GR3I
 yWr84OeN5LcF1xRblUzQKM7SKSXswFE9QBk0Yt4l4MuxpgEXvXpV61SyryrazKxtE6
 OT8a6xzd/GHPfXJRfrZiM+WwvGOczmn/vBT2pzEzzDIk5TzxflByZdEd6zD/5oHhQg
 zLQjwvqc8lSu6RfNlE+osPjkMTQeTqf0/Gb8COoXwUyuJ7Ao4zcsmIwW6o7vqv/HLG
 Fo1L5mnNIAtSA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/12] accel/habanalabs: fix mem leak in capture user mappings
Date: Tue, 16 May 2023 12:30:21 +0300
Message-Id: <20230516093030.1220526-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516093030.1220526-1-ogabbay@kernel.org>
References: <20230516093030.1220526-1-ogabbay@kernel.org>
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
Cc: Moti Haimovski <mhaimovski@habana.ai>, Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Moti Haimovski <mhaimovski@habana.ai>

This commit fixes a memory leak caused when clearing the user_mappings
info when a new context is opened immediately after user_mapping is
captured and a hard reset is performed.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
Reviewed-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index 1ec97da3dddb..70fb2df9a93b 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -13,6 +13,7 @@
 
 #include <linux/pci.h>
 #include <linux/module.h>
+#include <linux/vmalloc.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/habanalabs.h>
@@ -218,6 +219,7 @@ int hl_device_open(struct inode *inode, struct file *filp)
 
 	hl_debugfs_add_file(hpriv);
 
+	vfree(hdev->captured_err_info.page_fault_info.user_mappings);
 	memset(&hdev->captured_err_info, 0, sizeof(hdev->captured_err_info));
 	atomic_set(&hdev->captured_err_info.cs_timeout.write_enable, 1);
 	hdev->captured_err_info.undef_opcode.write_enable = true;
-- 
2.40.1

