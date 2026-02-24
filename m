Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOLaNFt0nWmAQAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:50:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB12184EC5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1C310E541;
	Tue, 24 Feb 2026 09:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcXcUYVC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A81610E539;
 Tue, 24 Feb 2026 09:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771926614; x=1803462614;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LE2pGK1fEdEnRioFiZQy8bGXtGZfvqUajV9L7/N1/C4=;
 b=gcXcUYVCI5Op08HOAw9CGoyS5ccmxp3U7FCHKLwjsofYPcm/gJrNzBZ+
 DnFpgKTXpZsnkGWqoSkpWQHRb9yfRHyQVQAyav5e0k4MzCuwOSmxbKqvD
 5R9kEqdkPN5lEWNQQEz/hMsCy/jzQCu9KNhUkFxBh5qB3x31ys8tkmSMM
 7GMPdbdLpBAqm8S1ufb99I/wmyBe/SEcUl/rAhqaW8KSjEPBI6dgvJqDE
 7CTbR7yRiN2eMpSI+sHU9F6mqFgvjDiYa7XOld27hqYQv3+jtARo1MkAn
 C+BeyJ5yDzTfWJFPYt3lUqvqniq2E6OdaB34lBkRm1alcY43+cuyLG/0e Q==;
X-CSE-ConnectionGUID: 0qsYefiDQY2jfE2qAaXibQ==
X-CSE-MsgGUID: 1heexYsGRwGY4/7R6oRsVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72839671"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72839671"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:50:13 -0800
X-CSE-ConnectionGUID: ME+F9SM7QMC4B6rDFbfkWg==
X-CSE-MsgGUID: Z51BegxZQY+Lunaq8VrnTw==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.26])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:50:10 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH] drm/i915: Fix potential overflow of shmem scatterlist length
Date: Tue, 24 Feb 2026 10:49:06 +0100
Message-ID: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[janusz.krzysztofik@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,infradead.org:email]
X-Rspamd-Queue-Id: 8AB12184EC5
X-Rspamd-Action: no action

When a scatterlists table of a GEM shmem object of size 4 GB or more is
populated with pages allocated from a folio, unsigned int .length
attribute of a scatterlist may get overflowed if total byte length of
pages allocated to that single scatterlist happens to reach or cross the
4GB limit.  As a consequence, users of the object may suffer from hitting
unexpected, premature end of the object's backing pages.

[278.780187] ------------[ cut here ]------------
[278.780377] WARNING: CPU: 1 PID: 2326 at drivers/gpu/drm/i915/i915_mm.c:55 remap_sg+0x199/0x1d0 [i915]
...
[278.780654] CPU: 1 UID: 0 PID: 2326 Comm: gem_mmap_offset Tainted: G S   U              6.17.0-rc1-CI_DRM_16981-ged823aaa0607+ #1 PREEMPT(voluntary)
[278.780656] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
[278.780658] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
[278.780659] RIP: 0010:remap_sg+0x199/0x1d0 [i915]
...
[278.780786] Call Trace:
[278.780787]  <TASK>
[278.780788]  ? __apply_to_page_range+0x3e6/0x910
[278.780795]  ? __pfx_remap_sg+0x10/0x10 [i915]
[278.780906]  apply_to_page_range+0x14/0x30
[278.780908]  remap_io_sg+0x14d/0x260 [i915]
[278.781013]  vm_fault_cpu+0xd2/0x330 [i915]
[278.781137]  __do_fault+0x3a/0x1b0
[278.781140]  do_fault+0x322/0x640
[278.781143]  __handle_mm_fault+0x938/0xfd0
[278.781150]  handle_mm_fault+0x12c/0x300
[278.781152]  ? lock_mm_and_find_vma+0x4b/0x760
[278.781155]  do_user_addr_fault+0x2d6/0x8e0
[278.781160]  exc_page_fault+0x96/0x2c0
[278.781165]  asm_exc_page_fault+0x27/0x30
...

That issue was apprehended by the author of a change that introduced it,
and potential risk even annotated with a comment, but then never addressed.

When adding folio pages to a scatterlist table, take care of byte length
of any single scatterlist not exceeding max_segment.

Fixes: 0b62af28f249b ("i915: convert shmem_sg_free_table() to use a folio_batch")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: stable@vger.kernel.org # v6.5+
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index c6c64ba29bc42..720a9ad39aa2a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -153,8 +153,12 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 			}
 		} while (1);
 
-		nr_pages = min_t(unsigned long,
-				folio_nr_pages(folio), page_count - i);
+		nr_pages = min_array(((unsigned long[]) {
+					folio_nr_pages(folio),
+					page_count - i,
+					max_segment / PAGE_SIZE,
+				      }), 3);
+
 		if (!i ||
 		    sg->length >= max_segment ||
 		    folio_pfn(folio) != next_pfn) {
@@ -164,7 +168,9 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 			st->nents++;
 			sg_set_folio(sg, folio, nr_pages * PAGE_SIZE, 0);
 		} else {
-			/* XXX: could overflow? */
+			nr_pages = min_t(unsigned long, nr_pages,
+					 (max_segment - sg->length) / PAGE_SIZE);
+
 			sg->length += nr_pages * PAGE_SIZE;
 		}
 		next_pfn = folio_pfn(folio) + nr_pages;
-- 
2.52.0

