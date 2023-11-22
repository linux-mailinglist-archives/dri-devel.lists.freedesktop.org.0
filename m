Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E97F54AA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B73710E6B6;
	Wed, 22 Nov 2023 23:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013010.outbound.protection.outlook.com [52.101.64.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D2310E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLLoxFUk8Bz9vogryFjundOvfgaEguTlfX1C+e2PlWaJpVOM5VzWp2UzG82PORCL/9VZr+y+w0Ba7i4j6/6trkOW/Urrt2/0zr4XF2VRhxIrNrkpuYVcyFqkV7/BbyfBiqsDLvDYwo38xOjfcp/HXY668SvkLgbgzpu95IlcwsbK9qSM+ak4OMQ+8t8KpaJ+IS0cJjJ3tlgdSe5NkFkYj4Cp1q8JjxSTJ4Vo1LSPAehAoSTUPGozjeo0bQ4kCa54gyOeHZXDZZN2/BLEkQo/j8v5SLdm/Nn0PkaNmFnR9ECF18BqqD+1tP684Acy6uEWX8N7LattqUPiCPcOPprgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQOF4vl58JYmp9N8tajjHVKmG0zId2Y/E+sOOYf8I8A=;
 b=Oz8wrYb3IapvDcclWiWXxso4+qcj9vh06FaUy2co6rt2zoapev1E1BANUimSu/RGImuAatbD7bnJ0V14oAo029rZbmHLvsagWnovCUzFlmKRKOwM6jPB/hY5t0yqJyvJG3WSC5yt+yp2TffyzOsY63GAa2vX47Qr4ISxrKcx+3RVKbU8q+q+tgK3CxlFpNr6un9LMv6JOaFT82WAjDe4Tb4Yg7ajiVukbBH39ODcGcbIWRqdDJtb42DeQzWaYskJZu8QrcdWYFXfNzC90E77uVEOQUsUELFlAdYJu6t8nixK+/tBYnCjDNXkPu0gZCz+cbyfrh4LPtx2U+JNZ+LFhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQOF4vl58JYmp9N8tajjHVKmG0zId2Y/E+sOOYf8I8A=;
 b=XiMIDW7geV1I3hLV37wn4pjAKneOTDSmA4oFqiHaYaKdkGuYIgbJf7NldJvmUAaY1wQ98AUwgAOpZ8s1dOpIREOW/OzuM0fAwOr46ukVtxF2eoq5lxzmeHs0dpqEN3WNAcO4ToL90M5C/SQLSW4E7Ra1Wrap2/MEqOa/t8wKyxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:24 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:24 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 1/6] x86/vmware: Move common macros to vmware.h
