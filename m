Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B9E3CA733
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E536E896;
	Thu, 15 Jul 2021 18:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962EB6E88B;
 Thu, 15 Jul 2021 18:50:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="197796124"
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="197796124"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 11:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="428893753"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 15 Jul 2021 11:49:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Jul 2021 21:49:54 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] drm: Make modeset locking easier
Date: Thu, 15 Jul 2021 21:49:50 +0300
Message-Id: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

While staring at some DRM_MODESET_LOCK_ALL_{BEGIN,END}() conversions
I decided I don't really like what those macros do.

The main problems that I see:
- the magic goto inside limits their usefulness to baically
  a single statement, unless you're willing to look inside and
  find out the name of the magic label
- can't help at all in the "we don't want to lock everything"
  cases, which are quite numerous
- not at all obvious that there's a loop in there

So I figured I'd try to come up with something more universally useful.

Cc: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Vetter <daniel@ffwll.ch>

Ville Syrjälä (4):
  drm: Introduce drm_modeset_lock_ctx_retry()
  drm: Introduce drm_modeset_lock_all_ctx_retry()
  drm/i915: Extract intel_crtc_initial_commit()
  drm/i915: Use drm_modeset_lock_ctx_retry() & co.

 drivers/gpu/drm/drm_modeset_lock.c            |  44 ++++
 drivers/gpu/drm/i915/display/g4x_dp.c         |  17 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  17 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  16 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 192 ++++++++----------
 .../drm/i915/display/intel_display_debugfs.c  |  45 ++--
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  38 ++--
 include/drm/drm_modeset_lock.h                |  26 +++
 8 files changed, 188 insertions(+), 207 deletions(-)

-- 
2.31.1

