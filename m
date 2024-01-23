Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687FB8399A3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCD510E0FD;
	Tue, 23 Jan 2024 19:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A4210E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038674; x=1737574674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R5ziVsO4KOXCUtNUdWQY5P4Ig51cp7yJKW5AZbhbK+s=;
 b=Y7mPnGS2vP5KZxQZYtA7aRSmIqg3mp+y6291YG4ZaB9dGQgpQPmE4PHo
 ufCWxN/ENJxMUY5EfGJSXbiPC583zgGM3ecYbWUEY3pFId7eRAVYwgO87
 RcjamBLAvHFXXmsvrznjBhYaFNkU3bk7F2gcbRY9noGmix183KyM2J1Gx
 bv5f38ZpIgE1ZHrPfGV3yXoCbpBhHrnTxwFczu/NADS2LYcH6sCcP43iY
 rR2foz/YHZ1O122jtNgKOWT5iMbbUSjzLBK8IvMRfB4v/Ikc5LW7DEk/h
 OCjxo9MsTm5VnNvkxwlJcMnBmPEhX+48bCfxIczai/sWhdQDGZq5E1bB+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1478499"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1478499"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:37:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1722736"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:37:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 00/39] drm/bridge: switch to struct drm_edid
Date: Tue, 23 Jan 2024 21:37:06 +0200
Message-Id: <cover.1706038510.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v3 of [1] with a couple of patches fixed.

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/128149/


Jani Nikula (39):
  drm/bridge: add ->edid_read hook and drm_bridge_edid_read()
  drm/bridge: switch to drm_bridge_read_edid()
  drm/bridge: chrontel-ch7033: switch to drm_bridge_read_edid()
  drm/bridge: lt8912b: use drm_bridge_read_edid()
  drm/bridge: lt8912b: clear the EDID property on failures
  drm/bridge: lt8912b: use ->edid_read callback
  drm/bridge: lt9611uxc: use drm_bridge_read_edid()
  drm: bridge: simple-bridge: use drm_bridge_edid_read()
  drm: bridge: simple-bridge: clear the EDID property on failures
  drm/bridge: tfp410: use drm_bridge_edid_read()
  drm/bridge: tfp410: clear the EDID property on failures
  drm/meson: switch to drm_bridge_edid_read()
  drm/bridge: remove drm_bridge_get_edid() in favour of
    drm_bridge_edid_read()
  drm/bridge: anx7625: switch to ->edid_read callback
  drm/bridge: cdns-mhdp8546: switch to ->edid_read callback
  drm/bridge: cdns-mhdp8546: clear the EDID property on failures
  drm/bridge: display-connector: switch to ->edid_read callback
  drm/bridge: it6505: switch to ->edid_read callback
  drm: bridge: it66121: switch to ->edid_read callback
  drm/bridge: lt9611: switch to ->edid_read callback
  drm/bridge: lt9611uxc: switch to ->edid_read callback
  drm/bridge: megachips: switch to ->edid_read callback
  drm/bridge: nxp-ptn3460: switch to ->edid_read callback
  drm/bridge: sii902x: use display info is_hdmi
  drm/bridge: sii902x: switch to ->edid_read callback
  drm/mediatek/dp: switch to ->edid_read callback
  drm/mediatek/hdmi: switch to ->edid_read callback
  drm/msm/hdmi: fix indent
  drm/msm/hdmi: switch to ->edid_read callback
  drm/omap/hdmi4: switch to ->edid_read callback
  drm/omap/hdmi5: switch to ->edid_read callback
  drm: xlnx: zynqmp_dpsub: switch to ->edid_read callback
  drm: adv7511: switch to ->edid_read callback
  drm: bridge: dw_hdmi: switch to ->edid_read callback
  drm: bridge: dw_hdmi: clear the EDID property and CEC address on
    failures
  drm/bridge: tc358767: update the EDID property
  drm/bridge: tc358767: switch to ->edid_read callback
  drm/bridge: ti-sn65dsi86: switch to ->edid_read callback
  drm/bridge: remove ->get_edid callback

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  | 47 ++++++++++++-------
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 30 ++++--------
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 28 ++++++-----
 drivers/gpu/drm/bridge/chrontel-ch7033.c      | 12 ++---
 drivers/gpu/drm/bridge/display-connector.c    |  8 ++--
 drivers/gpu/drm/bridge/ite-it6505.c           | 17 +++----
 drivers/gpu/drm/bridge/ite-it66121.c          | 16 +++----
 drivers/gpu/drm/bridge/lontium-lt8912b.c      | 20 ++++----
 drivers/gpu/drm/bridge/lontium-lt9611.c       |  8 ++--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c    | 18 +++----
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 18 +++----
 drivers/gpu/drm/bridge/nxp-ptn3460.c          | 22 +++++----
 drivers/gpu/drm/bridge/sii902x.c              | 38 +++++++--------
 drivers/gpu/drm/bridge/simple-bridge.c        | 17 +++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 43 ++++++++++-------
 drivers/gpu/drm/bridge/tc358767.c             | 17 +++----
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  8 ++--
 drivers/gpu/drm/bridge/ti-tfp410.c            | 18 +++----
 drivers/gpu/drm/drm_bridge.c                  | 17 +++----
 drivers/gpu/drm/drm_bridge_connector.c        | 16 +++----
 drivers/gpu/drm/mediatek/mtk_dp.c             | 31 +++++++-----
 drivers/gpu/drm/mediatek/mtk_hdmi.c           | 26 ++++++----
 drivers/gpu/drm/meson/meson_encoder_hdmi.c    | 20 ++++++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        | 33 ++++++++-----
 drivers/gpu/drm/omapdrm/dss/hdmi4.c           | 22 ++++++---
 drivers/gpu/drm/omapdrm/dss/hdmi5.c           | 12 ++---
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |  8 ++--
 include/drm/drm_bridge.h                      | 25 +++++-----
 28 files changed, 328 insertions(+), 267 deletions(-)

-- 
2.39.2

