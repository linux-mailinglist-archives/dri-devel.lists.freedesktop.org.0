Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A8796D1B6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 10:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3E510E54B;
	Thu,  5 Sep 2024 08:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="epDkYPQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C788310E54B;
 Thu,  5 Sep 2024 08:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yUazBJQ+QLYnFTVOhQEdGZ4XaQr+gVCmUQ3c7qcY42I=; b=epDkYPQFYcZnHgpnCI6z/D7GT+
 rFG8AuYaw+mKxUUpl1TF89jXmzvAStdaJPdcXrZezHziB4O7Iu61YvBDkrztHZwCYUvnDzAjD1pBw
 WAB1Vv4LxnwBII6B2s0kW5chFJareL7xpTqiIl3FPNUo13BzDnmKQ+7MvmKF1el5Ddtyt10sTQ3XY
 72F73GteAuw8bP4qmcycPUZeZW/bQl2jzGtdzIBK+m7IsQlsPE2fVBXWsdTl6dV8BtjHgC5wc4nu2
 4vSuJcxZNBPkXb275Nx6fwAb7aa3XUV3MbDA4xnCd+xemN4go0t6JaR3JYOQN26YUggWsm+Bzq6jQ
 +d6mT0zA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sm7fb-009qwF-IK; Thu, 05 Sep 2024 10:16:47 +0200
Date: Thu, 5 Sep 2024 09:16:45 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <Ztlo2hVO4SBvfAnq@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi Dave, Sima,

Some fixes for the weekly cycle:

Avoid pointless attempts to reload GSC, fix for VBIOS/GOP LUT takeover on
ILK and SNB, eliminate regressions by limitting Fast Wake sync pulse
workaround to Dell Precision 5490 with AUO panels only and some clang
build fixes.

Regards,

Tvrtko

drm-intel-fixes-2024-09-05:
- drm/i915: Do not attempt to load the GSC multiple times (Daniele Ceraolo Spurio)
- drm/i915: Fix readout degamma_lut mismatch on ilk/snb (Ville Syrjälä)
- drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused (Andy Shevchenko)
- drm/i915/fence: Mark debug_fence_free() with __maybe_unused (Andy Shevchenko)
- drm/i915/display: Add mechanism to use sink model when applying quirk [display] (Jouni Högander)
- drm/i915/display: Increase Fast Wake Sync length as a quirk [display] (Jouni Högander)
The following changes since commit 431c1646e1f86b949fa3685efc50b660a364c2b6:

  Linux 6.11-rc6 (2024-09-01 19:46:02 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-09-05

for you to fetch changes up to a13494de53258d8cf82ed3bcd69176bbf7f2640e:

  drm/i915/display: Increase Fast Wake Sync length as a quirk (2024-09-03 10:22:39 +0300)

----------------------------------------------------------------
- drm/i915: Do not attempt to load the GSC multiple times (Daniele Ceraolo Spurio)
- drm/i915: Fix readout degamma_lut mismatch on ilk/snb (Ville Syrjälä)
- drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused (Andy Shevchenko)
- drm/i915/fence: Mark debug_fence_free() with __maybe_unused (Andy Shevchenko)
- drm/i915/display: Add mechanism to use sink model when applying quirk [display] (Jouni Högander)
- drm/i915/display: Increase Fast Wake Sync length as a quirk [display] (Jouni Högander)

----------------------------------------------------------------
Andy Shevchenko (2):
      drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused
      drm/i915/fence: Mark debug_fence_free() with __maybe_unused

Daniele Ceraolo Spurio (1):
      drm/i915: Do not attempt to load the GSC multiple times

Jouni Högander (2):
      drm/i915/display: Add mechanism to use sink model when applying quirk
      drm/i915/display: Increase Fast Wake Sync length as a quirk

Ville Syrjälä (1):
      drm/i915: Fix readout degamma_lut mismatch on ilk/snb

 drivers/gpu/drm/i915/display/intel_alpm.c          |  2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  4 ++
 drivers/gpu/drm/i915/display/intel_dp.c            |  4 ++
 drivers/gpu/drm/i915/display/intel_dp_aux.c        | 16 +++--
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |  2 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c | 31 ++++++++--
 drivers/gpu/drm/i915/display/intel_quirks.c        | 68 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h        |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |  5 ++
 drivers/gpu/drm/i915/i915_sw_fence.c               |  8 +--
 11 files changed, 131 insertions(+), 17 deletions(-)
