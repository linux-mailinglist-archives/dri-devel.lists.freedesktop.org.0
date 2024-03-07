Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F47875896
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E573610F53C;
	Thu,  7 Mar 2024 20:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvIB4Wr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D42710F3E0;
 Thu,  7 Mar 2024 20:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709843988; x=1741379988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0/VLoLAkkcQ460mpIrzRyWIjpoo+YDempRkc9Qu0gAE=;
 b=hvIB4Wr78AMd8N3vvL8rWvI3PyurVry4S7EBhmd2JWx/Gean2zmR9IJ9
 dPk8/R80z7QuXdZjtUkBzqu83AjNTahXC4ROZpkWd6ADorUQ1r1tC5BgS
 MlA83aKdOv3dpg4pHbGffM8If7uDAv2lJVNC+CVhKCNjzcVhHO+zyYmvp
 OqPjiZi3jLbaZ4s5unji41t7Rdem90UMHCU3YfbjKXoU6ljWm+PS682uF
 6BH+PtK9rRpMUAOzS3saSyi/thf39f9MOIMrAcWvf68Jk1DElz138dtW9
 ClV42ljEylMvI0wKY3Ge6LIiXG7TPo3VPcwny9umkbkyWnlJH1Ov9ZxBE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4680395"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4680395"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:39:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10362328"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:39:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 0/6] drm: debug logging improvements
Date: Thu,  7 Mar 2024 22:39:32 +0200
Message-Id: <cover.1709843865.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch a handful of places over to drm device based logging and WARNs,
unify connector and crtc logging, etc.

Jani Nikula (6):
  drm/modes: add drm_mode_print() to dump mode in drm_printer
  drm/probe-helper: switch to drm device based logging
  drm/modes: switch drm_mode_prune_invalid() to use struct drm_printer
  drm/modes: switch to drm device based error logging
  drm/sysfs: switch to drm device based logging
  drm/client: switch to drm device based logging, and more

 drivers/gpu/drm/drm_client_modeset.c | 129 +++++++++++++++------------
 drivers/gpu/drm/drm_modes.c          |  51 +++++++----
 drivers/gpu/drm/drm_probe_helper.c   |  41 ++++-----
 drivers/gpu/drm/drm_sysfs.c          |  21 +++--
 include/drm/drm_modes.h              |   2 +
 5 files changed, 137 insertions(+), 107 deletions(-)

-- 
2.39.2

