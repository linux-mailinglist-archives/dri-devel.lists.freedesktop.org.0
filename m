Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B36D69A597
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 07:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47FC10E3C9;
	Fri, 17 Feb 2023 06:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39DE10E3C7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 06:26:38 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R751e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VbrJQtt_1676615188; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VbrJQtt_1676615188) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 14:26:34 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: ogabbay@kernel.org
Subject: [PATCH] habanalabs: make some functions static
Date: Fri, 17 Feb 2023 14:26:26 +0800
Message-Id: <20230217062626.63213-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, osharabi@habana.ai,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These functions are not used outside the file device.c, so the
modification is defined as static.

drivers/accel/habanalabs/common/device.c:2641:6: warning: no previous prototype for ‘hl_capture_fw_err’.
drivers/accel/habanalabs/common/device.c:2619:6: warning: no previous prototype for ‘hl_capture_hw_err’.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4098
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/accel/habanalabs/common/device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index fefe70bbbede..a5f5ee102823 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2616,7 +2616,7 @@ void hl_handle_page_fault(struct hl_device *hdev, u64 addr, u16 eng_id, bool is_
 		*event_mask |=  HL_NOTIFIER_EVENT_PAGE_FAULT;
 }
 
-void hl_capture_hw_err(struct hl_device *hdev, u16 event_id)
+static void hl_capture_hw_err(struct hl_device *hdev, u16 event_id)
 {
 	struct hw_err_info *info = &hdev->captured_err_info.hw_err;
 
@@ -2638,7 +2638,7 @@ void hl_handle_critical_hw_err(struct hl_device *hdev, u16 event_id, u64 *event_
 		*event_mask |= HL_NOTIFIER_EVENT_CRITICL_HW_ERR;
 }
 
-void hl_capture_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *fw_info)
+static void hl_capture_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *fw_info)
 {
 	struct fw_err_info *info = &hdev->captured_err_info.fw_err;
 
-- 
2.20.1.7.g153144c

