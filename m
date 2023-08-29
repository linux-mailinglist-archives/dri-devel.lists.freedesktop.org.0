Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3744A78C365
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9AD10E254;
	Tue, 29 Aug 2023 11:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AE510E24F;
 Tue, 29 Aug 2023 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309166; x=1724845166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iSVgEFAEpUt3qJJgYH8h8/2ZRMQaHPWcElr70Xk5Kz4=;
 b=fwG9Sru8NOVja2ad6okI/vDuVZAKa9e2stwEezbkB1hgK6QXaMjlgc1F
 mqJU5Ep/MWfiqn0I9EjrCos/YtfK5bAEPYMo8QSyIh82zJ9KO2t5NvNRI
 IZM1hYtXJ32T/8nC6i3K1YMlOn5wS5Xr+p81sBSOU8PvAPnT9eRDkJ5Xx
 hIoONGSAcwUKuAv5DtQP9pV5+O4CSUsox2xH9N5UIR2FKWKN66gai5Ww9
 VtTvnEiKIENxm60JXfmkwRsqqG97NCXNw2hRDaxImf3OPZdSKhIyML3vX
 u0c0QB6S4qIFi1j4D/K2AJkbKU7kaE4gFZ8igOEkzmzH+QNQWcenCRDzK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378063901"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="378063901"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:39:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738668957"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="738668957"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 29 Aug 2023 04:39:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:39:20 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/12] drm/i915: Populate connector->ddc always
Date: Tue, 29 Aug 2023 14:39:08 +0300
Message-ID: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Populate connector->ddc for all output types that don't already
do so, and clean up a bunch of code as a result of having the
ddc i2c adapter in easy reach. And this also provides the sysfs
"ddc" symlink.

There are potentially a few oddball (mostly DVI-I) cases where
the connector detection/EDID read uses an alternate DDC bus
internally, and so for those the symlink might not point at the
correct i2c adapter. I'm not interested in spending extra brain
cells on those, so we'll leave them as is for now.

Ville Syrjälä (12):
  drm: Reorder drm_sysfs_connector_remove() vs.
    drm_debugfs_connector_remove()
  drm/sysfs: Register "ddc" symlink later
  drm/i915: Call the DDC bus i2c adapter "ddc"
  drm/i915/lvds: Populate connector->ddc
  drm/i915/crt: Populate connector->ddc
  drm/i915/dvo: Populate connector->ddc
  drm/i915/dp: Populate connector->ddc
  drm/i915/mst: Populate connector->ddc
  drm/i915/hdmi: Use connector->ddc everwhere
  drm/i915/hdmi: Nuke hdmi->ddc_bus
  drm/i915/hdmi: Remove old i2c symlink
  drm/i915/sdvo: Constify mapping structs

 drivers/gpu/drm/drm_connector.c               | 11 ++-
 drivers/gpu/drm/drm_internal.h                |  2 +
 drivers/gpu/drm/drm_sysfs.c                   | 22 +++--
 .../gpu/drm/i915/display/intel_connector.c    |  6 +-
 .../gpu/drm/i915/display/intel_connector.h    |  2 +-
 drivers/gpu/drm/i915/display/intel_crt.c      | 38 +++----
 drivers/gpu/drm/i915/display/intel_ddi.c      |  5 +-
 .../drm/i915/display/intel_display_types.h    |  1 -
 drivers/gpu/drm/i915/display/intel_dp.c       |  9 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  6 +-
 drivers/gpu/drm/i915/display/intel_dvo.c      | 11 +--
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 98 ++++++-------------
 drivers/gpu/drm/i915/display/intel_lspcon.c   | 14 +--
 drivers/gpu/drm/i915/display/intel_lvds.c     | 23 +++--
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  6 +-
 15 files changed, 119 insertions(+), 135 deletions(-)

-- 
2.41.0

