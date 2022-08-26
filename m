Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4235A293C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD67D10E932;
	Fri, 26 Aug 2022 14:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C9810E932;
 Fri, 26 Aug 2022 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661523596; x=1693059596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QFGZCnBk1me3JF1oaygoGELsobT7o3LQUFAm0hBAXJw=;
 b=kD+9ltiaiVu9i2jfOoDIpwJHydPz1KwIwXy9H1Tq4D/ZLzLjc2fvVTQG
 nVj95vYDQKFv0GiGO3GWnNllXZMaggJLUo7GoU+S3wsXWYK2ea1mWoEuV
 N7J9suWhNj/qp662ugYo8fNe6qv9tuSq/mrRzX5ZetjdYdfBmtEgwXG1h
 i4RY5fzeBGZGLwXsD9Ku9czX888S/y9laIaAo0WJeZiF2m66FaqYx3BCj
 qjjWD7zTuVBq+HrPk3d5Ol58OpF3kiiiBEyUrjfWfdt0UKYCC3hQrc2Iq
 rOHCbmw1JUka2SHZh/ERyc2mUVfe88GvEgsS6IkbkGASbj1KKOJ/L5zgA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="281485767"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="281485767"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 07:19:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="587313694"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 07:19:53 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Imre Deak <imre.deak@intel.com>
Subject: [PATCH v7 3/3] drm/i915/fbdev: do not create fbdev if HPD is suspended
Date: Fri, 26 Aug 2022 16:19:29 +0200
Message-Id: <20220826141929.189681-4-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826141929.189681-1-andrzej.hajda@intel.com>
References: <20220826141929.189681-1-andrzej.hajda@intel.com>
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
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 2903b9cfa0f834..f287362dbdc68a 100644
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

