Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBEF75E65B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779A710E221;
	Mon, 24 Jul 2023 01:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006C510E221
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 01:18:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F31360F02;
 Mon, 24 Jul 2023 01:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E123EC433C7;
 Mon, 24 Jul 2023 01:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161517;
 bh=Gm7xMPFN6RJVQ+Wp6OwKlm6mqZ19x2ksKi4VSKNYyFk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m8haTTgwnKbs/GeUkvRYMRYmlPVTzngCPso7ejazfr2JnadFzn0xRFZFv/i1TyAp1
 en+X50i/+MMCgZyGp1JEnWwyGK5n2Jw5YMyw+7KLCW4nu1RNn0UfLLw31a8IFi+Dm1
 tvqtiimp1HejkbgabEUvayUA0xHbEFY4QhxjZtpPMm4Os7Cg0TQMZZHpdi5mWNN5Cq
 NqDKAbHcS790z3MLVkTphlgTwlSxoaYiEsf6OnW0kCBuWUfUtlYvX4DWzsMMsbGeOw
 KT6EuP2iU/wvYpVXQOmf2KVsmuzRy3Rkq0U9Og3aAtTVhub865ez9UHmiNHsvvakvq
 Jxt1fnAidxapg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 32/58] accel/habanalabs: fix mem leak in capture
 user mappings
Date: Sun, 23 Jul 2023 21:13:00 -0400
Message-Id: <20230724011338.2298062-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
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
Cc: Sasha Levin <sashal@kernel.org>, kelbaz@habana.ai,
 Oded Gabbay <ogabbay@kernel.org>, Dani Liberman <dliberman@habana.ai>,
 dri-devel@lists.freedesktop.org, ttayar@habana.ai,
 Moti Haimovski <mhaimovski@habana.ai>, obitton@habana.ai
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Moti Haimovski <mhaimovski@habana.ai>

[ Upstream commit 314a7ffd7c196b27eedd50cb7553029e17789b55 ]

This commit fixes a memory leak caused when clearing the user_mappings
info when a new context is opened immediately after user_mapping is
captured and a hard reset is performed.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
Reviewed-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index 1ec97da3dddb8..70fb2df9a93b8 100644
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
2.39.2

