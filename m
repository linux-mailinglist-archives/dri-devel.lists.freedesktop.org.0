Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F72770494C
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2961510E336;
	Tue, 16 May 2023 09:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3EB10E339
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8FC4636E9;
 Tue, 16 May 2023 09:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9891CC4339C;
 Tue, 16 May 2023 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684229447;
 bh=il+HC0ZxZSzt2F7rfcYd6oHKUadk7qNzRwQp6N6ewTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kFipDSMKwu/AslpEv0V9jPITFHt533U8Vok1gjZMiHIk0JMpJUTvLT6Hd6szPqQ0o
 O5A2AyKyOBMoCQZ5Kv0rfH/BqzsQNTj++Wk/vF1RhGY5aD9ePf8YfsxahlGr+xjz88
 KYEJ0cG6bIzWlDvjLBNiaFwfE9X14qKIVGnCKfvQOm/TWP4T7n+tjGyRu8rQpEi2Vl
 gesm7tnkPodQVxnMzqt0gP1U2QPzUUedTHllrAGbqfw19SCVG8tx7xsLpq36XKAqbp
 ogEGzHX1/y2+LPq1kzfgmo2OtfZ9i5dLq+jraIwHCnaDhITjks18pIY08LHiUKGjyg
 PU+xSq0IeVyKA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/12] accel/habanalabs: use lower QM in QM errors handling
Date: Tue, 16 May 2023 12:30:27 +0300
Message-Id: <20230516093030.1220526-9-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

The QMAN GLBL_ERR_STS_4 register has indications for errors also in the
lower CQ and the ARC CQ, and not just for errors in the lower CP.
Modify the relevant define/struct and the related print to use "lower
QM" instead of "lower CP".

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index a6aa17d86820..6e2561ead546 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -57,7 +57,7 @@
 
 #define GAUDI2_NA_EVENT_CAUSE			0xFF
 #define GAUDI2_NUM_OF_QM_ERR_CAUSE		18
-#define GAUDI2_NUM_OF_QM_LCP_ERR_CAUSE		25
+#define GAUDI2_NUM_OF_LOWER_QM_ERR_CAUSE	25
 #define GAUDI2_NUM_OF_QM_ARB_ERR_CAUSE		3
 #define GAUDI2_NUM_OF_ARC_SEI_ERR_CAUSE		14
 #define GAUDI2_NUM_OF_CPU_SEI_ERR_CAUSE		3
@@ -801,7 +801,7 @@ static const char * const gaudi2_qman_error_cause[GAUDI2_NUM_OF_QM_ERR_CAUSE] =
 	"PQC L2H error"
 };
 
-static const char * const gaudi2_qman_lower_cp_error_cause[GAUDI2_NUM_OF_QM_LCP_ERR_CAUSE] = {
+static const char * const gaudi2_lower_qman_error_cause[GAUDI2_NUM_OF_LOWER_QM_ERR_CAUSE] = {
 	"RSVD0",
 	"CQ AXI HBW error",
 	"CP AXI HBW error",
@@ -7895,8 +7895,8 @@ static int gaudi2_handle_qman_err_generic(struct hl_device *hdev, u16 event_type
 			continue;
 
 		if (i == QMAN_STREAMS) {
-			snprintf(reg_desc, ARRAY_SIZE(reg_desc), "LowerCP");
-			num_error_causes = GAUDI2_NUM_OF_QM_LCP_ERR_CAUSE;
+			snprintf(reg_desc, ARRAY_SIZE(reg_desc), "LowerQM");
+			num_error_causes = GAUDI2_NUM_OF_LOWER_QM_ERR_CAUSE;
 		} else {
 			snprintf(reg_desc, ARRAY_SIZE(reg_desc), "stream%u", i);
 			num_error_causes = GAUDI2_NUM_OF_QM_ERR_CAUSE;
@@ -7907,7 +7907,7 @@ static int gaudi2_handle_qman_err_generic(struct hl_device *hdev, u16 event_type
 				gaudi2_print_event(hdev, event_type, true,
 					"%s. err cause: %s", reg_desc,
 					i == QMAN_STREAMS ?
-					gaudi2_qman_lower_cp_error_cause[j] :
+					gaudi2_lower_qman_error_cause[j] :
 					gaudi2_qman_error_cause[j]);
 				error_count++;
 			}
-- 
2.40.1

