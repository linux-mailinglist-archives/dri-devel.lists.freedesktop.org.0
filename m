Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95F8AFCEE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 01:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5969113780;
	Tue, 23 Apr 2024 23:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLmtqWjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9EB113779;
 Tue, 23 Apr 2024 23:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713916585; x=1745452585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FYvrK/0KYXO4/EtBbu/5hac7Bxz3Jcuim+RQWymddYw=;
 b=CLmtqWjFgFbEwB/8UdqvlHv11ri+jD6JB1W5R59o1ZgZf7MJgBcjwVLn
 vO7PZVK2gAZqoGp/6eGPQd1IyW9KyUF7kxRgjVLw/2wr8eMB/mMuwZFYw
 fSyTqZK67PTAvGnw0o0kSl7QHTo9kulggLM4H7gEmJnMaSyQ3jiIGxoc/
 U5gRSvmP3KqPt/KHtBoe7H5Le/eTBx+4fJPivgHmwIU2etSqZVe3rye+y
 yo27dpqXTZkWWMpUY3XyBrYvaf9eIQI693gFzG2z/7qe3kKNGmcTKd9dg
 QuMEz17Et11PDEdYkTZC4XefFyrmanKb5CpM2/qSFgjwGAQrn3cOS+3ed w==;
X-CSE-ConnectionGUID: mmL0iq+VTm62gTzSnfbBNg==
X-CSE-MsgGUID: fvCuJMMpT0+5OwohgSa39g==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27040637"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="27040637"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:56:24 -0700
X-CSE-ConnectionGUID: 2e4GKCXDSMu9sOSZSiPPkw==
X-CSE-MsgGUID: 97ugmLQUTjCxkozCiC5W6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29170913"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:56:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/6] drm/xe: Add helper to capture engine timestamp
Date: Tue, 23 Apr 2024 16:56:47 -0700
Message-ID: <20240423235652.1959945-3-lucas.demarchi@intel.com>
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

Just like CTX_TIMESTAMP is used to calculate runtime, add a helper to
get the timestamp for the engine so it can be used to calculate the
"engine time" with the same unit as the runtime is recorded.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 5 +++++
 drivers/gpu/drm/xe/xe_hw_engine.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 455f375c1cbd..f357de532685 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -955,3 +955,8 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
+
+u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
+{
+	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..a10d5e528958 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -67,4 +67,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 	return hwe->name;
 }
 
+u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
+
 #endif
-- 
2.43.0

