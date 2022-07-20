Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D3057BBD3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 18:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F215910F3;
	Wed, 20 Jul 2022 16:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AD8910E7;
 Wed, 20 Jul 2022 16:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658335766; x=1689871766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4meeIMkX8KY97+h+8xmCmUd+Stu1WSlIw4GXge4YeHw=;
 b=OlH0tD0/XStQ7cUeWwKoDPE26Gz1K4GNGXwKQjUbnQEbLKbbuYBewvYO
 kE3CMClVDRj4y6GxJ402JIM6oqdFJcXjVnsPrgPTpL3baW1vh8S17hWFO
 0/5IYDU4HcQVaaekuOel35l2bVEHWBcZ1IrQiSbIAdr3u/jqdFTcRRqCa
 doxcdLetwORhsu2Dkm9xqxKYWBQFxgNgVVox/A4gQ1Tjcd3ue6J/I7Pod
 6HDixkGmBio5WpjqCd0UBgj73cBWmLGt1w999Qml2cee7iuDVGoKDUXyE
 MNPEs0JSe5H2Zf9klq5cW88T6ED6wJIIYTMyMfg8vLUlrDUfkPkrTs5W4 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="266604538"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="266604538"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 09:49:09 -0700
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="656349870"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 09:49:07 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v5 4/4] drm/i915/fbdev: do not create fbdev if HPD is suspended
Date: Wed, 20 Jul 2022 18:48:48 +0200
Message-Id: <20220720164848.1246701-5-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720164848.1246701-1-andrzej.hajda@intel.com>
References: <20220720164848.1246701-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case of deferred FB setup core can try to create new
framebuffer. Disallow it if hpd_suspended flag is set.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index b682fd72d4bf25..7cd3eb9b7729f9 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -210,6 +210,12 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct drm_i915_gem_object *obj;
 	int ret;
 
+	mutex_lock(&ifbdev->hpd_lock);
+	ret = ifbdev->hpd_suspended ? -EAGAIN : 0;
+	mutex_unlock(&ifbdev->hpd_lock);
+	if (ret)
+		return ret;
+
 	if (intel_fb &&
 	    (sizes->fb_width > intel_fb->base.width ||
 	     sizes->fb_height > intel_fb->base.height)) {
-- 
2.25.1

