Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889F9EC51E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0C10E3D1;
	Wed, 11 Dec 2024 06:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="q6bh+dZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6387110E3BF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:16:30 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAAbOaF025829;
 Tue, 10 Dec 2024 14:46:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 oAn87QHJepSxFgirg8GRxK9W/hXFqtjZBsb7YLbCrvk=; b=q6bh+dZKfuIAAHvX
 if+YpWF2HMiPOZcERvVA4rG8dV6NP0qd4fqzIVRi0lTt3BM4Br8F2d0Y3GkNjyP2
 FcHRd9XrOHOSZx5bmmODTlNsahtGsmmgwHOYajL3tPKZbZL9GH6A9FF+13/EOrK9
 t8lJ32/8Tro7jqrxo0hSkjtJ66Ap/cNcMgIGkdS+CpHaSx20mQsoblHwB8ybaByl
 Hy+sVpZOSKg8Fjlxnv37wbbL++Qy+74Wlo3wGXkPhoTLB6ksTApUHAVwt1g5djHH
 gq3TIsFV0dcq/zDNgylSUQ7msaE06uhnphMb+kkRYFL0sl97EIZ65wjH4vWWP5Cr
 KZ1Daw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43d0t5aq7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 14:46:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3FBA74004A;
 Tue, 10 Dec 2024 14:45:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6FC9C24A15B;
 Tue, 10 Dec 2024 14:44:09 +0100 (CET)
Received: from localhost (10.252.12.81) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Dec
 2024 14:44:09 +0100
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
Subject: [PATCH 2/3] drm: bridge: adv7511: remove s32 format from i2s
 capabilities
Date: Tue, 10 Dec 2024 14:42:53 +0100
Message-ID: <20241210134254.2967524-3-olivier.moysan@foss.st.com>
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

The ADV7511 chip allows 24 bits samples max in I2S mode, excepted for
direct AES3 mode (SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE format).
However the HDMI codec exposes S32_LE format as supported.
Adapt ADV7511 HDMI I2S format list to expose formats actually supported.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 28ae81ca3651..ce6eda87bfe0 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -232,6 +232,9 @@ static const struct hdmi_codec_ops adv7511_codec_ops = {
 
 static const struct hdmi_codec_pdata codec_data = {
 	.ops = &adv7511_codec_ops,
+	.i2s_formats = (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |
+			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE |
+			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
 	.max_i2s_channels = 2,
 	.i2s = 1,
 	.no_i2s_capture = 1,
-- 
2.25.1

