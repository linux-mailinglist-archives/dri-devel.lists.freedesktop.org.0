Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0A07E9829
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 09:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADBA10E16B;
	Mon, 13 Nov 2023 08:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC7010E16B;
 Mon, 13 Nov 2023 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699865709; x=1731401709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kr53hq0K6ejIKFS7mCnet1pLbfxTsAgWiXjChgU54gg=;
 b=KCu+Gx/atyHYqqDPN/Dk7slsSjbfNUhif/OzE+Tv21pNpsn7xzr64orE
 mAayQQXcXMocgTxXbxJn73ZnnAk8fb4ycnwLlhkiMlqpxfLmu5S872T5f
 5XP2d2FpjxB4pJHnC8cgklHbV6C3KFe2xr/BmIA62+wPBSF2HUOhuSS51
 ag4z9o0ivBr2vfcwa/eP7PDfGFEsfbq5ICmUO5Wr6Koj9cneAs7JCkwx5
 zLepKgouaef40Pr6La3jVkDASC5B9FB5NkULxR8/Fg8j6KIIRASmRQrRv
 eY0T2VAFZixWhVpHtYDY6zZx6M9ErOvxsG0d1pQ/2IEBnd/UvZGpEepeF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="389265782"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="389265782"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 00:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="767845806"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="767845806"
Received: from jbarry-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.209.239])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 00:55:06 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Remove return type from
 i915_drm_client_remove_object
Date: Mon, 13 Nov 2023 08:54:56 +0000
Message-Id: <20231113085457.199053-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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
Cc: kernel test robot <lkp@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

There is no need to return anything in the version which was merged and
also the implementation of the !CONFIG_PROC_FS wasn't returning anything,
causing a build failure there.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: e4ae85e364fc ("drm/i915: Add ability for tracking buffer objects per client")
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311110104.8TlHVxUI-lkp@intel.com/
---
 drivers/gpu/drm/i915/i915_drm_client.c | 6 ++----
 drivers/gpu/drm/i915/i915_drm_client.h | 5 +++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 7efffdaa508d..be9acfd9410e 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -191,22 +191,20 @@ void i915_drm_client_add_object(struct i915_drm_client *client,
 	spin_unlock_irqrestore(&client->objects_lock, flags);
 }
 
-bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
+void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
 {
 	struct i915_drm_client *client = fetch_and_zero(&obj->client);
 	unsigned long flags;
 
 	/* Object may not be associated with a client. */
 	if (!client)
-		return false;
+		return;
 
 	spin_lock_irqsave(&client->objects_lock, flags);
 	list_del_rcu(&obj->client_link);
 	spin_unlock_irqrestore(&client->objects_lock, flags);
 
 	i915_drm_client_put(client);
-
-	return true;
 }
 
 void i915_drm_client_add_context_objects(struct i915_drm_client *client,
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 69cedfcd3d69..a439dd789936 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -70,7 +70,7 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
 #ifdef CONFIG_PROC_FS
 void i915_drm_client_add_object(struct i915_drm_client *client,
 				struct drm_i915_gem_object *obj);
-bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
+void i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
 void i915_drm_client_add_context_objects(struct i915_drm_client *client,
 					 struct intel_context *ce);
 #else
@@ -79,7 +79,8 @@ static inline void i915_drm_client_add_object(struct i915_drm_client *client,
 {
 }
 
-static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
+static inline void
+i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
 {
 }
 
-- 
2.40.1

