Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251FC7F54A4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E6810E6B4;
	Wed, 22 Nov 2023 23:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013010.outbound.protection.outlook.com [52.101.64.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C562210E031
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fwclv2NgF5SQ/tpakNHhBmu/v000BNA1U775hc+77mJXHI1lAVtARYAf5Ld+lc6jxIlloBCFvDZH+6ZIBH70GJwHnHI4Er5ZqGDRZ2ucZtlqKZEDPLhU6MOdOqJtvGqljFS9H7q+JaIfOj/MpXaFAb48om6vpV4noNpEui2WNgQZM9nJSYM0xWQqaejclF1kzGlyQYkSB+sJ+b48aXULsFhp7kz7hsm/yBU0uizl+ET4stOg8ePXWv6gyDPTz8iStMYhlQ8MBWS0nc04o8HkZo0+vtW3zRfDSvD5cP2oMXHiVO6sSlJHIeeH19LHD1u6hrQIjGy3wiWgqigfmFmHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0HUf4HJkx84wehooDLbcZ1NvSDXpPSeL5U4lnZJnFU=;
 b=ksoghnF9K5H/vx/bizg6wxK95GlE7+6q8EqcZByuNaBz4LVunJy8vVofbCLp7laftnUfEbjBxALHs2dHmC+pyphNQE6k1ZYILnGB+zNC1slvpr2xM8FR+0WpYLXusXrpLq51Nr7tIGRrXHvdBwKHTPuNSvYVD+NefVIMp23eKp1Yy8lbmsuKS9f3kvYdng1jWxNs+cMKxQCF4RrmUerY2hvuzO27NCb1U7IR6/1Y+zLDqDs8XHBuaEDi14XgecWsQ+L0t52PSeskc/e/9cBzFRUpGaf0wjoL/lLTfl8ZWVygLR5YQ81vmWBIvoAMdtLhIo92VnpyTBl9/i73UbIcpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0HUf4HJkx84wehooDLbcZ1NvSDXpPSeL5U4lnZJnFU=;
 b=i5/TRGGBc+zOd64QTHLKoyo9ZpQQKCaRvp/Wlt7YN1XnPrVHXB+Eouyg5bBLUGBDVvSIPNZPqoKdBLJTaYB9qEKmDomcDiEVIltO7Ss10gb/6DMgstE8V9+23x/GiTGANhauNrNmjDH+G28m0Mxujf8Cj8ZD+Ybo9fEg5EqRRV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:25 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:25 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 2/6] x86/vmware: Introduce vmware_hypercall API
