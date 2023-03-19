Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3772F6C006A
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 10:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B502710E190;
	Sun, 19 Mar 2023 09:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F46210E4FF
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 09:42:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 950F9B80ABB;
 Sun, 19 Mar 2023 09:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C21C433D2;
 Sun, 19 Mar 2023 09:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679218918;
 bh=bZW6NPF9tLxgdniZrunItrckv0PG+8qNhNPTEYRAmcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pezC8DzBIGYg50O5hlE4earaK0ApsrxB2/2JMUNMh1n1j9s0djKbm63FbYmRJ2hqe
 yynJBDOY1dVMw/plj+YS7utb28kF+bM3S2ffGCGf7RbOpxkMPAq5HN3GwiRww4Lxjs
 6XEBdhWoPoLnV5l73b3QO8KEdRo3F4Q+VbWMOSVpk0HeExS8kQdYEuDeNscNCK44iE
 MLl0HAkV4Fq15Mg6xUFN9ft3mK/JSv7a1Z4eezhjjcg/vEMXF9eMICi1brQtTwKv9S
 bdcncSOZAR5Z04ovdnYEyFVzgmYqHuLAPPnVCx8zfDfxyilHcbGIWvfPd44mlK2jPI
 GcCDtMbvKZa9w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] accel/habanalabs: fix a maybe-uninitialized compilation
 warnings
Date: Sun, 19 Mar 2023 11:41:48 +0200
Message-Id: <20230319094148.680750-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230319094148.680750-1-ogabbay@kernel.org>
References: <20230319094148.680750-1-ogabbay@kernel.org>
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

Initialize 'index' in gaudi2_handle_qman_err() and 'offset' in
gaudi2_get_nic_idle_status() to avoid "maybe-uninitialized" compilation
warnings.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 9e4ef22c5fb2..40563e29be8d 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -6997,7 +6997,7 @@ static bool gaudi2_get_nic_idle_status(struct hl_device *hdev, u64 *mask_arr, u8
 	u32 qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts;
 	bool is_idle = true, is_eng_idle;
 	int engine_idx, i;
-	u64 offset;
+	u64 offset = 0;
 
 	/* NIC, twelve macros in Full chip */
 	if (e && hdev->nic_ports_mask)
@@ -8349,7 +8349,7 @@ static int gaudi2_handle_qman_err(struct hl_device *hdev, u16 event_type, u64 *e
 {
 	u32 qid_base, error_count = 0;
 	u64 qman_base;
-	u8 index;
+	u8 index = 0;
 
 	switch (event_type) {
 	case GAUDI2_EVENT_TPC0_QM ... GAUDI2_EVENT_TPC5_QM:
-- 
2.40.0

