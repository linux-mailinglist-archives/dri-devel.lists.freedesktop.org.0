Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1104E32CA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 23:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4EF10E4AE;
	Mon, 21 Mar 2022 22:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085C210E4A7;
 Mon, 21 Mar 2022 22:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647902675; x=1679438675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aV72eiNbFQojrgOHXlBFcVVE5yGUs4sDzt209QLZecA=;
 b=U0Ln+LP2wXLMJgES5k1K3NTo72/pWm48rTwB/spcP4HtsGOu2leNrgD7
 smIHBPBHC2RWf43eQ/o952L7YlNT6GUeugiD4qDzp2MFpSy97zPtGzZLN
 mFvpRalUK+onHYsA276wo5RccGW8hKOi+ecqNVJZuTyQ97U7uiXzBUx5l
 +4RKWuA129Ta0fItjFr5o6tCeSbQskQzgfWxndsO1x+LZX0+hKLHGeFkm
 9B86YWt7WUQsz8CUtRGaWpzxFb7ldogWwKkvZgwbpgf0+TjgizWxpXBcv
 450BB7cwOL0HBAlfX+XC7LhizqGliFdguajTtt47UHQp/ZEZNJ7FYrEsp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257613696"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="257613696"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:44:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="543414221"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:44:32 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 4/9] drm/i915/selftest_migrate: Consider the possible
 roundup of size
Date: Tue, 22 Mar 2022 04:14:54 +0530
Message-Id: <20220321224459.12223-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220321224459.12223-1-ramalingam.c@intel.com>
References: <20220321224459.12223-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Consider the possible round up happened at obj size alignment to
min_page_size during the obj allocation.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
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

