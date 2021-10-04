Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C91A0420A07
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 13:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E02D6E9E2;
	Mon,  4 Oct 2021 11:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C416E9DE;
 Mon,  4 Oct 2021 11:24:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="225705692"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="225705692"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 04:24:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="713101010"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 04 Oct 2021 04:24:47 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH v2] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Date: Mon,  4 Oct 2021 04:36:29 -0700
Message-Id: <20211004113629.23715-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case of a modeset where a mode gets split across mutiple CRTCs
in the driver specific implementation (bigjoiner in i915) we wrongly count
the affected CRTCs based on the drm_crtc_mask and indicate the stolen CRTC as
an affected CRTC in atomic_check_only().
This triggers a warning since affected CRTCs doent match requested CRTC.

To fix this in such bigjoiner configurations, we should only
increment affected crtcs if that CRTC is enabled in UAPI not
if it is just used internally in the driver to split the mode.

There is no way we can adjust requested_crtc calculation as suggested
in review comments because the crtc gets stolen only after the atomic_check call.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
---
 drivers/gpu/drm/drm_atomic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ff1416cd609a..44e7ebf43a2a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1360,8 +1360,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 		}
 	}
 
-	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
-		affected_crtc |= drm_crtc_mask(crtc);
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->enable)
+			affected_crtc |= drm_crtc_mask(crtc);
+	}
 
 	/*
 	 * For commits that allow modesets drivers can add other CRTCs to the
-- 
2.19.1

