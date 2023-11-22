Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5247F54C1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBB710E31E;
	Wed, 22 Nov 2023 23:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013010.outbound.protection.outlook.com [52.101.64.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D22510E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIyEtPOzjHet0x2UuykGZhY8iT/zzw3uvVgXRqTJG07VVw1uow26paAEkoQAn/nuC7nusC2gPbkfQZ5uPeoX/nx6KY4TUD3R8CM5UlACJwIrmX//POr+9wJmK4UyrGGwmmC4LhxuZx0gpst2emEnH4NO/x4hm8kvzBZGT94nDWRtxi4U8/qlE+zXdlL7Vuf+Cl/vvFgUO/6tJcfPLDqsIWQpTdnQ5jT6/YXDumpi3ZnRkv3oA2ODF6hlAG74UtzXEz1t0YG1azUXtVHePqJ6k2QSmrYMWqlBCPa/1DA6Dr396QINFyL4hHzmF4nosrbnGEFDav8wZXgAGxc6IcZXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzRNOgWnmwpHxYcLc3yQ1p3QI8GkO9/CsPYKHZtJL0s=;
 b=m1Tsi+Qyg8h4IHTiA50Qlg8Mg4E6oavlL8a2ZtRY/NUtQTOD1OPDR4/0GZme4kLFCC4ceWLKc8lbxgkoGPi8AO4DQsv9DBIDku/tA0WPE2uOvrDKeXN9oKkoeuIKf6Yowwu0+9v+MHrTmHsdXD5hTNfggsrG/kfOA6oNjzzm+JwOOFIsHesvmVu8LQ+ljSQf+A/R/T013TP36axUv6+UzyAAvJUECig1wAzY2HAx9dw7XTU4xYy5SH/1Je2LH4O5pd6ZVMpm32q5bvKdvjEcIG7+enLv87oAEBrUnIm+Xkd4a7du3Bze1yEjTrlGVQdNI+leXv5bh2ttLs2xp9QXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzRNOgWnmwpHxYcLc3yQ1p3QI8GkO9/CsPYKHZtJL0s=;
 b=QtZpEhd2aZ0x0qr7oQo1hCCzmMoxrdPemOCXkH4uM9uSTi3hHo4dMM+S3sWclBcyS/qlB06Nk5T6JWofn2YHmf7V6Rf0DJ3AGlxi8h/jh9YlESRHlro3b/j8EBXfW+xllRAE+5/Uoruk1UouFSIf2Uwf6ARwS4fFfa6gUge6H4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:21 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:21 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 6/6] x86/vmware: Add TDX hypercall support
