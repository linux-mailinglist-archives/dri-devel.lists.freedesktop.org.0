Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2848278C367
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682BA10E259;
	Tue, 29 Aug 2023 11:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9002F10E254;
 Tue, 29 Aug 2023 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309168; x=1724845168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2SfP6qVYbxe2JdvXBynWfuxvAc7vvbJUjIubjIS00RA=;
 b=YS+8U+a+9MjAJrtzSTIwCMlFTjTKU3mdAvjyVv3CC7G7LDkyEOvIqXDu
 vSNmIez6jpOJQlSz7kSFYygFAocrZqgJi+zTVd9wYhmeOtEYf5PNb71cL
 G/cnt4E2rKC08CMMcMKTZm1VA7Dq57t1cC21rY2Ksktpk3/LCUyBn/bES
 Bx/sqlip8U4Qj5PQCRma7u/gEaUYX9m3JWDyYbNlxJ2V8Kbjhyps9O4m5
 oZo6Y3mpCSUYgZ5Xhexg+sAfPHoBsd47KeT1U5qjUFoUliMvr5dZw6B9i
 ZPbfpDKRf7MBmV/zWrumZ1mjP4c7vVt9XdwfvBHU7uD90sqC6zu0E7vAQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="406339590"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="406339590"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="804079680"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="804079680"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by fmsmga008.fm.intel.com with SMTP; 29 Aug 2023 04:39:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:39:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/12] drm: Reorder drm_sysfs_connector_remove() vs.
 drm_debugfs_connector_remove()
Date: Tue, 29 Aug 2023 14:39:09 +0300
Message-ID: <20230829113920.13713-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use the standard onion peeling approach and call
drm_debugfs_connector_remove() and
drm_sysfs_connector_remove() in the reverse order in
drm_connector_unregister() than what we called their
add counterpartse in drm_connector_register().

The error unwiding in drm_connector_register() is
already doing this the correct way around.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index c44d5bcf1284..988996cf6da5 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -684,8 +684,8 @@ void drm_connector_unregister(struct drm_connector *connector)
 	if (connector->funcs->early_unregister)
 		connector->funcs->early_unregister(connector);
 
-	drm_sysfs_connector_remove(connector);
 	drm_debugfs_connector_remove(connector);
+	drm_sysfs_connector_remove(connector);
 
 	connector->registration_state = DRM_CONNECTOR_UNREGISTERED;
 	mutex_unlock(&connector->mutex);
-- 
2.41.0

