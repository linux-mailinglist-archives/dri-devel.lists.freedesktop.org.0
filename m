Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0157F54A5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A4A10E6B7;
	Wed, 22 Nov 2023 23:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013023.outbound.protection.outlook.com [52.101.64.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FACD10E6B3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfOc3yhVBSWb4iyIZn5mL1qQQ4oU5stR8LT7tyn/JDh3YrOlTn/59hiv5erJ//kltjZGN2HGN8JK1XDo6UsVCtNRH1UjekF+gn/3pgzx2EGszpTSao0PBGNOjbU+7tdIe0Xry7RcZBjTWAomSMHdvZ1sX0yFM7MAwQd8tgW3X8OVUIqNPaGg95oPQVt8DDpeuCn7QpZ+HOjTRXu+3wWW9lboZTepfK204MJKGqbBaZ9ZCMGlXMZdXFhjWFj34qpAn5WsuPfdpbcxDH1JHiB9Su8y5P3lyryno7yE+IUIuhHmRG79TgwVGB2bfSn03kfjzosdmeId/TeuPhktYH3aGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzRNOgWnmwpHxYcLc3yQ1p3QI8GkO9/CsPYKHZtJL0s=;
 b=Ir3RZOxYG8RqkuXEDIrbbyqmn3YLsaki6n/XbbTWp+P6JqjZwTsBQyzlE2rWum3mf4yLMzpGvneWwTXl2ouQaCEu9WcRCpBqjMfHjFmyd4k5cQCVXngCEWOlKeOPCgObWoVwD63QdSLHKo9mOraxl9zUls8sWVU5+8wCr0EpSLjvt97XmyXEWiqNy9GT+1UGGpWs9gFhFc7kQacGInkQrOvoIe6+1jvHINmye/9frNO2I0AU//wNkQMVXeQMHRMnporPG9dXZEwxsjn82i5R+Eu6ofj3Hcc4RH45bFsi2xkr66gYcvaoo6N+d3Lw5Km3C7phrUwTmV7TT5xYHSjsxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzRNOgWnmwpHxYcLc3yQ1p3QI8GkO9/CsPYKHZtJL0s=;
 b=NjG6C6kVGiKCxzkubKjbgZvHgieTINn2GOwBzp23gzhmI7oPC65BKPvbL2OPg10ayV4iL6UwkXtsUcjn145FG9HyoVTPhe3zFVysmFvXH4P3rutDqC29yGxgT/8a9NbxJYU4C5ey2NmPQxH+CGPQjZoYELbj0abIUAya0yhGTuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:29 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:29 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 6/6] x86/vmware: Add TDX hypercall support
