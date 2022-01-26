Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A71A49CDF6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D749A10E902;
	Wed, 26 Jan 2022 15:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9556A10E901;
 Wed, 26 Jan 2022 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210535; x=1674746535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jr7OMTVzDbWTcV+4xBbk49F3YjvnMFXX/Fczh6pNMbg=;
 b=P4gU2/Be5EgXK/wpnDACIGSUEtixtV/9/AFUqKUh5n/U3fpyle8llJ8z
 100dw/7nLAJ/ZHNcsHe3TAXF1Zzugac+cBDWfR/B+9F7XcnoEi95MN6nA
 zZkLmiutXSOzfdz/y1wEpf2SHWajBlVBdO6fVaTMqiYcoVq2R0jtqFaq/
 xl2wun7fOORNp1yKITaFovdBIMsAc2haPK2fUMk0XvzTG3ltm1Z6P17f4
 3ZJAGyu1ClXu0tnG+VeYSOA0FiKmON0xIN46iCoNnmlpumkMk7zTqgbIW
 1AfrhuFWSNN8rWGm8FmtnZa8DOQcRgk8KmVi/YBVIGsxEMWOx7JyfgWKK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885229"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885229"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386258"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:13 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/20] drm/i915/buddy: adjust res->start
Date: Wed, 26 Jan 2022 15:21:43 +0000
Message-Id: <20220126152155.3070602-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Differentiate between mappable vs non-mappable resources, also if this
is an actual range allocation ensure we set res->start as the starting
pfn. Later when we need to do non-mappable -> mappable moves then we
want TTM to see that the current placement is not compatible, which
should result in an actual move, instead of being turned into a noop.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 6e5842155898..bc725a92fc5c 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -140,6 +140,13 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 		mutex_unlock(&bman->lock);
 	}
 
+	if (place->lpfn - place->fpfn == n_pages)
+		bman_res->base.start = place->fpfn;
+	else if (lpfn <= bman->visible_size)
+		bman_res->base.start = 0;
+	else
+		bman_res->base.start = bman->visible_size;
+
 	*res = &bman_res->base;
 	return 0;
 
-- 
2.34.1

