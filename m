Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1B565301B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 12:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B89710E13B;
	Wed, 21 Dec 2022 11:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3557A10E13B;
 Wed, 21 Dec 2022 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671621597; x=1703157597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V41ohy1Xm/2UniAlRqfcxo5E0ljd3+B0EKVPZXFsyaw=;
 b=Foee5XgitAwMCtBjuyYF9dn7DDv/6Lra2orkLIXuq3b26Km3CjzuaGdg
 uLwZ2/3F5lkbsv29dGVJuvLH2SEDXbXTN1Q8FeqBI10tbD7Xs54IJ4aFh
 N6O0lmWAUzpjQNY6P64NiUc4QME0z2XP3DihNI5NyjLb1zV0hv9QLzfFT
 v0xLzy9Oj7j5oFjJbwLVm/o0BjdGMwaYLpJeDnbol+vrvo2b4RBC71YOh
 E5nd9fianMd+TE+FGkpNAh4yVFdJbYZp2V0qTE+oLz/ddrSczrnTWd12t
 T+DbDp+5YLrIPdqrzuBIhXrXPZXN9zP0/LCXvgTB1qaC50+8f0YjdZ3D1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="321024994"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="321024994"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 03:19:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="758480055"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="758480055"
Received: from cbenthin-mobl1.amr.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.61.207])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 03:19:53 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/fbdev: Implement fb_dirty for intel custom fb
 helper
Date: Wed, 21 Dec 2022 13:19:01 +0200
Message-Id: <20221221111902.1742095-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221111902.1742095-1-jouni.hogander@intel.com>
References: <20221221111902.1742095-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After splitting generic drm_fb_helper into it's own file it's left to
helper implementation to have fb_dirty function. Currently intel
fb doesn't have it. This is causing problems to features (PSR, FBC, DRRS)
relying on dirty callback.

Implement simple fb_dirty callback to deliver notifications about updates
in fb console.

v2: Improved commit message and added Fixes tag

Fixes: 8ab59da26bc0 ("drm/fb-helper: Move generic fbdev emulation into separate source file")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 03ed4607a46d..20bbdeaf2e6f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -328,8 +328,17 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	return ret;
 }
 
+static int intelfb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
+{
+	if (helper->fb->funcs->dirty)
+		return helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+
+	return 0;
+}
+
 static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
 	.fb_probe = intelfb_create,
+	.fb_dirty = intelfb_dirty,
 };
 
 static void intel_fbdev_destroy(struct intel_fbdev *ifbdev)
-- 
2.34.1

