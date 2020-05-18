Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D990B1D8785
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 20:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86076E48B;
	Mon, 18 May 2020 18:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4836E48B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 18:48:46 +0000 (UTC)
IronPort-SDR: A2wIonoB6yl4M/lYTwx3ZFmpzn9F86XIJRyE2odcFOKmKIwMZCI0XfP6T4AkqVA3u2kaD61yHJ
 N+tLx06QaS7A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 11:48:45 -0700
IronPort-SDR: A0dNOJcp3XVBRer+3SvVGXusda3bUk5OmiTTHwwN4BXAPX4zWgYa/kiDwvCtGSiDC+7pgbW2fC
 b75hGkYrg3kw==
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; d="scan'208";a="253140387"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 11:48:45 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] arch/{mips, sparc, microblaze,
 powerpc}: Don't enable pagefault/preempt twice
Date: Mon, 18 May 2020 11:48:43 -0700
Message-Id: <20200518184843.3029640-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150004.1423069-8-ira.weiny@intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

The kunmap_atomic clean up failed to remove one set of pagefault/preempt
enables when vaddr is not in the fixmap.

Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/microblaze/mm/highmem.c | 5 +----
 arch/mips/mm/highmem.c       | 5 +----
 arch/powerpc/mm/highmem.c    | 5 +----
 arch/sparc/mm/highmem.c      | 5 +----
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/microblaze/mm/highmem.c b/arch/microblaze/mm/highmem.c
index ee8a422b2b76..92e0890416c9 100644
--- a/arch/microblaze/mm/highmem.c
+++ b/arch/microblaze/mm/highmem.c
@@ -57,11 +57,8 @@ void kunmap_atomic_high(void *kvaddr)
 	int type;
 	unsigned int idx;
 
-	if (vaddr < __fix_to_virt(FIX_KMAP_END)) {
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < __fix_to_virt(FIX_KMAP_END))
 		return;
-	}
 
 	type = kmap_atomic_idx();
 
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index 37e244cdb14e..8e8726992720 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -41,11 +41,8 @@ void kunmap_atomic_high(void *kvaddr)
 	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
 	int type __maybe_unused;
 
-	if (vaddr < FIXADDR_START) { // FIXME
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < FIXADDR_START)
 		return;
-	}
 
 	type = kmap_atomic_idx();
 #ifdef CONFIG_DEBUG_HIGHMEM
diff --git a/arch/powerpc/mm/highmem.c b/arch/powerpc/mm/highmem.c
index 35071c2913f1..624b4438aff9 100644
--- a/arch/powerpc/mm/highmem.c
+++ b/arch/powerpc/mm/highmem.c
@@ -44,11 +44,8 @@ void kunmap_atomic_high(void *kvaddr)
 {
 	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
 
-	if (vaddr < __fix_to_virt(FIX_KMAP_END)) {
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < __fix_to_virt(FIX_KMAP_END))
 		return;
-	}
 
 	if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM)) {
 		int type = kmap_atomic_idx();
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index d237d902f9c3..6ff6e2a9f9b3 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -86,11 +86,8 @@ void kunmap_atomic_high(void *kvaddr)
 	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
 	int type;
 
-	if (vaddr < FIXADDR_START) { // FIXME
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < FIXADDR_START)
 		return;
-	}
 
 	type = kmap_atomic_idx();
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
