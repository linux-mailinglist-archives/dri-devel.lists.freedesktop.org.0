Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE0F8017B7
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AF510E987;
	Fri,  1 Dec 2023 23:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11011013.outbound.protection.outlook.com [52.101.47.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B1210E98B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 23:25:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+vRhlaBFLqe9flKDM3ZXQqTFLsA0kCBoiG3wg1xXyEG2jUyTh5aReHaXQFDrpzPLVy82NjsItlm1NZUDKIysrl7LtM6qXQMgeL26YmDzVwT8hiTY2zNOfz9LakVMbCd6CvzjjsaSKsVr+8OZZjwh2WbUJVBlmBTMo2zCsHst3Vy479wq98gd2iq13qjZjydW/nPPhFqte/UhdC4dzB7J7PXK7/LNl/5XzWx12CGZMy9lr3mQFT+VLZMBHW8LIpik2LGogfEXT9zR2qVjdwQSchXSBKYEwiOIMIeK94xUC3uUOFZoWSCkkjp2KsNTff41SToxs0FHTR6cfY96IELnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnvCXNRaNSyI9Q+GsIxdfvkjsqqBUgxzGsmIWEDF5QE=;
 b=BYX6/wZfResrSL688LZgXo6VDuag4GZc80VQzJfZ7W5OFZt94fW2tRFEFQyLQ68OGE3MsVRBNARODiPFUHj5l2Jxx7rCJXZCG/hT2RyYVoTL5ZdKniojipIVx4I3r2L77a0LYuEe1/obdwhaiTQM7FZ798QM7VHNdECg+IArbyQ1pfgF72u9RTvTQ4I27GSV+hhl/5LejLnTwUUgMw5wGkCM0mm5TUqg4BVgtyKp7xkkGvw4M0/sZzx7LYZrhVULcBXu2WMDETg6ta4FFFzxuEEAR1KGNyqLKLD65xAA1b+PAOGpbiQdKuPDLY6jSOYJQxfK0np1PRVpP+IptDnFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnvCXNRaNSyI9Q+GsIxdfvkjsqqBUgxzGsmIWEDF5QE=;
 b=YWONjgkjlorV3rJcwilKkM1Zv5gaRfv7Q0vK41CHeYzMytJ4gHsGoKM+erKQERac90ti05QZZof6RdKXd+JMn3Qj53PRL6AEy3Z0RAfOpChh/wVykPE+XtP/yVrXioKqad5Dvn1MOEr+wC+OCK9w+a+atOEJxf4azBBpZrrE8Nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by SJ0PR05MB7787.namprd05.prod.outlook.com (2603:10b6:a03:2e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 23:25:12 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.021; Fri, 1 Dec 2023
 23:25:12 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.co, bp@alien8.d, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v2 6/6] x86/vmware: Add TDX hypercall support
Date: Fri,  1 Dec 2023 15:24:52 -0800
Message-Id: <20231201232452.220355-7-amakhalov@vmware.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201232452.220355-1-amakhalov@vmware.com>
References: <20231122233058.185601-8-amakhalov@vmware.com>
 <20231201232452.220355-1-amakhalov@vmware.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a03:505::17) To MWHPR05MB3648.namprd05.prod.outlook.com
 (2603:10b6:301:45::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR05MB3648:EE_|SJ0PR05MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 08de7b74-f127-42ac-95cf-08dbf2c4c407
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtFwd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ImnGLxS+aveyw1T9XXfBa6xuPwFu8a7McVUhVD0P7yagd24DLNwiRpKsNRPaGW3Z83h0PeUibaznS4mg6dqbU6nVdXhWzhc3mLLJFaXxl2HeyXy3a4UNWfKD74Y1MqTqrak8N23OkjqQ382QUyfbemq2B9XBesZ14HLdBXfKUNp9ARX+8wS4gPf5yYB3oXHzu+IoC1j2ZiGRX/xDmyBwExTfoj6H1ddIBdf7o+WVgjKjyJXG750nKVmYGO3FdJZHeyWmYSw27R6HIMG2t+9CrGiScn+gVJVc2Gn2Q/ghj8sat+UxR58mAzsLCs2/zksgE8E90gpA7fewR6TKpJCTbO50/sDhw2XnN8m1ovFmjfcxLISQB6YrkIBuOZYz7PuHbxeJt6fsR3uwK9rFGg9awTUr9yRRElvRlQziA0/tT8pVFQ22dThT/HWio/NP/S8cq2V/WnU5/YFqKCI3bja65IS1iqvvsD5O9JxDxMsmsrpS1dbVoAn8D6nrTemL8hxrBAFlq7PBpXxunbCtj/7Lb00jJLOQLWOXwWBXN9SI7L+6aYYQbSCPntqARv+nZZgucdvQsaVc48xtrty2UQYQk2B4JBYPApfLGFI3ekXQtZZw+Gl7bmdFLvLN2lt2AAHM+tAWC+H6EW70cMdufX2XaUjmACUTjI0BsY3C3+75wd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(36756003)(8936002)(316002)(66556008)(66946007)(66476007)(8676002)(4326008)(478600001)(6486002)(41300700001)(2906002)(7416002)(86362001)(5660300002)(38350700005)(38100700002)(2616005)(26005)(1076003)(6666004)(6506007)(52116002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G4kT+4q+8Cpn+A933JEKyFep+x+ivgCQGmBflVcW4ePD1d4HQyy4Ct87/6fp?=
 =?us-ascii?Q?Y1I2BYfIML2ij0m6oV5LvLcsZN1JiiiLTcrMuHO0vlPPAxXn4obZIB+fN+B9?=
 =?us-ascii?Q?Q7UTC1EC9uYbc/8HeJ7KN0Ds1oBRteVJUYJSs+/xFylDjHuP3zG/6GE5CcIB?=
 =?us-ascii?Q?y9W5GNHbQWgUCGupGetbnGEIkU8e8ogesJxgp0WtrQmn/W3qyQ64GDPqMC6Y?=
 =?us-ascii?Q?oxN/4iLcOQ6JRcUdpAmVNvBOVQ4fwvGB05D4pjpJjAkgbTeTre+zFoj5vm32?=
 =?us-ascii?Q?tK78ESnLF9X6aq1PNGV9CzRH6DwW1yHoIXMiBlzBPRMy5nGRr16tNRL9DRdH?=
 =?us-ascii?Q?EvkbUmfKnYHhhKAYcd+Jskf+HhhGHXAIQ62VTbg7EgPC+3806woE2/Ru5jby?=
 =?us-ascii?Q?O7NZ/tpwu2/j76Do+9jUIPbfs348h8EzA061sl/a9kikLHe4UGbHV40jWFYR?=
 =?us-ascii?Q?EKvWUgAKBeTW+a7D17960C3HgWuoplbB41z+rGJh98RSF9N3yaRI2v0Yt0qy?=
 =?us-ascii?Q?C6PgryjgbxaDKS2nSqeTb3EFZO6pdRIFA0JSxRXeQyoTpdJKI0dOv75QXEV4?=
 =?us-ascii?Q?KzJ4n/tyb83XzJTT+cS1RZijsKcpjaiFxriTD/U7VyizD8V7l9gbX/gXYBUZ?=
 =?us-ascii?Q?E99VtJhOpAfVHNLw7UR+J18oYfHy5roVcXlI3Wy9/DYCHnJI+KhyMmjFcWCG?=
 =?us-ascii?Q?ubbOYkhUXadL5E/ZDCSGs6ttRHouveinlE+/zrj2EO07m1UD5DF8xtzgDZp0?=
 =?us-ascii?Q?+HvAbIyo49bK3VIzQtoQeIxzIBkQUhFdhcfRmQWJKfrY8AasyEEo+qI7E+t3?=
 =?us-ascii?Q?GvSNBZqYtqjH1+GNWxddXd4F1hdWSP435lgn0f+sq53eS+/pLSUVBosI9K2/?=
 =?us-ascii?Q?FxN50dOEZJN7htjVTHNKVk6iuKlZLCMPZslPJ2GOxoaLQ6FTOJeSBgfcktLW?=
 =?us-ascii?Q?NUyCg8+/QQraO74xfkCdiT3K3wS83xvxHKsvE+VwGhXpR3TNKX3Mv2Hga9hC?=
 =?us-ascii?Q?2rHCLZPKJMmpHQ3hpllROYh84jn6hh/FW+OtU8zMP3cOAqbtctBnrrja8PGX?=
 =?us-ascii?Q?4C38UZq1CxepspZP78QR6XiUn/8O7PYi09YZLaXqdOTxXyWuobj8mOevlHrV?=
 =?us-ascii?Q?bZkSTJoPJy3EUPdl4WTxP03zOykZRdUILbFvIh59xyQQZYwZ/8JJivtSakY3?=
 =?us-ascii?Q?iKxKCmzBMamBpOlOFYM18G2UDufSl+riwrV3CLfsxahr/+WEbo6m0I3JnqAW?=
 =?us-ascii?Q?xXDIGaGicLjDBrW8mzPz8PFj23P6zuPCOVwMLXOgJGG6EU4wYKz7nNN7ENBL?=
 =?us-ascii?Q?ZyLSYPKmNna4an5J6HLWGghuIV+VxJ+AEU8mlhoMeKY+yIVS1a/jpSrSoawj?=
 =?us-ascii?Q?BwhIgSpLW2Jq+FNFjbq9TVAEIxtelASyU/76ouITHX0IfCDsgc2018E2VLlh?=
 =?us-ascii?Q?gRFmDh9Kw4/1fgwp11ot3TvSYJ98SUPPoiZFxv9WZ09PQKi89ttedSFMNHh4?=
 =?us-ascii?Q?kWiAeMgojA5LtPCm+Xu6JGEKpPoPI6Q/o16x6qG3nBOcXZvm2NWlH2b4rDjL?=
 =?us-ascii?Q?8LmODyI9Lr1T7kt6zzNs69ySJPEdvGxQeGr/Nldb?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08de7b74-f127-42ac-95cf-08dbf2c4c407
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 23:25:12.2320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCc2TZpunx7Fak09pEewKMNlZBcwTnYKrnhRnKoZCHXbGgZE8NnH5s61s4wS7ZikOiyaK6MMMeLTzT1xSrGekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7787
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
Cc: dmitry.torokhov@gmail.com, tzimmermann@suse.de, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, x86@kernel.org,
 dri-devel@lists.freedesktop.org, horms@kernel.org, akaher@vmware.com,
 timothym@vmware.com, linux-graphics-maintainer@vmware.com, mripard@kernel.org,
 jsipek@vmware.com, linux-input@vger.kernel.org, namit@vmware.com,
 zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VMware hypercalls use I/O port, VMCALL or VMMCALL instructions.
Add __tdx_hypercall path to support TDX guests.

No change in high bandwidth hypercalls, as only low bandwidth
ones are supported for TDX guests.

Co-developed-by: Tim Merrifield <timothym@vmware.com>
Signed-off-by: Tim Merrifield <timothym@vmware.com>
Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
---
 arch/x86/include/asm/vmware.h | 72 +++++++++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/vmware.c  |  9 +++++
 2 files changed, 81 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 17091eba68cb..cd58ff8ef1af 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -40,6 +40,54 @@
 
 extern u8 vmware_hypercall_mode;
 
+#define VMWARE_TDX_VENDOR_LEAF 0x1AF7E4909ULL
+#define VMWARE_TDX_HCALL_FUNC  1
+
+extern void vmware_tdx_hypercall_args(struct tdx_module_args *args);
+
+/*
+ * TDCALL[TDG.VP.VMCALL] uses rax (arg0) and rcx (arg2), while the use of
+ * rbp (arg6) is discouraged by the TDX specification. Therefore, we
+ * remap those registers to r12, r13 and r14, respectively.
+ */
+static inline
+unsigned long vmware_tdx_hypercall(unsigned long cmd, unsigned long in1,
+				   unsigned long in3, unsigned long in4,
+				   unsigned long in5, unsigned long in6,
+				   uint32_t *out1, uint32_t *out2,
+				   uint32_t *out3, uint32_t *out4,
+				   uint32_t *out5, uint32_t *out6)
+{
+	struct tdx_module_args args = {
+		.r10 = VMWARE_TDX_VENDOR_LEAF,
+		.r11 = VMWARE_TDX_HCALL_FUNC,
+		.r12 = VMWARE_HYPERVISOR_MAGIC,
+		.r13 = cmd,
+		.rbx = in1,
+		.rdx = in3,
+		.rsi = in4,
+		.rdi = in5,
+		.r14 = in6,
+	};
+
+	vmware_tdx_hypercall_args(&args);
+
+	if (out1)
+		*out1 = args.rbx;
+	if (out2)
+		*out2 = args.r13;
+	if (out3)
+		*out3 = args.rdx;
+	if (out4)
+		*out4 = args.rsi;
+	if (out5)
+		*out5 = args.rdi;
+	if (out6)
+		*out6 = args.r14;
+
+	return args.r12;
+}
+
 /*
  * The low bandwidth call. The low word of edx is presumed to have OUT bit
  * set. The high word of edx may contain input data from the caller.
@@ -67,6 +115,10 @@ unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0, 0, NULL, NULL,
+					    NULL, NULL, NULL, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0)
 		: [port] "i" (VMWARE_HYPERVISOR_PORT),
@@ -85,6 +137,10 @@ unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0, 0, out1, out2,
+					    NULL, NULL, NULL, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0), "=b" (*out1), "=c" (*out2)
 		: [port] "i" (VMWARE_HYPERVISOR_PORT),
@@ -104,6 +160,10 @@ unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0, 0, out1, out2,
+					    out3, NULL, NULL, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
 		: [port] "i" (VMWARE_HYPERVISOR_PORT),
@@ -123,6 +183,10 @@ unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, in3, in4, in5, 0, NULL,
+					    out2, NULL, NULL, NULL, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0), "=c" (*out2)
 		: [port] "i" (VMWARE_HYPERVISOR_PORT),
@@ -145,6 +209,10 @@ unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, in3, 0, 0, 0, NULL, out2,
+					    out3, out4, out5, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0), "=c" (*out2), "=d" (*out3), "=S" (*out4),
 		  "=D" (*out5)
@@ -166,6 +234,10 @@ unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, in3, in4, in5, 0, out1,
+					    out2, out3, NULL, NULL, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
 		: [port] "i" (VMWARE_HYPERVISOR_PORT),
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 3aa1adaed18f..0207e8ced92c 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -428,6 +428,15 @@ static bool __init vmware_legacy_x2apic_available(void)
 		(eax & BIT(VCPU_LEGACY_X2APIC));
 }
 
+#ifdef CONFIG_INTEL_TDX_GUEST
+/* __tdx_hypercall() is not exported. So, export the wrapper */
+void vmware_tdx_hypercall_args(struct tdx_module_args *args)
+{
+	__tdx_hypercall(args);
+}
+EXPORT_SYMBOL_GPL(vmware_tdx_hypercall_args);
+#endif
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 static void vmware_sev_es_hcall_prepare(struct ghcb *ghcb,
 					struct pt_regs *regs)
-- 
2.39.0