Date: Wed, 22 Nov 2023 15:30:53 -0800
Message-Id: <20231122233058.185601-9-amakhalov@vmware.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122233058.185601-1-amakhalov@vmware.com>
References: <20231122233058.185601-1-amakhalov@vmware.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To MWHPR05MB3648.namprd05.prod.outlook.com
 (2603:10b6:301:45::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR05MB3648:EE_|BY3PR05MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 77908538-e7b9-41ca-bc27-08dbebb323e1
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dzSgzKYxOdFv4T1a7JziApLZ7MqvfqyqxUB7T2rtwl9Vo4Ou10vwK8kWQAohMcgWjCLOcuirE2sWz5Pp+jyyMXWh+biFXqri5bDSsPz+XM0uvB04A3KmgewAc50YQxfdGO5GQP+64EHp8RzamlLGJhrUZnbxdkcoYWeVKED8KbYZgkYmE9Qk7LVs+0teie/9rTNHlbeq8E2J/V/IM1dJVIxQgCN39Y12dtdxDcz+CgBR1hl9wjfG0WxJa8NB/F1wS2l1Abfug8vGQSWJkt/vGxPtsGOTm+OoYcrF3hbVkKFbenfT45+F44OasYf36NDhjVu9+6Hd8e/l5wUJhlcIVOK1KTUswozryxAIzqn2BK637gg9oXgazj12T8dDIKzWJlaBeM1xIhOlqlBxkoZ6V62R10rievIJyldI8+NMJbS3j3MSrTgSBg1t5biT4dCcq0FAP778SjJDoKn58ftI3Gd831tvO6zGVhk7lmOoiHOOhH4ntbQngDyW0UUqfQse330pPW8Qa3X7T0EQK4LQ2IKyD+B64+0K1gPutfWsSlyicpIikuuqk9JjNR6AnCiSVLcgIU/qFaS/WCtZOxoNXm+RF46F/cHGI+IVYLxQL6jfCEBqNCxWmC2KrjKt0xf41dnal2WFDdpjO2sGb23ElaeHtf4lNQV8TNOEEfCN87V+/1qrkDLX2KdFBcmmJ5Vd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(83380400001)(38350700005)(6666004)(2906002)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kzk5tdDkNOXMDS2RnMHxgnxPTlg1Yo81SJhmErD6LhX5ooaoikhmU04d7WCW?=
 =?us-ascii?Q?nfVUUA8E30uQY8Nxt9uUagNx1FRpecR8YB2bWqUypNUy4HHSFKqVUDx370Lj?=
 =?us-ascii?Q?HmYEkWgrGvwZiixqPhjp5hLVlcHWMoNI5b4qjOgEePM1mgTdx4c2yfWRehuf?=
 =?us-ascii?Q?BkbEMuCJUdPpZBeTF2WW5Zc1K4xixQ0YHVfEItWOmmNWh4waujD98QkFrU5I?=
 =?us-ascii?Q?N3VEGCw2Zc+UyR64QpSNV+j69gZE586q+ZPBUdiTEj3eYB17WR6FpNw+rXOj?=
 =?us-ascii?Q?exiixdFAJ1R2+lSfd7SeWNyKOTx4bGrqE/foFbgqw+rYa63N7SE7HYAAb6Qy?=
 =?us-ascii?Q?NsY9uvzaOLiF0mvLfc5j4s5VKzVr2qSVz2J8zC1N2+Jo5L1+NkWMsBtWeE7E?=
 =?us-ascii?Q?eaVDWnt0qd3/ukTFDl81uVib7AdgMG5zbemgKh9G3Ge8xUww4F7mh9DeLRCk?=
 =?us-ascii?Q?lh67B0TTEBN49rSPDOZ7EBRdEaSP+44wbqHyxhgKX6tPS/qk4TTy1OQXei7j?=
 =?us-ascii?Q?bzIqZAVc0ZwPWTtSv64urjAGgnWH0ZKuKdCHwO8EjIKMFQs3zzq6Cn6fi/4V?=
 =?us-ascii?Q?k8Qd7sxS5l6xIthJUZzFZIJ/WrCLdaC+kuHwCqyZ3bWEYaU5b2zi1INFRrzC?=
 =?us-ascii?Q?hi66sfbtbtJ/aC+JTzsKOlcYSUN6T6E+p4vy2BYdRyAmnwnRro313Yu4A0kQ?=
 =?us-ascii?Q?AeH2RGLQlestEJs6jLk8UgWJgjo1asOK1dipGFbRKWhNFm2n/sPd2gTsdWLa?=
 =?us-ascii?Q?gKH8Jp39wf0QdTQUjCcg4LmtKhSMaHqoOHJJ8QehoTqQaWD1baQfnE1YiW4i?=
 =?us-ascii?Q?QFre4oNVI6mHDKht/MI253/PSQkU56N+TJdi2xg2pPewmzLwjlMhoZI3jHW7?=
 =?us-ascii?Q?GSZ9pQ5m8PrpaX1qiGWUhJMpSfcjX9cNK8+CxjewZ/0saE8DQq6dFiW0jVEO?=
 =?us-ascii?Q?oFayvB8duO5Q9cQsXFJQwQdwnpktJ8vTedcNWQQ83ke8/yy4bHYz6rdJ8eh7?=
 =?us-ascii?Q?iTA5ivFZoT4HYlSWB4bOFWaHuhJTWF6QL7raihdm9w7wKqnv73bkYNsYOLt5?=
 =?us-ascii?Q?xel1viZ1v21RxeTy45VFeky1IFJV6Ph4bg/1zDPm6+GV9CRJEmvQpWYDSTVx?=
 =?us-ascii?Q?qxbcngnCrOVV++ADDJ+rWVyIV/DTA7LZX0aHx2Xsdpi09qsASl/1AtBqJMIG?=
 =?us-ascii?Q?gq0ErSLHpLofP8gS98B4Wroa5lslYVCo1Ql0lWxLJyNzzAOeDQpoSEkCrR73?=
 =?us-ascii?Q?D/T7bWfzGuesHrJFC5ij/GXO2n4EkGnsGwLFeT9yOhqYKQDIO1B7Yl2e8/ge?=
 =?us-ascii?Q?JrswkhE4b6HBlnkVi9cGea6Bybcds/JPkaKbUzSPumgnirhlH10HQ4x2yBfT?=
 =?us-ascii?Q?vE9PfpzYrs8WDTawfWSjIa8XU1Wp9jrT8ctxKIBSSPij0RQ3iN98K+N4rJWh?=
 =?us-ascii?Q?qvFMRU6Ns3rzRG6QcHjV9bZiJ0vjHolhlXS/vNL2KJulAuZiJ0/1XoXdB8rn?=
 =?us-ascii?Q?2w8hyesTlkl9S4MOcf/PDaNE8mBwzyUrN3J006yvFe4V7yHjrHKx5fEJsS+H?=
 =?us-ascii?Q?/PxLLrKAecxRQo3qCjsP1+//HZUymCcf9Q5WWxe/?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77908538-e7b9-41ca-bc27-08dbebb323e1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:24.0467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuVI+V4o+EYHRvfXj2OXGdr9ejQMIB/9tg37Jdq2gexJ3TvT1ynGumtNUWzwEUTEYe9n1qZ8T7ePA+W5MYwkjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR05MB8275
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
Cc: Alexey Makhalov <amakhalov@vmware.com>, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, dmitry.torokhov@gmail.com,
 akaher@vmware.com, linux-graphics-maintainer@vmware.com, jsipek@vmware.com,
 linux-input@vger.kernel.org, namit@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move VMware hypercall macros to vmware.h as a preparation step
for the next commit. No functional changes besides exporting
vmware_hypercall_mode symbol.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
---
 arch/x86/include/asm/vmware.h | 69 ++++++++++++++++++++++++++++++-----
 arch/x86/kernel/cpu/vmware.c  | 57 +++--------------------------
 2 files changed, 66 insertions(+), 60 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index ac9fc51e2b18..8cabf4a577bf 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -8,25 +8,37 @@
 
 /*
  * The hypercall definitions differ in the low word of the %edx argument
- * in the following way: the old port base interface uses the port
- * number to distinguish between high- and low bandwidth versions.
+ * in the following way: the old I/O port based interface uses the port
+ * number to distinguish between high- and low bandwidth versions, and
+ * uses IN/OUT instructions to define transfer direction.
  *
  * The new vmcall interface instead uses a set of flags to select
  * bandwidth mode and transfer direction. The flags should be loaded
  * into %dx by any user and are automatically replaced by the port
- * number if the VMWARE_HYPERVISOR_PORT method is used.
+ * number if the I/O port method is used.
  *
  * In short, new driver code should strictly use the new definition of
  * %dx content.
  */
 
-/* Old port-based version */
-#define VMWARE_HYPERVISOR_PORT    0x5658
-#define VMWARE_HYPERVISOR_PORT_HB 0x5659
+#define VMWARE_HYPERVISOR_HB		BIT(0)
+#define VMWARE_HYPERVISOR_OUT		BIT(1)
 
-/* Current vmcall / vmmcall version */
-#define VMWARE_HYPERVISOR_HB   BIT(0)
-#define VMWARE_HYPERVISOR_OUT  BIT(1)
+#define VMWARE_HYPERVISOR_PORT		0x5658
+#define VMWARE_HYPERVISOR_PORT_HB	(VMWARE_HYPERVISOR_PORT | \
+					 VMWARE_HYPERVISOR_HB)
+
+#define VMWARE_HYPERVISOR_MAGIC		0x564D5868U
+
+#define VMWARE_CMD_GETVERSION		10
+#define VMWARE_CMD_GETHZ		45
+#define VMWARE_CMD_GETVCPU_INFO		68
+#define VMWARE_CMD_STEALCLOCK		91
+
+#define CPUID_VMWARE_FEATURES_ECX_VMMCALL	BIT(0)
+#define CPUID_VMWARE_FEATURES_ECX_VMCALL	BIT(1)
+
+extern u8 vmware_hypercall_mode;
 
 /* The low bandwidth call. The low word of edx is presumed clear. */
 #define VMWARE_HYPERCALL						\
