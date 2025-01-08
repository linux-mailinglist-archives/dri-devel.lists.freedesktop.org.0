Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A95A06311
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA28A10EC27;
	Wed,  8 Jan 2025 17:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="2ca3nq+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8182F10EC25
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:12:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508GBj4C015726;
 Wed, 8 Jan 2025 18:12:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=cq6IxiPnwzMaITNPkaDFnP
 A8wtn03dwB+70RTIKXb3Y=; b=2ca3nq+oHwyKr0boVB97VnJw1zm3C5DAUFpeUK
 DVFN2Y2qyNQp5N02f2to4CgufWJB9tT3hBKxMwMuOVWJHXGm4/RXc+/gFYqudgYN
 gDB73lWJIpjYA0Dv8uiBB/yz8AeaHLO2fCS2KU/a7CyLqp3ZL0Gs/S+Gq75HG6m+
 DMImjpaDs3YcyREuFq4iHC/lzgyS/RBiW9oydBLQkWCUcyPEv1TF6Fnr/LEP3FQt
 gqLhLbGlClkJc6ytzgAZXXQ3jSyksFbnO7rOZwPnDW2FnfZQFzYqqrp62r68UqiE
 jwELFpZWRtQVio0j2GLj+gTQi6mX/+Eh19icMTA6hSDnWNAA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441vnw06y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 18:12:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7E9134004F;
 Wed,  8 Jan 2025 18:10:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A590E28B217;
 Wed,  8 Jan 2025 18:04:07 +0100 (CET)
Received: from localhost (10.252.9.41) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 18:04:07 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Olivier Moysan <olivier.moysan@foss.st.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>
Subject: [PATCH v2 0/3] drm: bridge: adv7511: refine actual capabilities
Date: Wed, 8 Jan 2025 18:03:53 +0100
Message-ID: <20250108170356.413063-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
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

The STM32MP257F DK board features an ADV7535 HDMI bridge,
which belongs to the ADV7511 bridges family.
At startup the Pipewire audio framework parses the audio devices to
discover their capabilities. The capabilities reported by the ADV7511
driver are not accurate enough, which results in warning messages from
Pipewire.
Adjust the capabilities reported by the ADV7511 driver, to more
accurately reflect its actual capabilities.

Changes in v2:
- Re-order patches
- Set no_spdif_capture flag

Olivier Moysan (3):
  drm: bridge: adv7511: fill stream capabilities
  ASoC: hdmi-codec: allow to refine formats actually supported
  drm: bridge: adv7511: remove s32 format from i2s capabilities

 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 5 +++++
 include/sound/hdmi-codec.h                     | 1 +
 sound/soc/codecs/hdmi-codec.c                  | 4 ++++
 3 files changed, 10 insertions(+)


base-commit: 08767822ac114d510cf6861349e805a4c156dcbc
-- 
2.25.1

