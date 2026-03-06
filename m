Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDcVLEhsqmkPRQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:55:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4764B21BD9D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 06:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7583D10E35D;
	Fri,  6 Mar 2026 05:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QwyOAtzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010016.outbound.protection.outlook.com [52.101.201.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EE610E169
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 05:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7eIt8Jd4sxqbxux7SLzXqC8ayzlbErCL9a55f+A4yX0r+kxPXyhqb/Uu+WWXkGJyw1mLTVpIIkCU82OwLKaDbVL64JBWLfsFrSxN01s085QzgxWmapPXEF0rGM9s+ObQqtsZyJM8WOajkj80IIVT4VE1s8Pl8qY1rKzoQ4XixYZCfpJPv9OR218YWkzF1VnMIxMOobJFg+ExH8l80lGb1kpMTz9eZbGdn0fneg7jpNKJyxGHW2Xd3aLjv+t6NTT1yWv/rRgCmMx3ni4TiWI5L2d+d3akmry/OkXzxD5AZvM0b7yBWBKXXdz/LJ2rWvAL0w5eEn0hyB8BWxOqJT/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOvyvw9rogD3SMDT6Rw0UFWuxi4rlte0uWRb9FAsDao=;
 b=Q6ERySs/ekcr0zueAwMCLDnKhV/GsmHsBsgXySlu96C3maxmR9OoXafSTdFuoyJP3OnVUDcahm2Ptv0/EWplYzAymwEVToWqkAuQdGSQ2CNLYqwIUGh6N4TD92GhB528DI19hdKcDFA7j4GmZxLdv3wT464M8PViNX6D+bPwpqckHbj9BkMlrc0ZFpcg68XezWOlVAaqBk+q1r92O5sbtSx3EvOi6kWI1Ub9wpwvmB/hgrvZhx5gZU/1l1yA/wF+1t/5+hUGCB1l2VdOay+clyBpLFDDRb2Xf0PZ2sUzG1j72cKgGO1k7yZh/mbWjjH1mMGqrJCHlc2IOG6g4oIZpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOvyvw9rogD3SMDT6Rw0UFWuxi4rlte0uWRb9FAsDao=;
 b=QwyOAtzkle9MD72gpvlIjUM/bYulIOnQNuflKPZ82TXffJEWFMp5v49Cns/4aPLu2OnWLIhjPVUGNMjYK64i7uRL4huempH1bw09on1VwIV7NX2ObJRLqIC2OXiOJL50GtK5QFcH4Y5Uyco2d4VLzkW2l3bDm6J9WOKmBpDFzZg=
Received: from BYAPR03CA0026.namprd03.prod.outlook.com (2603:10b6:a02:a8::39)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 05:55:10 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a02:a8:cafe::41) by BYAPR03CA0026.outlook.office365.com
 (2603:10b6:a02:a8::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 05:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Fri, 6 Mar 2026 05:55:10 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 5 Mar 2026 23:55:08 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [RFC PATCH 1/2] drm/ttm: Add EFI variable support for page limit
 configuration
Date: Thu, 5 Mar 2026 23:54:38 -0600
Message-ID: <20260306055439.1822879-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306055439.1822879-1-mario.limonciello@amd.com>
References: <20260306055439.1822879-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|SA0PR12MB4381:EE_
X-MS-Office365-Filtering-Correlation-Id: 656be0b9-6fac-40cb-5d7b-08de7b44ed6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: FS7ifFXDOE7JSGPwZYzf48BFON91NjAIPORQe+aK3FxsUl9siZdXJxqkt9VSQSkApgc5DrRT6HsxdVEOG5mkc7CBCHfxQtRk0AG5TsMUxx1g4tdhPz+rkDvbAEO6DMZAkWttQhnrt2Av5oz2nLTzWF0zPY3f1TYBw3J9m0S6zopvRxG2ETu99rqsxL/38QlO52TgAV9N3UbWXzKH1ZVPDW978JmXciQ87dSSVKMVVVVMIAiPD2LhJwb/SqSnI/L08XLPX05TBFvJAwMFfEwkHaEGbYxoxnfIy7S3h9yIprSgYfk/Du81FQH1vw8gRZMxSuJ5yDumFWuSCUBDWIyNNtaglXPy0qTqKyYmozvtNO02+307OALEokexKYcJq2I/K76zedFEDyF7xKs8AEZpOW18X5nNtXSWlZ4lkmWod5g62OWdZpbQA9Jx2t25Ug45zh23TD20jllcPvaEfRcw0rKckV9RbOhh9yq5637W6WlAytuo2KaUAsU44gOO9/wee6Z6aEnOixaKqQjI/XF9gTdo6rHisH9I7oPKgtwPCIwj23pmCnsywNwCdsZuo9iMEQ7VzYck7nuhuj7RUMA7RIf7jDSHg/ans2Pz+ERjnYkBb0HLc9zhnWes+fF7+9S0iptJuhWPkJdxBcTNXqNMKgSD1G13a/Sq+uTMUejdph/J5Fuas537wX8+yEV0XEXnQJm6HQidEGlLRnC3epSfMM/o7NXI7g6brAJw8geSxGhtcq4LFgYQ8x6rDV9w7yqLrAhZ9DH93MiVnfnrkVJTyA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tcci+jvCIEEIj7MnavqcIOMT8Fwh02/F1q6ao3pJ8s+72UyFomoq7Ht0+3Mr3lq0a4kq/38kdP6m8i6p43QBIwZGV+sN9mrImjN3ZScDUlAWnfIdysODEpT74L+IBjfu+U1r/VbnmvLWNFh4nxk5C0e17gvnkLQUvM2S9AG3qr2hMvsI9gxDPhppqlT7z4BPT17h5TXgKRzIzvG5+QeL6aeleViCmnPijTKU+940MVP81VyuDJYlftWVfXzStU4Og8/XOcycQkE3EwUI5i65uDTG0OQyb1IQ1a/nis6pLqOMszpqSa2WerNH9hZ1qkL/ZIz0hsSTgq5rGELA7M0ozp8oAlnT7fTiZNZfy+QsVc9DcDLTi38NVxDmTg2GeYbY+lcKbOGQGTpcqEvLI05anN46IouKEsy6GC/DsKEl4nZrzN3u+ZCTD/fi3u8U2bXG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 05:55:10.2958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 656be0b9-6fac-40cb-5d7b-08de7b44ed6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381
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
X-Rspamd-Queue-Id: 4764B21BD9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add support for reading the TTM page limit from an EFI variable,
allowing BIOS firmware or users to set persistent memory limits
via EFI. This enables platform-specific GPU memory constraints
without kernel command line or module parameter modifications.

The EFI variable TTMPageLimit (GUID 8be4df61-93ca-11ec-b909...)
is checked during initialization with the following priority:
  1. Module parameter (ttm.pages_limit)
  2. EFI variable (TTMPageLimit)
  3. Auto-calculated default (50% of system RAM)

If the EFI variable is not found or contains invalid data, the
system gracefully falls back to auto-calculation.

Assisted-by: Claude Opus 4.6
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 95 +++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index b645a18181843..a5641588c4f22 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -49,6 +49,11 @@
 #include "ttm_module.h"
 #include "ttm_pool_internal.h"
 
+#include <linux/sizes.h>
+#ifdef CONFIG_EFI
+#include <linux/efi.h>
+#endif
+
 static unsigned long ttm_pages_limit;
 
 MODULE_PARM_DESC(pages_limit, "Limit for the allocated pages");
@@ -464,6 +469,79 @@ DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
 
 #endif
 
+#ifdef CONFIG_EFI
+/*
+ * EFI variable GUID for TTM page limit configuration
+ * GUID: 8be4df61-93ca-11ec-b909-0800200c9a66
+ */
+static const efi_guid_t TTM_EFI_GUID =
+	EFI_GUID(0x8be4df61, 0x93ca, 0x11ec, 0xb9, 0x09, 0x08, 0x00, 0x20, 0x0c, 0x9a, 0x66);
+
+/*
+ * ttm_read_efi_pages_limit - Read TTM page limit from EFI variable
+ *
+ * Attempts to read the TTMPageLimit EFI variable to get a platform-specific
+ * page limit configuration. This allows BIOS firmware or users
+ * to set persistent GPU memory limits without kernel command line modification.
+ *
+ * Returns: Page count on success, 0 on any error (triggers auto-calculation)
+ */
+static unsigned long ttm_read_efi_pages_limit(void)
+{
+	efi_char16_t efi_name[] = L"TTMPageLimit";
+	unsigned long size = sizeof(u64);
+	struct sysinfo si;
+	efi_status_t status;
+	u64 page_limit;
+
+	if (!efi_enabled(EFI_BOOT))
+		return 0;
+
+	if (efivar_lock())
+		return 0;
+
+	status = efivar_get_variable(efi_name, (efi_guid_t *)&TTM_EFI_GUID,
+				     NULL, &size, &page_limit);
+	efivar_unlock();
+
+	if (status == EFI_NOT_FOUND) {
+		pr_debug("TTMPageLimit EFI variable not found\n");
+		return 0;
+	}
+
+	if (status != EFI_SUCCESS) {
+		pr_debug("Failed to read TTMPageLimit EFI variable: %d\n",
+			 efi_status_to_err(status));
+		return 0;
+	}
+
+	if (size != sizeof(u64)) {
+		pr_warn("Invalid TTMPageLimit size: %lu bytes (expected %zu)\n",
+			size, sizeof(u64));
+		return 0;
+	}
+
+	page_limit = le64_to_cpu(page_limit);
+
+	if (page_limit == 0)
+		return 0;
+
+	si_meminfo(&si);
+	if (page_limit > si.totalram) {
+		pr_warn("TTMPageLimit (%llu pages) exceeds system RAM (%lu pages), capping to system RAM\n",
+			page_limit, si.totalram);
+		page_limit = si.totalram;
+	}
+
+	pr_info("Using TTMPageLimit from EFI: %llu pages\n", page_limit);
+	return (unsigned long)page_limit;
+}
+#else
+static unsigned long ttm_read_efi_pages_limit(void)
+{
+	return 0;
+}
+#endif /* CONFIG_EFI */
 
 /*
  * ttm_tt_mgr_init - register with the MM shrinker
@@ -472,13 +550,26 @@ DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
  */
 void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
 {
+	unsigned long efi_limit;
+
 #ifdef CONFIG_DEBUG_FS
 	debugfs_create_file("tt_shrink", 0400, ttm_debugfs_root, NULL,
 			    &ttm_tt_debugfs_shrink_fops);
 #endif
 
-	if (!ttm_pages_limit)
-		ttm_pages_limit = num_pages;
+	/*
+	 * Priority chain for pages_limit:
+	 * 1. Module parameter (ttm.pages_limit) - highest priority
+	 * 2. EFI variable (TTMPageLimit) - middle priority
+	 * 3. Auto-calculation (50% of system RAM) - fallback
+	 */
+	if (!ttm_pages_limit) {
+		efi_limit = ttm_read_efi_pages_limit();
+		if (efi_limit > 0)
+			ttm_pages_limit = efi_limit;
+		else
+			ttm_pages_limit = num_pages;
+	}
 
 	if (!ttm_dma32_pages_limit)
 		ttm_dma32_pages_limit = num_dma32_pages;
-- 
2.53.0

