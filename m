Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92418BEFE9
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 00:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5332D11270D;
	Tue,  7 May 2024 22:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJ8OUAlH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6631126E2;
 Tue,  7 May 2024 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715121862; x=1746657862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lW8Txv0YWX0zqMZwcEd03eT6K51JpzKD4bcyvrcWMpA=;
 b=mJ8OUAlH4WJ6Ip8DYTZ3Jpzb2RhdYrHdXQJ1TsnSQXTG8cT6lV+HzM/a
 4E5KVk9qF+Di+Jnp41QAq6RL4Q5a+mIaqCwNX4O6N3lnkbqjtzNwI0J9S
 k9hbtRPz/zbBa5DyTGfxluKPYVvUvwextJxedIBQWI3ykGue4O8OPaIVp
 nFdtRZxc6Yp5GiIDzz4hzJcUNLs7ddy1eF/2VwtfVMxPwGSfwkrZ2nPJG
 or4H7B3+LXtqvhv04zODk0srrqxyVn1JTMg1Cn+JNdr5NF7y0syUl6XRG
 HTr0MbGYElvgL+AEZQS3ajlqZ2/i5sXJzWOIiki3e9L9/iqyDxCMxVk5B g==;
X-CSE-ConnectionGUID: LTyLsMmiQsS4UCon4ZGYFQ==
X-CSE-MsgGUID: uO5DSmgWQ0mPllyoOV7cUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11108497"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11108497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
X-CSE-ConnectionGUID: uL7f45BORG6igpOg8efSeg==
X-CSE-MsgGUID: ZSgsXbYBRMGZUe6/EYV0GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="29231506"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 4/6] drm/xe: Add helper to capture engine timestamp
Date: Tue,  7 May 2024 15:45:08 -0700
Message-ID: <20240507224510.442971-5-lucas.demarchi@intel.com>
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
index de30b74bf253..734f43a35b48 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1110,3 +1110,8 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
 
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

