Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD088C8D68
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198C910EF81;
	Fri, 17 May 2024 20:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhFtrV5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E2610EF6C;
 Fri, 17 May 2024 20:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715978591; x=1747514591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SMHWCly7W2RkMZdXU4UyXZ1uNidTSyTrfZkvJs2smdY=;
 b=YhFtrV5LSE9miDndNzJcmHkjbTh/8YpvoUSCR6iqq1bXu1VdlDvQqMhv
 QovMdU4RbpjvPaj8xNN6rWVbUt0w778pdpDTjePjof2mUndNzYXQ/NA32
 Xebn7MJ6CKOz4SFgB6s/Hrfs1bcFnvkozzUhzZyH3RSzMQIweiiQZWkmE
 exwHRad9F7fXlyAUVO5jhSKxf8A9DYb4Tf+TSrJHymCVWhuvMsDoOolGu
 v2ZBWNStpuwUquL+a5TCzNc5IWDsGBLFtZ6Zb51D5y3Enqy8oYclcC6aQ
 K33Ch2qwLiJ7EmMzZqGn34CpjCSza+Z55rDnWoorCACfBXkOAolt/vBC5 g==;
X-CSE-ConnectionGUID: 4xBNNNLYTom3e2LknGyvKg==
X-CSE-MsgGUID: 0znQZ7I0QB2piBo26pZ12Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12027914"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12027914"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:10 -0700
X-CSE-ConnectionGUID: OjqRe3ApTKGVzJLmLk40Uw==
X-CSE-MsgGUID: 1ZdkEI7rTrywmBDI8ocu5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="55125239"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v5 2/8] drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
Date: Fri, 17 May 2024 13:43:04 -0700
Message-ID: <20240517204310.88854-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517204310.88854-1-lucas.demarchi@intel.com>
References: <20240517204310.88854-1-lucas.demarchi@intel.com>
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

XE_ENGINE_CLASS_OTHER was missing from the str conversion. Add it and
remove the default handling so it's protected by -Wswitch.
Currently the only user is xe_hw_engine_class_sysfs_init(), which
already skips XE_ENGINE_CLASS_OTHER, so there's no change in behavior.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b71e90c555fa..942fca8f1eb9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1111,9 +1111,13 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
 		return "vecs";
 	case XE_ENGINE_CLASS_COPY:
 		return "bcs";
+	case XE_ENGINE_CLASS_OTHER:
+		return "other";
 	case XE_ENGINE_CLASS_COMPUTE:
 		return "ccs";
-	default:
-		return NULL;
+	case XE_ENGINE_CLASS_MAX:
+		break;
 	}
+
+	return NULL;
 }
-- 
2.43.0

