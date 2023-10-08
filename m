Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3100F7BCD82
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 11:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BF010E102;
	Sun,  8 Oct 2023 09:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A168F10E102;
 Sun,  8 Oct 2023 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696757039; x=1728293039;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RCo+T55m+O3hw6gFXNvYg9Y6wQ1kVs74jscZ5+FkoRE=;
 b=BVYzXPwHHZjU5LZYSlzzPZdAFI3UMUjXppO30pmDdfZRkejRrc/IwQkV
 7eEMyc/b6VwsQQxe7ry1JSq3LCIYonChtarGF5jAdq8N6SNiS2wowSPUP
 FFQ5hzHsdjCcnaxcQ8jzr/WrZdxuU7KNRBUPEa/nWi+VwOEW05U9sQ7eP
 +WJtF5yHgsaWEqVNiNhpoJqub5NJQZ0wk1/2p9f4wa76J3dFmiJqli5kc
 WOsrBUdaCpUgxGJuG2910h9DIX9lcA3QYETujIrG+gjShWVPN+x81L9H5
 bLOvH+gYiaF6bMqvDAb96vDKve41qNyBsZPuU7LMWpVsceCbm4ia3BdkJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="364278991"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="364278991"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 02:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="1084007108"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="1084007108"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 02:23:55 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, ogabbay@kernel.org, ttayar@habana.ai,
 Hawking.Zhang@amd.com, Harish.Kasiviswanathan@amd.com,
 Felix.Kuehling@amd.com, Luben.Tuikov@amd.com
Subject: [RFC v1 4/5] drm/netlink: Define multicast groups
Date: Sun,  8 Oct 2023 14:56:15 +0530
Message-Id: <20231008092616.1457995-5-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231008092616.1457995-1-aravind.iddamsetty@linux.intel.com>
References: <20231008092616.1457995-1-aravind.iddamsetty@linux.intel.com>
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
 include/uapi/drm/drm_netlink.h |  4 ++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_netlink.c b/drivers/gpu/drm/drm_netlink.c
index 843b2919b6ed..0c2dd62a9a8e 100644
--- a/drivers/gpu/drm/drm_netlink.c
+++ b/drivers/gpu/drm/drm_netlink.c
@@ -124,6 +124,8 @@ static void drm_genl_family_init(struct drm_device *dev)
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
index aab42147a20e..c7a0ce5b4624 100644
--- a/include/uapi/drm/drm_netlink.h
+++ b/include/uapi/drm/drm_netlink.h
@@ -26,6 +26,8 @@
 #define _DRM_NETLINK_H_
 
 #define DRM_GENL_VERSION 1
+#define DRM_GENL_MCAST_GROUP_NAME_CORR_ERR	"drm_corr_err"
+#define DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR	"drm_uncorr_err"
 
 #if defined(__cplusplus)
 extern "C" {
@@ -43,6 +45,8 @@ enum drm_genl_error_cmds {
 	DRM_RAS_CMD_READ_ONE,
 	/** @DRM_RAS_CMD_READ_ALL: Command to get counters of all errors */
 	DRM_RAS_CMD_READ_ALL,
+	/** @DRM_RAS_CMD_ERROR_EVENT: Command sent as part of multicast event */
+	DRM_RAS_CMD_ERROR_EVENT,
 
 	__DRM_CMD_MAX,
 	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
-- 
2.25.1

