Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF80F709F25
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A8810E5FA;
	Fri, 19 May 2023 18:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932B910E5FE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684521448; x=1716057448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OdZfP7pbImUjYsnrLdKphdx9iuKXkY5Ud76I5TW4z4g=;
 b=THgIFVytmxmdIeY6U2VrTF6aAXrcdFx82yy84gpUD+NAB2qPxcOX4JlO
 2rs5A54YDQvxkkdmfaZ4Dz1Fd1wEISx05JTFj0GBLkP1jDVTccgKbl7nw
 HOyOhrH+juYDgfhLzDhPxmOiB8Br2v46uq9MxbWI+8WKfW6vxWY5PmZ84
 Wm6B18p6AZyUqQhtq7KSYMtC3zWQ66Juk6ClvufGo3SbSi5drBJuhObxo
 +nRzCKOWvUDcOJvuexz6WX4DnwsKgEDfZPmtV8IP0LTbK+qhNkevzEGu0
 ptrpIRg++cpB04BQI8k2AdBnl1g8MChpm1QgY4KrUkQXyUTfymZEfJriW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="438802930"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="438802930"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 11:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="876935457"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="876935457"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.31.132])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 11:37:23 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [RESUBMIT][PATCH] x86/mm: Fix PAT bit missing from page protection
 modify mask
Date: Fri, 19 May 2023 20:36:34 +0200
Message-Id: <20230519183634.190364-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Juergen Gross <jgross@suse.com>, Yu Zhao <yuzhao@google.com>,
 David Hildenbrand <david@redhat.com>, x86@kernel.org,
 drm-intel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Visible glitches have been observed when running graphics applications on
Linux under Xen hypervisor.  Those observations have been confirmed with
failures from kms_pwrite_crc Intel GPU test that verifies data coherency
of DRM frame buffer objects using hardware CRC checksums calculated by
display controllers, exposed to userspace via debugfs.  Affected
processing paths have then been identified with new IGT test variants that
mmap the objects using different methods and caching modes [1].

When running as a Xen PV guest, Linux uses Xen provided PAT configuration
which is different from its native one.  In particular, Xen specific PTE
encoding of write-combining caching, likely used by graphics applications,
differs from the Linux default one found among statically defined minimal
set of supported modes.  Since Xen defines PTE encoding of the WC mode as
_PAGE_PAT, it no longer belongs to the minimal set, depends on correct
handling of _PAGE_PAT bit, and can be mismatched with write-back caching.

When a user calls mmap() for a DRM buffer object, DRM device specific
.mmap file operation, called from mmap_region(), takes care of setting PTE
encoding bits in a vm_page_prot field of an associated virtual memory area
structure.  Unfortunately, _PAGE_PAT bit is not preserved when the vma's
.vm_flags are then applied to .vm_page_prot via vm_set_page_prot().  Bits
to be preserved are determined with _PAGE_CHG_MASK symbol that doesn't
cover _PAGE_PAT.  As a consequence, WB caching is requested instead of WC
when running under Xen (also, WP is silently changed to WT, and UC
downgraded to UC_MINUS).  When running on bare metal, WC is not affected,
but WP and WT extra modes are unintentionally replaced with WC and UC,
respectively.

WP and WT modes, encoded with _PAGE_PAT bit set, were introduced by commit
281d4078bec3 ("x86: Make page cache mode a real type").  Care was taken
to extend _PAGE_CACHE_MASK symbol with that additional bit, but that
symbol has never been used for identification of bits preserved when
applying page protection flags.  Support for all cache modes under Xen,
including the problematic WC mode, was then introduced by commit
47591df50512 ("xen: Support Xen pv-domains using PAT").

Extend bitmask used by pgprot_modify() for selecting bits to be preserved
with _PAGE_PAT bit.  However, since that bit can be reused as _PAGE_PSE,
and the _PAGE_CHG_MASK symbol, primarly used by pte_modify(), is likely
intentionally defined with that bit not set, keep that symbol unchanged.

[1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/0f0754413f14

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7648
Fixes: 281d4078bec3 ("x86: Make page cache mode a real type")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: stable@vger.kernel.org # v3.19+
---
 arch/x86/include/asm/pgtable.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 15ae4d6ba4768..56466afd04307 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -654,8 +654,10 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 #define pgprot_modify pgprot_modify
 static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
 {
-	pgprotval_t preservebits = pgprot_val(oldprot) & _PAGE_CHG_MASK;
-	pgprotval_t addbits = pgprot_val(newprot) & ~_PAGE_CHG_MASK;
+	unsigned long mask = _PAGE_CHG_MASK | _PAGE_CACHE_MASK;
+
+	pgprotval_t preservebits = pgprot_val(oldprot) & mask;
+	pgprotval_t addbits = pgprot_val(newprot) & ~mask;
 	return __pgprot(preservebits | addbits);
 }
 
-- 
2.40.1

