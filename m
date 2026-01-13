Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9563CD17EFD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CEC10E49B;
	Tue, 13 Jan 2026 10:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Me1qJjmR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3B310E495
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 10:17:13 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D6XiIT3196794; Tue, 13 Jan 2026 10:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=O
 9U7zjzOjCEzi5GIRDwZrE0mEmBXOKSi9S9+0WqO3fg=; b=Me1qJjmREiRmuaBsk
 oiPLCbdhYNxcH99mwKy8VdRRAybrMQa7QXfLNQ00Z6QYqYUkhkqnF73eL7tJO2X4
 vMzBex+shSK8xU+4QJWzdrTW1DVvdrrCqzSL1Q+AA39avpCZ7sJxsfxAERK2FFF2
 ljpGDln8Z/iorf1/IDLQa6LoF6TKIXB+6kStdcYJ2k9lUWwJ1VEmJuyKvuIgzd1j
 UAGKbbLDYA2kcEawIaPsziq5Hb5gwBbrm4JO014k2Txwnn3lJucm2QHa6SSiXKM/
 2jtpEVPNX0QNu5rY1pWA7XXY6aoBmbVTFbcqkzHftbCAREu71y1gNYvDXtLtjE80
 Sys+g==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4bkfqua1rs-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jan 2026 10:16:58 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.58) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:16:57 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 13 Jan 2026 10:16:41 +0000
Subject: [PATCH 3/6] drm/imagination: Load FW trace config at init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260113-device-support-info-v1-3-91e5db7f7294@imgtec.com>
References: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
In-Reply-To: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=5EcW8XdUmOfp836puLffKDqVJ8rRli7zcv/+RK2YIfQ=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSmSU9bVNzdoXC2eM2slzd/7N29acv2RU2CqlJuKkl+L
 1avUd+1o6OUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAmEmHNyDD1VdfmbYxTLIST
 lzxS7LRIUzx7LjuYJ/O0p2fodE2fhecYfrPEW2izTy3Kcl3d9O/M7f3sfGI9b9+VvOZObFdRbXZ
 7ywMA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.4.58]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4NiBTYWx0ZWRfX6XSF99NPkCYa
 7raHqa7iI8dku3qu3r9fOkXMmsz9hSzUPq5aa1QouJ0m/x8nGxM7FPc6OReH0HSiWblKvuneDZU
 IycJ4f5WUphgkUfnZBP+mWIUsS67ti7W2Bas7b/T17JWOTibsQQ+LAjw777B9vXKSaXZCgFoHNr
 YIEtaZs8taRmrxvjkR7BtxS6Ax9VE+FPYhNdv7H3IMPu0YmGmGhJ8R9pPScOfHWnU7kNJ/Ud6O1
 Yga+1ExgxHsLktqDDhqIQWtrKrlskyeM2ZrALtJANrH9jT0QzSoDErtNs6dKqnLI83yFbUA86Tw
 7QkgzQL9ZNdqAAEiekpaxHfuW2uaJiTv1V3tCYdIAl9sMgFPT/X37m/ogCdqExzNuS1hUvE8nW6
 CfSl0thKkWx0cxv2IfhbD6MMATzs4gCMaf8TDNSHv4dqLUK9PelRCMMeZasbxDpSujxUN9Y5vpm
 XZ7NO7V4tkmscOZfLIQ==
X-Proofpoint-GUID: aGia30f4RZjsG6SKkTo1fpAfYo4MaRiJ
X-Proofpoint-ORIG-GUID: aGia30f4RZjsG6SKkTo1fpAfYo4MaRiJ
X-Authority-Analysis: v=2.4 cv=aexsXBot c=1 sm=1 tr=0 ts=69661b9a cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=jNdnsKvOq7QA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=F4SZs_XWik5TpCwB3EkA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

We have a module parameter to set the initial group mask before debugfs is
available for any specific device, but don't currently use that value when
initialising devices.

Use the module parameter value as the initial value for group_mask.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index a2aa588cbe5fa..93119f0f23a92 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -130,8 +130,13 @@ int pvr_fw_trace_init(struct pvr_device *pvr_dev)
 		}
 	}
 
-	/* TODO: Provide control of group mask. */
-	fw_trace->group_mask = 0;
+	/*
+	 * Load the initial group_mask from the init_fw_trace_mask module
+	 * parameter. This allows early tracing before the user can write to
+	 * debugfs. Unlike update_logtype(), we don't set log_type here as that
+	 * is initialised by tracebuf_ctrl_init().
+	 */
+	fw_trace->group_mask = pvr_fw_trace_init_mask;
 
 	fw_trace->tracebuf_ctrl =
 		pvr_fw_object_create_and_map(pvr_dev,

-- 
2.52.0

