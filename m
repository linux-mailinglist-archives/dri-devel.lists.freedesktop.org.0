Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5320B7F549D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C054010E6B2;
	Wed, 22 Nov 2023 23:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013010.outbound.protection.outlook.com [52.101.64.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B9B10E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSSL4a0VZzHLZxbV/ewI6ssdeBlhNqVVJCUJhXz2dpTgLME0HOlfBZWdNVC5p9Ojsnql0NeNcvUVPIxmnIWoLib+koMmP0yoiFFrUfpMn1pDH18s7WWFmcTNAnNcDMpGU3nkQ49mZP6kuSXnd94y+RsW03Jf8dBjHKeDgvrgNCIt+b+r/2kcPYWVpl12t7BIoGwdzuBw34KoeVQzTpa6TL3FWI4vpQX17RQ4Yre1kS0hZtgSa03pjX3DGwCBSdOgLAJ6Ty8cqsEEm6XlOFMHv5w7Dvn4tdItil6nazI9hFR/nIf+NxnLj/K6XbyLQSh2iHgIz3+6Be1F1r2L8XLnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0HUf4HJkx84wehooDLbcZ1NvSDXpPSeL5U4lnZJnFU=;
 b=eheWFD6zHr3eqKyhIlogQEkPVJNTjN8Rsux5Or8tmZDHhWiYgE/FydgQnpX+t9L/GusOPOP0RdaCezBqJsUX5lv4uMX5RdITKp6GhXGmkbmEFDGpQL2ERg/cyXMhhzXGgqQKX8GSKK0VWbT4hRkiSO7O3Fr0iQ60vJGFIGGfV/TvP26+CXrbcL37JJFnr11LspKL3pxhXdKETKoDHm4gL0PTDoQpFCfEk0eGgf4RM9snHZsjq1YF1kCr3GUYWGux3OqPWEq7jdDGOxdpxKz8oD3f/PLug1Li4PPv5U+K/K0OekkBW46iIbrKVm92cYyDly5EFos2Gz0Sp5kitut8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0HUf4HJkx84wehooDLbcZ1NvSDXpPSeL5U4lnZJnFU=;
 b=v9TTXIrJvgO9CeWi0w6zwfZ8+vS/Cica0yTKdO2bKUiJ6w6mUro633WmKK/wQmcPnV3PqHW1OTPV7/Lv8P5M9vPxKtz6CPfKyWXuqerPd/W3PJf7rtz6OMVS9PyZf+oq1Rt1BzRsXcWnfHZ5MoLiJpZHCtREdNDyOf6KSIOomQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:17 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:17 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 2/6] x86/vmware: Introduce vmware_hypercall API
