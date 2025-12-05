Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD5ACA75E6
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF50610E1F8;
	Fri,  5 Dec 2025 11:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcddaSkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E04710E1F8;
 Fri,  5 Dec 2025 11:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934070; x=1796470070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DuAGaIue/e6aYCC6/JpTfAb6UPMC/P66H0IzNhPAd9E=;
 b=bcddaSkC98lP+9y3NEuvBIm3ThS8pxngleecC2wgcRvrw+SkRjA5m5bn
 sAdtGBmfHPo07DRN6kALG7Hx3QEXMkQlWRoPz4p8wnQNC53+kqBgvFC/z
 BBeX/o3rZtGSl643RMYJ2Dxk4Q6AYaqskzXQ1q3KXQ1/z2dgGck5saVny
 oMLdyofF1/347ZDdSVmcCVzfhbVxUt0p5lnK+2Mf814eZ87LnTbNDM/UX
 +q+gzNHrJpnqGZaeuELubkCIfq7WZFDnWzbzYC6UytGBFZXJ/IsI8FhMI
 7W2JkgHk738sZ8r/I9cnI3Znf34FvhRL93UaiMbMuvW58WoI0Axc/SwWR w==;
X-CSE-ConnectionGUID: uoZ9nSDwRpygrfOeposvCw==
X-CSE-MsgGUID: 4JxAxYaRRh6JnG8uckWxKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65968416"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="65968416"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:27:50 -0800
X-CSE-ConnectionGUID: 5SVsSBJZSceHXjk8rhQNAw==
X-CSE-MsgGUID: WfSpz+nQTpmLOFqaNAXfTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="232650301"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:27:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 00/25] drm/vblank: refactoring and cleanups
Date: Fri,  5 Dec 2025 13:27:16 +0200
Message-ID: <cover.1764933891.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

v3 of [1], just a resend to dri-devel, which I forgot to add, and
Thomas' R-b's, which I also forgot to add, in v2.

Fingers crossed I don't fumble it this time.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1764845757.git.jani.nikula@intel.com


Jani Nikula (24):
  drm/vblank: remove drm_wait_one_vblank() completely
  drm/vblank: remove superfluous pipe check
  drm/vblank: add return value to drm_crtc_wait_one_vblank()
  drm/vblank: limit vblank variable scope to atomic
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
 drivers/gpu/drm/drm_vblank.c      | 533 ++++++++++++++----------------
 drivers/gpu/drm/drm_vblank_work.c |  12 +-
 include/drm/drm_vblank.h          |   3 +-
 4 files changed, 257 insertions(+), 298 deletions(-)

-- 
2.47.3

