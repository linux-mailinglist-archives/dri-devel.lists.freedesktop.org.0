Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DFD3B35CD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC676EC8B;
	Thu, 24 Jun 2021 18:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951EE6EC88;
 Thu, 24 Jun 2021 18:31:34 +0000 (UTC)
IronPort-SDR: lSR9mv4JVwM8dxeiyCraRQx4h+Lnlnp7T4K3dbKijYMn8PRohz65811nqIWCh/kvH3N4jBvsZy
 ZENklWY+tF6A==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="207354214"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="207354214"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:31:34 -0700
IronPort-SDR: KlBQojAwJ27frSmsP45Sv6qImAfd8rhhxE08LLAnYx3FKlSMZQYmLQ2ytezMG5hnVa61/LiSh7
 B9bfcoihGW2w==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="556585603"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.243])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:31:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map time
Date: Thu, 24 Jun 2021 20:31:10 +0200
Message-Id: <20210624183110.22582-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624183110.22582-1-thomas.hellstrom@linux.intel.com>
References: <20210624183110.22582-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Until we support p2p dma or as a complement to that, migrate data
to system memory at dma-buf map time if possible.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 616c3a2f1baf..a52f885bc09a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -25,7 +25,14 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 	struct scatterlist *src, *dst;
 	int ret, i;
 
-	ret = i915_gem_object_pin_pages_unlocked(obj);
+	ret = i915_gem_object_lock_interruptible(obj, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = i915_gem_object_migrate(obj, NULL, INTEL_REGION_SMEM);
+	if (!ret)
+		ret = i915_gem_object_pin_pages(obj);
+	i915_gem_object_unlock(obj);
 	if (ret)
 		goto err;
 
-- 
2.31.1

