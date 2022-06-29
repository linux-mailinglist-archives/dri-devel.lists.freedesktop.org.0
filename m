Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B1455FBE6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 11:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0115E11A3E3;
	Wed, 29 Jun 2022 09:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FF511A3C7;
 Wed, 29 Jun 2022 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656494882; x=1688030882;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=53uwy6ciqv24BC2ki8xd1xlAT7sdbbSGMwRPtbIAX4c=;
 b=QLwo0gSzmAZmeW0Vm7ltPD3LW12hXqp0xhFsoXnldkS7GeiSh/gylDep
 AT+jkhwdoiV3xeiBZK2in6GQAIGDsYiA7kE4vDC/DoX+jst6dfPId/Htc
 wxs+cREy6dwAwI4/G9YcZ0qw2JqhLzDWu5oaBkwIe1Q1odY0fgCV02OIz
 I6V8k4bomWQF2Clyh5M2IzAUjqXYIrrKzatMD4fzWmhrGCJhjNEPFQVBy
 OckVIuQv0qS9GB9sRUM4LUBoS4vwZWLPwPrCC2sHDl8W6HepyYDNcbzrB
 tcbQ6g9sdNjC6F2EQQe+dEroRvaApKHfvSp7B4UdbTZsiFDx0Lj6ZO2pe Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="262391233"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="262391233"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 02:28:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="647316056"
Received: from srdoo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.102])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 02:28:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI RESEND 00/10] drm/edid: expand on struct drm_edid usage
Date: Wed, 29 Jun 2022 12:27:45 +0300
Message-Id: <cover.1656494768.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resend of [1] for CI, also sending without the i915 changes, to be
merged on top.

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/104309/


Jani Nikula (10):
  drm/edid: move drm_connector_update_edid_property() to drm_edid.c
  drm/edid: convert drm_connector_update_edid_property() to struct
    drm_edid
  drm/edid: clean up connector update error handling and debug logging
  drm/edid: abstract debugfs override EDID set/reset
  drm/edid: add drm_edid_connector_update()
  drm/probe-helper: add drm_connector_helper_get_modes()
  drm/edid: add drm_edid_raw() to access the raw EDID data
  drm/edid: do invalid block filtering in-place
  drm/edid: add HF-EEODB support to EDID read and allocation
  drm/edid: take HF-EEODB extension count into account

 drivers/gpu/drm/drm_connector.c     |  74 ------
 drivers/gpu/drm/drm_crtc_internal.h |   5 +-
 drivers/gpu/drm/drm_debugfs.c       |  21 +-
 drivers/gpu/drm/drm_edid.c          | 376 ++++++++++++++++++++++++----
 drivers/gpu/drm/drm_probe_helper.c  |  34 +++
 include/drm/drm_connector.h         |   6 +-
 include/drm/drm_edid.h              |   3 +
 include/drm/drm_probe_helper.h      |   1 +
 8 files changed, 381 insertions(+), 139 deletions(-)

-- 
2.30.2

