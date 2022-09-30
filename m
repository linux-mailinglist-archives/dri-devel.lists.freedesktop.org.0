Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55DE5F040F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 07:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF3810EB51;
	Fri, 30 Sep 2022 05:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308BF10E18A;
 Fri, 30 Sep 2022 05:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664514591; x=1696050591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5reg6jXM5rUZ2u/oR2IsA+twznxUyyswmDgZMtmzZWM=;
 b=Kw4OiyY/1B2fxx4LyGtFjPRvF5JoJyOR5+1Z6urV3JtjO/Geym2R1OFZ
 QkddBARGPfxB9XUcwDpfHMTTl7r/ragBNcP71u9AJWx+ZZkHQFqQg3ImQ
 9hC4Oa95B33rv2qafyymE+Cfn6Y4ruGjLdF8m4rfr/EIqa+tNk8+H+P09
 TZ1y5bHaW8SPB/poOVJVnjJn0D4ujV4bQzrlJQtsrRuMnDwImIndP+0Xr
 00IkFUcHYGMhr+2rw/uXP0sYvj8J9fPabOk/wtv+fHXirPHRIf9tl/onU
 wxLwUu719+Wy53NeeGokMm8eoMJL7ShjigMD+Fc+J54lqurfGc3jyItZq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="299707896"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="299707896"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 22:09:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="711668535"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="711668535"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 22:09:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/gt: Document function to decode register state
 context
Date: Thu, 29 Sep 2022 22:09:02 -0700
Message-Id: <20220930050903.3479619-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930050903.3479619-1-lucas.demarchi@intel.com>
References: <20220930050903.3479619-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's no obviously clear how the encode/decode of the per platform tables
is done. Document it so while adding tables for new platforms people can
be confident they right things is being done.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 3515882a91fb..7771a19008c6 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -20,6 +20,30 @@
 #include "intel_ring.h"
 #include "shmem_utils.h"
 
+/*
+ * The per-platform tables are u8-encoded in @data. Decode @data and set the
+ * addresses' offset and commands in @regs. The following encoding is used
+ * for each byte. There are 2 steps: decoding commands and decoding addresses.
+ *
+ * Commands:
+ * [7]: create NOPs - number of NOPs are set in lower bits
+ * [6]: When creating MI_LOAD_REGISTER_IMM command, allow to set
+ *      MI_LRI_FORCE_POSTED
+ * [5:0]: Number of NOPs or registers to set values to in case of
+ *        MI_LOAD_REGISTER_IMM
+ *
+ * Addresses: these are decoded after a MI_LOAD_REGISTER_IMM command by "count"
+ * number of registers. They are set by using the REG/REG16 macros: the former
+ * is used for offsets smaller than 0x200 while the latter is for values bigger
+ * than that. Those macros already set all the bits documented below correctly:
+ *
+ * [7]: When a register offset needs more than 6 bits, use additional bytes, to
+ *      follow, for the lower bits
+ * [6:0]: Register offset, without considering the engine base.
+ *
+ * This function only tweaks the commands and register offsets. Values are not
+ * filled out.
+ */
 static void set_offsets(u32 *regs,
 			const u8 *data,
 			const struct intel_engine_cs *engine,
-- 
2.37.3

