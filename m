Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA8E78283B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 13:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFE010E235;
	Mon, 21 Aug 2023 11:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8D110E234
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 11:51:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 771F1612B2;
 Mon, 21 Aug 2023 11:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB29C433C8;
 Mon, 21 Aug 2023 11:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1692618678;
 bh=bMHUKDKf/xuAIkfTuOrCx8HUMdt2Wqqc5/w401hXdXI=;
 h=Subject:To:Cc:From:Date:From;
 b=FYdv7ncw2k7KGwB0cXQHiaQb4vrcuilcR9AqrziuxQ9/c9Py0X7Y3jvTeXi1BMyxH
 dhghmqS5gJXJOhvDvWJzXJQcqQlvFCMNj6IbKGWhuQLcfupFeirCGjfI0sABnSm2jU
 prf1xaeh3cRr6VUkG1I0kg5VAuih5ejYUn6IX2t4=
Subject: Patch "Revert "drm/edid: Fix csync detailed mode parsing"" has been
 added to the 6.4-stable tree
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 21 Aug 2023 13:50:47 +0200
Message-ID: <2023082147-dainty-yield-b08d@gregkh>
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

    Revert "drm/edid: Fix csync detailed mode parsing"

to the 6.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-drm-edid-fix-csync-detailed-mode-parsing.patch
and it can be found in the queue-6.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 50b6f2c8297793f7f3315623db78dcff85158e96 Mon Sep 17 00:00:00 2001
From: Jani Nikula <jani.nikula@intel.com>
Date: Tue, 15 Aug 2023 13:19:07 +0300
Subject: Revert "drm/edid: Fix csync detailed mode parsing"
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jani Nikula <jani.nikula@intel.com>

commit 50b6f2c8297793f7f3315623db78dcff85158e96 upstream.

This reverts commit ca62297b2085b5b3168bd891ca24862242c635a1.

Commit ca62297b2085 ("drm/edid: Fix csync detailed mode parsing") fixed
EDID detailed mode sync parsing. Unfortunately, there are quite a few
displays out there that have bogus (zero) sync field that are broken by
the change. Zero means analog composite sync, which is not right for
digital displays, and the modes get rejected. Regardless, it used to
work, and it needs to continue to work. Revert the change.

Rejecting modes with analog composite sync was the part that fixed the
gitlab issue 8146 [1]. We'll need to get back to the drawing board with
that.

[1] https://gitlab.freedesktop.org/drm/intel/-/issues/8146

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8789
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8930
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9044
Fixes: ca62297b2085 ("drm/edid: Fix csync detailed mode parsing")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.4+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230815101907.2900768-1-jani.nikula@intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_edid.c |   29 ++++++++---------------------
 include/drm/drm_edid.h     |   12 +++---------
 2 files changed, 11 insertions(+), 30 deletions(-)

--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3424,6 +3424,10 @@ static struct drm_display_mode *drm_mode
 			    connector->base.id, connector->name);
 		return NULL;
 	}
+	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync not supported\n",
+			    connector->base.id, connector->name);
+	}
 
 	/* it is incorrect if hsync/vsync width is zero */
 	if (!hsync_pulse_width || !vsync_pulse_width) {
@@ -3470,27 +3474,10 @@ static struct drm_display_mode *drm_mode
 	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
 		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
 	} else {
-		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
-		case DRM_EDID_PT_ANALOG_CSYNC:
-		case DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC:
-			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Analog composite sync!\n",
-				    connector->base.id, connector->name);
-			mode->flags |= DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_NCSYNC;
-			break;
-		case DRM_EDID_PT_DIGITAL_CSYNC:
-			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Digital composite sync!\n",
-				    connector->base.id, connector->name);
-			mode->flags |= DRM_MODE_FLAG_CSYNC;
-			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
-				DRM_MODE_FLAG_PCSYNC : DRM_MODE_FLAG_NCSYNC;
-			break;
-		case DRM_EDID_PT_DIGITAL_SEPARATE_SYNC:
-			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
-				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
-			mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
-				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
-			break;
-		}
+		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
+			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
+		mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
+			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
 	}
 
 set_size:
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -61,15 +61,9 @@ struct std_timing {
 	u8 vfreq_aspect;
 } __attribute__((packed));
 
-#define DRM_EDID_PT_SYNC_MASK              (3 << 3)
-# define DRM_EDID_PT_ANALOG_CSYNC          (0 << 3)
-# define DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC  (1 << 3)
-# define DRM_EDID_PT_DIGITAL_CSYNC         (2 << 3)
-#  define DRM_EDID_PT_CSYNC_ON_RGB         (1 << 1) /* analog csync only */
-#  define DRM_EDID_PT_CSYNC_SERRATE        (1 << 2)
-# define DRM_EDID_PT_DIGITAL_SEPARATE_SYNC (3 << 3)
-#  define DRM_EDID_PT_HSYNC_POSITIVE       (1 << 1) /* also digital csync */
-#  define DRM_EDID_PT_VSYNC_POSITIVE       (1 << 2)
+#define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
+#define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
+#define DRM_EDID_PT_SEPARATE_SYNC  (3 << 3)
 #define DRM_EDID_PT_STEREO         (1 << 5)
 #define DRM_EDID_PT_INTERLACED     (1 << 7)
 


Patches currently in stable-queue which might be from jani.nikula@intel.com are

queue-6.4/drm-i915-sdvo-fix-panel_type-initialization.patch
queue-6.4/revert-drm-edid-fix-csync-detailed-mode-parsing.patch
