Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B8A8BEFE6
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 00:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00701126E0;
	Tue,  7 May 2024 22:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLVhMlr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD2A1126E0;
 Tue,  7 May 2024 22:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715121861; x=1746657861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vhI5ak9mhur2KztWVXd2pqiYNP0rY4J5RV6WDOQRJHY=;
 b=eLVhMlr1d6eEE/+xh54LZgKNc7D8DHM0mRdrF6m6qgQ24iK40iVQYHgR
 Dm1xsV068+e3Tnhf1GjwczePOnkdFZB8F7KWtdZSfZQSZfP/4QSGomiUc
 SHPvo/rNUgwoJvH8rSM6o3ZgVF54DEUfJsn1Fme5Lm2OkKdHk00Y/B1HA
 flKFxqeGWu8Lz3dW33q5rPUmq0mKsSmZRYe+uRCs76i+B4EkXvwg1zJ2K
 AR8IClJFVRxWK+lQB8Sr0tmrIQmGsx+SIaLjF0Yliu0+WPTdCtTw1OnMz
 BtJox0LpT0U05OatfQYKy4Vrkod0ECGUdYLnOyUiYtUd2OrDCrjMe7iph g==;
X-CSE-ConnectionGUID: bKKOC2rXRSeh1/pxktVTag==
X-CSE-MsgGUID: zB8r94T5SRCtG3gYjjYuPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11108495"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11108495"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
X-CSE-ConnectionGUID: 9iFMDVHrT9Sing46Y09ljA==
X-CSE-MsgGUID: ggpQX4kQQJ6OWkr4/xlilw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="29231500"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3 2/6] drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
Date: Tue,  7 May 2024 15:45:06 -0700
Message-ID: <20240507224510.442971-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507224510.442971-1-lucas.demarchi@intel.com>
References: <20240507224510.442971-1-lucas.demarchi@intel.com>
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
index 85712650be22..de30b74bf253 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1100,9 +1100,13 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
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

