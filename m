Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87AF6C66BA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 12:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B1210E470;
	Thu, 23 Mar 2023 11:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6135E10E46E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 11:35:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2DAD62609;
 Thu, 23 Mar 2023 11:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678BFC433EF;
 Thu, 23 Mar 2023 11:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679571338;
 bh=2Btq5FdclpupmmuU4lrWKvcrkBQS9WTb8XZbGA+fXCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hln/N/hDJJhQ77vKHcjVqmNFv0l3CCTsoj23sDJ4jO13fLPrJhB6Qtf5O294R0Ije
 0GVCJT+6K56OrraPWTALwRiAkGNZGdYvh0ulKbvtNmAdOiSdSL/KFVvZj40ORfOy9r
 eQ9qo2qXkV4dmlWb8v7z5B59u/CjWTO4SxygEW2M6l3c7qnSlTbWIa/ye4Iwvou5Fg
 QJFyXBaO45Ft3v8eZdjqfsQnK/z66w4Og+WXs7m/jw8+mAFv3vPMfwXcMOqlZn02DT
 EMAR9khRgBcS431Gpg9ABwzRjUgbDgdkuJcMXZ3CLlXNXqIDEOgidP18NR16CMwPLN
 NWI78SxAB3h2w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] accel/habanalabs: remove duplicated disable pci msg
Date: Thu, 23 Mar 2023 13:35:24 +0200
Message-Id: <20230323113525.959176-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230323113525.959176-1-ogabbay@kernel.org>
References: <20230323113525.959176-1-ogabbay@kernel.org>
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
Cc: Tal Cohen <talcohen@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tal Cohen <talcohen@habana.ai>

The disable pci message is sent in reset device. It informs the FW not
to raise more EQs. The Driver may ignore received EQs, when the device
is in disabled mode.
The duplication happens when hard reset is scheduled during compute
reset and also performs 'escalate_reset_flow'.

Signed-off-by: Tal Cohen <talcohen@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 2fb1e2ec3a83..c36de13d6729 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1822,9 +1822,7 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 			dev_info(hdev->dev, "Performing hard reset scheduled during compute reset\n");
 			flags = hdev->reset_info.hard_reset_schedule_flags;
 			hdev->reset_info.hard_reset_schedule_flags = 0;
-			hdev->disabled = true;
 			hard_reset = true;
-			handle_reset_trigger(hdev, flags);
 			goto escalate_reset_flow;
 		}
 	}
-- 
2.40.0

