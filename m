Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31469AB37A5
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C5B10E3FC;
	Mon, 12 May 2025 12:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="PuiPw5Fl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 094D810E3F8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Qc
 LmNsHTO3aku15hZGQDsZDoAHV7lC+eI9cY9gEZ2kU=; b=PuiPw5FlJ97ModweAY
 JKFWQZhGLSKBB1GMLRUZSNCput63+hj4ZGvYvdF8AVE8qunOM8HPGgGEj807PgSs
 +dWITbCBBacaU7N0VrM/UqQq+0DNQDoa3OxmvBcWRZitzSIQ4l02vZ5PaNqD2HN/
 ML3/mJH1O+MiY4ID4zV+Jr5+Q=
Received: from ProDesk.. (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PigvCgC3chWY7SFoQ+_OAQ--.62400S2;
 Mon, 12 May 2025 20:46:21 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com, mripard@kernel.org,
 neil.armstrong@linaro.org, hjc@rock-chips.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 00/10] Convert inno hdmi to drm bridge
Date: Mon, 12 May 2025 20:46:01 +0800
Message-ID: <20250512124615.2848731-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3chWY7SFoQ+_OAQ--.62400S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF4fZw1rGr15KFWUZFy5Arb_yoW8Kw45pa
 y5Ary5CF47Gayjqrs7CF4fJF1Sqa4DJa1F9ryxXw1IvFyUuFy5Ar9a9F4Fvry3ZFsrAFsF
 yr4xJa4UKF42vaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7b18UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBxLXmgh6yc1IwAAsK
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

From: Andy Yan <andy.yan@rock-chips.com>


Convert it to drm bridge driver, it will be convenient for us to
migrate the connector part to the display driver later.

Patches that have already been merged in drm-misc-next are dropped.

PATCH 1~8 are some cleanup and refactor.
PATCH 9 converts the curren driver to drm bridge mode.
PATCH 10 add Add entry in MAINTAINERS file.

Changes in v5:
- Split cleanup code as separate patch
- Switch to devm_drm_bridge_alloc() API
- Link to V4: https://lore.kernel.org/linux-rockchip/20250422070455.432666-1-andyshrk@163.com/

Changes in v4:
- Do not store colorimetry within inno_hdmi struct
- Link to V3: https://lore.kernel.org/linux-rockchip/20250402123150.238234-1-andyshrk@163.com/

Changes in v3:
- First included in v3
- Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/

Andy Yan (10):
  drm/rockchip: inno_hdmi: Merge register definition to c file
  drm/rockchip: inno_hdmi: Refactor register macros to make checkpatch
    happy
  drm/rockchip: inno_hdmi: Remove unnecessary parentheses to make
    checkpatch happy
  drm/rockchip: inno_hdmi: Rename function inno_hdmi_reset to
    inno_hdmi_init_hw
  drm/rockchip: inno_hdmi: Move ddc/i2c configuration and HOTPLUG unmute
    to inno_hdmi_init_hw
  drm/rockchip: inno_hdmi: Use sleep_range instead of udelay
  drm/rockchip: inno_hdmi: switch i2c registration to devm functions
  drm/rockchip: inno_hdmi: Simpify clk get/enable by
    devm_clk_get_enabled api
  drm/rockchip: inno-hdmi: Convert to drm bridge
  MAINTAINERS: Add entry for Innosilicon hdmi bridge library

 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/bridge/Kconfig                |   7 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../inno_hdmi.c => bridge/inno-hdmi.c}        | 911 ++++++++++--------
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 188 ++++
 drivers/gpu/drm/rockchip/inno_hdmi.h          | 349 -------
 include/drm/bridge/inno_hdmi.h                |  33 +
 9 files changed, 737 insertions(+), 763 deletions(-)
 rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (52%)
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
 create mode 100644 include/drm/bridge/inno_hdmi.h

-- 
2.43.0

