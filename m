Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66E1A7E376
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1606410E4E8;
	Mon,  7 Apr 2025 15:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXLojROZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF35A10E4E7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 15:11:16 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dlSV022580
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Apr 2025 15:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=SVDbcgBLEx3IAtDvcLYlqV
 A6wLLi1mRZSIJcN/Uo00o=; b=VXLojROZ8C3q0C85JMNsMqBkr5NEYNQDGGdMGJ
 tUA3zWdPKiwr8sdBz+sW6CB3+o88RQME6auIUiCW8OUbvhIEtLyhoha6ArAxCYPs
 dZljmSjuuX0kd0vm5Mo7FIr/WlieXBI0vtDKg6LmChvrlnYymN1hZR8Wj5uzTwWw
 n25OHqkyAr3H5KUmQtOIFIvm6VGmJMGVdnbgbXa+GwFj2Hhia89sskfXhUpXH8B3
 KHGbUXwAF9DKLa4pjmN0N5tdTPJpNJTyfPvqRl2dwu4tSNeQFaw5EEgfq4L5Yu8Z
 ZlUISBQyjyBFzZ6DKvINYKSyHnNbJfG9UmNnY59ZmeaLIMtw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrcna9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 15:11:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so730065485a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 08:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744038663; x=1744643463;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SVDbcgBLEx3IAtDvcLYlqVA6wLLi1mRZSIJcN/Uo00o=;
 b=HmaVZOiVruGBg3sPffivV0HUhc2YeoXpD16XSckwK2i6AYLnrJ3BGOKZOY5IcEweJA
 llt6OInPN7ducQxZa4U5ye7HGc9IUmRpZBTlmu6PESFjxjm0U7q/Z6aE0r/hM0FKci3z
 7L+NNarwUkhf1xbCKLKCzpsnrETZ13E/cwiI0OsGnoaDRfIb0fWgRHObd31clq+3ua12
 00r6/O2Qf5ziZb1oKqvy3VeOiRMYNnPLaYPUCbhxe2L+zy2CmbVRWQantbvLNtwzIEgb
 etw05y5MTvvU2YnbwqNHBlXL7G7P4QXsTY5GYq0oIjWVhfjU/NNVdIqs3/VHXJndfpMa
 UgKg==
X-Gm-Message-State: AOJu0YxIj9IGg/yUem/FapIcdSzZri1SoygwBAxep1gCk2n2Mrk/59Jz
 9v47PEDDsUJKp6FDu5vZ+Zz8/Pj4EVV4mLCEnCSbEWQGQhVX3IBJqHOZ/68l14G7pMdp8xehLin
 ecTCDWLoxwP/JJxjwxzHfJpCPByy+iiJmyHwu6XqIVJHEOvqgr1mGkU/gS0aoyArfgcs=
X-Gm-Gg: ASbGnctbk9s4oTYxARtlN9ARP7kPvkHD1XdRRT4bUZjBtRfLtVkIMUWrLX0yvDY6Tnj
 qyvQx7wRB5IdTRwE69PQKMSalEK59549oL4WLqRJyHtiYM1qYZORgeBdbHHZWLbNyTefP0AIjut
 VuJcNzQXaSOZbm5enViTQjCx+8ewwz1nqY/EuL3JoGng3tXssnFbmXgYYgNbrk2uqQL/udDBDfO
 v+Zb7VcmhIzcUZg8kNyVs2a6NBDaCGUqzFbYjspvvnq3bBq9aX5whJlAYvQjyEglkcy2CEywln/
 fI812bHFINhRY9svJvWEWvm9vz4Ddl8K0wVAVHi3T1SH01L6lapgcOiTFtl5Aaem6aZVhzQ8dxM
 QO539jIANuhbJtnSCkJVpSvc+eCAh
