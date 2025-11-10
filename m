Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F023AC47D8E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9CA10E42C;
	Mon, 10 Nov 2025 16:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1mYtq95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E883210E423;
 Mon, 10 Nov 2025 16:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791469; x=1794327469;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YRt5KKIqYSbaW4musnur5Q/dUZHufIECqY8z8h7/qhk=;
 b=m1mYtq95UWksxm/1HUWTk2yBJ8le5hCQUoSO0xqNSHCdxC/OzlPl2mDu
 HoZh6UfaHVWDzUm9i7JXN9TBtLTk9PInfc1Ie+1+EP0WaUjqT2joLslpI
 bPH7DtZPi2x9WSGcsm5ZNdPgNuxHF1NDI8Kz+yHcoiv/kpL+GV6nNxO+m
 gSPhP8TEnAbSstv7vx6Q1MKs4cF6x0kgXCKbYZ8/r3CYNqYh7eM20ElcT
 N3ufidEVHLy5+Yimz+WLAtAo6juTLj/XD0m23+pO1vbabf9gjNuu5UaiE
 HfeX3l8L7Jd/ZzHyEwNoiM0yTds6tVv4PxDxVBWB1R9fNbZ1ztl2z5Lju Q==;
X-CSE-ConnectionGUID: /hyNywEoSUe8QXnAUKrxiA==
X-CSE-MsgGUID: wkiBJVDTTPKJtPp+xhZIuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68691859"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="68691859"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:17:49 -0800
X-CSE-ConnectionGUID: nODsQCZoQCuL0uDgNc8nLA==
X-CSE-MsgGUID: e9zbcG94TJWGJYmIITlbHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="187966849"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:17:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/24] drm/vblank: refactoring and cleanups
Date: Mon, 10 Nov 2025 18:17:18 +0200
Message-ID: <cover.1762791343.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Mostly, pass vblank around a lot more instead of dev, pipe pair. This
allows cleanup of pipe bounds checks, etc.

BR,
Jani.


Jani Nikula (23):
  drm/vblank: remove drm_wait_one_vblank() completely
  drm/vblank: remove superfluous pipe check
  drm/vblank: add return value to drm_crtc_wait_one_vblank()
  drm/vblank: use the drm_vblank_crtc() and drm_crtc_vblank_crtc()
    helpers more
  drm/vblank: prefer drm_crtc_vblank_crtc() over drm_vblank_crtc()
  drm/vblank: pass vlank to drm_vblank_get()/_put()/_count()
  drm/vblank: pass vblank to drm_update_vblank_count()
  drm/vblank: pass vblank to drm_handle_vblank_events()
  drm/vblank: use the vblank based interfaces more
  drm/vblank: pass vblank to drm_queue_vblank_event()
  drm/vblank: pass vblank to drm_wait_vblank_reply()
  drm/vblank: pass vblank to drm_vblank_count_and_time()
  drm/vblank: pass vblank to drm_reset_vblank_timestamp()
  drm/vblank: pass vblank to store_vblank()
  drm/vblank: pass vblank to drm_vblank_enable()
  drm/vblank: merge drm_vblank_restore() into drm_crtc_vblank_restore()
  drm/vblank: add drm_crtc_from_vblank() helper
  drm/vblank: pass vblank to __get_vblank_counter() and
    drm_max_vblank_count()
  drm/vblank: pass vblank to __{enable,disable}_vblank()
  drm/vblank: pass vblank to drm_get_last_vbltimestamp()
  drm/vblank: pass vblank to drm_vblank_disable_and_save(), make static
  drm/vblank: reduce pipe checks
  drm/vblank: clean up debug logging

Thomas Zimmermann (1):
  drm/vblank: Unexport drm_wait_one_vblank()

 drivers/gpu/drm/drm_internal.h    |   7 +-
 drivers/gpu/drm/drm_vblank.c      | 470 ++++++++++++++----------------
 drivers/gpu/drm/drm_vblank_work.c |  12 +-
 include/drm/drm_vblank.h          |   3 +-
 4 files changed, 224 insertions(+), 268 deletions(-)

-- 
2.47.3