Date: Wed, 22 Nov 2023 15:30:58 -0800
Message-Id: <20231122233058.185601-14-amakhalov@vmware.com>
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
X-MS-Office365-Filtering-Correlation-Id: 18c5e9a4-e8cf-4fb8-0a14-08dbebb3273c
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmjPF59KNkQ4RchH8AtcR0fgbnFlbdUPSp9BQJmllciCuPrsOPeIHedl58mjjsmUJHIhYPxLGmp89o0sIKfjPsv6cc+RgFoxvr6ZNb0VjaO5NF9yMTRJusB/K3hLHg43BG+DybQYnlnffgZCg+9nEAWtObrkt16cXXzjPdlmmtDAMUhq8VdSGTCnypNz4tp5QUobIigLgSt8AQ/0KRwBMUXVk7umo7Kxl01BdU9RqY4IihhPDujoH47oDTc5o/XbYkXgsIzTh1PCh0/GGYykOP/0Nkp2CP5VCuUGOj0RzpkZrSN3B5rd5kAQqb2E53JYiZkV5N+gNfgG3QfYusv3TW4SYBOaR6fm7+QMyrxnNOT5JkPPns+qy42MTV4P6qTdcIIEhS29VULE0F2lGYsOkcAwzttp6iKaThuGVw52vvJBl6skaxZwmXu+I/5IqG8oQtGfbSQzbalxgemE1jSAQasxwQxpwf8+J0xmS8rsN4kZ8S1mOBoB+dbvIdU7NZq4qCjTIdcNcn3tV5e6U0Psmfg7/uWGLzJAlrzSwpsJO8kq/rtHqLjfJw5ckYHoBtkla8EuUZDTWeE682oi+oq2fnVZ+JQu2H/85Rv29S+HagfF/JDaWY9D5SwrXPPFUssvZDvLNy9Zk+RgpK8UuNfjosTJe4ZTUfb9mGD4RHH2LSNav1/rDjgwGmur+NNYyEJR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(38350700005)(6666004)(2906002)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AIeBBddSjuAND9P0EysneDqjRXdxrL5QXbRWeDStNorFYQ8JfYBBB2hNiyee?=
 =?us-ascii?Q?C5yRwo1t7Uz396Ur40V0TJfEkLmVNgfDFmvtChj8vbs7tSNRUQZPtSm5P5PK?=
 =?us-ascii?Q?B1skHg98GKp8lHm2V+Mr40fiNaiO2RAYe+fA63UG53Qp87bQbA+MF2Vp803x?=
 =?us-ascii?Q?lAG/Trc/RpoH3bmkPxKtWulGYvO1f6LEYeAOgOJ/n4Y3AasYpHvhyO+xV6Jj?=
 =?us-ascii?Q?DhmiqCiBLoX/u3EAmcxdJTFgh0aB4QgaBVIzBX3ntWv1NOYCl+0d9F/l/voI?=
 =?us-ascii?Q?dp6/WkTRUvbnP/3QyGd+qkBjWqhmCyoDtC/cOcCOKLAZYM9m1q6VT8AVrCFE?=
 =?us-ascii?Q?nyVRtC9dX1t4taCZfNVtDgSaboX0Z8qY3RPVI4bWDRvl1nONMToKzf+Nn+Kg?=
 =?us-ascii?Q?g1BgCwQH53wkaCWs05NkYi/Aw22q0m8Y3bCNeafsPw4QJcYqcePHFzIJadE5?=
 =?us-ascii?Q?X/iJckQibR32/DcCwJqavpLqVAJe3nKcEx+0jXtpi+/yB2HbnK54xzyOIoty?=
 =?us-ascii?Q?67lV8zr4YWo9EgN3/42HLcJko6ob5I6JAdqcEDonoTVr0K5U12HQJcvpMF7Y?=
 =?us-ascii?Q?TdQS6KubaNotAF1d76u9mkwhG9MLqrQubbfPGPlU49wYvPEewnttC6C7iYeZ?=
 =?us-ascii?Q?5g/BVF8rPIg8Qw6KhlVVP1ACgBR9kE17+U6bZLRpNTom9y6VOCU1CETlB6nF?=
 =?us-ascii?Q?oTA1PZERqT/cJfvWbaWkGvR4EABSG8MUfpLxTt+MTAuKeccjC2sJ59F5KfHi?=
 =?us-ascii?Q?Komiqehg7KcOmcWQJeEIiVSYaRnUkOLcXFFSZN9ywJYbaWY2dZQQmRGutfXd?=
 =?us-ascii?Q?cxroKJ4UeCKpxl+eqQcTpPRlHMJJsQ1vv7Jr3Ojd0zqTWC7/BQ71TB0Q6DvX?=
 =?us-ascii?Q?sZtb0yyXZE6lSzKI2BCy079oAfpZTonBf1HHxsRtEt1jFJqLjiWK+giavuUr?=
 =?us-ascii?Q?i9KcENW2DU+TRqMZzwLByR+r4ceGwzTmEstD//G2C+jzRr0qKrt1sL7b13iF?=
 =?us-ascii?Q?eWTeLOewOG0RfkutA8v6Xfj6kW4p53ImmzfflFQ6/Qc5rnak9Ipy6ZFickU7?=
 =?us-ascii?Q?aSgXPpRzVrti7MQWYvvgsUbmb4x//a3Zs0CM/bZTohKW9EHH2Mk0s7qodgr4?=
 =?us-ascii?Q?xCM2E7VED1ZaUCoTmikNVNzVejBk8Aku1rbjvA1wHoAq4GzIdYm6Oqc4H5uG?=
 =?us-ascii?Q?iXt7uaHK9me0ZcND8PMveyb/VDPMOHlRjulGrBxVbk0Mbnv8pS9UhMExxCdm?=
 =?us-ascii?Q?JfjY4hQEfu/KwzyTo4go6cYqkDYdTo0FHT1KovxOp0DkOYXeybMpa6brwAIt?=
 =?us-ascii?Q?O8/4GlRbnTrBbk176BonAlw3mDHAKj3YWtpcRnclf4a+34noIuQQypde+tFL?=
 =?us-ascii?Q?Xp9bDqRa2rBJ5QgYPQypX2EcKxLXCgnQ+Gnho/g45eL1Ga0Sj9lUVGol2bnK?=
 =?us-ascii?Q?o49zB7BGpmQUDwW5OQ1SWxEX7o7cgHxrnJMooQDHSFB2ISWGBwH3mVE56CgU?=
 =?us-ascii?Q?Fcq58H3pRDRMJ/074kptgvJPaRtVNfrxC23LELREzFftJvSoHVdReTMPLfoY?=
 =?us-ascii?Q?jZvUziDqa38UTxdYabGHRyahhBlgZ5P5N4iTPAXb?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c5e9a4-e8cf-4fb8-0a14-08dbebb3273c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:29.6819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 692e7TML/0gt0dxPiC1jgVoH5Sjwi7PYr6iB6F401aroVyO1QVZpaCZsSc0lszlAdQlUdDcR05SnIO26u49dCw==
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