X-Received: by 2002:a05:620a:4551:b0:7c5:96f6:c9e6 with SMTP id
 af79cd13be357-7c77dd8654amr1056711785a.15.1744038662770; 
 Mon, 07 Apr 2025 08:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHqrH1lDF2eXoGEPRExQ109G40w2fdjUx4FVotD06yqW6Q1WmQlnNQa7YOvWmbUDuALQx1SQ==
X-Received: by 2002:a05:620a:4551:b0:7c5:96f6:c9e6 with SMTP id
 af79cd13be357-7c77dd8654amr1056706985a.15.1744038662292; 
 Mon, 07 Apr 2025 08:11:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:11:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/11] drm/display: generic HDMI CEC helpers
Date: Mon, 07 Apr 2025 18:10:57 +0300
Message-Id: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAHr82cC/3XOS27DIBQF0K1YjEsLj4/tjLqPKAM+LzFSDS24V
 qrIey9xGrVV5AniIt3DvZCCOWAhu+ZCMs6hhBRrUE8NcYOJJ6TB10yAgeQAgvo80sGPgboUI7o
 pZerQUSF7Bg472dqW1PJ7xmM4r/D+cMsZPz6rP90eiTUFKzKOYdo1V3UMxb3cLzTieSLX5hBK/
 eRrXTjztfozRm2NmTll1HZMdMzpFoC/voVocnpO+bSaM9wdxThnmw5Up2e6dd1RSK3FgyP+OKA
 3HVEdZZUFL3ulvXlw5K9Tj01HVse0XAMzSnrF/jnLsnwDIc6cAs8BAAA=
X-Change-ID: 20241223-drm-hdmi-connector-cec-34902ce847b7
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5829;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2HC3NGdHCaGCBoj08jwevVV5qTrdss1SpN/q+vSUpqo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sDnlTvPSEyzJGVoqtYsExh9DlqHGlpfKx99
 NmsQjYwBPiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrAwAKCRCLPIo+Aiko
 1eI3B/9o8Kx88ua8FRheP/1jXqeqDm4rTCWWRXprVr4xuoKflnAFhlsFnHOi6WIlhosKtT0rllW
 GylsBx+qF3ppg3YShKfRbs7ALEVbgE8touVs2NxIhs2sFIppAqUwrPhXsNuV8uSUpFu0Fqwz0UC
 fjmzYJHfBGctulFJrYBtAZnGNrG5p+eFpLAIaHLo3/noCI9mHR+09kg9d77bwVyUCSqc1n3KoUy
 YNEMO0/RSwNw3W4xldVsqcUOzz84ShaK8yRuKiuR271wghQvmf7vO8JafhIjirjvGxlED8cItNh
 dNpp8NAR19mPdpebNswYP8alxBE+zzhdWadX8O6e7dugC23p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: lwRKuts4XDmLnRrlmK0MgcUjn9SPq9vk
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f3eb13 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=mx_tZ-coFAQyRMgxpOMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lwRKuts4XDmLnRrlmK0MgcUjn9SPq9vk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070106
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

Currently it is next to impossible to implement CEC handling for the
setup using drm_bridges and drm_bridge_connector: bridges don't have a
hold of the connector at the proper time to be able to route CEC events.

At the same time it not very easy and obvious to get the CEC physical
address handling correctly. Drivers handle it at various places, ending
up with the slight differences in behaviour.

Follow up the HDMI Connector and HDMI Audio series and implement generic
HDMI CEC set of helpers that link into the HDMI Connector and
drm_bridge_connector frameworks and provide a way to implement CEC
handling for HDMI bridges in an easy yet standard way.

Notes:
- the patchset was only compile-tested
- being an RFC some of the API functions and structures are left
  undocumented
- although the patchset provides drm_bridge / drm_bridge_connector API
  for working with CEC, there is no actual bridge that uses the API
  (yet)

- I'm pretty unhappy with the drm_bridge integration code, we end up
  duplicating wrappers for CEC functions instead of reusing the
  drm_connector wrapping functions. An easy way would be to map
  drm_bridge to the corresponding drm_connector, but that would
  either require a state or storing drm_connector inside a drm_bridge.
  Current code stores cec_adapter instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Fixed the check in adv7511_bridge_hdmi_tmds_char_rate_valid().
