Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B4F4A4C9D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 17:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1D010E370;
	Mon, 31 Jan 2022 16:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B775410E168;
 Mon, 31 Jan 2022 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643648339; x=1675184339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2CQLzHAbozaruWz0jbHUE1cXV8en1qlTaq3taDajmDA=;
 b=f8fTpaY2folFPVvGwVMnmfezT5BYnLMp6Yu2ICitKjTvjFTOg5FreilW
 GVsFkf8AbA2F8Jt0X+PPiuKkh+TuobsPFmwY9hyxFFtiCfhfUMUNzpAXd
 OrLSyKva86F84Ii3txq58CJ1P1RoMpWKZoW/YWMxMqSUKU7IehrCDqQIZ
 5+JlzqEqsLsKqbaOH4T+WrfoUU2OGta2+XLu7XvEOl4HddV2+uK5V1URJ
 2duh1+h6vz891ichCJLJU9jrBa+avUxGfyn+mXgxjLR1stntOMcLWkD6x
 3lpW0N+vP5hA98tDCbJndw1LpK2SLtPspU3o8J6ZJrtuLCUfpV2OOggDh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247275434"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="247275434"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 08:58:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="496986486"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 08:58:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/i915: Do not spam log with missing arch support
Date: Mon, 31 Jan 2022 08:59:26 -0800
Message-Id: <20220131165926.3230642-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131165926.3230642-1-lucas.demarchi@intel.com>
References: <20220131165926.3230642-1-lucas.demarchi@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following what was done in drm_cache.c, when the stub for
remap_io_mapping() was added in commit 67c430bbaae1 ("drm/i915: Skip
remap_io_mapping() for non-x86 platforms"), it included a log message
with pr_err().  However just the warning is already enough and switching
to WARN_ONCE() allows us to keep the log message while avoiding log
spam.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

v3: No changes from previous version, just submitting to the right
mailing list

 drivers/gpu/drm/i915/i915_mm.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_mm.h b/drivers/gpu/drm/i915/i915_mm.h
index 3ad22bbe80eb..04c8974d822b 100644
--- a/drivers/gpu/drm/i915/i915_mm.h
+++ b/drivers/gpu/drm/i915/i915_mm.h
@@ -23,8 +23,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
 		     unsigned long addr, unsigned long pfn, unsigned long size,
 		     struct io_mapping *iomap)
 {
-	pr_err("Architecture has no %s() and shouldn't be calling this function\n", __func__);
-	WARN_ON_ONCE(1);
+	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
 	return 0;
 }
 #endif
-- 
2.35.0

