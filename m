Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 654AF43D498
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08246E910;
	Wed, 27 Oct 2021 21:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D756E907;
 Wed, 27 Oct 2021 21:21:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="229020844"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="229020844"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:02 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="665154125"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:20:59 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Subject: [PATCH v3 04/17] drm/i915: enforce min page size for scratch
Date: Thu, 28 Oct 2021 02:53:26 +0530
Message-Id: <20211027212339.29259-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027212339.29259-1-ramalingam.c@intel.com>
References: <20211027212339.29259-1-ramalingam.c@intel.com>
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

From: Matthew Auld <matthew.auld@intel.com>

If the device needs 64K minimum GTT pages for device local-memory,
like on XEHPSDV, then we need to fail the allocation if we can't
meet it, instead of falling back to 4K pages, otherwise we can't
safely support the insertion of device local-memory pages for
this vm, since the HW expects the correct physical alignment and
size for every PTE, if we mark the page-table as 64K GTT mode.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 89507ae5c3e1..d05f762c50d8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -343,6 +343,18 @@ int setup_scratch_page(struct i915_address_space *vm)
 		if (size == I915_GTT_PAGE_SIZE_4K)
 			return -ENOMEM;
 
+		/*
+		 * If we need 64K minimum GTT pages for device local-memory,
+		 * like on XEHPSDV, then we need to fail the allocation here,
+		 * otherwise we can't safely support the insertion of
+		 * local-memory pages for this vm, since the HW expects the
+		 * correct physical alignment and size when the page-table is
+		 * operating in 64K GTT mode, which includes any scratch PTEs,
+		 * since userpsace can still touch them.
+		 */
+		if (HAS_64K_PAGES(vm->i915))
+			return -ENOMEM;
+
 		size = I915_GTT_PAGE_SIZE_4K;
 	} while (1);
 }
-- 
2.20.1

