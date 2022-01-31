Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6064A4324
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 12:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C7710E160;
	Mon, 31 Jan 2022 11:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4DC10E160
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 11:17:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE5A2B82A69;
 Mon, 31 Jan 2022 11:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E40C340E8;
 Mon, 31 Jan 2022 11:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643627845;
 bh=H8Kqjec3vy20GA6mnXYJLGonJa+G2hoAOvhv1VCBA/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TcmtMf6YD8Z2zXPMFheCaA4QexcHABBEsRs6e+Er3Vexg4POinyhK4iwPxRzG6WNw
 wvNltbG//I3S20HfYtTs3GQlfq8Yhxul8sHqsX+U4ae3UjQK9GeXG8qdHYgHS+RFpT
 xKxM5TlsZUAXb90uOvuMvifm3TT5JKFgzhwI+wDQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.16 043/200] drm/atomic: Add the crtc to affected crtc only
 if uapi.enable = true
Date: Mon, 31 Jan 2022 11:55:06 +0100
Message-Id: <20220131105235.001695685@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220131105233.561926043@linuxfoundation.org>
References: <20220131105233.561926043@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Manasi Navare <manasi.d.navare@intel.com>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Manasi Navare <manasi.d.navare@intel.com>

commit 5ec1cebd59300ddd26dbaa96c17c508764eef911 upstream.

In case of a modeset where a mode gets split across multiple CRTCs
in the driver specific implementation (bigjoiner in i915) we wrongly count
the affected CRTCs based on the drm_crtc_mask and indicate the stolen CRTC as
an affected CRTC in atomic_check_only().
This triggers a warning since affected CRTCs doent match requested CRTC.

To fix this in such bigjoiner configurations, we should only
increment affected crtcs if that CRTC is enabled in UAPI not
if it is just used internally in the driver to split the mode.

v3: Add the same uapi crtc_state->enable check in requested
crtc calc (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.11+
Fixes: 919c2299a893 ("drm/i915: Enable bigjoiner")
Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20211004115913.23889-1-manasi.d.navare@intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_atomic.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1310,8 +1310,10 @@ int drm_atomic_check_only(struct drm_ato
 
 	DRM_DEBUG_ATOMIC("checking %p\n", state);
 
-	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
-		requested_crtc |= drm_crtc_mask(crtc);
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (new_crtc_state->enable)
+			requested_crtc |= drm_crtc_mask(crtc);
+	}
 
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
@@ -1360,8 +1362,10 @@ int drm_atomic_check_only(struct drm_ato
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


