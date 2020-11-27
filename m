Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 032DA2C64EB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F46F6ECA7;
	Fri, 27 Nov 2020 12:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0466EBFB;
 Fri, 27 Nov 2020 12:09:52 +0000 (UTC)
IronPort-SDR: EwiYa3UoNPfjzTtvCeVuu3HS+u2dySPiKhNu6BlK5BPg6OBw1HfS3O4MXpjR/EOLsIqF6xGTYM
 sXXSZsLA5Ttg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540730"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540730"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:52 -0800
IronPort-SDR: oxCASUkANsZtaiU5LUnCuPrVeV+5ItOFQvTbdgLBQev50Ey7pMITp72VqaUv2N7FtCGsNCtcDe
 ezI5k9V4XITA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029118"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:51 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 079/162] drm/i915/dmabuf: Disallow LMEM objects from
 dma-buf
Date: Fri, 27 Nov 2020 12:05:55 +0000
Message-Id: <20201127120718.454037-80-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>

The dma-buf interface for i915 does not currently support
LMEM backed objects.

Check imported objects to see if they are from i915 and if they
are LMEM.  If they are, reject the import.

This check is needed in two places, once on import, and then a
recheck in the mapping path in the off chance that an object
was migrated to LMEM after import.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index c4b01e819786..018d02cc4af5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -9,6 +9,7 @@
 #include <linux/dma-resv.h>
 
 #include "i915_drv.h"
+#include "i915_gem_lmem.h"
 #include "i915_gem_object.h"
 #include "i915_scatterlist.h"
 
@@ -25,6 +26,11 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 	struct scatterlist *src, *dst;
 	int ret, i;
 
+	if (i915_gem_object_is_lmem(obj)) {
+		ret = -ENOTSUPP;
+		goto err;
+	}
+
 	ret = i915_gem_object_pin_pages(obj);
 	if (ret)
 		goto err;
@@ -248,6 +254,10 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 			 */
 			return &i915_gem_object_get(obj)->base;
 		}
+
+		/* not our device, but still a i915 object? */
+		if (i915_gem_object_is_lmem(obj))
+			return ERR_PTR(-ENOTSUPP);
 	}
 
 	/* need to attach */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
