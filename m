Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428869EC52C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB14F10EA6D;
	Wed, 11 Dec 2024 06:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="VTij4G94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1185 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2024 14:06:36 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D3210E8E0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:06:36 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAA1ErD020594;
 Tue, 10 Dec 2024 14:46:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 B88LI0a9Jttf2T4vTgk1R/W8xNzBmhzuueRUVJ5fXx8=; b=VTij4G94oiwG6nVs
 kAOhyaddTScvF0XJY6Owefa8LEB0JtyABva6XNVZlRrDA7mFQjbFr/5xhO8Q1Wgv
 MABJhtVAV1GsZPCrORnP17UsBLwTW6/A4qye+a586WqtsI62ydPo47XKvOU99tws
 qMkIh4o86OReclYJKD8KUig49P4B3tNDHegejsf8kp+YB0u8MXC3rcig9dN+YKWz
 sxT9QgBwEgRtV193dK+0ZV1C4/DTDdUYbAqHS4X4VBpc07oPP9K4SdQjH6WjrViS
 dty40BRrRlGJ3zfNbFFzOhhY32XfbgY52mI0D43M/A9XECl7jBEiHVxsMh/m34zG
 WrMiRQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43d0t5aq79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 14:46:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3FAB040049;
 Tue, 10 Dec 2024 14:45:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62071258555;
 Tue, 10 Dec 2024 14:44:08 +0100 (CET)
Received: from localhost (10.252.12.81) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Dec
 2024 14:44:08 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Olivier Moysan <olivier.moysan@foss.st.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] drm: bridge: adv7511: fill i2s stream capabilities
Date: Tue, 10 Dec 2024 14:42:52 +0100
Message-ID: <20241210134254.2967524-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210134254.2967524-1-olivier.moysan@foss.st.com>
References: <20241210134254.2967524-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.12.81]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Mailman-Approved-At: Wed, 11 Dec 2024 06:58:14 +0000
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

Set no_i2s_capture flag in hdmi_codec_pdata structure to report
that the ADV7511 HDMI bridge does not support i2s audio capture.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 61f4a38e7d2b..28ae81ca3651 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -234,6 +234,7 @@ static const struct hdmi_codec_pdata codec_data = {
 	.ops = &adv7511_codec_ops,
 	.max_i2s_channels = 2,
 	.i2s = 1,
+	.no_i2s_capture = 1,
 	.spdif = 1,
 };
 
-- 
2.25.1

