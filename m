Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934B389BB8D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A382B10F7D2;
	Mon,  8 Apr 2024 09:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrdvHZ91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A113110E934;
 Mon,  8 Apr 2024 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712568250; x=1744104250;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LFR8GlupVXiLon0PLE0kijIsYGNKmo2QsGp+bUXc9Qs=;
 b=KrdvHZ910TfVtZ/NW3+6mDrPltRO476AL01TPJUyuywbbIauQkxAXrtT
 LqpQ7x1Ify6tXXTZVUG5eN9IHpf2mQ37PqTVRA0lM/7RIEBdPLZv4M9vc
 OClRBxk6Y99b+6EJeznnJCxsdNMHTp7lWlNxPtoBfMfDOkuSfq9pecVOS
 /MD1UY4ZgD7fGq8TQ4368vEnZ3jMcuOKrmtdvf24LVmq5W0ACXDxWyg0h
 Nh4QGQ6kWtp7BWx+Pcj1a2LDbFd6oZSUEVpoD/V9AkDowi4E57ApYO7w3
 lnbs86nQIkdtYcnGfmEeyeXc2eq5C/wnjxJHt3WtqZIjsUY/EFtcPi9kR g==;
X-CSE-ConnectionGUID: 2oqM7wa+TPaNQMiBlikTSw==
X-CSE-MsgGUID: Kf0XuTk0SYKct9/HvhULFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18557813"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="18557813"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:09 -0700
X-CSE-ConnectionGUID: 9ClmFyJ5RniBbtck3r6fpw==
X-CSE-MsgGUID: aa3eWWTGTAm9FmQSU54HTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="20261164"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/7] drm: debug logging improvements
Date: Mon,  8 Apr 2024 12:23:55 +0300
Message-Id: <cover.1712568037.git.jani.nikula@intel.com>
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

v2 of [1], dropping drm_mode_print() stuff altogether, and switching to
DRM_MODE_FMT/DRM_MODE_ARG() in a separate patch. Also add a few more drm
device based logging conversion patches, so the last patch makes more sense.

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/130881/

Jani Nikula (7):
  drm/probe-helper: switch to drm device based logging
  drm/modes: switch to drm device based error logging
  drm/sysfs: switch to drm device based logging
  drm/client: switch to drm device based logging, and more
  drm/crtc: switch to drm device based logging
  drm/crtc-helper: switch to drm device based logging and warns
  drm: prefer DRM_MODE_FMT/ARG over drm_mode_debug_printmodeline()

 drivers/gpu/drm/drm_atomic_uapi.c    |   6 +-
 drivers/gpu/drm/drm_client_modeset.c | 129 +++++++++++++++------------
 drivers/gpu/drm/drm_crtc.c           |  38 ++++----
 drivers/gpu/drm/drm_crtc_helper.c    | 100 +++++++++++----------
 drivers/gpu/drm/drm_modes.c          |  40 ++++-----
 drivers/gpu/drm/drm_probe_helper.c   |  39 ++++----
 drivers/gpu/drm/drm_sysfs.c          |  20 ++---
 7 files changed, 193 insertions(+), 179 deletions(-)

-- 
2.39.2

