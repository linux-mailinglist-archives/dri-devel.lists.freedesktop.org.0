Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E10CCA7622
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FF610EAE1;
	Fri,  5 Dec 2025 11:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCcNH9N7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3641910EADF;
 Fri,  5 Dec 2025 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934128; x=1796470128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rzy6CJpH4jYm+Eoz7ZhDLsZl+DDEUQ2je2xWVSsKTAo=;
 b=UCcNH9N7X7r39Zo45sr0sqVH3Bwg2shVErnNnt95wcsEAoqU/6vQ2FBu
 in4MmfJn9RDtBhFTLoHAw48Agvh0dAytymcJ4p9/ue6sKKw1mbQBFgADb
 El5hWanLdKhKj+J8xGheI6ox4joe5LWNPKt17B78hKyjTrQfWX2O193fQ
 20Ft19gs4OIHqM2nnJ5Eqi8KhOXAyIvysEbAUxWMK4ruKb+tcDGOxaPAK
 AytJG50ZODi9xqpcVaCCYfcdMYHJaK3fsi/cvtGD/iYgb5L0BnC/7yAHh
 efi4htTROuwRputhpy7MojQK6ZHppHLIGQDbG/dPqJhRIUrWvSd+SMmg4 Q==;
X-CSE-ConnectionGUID: DM8kkrykTu+mz85OuAJAYg==
X-CSE-MsgGUID: 7o8G+3g3Qa2qNA1041asdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66861967"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66861967"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:42 -0800
X-CSE-ConnectionGUID: XwUDJNfeTgicGAU2urlOjg==
X-CSE-MsgGUID: vg3tTLlATfSy6cRp4ntSKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195188177"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 10/25] drm/vblank: pass vblank to drm_handle_vblank_events()
Date: Fri,  5 Dec 2025 13:27:26 +0200
Message-ID: <ff7c6e1d70b4b2c43439c3e27b50e2ef11263837.1764933891.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764933891.git.jani.nikula@intel.com>
References: <cover.1764933891.git.jani.nikula@intel.com>
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

Use the vblank pointer instead of a dev, pipe pair to simplify
code. Rename to drm_vblank_crtc_handle_events().

v2: Rename (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index da8ca8928232..49b59af1512e 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1684,7 +1684,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
 		send_vblank_event(dev, e, seq, now);
 		vblwait->reply.sequence = seq;
 	} else {
-		/* drm_handle_vblank_events will call drm_vblank_crtc_put */
+		/* drm_vblank_crtc_handle_events will call drm_vblank_crtc_put */
 		list_add_tail(&e->base.link, &dev->vblank_event_list);
 		vblwait->reply.sequence = req_seq;
 	}
@@ -1892,8 +1892,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
+static void drm_vblank_crtc_handle_events(struct drm_vblank_crtc *vblank)
 {
+	struct drm_device *dev = vblank->dev;
+	unsigned int pipe = vblank->pipe;
 	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
 	bool high_prec = false;
 	struct drm_pending_vblank_event *e, *t;
@@ -1914,7 +1916,7 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
 			     e->sequence, seq);
 
 		list_del(&e->base.link);
-		drm_vblank_put(dev, pipe);
+		drm_vblank_crtc_put(vblank);
 		send_vblank_event(dev, e, seq, now);
 	}
 
@@ -1970,13 +1972,13 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	/* With instant-off, we defer disabling the interrupt until after
 	 * we finish processing the following vblank after all events have
 	 * been signaled. The disable has to be last (after
-	 * drm_handle_vblank_events) so that the timestamp is always accurate.
+	 * drm_vblank_crtc_handle_events) so that the timestamp is always accurate.
 	 */
 	disable_irq = (vblank->config.disable_immediate &&
 		       vblank->config.offdelay_ms > 0 &&
 		       !atomic_read(&vblank->refcount));
 
-	drm_handle_vblank_events(dev, pipe);
+	drm_vblank_crtc_handle_events(vblank);
 	drm_handle_vblank_works(vblank);
 
 	spin_unlock_irqrestore(&dev->event_lock, irqflags);
@@ -2165,7 +2167,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 		send_vblank_event(dev, e, seq, now);
 		queue_seq->sequence = seq;
 	} else {
-		/* drm_handle_vblank_events will call drm_vblank_crtc_put */
+		/* drm_vblank_crtc_handle_events will call drm_vblank_crtc_put */
 		list_add_tail(&e->base.link, &dev->vblank_event_list);
 		queue_seq->sequence = req_seq;
 	}
-- 
2.47.3

