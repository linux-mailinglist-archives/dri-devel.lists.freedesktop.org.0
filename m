Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51E562F32
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CBD10F418;
	Fri,  1 Jul 2022 08:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E57710F37F;
 Fri,  1 Jul 2022 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656665764; x=1688201764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gBcbt7vpu6FIciQzhRIg00DNXTRKJ9bU/ELB71RRins=;
 b=NXREYWY7tKgYkR1dFi0L7bL6diNmehc8h8zfk3iof47p2qtvpXi3YRNb
 OfBRu03YANxl+sq1Ei3NHDqu5zNbXxCoXzQXjp6Xtg3Cjt/ed8FdlH857
 dixTa1vpUrK3DFjGCk1vBUkZrQT8b+C4EjfMTN9011exD8i6V3ofSB/fb
 pB8itvczu0UsRi8mPWY1EXiIb38aQK0IOFwuCi5ZG0h1iRyweBZT6eKA5
 Uf+TRhdhvz4G8DW/dWFxrxZYXSgUz6GYokJZcTUDKrpNwfqvDwh6PV4U5
 mJlwnIDsWy11d0+7fV0T+/NhxXwizgtgvo2VpuEBniA2AJ0bUUoqiXUjB Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="281363098"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="281363098"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 01:55:48 -0700
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="648265757"
Received: from bachaue1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 01:55:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/2] drm/i915: switch DP, HDMI and LVDS to drm_edid
Date: Fri,  1 Jul 2022 11:55:37 +0300
Message-Id: <cover.1656665533.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The remaining patches to add HF-EEODB support to i915 by switching to
using drm_edid in certain encoders. This depends on the drm_edid work in
drm-misc-next, and either needs to be merged via drm-misc-next, or we'll
need the dependencies merged to drm-intel-next via drm-misc-next pull
request -> drm-next -> backmerge.

Jani Nikula (2):
  drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
  drm/i915/bios: convert intel_bios_init_panel() to drm_edid

 drivers/gpu/drm/i915/display/intel_bios.c     | 19 ++---
 drivers/gpu/drm/i915/display/intel_bios.h     |  4 +-
 .../gpu/drm/i915/display/intel_connector.c    |  4 +-
 .../drm/i915/display/intel_display_types.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 80 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 28 ++++---
 drivers/gpu/drm/i915/display/intel_lvds.c     | 37 +++++----
 7 files changed, 99 insertions(+), 77 deletions(-)

-- 
2.30.2

