Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B036AA06313
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E27E10EC24;
	Wed,  8 Jan 2025 17:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="iBTrArtB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAE010EC24
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:12:28 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508EW6uu023028;
 Wed, 8 Jan 2025 18:12:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mZFCsh40sOu/u15Rp+iudqR0tq8Lg8gMkPDrWC7M0O4=; b=iBTrArtBYLb4eYYp
 YzD/RMJWLO0mdxVIntMv+vOA0wq99xXZBwV4OT3BR6fKG7PcKf0wJItEn75s9F2j
 YKarBvE1Qxy5C9VUzNWaenoJkbn/wgKJ9r4MZmORTwI+nM3ZpSLhStDzRz+kDOwT
 QO/6ZIsBwfhw9FP4FNsdlQkLBYfkxvan0MvI7l+C/0RxhEA7HJvyNHSJlaJzcK+R
 yE5XoZzFJgzRv6XNpzkG6jhOYhpaXisf3xilEi05nyPEBcZ+NVESSY0AJmMz7GjG
 gxNe8iR3zy0htaX8aUDxlEbzhs2pvkSHmZDiRIjCSiV9pGW6ghhCUQguRO6AnSQS
 6dWLbQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441u78rn7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 18:12:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7A5E740050;
 Wed,  8 Jan 2025 18:10:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5B1928A87E;
 Wed,  8 Jan 2025 18:05:10 +0100 (CET)
Received: from localhost (10.252.9.41) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 18:05:10 +0100
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
Subject: [PATCH v2 3/3] drm: bridge: adv7511: remove s32 format from i2s
 capabilities
Date: Wed, 8 Jan 2025 18:03:56 +0100
Message-ID: <20250108170356.413063-4-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108170356.413063-1-olivier.moysan@foss.st.com>
References: <20250108170356.413063-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.9.41]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
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
index 24e1e11acf69..793121154bca 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -242,6 +242,9 @@ static const struct hdmi_codec_ops adv7511_codec_ops = {
 
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