@@ -54,4 +66,43 @@
 		      "rep insb",					\
 		      "vmcall", X86_FEATURE_VMCALL,			\
 		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
+
+#define VMWARE_PORT(cmd, eax, ebx, ecx, edx)				\
+	__asm__("inl (%%dx), %%eax" :					\
+		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
+		"a"(VMWARE_HYPERVISOR_MAGIC),				\
+		"c"(VMWARE_CMD_##cmd),					\
+		"d"(VMWARE_HYPERVISOR_PORT), "b"(UINT_MAX) :		\
+		"memory")
+
+#define VMWARE_VMCALL(cmd, eax, ebx, ecx, edx)				\
+	__asm__("vmcall" :						\
+		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
+		"a"(VMWARE_HYPERVISOR_MAGIC),				\
+		"c"(VMWARE_CMD_##cmd),					\
+		"d"(0), "b"(UINT_MAX) :					\
+		"memory")
+
+#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)				\
+	__asm__("vmmcall" :						\
+		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
+		"a"(VMWARE_HYPERVISOR_MAGIC),				\
+		"c"(VMWARE_CMD_##cmd),					\
+		"d"(0), "b"(UINT_MAX) :					\
+		"memory")
+
+#define VMWARE_CMD(cmd, eax, ebx, ecx, edx) do {		\
+	switch (vmware_hypercall_mode) {			\
+	case CPUID_VMWARE_FEATURES_ECX_VMCALL:			\
+		VMWARE_VMCALL(cmd, eax, ebx, ecx, edx);		\
+		break;						\
+	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:			\
+		VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx);	\
+		break;						\
+	default:						\
+		VMWARE_PORT(cmd, eax, ebx, ecx, edx);		\
+		break;						\
+	}							\
+	} while (0)
+
 #endif
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 11f83d07925e..4db8e1daa4a1 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -41,60 +41,14 @@
 
 #define CPUID_VMWARE_INFO_LEAF               0x40000000
 #define CPUID_VMWARE_FEATURES_LEAF           0x40000010
-#define CPUID_VMWARE_FEATURES_ECX_VMMCALL    BIT(0)
-#define CPUID_VMWARE_FEATURES_ECX_VMCALL     BIT(1)
 
-#define VMWARE_HYPERVISOR_MAGIC	0x564D5868
-
-#define VMWARE_CMD_GETVERSION    10
-#define VMWARE_CMD_GETHZ         45
-#define VMWARE_CMD_GETVCPU_INFO  68
-#define VMWARE_CMD_LEGACY_X2APIC  3
-#define VMWARE_CMD_VCPU_RESERVED 31
-#define VMWARE_CMD_STEALCLOCK    91
+#define VCPU_LEGACY_X2APIC	3
+#define VCPU_RESERVED		31
 
 #define STEALCLOCK_NOT_AVAILABLE (-1)
 #define STEALCLOCK_DISABLED        0
 #define STEALCLOCK_ENABLED         1
 
-#define VMWARE_PORT(cmd, eax, ebx, ecx, edx)				\
-	__asm__("inl (%%dx), %%eax" :					\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(VMWARE_HYPERVISOR_PORT), "b"(UINT_MAX) :		\
-		"memory")
-
-#define VMWARE_VMCALL(cmd, eax, ebx, ecx, edx)				\
-	__asm__("vmcall" :						\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(0), "b"(UINT_MAX) :					\
-		"memory")
-
-#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)                         \
-	__asm__("vmmcall" :						\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(0), "b"(UINT_MAX) :					\
-		"memory")
-
-#define VMWARE_CMD(cmd, eax, ebx, ecx, edx) do {		\
-	switch (vmware_hypercall_mode) {			\
-	case CPUID_VMWARE_FEATURES_ECX_VMCALL:			\
-		VMWARE_VMCALL(cmd, eax, ebx, ecx, edx);		\
-		break;						\
-	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:			\
-		VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx);	\
-		break;						\
-	default:						\
-		VMWARE_PORT(cmd, eax, ebx, ecx, edx);		\
-		break;						\
-	}							\
-	} while (0)
-
 struct vmware_steal_time {
 	union {
 		uint64_t clock;	/* stolen time counter in units of vtsc */
@@ -108,7 +62,8 @@ struct vmware_steal_time {
 };
 
 static unsigned long vmware_tsc_khz __ro_after_init;
-static u8 vmware_hypercall_mode     __ro_after_init;
+u8 vmware_hypercall_mode __ro_after_init;
+EXPORT_SYMBOL_GPL(vmware_hypercall_mode);
 
 static inline int __vmware_platform(void)
 {
@@ -476,8 +431,8 @@ static bool __init vmware_legacy_x2apic_available(void)
 {
 	uint32_t eax, ebx, ecx, edx;
 	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
-	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
-		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
+	return !(eax & BIT(VCPU_RESERVED)) &&
+		(eax & BIT(VCPU_LEGACY_X2APIC));
 }
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
-- 
2.39.0