Date: Wed, 22 Nov 2023 15:30:47 -0800
Message-Id: <20231122233058.185601-3-amakhalov@vmware.com>
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
X-MS-Office365-Filtering-Correlation-Id: af5cbc1d-3422-4c7a-ec78-08dbebb31fe2
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JxHBoUR0C7SwzNntTiWfdyuMKa5hxKj9vh3yVBEsrZJcBHmy8EfoIUXD1eRLwtALckgKPIrKxRo/gwnCA6kObb9vTv4HhNBneUyAE1ISIRozln7owh4UIRMLJ1kwh6tS1zSSDjvfrr1HPdTl/NCMH2FEYxGiT7KPc0NxdOUptF9plnqqOJ35AHpQuaCVR60txdsIFKqBFR5rY7y0I6IZhatrjhUtzBvL5N++jl7zL2spJyuLGDDrnUqXT/UCYE6qbb85KUtR3aLnG3ZnbKoy+GNegcKLs/gQKa5cM8kO4aiZWD1/FY7LGSGN5gfesydaTga96ky8rWFKRZ5WxSOavz0u7W+C0QBdN8VsGQYizjWOjEVQiga1gU4gaBZis3j/Xqe+JJafZRqa75sOKQ7tlxxUXvdsx79+jhkMKtXwcS5iRQQ54Z8uGLQeDCmFzzON7pyBJso5u0iksT0Mc/Ss1Pd/zGCMFVt9mQvkLP+Y3V8b+QrOkVGdv7+l2sfeJDesuiI9nL/aVPT91jN3Cl5ZoOEMgEhujIimD+g1MhtUtZYSRJHZpRWqk3pRS38aeJv7AS3QJWwzE9YJVVdHQ/R4gmjiKDvQnMxwoftqCtox6NQcVLVeu3rn+tgomgEKPWNfWU0wvIaliRAROysPsgzyC8VIf+i802hcET+L/Btdimjg0vNyyrx+rTDU/GK/Tjna
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(83380400001)(38350700005)(6666004)(2906002)(30864003)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RpjEKzBdh+9u0qyCYHuETe7TueIwD5oOlhQbOxg4O8gWo7eh64V+jZL8AJXZ?=
 =?us-ascii?Q?ZJ5gtCs2U9PVC9JUbP+xDO2mDdcHYX+SGo1MNtkXCBzgS9XtY7ee1PMgthe2?=
 =?us-ascii?Q?chDRDPtXCNu9h3IPrqwnOWrPxn7x2sLee0B6WgBXi62N2YAMDxEi3wRiKJTj?=
 =?us-ascii?Q?Q2n3RiAcZbxBg1p6eAAH9t26dTaErKTY8/NrpYmcbdeFcILIj+nLA+yAw2XZ?=
 =?us-ascii?Q?BD+PmMTpVTymd4m8mOPmo8u3I+U1SfHT7l4sDwTSauCDrf2Ar/eKYakRIFhI?=
 =?us-ascii?Q?NcLDYipG+HqSm9v5EOHb5Xt7sLc3Xq1o8mqH2Zv3XJuXZFu6cnoTGHbequsi?=
 =?us-ascii?Q?ze+EtCrvPsbLTCIpPP9pYSWXA55IfNKyOrK/hmRRSeHlL3vCJP99HDe3Ci1C?=
 =?us-ascii?Q?oSBbkLPg/633TZBqHzBKz1Q4Mnf8yrDD/DBFGXTyYPbuivqF8CF0VUV94I8W?=
 =?us-ascii?Q?DVvMQsTzo04LJycDBBc14iyhGIi4dJ4fj09mxqkdmteArekvhjUansSzPHop?=
 =?us-ascii?Q?Zzo13DguZyQ8V7zMCN7ViZuW8wqq3n0tPx7vBeqkpaOXlp9FK6y+oxnSnDLn?=
 =?us-ascii?Q?OLqL7xTmHiHuJC87xNU4Yu1HtFL9VbwogAF/e/BLkiT3tviD78HpZHNAL1Yh?=
 =?us-ascii?Q?tt2b5XDT2UNZBCNupcf9ZKnFToRVu1irlkZzGEntVabgrgReRFCMH1wkDsR2?=
 =?us-ascii?Q?/gQmnNw1k7C9vRhdNP7xl9oq5U/OwJdK+XmcjATL5QO8NwxD5cL6j6/OHpqk?=
 =?us-ascii?Q?AzkhlBWBG97DwxS0ppPH84f2dpcYs/syj/zJvYoWQ+7QzEr7IUD8vUOkqyJR?=
 =?us-ascii?Q?QhXemSPHHOPFuOvsVgcK9KN0WeoSlCqVEVLou5mBh9PXBJFrAGrYd4SA1W0K?=
 =?us-ascii?Q?u6pq2HrPeUwj6TQfOIarkzmXZH61ITAsEtE7+1Pkm8wLgBVUXL3tmSSuB7k7?=
 =?us-ascii?Q?/zmAbotqP7VH0qvWon6eR2iEzO80krU1j/l1QAifWYp6dqzVzypkRT7chIy8?=
 =?us-ascii?Q?OdaodECtwBRhseFq3RVIimdnbnkzqbiuf8ZI0Rf3o5OA6gNMgq0jLVeI+qHS?=
 =?us-ascii?Q?bvf+rTfz8WMnnUQJcMoE6gAaE69hTdhZLAHROsO7ZX7t8v+CMGvGKhO16Q4E?=
 =?us-ascii?Q?OZLjb+G3WEHZmYEcvKykUR2JehnEUS1sHdpabuQK1MWVljsqUZZTyjU7UFc/?=
 =?us-ascii?Q?ntWgyRz1/70G6Q13eFCDrsy1g5cL4HfoGHR+POp15WPZiKIJ4a5E5peHjU/D?=
 =?us-ascii?Q?ZxLW3H0RZQqb0fGp/MRE/Pg/8cWf3Rv6VD7zJVxanueEFrAied08jZV3jXdR?=
 =?us-ascii?Q?JlwThkz8zHwJkaxNMm2kCnr/9aGz9KyNEZE2/DzGT9JR5y0OzQqDthqicnOc?=
 =?us-ascii?Q?8gG0mTz2k/jAbAdKDLkcZFMlbxx8yhz16AGaHmGUXKrOohAyBDet0BNGLC3q?=
 =?us-ascii?Q?56dWlyd7v5uJ2BHv/uPULmTEPtfS/xMzBhbSRdnxMfepCh7rO+qaAOWN+yMk?=
 =?us-ascii?Q?pp10ye+i+UQ5vYwp8F4/4Rc8umdMM5Q+yB/07A/KddmFTZDi5VrG68/snIpp?=
 =?us-ascii?Q?QrSyycqdJqSbDcppbp8s7p9TdA9MNy9yGv+4c0qU?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5cbc1d-3422-4c7a-ec78-08dbebb31fe2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:17.3303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUGiB+bZXf8a8BUmNHgL9eV3swQhmxKOGO1xG7WWv8WkyrFsys4ExlQmayw9/O6dILaZtpY6ArrBxeiSYJ1NUg==
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

