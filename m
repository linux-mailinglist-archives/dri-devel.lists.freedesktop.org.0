Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A800357E1A8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 14:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3214A8A954;
	Fri, 22 Jul 2022 12:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A0D10EAE8;
 Fri, 22 Jul 2022 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658494332; x=1690030332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BOmXzertM2j/5vD9o/un378VqgQtNa8qsUztsPD0aoI=;
 b=C1pNgRQU++30IX6pO4cFUfOCU6Zk5G9xyxnK2F9uM6xxo55RUO97Ct0V
 OwBE5PCBvIYpWPa/tf+gMnEdU4ndas4iVO8KOOc5/lc14CzbR+Qhyxedq
 alKUE87WvUhkTGeh52MmaiQtCXmWQsF+T+NK/tRiOqUKfi6J4NkL5j6TC
 HZISsuU92YWQSZ5aOq8DQHSGRZUgbssiBN56FPV/ayKTIaf9Nf/ftYaW3
 GquM0Zll2Y9hfPHizzdrzjoxZKSJkm+OOFbI7gcgN0v6HO4/OWLsAxH2S
 hkoNp0zV+SsWCHBVNXSKCZaCBT+1rqju8zysiJCBN+GiGpJruf5dqJxvU A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="288061206"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="288061206"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:52:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="626550977"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:52:09 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v6 4/4] drm/i915/fbdev: do not create fbdev if HPD is suspended
Date: Fri, 22 Jul 2022 14:51:43 +0200
Message-Id: <20220722125143.1604709-5-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722125143.1604709-1-andrzej.hajda@intel.com>
References: <20220722125143.1604709-1-andrzej.hajda@intel.com>
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
index 94ddc0f34fde64..fb8dbd532b9e05 100644
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

