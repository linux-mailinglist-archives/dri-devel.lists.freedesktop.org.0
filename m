Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30041344A32
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548DC89D3E;
	Mon, 22 Mar 2021 16:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A43A89D3E;
 Mon, 22 Mar 2021 16:03:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA0F66199E;
 Mon, 22 Mar 2021 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429019;
 bh=by6x6Rsrr+/5kT7BQ0fn/CIy488q3HO6uAtxXzMMlIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O6Jy+HmUTikJ1x1bJ304Vrp1sBfWbLm1PtId9ZJsKafzCLMEYQU//L/uQ5NyHGzrh
 RhBcv0KcZohevaQjWtq/m2PyDxHXZ6oO/xPHdEAeZN27qebnzt5Wg4fhtjqGJK48VY
 UL94XPmfJWp5a2JWF1yBFnnQqkdteTxWc08FTIpJX/wa6/CiiShyqAZe7XpjIeOmzt
 cO/lp91PJ7K5iDRKpXJ1LzXMgwxLeTNc1hWrW+Oj2cHQ8M1FuYfEUnJHvIMPGvZ3nY
 pOppyp2fEDOWTHfMFCcVXI+sMo5gidr9nyHaAyqJ/Nlnh1nTbp/etdZKIJcUsxQAJ9
 FpT/4xvv9xvFg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Ning Sun <ning.sun@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org
Subject: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
Date: Mon, 22 Mar 2021 17:02:40 +0100
Message-Id: <20210322160253.4032422-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, linux-scsi@vger.kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org,
 Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Anders Larsen <al@alarsen.net>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-security-module@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, intel-gfx@lists.freedesktop.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

gcc-11 warns about using string operations on pointers that are
defined at compile time as offsets from a NULL pointer. Unfortunately
that also happens on the result of fix_to_virt(), which is a
compile-time constant for a constantn input:

arch/x86/kernel/tboot.c: In function 'tboot_probe':
arch/x86/kernel/tboot.c:70:13: error: '__builtin_memcmp_eq' specified bound 16 exceeds source size 0 [-Werror=stringop-overread]
   70 |         if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I hope this can get addressed in gcc-11 before the release.

As a workaround, split up the tboot_probe() function in two halves
to separate the pointer generation from the usage. This is a bit
ugly, and hopefully gcc understands that the code is actually correct
before it learns to peek into the noinline function.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/kernel/tboot.c | 44 ++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/tboot.c b/arch/x86/kernel/tboot.c
index 4c09ba110204..f9af561c3cd4 100644
--- a/arch/x86/kernel/tboot.c
+++ b/arch/x86/kernel/tboot.c
@@ -49,6 +49,30 @@ bool tboot_enabled(void)
 	return tboot != NULL;
 }
 
+/* noinline to prevent gcc from warning about dereferencing constant fixaddr */
+static noinline __init bool check_tboot_version(void)
+{
+	if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
+		pr_warn("tboot at 0x%llx is invalid\n", boot_params.tboot_addr);
+		return false;
+	}
+
+	if (tboot->version < 5) {
+		pr_warn("tboot version is invalid: %u\n", tboot->version);
+		return false;
+	}
+
+	pr_info("found shared page at phys addr 0x%llx:\n",
+		boot_params.tboot_addr);
+	pr_debug("version: %d\n", tboot->version);
+	pr_debug("log_addr: 0x%08x\n", tboot->log_addr);
+	pr_debug("shutdown_entry: 0x%x\n", tboot->shutdown_entry);
+	pr_debug("tboot_base: 0x%08x\n", tboot->tboot_base);
+	pr_debug("tboot_size: 0x%x\n", tboot->tboot_size);
+
+	return true;
+}
+
 void __init tboot_probe(void)
 {
 	/* Look for valid page-aligned address for shared page. */
@@ -66,25 +90,9 @@ void __init tboot_probe(void)
 
 	/* Map and check for tboot UUID. */
 	set_fixmap(FIX_TBOOT_BASE, boot_params.tboot_addr);
-	tboot = (struct tboot *)fix_to_virt(FIX_TBOOT_BASE);
-	if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
-		pr_warn("tboot at 0x%llx is invalid\n", boot_params.tboot_addr);
+	tboot = (void *)fix_to_virt(FIX_TBOOT_BASE);
+	if (!check_tboot_version())
 		tboot = NULL;
-		return;
-	}
-	if (tboot->version < 5) {
-		pr_warn("tboot version is invalid: %u\n", tboot->version);
-		tboot = NULL;
-		return;
-	}
-
-	pr_info("found shared page at phys addr 0x%llx:\n",
-		boot_params.tboot_addr);
-	pr_debug("version: %d\n", tboot->version);
-	pr_debug("log_addr: 0x%08x\n", tboot->log_addr);
-	pr_debug("shutdown_entry: 0x%x\n", tboot->shutdown_entry);
-	pr_debug("tboot_base: 0x%08x\n", tboot->tboot_base);
-	pr_debug("tboot_size: 0x%x\n", tboot->tboot_size);
 }
 
 static pgd_t *tboot_pg_dir;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
