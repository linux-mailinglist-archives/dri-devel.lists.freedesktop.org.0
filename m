Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766947EC8BB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 17:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD0D10E264;
	Wed, 15 Nov 2023 16:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734DE10E116
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:39:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 90959B81A67;
 Wed, 15 Nov 2023 16:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF136C433C8;
 Wed, 15 Nov 2023 16:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700066364;
 bh=gfk8zALZbdkLMNgU9Gvg6x8rMFGs5nttVZo1WOrF8z4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y1sPNITGGaeCwOfznhyoXmKJGEFd0tZ++yksjkpidz9p2R/pI7A2/vyZIT56zhhQl
 H2Zu9ECdXB+0ViFFD6rL81ZhRKBUQZyPJH+TRGJd0uykgthPOEZQoH4pkqwp1OgRO8
 eYlBs17wIOYFJLxu3w1XbQdFeHSizwRRIevYRVRgGJ//mZ4V8jxK8KU7JV/vsSeZTb
 URJPS9RZMjJLmAgylqCEozfgTL0d/2w3DOcTaTRb/MK3jaEUlXJkdguHa2E+ZApntr
 tMVIhYfRW36fi9h6gfZaDTvrREzef+uaBCG6JSDvqYshritwA52uQ5OjRT9PMK+uf9
 VCIgX3hpVyDsQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] accel/habanalabs/gaudi2: fix undef opcode reporting
Date: Wed, 15 Nov 2023 18:39:07 +0200
Message-Id: <20231115163912.1243175-5-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

currently the undefined opcode event bit in set only for lower cp and
only if 'write_enable' is true. It should be set anyway and for all
streams in order to report that event to userspace.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index b739078c2d87..5075f92d15cc 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -7929,21 +7929,19 @@ static int gaudi2_handle_qman_err_generic(struct hl_device *hdev, u16 event_type
 				error_count++;
 			}
 
-		if (i == QMAN_STREAMS && error_count) {
-			/* check for undefined opcode */
-			if (glbl_sts_val & PDMA0_QM_GLBL_ERR_STS_CP_UNDEF_CMD_ERR_MASK &&
-					hdev->captured_err_info.undef_opcode.write_enable) {
+		/* check for undefined opcode */
+		if (glbl_sts_val & PDMA0_QM_GLBL_ERR_STS_CP_UNDEF_CMD_ERR_MASK) {
+			*event_mask |= HL_NOTIFIER_EVENT_UNDEFINED_OPCODE;
+			if (hdev->captured_err_info.undef_opcode.write_enable) {
 				memset(&hdev->captured_err_info.undef_opcode, 0,
 						sizeof(hdev->captured_err_info.undef_opcode));
-
-				hdev->captured_err_info.undef_opcode.write_enable = false;
 				hdev->captured_err_info.undef_opcode.timestamp = ktime_get();
 				hdev->captured_err_info.undef_opcode.engine_id =
 							gaudi2_queue_id_to_engine_id[qid_base];
-				*event_mask |= HL_NOTIFIER_EVENT_UNDEFINED_OPCODE;
 			}
 
-			handle_lower_qman_data_on_err(hdev, qman_base, *event_mask);
+			if (i == QMAN_STREAMS)
+				handle_lower_qman_data_on_err(hdev, qman_base, *event_mask);
 		}
 	}
 
-- 
2.34.1

