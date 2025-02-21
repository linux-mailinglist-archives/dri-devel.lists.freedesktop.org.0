Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54A8A3F298
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 11:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917CB10E2D0;
	Fri, 21 Feb 2025 10:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="bCgapSh4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 589 seconds by postgrey-1.36 at gabe;
 Fri, 21 Feb 2025 10:59:51 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BDE10E2CC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 10:59:50 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L8e2lw024901;
 Fri, 21 Feb 2025 10:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=mjTilb8cr247Njy9/ZFsPrY
 Kvk+tGJQGhpsz9jWm1eE=; b=bCgapSh48FtchwT07DucV9149bSGaJM+pjCaS7r
 EhNftKoRsmj9taG9y4EMlkyO3vKMhzSosg1MXupZFG0VHMC1fKxPFoDBgJLKzf8Z
 1zjjxMjgKq5ov/feI5sLTPqxEQMTfUs5lRC+4P97Voe8ilY4CPxair3L5hbsjKMn
 MG7zUxk+74tTT+80DuayJbWLOLpPIxCeLWzg3OrzYg6+OSPXZj9MUGC1B4rSW+JT
 2zJ5tY0qpo2RyAc7BOaD4bSgSoSiPcqE1nSV2LRLubSf+J3neob7mQ9qlLO3tzG2
 O77iybaHjOcnRZ7WPi/du3sSSLWNlJp5o6Qth5L8pFmMP1w==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 44w4c9t0qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Feb 2025 10:49:46 +0000 (GMT)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.1.196) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 10:49:46 +0000
From: Alessio Belle <alessio.belle@imgtec.com>
Date: Fri, 21 Feb 2025 10:49:35 +0000
Subject: [PATCH] drm/imagination: Fix timestamps in firmware traces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250221-fix-fw-trace-timestamps-v1-1-dba4aeb030ca@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAD5auGcC/x2MSQqAMAwAvyI5G6gREf2KeKg21RxcaIoK0r9bP
 A7MzAvKQVihL14IfInKsWeoygLm1e4Lo7jMQIYaQ2TQy4P+xhjszBhlY412OxWrxrVmmsh1tYN
 cn4Gz+p+HMaUP70MsSmkAAAA=
X-Change-ID: 20250220-fix-fw-trace-timestamps-15d70bb2d93d
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Alessio Belle" <alessio.belle@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740134986; l=2210;
 i=alessio.belle@imgtec.com; s=20250219; h=from:subject:message-id;
 bh=Nmn1WkM/0L//ox2zY+lhf82FfeFH2247Y9hhlOpXOFw=;
 b=Djbe3gHbtcB0IoAm8z7b8CsAUKXWBtZiIWiEl+O7oE85EVfQKrOBv37MXUizXKuKCvpZMpKjw
 +VDo3fJ2c9+A4boZqB3EOj0eUB1YExtdsGuZcZZKVTRck9B65oO8Z9d
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=461lRgRg6AriUFORrCd1maNrcZ+FQJK9D+lWwEPvRPk=
X-Originating-IP: [172.25.1.196]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: mjawzWKNHC5dqVTBH5323QBbYJfZmUBB
X-Proofpoint-ORIG-GUID: mjawzWKNHC5dqVTBH5323QBbYJfZmUBB
X-Authority-Analysis: v=2.4 cv=U59oDfru c=1 sm=1 tr=0 ts=67b85a4a cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=qOZVjcO8vPQA:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=r_1tXGB3AAAA:8
 a=iuFoamyZqZ1IYpyTJZkA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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

When firmware traces are enabled, the firmware dumps 48-bit timestamps
for each trace as two 32-bit values, highest 32 bits (of which only 16
useful) first.

The driver was reassembling them the other way round i.e. interpreting
the first value in memory as the lowest 32 bits, and the second value
as the highest 32 bits (then truncated to 16 bits).

Due to this, firmware trace dumps showed very large timestamps even for
traces recorded shortly after GPU boot. The timestamps in these dumps
would also sometimes jump backwards because of the truncation.

Example trace dumped after loading the powervr module and enabling
firmware traces, where each line is commented with the timestamp value
in hexadecimal to better show both issues:

[93540092739584] : Host Sync Partition marker: 1    // 0x551300000000
[28419798597632] : GPU units deinit                 // 0x19d900000000
[28548647616512] : GPU deinit                       // 0x19f700000000

Update logic to reassemble the timestamps halves in the correct order.

Fixes: cb56cd610866 ("drm/imagination: Add firmware trace to debugfs")
Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 73707daa4e52d13fd1388cb2e9feff0aea109620..5dbb636d7d4ffeea2253ea58e817710979f90cf0 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -333,8 +333,8 @@ static int fw_trace_seq_show(struct seq_file *s, void *v)
 	if (sf_id == ROGUE_FW_SF_LAST)
 		return -EINVAL;
 
-	timestamp = read_fw_trace(trace_seq_data, 1) |
-		((u64)read_fw_trace(trace_seq_data, 2) << 32);
+	timestamp = ((u64)read_fw_trace(trace_seq_data, 1) << 32) |
+		read_fw_trace(trace_seq_data, 2);
 	timestamp = (timestamp & ~ROGUE_FWT_TIMESTAMP_TIME_CLRMSK) >>
 		ROGUE_FWT_TIMESTAMP_TIME_SHIFT;
 

---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20250220-fix-fw-trace-timestamps-15d70bb2d93d

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

