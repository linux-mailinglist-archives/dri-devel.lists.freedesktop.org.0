Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E76239EBB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 07:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438F56E1BD;
	Mon,  3 Aug 2020 05:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE386E1BD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 05:18:59 +0000 (UTC)
IronPort-SDR: 5oACZgIpmWTW7aQt3W7Ex6O1g1rmcJm8uXP+mx2hamOJPbFUGo8hSF2Yj9TbgpJOaFPdwSTxcP
 Xox56/oWJAMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="151252112"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="151252112"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:18:59 -0700
IronPort-SDR: d/wJjHsV/Ha4N7/HCxpfqbMG6Jqx3v8hOhwX7h0OGcseNbzPcumFkC1vEVSiszrP/qfFDjNLwv
 j+TPjk1knNgA==
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="436081576"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 22:18:59 -0700
Subject: [PATCH v4 03/23] efi/fake_mem: Arrange for a resource entry per
 efi_fake_mem instance
From: Dan Williams <dan.j.williams@intel.com>
To: akpm@linux-foundation.org
Date: Sun, 02 Aug 2020 22:02:40 -0700
Message-ID: <159643096068.4062302.11590041070221681669.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
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
Cc: joao.m.martins@oracle.com, dave.hansen@linux.intel.com,
 linux-acpi@vger.kernel.org, ard.biesheuvel@linaro.org, peterz@infradead.org,
 vishal.l.verma@intel.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ard Biesheuvel <ardb@kernel.org>, linux-nvdimm@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for attaching a platform device per iomem resource teach
the efi_fake_mem code to create an e820 entry per instance. Similar to
E820_TYPE_PRAM, bypass merging resource when the e820 map is sanitized.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/x86/kernel/e820.c              |   16 +++++++++++++++-
 drivers/firmware/efi/x86_fake_mem.c |   12 +++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 983cd53ed4c9..22aad412f965 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -305,6 +305,20 @@ static int __init cpcompare(const void *a, const void *b)
 	return (ap->addr != ap->entry->addr) - (bp->addr != bp->entry->addr);
 }
 
+static bool e820_nomerge(enum e820_type type)
+{
+	/*
+	 * These types may indicate distinct platform ranges aligned to
+	 * numa node, protection domain, performance domain, or other
+	 * boundaries. Do not merge them.
+	 */
+	if (type == E820_TYPE_PRAM)
+		return true;
+	if (type == E820_TYPE_SOFT_RESERVED)
+		return true;
+	return false;
+}
+
 int __init e820__update_table(struct e820_table *table)
 {
 	struct e820_entry *entries = table->entries;
@@ -380,7 +394,7 @@ int __init e820__update_table(struct e820_table *table)
 		}
 
 		/* Continue building up new map based on this information: */
-		if (current_type != last_type || current_type == E820_TYPE_PRAM) {
+		if (current_type != last_type || e820_nomerge(current_type)) {
 			if (last_type != 0)	 {
 				new_entries[new_nr_entries].size = change_point[chg_idx]->addr - last_addr;
 				/* Move forward only if the new size was non-zero: */
diff --git a/drivers/firmware/efi/x86_fake_mem.c b/drivers/firmware/efi/x86_fake_mem.c
index e5d6d5a1b240..0bafcc1bb0f6 100644
--- a/drivers/firmware/efi/x86_fake_mem.c
+++ b/drivers/firmware/efi/x86_fake_mem.c
@@ -38,7 +38,7 @@ void __init efi_fake_memmap_early(void)
 		m_start = mem->range.start;
 		m_end = mem->range.end;
 		for_each_efi_memory_desc(md) {
-			u64 start, end;
+			u64 start, end, size;
 
 			if (md->type != EFI_CONVENTIONAL_MEMORY)
 				continue;
@@ -58,11 +58,17 @@ void __init efi_fake_memmap_early(void)
 			 */
 			start = max(start, m_start);
 			end = min(end, m_end);
+			size = end - start + 1;
 
 			if (end <= start)
 				continue;
-			e820__range_update(start, end - start + 1, E820_TYPE_RAM,
-					E820_TYPE_SOFT_RESERVED);
+
+			/*
+			 * Ensure each efi_fake_mem instance results in
+			 * a unique e820 resource
+			 */
+			e820__range_remove(start, size, E820_TYPE_RAM, 1);
+			e820__range_add(start, size, E820_TYPE_SOFT_RESERVED);
 			e820__update_table(e820_table);
 		}
 	}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
