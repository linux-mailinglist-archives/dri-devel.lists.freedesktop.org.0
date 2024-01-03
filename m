Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472B1822AEC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2917410E268;
	Wed,  3 Jan 2024 10:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB5A10E268
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276555; x=1735812555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cIxaJJI4MDeQbz7nPGeZtfqMamaaHYTNZwnDjOrv9bk=;
 b=Y8YIN8DBnwnFAzTeaLsI5c13TZHp0BX+a1qXec3m1vnkiAsxg6PEIgA1
 u5tTE6E8iaSk1cAppsBz/qIyAPeb0sc0nClA+xU4G2U2oCTCL3SRejMS3
 PP8efy2umsa2DvUfhlc4AJWyWmMkGI9+HgjjrYIdFNMfk8q8U7Nx14OKL
 xQsk4Nf+ITEgf0S1ZnI36aw3YblxUst/VA6Y3h+3boGfgNbUzg55ah01c
 vEzz/6dlvIDfeziG7LgPRzAvf4+AcBq7d3jO5YPMAaLYK9rofroFxMhEY
 y64LAR6WNDu9SzOCJdGMyRqpEDM+6ZqUrlhwz5ZaFmhwBCdlbSQ/2vgyA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3759799"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3759799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="22052938"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 00/39] drm/bridge: switch to struct drm_edid
Date: Wed,  3 Jan 2024 12:08:14 +0200
Message-Id: <cover.1704276309.git.jani.nikula@intel.com>
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

Convert all of drm/bridge to the new struct drm_edid
infrastructure. It's safer than struct edid, because it contains meta
information about the allocated size of the EDID, instead of relying on
the size (number of extensions) originating from outside of the kernel.

Among all of drm, I think bridge has the most uses of struct edid that
do not originate from the drm_get_edid() family of functions, which
means the validity checks are somewhat inconsistent, and having the meta
information is more crucial.

Only build tested. I'm sure there should be more Cc's especially in the
patches towards the end of the series, but I just wanted to get the
series out the door now.

BR,
Jani.

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
 drivers/gpu/drm/bridge/nxp-ptn3460.c          | 23 +++++----
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
 28 files changed, 329 insertions(+), 267 deletions(-)

-- 
2.39.2

