Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3778865D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 13:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1E010E65B;
	Fri, 25 Aug 2023 11:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F186410E657;
 Fri, 25 Aug 2023 11:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692964290; x=1724500290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pFxauHBh+GSrYfgND+Inj6pnrsaswwoQUZB/c9h2j2Y=;
 b=EDX3J3Trx664EAY084PYQWjGNYME1JVf8kP4cAhzhsJirjjoSHfrc8cA
 G34cxRvlzUTL67AJKbyOEPegigqE5ZzQvN2Q/zUkq+vD/f05jimt/h1DH
 //rbrlahQFKgItle8JgA0HPf+hARQE6siW7Xmpw+o6sN5LqVuuSf3ZHF7
 FdK1S6khgFIBM/AVNp836rIigMZHL7QBrHn6UTfh+Uy66gjN2ZC57+EdT
 ghkmrbc0O7I6dIGxHLg9jn8860ZR/GZZWKW7y9QhQnhtGrL9TudSRDndH
 nk2TVbjZ0ASgzHz1vrXGx5C1lIJjhL+ss+ba/yQ8xxwjhuN+a6Bn9ufqf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359694745"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="359694745"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="881153540"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:33 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC v2 4/5] drm/netlink: Define multicast groups
Date: Fri, 25 Aug 2023 17:25:30 +0530
Message-Id: <20230825115531.800574-5-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825115531.800574-1-aravind.iddamsetty@linux.intel.com>
References: <20230825115531.800574-1-aravind.iddamsetty@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Netlink subsystem supports event notifications to userspace. we define
two multicast groups for correctable and uncorrectable errors to which
userspace can subscribe and be notified when any of those errors happen.
The group names are local to the driver's genl netlink family.

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/drm_netlink.c  |  2 ++
 include/drm/drm_netlink.h      | 10 ++++++++++
 include/uapi/drm/drm_netlink.h |  3 +++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_netlink.c b/drivers/gpu/drm/drm_netlink.c
index e41127963968..6895b8741eaf 100644
--- a/drivers/gpu/drm/drm_netlink.c
+++ b/drivers/gpu/drm/drm_netlink.c
@@ -118,6 +118,8 @@ static void drm_genl_family_init(struct drm_device *dev)
 	dev->drm_genl_family.ops = drm_genl_ops;
 	dev->drm_genl_family.n_ops = ARRAY_SIZE(drm_genl_ops);
 	dev->drm_genl_family.maxattr = DRM_ATTR_MAX;
+	dev->drm_genl_family.mcgrps = drm_event_mcgrps;
+	dev->drm_genl_family.n_mcgrps = ARRAY_SIZE(drm_event_mcgrps);
 	dev->drm_genl_family.module = dev->dev->driver->owner;
 }
 
diff --git a/include/drm/drm_netlink.h b/include/drm/drm_netlink.h
index 60f7ee39ae0a..876f73087b18 100644
--- a/include/drm/drm_netlink.h
+++ b/include/drm/drm_netlink.h
@@ -28,6 +28,16 @@ static const struct nla_policy drm_attr_policy_read_one[DRM_ATTR_MAX + 1] = {
 	[DRM_RAS_ATTR_ERROR_ID] = { .type = NLA_U64 },
 };
 
+enum mcgrps_events {
+	DRM_GENL_MCAST_CORR_ERR,
+	DRM_GENL_MCAST_UNCORR_ERR,
+};
+
+static const struct genl_multicast_group drm_event_mcgrps[] = {
+	[DRM_GENL_MCAST_CORR_ERR] = { .name = DRM_GENL_MCAST_GROUP_NAME_CORR_ERR, },
+	[DRM_GENL_MCAST_UNCORR_ERR] = { .name = DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR, },
+};
+
 int drm_genl_register(struct drm_device *dev);
 void drm_genl_exit(void);
 int drm_genl_send(struct sk_buff *msg, struct genl_info *info, void *usrhdr);
diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink.h
index a3ccc68f782d..b37f952953db 100644
--- a/include/uapi/drm/drm_netlink.h
+++ b/include/uapi/drm/drm_netlink.h
@@ -25,6 +25,8 @@
 #define _DRM_NETLINK_H_
 
 #define DRM_GENL_VERSION 1
+#define DRM_GENL_MCAST_GROUP_NAME_CORR_ERR	"drm_corr_err"
+#define DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR	"drm_uncorr_err"
 
 #if defined(__cplusplus)
 extern "C" {
@@ -38,6 +40,7 @@ enum error_cmds {
 	DRM_RAS_CMD_READ_ONE,
 	/* command to get counters of all errors */
 	DRM_RAS_CMD_READ_ALL,
+	DRM_RAS_CMD_ERROR_EVENT,
 
 	__DRM_CMD_MAX,
 	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
-- 
2.25.1

