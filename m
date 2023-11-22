Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CED77F54A2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526B110E6B3;
	Wed, 22 Nov 2023 23:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013010.outbound.protection.outlook.com [52.101.64.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2742610E031
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGk3QPY94D/adLvcML7teVcEPttH5dSVwCHmhKHBglIgscYVvxHRd8nTfMVM/JEotCX8sVnfuWtSlsv91kxBeYpWBtKMl+LiJl8x0CwptesRZtH2cqjcMRpPSU8jei0VwcOS8OsuzqUgofUxXUbpj+WMBjhaq1vEWP0mGZ8vbXNap3yE0IDDf6NfSGrmCgJEaDpTJc2r1WTgVA1sV2PZMi4IpT0h2HNulgn0THseYzy4HQSlnTuH337Tuy5H9HckFeHIq4a5Kf86eF9D/RnZMlGqHLfNpoQQuhu/gN11s1oJYl1jeGVJbPcnXOwLTPKfbE3/kjkbiJWglJbUNsIf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQOF4vl58JYmp9N8tajjHVKmG0zId2Y/E+sOOYf8I8A=;
 b=hINSEKFcZsTDE6GV7oKu1/FqUnHD3zTOECm7pmO0bGayBDwMehTdhrPCP4m1n6BA6rROqccBX7fCY52WnfKFtEu7v/ik8bz10OG4g3EJj5i5GZzsIYi0zP3gT7WHsW/w3w2dRrEVZJdZXgOeh25C3SgsVS2DnLadZQMXjyKUrfnx47VEYKrtyRs6c/T7UdhKr5PL5XpaaK1dRmfZk07lNlrXiPAGV3frMBxO4kGVsqic321/2XrIq00jci2ibKRrns0rX+Aq2/H4YT508A3giUCg6mq+H/eEo1E/n7Z2ZzujH1G2B+G8bLQGflJLJtWtNOHtdocENNjK0zdqgP+LNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQOF4vl58JYmp9N8tajjHVKmG0zId2Y/E+sOOYf8I8A=;
 b=kKI4Zh/v1C3IsnuZBjZGxFjoum4FWZR/pLpgEaSSXBf9adkCKc/gNUYIM4hn+vn0AoczrBKTYsMf5+gVmSrVZQ2d6XAOnEvQS7eEVYuq0Oh49psxYU9YdzyB0Upd+qa0gNcFc2+KlbqBplxBLUAskGehcj8t7cETSwvF3ULHSL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:16 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:16 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 1/6] x86/vmware: Move common macros to vmware.h