Introducing vmware_hypercall family of functions as a common
implementation to be used by the VMware guest code and virtual
device drivers in arhitecture independent manner.

By analogy with KVM hypercall API, vmware_hypercallX and
vmware_hypercall_hb_{out,in} set of functions was added to
achieve that. Architecture specific implementation should be
hidden inside.

It will simplify future enhancements in VMware hypercalls such
as SEV-ES and TDX related changes without needs to modify a
caller in device drivers code.

Current implementation extends an idea from commit bac7b4e84323
("x86/vmware: Update platform detection code for VMCALL/VMMCALL
hypercalls") to have a slow, but safe path in VMWARE_HYPERCALL
when alternatives are not yet applied. This logic was inherited
from VMWARE_CMD from the commit mentioned above. Default
alternative code was optimized by size to reduse excessive nop
alignment once alternatives are applied. Total default code size
is 26 bytes, in worse case (3 bytes alternative) remaining 23
bytes will be aligned by only 3 long NOP instructions.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
---
 arch/x86/include/asm/vmware.h | 262 ++++++++++++++++++++++++++--------
 arch/x86/kernel/cpu/vmware.c  |  35 ++---
 2 files changed, 220 insertions(+), 77 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 8cabf4a577bf..17091eba68cb 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -40,69 +40,219 @@
 
 extern u8 vmware_hypercall_mode;
 
-/* The low bandwidth call. The low word of edx is presumed clear. */
-#define VMWARE_HYPERCALL						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT) ", %%dx; " \
-		      "inl (%%dx), %%eax",				\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
-
 /*
- * The high bandwidth out call. The low word of edx is presumed to have the
- * HB and OUT bits set.
+ * The low bandwidth call. The low word of edx is presumed to have OUT bit
+ * set. The high word of edx may contain input data from the caller.
  */
-#define VMWARE_HYPERCALL_HB_OUT						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT_HB) ", %%dx; " \
-		      "rep outsb",					\
+#define VMWARE_HYPERCALL						\
+	ALTERNATIVE_3("cmpb $"						\
+			__stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL)	\
+			", %[mode]\n\t"					\
+		      "jg 2f\n\t"					\
+		      "je 1f\n\t"					\
+		      "movw %[port], %%dx\n\t"				\
+		      "inl (%%dx), %%eax\n\t"				\
+		      "jmp 3f\n\t"					\
+		      "1: vmmcall\n\t"					\
+		      "jmp 3f\n\t"					\
+		      "2: vmcall\n\t"					\
+		      "3:\n\t",						\
+		      "movw %[port], %%dx\n\t"				\
+		      "inl (%%dx), %%eax", X86_FEATURE_HYPERVISOR,	\
 		      "vmcall", X86_FEATURE_VMCALL,			\
 		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
 
+static inline
+unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
+				uint32_t *out1, uint32_t *out2)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
+				uint32_t *out1, uint32_t *out2,
+				uint32_t *out3)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
+				unsigned long in3, unsigned long in4,
+				unsigned long in5, uint32_t *out2)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=c" (*out2)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3),
+		  "S" (in4),
+		  "D" (in5)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
+				unsigned long in3, uint32_t *out2,
+				uint32_t *out3, uint32_t *out4,
+				uint32_t *out5)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=c" (*out2), "=d" (*out3), "=S" (*out4),
+		  "=D" (*out5)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
+				unsigned long in3, unsigned long in4,
+				unsigned long in5, uint32_t *out1,
+				uint32_t *out2, uint32_t *out3)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3),
+		  "S" (in4),
+		  "D" (in5)
+		: "cc", "memory");
+	return out0;
+}
+
+
+#ifdef CONFIG_X86_64
+#define VMW_BP_REG "%%rbp"
+#define VMW_BP_CONSTRAINT "r"
+#else
+#define VMW_BP_REG "%%ebp"
+#define VMW_BP_CONSTRAINT "m"
+#endif
+
 /*
- * The high bandwidth in call. The low word of edx is presumed to have the
- * HB bit set.
+ * High bandwidth calls are not supported on encrypted memory guests.
+ * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
+ * low bandwidth hypercall it memory encryption is set.
+ * This assumption simplifies HB hypercall impementation to just I/O port
+ * based approach without alternative patching.
  */
