Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0EFA3F97B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A551210EAC7;
	Fri, 21 Feb 2025 15:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QODkOxOX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D2610EAC3;
 Fri, 21 Feb 2025 15:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740153256; x=1771689256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C8/VP15dw5nM6vDUrN/jJM4lP9/GJpfnqfKL+bPMCNk=;
 b=QODkOxOX5WASRLUtSg6MGDIKcM+6jcEwG/7soPJkJhO2YfX3XpaX34hg
 BHRX62tafwr5olpe3rw+ijqBn/Xz0vik6M49jO3K+OYsJVyKG62a30Lmh
 yYxG5KksFZd9I3HgjnbHAFBpwuUHk6uLG0Bq1VYXxQ/o71AVJRVsA9VGz
 0Mo5L0l7jzj+UyEhP4lg4F4knNmGBLmpZOkaFfiEjf70mfgyk+UMqv/+N
 doZ1lk8sEQqiupJVL9qAbWsixWQuLuAdLISXLht51HRvWpFcO36YKTmAG
 ulT5RRaAUv3pkFmd6xIYCa6xlFcsYvEBAch0WZOWhTCNXklcQj/ZwcYHa w==;
X-CSE-ConnectionGUID: 6WB00pQASDCFpoyx/ykLBw==
X-CSE-MsgGUID: jTWRB7BARuuVzBwEGpkJPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51190864"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51190864"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:54:16 -0800
X-CSE-ConnectionGUID: ocPvaGxASvKY3kYB3ctAhg==
X-CSE-MsgGUID: 1tChsnraS8WUogQ1uClL8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152595563"
Received: from dut4432lnl.fm.intel.com ([10.105.10.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:54:16 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch,
 kamil.konieczny@linux.intel.com
Subject: [PATCH 1/4] drm-uapi/xe: Declare reset stats query
Date: Fri, 21 Feb 2025 15:54:11 +0000
Message-ID: <20250221155414.13961-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221155414.13961-1-jonathan.cavitt@intel.com>
References: <20250221155414.13961-1-jonathan.cavitt@intel.com>
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

Align with 20250220203832.130430-1-jonathan.cavitt@intel.com

Add initial declarations for the reset stats query, including necessary
structures and IOCTL macros.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/drm-uapi/xe_drm.h | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 08e263b3b2..e4f2f0d2a6 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -700,6 +700,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
+#define DRM_XE_DEVICE_QUERY_RESET_STATS		10
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1729,6 +1730,55 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+#define MAX_BAN_COUNT	50
+/**
+ * struct drm_xe_exec_queue_ban - Per drm client exec queue ban info returned
+ * from @DRM_XE_DEVICE_QUERY_RESET_STATS query.  Includes the exec queue ID and
+ * all associated pagefault information, if relevant.
+ */
+struct drm_xe_exec_queue_ban {
+	/** @exec_queue_id: ID of banned exec queue */
+	__u32 exec_queue_id;
+	/**
+	 * @pf_found: whether or not the ban is associated with a pagefault.
+	 * If not, all pagefault data will default to 0 and will not be relevant.
+	 */
+	__u8 pf_found;
+	/** @access_type: access type of associated pagefault */
+	__u8 access_type;
+	/** @fault_type: fault type of associated pagefault */
+	__u8 fault_type;
+	/** @vfid: VFID of associated pagefault */
+	__u8 vfid;
+	/** @asid: ASID of associated pagefault */
+	__u32 asid;
+	/** @pdata: PDATA of associated pagefault */
+	__u16 pdata;
+	/** @engine_class: engine class of associated pagefault */
+	__u8 engine_class;
+	/** @engine_instance: engine instance of associated pagefault */
+	__u8 engine_instance;
+	/** @fault_addr: faulted address of associated pagefault */
+	__u64 fault_addr;
+};
+
+/**
+ * struct drm_xe_query_reset_stats - Per drm client reset stats query.
+ */
+struct drm_xe_query_reset_stats {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	/** @reset_count: Number of times the drm client has observed an engine reset */
+	__u64 reset_count;
+	/** @ban_count: number of exec queue bans saved by the drm client */
+	__u64 ban_count;
+	/**
+	 * @ban_list: flexible array of struct drm_xe_exec_queue_ban, reporting all
+	 * observed exec queue bans on the drm client.
+	 */
+	struct drm_xe_exec_queue_ban ban_list[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

