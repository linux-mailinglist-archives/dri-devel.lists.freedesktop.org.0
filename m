Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE35F1516BD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 09:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640756EDD2;
	Tue,  4 Feb 2020 08:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC506E30D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 12:16:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013CEBua002580; Mon, 3 Feb 2020 13:16:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=tRyeAl3e8NEmD+QHaO3MeWwtme06WG9UkinpQDoXHFY=;
 b=akmyOYhff2JPsD+A4MYUaTNr2KbkzIN6jXi1sosouRRZ95+9bOe3dbjslwDFLmtQlDFB
 85N1wiklXjjzt3dz0XRXbdbTApB2YlgEQ0cave8rHnXKc26LvNVre7mVuqGpq4RjymPL
 opFQSBJVMteuXrBsJ3T1sj07/OKd05Fv0Qyu+kph713O/SR6e0wT/7HZJUY0zgR85og5
 0xikAz9HEC6DluG3xKruepWI3Pwe1OV5hxKfchTw5kmtz2dzT0lCfGoRi0ItJIRMa71e
 XxCPUnWI3oNRoY4xgzOxiWoucu7I+yVsvcePYg1FYns3BLdttyzn7971ZuwEoT2aMMJG xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xvybds9qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 13:16:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A713C100034;
 Mon,  3 Feb 2020 13:16:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72D072125DA;
 Mon,  3 Feb 2020 13:16:22 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 3 Feb 2020 13:16:21
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/dp_mst: Check crc4 value while building sideband message
Date: Mon, 3 Feb 2020 13:16:20 +0100
Message-ID: <20200203121620.9002-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_03:2020-02-02,
 2020-02-03 signatures=0
X-Mailman-Approved-At: Tue, 04 Feb 2020 08:08:21 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check that computed crc value is matching the one encoded in the message.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
CC: lyude@redhat.com
CC: airlied@linux.ie
CC: jani.nikula@linux.intel.com
 drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 822d2f177f90..eee899d6742b 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -736,6 +736,10 @@ static bool drm_dp_sideband_msg_build(struct drm_dp_sideband_msg_rx *msg,
 	if (msg->curchunk_idx >= msg->curchunk_len) {
 		/* do CRC */
 		crc4 = drm_dp_msg_data_crc4(msg->chunk, msg->curchunk_len - 1);
+		if (crc4 != msg->chunk[msg->curchunk_len - 1])
+			print_hex_dump(KERN_DEBUG, "wrong crc",
+				       DUMP_PREFIX_NONE, 16, 1,
+				       msg->chunk,  msg->curchunk_len, false);
 		/* copy chunk into bigger msg */
 		memcpy(&msg->msg[msg->curlen], msg->chunk, msg->curchunk_len - 1);
 		msg->curlen += msg->curchunk_len - 1;
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
