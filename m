Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497547D1344
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 17:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FD410E0F5;
	Fri, 20 Oct 2023 15:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B9D10E0F5;
 Fri, 20 Oct 2023 15:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697817375; x=1729353375;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=T7l4uyziph6sz0NMKx+fmL3JwY0/VxDeGTVi9nauYxY=;
 b=CWcqancDREXBw9f/CGpflGdbq1ywyap6zzrrP2d+nefD62rZWXqppSdQ
 3geU0HHhcf2aeQX/s2Krsgh4nIh4+rJFaTZ7V3Nd6NTrOuRZP+zByAWsM
 WvufOqaSPYIOPe/aUEy47THm8b3C5tbKbF6c5yA9wE8MSaMrActDUWF4F
 Ai5Oo3g0wqC337oVozTRMS1QTg/+x2WrLnheXBstS1uFNEsmEQUjCe6Ss
 0hJ+ahiOolQGmMWAumhzQYgMZpeHCEr2Ph0ChO7eYkMfwCZ2Qp42/Xst4
 YJehIor6EYjww+h8OUDp8xi+/LcTWzK+horcQKcUVR4wyIznp1xnWJb/y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="453000036"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="453000036"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 08:56:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="1088778614"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="1088778614"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 08:56:10 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, ogabbay@kernel.org, ttayar@habana.ai,
 Hawking.Zhang@amd.com, Harish.Kasiviswanathan@amd.com,
 Felix.Kuehling@amd.com, Luben.Tuikov@amd.com, michael.j.ruhl@intel.com
Subject: [RFC 4/5] drm/netlink: Define multicast groups
Date: Fri, 20 Oct 2023 21:28:34 +0530
Message-Id: <20231020155835.1295524-5-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
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
 drivers/gpu/drm/drm_netlink.c  | 7 +++++++
 include/drm/drm_netlink.h      | 5 +++++
 include/uapi/drm/drm_netlink.h | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_netlink.c b/drivers/gpu/drm/drm_netlink.c
index 8add249c1da3..425a7355a573 100644
--- a/drivers/gpu/drm/drm_netlink.c
+++ b/drivers/gpu/drm/drm_netlink.c
@@ -12,6 +12,11 @@
 
 DEFINE_XARRAY(drm_dev_xarray);
 
+static const struct genl_multicast_group drm_event_mcgrps[] = {
+	[DRM_GENL_MCAST_CORR_ERR] = { .name = DRM_GENL_MCAST_GROUP_NAME_CORR_ERR, },
+	[DRM_GENL_MCAST_UNCORR_ERR] = { .name = DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR, },
+};
+
 /**
  * drm_genl_reply - response to a request
  * @msg: socket buffer
@@ -133,6 +138,8 @@ static void drm_genl_family_init(struct drm_device *dev)
 	dev->drm_genl_family.ops = drm_genl_ops;
 	dev->drm_genl_family.n_ops = ARRAY_SIZE(drm_genl_ops);
 	dev->drm_genl_family.maxattr = DRM_ATTR_MAX;
+	dev->drm_genl_family.mcgrps = drm_event_mcgrps;
+	dev->drm_genl_family.n_mcgrps = ARRAY_SIZE(drm_event_mcgrps);
 	dev->drm_genl_family.module = dev->dev->driver->owner;
 }
 
diff --git a/include/drm/drm_netlink.h b/include/drm/drm_netlink.h
index 54527dae7847..758239643c17 100644
--- a/include/drm/drm_netlink.h
+++ b/include/drm/drm_netlink.h
@@ -13,6 +13,11 @@
 
 struct drm_device;
 
+enum mcgrps_events {
+	DRM_GENL_MCAST_CORR_ERR,
+	DRM_GENL_MCAST_UNCORR_ERR,
+};
+
 struct driver_genl_ops {
 	int		       (*doit)(struct drm_device *dev,
 				       struct sk_buff *skb,
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

