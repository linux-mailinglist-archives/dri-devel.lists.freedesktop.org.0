Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB56C47E15
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA9B10E467;
	Mon, 10 Nov 2025 16:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKZ1KIpU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C8310E464;
 Mon, 10 Nov 2025 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791561; x=1794327561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h28ZHwPHOrZKWd0drtgHrwwVWUui4Z5iE7ptBD847YE=;
 b=LKZ1KIpUZwS7RWXFqNBRzCZhPX097n5Nyxz7xxMYh+2wig4gyb8xuxlO
 yDnchWXeadd2OSKBfbah84Ia4KmkmvtE6gkxjeHRw0AJiMzZyogoPheqs
 9vHyMf+qCwqR2beuUlwMTmZJ1ZFULw2pdu/QD3oGPAjhipdlSCO9c2Jlj
 bdxOOuJQ+Ti5c1MIiPxRfq2oi0kLIjSeMeUof47JPSBx6IjDvlK8v24GM
 apUIk6jMW9YUgyNQzwQPY3KX4/tFFt7vsMR9iztP7+GqI93y/ytOy3FFh
 zfkc7u8ElLYeDJt30Y5lAEvQebRD4SsAu7+P7M2cRoMtERCsgEM3jciev g==;
X-CSE-ConnectionGUID: oAImwU+tRuemQdONX2izCg==
X-CSE-MsgGUID: Jq7I0PUSTJOwheaRa0D7Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76191728"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="76191728"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:21 -0800
X-CSE-ConnectionGUID: dWa97XNsSMOMOSWU4NW/Dw==
X-CSE-MsgGUID: BOPNPb87T/CkR4CFFwZo4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188665498"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 18/24] drm/vblank: add drm_crtc_from_vblank() helper
Date: Mon, 10 Nov 2025 18:17:36 +0200
Message-ID: <20b6cbb09fb5d3075c9642d8e5cc633a4d8a8d15.1762791343.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762791343.git.jani.nikula@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
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

We have a handful of places where we need to get the crtc from the
vblank. Add a small helper for it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 64cd96207ad5..34d0b6939d52 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -188,6 +188,11 @@ drm_crtc_vblank_crtc(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_crtc);
 
+static struct drm_crtc *drm_crtc_from_vblank(struct drm_vblank_crtc *vblank)
+{
+	return drm_crtc_from_index(vblank->dev, vblank->pipe);
+}
+
 static void store_vblank(struct drm_vblank_crtc *vblank,
 			 u32 vblank_count_inc,
 			 ktime_t t_vblank, u32 last)
@@ -1605,7 +1610,7 @@ static int drm_queue_vblank_event(struct drm_vblank_crtc *vblank,
 	e->event.vbl.user_data = vblwait->request.signal;
 	e->event.vbl.crtc_id = 0;
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
-		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
+		struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
 
 		if (crtc)
 			e->event.vbl.crtc_id = crtc->base.id;
@@ -1855,7 +1860,7 @@ static void drm_handle_vblank_events(struct drm_vblank_crtc *vblank)
 {
 	struct drm_device *dev = vblank->dev;
 	unsigned int pipe = vblank->pipe;
-	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
+	struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
 	bool high_prec = false;
 	struct drm_pending_vblank_event *e, *t;
 	ktime_t now;
-- 
2.47.3

