Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3F4F3880
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB47D10E8D7;
	Tue,  5 Apr 2022 14:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFCF10E724;
 Tue,  5 Apr 2022 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649169256; x=1680705256;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KiOpqb8Tu4Ystozq7E4Ufs7roLiyN2gBwozWLFmgXi0=;
 b=f5y28JzTGSQZUjfy70a+FO5jQkYXWbLJ41kqSGuFm02ZyvmrKyi4fpDd
 jKnjS+KPoCYPTGWgcp4h2yvN+5/tAr4SxM9uAmGu6DgkTzfCUID5KlOzy
 Gj7HGulRwj3NAAvg5oAIryZm0E381Sw9nf04VUHm5KCIxOLlTYVHHvuTd
 DWMf3cBMwUKvcQkv6JtPApz/AroFOmQrXvhNs2fM82UyYMbdC5DLKB84l
 rWRdsNBC74D5fRqJGqeUS/qUZJwqtDP2ySRg9sTDXSYckLHCf7DG/wc5Z
 QIA0174bV5PTfGiA2fgZbkMhDEJLkm661QW6JJToFBOTm87PuGqWHsJ8d g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="285722194"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="285722194"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:34:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="657958991"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:34:15 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 4/9] drm/i915/gt: Pass the -EINVAL when emit_pte doesn't
 update any PTE
Date: Tue,  5 Apr 2022 20:04:49 +0530
Message-Id: <20220405143454.16358-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220405143454.16358-1-ramalingam.c@intel.com>
References: <20220405143454.16358-1-ramalingam.c@intel.com>
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

When emit_pte doesn't update any PTE with return value as 0, interpret
it as -EINVAL.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index e0f1c727662e..f9f3b0e7ed87 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -577,7 +577,9 @@ intel_context_migrate_copy(struct intel_context *ce,
 
 		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
 			       src_offset, CHUNK_SZ);
-		if (len <= 0) {
+		if (!len)
+			err = -EINVAL;
+		if (len < 0) {
 			err = len;
 			goto out_rq;
 		}
-- 
2.20.1

