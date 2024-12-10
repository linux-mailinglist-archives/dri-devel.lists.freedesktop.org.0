Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905D69EC51F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD6E10E5E9;
	Wed, 11 Dec 2024 06:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="467cU4cV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB1010E8EA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:18:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA9RBJX019832;
 Tue, 10 Dec 2024 14:47:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=DQ1nTIBSftquwVYBQvoMKW
 HK26DZ8j8jxi/28l/0eEY=; b=467cU4cVsZlGtR9yEG9BYm4eiBhH1IsFCd/+oJ
 l7KFFQKsEgkujfFSIxl5yuW8A/lGF0aWqgKQFWPKS22mXCGmdW0z7aBrr6isTqAj
 sudyFjIPSpDQb4O4AgkA9ulojWqNOxaKaVz8k6pJbnCm8W10/RPge93ogWZR1jqf
 TL9ZYSlt4J7mH08SmNyxST/kK3jZV+Dy69Tx5g/tMoyEynK8QdmREP4Ub6DmL8jQ
 CdgKCf53Ym+j/HV09WrL9HqW2UU3FmcXxIvcQUhKQk8T/BYv8cj3rjCF003ZAZto
 ZCEd9eqUwgOtHxgBNzQRs2hetdZZLjM0U0s1zetUsILJYFGA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43cek1vwt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 14:47:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 268394004D;
 Tue, 10 Dec 2024 14:45:27 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56EB925853D;
 Tue, 10 Dec 2024 14:44:07 +0100 (CET)
Received: from localhost (10.252.12.81) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Dec
 2024 14:44:07 +0100
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
Subject: [PATCH 0/3] drm: bridge: adv7511: refine actual capabilities
Date: Tue, 10 Dec 2024 14:42:51 +0100
Message-ID: <20241210134254.2967524-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
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

The STM32MP257F DK board features an ADV7535 HDMI bridge,
which belongs to the ADV7511 bridges family.
At startup the Pipewire audio framework parses the audio devices to
discover their capabilities. The capabilities reported by the ADV7511
driver are not accurate enough, which results in warning messages from
Pipewire.
Adjust the capabilities reported by the ADV7511 driver, to more
accurately reflect its actual capabilities.

Olivier Moysan (3):
  drm: bridge: adv7511: fill i2s stream capabilities
  drm: bridge: adv7511: remove s32 format from i2s capabilities
  ASoC: hdmi-codec: allow to refine formats actually supported

 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 4 ++++
 include/sound/hdmi-codec.h                     | 1 +
 sound/soc/codecs/hdmi-codec.c                  | 4 ++++
 3 files changed, 9 insertions(+)


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.25.1