Date: Wed, 22 Nov 2023 15:30:51 -0800
Message-Id: <20231122233058.185601-7-amakhalov@vmware.com>
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
X-MS-Office365-Filtering-Correlation-Id: c2970139-a825-4373-0777-08dbebb32288
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBXyMGmKIvJrDeK99N4H2BXrIuazQUJ5y+vlunU3W2EW6J6e44Alr9sxUyhrIeAgv1QckjnDFK+CAFbJNhgUlHZOhoOBOnr6fHgtkMl8JxZvfxiDojg1ldnediBEVCuyDYbuhCtpqrvxo8RpaQ+bEI2cE1q69dHFyQcHi8dFtIf3YeUJXwk6irSVKR2T2yWnB/dehmkMnKAzb0e8bAMGIVP++LjBdI6mv9lxSALUl2uk6AoAp71gt2AXOX4Fp2GDCwrFdaCLvieB53EwVuMqmA+tPmQyam/40qkTiitjCyFL6EGTY2DxVQvG3y4r8/Ovj9GlM/JwH3+Nx9K7pr4HEBf48j3wWkR5MyUYrwfJQWd63+4SUnr4gzQrNBOVdwm2Soy+B4kOEs2I31zqmbXE32CR+LBtCxs3xGHrEzR0Ih6NxAHNSAOu6hKMa3NarqagyoZdNJ/oYmqK1cP5v7KFZgCZ6RlEgtwu6UmoVyd9mnuRlppVRfQmP+Ic24pl8sQ/oc6792JcskvW9i5jpspYHPVkAfJXnWl5vF4C4dgvwRatwgEm8B2RIKtUpW/xV53fjuiQZqhCXutrNZHcRNPwT6sUI8iRS9zi3PtKvGpVB4Hwu4VQkflVIdfd64Fshz2HNH0MCdabe4M+bPMjqOyS1l/dylnTCCtFttuymD49JkzROweeh2Gn8UHSmt1OUcFu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(38350700005)(6666004)(2906002)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IyAIthwmpJK2xq+OYxTl4DEDQ7r026qIdEmgblnPIDe0KlGKTbpt+P5MpDVi?=
 =?us-ascii?Q?6iQrwsJfh162B8oiZL96nr/B6gVRNM2D9OccdNE4TZZ3ZDxNIKuFWuwxJgbP?=
 =?us-ascii?Q?xV26egV17irxUHibEy+z14Q0TOtL2EYc61VrGAtqaPaA5XiH4TzPfvio9mHm?=
 =?us-ascii?Q?ZD+JME8Xed5LrjsbyAQf673C9y2C+7iwGcHZodjXitCkvL72FDO56E50Dw2/?=
 =?us-ascii?Q?acgmVUluYTsYoKd3lqSnMPjTIQ6lJfLayMtN+d1WQkVUNdfEukGIQlZXWxEd?=
 =?us-ascii?Q?i/eSXIhF5b+JVJoSw0UxfaWR6tMHLjOZIM5yON8gT2PSwFIBnQ7Ruy+tmUuK?=
 =?us-ascii?Q?NJoZvo/l+qu55Y0OB2G3z0KMgxeedLPWUXQdj+BVKjfVXFu9k1qmVScIbNMu?=
 =?us-ascii?Q?cbp7V1RGPR0PNKQK1SRadWVnIAPZGkCpSq4R3LvtPze9xfiLxaUiqTsS6D8q?=
 =?us-ascii?Q?SMf2NfyVj+3yWO3kTehS5iH8ohjPOhvES+sDqxWd3E/c8nfbbxdF/TOSaer7?=
 =?us-ascii?Q?I11xHWqH25oGg6mdn5EJ6p/iaQmDAvhiwavQYx9yDLEVlmsFu6WIQTJ/WH29?=
 =?us-ascii?Q?m8IRRdjb9tvTxv7c4z7w1A7lNQ1ceEaH/WZPlPEL5N2JIV+lQcxCd5bFsVe1?=
 =?us-ascii?Q?QP20Pwad3ssADnOB9S4m8AxSXNcmt76hDt4F45JgCGEBh7DRYEMK83zorQjC?=
 =?us-ascii?Q?wfw+kir6acFMeJCBuVfWo79vHNThC9cZqhLMx8ORNTum89V1f1/7veROpmK5?=
 =?us-ascii?Q?E3Sko1UQOKA0hOJ6oiXMvRl2xNdUcelwgq/yhjYD9HYWe4gSMtnWuWetGedU?=
 =?us-ascii?Q?Fp8XbC6bsWD9JBjtm5NN2cqEFWhfZ9BW7RyUW1374mLR/NrIe5yjH86TzvoM?=
 =?us-ascii?Q?7ZzX1v1GlJN128eVqf9YL5RV8jyEHSUBg5aFeuhGe+EIJz92mjou29cz3K/o?=
 =?us-ascii?Q?K031bKkcbp8/LS847cApdYeXh+wfosg56YQM2EFIIt1B1Snur0ZQzbxkT9qs?=
 =?us-ascii?Q?DfdMBFUvplcvOGb/teZp86mHtj3tBkEVY79oaR74Pgum38hSVuKOEdzxWy7m?=
 =?us-ascii?Q?68T5u1cFY4DRAngYgV86YVfmWqqIv5zlH/Z0gCkw9AShc2no4oO9htjJeGdn?=
 =?us-ascii?Q?VhhQlcLBBa0kgGnSiCu1v4uMx2RPQM2bAmZRlCSwkExjwa9+LMlgwE5eu9ud?=
 =?us-ascii?Q?U4Mim7jtIIr1iwdZiAMswzt08HZrZg+ui2LhtCWlinCe5XVS9/IoFj6QY1FM?=
 =?us-ascii?Q?K4lP7kcqhfFv28GnP4eo1qVMRMK91OSzpg94givNGd96qluU0uIQLzKg3zih?=
 =?us-ascii?Q?QDFT+YnQ3ljds2ElqRVznj7Jvxar4/ZrIdvgoE1jJNIDBwPzW5iaL+gyYVjr?=
 =?us-ascii?Q?s1ZIP0H42IqlKGfmFdYpDl+hhNsH5A382CfTvScrjdo9GZcO4d1P2G3xfFAl?=
 =?us-ascii?Q?dsh/GZaPnIvsWN1ozurhHBpZ8kMHe14hLeOwIt1471o3M7HTNoHkBcZvkoOf?=
 =?us-ascii?Q?6k/y0A6axJNYgrc11Yc/oMuX484tEyin8oOUEq1wK6Hvo1gMKb0Os8Fjk/Fp?=
 =?us-ascii?Q?svZ2Sud0RpL3Pk4LYdQEEtYmghZsIaCNrfpxZD7z?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2970139-a825-4373-0777-08dbebb32288
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:21.7230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +y6PAigsyXOJNLutnlfU9C0CJE1QKpHcjiRR1cepe3facbjDP8BBvpbsc6vy+6NVXPh6c66PkotIMwOwe/Ep3g==
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

VMware hypercalls use I/O port, VMCALL or VMMCALL instructions.
Add __tdx_hypercall path to support TDX guests.

No change in high bandwidth hypercalls, as only low bandwidth
ones are supported for TDX guests.

Co-developed-by: Tim Merrifield <timothym@vmware.com>
Signed-off-by: Tim Merrifield <timothym@vmware.com>
Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
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

