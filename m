Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EABC266B4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 18:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEA810EC00;
	Fri, 31 Oct 2025 17:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJ4UJlqH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B9E10EC00
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 17:42:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59VAX3XO102630; Fri, 31 Oct 2025 17:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=OEZaO+IunlOXbDj3Rn35BX/vSjqNpc3pPE+
 Gx3Z+03E=; b=cJ4UJlqHBp1Ll+5x2CRRU4VdrUxWn2zqi0a/vuGCsQeUcHl58Yw
 ZVcJzOsCIsPRZfe4+tN68eOEGpN/18PO38QbIeJHXP798adlowIL+vTCGU9sBZe1
 RlUbg73MxoDLPXtn1D28zoXD53QIjwxNW0cXEU3w8aVicqpKviLSAxEbBl2B61tR
 le+8mZluvsbGHXAh75eEV5WTcT4KmQxWVrD1fbU7MHXUM1o4CIkd3vCrHmhnCfCw
 HSp9Bzc5iUrLT1BxdVr6dJpkk6LOfB+FNs7L4g9tJtORdow62IW73jh5B9bd9Px9
 n0mNoUa4oKqFrt+n+mVUPWCd/EOaY7xZffg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdm0jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 17:42:02 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59VHdY8F012751; 
 Fri, 31 Oct 2025 17:42:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4a4er42upx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 17:42:00 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59VHfxbB016244;
 Fri, 31 Oct 2025 17:42:00 GMT
Received: from hu-devc-lv-u22-a.qualcomm.com (hu-zmckevit-lv.qualcomm.com
 [10.81.26.129])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 59VHfxIF016239
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 17:41:59 +0000
Received: by hu-devc-lv-u22-a.qualcomm.com (Postfix, from userid 4696302)
 id 205E95B6; Fri, 31 Oct 2025 10:42:00 -0700 (PDT)
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson@kernel.org, Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Subject: [PATCH v3 0/3] accel/qaic: Add Sub-system restart (SSR)
Date: Fri, 31 Oct 2025 10:40:58 -0700
Message-Id: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE1OCBTYWx0ZWRfXxspaFEPWdnv3
 ZSNSNyba/Kktd4eO3vB0aHajwCJPjmNkEigrTAZUBTk4LqIpkNCv3+EYwbfPr4YYTWu8dM7vQ1b
 9wSHS5+3nKlel6ZQc4Jdu4Xr56VzK5WDIa3Qc51IAGVkuCljUt6zdcQMOQvTkF9E5DZwIAIk+uX
 vIu5ucnHXgm+ppLZjjTlhDj0Wz/NnHyfrTA9gRqLGXmxgouPm2tv+60CBvIjoXsI0cyVQRa/xgT
 R57TTU0fo1/zCnX2eGzXCTGpBOeCawRmHf7c+Ftn/tedEPvIZ5TqvKs6ec97FC/OxxUgIMf6+Iw
 51pt0blci//JEVkLO3rNXxjAsRRp5WhfKJwtffkHAOvwgTHbG3tjxhhQM6dt+vUrFBemdsa0zd1
 AtaOXMF6KUDXiQFBzlMk/cLZRVWhwg==
X-Proofpoint-GUID: T-kQBTpb_DY2pnnw8dnS-md4zV9BbhUy
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6904f4ea cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jgwv8dc2b0OPOJmP1f4A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: T-kQBTpb_DY2pnnw8dnS-md4zV9BbhUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310158
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

SSR is a feature that mitigates a crash in device sub-system. Usually,
after a workload (using a sub-system) has crashed on the device, the
entire device crashes affecting all the workloads on device.
SSR is used to limit the damage only to that particular workload and
releases the resources used by it, leaving the decision to the user.
Applications are informed when SSR starts and ends via udev notifications.
All ongoing requests for that particular workload will be lost.

During SSR the affected DBC changes state as follows:
DBC_STATE_BEFORE_SHUTDOWN
DBC_STATE_AFTER_SHUTDOWN
DBC_STATE_BEFORE_POWER_UP
DBC_STATE_AFTER_POWER_UP

In addition to supporting the sub-system to recover from a crash, the
device can optionally use SSR to send a crashdump.

---
Changes in v3:
- Add qaic_/QAIC_ prefixes to necessary functions and macros.
- Use #define for ssr_cmds and ssr_events instead of enum.
- Remove drm_device.h include from qaic_ssr.h.
- Remove struct drm_device parameter from qaic_ssr_init (moved to patch 3).
- Move internal struct definitions to patch 3.
- Rename MSG_BUF_SZ -> SSR_RESP_MSG_SZ.
- Link to v2: https://lore.kernel.org/all/20251024164630.816862-1-youssef.abdulrahman@oss.qualcomm.com/

Changes in v2:
- Use scnprintf() in qaic_sysfs.c to fix openrisc build error with -Wformat-truncation
- Link to v1: https://lore.kernel.org/all/20251022202527.3873558-1-youssef.abdulrahman@oss.qualcomm.com
---
Jeff Hugo (1):
  accel/qaic: Implement basic SSR handling

Pranjal Ramajor Asha Kanojiya (2):
  accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents
  accel/qaic: Collect crashdump from SSR channel

 Documentation/ABI/stable/sysfs-driver-qaic |  16 +
 Documentation/accel/qaic/aic100.rst        |  24 +-
 drivers/accel/qaic/Kconfig                 |   1 +
 drivers/accel/qaic/Makefile                |   2 +
 drivers/accel/qaic/qaic.h                  |  36 +
 drivers/accel/qaic/qaic_control.c          |   2 +
 drivers/accel/qaic/qaic_data.c             |  64 +-
 drivers/accel/qaic/qaic_drv.c              |  25 +
 drivers/accel/qaic/qaic_ssr.c              | 815 +++++++++++++++++++++
 drivers/accel/qaic/qaic_ssr.h              |  17 +
 drivers/accel/qaic/qaic_sysfs.c            | 109 +++
 11 files changed, 1102 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-qaic
 create mode 100644 drivers/accel/qaic/qaic_ssr.c
 create mode 100644 drivers/accel/qaic/qaic_ssr.h
 create mode 100644 drivers/accel/qaic/qaic_sysfs.c


base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
-- 
2.34.1

