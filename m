Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FDEB15920
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 08:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5907E10E40A;
	Wed, 30 Jul 2025 06:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNegr8Ft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5841D10E409;
 Wed, 30 Jul 2025 06:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753858297; x=1785394297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SYEapZ0VdZXjv0/sZe2xbZo51oTAtaBidAMcpaMkJao=;
 b=lNegr8Ftq7qjgScSlzpzbcJAN93bOi9X1JUd5fO77aHU1d1zAQ8s1the
 /16PsgM4RLBVVBtrC2o6qKpNdHImmndlbdmxGn9V/NAiyVyMpObBAupP4
 GzWjdNM8FKq1RuWlezQ5JYIOOjOlkOj1t1eHJilxq6jpHJm7ojheFOA9H
 eFdZchaRERi0t83E/YwMH5L4U+4/JidpvFcMPftDNHDPlrGnXsIukVDIC
 dARGOKWdFanJCZmhn4gXiIcuCMukjyojdiXW8xyCgy8P909pVoNWkHxF9
 pEP3DHmgVYl7WzVR3AZ+gvLfNV8XAR9O4ndkKUFMyN0nsmRpK+udl/VrU Q==;
X-CSE-ConnectionGUID: bhgpNVa5SbGRG+lSUmv4Ig==
X-CSE-MsgGUID: ThNY8/IJROekpm7bJAjExA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="66847957"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66847957"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:51:31 -0700
X-CSE-ConnectionGUID: Jim9rbW6Q2S72Z/Lws3NQQ==
X-CSE-MsgGUID: KXOBRbyqSr6K03+1oQBkBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162178286"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:51:27 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>, Ruhl@freedesktop.org,
	Michael J <michael.j.ruhl@intel.com>,
	Riana Tauro <riana.tauro@intel.com>,
	Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [RFC v5 4/5] drm/netlink: Define multicast groups
Date: Wed, 30 Jul 2025 12:19:55 +0530
Message-Id: <20250730064956.1385855-5-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
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

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/drm_netlink.c  | 7 +++++++
 include/drm/drm_netlink.h      | 5 +++++
 include/uapi/drm/drm_netlink.h | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_netlink.c b/drivers/gpu/drm/drm_netlink.c
index da4bfde32a22..a7c0a4401ca9 100644
--- a/drivers/gpu/drm/drm_netlink.c
+++ b/drivers/gpu/drm/drm_netlink.c
@@ -15,6 +15,11 @@
 
 DEFINE_XARRAY(drm_dev_xarray);
 
+static const struct genl_multicast_group drm_event_mcgrps[] = {
+	[DRM_GENL_MCAST_CORR_ERR] = { .name = DRM_GENL_MCAST_GROUP_NAME_CORR_ERR, },
+	[DRM_GENL_MCAST_UNCORR_ERR] = { .name = DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR, },
+};
+
 /**
  * drm_genl_reply - response to a request
  * @msg: socket buffer
@@ -156,6 +161,8 @@ static void drm_genl_family_init(struct drm_device *dev)
 	dev->drm_genl_family->ops = drm_genl_ops;
 	dev->drm_genl_family->n_ops = ARRAY_SIZE(drm_genl_ops);
 	dev->drm_genl_family->maxattr = DRM_ATTR_MAX;
+	dev->drm_genl_family->mcgrps = drm_event_mcgrps;
+	dev->drm_genl_family->n_mcgrps = ARRAY_SIZE(drm_event_mcgrps);
 	dev->drm_genl_family->module = dev->dev->driver->owner;
 }
 
diff --git a/include/drm/drm_netlink.h b/include/drm/drm_netlink.h
index 4a746222337a..9e48147d0d36 100644
--- a/include/drm/drm_netlink.h
+++ b/include/drm/drm_netlink.h
@@ -12,6 +12,11 @@ struct drm_device;
 struct genl_info;
 struct sk_buff;
 
+enum mcgrps_events {
+	DRM_GENL_MCAST_CORR_ERR,
+	DRM_GENL_MCAST_UNCORR_ERR,
+};
+
 struct driver_genl_ops {
 	int		       (*doit)(struct drm_device *dev,
 				       struct sk_buff *skb,
diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink.h
index 58afb6e8d84a..c978efaab124 100644
--- a/include/uapi/drm/drm_netlink.h
+++ b/include/uapi/drm/drm_netlink.h
@@ -26,6 +26,8 @@
 #define _DRM_NETLINK_H_
 
 #define DRM_GENL_VERSION 1
+#define DRM_GENL_MCAST_GROUP_NAME_CORR_ERR	"drm_corr_err"
+#define DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR	"drm_uncorr_err"
 
 #if defined(__cplusplus)
 extern "C" {
@@ -50,6 +52,8 @@ enum drm_genl_error_cmds {
 	DRM_RAS_CMD_READ_BLOCK,
 	/** @DRM_RAS_CMD_READ_ALL: Command to get counters of all errors */
 	DRM_RAS_CMD_READ_ALL,
+	/** @DRM_RAS_CMD_ERROR_EVENT: Command sent as part of multicast event */
+	DRM_RAS_CMD_ERROR_EVENT,
 
 	__DRM_CMD_MAX,
 	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
-- 
2.25.1

