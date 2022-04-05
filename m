Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C54F3888
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934EC10E8F9;
	Tue,  5 Apr 2022 14:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFC010E764;
 Tue,  5 Apr 2022 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649169259; x=1680705259;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tFRynHxMS+RjyyqC9TaSFhKuaHycRvpVH8isMAFz1Ww=;
 b=HHGIKmZmGifzvTrJ8Wtb17MbejK/rotJ3SsijhOGDKD0aDZz5VpAdWGq
 aJiT2RhICJ8xzdoVZUX1dvooxmnJ+1QHwE0d74jIOiWRQ2NgaJ80g1VlJ
 ORx/68bXwyhhaC1ou7yGSVWtRmMhMytyTmjghj8jtYQyTrAxhV9N05WTF
 hlZW563EAjVOfcCy9zv+oqwdImovnN6pEMdvL69ZdWQJRmHO58yGZWu0O
 noO1Shz75CmTYvSNKfkyMSSx81LMMalhQMGOMrgoDJuKnOHZUYi9WXROX
 /Nb3lRrLUcVzKBYG5R9rPUUOktvHzZzlfr/dVcrsN6UPu27/D4BUOMsoH w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="285722206"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="285722206"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:34:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="657959009"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:34:17 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 6/9] drm/i915/selftest_migrate: Consider the possible
 roundup of size
Date: Tue,  5 Apr 2022 20:04:51 +0530
Message-Id: <20220405143454.16358-7-ramalingam.c@intel.com>
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

Consider the possible round up happened at obj size alignment to
min_page_size during the obj allocation.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_migrate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index c9c4f391c5cc..b5da8b8cd039 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -152,6 +152,9 @@ static int clear(struct intel_migrate *migrate,
 	if (IS_ERR(obj))
 		return 0;
 
+	/* Consider the rounded up memory too */
+	sz = obj->base.size;
+
 	for_i915_gem_ww(&ww, err, true) {
 		err = i915_gem_object_lock(obj, &ww);
 		if (err)
-- 
2.20.1

