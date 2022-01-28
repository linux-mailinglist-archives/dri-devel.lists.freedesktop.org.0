Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D09D4A0029
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667CA10EB3B;
	Fri, 28 Jan 2022 18:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF5A10EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643394741; x=1674930741;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=H7/9vIFzCjh3W9BUNa7eaJPZ0CVcoZjzFcX2zutSRBw=;
 b=kRFzk+UpNAzxRE7paFCQ47iJehVdoogmRQqaRQHZGWCikhPClxEY/Qwh
 d/35sMweFVdsmF79l7eqS2JC+jSVfVeXpgfeAhwzUwJ5EQXtforAyGReg
 UDjXsBI324TUtIn12tg82TUnfJkkcZsJGpiEBMWN+tkSAif2hS0JFWMjU
 beI4G6A9YJC7twIT/MwAwGEzyoEYWC8hyCPLoRXaCk0sJraFN4YSy7cP9
 bYzwA8G6qU+/J6LN1OvVTdpB2rMj5i2vtKpxH3go0LH9UcXWT+5RZke/9
 iJfoI3anWdf5ilEP87LZX7X7lo1OH0MPRXyco6dcQyCmUTA4TQ4C21uvm A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="244774581"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="244774581"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:32:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="480828095"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:32:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: gfx-internal-devel@eclists.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/i915: Do not spam log with missing arch support
Date: Fri, 28 Jan 2022 10:33:05 -0800
Message-Id: <20220128183305.3072999-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128183305.3072999-1-lucas.demarchi@intel.com>
References: <20220128183305.3072999-1-lucas.demarchi@intel.com>
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

Following what was done in drm_cache.c, when the stub for
remap_io_mapping() was added in commit 67c430bbaae1 ("drm/i915: Skip
remap_io_mapping() for non-x86 platforms"), it included a log message
with pr_err().  However just the warning is already enough and switching
to WARN_ONCE() allows us to keep the log message while avoiding log
spam.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
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

