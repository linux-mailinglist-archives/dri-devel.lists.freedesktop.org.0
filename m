Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0AE8A6C17
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C9110E83E;
	Tue, 16 Apr 2024 13:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="US5fBk/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A4310E83E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273769; x=1744809769;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GWmoUGpyvi0qKshldse/a+gHNfkd3uuO2leKEchMGyM=;
 b=US5fBk/kCS768xxR/1CaE7FH2m89Za8VLCaU29SH6bHPpr2NQYlH9/3o
 crbitk0dIoH8cBus4RYLD4Ge7QhD/cnH1W+SWvl+wAXN1GzigBZyzq+Ge
 BFuOfJO8mYLcabgCj9veM3xeM77Rd5HqhEn7vh3bkIbRpz2SK231iuTCo
 2Iao16tOk1YMDn0MlcJGr5oyZJzlIst4J3KAJ8Netko6RHNB3fD+CB9Cl
 QxwpCLahsoti1bzSCxT8y7WYKrjSMjRpfBxEnP0j9vX6VJTY8rzauXcJS
 YVrPiIguzm3EYa22rvyw2ucgzUh99e/rVf6/CsLikcAXsL9JWdv2TlQeO g==;
X-CSE-ConnectionGUID: 0NNDHHycTlWWjym0Pupwjw==
X-CSE-MsgGUID: eoBl70PdQeOu+rA9N0fOVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8875574"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8875574"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:22:35 -0700
X-CSE-ConnectionGUID: d5lct4TnT1SWEQV0Ob7/cQ==
X-CSE-MsgGUID: RuOmXibITliUNH5zNDFXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26905995"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:22:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 00/15] drm: struct drm_edid conversions
Date: Tue, 16 Apr 2024 16:22:14 +0300
Message-Id: <cover.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've these laying in a branch for a while, maybe let's try to make some
forward progress in this front.

Build tested only, on x86, arm, and arm64.

BR,
Jani.


Jani Nikula (15):
  drm/panel: simple: switch to struct drm_edid
  drm/panel-samsung-atna33xc20: switch to struct drm_edid
  drm/panel-edp: switch to struct drm_edid
  drm/bridge/analogix/anx6345: switch to struct drm_edid
  drm/bridge/analogix/anx78xx: switch to struct drm_edid
  drm/sun4i: hdmi: switch to struct drm_edid
  drm/vc4: hdmi: switch to struct drm_edid
  drm/bridge: anx7625: use struct drm_edid more
  drm/gud: switch to struct drm_edid
  drm/i2c: tda998x: switch to struct drm_edid
  drm/bochs: switch to struct drm_edid
  drm/virtio: switch to struct drm_edid
  drm/rockchip: cdn-dp: switch to struct drm_edid
  drm/rockchip: inno_hdmi: switch to struct drm_edid
  drm/rockchip: rk3066_hdmi: switch to struct drm_edid

 .../drm/bridge/analogix/analogix-anx6345.c    | 15 +++---
 .../drm/bridge/analogix/analogix-anx78xx.c    | 23 +++++-----
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 26 +++++++----
 drivers/gpu/drm/bridge/analogix/anx7625.h     | 10 +---
 drivers/gpu/drm/gud/gud_connector.c           | 12 ++---
 drivers/gpu/drm/i2c/tda998x_drv.c             | 19 ++++----
 drivers/gpu/drm/panel/panel-edp.c             | 17 ++++---
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 13 ++++--
 drivers/gpu/drm/panel/panel-simple.c          | 15 +++---
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 33 +++++++------
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c          | 12 ++---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        | 12 ++---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c        | 18 +++++---
 drivers/gpu/drm/tiny/bochs.c                  | 23 ++++------
 drivers/gpu/drm/vc4/vc4_hdmi.c                | 46 ++++++++++---------
 drivers/gpu/drm/virtio/virtgpu_display.c      | 10 ++--
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c           | 12 ++---
 19 files changed, 167 insertions(+), 153 deletions(-)

-- 
2.39.2

