Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5CBC3FA17
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3807110EA85;
	Fri,  7 Nov 2025 11:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+w+4Hc9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC71410EA7F;
 Fri,  7 Nov 2025 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762513508; x=1794049508;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PtnViIvbab2X9ucF9IbFnI1gP61UQyrFgvHO74FPQF4=;
 b=c+w+4Hc9OS51r820XUjK472319SOJNsABhx9a0NGNhKCRpJZKYrMeMiC
 uUsFwWsxSWo8sewuE/D2Th9v1KGhRayBLXRUOQevnG3r4ydjia2kQFAGj
 qBWX4A4UAo3HuVkkfK1DdPYTuL/IkGQjcI9agaxcmfy8RFhBMeSwlFbCx
 8lsvOUwDf/aMy9ergj7JKCIrbej6XU43SX2ic9TA8jknBpPZm6UrCmvyO
 86IFhpwnzWYqk28PimFZukJtdCUTYuuFI1jBZCJoU6h0+LBlH1RajFoKp
 1v6125mRDr0R+KPNXeO0p33WUAAoUUIGf9aBHvy6pf+obrxJsF1lnZVPN A==;
X-CSE-ConnectionGUID: /eX/yQ+rR0aKMUUkGTI4OA==
X-CSE-MsgGUID: n7bIfxNQSBOMrqk4EBbQ+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="82063885"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="82063885"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:07 -0800
X-CSE-ConnectionGUID: x0c61dh/TROTx76JnI36ww==
X-CSE-MsgGUID: LndIHmi0RheNFkauOoPlrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="187855760"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.124])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH 0/6] drm: avoid poking at dev->vblank[] directly
Date: Fri,  7 Nov 2025 13:04:54 +0200
Message-ID: <cover.1762513240.git.jani.nikula@intel.com>
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

We have accessors for dev->vblank[], and poking at that directly should
be reserved for drm_vblank.c. This series along with [1] switches to use
the accessors.

I've got a whole another series brewing refactoring drm_vblank.c, but
wanted to split this out of the series to keep it manageable. None of
the patches here depend on each other, and the refactoring doesn't
depend on it, so the patches to drivers can be merged every which way,
just let me know.

BR,
Jani.



[1] https://lore.kernel.org/r/20251106200000.1455164-1-jani.nikula@intel.com


Jani Nikula (6):
  drm/vblank: use drm_crtc_vblank_crtc() in workers
  drm/atomic: use drm_crtc_vblank_waitqueue()
  drm/msm: use drm_crtc_vblank_waitqueue()
  drm/tidss: use drm_crtc_vblank_crtc()
  drm/vmwgfx: use drm_crtc_vblank_crtc()
  drm/gma500: use drm_crtc_vblank_crtc()

 drivers/gpu/drm/drm_atomic_helper.c       |  4 ++-
 drivers/gpu/drm/drm_vblank_work.c         |  2 +-
 drivers/gpu/drm/gma500/psb_irq.c          | 36 +++++++++++++++--------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |  3 +-
 drivers/gpu/drm/tidss/tidss_crtc.c        |  3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c      |  6 ++--
 7 files changed, 34 insertions(+), 23 deletions(-)

-- 
2.47.3

