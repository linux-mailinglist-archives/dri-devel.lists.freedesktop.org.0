Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E97F797136
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 11:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDC110E063;
	Thu,  7 Sep 2023 09:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEC810E7A5;
 Thu,  7 Sep 2023 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694078911; x=1725614911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VR8ecihM1JOlQ241fsn2DNPwPweNXHAdsPsF4oEUxvE=;
 b=Fuz9A6Es4Te5ITYjxz+q3SGuXLyfOzHRQYqYLEr2/cUHY1lrPWazcN6R
 Q+Sdsuuv1E9G0GAB8cFQgBTlFimNoK2JEG0LDExSSnzKVC69Bq4IT2Zb/
 6M7GizHpCJ/upVPmsOUeL3lR12Ijjtr2a4k3+/qv4Qy5rwPNmbP32BJj/
 xzHMFM6BrYB0TT2QFty+bc/MVE1MDk3gq7j52mhZSFG9kmB4snWx+pg+o
 pD1KNa5SY/+B9MrRruUf+Wc6jr+8IQLpwra09ef4F1fgjqyYXOWJJKPnJ
 0pdGZ+WeqUWZ4Wt0q7fwOCG2GqNCHSB8xQpel9f2o25OAb7LydXZ8dBa0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443690208"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="443690208"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741958623"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="741958623"
Received: from iraduica-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.21])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:28:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm/edid: split out drm_eld.[ch], add some SAD helpers
Date: Thu,  7 Sep 2023 12:28:18 +0300
Message-Id: <cover.1694078430.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split out drm_eld.[ch] from drm_edid.h, add some helpers to convert and
modify SADs.

This should make it easier and more robust to implement things like [1],
with ELD parsing details hidden in drm_eld.[ch].

	for (i = 0; i < drm_eld_sad_count(eld); i++) {
		struct cea_sad sad;

		drm_eld_sad_get(eld, i, &sad);
		/* do stuff with sad */
		drm_eld_sad_set(eld, i, &sad);
	}

struct cea_sad provides an easier way to manipulate CTA SADs.

** UNTESTED ***

Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

[1] https://patchwork.freedesktop.org/patch/msgid/20230821160004.2821445-4-mitulkumar.ajitkumar.golani@intel.com


Jani Nikula (6):
  drm/edid: split out drm_eld.h from drm_edid.h
  drm/eld: replace uint8_t with u8
  drm/edid: include drm_eld.h only where required
  drm/edid: use a temp variable for sads to drop one level of
    dereferences
  drm/edid: add helpers to get/set struct cea_sad from/to 3-byte sad
  drm/eld: add helpers to modify the SADs of an ELD

 Documentation/gpu/drm-kms-helpers.rst         |   6 +
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 +
 drivers/gpu/drm/drm_edid.c                    |  42 +++--
 drivers/gpu/drm/drm_eld.c                     |  55 ++++++
 drivers/gpu/drm/drm_internal.h                |   6 +
 drivers/gpu/drm/i915/display/intel_audio.c    |   1 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   1 +
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   1 +
 drivers/gpu/drm/radeon/radeon_audio.c         |   1 +
 drivers/gpu/drm/tegra/hdmi.c                  |   1 +
 drivers/gpu/drm/tegra/sor.c                   |   1 +
 include/drm/drm_edid.h                        | 148 ----------------
 include/drm/drm_eld.h                         | 164 ++++++++++++++++++
 sound/core/pcm_drm_eld.c                      |   1 +
 sound/soc/codecs/hdac_hdmi.c                  |   1 +
 sound/soc/codecs/hdmi-codec.c                 |   1 +
 sound/x86/intel_hdmi_audio.c                  |   1 +
 19 files changed, 274 insertions(+), 160 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_eld.c
 create mode 100644 include/drm/drm_eld.h

-- 
2.39.2

