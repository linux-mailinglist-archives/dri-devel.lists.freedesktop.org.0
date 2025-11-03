Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72384C2C0DA
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 14:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47F210E3EC;
	Mon,  3 Nov 2025 13:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="iFYWqZGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FBB10E3E9;
 Mon,  3 Nov 2025 13:24:11 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A3CsDRk027983;
 Mon, 3 Nov 2025 13:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=A1z1GaA2ZWP2ElxKq43acmm31FDlp
 8pjuPHKdodN12Q=; b=iFYWqZGhfX/5S8A5fo4bZzrb6WX+yolY76RlLTH98Pp78
 kqdiE7q0LL8N7dBa0HnB9lxWn9N1nC9KCHdx4HeCKlPWP+IYS56NUxuYJIg7OWPl
 Wftvu0RcxmEjv+xuyoHEVdvlIRzlqfNtkatkmikx7Kgdaea32Q09XGyRvNsqOVIm
 MMlj2uw2LmhqWoWjZagIs3umv7sPPb80EPKnfA+Ox9lVbQMBkxTSGKaOiQx28k3c
 BDFLbK8vwhHXYWUs+VUOkVqS8z3LrnVyP3EyYMEYkUyo4w/THkQNyUWVnlG3BdyV
 XpsSk+EFlB0BFgiaKPqoTUVl0098opnqD8elE3ROA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a6vtcg1tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Nov 2025 13:24:07 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5A3Bu7rP015654; Mon, 3 Nov 2025 13:24:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4a58n7w1ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Nov 2025 13:24:07 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A3DO61q004131;
 Mon, 3 Nov 2025 13:24:06 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com
 [10.129.136.45])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 4a58n7w1fm-1; Mon, 03 Nov 2025 13:24:06 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH next] drm/i915/dmc: Fix extra bracket and wrong variable in
 PIPEDMC error logs
Date: Mon,  3 Nov 2025 05:23:31 -0800
Message-ID: <20251103132337.762156-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511030121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDExNyBTYWx0ZWRfX5MOq8KD9Hb/g
 c+LNvFJqjZsSDO7F7Xx3B3Jq7ve39mgAxIwhatgv4VL5Wzg/92hFX1dbiDGUnc4NbTu6XjgFqWD
 opN5p09P5fdOdSSSEPKUudXg1KO4fJsGrT/T014xTnZiTVjzerZ5aVvvEyU/otGha0uGidhkm7v
 9/TnTcCWla35IsectGkFPf7tbQAYAC8ZtS5VfvDRQZIJgUG0tWwjkEqQnmraKDuR/PAVKDQKb52
 ZYvu6SMONJ4YZYK4QLYlYVbMBQkmbVB+DLiMVK9NEoKOrQea+eWksyOjopdSuzlUnImeotfqAdn
 sh/A0dqGHJcVvX20IdSgJTZF/xB0rHG6CKCn3cB28XKBmUvwMsGA1SycrFiAeGsD6KT9QL0bBLX
 WydH5cuVrbGjY6kZzudGpdoRKoO0cQ==
X-Authority-Analysis: v=2.4 cv=K6gv3iWI c=1 sm=1 tr=0 ts=6908acf7 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=qih3M7bnp2dTq5QDXH4A:9
X-Proofpoint-ORIG-GUID: rAtryftTOSciMkoebWxwavOuBkbJ47pM
X-Proofpoint-GUID: rAtryftTOSciMkoebWxwavOuBkbJ47pM
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

Fixes two issues in intel_pipedmc_irq_handler():
- Removed an extra ']' in the PIPEDMC error and interrupt vector log.
- Corrected the interrupt vector log to print int_vector instead of tmp,
  as tmp will be zero in this case.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 0bddb20a7c86..f47b57568a75 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1712,14 +1712,14 @@ void intel_pipedmc_irq_handler(struct intel_display *display, enum pipe pipe)
 			drm_err_ratelimited(display->drm, "[CRTC:%d:%s] PIPEDMC GTT fault\n",
 					    crtc->base.base.id, crtc->base.name);
 		if (tmp & PIPEDMC_ERROR)
-			drm_err(display->drm, "[CRTC:%d:%s]] PIPEDMC error\n",
+			drm_err(display->drm, "[CRTC:%d:%s] PIPEDMC error\n",
 				crtc->base.base.id, crtc->base.name);
 	}
 
 	int_vector = intel_de_read(display, PIPEDMC_STATUS(pipe)) & PIPEDMC_INT_VECTOR_MASK;
 	if (tmp == 0 && int_vector != 0)
-		drm_err(display->drm, "[CRTC:%d:%s]] PIPEDMC interrupt vector 0x%x\n",
-			crtc->base.base.id, crtc->base.name, tmp);
+		drm_err(display->drm, "[CRTC:%d:%s] PIPEDMC interrupt vector 0x%x\n",
+			crtc->base.base.id, crtc->base.name, int_vector);
 }
 
 void intel_pipedmc_enable_event(struct intel_crtc *crtc,
-- 
2.50.1

