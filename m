Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A145AC3F1B
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ACB89D63;
	Mon, 26 May 2025 12:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="OtIWIlKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 26 May 2025 12:13:10 UTC
Received: from mail-m1973176.qiye.163.com (mail-m1973176.qiye.163.com
 [220.197.31.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC3110E31C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 12:13:10 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 166d9dc7d;
 Mon, 26 May 2025 20:08:02 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 0/3] Apply drm_bridge_connector helper for the Analogix DP
 driver
Date: Mon, 26 May 2025 20:07:39 +0800
Message-Id: <20250526120742.3195812-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh0aQlZOSB8aQx8dSB5PGBpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
X-HM-Tid: 0a970c7e23d203a3kunm0ad0490252545c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pkk6Nxw*HDE#IgwOPlE1OBgM
 P0waFA5VSlVKTE9DSU1KSUNPSENOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTk1ONwY+
DKIM-Signature: a=rsa-sha256;
 b=OtIWIlKP4EL4syWe2tXIHkJIar+CXGpIoabGYjZZVzZWNUjVraiJyEjzRtHW+Ryb+8Az4qHwyRD5D3kx9MwRfXE58an7R1Z/88DsQ8GEDuW/hwAkhyo3ucRXoO40rGk39/lvexs6JkGE3zKEJsxoejACQhDhlWXTUox9yWa0Fmk=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=lljjPoI6SdvD8GOzzIvTZHMV542gJWVDXF4AErEZ/zw=;
 h=date:mime-version:subject:message-id:from;
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

PATCH 1 is a small format optimization.
PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
PATCH 3 is to apply the drm_bridge_connector helper.

Damon Ding (3):
  drm/bridge: analogix_dp: Formalize the struct analogid_dp_device
  drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
    &drm_bridge_funcs.atomic_enable
  drm/bridge: analogix_dp: Apply drm_bridge_connector helper

 .../drm/bridge/analogix/analogix_dp_core.c    | 312 +++++++++---------
 .../drm/bridge/analogix/analogix_dp_core.h    |   8 +-
 include/drm/bridge/analogix_dp.h              |   1 -
 3 files changed, 153 insertions(+), 168 deletions(-)

-- 
2.34.1