-#define VMWARE_HYPERCALL_HB_IN						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT_HB) ", %%dx; " \
-		      "rep insb",					\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
+static inline
+unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
+				      unsigned long in3, unsigned long in4,
+				      unsigned long in5, unsigned long in6,
+				      uint32_t *out1)
+{
+	unsigned long out0;
+
+	asm_inline volatile (
+		UNWIND_HINT_SAVE
+		"push " VMW_BP_REG "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %[in6], " VMW_BP_REG "\n\t"
+		"rep outsb\n\t"
+		"pop " VMW_BP_REG "\n\t"
+		UNWIND_HINT_RESTORE
+		: "=a" (out0), "=b" (*out1)
+		: "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (cmd),
+		  "c" (in2),
+		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
+		  "S" (in4),
+		  "D" (in5),
+		  [in6] VMW_BP_CONSTRAINT (in6)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
+				     unsigned long in3, unsigned long in4,
+				     unsigned long in5, unsigned long in6,
+				     uint32_t *out1)
+{
+	unsigned long out0;
 
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
-#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)				\
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
+	asm_inline volatile (
+		UNWIND_HINT_SAVE
+		"push " VMW_BP_REG "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %[in6], " VMW_BP_REG "\n\t"
+		"rep insb\n\t"
+		"pop " VMW_BP_REG "\n\t"
+		UNWIND_HINT_RESTORE
+		: "=a" (out0), "=b" (*out1)
+		: "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (cmd),
+		  "c" (in2),
+		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
+		  "S" (in4),
+		  "D" (in5),
+		  [in6] VMW_BP_CONSTRAINT (in6)
+		: "cc", "memory");
+	return out0;
+}
+#undef VMW_BP_REG
+#undef VMW_BP_CONSTRAINT
+#undef VMWARE_HYPERCALL
 
 #endif
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 4db8e1daa4a1..3aa1adaed18f 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -67,9 +67,10 @@ EXPORT_SYMBOL_GPL(vmware_hypercall_mode);
 
 static inline int __vmware_platform(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	VMWARE_CMD(GETVERSION, eax, ebx, ecx, edx);
-	return eax != (uint32_t)-1 && ebx == VMWARE_HYPERVISOR_MAGIC;
+	uint32_t eax, ebx, ecx;
+
+	eax = vmware_hypercall3(VMWARE_CMD_GETVERSION, 0, &ebx, &ecx);
+	return eax != UINT_MAX && ebx == VMWARE_HYPERVISOR_MAGIC;
 }
 
 static unsigned long vmware_get_tsc_khz(void)
@@ -121,21 +122,12 @@ static void __init vmware_cyc2ns_setup(void)
 	pr_info("using clock offset of %llu ns\n", d->cyc2ns_offset);
 }
 
-static int vmware_cmd_stealclock(uint32_t arg1, uint32_t arg2)
+static int vmware_cmd_stealclock(uint32_t addr_hi, uint32_t addr_lo)
 {
-	uint32_t result, info;
-
-	asm volatile (VMWARE_HYPERCALL :
-		"=a"(result),
-		"=c"(info) :
-		"a"(VMWARE_HYPERVISOR_MAGIC),
-		"b"(0),
-		"c"(VMWARE_CMD_STEALCLOCK),
-		"d"(0),
-		"S"(arg1),
-		"D"(arg2) :
-		"memory");
-	return result;
+	uint32_t info;
+
+	return vmware_hypercall5(VMWARE_CMD_STEALCLOCK, 0, 0, addr_hi, addr_lo,
+				 &info);
 }
 
 static bool stealclock_enable(phys_addr_t pa)
@@ -344,10 +336,10 @@ static void __init vmware_set_capabilities(void)
 
 static void __init vmware_platform_setup(void)
 {
-	uint32_t eax, ebx, ecx, edx;
+	uint32_t eax, ebx, ecx;
 	uint64_t lpj, tsc_khz;
 
-	VMWARE_CMD(GETHZ, eax, ebx, ecx, edx);
+	eax = vmware_hypercall3(VMWARE_CMD_GETHZ, UINT_MAX, &ebx, &ecx);
 
 	if (ebx != UINT_MAX) {
 		lpj = tsc_khz = eax | (((uint64_t)ebx) << 32);
@@ -429,8 +421,9 @@ static uint32_t __init vmware_platform(void)
 /* Checks if hypervisor supports x2apic without VT-D interrupt remapping. */
 static bool __init vmware_legacy_x2apic_available(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
+	uint32_t eax;
+
+	eax = vmware_hypercall1(VMWARE_CMD_GETVCPU_INFO, 0);
 	return !(eax & BIT(VCPU_RESERVED)) &&
 		(eax & BIT(VCPU_LEGACY_X2APIC));
 }
-- 
2.39.0

