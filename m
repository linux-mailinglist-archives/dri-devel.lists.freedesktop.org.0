Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E95234FC2
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 05:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DF36E135;
	Sat,  1 Aug 2020 03:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C966E135
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 03:41:31 +0000 (UTC)
IronPort-SDR: CgKr7IVYzNDKtwlNaVwS32S/UJV59XYBVuePRa4v1CwccdKKRdAxeIWV7R6OMHObQIMaYCvmM9
 7saMWKgALKxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9699"; a="153118115"
X-IronPort-AV: E=Sophos;i="5.75,420,1589266800"; d="scan'208";a="153118115"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 20:41:30 -0700
IronPort-SDR: ACjauyPXTAtRnuGjFD+kfUp9GQXfxCZ+bkUw//4tufW1ljNVSx6Bk1froCEMY6X3U9XXyfmlwB
 YPQG2AiZldaQ==
X-IronPort-AV: E=Sophos;i="5.75,420,1589266800"; d="scan'208";a="305244426"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 20:41:30 -0700
Subject: [PATCH v3 02/23] x86/numa: Add 'nohmat' option
From: Dan Williams <dan.j.williams@intel.com>
To: akpm@linux-foundation.org
Date: Fri, 31 Jul 2020 20:25:12 -0700
Message-ID: <159625231266.3040297.2759117253481288037.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <159625229779.3040297.11363509688097221416.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <159625229779.3040297.11363509688097221416.stgit@dwillia2-desk3.amr.corp.intel.com>
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
Cc: x86@kernel.org, linux-acpi@vger.kernel.org, ard.biesheuvel@linaro.org,
 Peter Zijlstra <peterz@infradead.org>, vishal.l.verma@intel.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, joao.m.martins@oracle.com,
 linux-nvdimm@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disable parsing of the HMAT for debug, to workaround broken platform
instances, or cases where it is otherwise not wanted.

Cc: x86@kernel.org
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/x86/mm/numa.c       |    2 ++
 drivers/acpi/numa/hmat.c |    8 +++++++-
 include/acpi/acpi_numa.h |    8 ++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 87c52822cc44..f3805bbaa784 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -41,6 +41,8 @@ static __init int numa_setup(char *opt)
 		return numa_emu_cmdline(opt + 5);
 	if (!strncmp(opt, "noacpi", 6))
 		disable_srat();
+	if (!strncmp(opt, "nohmat", 6))
+		disable_hmat();
 	return 0;
 }
 early_param("numa", numa_setup);
diff --git a/drivers/acpi/numa/hmat.c b/drivers/acpi/numa/hmat.c
index 2c32cfb72370..a12e36a12618 100644
--- a/drivers/acpi/numa/hmat.c
+++ b/drivers/acpi/numa/hmat.c
@@ -26,6 +26,12 @@
 #include <linux/sysfs.h>
 
 static u8 hmat_revision;
+static int hmat_disable __initdata;
+
+void __init disable_hmat(void)
+{
+	hmat_disable = 1;
+}
 
 static LIST_HEAD(targets);
 static LIST_HEAD(initiators);
@@ -814,7 +820,7 @@ static __init int hmat_init(void)
 	enum acpi_hmat_type i;
 	acpi_status status;
 
-	if (srat_disabled())
+	if (srat_disabled() || hmat_disable)
 		return 0;
 
 	status = acpi_get_table(ACPI_SIG_SRAT, 0, &tbl);
diff --git a/include/acpi/acpi_numa.h b/include/acpi/acpi_numa.h
index 8784183b2204..0e9302285f14 100644
--- a/include/acpi/acpi_numa.h
+++ b/include/acpi/acpi_numa.h
@@ -27,4 +27,12 @@ static inline void disable_srat(void)
 {
 }
 #endif				/* CONFIG_ACPI_NUMA */
+
+#ifdef CONFIG_ACPI_HMAT
+extern void disable_hmat(void);
+#else				/* CONFIG_ACPI_HMAT */
+static inline void disable_hmat(void)
+{
+}
+#endif				/* CONFIG_ACPI_HMAT */
 #endif				/* __ACP_NUMA_H */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
