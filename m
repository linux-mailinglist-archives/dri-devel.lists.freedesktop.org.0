Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528348C8D6D
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C716910EF8B;
	Fri, 17 May 2024 20:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSpvcwo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33DE10E028;
 Fri, 17 May 2024 20:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715978591; x=1747514591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SBCJXVoLkG3jD8wIu4oX82y81ZysAQwO6ftNb8XsKz0=;
 b=XSpvcwo3Mi7HiXFCfHDLOpIx/sejDssNMjez4UC1J758icYFBYYrwK17
 krhF+UoGf8ZUT/pijgDMDceOepBNwI/Qh4W7JAh/Ksl9xtnW9Zm50+KT4
 5Lgfj4lN1PPY50tcUPc5/+LvG8dwldsVSxj8nTBgmVgzqg4PAc7m1mUy8
 SADL6P1x/fF03qnby192WyPQsyZ3rcNufl+OciJGJUcNJabPg3nExQ/SL
 xMpkDErYHw4S8Waxx4TI1eUNQWiH9YLU2wbzWvS85sOuOUeto9++Hk2ny
 2YMUPoweBHjG1zf1po0u/WOs5niA9o496qFNZyON8AKpTz3e6U4wSt++Q Q==;
X-CSE-ConnectionGUID: 7DkYpHQKTr+csS61oOlbrw==
X-CSE-MsgGUID: 5SFtuwoKRkW248/T2FpAdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12027918"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12027918"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:10 -0700
X-CSE-ConnectionGUID: bQJNXfblRoWSNj744WB1aQ==
X-CSE-MsgGUID: an713P3jRNicg88zCdiybA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="55125245"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 4/8] drm/xe: Add helper to capture engine timestamp
Date: Fri, 17 May 2024 13:43:06 -0700
Message-ID: <20240517204310.88854-5-lucas.demarchi@intel.com>
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

Just like CTX_TIMESTAMP is used to calculate runtime, add a helper to
get the timestamp for the engine so it can be used to calculate the
"engine time" with the same unit as the runtime is recorded.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 5 +++++
 drivers/gpu/drm/xe/xe_hw_engine.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 942fca8f1eb9..de1aefaa2335 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1121,3 +1121,8 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
 
 	return NULL;
 }
+
+u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
+{
+	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 843de159e47c..7f2d27c0ba1a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -68,5 +68,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 }
 
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
+u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
 
 #endif
-- 
2.43.0