Date: Wed, 22 Nov 2023 15:30:46 -0800
Message-Id: <20231122233058.185601-2-amakhalov@vmware.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4e406b35-b32b-4780-a590-08dbebb31f39
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +l6kpTPXJ9fMakQ3Wnh45SRuRLoZaV5f/Nzq1kR0Q9ynd7xNRa/o8qDvX1ohXE4tC/9SKY6EOY5M6L7AXZa+RJcAgsti/TPwzRuLL2ajeQ0CO5bq4I3kumXwe6PP4qI33lGZbTrMYclRNZ/28ZjH7fN1Pqlx2na/73dGt9NJx2j3gO+3NVsRlruhdsct10qRwXdABm7jieDccVIziPn0XZD0lpXQO+OVdfoHFpw5m0vI/K4cwgnJTgTF0/fi8rEEDan4ebOxx7r7pFyoVh1Nh6M72bPHKuYEolBV6jJ/vbmoyRApVzal+v1a06vcKiNe7oLpqzW0ns0U7OB1KIT3luZJb5So2/NTR/qf4tJqXFLWEKfeXZL1PqAGADc3r7n+sfepClWdpfkBBcEjRMCDeS3b1cbJdN3nEVvp2Po3Hvu34B7i3b7TfeTZbbKyc26Gw80CRFBGIsV95uKBZmU498yj9o6hZDPXVMFUAfqnbyzvBOStRKJ6Hb/7iLfg0mwgTxL1XL7lUsSuz5VQHZZkn3JK5/PDSsUdiX15p3Z9tWBJlnUsLFhMPx1SlZUldaB9xOBppY1SkP2YqE7aB9WzD9tvkguStktNBAv5LHrHwFNjDsiPEG4AhWg/urCyekqaxxZmzYo2kD/kngu3oGQKJm54FuTnz/o1ZK/iKI4Xgy5Cw6Y0QTXo3RLTdpkxBkn1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(83380400001)(38350700005)(6666004)(2906002)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bwMmQmJrVZWcRn0JNQP4xYNVBlktE1tC9KfExlYx3h/8iM56cLeOJ6dG8TFm?=
 =?us-ascii?Q?CeHwQ2YpASHr3W/RmrVv6vYEu3KLOgZvW7VNUAk7x1kjSEXUZzhy6zP/KxAs?=
 =?us-ascii?Q?HeyAw3/g4t4Dv487ut1/3hi5ESFWRg1TyBXHdnlM1dLoq9u4tPpMCnRzbOKe?=
 =?us-ascii?Q?dtXcRis5Mp7nPyyCF3N63ST0yeRBGoZ7riTSgjMICzbhsTq/+x3e9NyZl4oC?=
 =?us-ascii?Q?Xak/PpU/9bkJ1qhCZrYCk38CMRERNFEwXZNMnci1+vk8G3Vo+VcH69yFgMLa?=
 =?us-ascii?Q?CLsTc+dRmBPN+DjrXCfod5vcHAWGGvyJLXxMe+l2b9OULxFmT7t4FPn14jIa?=
 =?us-ascii?Q?DXoOqGYH2WYRjNZSKCSr94LCGlR57Q6gILHLh8K8j/jdFwm/0pas1qwJO8ep?=
 =?us-ascii?Q?IAwMrDghKX4ie4Jiqb1hhKZjkQHKd/ggafzIcBIIMkKcu+y4j1gY6n9dAm56?=
 =?us-ascii?Q?n/DTFHsCi53T7pCwzeJZ5D/f7CUhmUwnKpmUspaUmUQWtVifG8R6sHpkGLVQ?=
 =?us-ascii?Q?gHNVismg9fwy+BwVJz7zgtM9yi+pdgG0KqDWx5CSnCU2sRaDEdg5W+G9g9V2?=
 =?us-ascii?Q?Vr9wu6Wpp3fSWLhXFYvA/SOS25m2QWqy1p8ZkODgj9KscalfEaY5MgPZT60t?=
 =?us-ascii?Q?PSu7SA3z9IFXNQRA/l6iga5BZIE3GbvJWXw/dFu3mgJtwfAWLMeYDndFvj3a?=
 =?us-ascii?Q?ti79Z8t+M1lAhs6iRzUz8s3kBO3MQGp6A/CTEaF+BoxpCYqT+2pi9a37x0BB?=
 =?us-ascii?Q?sBuaJf3vZEA+0ErcAqaKoMSDL57Q8PATHFXGgQmz5EYXm1U3J2DcjoV79qT0?=
 =?us-ascii?Q?zrDh6Abnfwim9tJCTZ1u1y5WS+eItSStkB/frRO7WB9ZXLhGrsKY6OrDfnkD?=
 =?us-ascii?Q?Z+NDARAQ6aorqfe7zIQ7LlyO83asrEhunwr37PguTnmdR7/5et2UAULKv3Rr?=
 =?us-ascii?Q?QAKDDGblUyKDh8IgIelRuswq5EfQSUxe9JeKkbmSe7jEl+dTIAKV9+HrvkjV?=
 =?us-ascii?Q?z93HrPymPrRBWwgrWG/tJerYrRSwBnNVaKvMqlYoj2XLYjfMqnij2H+r0qpH?=
 =?us-ascii?Q?ijg5ALw4FniN5vavLnc8f5RSp8px22iLNT8JnwTP47bE7bB9OMS7g2CB+sme?=
 =?us-ascii?Q?0UXXLBVz53C2/JgQ+lvCjIkPhgJa/3I26EUN78qGKDPW5wZqFiM34gZgOCvb?=
 =?us-ascii?Q?dzowCsLfFZAlFfT4LT40h69F7+PsKI7lo6OFYvmbf7F+1PyT//tiLgq/VN6M?=
 =?us-ascii?Q?/LQ1y8waBvZJuFTQJWYljdTUvgXR19FwGEaoPQ4kgeofU2OnHboxcK+Dw8Y4?=
 =?us-ascii?Q?GxTu/0Y+3mdYhjGXYxM5w3BzJirAZjwnoqL00PN3qoZ++VH73JjEEjctiI/8?=
 =?us-ascii?Q?PrxrDdK/cKwU2tDkzECDiEo233sFr4muEG3etvKpDdclBqWlY5h3wneoZZ6O?=
 =?us-ascii?Q?DNbdzpFYZTcv//luxbvXtUNJWozz7JSn+jMQZ1q+cBsNGZ46k1QkIShSY2qK?=
 =?us-ascii?Q?GKnBzr81ZwsSWk69MqX8ZB5pCfli9qUZAtk/6Pbbfn6J/qhajpg+9nEUt7rc?=
 =?us-ascii?Q?/QyruwOGlyXdxC4TcAUG2EDiM9/CBcTw+bKK2S6W?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e406b35-b32b-4780-a590-08dbebb31f39
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:16.1937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tofoRFKvLr3H99sxO5oj5jI6u8OZz7woGSyz6rUPSWTwjKM3BiIAlGWZdjUoMJpJ1Kr2pzILAXF0OvVQUQtWjA==
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

