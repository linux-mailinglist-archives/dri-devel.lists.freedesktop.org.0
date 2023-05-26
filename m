Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ED5712A84
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF1C10E813;
	Fri, 26 May 2023 16:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656510E810;
 Fri, 26 May 2023 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685118070; x=1716654070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7l3AMcswq2uwcqtIv/q2u0zdB4whoxJDKkwxLEBIKQg=;
 b=bRWsN17GE7ev2Szr29rHN9+v3/vRIQIlTAc/CArqxoC9Al1IcmsYpvht
 +i3Po2dY11rJ9oSXFj4cIEpBcclYDBebTrDLI3pHZM4wFTQDm/IWwfIov
 iHrQC0g/W5kj7gh67LQtQYa5f3awFo9j7zNF4wMbSjiIMJIWWpQ3bvlqS
 wJQ6T8LPtAn2KAwwVMTeOigL2kZIdDXkcC7m9ibJ36GoVeX1yjCIPcqK8
 2AVaQdEvmTTkfBZWhZrIcVzj+tv6imaHlGKvy05Zk+ehPFo1KdT4x3Ios
 knTKzpg4yQqiJipQbJ3DsU+k8AyjsxUv8Ra2ZKs4MMF7ugeQY+eA7LF7m g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343735850"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="343735850"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="849620147"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="849620147"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:21:07 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 4/5] drm/netlink: define multicast groups
Date: Fri, 26 May 2023 21:50:15 +0530
Message-Id: <20230526162016.428357-5-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
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
Cc: alexander.deucher@amd.com, ogabbay@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Netlink subsystem supports event notifications to userspace. we define
two multicast groups for correctable and uncorrectable errors to which
userspace can subscribe and be notified when any of those errors happen.
The group names are local to the driver's genl netlink family.

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 include/uapi/drm/drm_netlink.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink.h
index 28e7a334d0c7..bd3a8b293979 100644
--- a/include/uapi/drm/drm_netlink.h
+++ b/include/uapi/drm/drm_netlink.h
@@ -29,6 +29,8 @@
 #include <net/sock.h>
 
 #define DRM_GENL_VERSION 1
+#define DRM_GENL_MCAST_GROUP_NAME_CORR_ERR	"drm_corr_err"
+#define DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR	"drm_uncorr_err"
 
 enum error_cmds {
 	DRM_CMD_UNSPEC,
@@ -38,6 +40,7 @@ enum error_cmds {
 	DRM_CMD_READ_ONE,
 	/* command to get counters of all errors */
 	DRM_CMD_READ_ALL,
+	DRM_CMD_ERROR_EVENT,
 
 	__DRM_CMD_MAX,
 	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
@@ -65,4 +68,14 @@ static const struct nla_policy drm_attr_policy_read_one[DRM_ATTR_MAX + 1] = {
 	[DRM_ATTR_ERROR_ID] = { .type = NLA_U64 },
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
 #endif
-- 
2.25.1

