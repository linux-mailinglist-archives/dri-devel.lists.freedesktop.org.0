Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9B6A36700
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 21:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA6010E033;
	Fri, 14 Feb 2025 20:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iW3b0Pug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B323810E069;
 Fri, 14 Feb 2025 20:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739565479; x=1771101479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w48Vj/xXdRRKDK7S0uyfSciQMTM5hICF6ShJAQc5FEk=;
 b=iW3b0PuglGSnpT/co4PKTnBDmCGwDWXelrnBMOWT+hljT3ibhR31z8fG
 /9oT6Fq24d64kbnIcTHGxnGMoc4IT9FlDGgHxk2LxPJSUn6Yttd+v2Qns
 b2WxSJfoHNeHuw1gQKjhYyhsZWgW6dbXNtpHnMATp169LE+wrydtOPMNt
 c32V24aiPra1MkOCrGh5/B9MBt0uatS8qt23f4KfP+Qa8KDrkvJ4sO49x
 E6BAtnZInaig0rOthhXz0/FIQCK0juC20hsvS7DJH+Mn+T8hF01km5IhI
 yvVTAGLMrmi5NLvZC7VmqWl1Z0xgEVbi6wmBl183CgSlWRIF9uyJs4SmG w==;
X-CSE-ConnectionGUID: uXdbO82ESLaUQsGzEdjU0w==
X-CSE-MsgGUID: 63O4tyjqR/O29yW5D4XW2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39558863"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="39558863"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:37:59 -0800
X-CSE-ConnectionGUID: KVBguJ3vTOWtEcUTrfuGBw==
X-CSE-MsgGUID: Wa2mRLQ5TqOAxB9oGNFlzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118760812"
Received: from dut4066lnl.fm.intel.com ([10.105.8.61])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:37:59 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jonathan.cavitt@intel.com,
 saurabhg.gupta@intel.com, alex.zuo@intel.com, joonas.lahtinen@intel.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com
Subject: [PATCH 1/4] drm/xe/xe_exec_queue: Add ID param to exec queue struct
Date: Fri, 14 Feb 2025 20:37:54 +0000
Message-ID: <20250214203757.27895-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214203757.27895-1-jonathan.cavitt@intel.com>
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
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

Add the exec queue id to the exec queue struct.  This is useful for
performing a reverse lookup into the xef->exec_queue xarray.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6051db78d706..a02e62465e01 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -711,6 +711,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto kill_exec_queue;
 
+	q->id = id;
 	args->exec_queue_id = id;
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 6eb7ff091534..088d838218e9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -55,6 +55,8 @@ struct xe_exec_queue {
 	struct xe_vm *vm;
 	/** @class: class of this exec queue */
 	enum xe_engine_class class;
+	/** @id: exec queue ID as reported during create ioctl */
+	u32 id;
 	/**
 	 * @logical_mask: logical mask of where job submitted to exec queue can run
 	 */
-- 
2.43.0