Date: Wed, 22 Nov 2023 15:30:54 -0800
Message-Id: <20231122233058.185601-10-amakhalov@vmware.com>
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
X-MS-Office365-Filtering-Correlation-Id: 383a9019-2392-42f5-c79f-08dbebb3248f
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ODm/b53/SUCZYHkr/JXTJoReV6WGBhFnttT4y9gG4ja+Hv48GDVVSMTIaEzVkQkgr2/6+/DPW0JS6vQefCT3Q0U96/PutoiSRrMv4Vh/Ud6IbnHkiYjFyAzt+/dw7UPRaXLM2D+IyjmBrmZdlcQzQjGHpaIpFwQd413vml7jbwO4Ls10rXBWtqhFmBKOM8r4cBNDUj2AKJ6fBnrKcV+3eNWFDwMeKR6TLezz+qiuHChMFEcRwo3lEMI1YWQo2uZK/wgw+9qYqrnS/sRdDGnOcHrMhLPFtn75DMbiijKxVJ1BYseHBG0fSRzpLCemPSauuwLS+cqKg5AqhOWkv9LFMPkmjx/JUDeisf/bjkWXVBFoFVULC9xEh2VTBdxAgfBfXdiMqjB0eLcfClSeDQur1wODhjYPQ6Jc59TP5rqbkiobD1B84bsVcqX+aYNPOgvTbhIceNbnNj9TXx9o85canZEG4yZr3HVg2VLjUBPzehlsnNg/r71Cu7iiWZL+3MuTrEs3R4FRXiCTbQ6ZVdaDAPa3mtQFKj1UYkoQeFkPO1dZWmmZjYPr3fQ0nQMdVENs5JA9TGBQxq/+iQDPJHsFlUhU3/SPSDExJ1Ih+cZeEo2Mfl3tsko91a/YWS5OfUMg0dEYgDyYPGtixtromFpd/cEHeYnLOAkrRgqQ18AZwCCjN8PampBArRnvi/f26In7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(83380400001)(38350700005)(6666004)(2906002)(30864003)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DSW/+cm/sqdQ+mEbj7tRcXqZbkq4VljW0+AULmLPDLqTv1RmnOMEOC33Atmu?=
 =?us-ascii?Q?zPnqrOfMYrH6dCn+quU+gWP+3TVCWRDQl8IMpni5VXbRwfXHnM8sLYiH3739?=
 =?us-ascii?Q?/Rw24eVE/2i3n/QcWDDxgVH+DHzNxBKJmM/movyfDwZVuRdhAARUkgdmJjD/?=
 =?us-ascii?Q?MBPRMOnz7m9yhEbKXy/kBPiWTUXjizTGm359yLYGGbUwvDtTXXVEqz/jCH+W?=
 =?us-ascii?Q?HiUWovTwUsObIuNevO4fwbWQMMPNCDCQ65g4tKqTtTaxzkgNNv32PWKw6aws?=
 =?us-ascii?Q?Kl7xBrHd5uGnFzyk8Tgcz1kAmxVEXwmrnr9LHmJglTvBfoLcXhKv471GqUoQ?=
 =?us-ascii?Q?EoJQX+1ra4s6B6sFFanrVMR4V8Dnu7Jt7TCB3qcus5x6XdOnSG44DVeeWTAC?=
 =?us-ascii?Q?h27ddF3sgeJ6QUF6Prx54EC7BaUBoUV1Y7Gx+SBqTTbdHP/eoeC2YQgzXC5a?=
 =?us-ascii?Q?TTrBSn2tzG7Rske0vCF5YQe1ngs1yMzFEbWhOLszwwqXBlzQBSqloDHP59p5?=
 =?us-ascii?Q?ioFdkiLtpNEdd2WRFWZXn0CFrSTPFwm1sc6HGwurm4ePUT7R+uO/0pVST6jy?=
 =?us-ascii?Q?pMvjODeDTBBrx/J/3sZzA6g0E9qdgG9TTK7Nau2bzWa3ZzwZ6vjPdwXeiyc7?=
 =?us-ascii?Q?4W3zTrPuGcSlut7vpUUYbV0C4xJHJw0atWSHtGqDQzUPECK13H5bq/JJKSDJ?=
 =?us-ascii?Q?BUt+jDoBjS3iJ4yfjQOL+9eS0Eu6xE05Lgmt9dc9P3iz9sS6CVdJJUk54lN3?=
 =?us-ascii?Q?1nfc1rko6fKDkOqJGpYlK2iLJ23iyf7kMr7SdQGdZlgfXsxK33UJQg5NFGdn?=
 =?us-ascii?Q?JgRN4vGYEuxK49Mrk/9bKTy4TnElo3Hbr2snpxxJIzwVy9Mi7DWEvHns5TjZ?=
 =?us-ascii?Q?qLsEikQd5o+xjSqkZa86yD0Qdgw0vpQtPX6/g1QqeNSJWuZqjQx1KrBSfcGS?=
 =?us-ascii?Q?rhJaH4NhqkSpt3nMV3/aBpajVmyU0HImpigzGPBDgdRJUNwgODBJ1hDXRX9q?=
 =?us-ascii?Q?6rPuzGh+gFMMtL/hgZmaiKNbofd/WssKqwvGV4YZt9tGY7iUH6o2Buf6WkYx?=
 =?us-ascii?Q?Lpuc7v1/VgkxtJPdK7zPDMgpgh/s0CeWzcni7Iuby2hjDXqcLA39wL6OXhJF?=
 =?us-ascii?Q?kRHqY4dxgMR2k+0wFvXWzg1OTp0vfIgl2MsorqicIq8GB25fUF8IvQkpdMHv?=
 =?us-ascii?Q?3qdiEdX4ALz+I1++9g+QIjKv79Mfy7kI2TnI0XfYZ3GgjNsyLKdHINJsZPNq?=
 =?us-ascii?Q?H5N/egy/A9gr9PctD17esTlCainfigt4JiRSbfvc2Hm8s8rHJnWFayazwG6+?=
 =?us-ascii?Q?q4NC9rKzZCeHnHll0VEL0gLFww1QmXa5XBS+XsJ7xaysDPrhgDfMwp2w3Z04?=
 =?us-ascii?Q?LwqQmbnnWjeSLjXt6tjJTgP7VjkMwYGLAZi8uk4wkEl7yvL5yfvF+TfGXe2B?=
 =?us-ascii?Q?4H+9uLGxc1TiojIYpxpqyPnwSReo0ioTTFTJFNtDptMbwBlgLOZLsd0EAVKC?=
 =?us-ascii?Q?aa8TdfLoSVVfYfEBOrSbXv1OXmKAuayuKUaZSJS5Rldp46xL7yCWGu/2vqC+?=
 =?us-ascii?Q?9ca8n/JbyBXSaOoE6DPhEJVD5B+LYCUieag9ttTm?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383a9019-2392-42f5-c79f-08dbebb3248f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:25.2289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y53dzV2KOC3441P3NSa4fPmwqY4DxItZggJJzLmnoqG03oVry675Fb12A5+zO82Jf1ocxGMjbmUEDSgyY3WCZg==
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