- Major rework of HDMI CEC to follow 'helpers' design. Implemented
  generic data structures that can be used for both CEC notifiers and
  CEC adapters (Maxime).
- Link to v4: https://lore.kernel.org/r/20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org

Changes in v4:
- Rebased on top of drm-misc-next + commit 78a5acf5433d ("drm/display:
  hdmi: Do not read EDID on disconnected connectors")
- Moved 'select DRM_DISPLAY_HDMI_CEC_HELPER' under the
  DRM_I2C_ADV7511_CEC symbol
- Fixed documentation for @hdmi_audio_i2s_formats to describe default
  behaviour.
- Split drm_connector_cleanup() patch from the patch adding CEC-related
  data structures (Maxime).
- Documented that CEC mutex protects all data fields in struct
  drm_connector_cec (Maxime).
- Improved drm_connector_cec_funcs.unregister() documentation.
- Documented struct drm_connector_hdmi_cec_adapter_ops fields. Added a
  note to the commit message on the difference between it and struct
  drm_connector_cec_funcs (Maxime).
- Fixed Kconfig dependencies.
- Link to v3: https://lore.kernel.org/r/20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org

Changes in v3:
- Moved default available_las setting to
  drm_connector_hdmi_cec_register(), allowing drivers to pass 0 instead
  of CEC_MAX_LOG_ADDRS.
- Reworked drm_bridge interface to store opaque pointer and interpret it
  as drm_connector in CEC helpers code.
- Fixed EINVAL checks in drm_connector_hdmi_cec_register().
- Added the adv7511 patch, demonstrating CEC helpers for the DRM
  bridges.
- Link to v2: https://lore.kernel.org/r/20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org

Changes in v2:
- Refactored CEC funcs, adding more wrappers to provide more consistent
  interface (Maxime)
- Removed export of drm_connector_cec_unregister() (Maxime)
- Restored and rephrased comment in vc4_hdmi (Maxime)
- Squashed vc4 patches
- Link to v1: https://lore.kernel.org/r/20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org

---
Dmitry Baryshkov (11):
      drm/bridge: move private data to the end of the struct
      drm/bridge: allow limiting I2S formats
      drm/connector: add CEC-related fields
      drm/connector: unregister CEC data
      drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
      drm/display: add CEC helpers code
      drm/display: hdmi-state-helper: handle CEC physical address
      drm/vc4: hdmi: switch to generic CEC helpers
      drm/display: bridge-connector: hook in CEC notifier support
      drm/display: bridge-connector: handle CEC adapters
      drm/bridge: adv7511: switch to the HDMI connector helpers

 drivers/gpu/drm/bridge/adv7511/Kconfig             |   5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |  52 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |  77 +----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |  57 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 345 +++++++++------------
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |   4 -
 drivers/gpu/drm/display/Kconfig                    |  13 +-
 drivers/gpu/drm/display/Makefile                   |   4 +
 drivers/gpu/drm/display/drm_bridge_connector.c     | 108 +++++++
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |   3 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      | 175 +++++++++++
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c |  60 ++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   7 +-
 drivers/gpu/drm/drm_connector.c                    |  51 +++
 drivers/gpu/drm/vc4/Kconfig                        |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 140 ++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   1 -
 include/drm/display/drm_hdmi_audio_helper.h        |   1 +
 include/drm/display/drm_hdmi_cec_helper.h          |  74 +++++
 include/drm/drm_bridge.h                           |  76 ++++-
 include/drm/drm_connector.h                        |  56 ++++
 21 files changed, 879 insertions(+), 431 deletions(-)
---
base-commit: 231adeda9f674ece664b09b75b68a4c023180fb4
change-id: 20241223-drm-hdmi-connector-cec-34902ce847b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

