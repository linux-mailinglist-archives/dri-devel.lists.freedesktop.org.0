Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41454A2F99
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 14:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126461125AB;
	Sat, 29 Jan 2022 13:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B391125AB
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 13:00:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91BFA60C09;
 Sat, 29 Jan 2022 13:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD14C340E5;
 Sat, 29 Jan 2022 13:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643461234;
 bh=/PtTKARvmdASXmkd+OgorF3gx0Ddyj3vM9MULOidjyA=;
 h=Subject:To:Cc:From:Date:From;
 b=lRRW+qdyXmqcHTQvzRE9wFdfLNw/xvdx6gouDmLGDkWa04q7fV7Qh7lUlqSN75kQe
 t62iPPirKj4SwP6vHaZCBrhe54iKPh672EH9fOWoJtTB4q7L/suLP67oIbJa4bT4W6
 5kNrJicKLGcGYL/w9jwalyyYkbL12tbKbHgANJj8=
Subject: Patch "drm/atomic: Add the crtc to affected crtc only if uapi.enable
 = true" has been added to the 5.16-stable tree
To: contact@emersion.fr, daniel.vetter@intel.com, daniels@collabora.com,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 manasi.d.navare@intel.com, pekka.paalanen@collabora.co.uk,
 ville.syrjala@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Sat, 29 Jan 2022 14:00:08 +0100
Message-ID: <164346120845187@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/atomic: Add the crtc to affected crtc only if uapi.enable = true

to the 5.16-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-atomic-add-the-crtc-to-affected-crtc-only-if-uapi.enable-true.patch
and it can be found in the queue-5.16 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 5ec1cebd59300ddd26dbaa96c17c508764eef911 Mon Sep 17 00:00:00 2001
From: Manasi Navare <manasi.d.navare@intel.com>
Date: Mon, 4 Oct 2021 04:59:13 -0700
Subject: drm/atomic: Add the crtc to affected crtc only if uapi.enable = true
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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


Patches currently in stable-queue which might be from manasi.d.navare@intel.com are

queue-5.16/drm-atomic-add-the-crtc-to-affected-crtc-only-if-uapi.enable-true.patch
