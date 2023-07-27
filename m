Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A59765E90
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED82D10E619;
	Thu, 27 Jul 2023 21:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from qs51p00im-qukt01080302.me.com (qs51p00im-qukt01080302.me.com
 [17.57.155.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9068B10E619
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 21:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1690494739; bh=LU0k+tUkFkEwfTZnI6jZM5Vvh1FH+qSfXs1IaYag2Qs=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=cz1asW0V+DKN9/4qtcQoVZ58RgTI693nXUCsnOHaT3sW6qfcp3JjgrLyrS5tRf8GZ
 zF3ZGgXflvi1ILi6cHFQQWuEGcpyVO0szhTdypTM6OOGQlGaaJhholCr/dOdRgBgT9
 Xf/fSwLqJbNKIinGg7Z3DKA7XIAPtwMtxQl9EkuoKrdALfIXHLlNjQr004zDNw4hig
 mC7NMsyGGQxClfyuMLKfO/8IOUY4QidqfLyaMW+1GQF8JPbnD5AUkuwL+33JaVdAGI
 xcXlaKLRE0t4rIkvw6yij2rCVReV+0kJTvympyS18z6IGAHVZlMGI2WVERk0caD87a
 5hz/WLbggKEpg==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
 by qs51p00im-qukt01080302.me.com (Postfix) with ESMTPSA id
 01E0211403F4; Thu, 27 Jul 2023 21:52:18 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 00/14] drm/sti: add display support on stih418 family
Date: Thu, 27 Jul 2023 21:51:24 +0000
Message-Id: <20230727215141.53910-1-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rh6ayKPi9W13LZuJbCRggefceHbkV9hM
X-Proofpoint-ORIG-GUID: rh6ayKPi9W13LZuJbCRggefceHbkV9hM
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.790,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F03:2022-01-11=5F01,2022-01-12=5F03,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1011 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2307270199
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This serie adds support for graphic display features on the stih418 soc.

Major differences compare to the already supported stih407 are
  - a new HDMI PHY to support 4K resolutions
  - updated mixer to support the higher number of planes available
    on the stih418
  - updated GDP (graphic planes), called here gdpplus

Alain Volmat (14):
  drm/sti: add hdmi tx6g0c28 phy for STi platform
  dt-bindings: display: add st,stih418-vtg compatible for sti vtg
  drm/sti: add support for VTG on the stih418 platform
  drm/sti: add STih418 platform support in sti mixer
  drm/sti: add support for stih418 in tvout
  drm/sti: remove VTG_SYNC_ID_HDMI from sti_vtg.h
  drm/sti: add more possible GDP / VID planes entries in sti_plane
  drm/sti: add more planes supports in sti_mixer
  drm/sti: add support for GDPPLUS / stih418 GDPs
  drm/sti: add compositor support for stih418 platform
  ARM: dts: sti: move vtg_main / vtg_aux into stih407/stih410 dtsi
  ARM: dts: sti: addition of display nodes for stih418 platform
  ARM: dts: sti: add the gpu node for the MALI-400 on stih418.dtsi
  ARM: dts: sti: enable basic display on stih418-b2264 board

 .../bindings/display/st,stih4xx.txt           |   2 +-
 arch/arm/boot/dts/st/stih407-family.dtsi      |  13 -
 arch/arm/boot/dts/st/stih407.dtsi             |  12 +
 arch/arm/boot/dts/st/stih410.dtsi             |  12 +
 arch/arm/boot/dts/st/stih418-b2264.dts        |  34 ++
 arch/arm/boot/dts/st/stih418-clock.dtsi       |   2 +-
 arch/arm/boot/dts/st/stih418.dtsi             | 188 +++++++++++
 drivers/gpu/drm/sti/Makefile                  |   1 +
 drivers/gpu/drm/sti/sti_compositor.c          |  30 ++
 drivers/gpu/drm/sti/sti_compositor.h          |   3 +
 drivers/gpu/drm/sti/sti_crtc.c                |  11 +
 drivers/gpu/drm/sti/sti_gdp.c                 | 250 +++++++++------
 drivers/gpu/drm/sti/sti_gdp.h                 |   8 +-
 drivers/gpu/drm/sti/sti_hdmi.c                |   4 +
 drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.c    | 292 ++++++++++++++++++
 drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.h    |  13 +
 drivers/gpu/drm/sti/sti_mixer.c               | 133 ++++++--
 drivers/gpu/drm/sti/sti_mixer.h               |   3 +-
 drivers/gpu/drm/sti/sti_plane.c               |   8 +
 drivers/gpu/drm/sti/sti_plane.h               |   8 +-
 drivers/gpu/drm/sti/sti_tvout.c               |  35 ++-
 drivers/gpu/drm/sti/sti_vtg.c                 |  62 +++-
 drivers/gpu/drm/sti/sti_vtg.h                 |   1 -
 23 files changed, 967 insertions(+), 158 deletions(-)
 create mode 100644 drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.c
 create mode 100644 drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.h

-- 
2.34.1

