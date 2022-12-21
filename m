Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CCE65301F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 12:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9549810E19A;
	Wed, 21 Dec 2022 11:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA7B10E105;
 Wed, 21 Dec 2022 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671621600; x=1703157600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nJ3suGLQLpyZaGV0yISOYfYzuaWJKxt3+x0NrUwC618=;
 b=VcJXCLMs1fykZtCb68T4ZdzBZBkXeDogXP/kBvWLFMzctXV2a/FkUijN
 V+xICyFUhLvpTva6m848CGLAbwBNA00Xl7hPY6zJQ9o2YJWcIKp5mXkj4
 tIeDo3gZ9WPEmGWSPXIMkmUuuNxEVSZ2wKVS1RyFRG6Jlef3qhNQC27wO
 KncdN2x+7aDn47G9ip6dm3Ee87ZbVjat7EPaAoTc30q3w7wnRVphTig4J
 fhnl58GtnDjmQAm234O+CsfcFrQZPzbd1YKRVCrAMpRc58MP7+fEbCrUk
 CuJzAzG86tFN0oYprWxgsl4+CD1YIe4rsaAu2Rj2zXXFoWxxCw+J/SooA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="321025007"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="321025007"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 03:19:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="758480060"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="758480060"
Received: from cbenthin-mobl1.amr.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.61.207])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 03:19:57 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/fbdev: Move damage clip check to higher level
Date: Wed, 21 Dec 2022 13:19:02 +0200
Message-Id: <20221221111902.1742095-3-jouni.hogander@intel.com>
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

Checking if damage clip is valid is common to all fb helpers.
Makes more sense to check it in higher level than adding into
all helpers.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/drm_fb_helper.c     | 4 ++++
 drivers/gpu/drm/drm_fbdev_generic.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index b3a731b9170a..78c889dbc610 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -384,6 +384,10 @@ static void drm_fb_helper_fb_dirty(struct drm_fb_helper *helper)
 	clip->x2 = clip->y2 = 0;
 	spin_unlock_irqrestore(&helper->damage_lock, flags);
 
+	/* Call damage handlers only if necessary */
+	if (!(clip_copy.x1 < clip_copy.x2 && clip_copy.y1 < clip_copy.y2))
+		return;
+
 	ret = helper->funcs->fb_dirty(helper, &clip_copy);
 	if (ret)
 		goto err;
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 0a4c160e0e58..6c6bb0dd2ea8 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -334,10 +334,6 @@ static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect
 	if (!drm_fbdev_use_shadow_fb(helper))
 		return 0;
 
-	/* Call damage handlers only if necessary */
-	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
-		return 0;
-
 	if (helper->buffer) {
 		ret = drm_fbdev_damage_blit(helper, clip);
 		if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
-- 
2.34.1

