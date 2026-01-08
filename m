Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98976D023B8
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB3C10E6EA;
	Thu,  8 Jan 2026 10:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="yACcWxr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1543 seconds by postgrey-1.36 at gabe;
 Thu, 08 Jan 2026 04:37:04 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C0010E10A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 04:37:04 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6084B5a82834324; Thu, 8 Jan 2026 04:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=XNBM+2BM64axn3wd5Y05TDD
 ja4vEtb8RxR+cfIqA3sI=; b=yACcWxr766j2gTOxjm6hO7uRQlumTLYuR8ZP79Q
 HmuYEoty4qlxQ/F7xwTdd2cb5drzSE9hAspxJXkb0E8CAZgfflR8DjOwqyqrodj1
 /C0JQnXNbvaUTOT6PTGl9jASdzX2yrl7fjoZbJmTVwvHUQWcXJfTSnBXxtdfbKfB
 MhsLnqcab01eucunA1FkoOSRwM6VFNzYZmiMRb01kDx74+PA7cWBr51+StAW/uOU
 G3prbWEGHV5B06bfO6FDhUUR5HFNWH+5dHf2VYEaDwbI52cutLT9HTDkrzsbMH70
 75OZEPXj8Wx/zVYYZgah99cpXyDIaAZDSbUxzPgyT95hsJA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4bet8sav9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jan 2026 04:11:05 +0000 (GMT)
Received: from NP-G-BRAJESH.pu.imgtec.org (172.25.128.95) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 04:11:01 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
To: <frank.binns@imgtec.com>, <matt.coster@imgtec.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <alessio.belle@imgtec.com>, <alexandru.dadu@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/imagination: Wait for FW trace update command completion
Date: Thu, 8 Jan 2026 04:09:36 +0000
Message-ID: <20260108040936.129769-1-brajesh.gupta@imgtec.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.128.95]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAyNCBTYWx0ZWRfX0+Z5vitpi1PS
 CdA6QGEI7Yp+JFttvRjeop6HyOZ/vUis+tuIkpWJnTnvdNYIh60hzglrcrAQsCH69lxKqO/nEBZ
 /tp5zQYmOntPpijRhXI4Vc26gXBvwDgXiSq+gOT2jmvdBknp7Kbu8Ovv/wOpUG2MUG6OHn58/Gh
 f13y55VysAeP/Mm1I4Eqy6PefB0Qq5M1tToU2ShP5SscQeoAVkPK+Ax+WfXDKiZQCau++RgjGni
 CZEzG8lxhW5IkAS/O7ZtqpMZaMcentKAn09NN4WmHPtSMKxlBp0G3XFg4YYL9Un7MCNquIVhsPT
 PCc4/MShQoY9tqKOoKq0pfvVTLjI1LpigCEzWnpxDm7uFq1uhi5c2r1e2vMshFHyMmpTBrIsFDP
 8y+3EkVySbHbn0YSVaO0L9ro5kSaCXVN3rvvQom9fHDOgE0Ouk88ox6G/6se6Opo6vzNxJE2xL5
 k+ZVNnq2hMEyvgCVf+g==
X-Proofpoint-ORIG-GUID: 4oWDftSg7GuQBk7bNMBs8AzoBXqiDn_3
X-Authority-Analysis: v=2.4 cv=LPFrgZW9 c=1 sm=1 tr=0 ts=695f2e59 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=pAaLEEKUjL4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=r_1tXGB3AAAA:8 a=3oOJLAxtiLN628aBsBcA:9 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 4oWDftSg7GuQBk7bNMBs8AzoBXqiDn_3
X-Mailman-Approved-At: Thu, 08 Jan 2026 10:56:33 +0000
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

Possibility of no FW trace available after update in the fw_trace_mask due
to asynchronous mode of command consumption in the FW.

To ensure FW trace is available after update, wait for FW trace log update
command completion from the FW.

Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructure and META FW support")
Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 8a56952f6730..99d681413eff 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -137,6 +137,7 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
 	struct rogue_fwif_kccb_cmd cmd;
 	int idx;
 	int err;
+	int slot;
 
 	if (group_mask)
 		fw_trace->tracebuf_ctrl->log_type = ROGUE_FWIF_LOG_TYPE_TRACE | group_mask;
@@ -154,8 +155,13 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
 	cmd.cmd_type = ROGUE_FWIF_KCCB_CMD_LOGTYPE_UPDATE;
 	cmd.kccb_flags = 0;
 
-	err = pvr_kccb_send_cmd(pvr_dev, &cmd, NULL);
+	err = pvr_kccb_send_cmd(pvr_dev, &cmd, &slot);
+	if (err)
+		goto err_drm_dev_exit;
+
+	err = pvr_kccb_wait_for_completion(pvr_dev, slot, HZ, NULL);
 
+err_drm_dev_exit:
 	drm_dev_exit(idx);
 
 err_up_read:
-- 
2.43.0

