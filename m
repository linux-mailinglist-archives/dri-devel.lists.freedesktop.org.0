Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED0CB38A9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 17:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD47610E70E;
	Wed, 10 Dec 2025 16:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMfxfJ5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC3810E70E;
 Wed, 10 Dec 2025 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765385902; x=1796921902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gFIo+KrdG+RVSEy6pKRA/YU+jj0wbAaFXvoD2Nd9d9k=;
 b=WMfxfJ5dyXYDlH+xjugqUmpGIHe3Tt1GxQIYsN6uy/RbYJSbTjrBuwzX
 zP/ZzYhuoVwq0RAgu9ufonHe0bZlIb1Par/Lx6sBtxffG9Jg3lALt2MYW
 048D4nbGYP9Om5hld9EJD7pAJ4RsGRJoVdj20hSWiniz9IFr79aXGMaq4
 Od2R/5/8Tj++u2JOqd5HJGXrFbJL2IeuCKdthxPFF0AEGGJhuQAoNpqeQ
 lQKYYYDVaSDvFxgrHv96IYs2JMJ+sLDop/nBdb6Eu76KbkgpICSv6Cntb
 w2wcuI7L3b+nVOlzfvNGs2uonFpiGu9KvHJFrof+lxeqNHDBDRtdDYS9p A==;
X-CSE-ConnectionGUID: QOnlGZlPSAGNUZfWF6sFrg==
X-CSE-MsgGUID: XG1T0GauRAOarXIWhcsCww==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67399128"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67399128"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 08:58:21 -0800
X-CSE-ConnectionGUID: +zd/yn2BSlqPrunie5ua7w==
X-CSE-MsgGUID: NLtEGS1jRBWieKEMmttjpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="200727964"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.224])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 08:58:17 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: stable@vger.kernel.org,
 =?UTF-8?q?=EA=B9=80=EA=B0=95=EB=AF=BC?= <km.kim1503@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH v3] drm/i915/gem: Zero-initialize the eb.vma array in
 i915_gem_do_execbuffer()
Date: Wed, 10 Dec 2025 17:57:01 +0100
Message-ID: <20251210165659.29349-3-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

Initialize the eb.vma array with values of 0 when the eb structure is
first set up. In particular, this sets the eb->vma[i].vma pointers to
NULL, simplifying cleanup and getting rid of the bug described below.

During the execution of eb_lookup_vmas(), the eb->vma array is
successively filled up with struct eb_vma objects. This process includes
calling eb_add_vma(), which might fail; however, even in the event of
failure, eb->vma[i].vma is set for the currently processed buffer.

If eb_add_vma() fails, eb_lookup_vmas() returns with an error, which
prompts a call to eb_release_vmas() to clean up the mess. Since
eb_lookup_vmas() might fail during processing any (possibly not first)
buffer, eb_release_vmas() checks whether a buffer's vma is NULL to know
at what point did the lookup function fail.

In eb_lookup_vmas(), eb->vma[i].vma is set to NULL if either the helper
function eb_lookup_vma() or eb_validate_vma() fails. eb->vma[i+1].vma is
set to NULL in case i915_gem_object_userptr_submit_init() fails; the
current one needs to be cleaned up by eb_release_vmas() at this point,
so the next one is set. If eb_add_vma() fails, neither the current nor
the next vma is nullified, which is a source of a NULL deref bug
described in the issue linked in the Closes tag.

When entering eb_lookup_vmas(), the vma pointers are set to the slab
poison value, instead of NULL. This doesn't matter for the actual
lookup, since it gets overwritten anyway, however the eb_release_vmas()
function only recognizes NULL as the stopping value, hence the pointers
are being nullified as they go in case of intermediate failure. This
patch changes the approach to filling them all with NULL at the start
instead, rather than handling that manually during failure.

Reported-by: Gangmin Kim <km.kim1503@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062
Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
Cc: <stable@vger.kernel.org> # 5.16.x
Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---

I messed up the continuity in previous revisions; the original patch
was sent as [1], and the first revision (which I didn't mark as v2 due
to the title change) was sent as [2].

This is the full current changelog:

v3:
   - use memset() to fill the entire eb.vma array with zeros instead of
   looping through the elements (Janusz)
   - add a comment clarifying the mechanism of the initial allocation (Janusz)
   - change the commit log again, including title
   - rearrange the tags to keep checkpatch happy
v2:
   - set the eb->vma[i].vma pointers to NULL during setup instead of
     ad-hoc at failure (Janusz)
   - romanize the reporter's name (Andi, offline)
   - change the commit log, including title

[1] https://patchwork.freedesktop.org/series/156832/
[2] https://patchwork.freedesktop.org/series/158036/

 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 36 +++++++++----------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index b057c2fa03a4..5f2b736b53ab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -951,13 +951,13 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
 		vma = eb_lookup_vma(eb, eb->exec[i].handle);
 		if (IS_ERR(vma)) {
 			err = PTR_ERR(vma);
-			goto err;
+			return err;
 		}
 
 		err = eb_validate_vma(eb, &eb->exec[i], vma);
 		if (unlikely(err)) {
 			i915_vma_put(vma);
-			goto err;
+			return err;
 		}
 
 		err = eb_add_vma(eb, &current_batch, i, vma);
@@ -966,19 +966,8 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
 
 		if (i915_gem_object_is_userptr(vma->obj)) {
 			err = i915_gem_object_userptr_submit_init(vma->obj);
-			if (err) {
-				if (i + 1 < eb->buffer_count) {
-					/*
-					 * Execbuffer code expects last vma entry to be NULL,
-					 * since we already initialized this entry,
-					 * set the next value to NULL or we mess up
-					 * cleanup handling.
-					 */
-					eb->vma[i + 1].vma = NULL;
-				}
-
+			if (err)
 				return err;
-			}
 
 			eb->vma[i].flags |= __EXEC_OBJECT_USERPTR_INIT;
 			eb->args->flags |= __EXEC_USERPTR_USED;
@@ -986,10 +975,6 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
 	}
 
 	return 0;
-
-err:
-	eb->vma[i].vma = NULL;
-	return err;
 }
 
 static int eb_lock_vmas(struct i915_execbuffer *eb)
@@ -3375,7 +3360,9 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 
 	eb.exec = exec;
 	eb.vma = (struct eb_vma *)(exec + args->buffer_count + 1);
-	eb.vma[0].vma = NULL;
+
+	memset(eb.vma, 0x00, args->buffer_count * sizeof(struct eb_vma));
+
 	eb.batch_pool = NULL;
 
 	eb.invalid_flags = __EXEC_OBJECT_UNKNOWN_FLAGS;
@@ -3584,7 +3571,16 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		return err;
 
-	/* Allocate extra slots for use by the command parser */
+	/*
+	 * Allocate extra slots for use by the command parser.
+	 *
+	 * Note that this allocation handles two different arrays (the
+	 * exec2_list array, and the eventual eb.vma array introduced in
+	 * i915_gem_do_execubuffer()), that reside in virtually contiguous
+	 * memory. Also note that the allocation doesn't fill the area with
+	 * zeros (the first part doesn't need to be), but the second part only
+	 * is explicitly zeroed later in i915_gem_do_execbuffer().
+	 */
 	exec2_list = kvmalloc_array(count + 2, eb_element_size(),
 				    __GFP_NOWARN | GFP_KERNEL);
 	if (exec2_list == NULL) {
-- 
2.45.2

