Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95EF7EC8BF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 17:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAFA10E0DD;
	Wed, 15 Nov 2023 16:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D476F10E114
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:39:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0A72ECE1C90;
 Wed, 15 Nov 2023 16:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D4CC433C8;
 Wed, 15 Nov 2023 16:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700066368;
 bh=exKYJcOqE7PAuCguPkuv8mAJu56vWsUJCYEBl4ctl6U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e3HR+gVGFqu0vVmFFLsLi6cHtZ8Jb2lvPyuWJmDx9KCYdiSnWppVoyrZdcX/xOoio
 xhK1BicgbAqrEjdyI8x95IuviXOVX8ZeRGn5eBjumWTtXODIuNpZkEKg17Bkr7t41Z
 mrX7Bf5mPU+j/ZbD715h7vd0Bi5lYFWNNiKSSbPSxww6r/K6+5TrcuonS8zyUmMQm8
 zMJgongjUWJsXNCMYaunSPZEUSLQKQEN3riWs111z1cFYCE0Y70TEvrLCOl1DErBaj
 Aj80uJgu2mBoCXNztCZa4TgMyls1nu2cVD4ZGZl/CQOJhp0GNEg4h6LQL7TtMDj1C8
 yDuBVdDL7I1HA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] accel/habanalabs: set hard reset flag if graceful reset
 is skipped
Date: Wed, 15 Nov 2023 18:39:09 +0200
Message-Id: <20231115163912.1243175-7-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115163912.1243175-1-ogabbay@kernel.org>
References: <20231115163912.1243175-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

hl_device_cond_reset() might be called with the hard reset flag unset,
because a compute reset upon device release as part of a graceful reset
is valid.
If the conditions for graceful reset are not met, hl_device_reset() will
be called for an immediate reset. In this case a compute reset is not
valid, so it will be replaced with a hard reset together with a debug
message about it.
This message might be confusing, as it implies that a compute reset was
requested when it shouldn't. To prevent this confusion, set the hard
reset flag in hl_device_cond_reset() if going to an immediate reset.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 6bf5f1d0d005..a365791a9f5c 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2040,7 +2040,7 @@ int hl_device_cond_reset(struct hl_device *hdev, u32 flags, u64 event_mask)
 	if (ctx)
 		hl_ctx_put(ctx);
 
-	return hl_device_reset(hdev, flags);
+	return hl_device_reset(hdev, flags | HL_DRV_RESET_HARD);
 }
 
 static void hl_notifier_event_send(struct hl_notifier_event *notifier_event, u64 event_mask)
-- 
2.34.1

