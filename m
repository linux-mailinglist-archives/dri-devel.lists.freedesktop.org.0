Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739828C6DDB
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BF410E340;
	Wed, 15 May 2024 21:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mi9gPg0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F67610E141;
 Wed, 15 May 2024 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715809379; x=1747345379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+hyy5fOLL+nFN2OmZK8DUdooDecWrfu4D+Sq0mYZVl0=;
 b=Mi9gPg0tME85fncjisLfAYWQKlExbAlw/P9ly9F/gdOZDQoMkN6Mue/y
 EHaXpxHccEMQz1b+F0mfe9NVHpm+D3XKCaGb2MJr8L46OT4xmUXL1Qjxr
 LTUWdwxxyp/2fLzv1YiGWdvSNJ3Prv1uEDi8Hgn0U3DU/NMdFiKPM8dHj
 44KN+4dQOLiuSGD3Why3agUEyjdDTMrvhZitx0aJ9xc7srpj01SIhp09Y
 dKzoa/w4H1d6N/O0ddJvsrQAqFwXh9cxelSiB2BNm4UszFjRyhkp1nZSf
 8Pn9z9CvyZJIbsvqNigvaIiLhdMyPe776RKK1cmmRxjynSwbD8m0rxRb7 g==;
X-CSE-ConnectionGUID: y71j+vqmTNi7eYcCUR+v7w==
X-CSE-MsgGUID: MHuv2cAQQqimcVSyMlrJog==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11739161"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="11739161"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:59 -0700
X-CSE-ConnectionGUID: k1Bmi3lZRZakgLt3LgSCtg==
X-CSE-MsgGUID: Ruafe2N2QT2d93/MzJaRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35651129"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v4 2/8] drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
Date: Wed, 15 May 2024 14:42:52 -0700
Message-ID: <20240515214258.59209-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515214258.59209-1-lucas.demarchi@intel.com>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
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
index 520db5d518c3..f76bb507e1a5 100644
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

