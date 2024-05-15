Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C448C6DE4
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B982E10EC2B;
	Wed, 15 May 2024 21:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hySy1CGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CAC10E1D6;
 Wed, 15 May 2024 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715809380; x=1747345380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oNKLKwPHNRHrP3RgDBGmYROV3j8XFi8065ZP9okRlcE=;
 b=hySy1CGz04KRpdDRc9GqbKHe8TYCPqsP6A+240morRfsm1Ci78ihBecR
 AqrvDVEO+Js8opsMO5ksWZeJlUdvbOlQZ9/HWjBLpJkwZ0uYTF/ZyKEX1
 3PgRPJKlRRBPAlgkW8cDSwakjGd0CjUra4ppeujuSihideBGPsuq2Z8+1
 8UOA8Pm0mH6DiNKSH/UbFeq2vErfX7JzDhYI8x+MHUnZHyyVM9zvHw1fL
 /Uu6vJH2IwnhGU6kL38mSKcBkJt9EBRdycURcwlEOMHy4Bdz+kAMZPJvg
 /q7zu3beDsho21NkJVzHDjzM/C9BAvplymJTVa9qOif49VlEebnJ9uywe A==;
X-CSE-ConnectionGUID: taoItlukRQuKdN+64FDZHA==
X-CSE-MsgGUID: 8vXhGOEHRwWWCthtRrD+wQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11739166"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="11739166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:59 -0700
X-CSE-ConnectionGUID: C5oo3/AaQxmV4/wnFYSYNQ==
X-CSE-MsgGUID: EruH1MH2Rs+3IPbrrNftwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35651135"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 4/8] drm/xe: Add helper to capture engine timestamp
Date: Wed, 15 May 2024 14:42:54 -0700
Message-ID: <20240515214258.59209-5-lucas.demarchi@intel.com>
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
index f76bb507e1a5..51536d05ad86 100644
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

