Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9ED47124C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 07:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A1110E3BF;
	Sat, 11 Dec 2021 06:59:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF0510E3A3;
 Sat, 11 Dec 2021 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639205941; x=1670741941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rS++CehQW3TfrjeWNSJ76JoPdSz6vRL1Mp0wJnUGjs8=;
 b=Fll3rPEZi2TdDvJu9M41ccg2G/9x8Q08HZ50Fz2tV+coxuAtCxJf2dbu
 ThCHPKGWe25Cy8+QDX7g3kAiTTi3EtPw1d8So0h/F+Sp5J57AmyKWJ3L/
 RQBW+MbX5h3pbnsMsgTGquM8WSbAqVNMtbDpMSPvc6S5+rWepXQCoK6lU
 tlAIsruBW8GhYwus/0C+otU3KS7KEoUmeoWU/NhpHVgdPTUFxQrb7cL01
 LZVxK/+UcfU+IUOyu+FPBvSjVWO/3vALWHjoColyBOCilwPjRHoaVsx8g
 hIt95KeTz/jJ536xcv3SXSaEj/8MxdEoVZIelS8UdIViR/SL9unXSFtNa A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="237249047"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="237249047"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 22:59:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="463979854"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga006.jf.intel.com with ESMTP; 10 Dec 2021 22:58:59 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/4] drm/i915/guc: Increase GuC log size for CONFIG_DEBUG_GEM
Date: Fri, 10 Dec 2021 22:58:57 -0800
Message-Id: <20211211065859.2248188-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
References: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Lots of testing is done with the DEBUG_GEM config option enabled but
not the DEBUG_GUC option. That means we only get teeny-tiny GuC logs
which are not hugely useful. Enabling full DEBUG_GUC also spews lots
of other detailed output that is not generally desired. However,
bigger GuC logs are extremely useful for almost any regression debug.
So enable bigger logs for DEBUG_GEM builds as well.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
index ac1ee1d5ce10..fe6ab7550a14 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
@@ -15,9 +15,12 @@
 
 struct intel_guc;
 
-#ifdef CONFIG_DRM_I915_DEBUG_GUC
+#if defined(CONFIG_DRM_I915_DEBUG_GUC)
 #define CRASH_BUFFER_SIZE	SZ_2M
 #define DEBUG_BUFFER_SIZE	SZ_16M
+#elif defined(CONFIG_DRM_I915_DEBUG_GEM)
+#define CRASH_BUFFER_SIZE	SZ_1M
+#define DEBUG_BUFFER_SIZE	SZ_2M
 #else
 #define CRASH_BUFFER_SIZE	SZ_8K
 #define DEBUG_BUFFER_SIZE	SZ_64K
-- 
2.25.1

