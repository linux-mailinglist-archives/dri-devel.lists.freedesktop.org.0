Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814598AFCED
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 01:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49E511377F;
	Tue, 23 Apr 2024 23:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFQBE9sS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941DB113779;
 Tue, 23 Apr 2024 23:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713916586; x=1745452586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q86t33ImIQCsNEC/1FHcHJnJnsNLIjpCKpcEjENb8zA=;
 b=oFQBE9sSnF4rCoXP3eqO5qTZ0l1S4KURy/7OKD5mSlqLrHrYwCB9Mo4t
 eicekfXvXGw0AfjMSMOpZenK4A0hHXRGM3XQMGwzgYhKeNtJZAJjQPsPq
 NSE9U778HHzYycKPXHwaV1npjvNxrzWwmxMn92Uqu6YYuqbSy9wUHUKgH
 d0rYzDjJhKqyqtz9izmOBqEQX0pCLLFOcr/5CjYyZHcwpPzNpXkEgugBn
 LhhwgKUzPwqoy1HPjcfxePtA7dGA8yCLSFHf2DrJ90j2WzWQUNPpt2iuM
 FQBFBH5zjAtIyoHswUePCmfzaOAmZV7nNRmMOCLhvjpbs2ha9L5/ZTdSx g==;
X-CSE-ConnectionGUID: AvT65iOHTnq7MhOlO4i3Ig==
X-CSE-MsgGUID: 4cnNJ1gkSCGxu2F3UhOKqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27040643"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="27040643"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:56:25 -0700
X-CSE-ConnectionGUID: itmtVQ5DTg6baMmquHzYiw==
X-CSE-MsgGUID: FJ0lGlGLQnq357aK955m4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29170921"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:56:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 5/6] drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
Date: Tue, 23 Apr 2024 16:56:50 -0700
Message-ID: <20240423235652.1959945-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423235652.1959945-1-lucas.demarchi@intel.com>
References: <20240423235652.1959945-1-lucas.demarchi@intel.com>
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
remove the default handling so it's protected by -Wswitch-enum.
Currently the only user is xe_hw_engine_class_sysfs_init(), which
already skips XE_ENGINE_CLASS_OTHER, so there's no change in behavior.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index e1b167149166..7395e25d1c2e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -972,9 +972,13 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
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

