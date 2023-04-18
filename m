Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839796E5DA4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 11:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B6710E727;
	Tue, 18 Apr 2023 09:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F114A10E723
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:39:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79E9562EE2;
 Tue, 18 Apr 2023 09:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08649C433D2;
 Tue, 18 Apr 2023 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681810769;
 bh=PUiHiQI3VT7vjg61fsTlhga3kjv/W10ivkPyrIDs4Rc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eR5vEhEuRjLmXP+dmhRQ0zuHUxQZnGkF5e9sfVhYFroAQyAAetMWbmHPGddrBBoci
 jg1LyjZTv+0KlVKfD5LH/xfWW768K7c5ZibM0Jy2BPpMJ6HUG8kYKB/WtnGHDksZ4N
 ed1qurK4/4Sq3PQPxrlFyzmJIBfAGUc0XLfNpbxm63wmZxeHCC06Zy8Ae6/5X4bK2a
 Mes6+3PkEmFaJJcukHt6exMz5bV6bUdqse1Jn5ndlIyLxTXqpbtKGLrvb1QI2eEwWt
 k8MO3o3Pp4eFP0BVB5zgbq2l6schWn0kYrmCrOT1WK/oDH7YdoqjHblTmV41Vf6uYY
 QTXBx4SnhbQ5Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/10] accel/habanalabs: call to HW/FW err returns 0 when no
 events exist
Date: Tue, 18 Apr 2023 12:39:13 +0300
Message-Id: <20230418093916.2979728-7-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230418093916.2979728-1-ogabbay@kernel.org>
References: <20230418093916.2979728-1-ogabbay@kernel.org>
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
Cc: Moti Haimovski <mhaimovski@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Moti Haimovski <mhaimovski@habana.ai>

This commit modifies the call to retrieve HW or FW error events to
return success when no events are pending, as done in the calls to
other events.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/common/habanalabs_ioctl.c      | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 203ee857810c..4368e6c9a23a 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -842,15 +842,15 @@ static int hw_err_info(struct hl_fpriv *hpriv, struct hl_info_args *args)
 	struct hw_err_info *info;
 	int rc;
 
-	if ((!user_buf_size) || (!user_buf))
+	if (!user_buf)
 		return -EINVAL;
 
-	if (user_buf_size < sizeof(struct hl_info_hw_err_event))
-		return -ENOMEM;
-
 	info = &hdev->captured_err_info.hw_err;
 	if (!info->event_info_available)
-		return -ENOENT;
+		return 0;
+
+	if (user_buf_size < sizeof(struct hl_info_hw_err_event))
+		return -ENOMEM;
 
 	rc = copy_to_user(user_buf, &info->event, sizeof(struct hl_info_hw_err_event));
 	return rc ? -EFAULT : 0;
@@ -864,15 +864,15 @@ static int fw_err_info(struct hl_fpriv *hpriv, struct hl_info_args *args)
 	struct fw_err_info *info;
 	int rc;
 
-	if ((!user_buf_size) || (!user_buf))
+	if (!user_buf)
 		return -EINVAL;
 
-	if (user_buf_size < sizeof(struct hl_info_fw_err_event))
-		return -ENOMEM;
-
 	info = &hdev->captured_err_info.fw_err;
 	if (!info->event_info_available)
-		return -ENOENT;
+		return 0;
+
+	if (user_buf_size < sizeof(struct hl_info_fw_err_event))
+		return -ENOMEM;
 
 	rc = copy_to_user(user_buf, &info->event, sizeof(struct hl_info_fw_err_event));
 	return rc ? -EFAULT : 0;
-- 
2.40.0

