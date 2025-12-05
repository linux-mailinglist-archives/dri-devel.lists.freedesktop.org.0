Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9F2CA7631
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE3710EAE8;
	Fri,  5 Dec 2025 11:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XU+b1jBp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63D510EAE5;
 Fri,  5 Dec 2025 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934132; x=1796470132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yh0pL9Hs1mAov7KienJMB0f1xl46s0oQMpCw6xLXsIo=;
 b=XU+b1jBpEsv0MNuCx40V4ocaIWvoliJ8kLBUTiePSWzcBkb8qoxp7eCY
 8VUPOAounzqEAwAN9TLOoXAMH1mzeyMoyHHstEyEZABRguMNYIqXB0ZKg
 2SsmB8iDOdYL7UPPm0DtMPYdK3w1gvP38H18u4mmWL9ic7S6qzGkHj/Qj
 1aWu7vYoA5nrbAHbWc+Na8VpYZ13+CLV8+uSPT/xfKJohSEiu75AOqn9e
 DFK0IRVnz9JuRd59fBDhJ1XqRo2bSjLLKvl+RswtUSjvguV0D6WzXvcUf
 3trGbL8G7hu0CYjQhn1/XgOAOn4GpfwEeyMNoysqLGqmXSgiSkRRfB17j Q==;
X-CSE-ConnectionGUID: g6nUEgcjSbOM/8aP/QNi3Q==
X-CSE-MsgGUID: WSutOrTtQzuQkC0XycsOKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66861990"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66861990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:52 -0800
X-CSE-ConnectionGUID: 6+VlGIo9TZGvEF35otaEDg==
X-CSE-MsgGUID: Qed0IDbCSEyxhjWalqcUQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195188204"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 12/25] drm/vblank: pass vblank to drm_queue_vblank_event()
Date: Fri,  5 Dec 2025 13:27:28 +0200
Message-ID: <50d09f6d8d04cfee7fc08adc9873032b57c64b0e.1764933891.git.jani.nikula@intel.com>
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
code. Rename to drm_vblank_crtc_queue_event().

v2: Rename (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index d0460cd5d345..6be354415529 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1599,12 +1599,13 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_restore);
 
-static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
-				  u64 req_seq,
-				  union drm_wait_vblank *vblwait,
-				  struct drm_file *file_priv)
+static int drm_vblank_crtc_queue_event(struct drm_vblank_crtc *vblank,
+				       u64 req_seq,
+				       union drm_wait_vblank *vblwait,
+				       struct drm_file *file_priv)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_device *dev = vblank->dev;
+	unsigned int pipe = vblank->pipe;
 	struct drm_pending_vblank_event *e;
 	ktime_t now;
 	u64 seq;
@@ -1825,7 +1826,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 		/* must hold on to the vblank ref until the event fires
 		 * drm_vblank_crtc_put will be called asynchronously
 		 */
-		return drm_queue_vblank_event(dev, pipe, req_seq, vblwait, file_priv);
+		return drm_vblank_crtc_queue_event(vblank, req_seq, vblwait, file_priv);
 	}
 
 	if (req_seq != seq) {
-- 
2.47.3

