Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FB3A7D58
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 13:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D53489AE6;
	Tue, 15 Jun 2021 11:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C679489AE6;
 Tue, 15 Jun 2021 11:36:14 +0000 (UTC)
IronPort-SDR: FSryRWtpJB9cisFle0nBNMnbN+WTzvRq1344Y5qmES1Biu/TRYPY7VcsO8CqEiTuLt6GU2IjRO
 nW6jUoqXiBdw==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="205789708"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="205789708"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 04:36:14 -0700
IronPort-SDR: yLEj6n/IPDGnS9TnCV29xh9JXiodretEJJsRCifTlhX+FoqZloy+Fwp8Pc0Ky+3RIper0+mmJ8
 F41UTUy9+sJg==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="421095275"
Received: from vgribano-mobl.ccr.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.53])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 04:36:12 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Perform execbuffer object locking as a separate step
Date: Tue, 15 Jun 2021 13:36:00 +0200
Message-Id: <20210615113600.30660-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

To help avoid evicting already resident buffers from the batch we're
processing, perform locking as a separate step.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 201fed19d120..394eb40c95b5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -922,21 +922,38 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
 	return err;
 }
 
-static int eb_validate_vmas(struct i915_execbuffer *eb)
+static int eb_lock_vmas(struct i915_execbuffer *eb)
 {
 	unsigned int i;
 	int err;
 
-	INIT_LIST_HEAD(&eb->unbound);
-
 	for (i = 0; i < eb->buffer_count; i++) {
-		struct drm_i915_gem_exec_object2 *entry = &eb->exec[i];
 		struct eb_vma *ev = &eb->vma[i];
 		struct i915_vma *vma = ev->vma;
 
 		err = i915_gem_object_lock(vma->obj, &eb->ww);
 		if (err)
 			return err;
+	}
+
+	return 0;
+}
+
+static int eb_validate_vmas(struct i915_execbuffer *eb)
+{
+	unsigned int i;
+	int err;
+
+	INIT_LIST_HEAD(&eb->unbound);
+
+	err = eb_lock_vmas(eb);
+	if (err)
+		return err;
+
+	for (i = 0; i < eb->buffer_count; i++) {
+		struct drm_i915_gem_exec_object2 *entry = &eb->exec[i];
+		struct eb_vma *ev = &eb->vma[i];
+		struct i915_vma *vma = ev->vma;
 
 		err = eb_pin_vma(eb, entry, ev);
 		if (err == -EDEADLK)
-- 
2.31.1

