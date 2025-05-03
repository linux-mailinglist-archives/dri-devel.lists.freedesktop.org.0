Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CECAA7E59
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 06:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A98310E36F;
	Sat,  3 May 2025 04:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sIHYOwn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7AA10E2E4;
 Sat,  3 May 2025 04:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ff5GizAIeLOujMJrV64rvWVs5OFMbsirDuAi0WVJwPZJ1CuoXUD9TnLs4hoG95yn2L5Bl2kiHdHrt+hyQuUFf4WqdtX0v2R12vI35+Ou4PZR2K2tskQ+SCQeAFpDfEEKOYo+PKGM2qdI6h4eA6QlEcL3lOQ6S/1if8zlbPy25wse1sp3j8yVK3ZVoZ/V13up441jVBO5sTDUFFSyvyuIWnAsfYSiEkyEOsIni11mowjmyd4CtvtiqSSP4ycmxezJLOKEW2TdGPCygc9jAyL1P3ZDGAb8ArGKZNiYTc+xsRJ8EL1Kg0O6ZBrj/dTyhd/h5amTv9lKhE0QUH85aCW0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2DYA742dUvRh92COsTaBpkZHdkC1nxUFQ8gjg6skQQ=;
 b=km+o/WlF/33zz40p9yuWFOWCCgX3T0A09B7xfWjLJk9HhOb+CDii0VbVQ0ZvtqCg1S299m8lW7UKNnsJUF70TXars6rxZZ+z1l+ZGzS9LigVoiwotBYZqQfNhYSWbxrQ9utbyG9sMwsOVhuVQ2kP/QQDKzlPBnuZ4A4Z2qksU2q3UwDMcpiStxUTM7CCBpFXSTth6jeyfonmfJq6OkaqPondvMIj7E0wao2sXsIymzdGE878eXBhjCzcUoE4cqBZp2xXapW/JzLrJjiciiJX61UD9AOSaTKWZgxBlHpII9OpjVhB8LeLek6BsE2ogyfOfjvD2Jdihpf778bCNJigvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2DYA742dUvRh92COsTaBpkZHdkC1nxUFQ8gjg6skQQ=;
 b=sIHYOwn01Z5kBNI92hNqM/61Tuv3yO+qJwHEQrAS1s5bdJCAe0OvW3Wn6MJRWLzHlAarO3Kd2VqED+4hqdczCMV0m8e7m/kLovgzJjoJ7cyMbqE4K0yugEuPpyeoxYeFrg6iZAJVBBgAxDnh11r2JsXP3OgHKbS0cMPo9VLrA4Qmu4egt3OtK+NxfPgxJrGGQmp/ljwviKqDriiuIFesk3KTXfDdsqZvpl3Ix3F3PdcmVDiiDFQhBrVCNdcQgp4qdypGNmHceBoSvhTXMdlgHVDtLlG6ovit23+CMjf1mC8zY+Djuf0df0ndBDYUQU2kH6qv+9ROsPGHAj/jMf4BlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 04:08:19 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Sat, 3 May 2025
 04:08:19 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-doc@vger.kernel.org
Subject: [PATCH v2 5/7] docs: nova-core: Document devinit process
Date: Sat,  3 May 2025 00:07:57 -0400
Message-ID: <20250503040802.1411285-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250503040802.1411285-1-joelagnelf@nvidia.com>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0538.namprd03.prod.outlook.com
 (2603:10b6:408:131::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 487dcb37-4f16-4b4b-de01-08dd89f822ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XGE2YiAtm+NwJV8xhXIeuujftvZ4WXlG7gQ7ahPWGRtrsLIA1//knfHt1Chr?=
 =?us-ascii?Q?ZR3Dx9Ji25jB/l4hjYi/5S/n/MfKOp6llAv3cTosfwUeCPOws/TMtYhztW5l?=
 =?us-ascii?Q?xIk9IkNFTZSzqw+HsH4sHoUhjTTfXbWa+4UXU89JS2KjFbdyeW/yGQRAFrHY?=
 =?us-ascii?Q?c4xptL/aETduUIU/R1+osaTNx+nEcz+Qb/5xvjXEQJ4YKgsbdcuoQek9AVvw?=
 =?us-ascii?Q?jCXxnNMrWH8zlz/JTbyac4QOIDh8lf4ipRS9y5mrehpGqBMOa9JU3MEtPVV+?=
 =?us-ascii?Q?VBOoZAFYl0yYg6KpoO2nqjLG6y1v/x7J1sDa2OyXuknlAr+eaRyFc1y2WFuQ?=
 =?us-ascii?Q?HsK+kx8HqP2sAnUn5Zf9nCUPiSH+Tqx8FhX+zeh1RRfDsE8KrrQI0oW/omxX?=
 =?us-ascii?Q?py6iJrPX8ciDYN2Dl157q+ILZnhFbRKnxUyj063EwAnujIYvCtBaPizCbt+V?=
 =?us-ascii?Q?GA1RFlTEk4RmFJDp+bwNgMGsGS9fqkdw4agRR+ZIylq95WL4ectRa5xcsIwW?=
 =?us-ascii?Q?OWe9TkxnEkH/7voPk8mfBzz303dX85vw5HQdy2gVkSo7SHLoXt+X/S6ivu5P?=
 =?us-ascii?Q?cLbR7w8d2Q2pKgkhhdM7GuJUWsCWDRvIFnWZIl0BtPVZyfJoEDoAxa+5woHb?=
 =?us-ascii?Q?XkmMZ5FD1aKeKQUP8e36KjHocMX77odzZFh44bkLXHeC9XoMM2YL+olw9BC+?=
 =?us-ascii?Q?rwDstDZs/jzhu2cL7u6G8Cqo3e1O/Q7w8sLBZLj42k+Em7sQuGDIQbuoYhTm?=
 =?us-ascii?Q?oiJRCRq6McAdO+H37lhOtd+SzfMt+QDRa1KrAo57yeltgzDW0CE5nmRGSd/C?=
 =?us-ascii?Q?m79t6nWo/Ps5B9gMyjdM5xDTAJ1kTLKcCn6jMu2b0ncEVuWmtuGhzmUCvezg?=
 =?us-ascii?Q?Ohrjzs0agjF4etjrCk1HtqzW0GczpCZD7oRFoL0rAiQwodAeMg08zR92NAJ2?=
 =?us-ascii?Q?iOmoAOK+8yFvFKbDpb3U4nqooJSsWyEdsY19XSIumZ7QZHvqzIr/daDbhdCE?=
 =?us-ascii?Q?mrHZYSvg1fwl+K1Cr+tVxtFaY2hCBLQj3/HFT9aeYBMPKC5VNvqkDJK/QGZV?=
 =?us-ascii?Q?+sbIvETG7ceJ6Gbip5NCBe6IwFoXjUZNvjK2CJMkqfi0CY4UKvfI6sl0zG/N?=
 =?us-ascii?Q?4dZaIkqvmcPKp7L8guISyKvM0wZNJBoL4mYiqQvAKodRyYBwJJiN+RBmY+qv?=
 =?us-ascii?Q?cfXsdnSzgHzYdQ0M+3HatIVrYBoeRs/QTv+A18taZd5jwv1Sxoi2AhGOBgYg?=
 =?us-ascii?Q?rsj1Yh4Iurp/pMquEiD8rDkU3l7a2Bl+9eep3M2kaxPfLcNSniWioRfqkhqS?=
 =?us-ascii?Q?cC5CYXj5dKeA0TVWze4GgOBuB3OfD6bEJky7/Pw1gMOlCtcnywngLJTxEj5V?=
 =?us-ascii?Q?lVOVe+P5xwuiYAoWZLfVo8KROd0ckK2q4iTU95yQoZ4KyahkhjwmvBTgIA3m?=
 =?us-ascii?Q?EDAhqj/ENE8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dvPPVnKxuaqsfb+taJQ9eE4DPlkWwOAeHt81rqCMbz2BXSYafntTtzOCCfYg?=
 =?us-ascii?Q?Tq/WSfB4aHv3wbrZTajtQIjis0slyqEB/lOmlEdIuwXhujyqwFh2quljIDeV?=
 =?us-ascii?Q?DUcRLNnwdnJAuuabTl0Xfaeq1/wp6cZRe6P38niVvXRf1CuYscywSuCCPp5m?=
 =?us-ascii?Q?SB6+1x7xGWx9rvJMi7u9STU3bIPKMLda4xfpTkbU7q8lW9/ihJkDwSzyd8zh?=
 =?us-ascii?Q?EHbOL/pA+PfUxEa9ZXcyEhy1cp7mcGS/Y/8uRLWdGqPYYReRuGAIitlsDjP/?=
 =?us-ascii?Q?/Z25tezc0GTBcOw2MkfbYBIFu09aMlH0k6y7UQrjkb2U0Pculu26ztv9/Kc+?=
 =?us-ascii?Q?vgWYR+IcxH72NdRfvJr54DBoVjgNRAuaXYtEyCHZ2eQWZMjmEr/3ezjjfaFw?=
 =?us-ascii?Q?f1m8BX2pLbiOk0hK4fhn+Lm0iCgKD9pTvKmPi1nGIjLJkEHJ9DvFae5m9+m0?=
 =?us-ascii?Q?RR5VVj1xuINlcTKzKbFkvhNVA//idJivWPYXmJpcU2Y6vnOKOXQSzazc8YZE?=
 =?us-ascii?Q?qNdnkW4J0sjpqTE1bWQES5GpMTBdCVV6fR0kb1cx+wGpoPkuFlnncer0jDI4?=
 =?us-ascii?Q?FpnCSjFeEs2dxU0Mf7EecHJbsymI5BjbdPVlzBHmZsStFupjkVFtxbimrOan?=
 =?us-ascii?Q?g3yneXtBaqi9GM+uGP9NzP/cSBSCbiH2k9bv8ob7LAPVbqHW341k9PBm17RU?=
 =?us-ascii?Q?DZwQh9hREEpYRK0nEpsCCDmNnxm35rjF/Nn1Y5UyY4tyE5mInYNIhG09Z5o/?=
 =?us-ascii?Q?5YrjKvgdGToqeph0iccaGutqEaQDVfn12k2csI6dArq3CoNLMlzwJYpNHZ57?=
 =?us-ascii?Q?QgybwboXdW3rBhytfcKvVrB0pbjwyh+eOiEht5oB+vhxLVWVYVV38snJI0dG?=
 =?us-ascii?Q?qBeCtLMJU9Jz0joF/MnzA1Dd7wM+9C5efHiCd0e0rsSswNxapUnTYU2acDIO?=
 =?us-ascii?Q?PPyN1eIYOYHG6K9icxP7VwRbhUhQsinjlVCweT7ihe/PE0lD3UL/mfmHwJB0?=
 =?us-ascii?Q?DgFoyiLrQ2i32+m0vLps3lhPgqSdLFXnZPktsaUSa/S6B6dEegrAX9ybD7IK?=
 =?us-ascii?Q?gKvRHsRCVGGncQGkq/D4s/P5JcdkYCkZEMWMEraO8e0AqIT2Xqpt9mBaFigY?=
 =?us-ascii?Q?tEr4LvxjGeSs1DFI47WmV1+FGFEUISjr85/+1tx1dw16UlgH8pc+WkSpwUd7?=
 =?us-ascii?Q?E63CrfqAXnSLrd0kZ99mSYklq4nQ0q8pBJRuLzTwIikSaWBjgv48vJPbfo7u?=
 =?us-ascii?Q?F/w3LN4XkKEh57qRgOmDKlYlXz5DzbwY+FJ1Eqll9xwEqqurie8pArvHJxvX?=
 =?us-ascii?Q?eAv2OUdNzwlrEUiTxo1W9j7za8U9Extet1BtPyNyPDlrzIkxyVk8UV61svJz?=
 =?us-ascii?Q?aA8TNQWE8+oGGYiUyN1YxhfRJ5zCScaolbMp91i1ZJkGXH94V968AGecEYqk?=
 =?us-ascii?Q?izwhnIsl8+gbtunvA8JGEmel1nFAGba4pColB1u9kj+dO0tfYyz6wh9HNhQ+?=
 =?us-ascii?Q?/Ha6SUHIEKcL58fSNhv7ih6mkXUwoFj1Bw+jK07akx1MerxfJLNaTDS7D69Q?=
 =?us-ascii?Q?2sII0y9X4t/LN9NwxtL4badbYzxLIGeKgOduTgdQ9s9XQGIzPcUpBzim97nH?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487dcb37-4f16-4b4b-de01-08dd89f822ff
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 04:08:18.9903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TiBznSPWLkADHgX0sX1VILuMBiqbeeOJrpO3YKr31HIXzItF8WY1alHIiFP69bdCZurjWdYyTHH638G2cI5lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713
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

devinit is mentioned in the code. This patch explains it so it is clear
what it does. devinit is not only essential at boot-time, but also at
runtime due to suspend-resume and things like re-clocking.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/devinit.rst | 59 +++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst        |  1 +
 drivers/gpu/nova-core/devinit.rs        |  6 +--
 3 files changed, 63 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/devinit.rst

diff --git a/Documentation/gpu/nova/core/devinit.rst b/Documentation/gpu/nova/core/devinit.rst
new file mode 100644
index 000000000000..85e7033dd3a7
--- /dev/null
+++ b/Documentation/gpu/nova/core/devinit.rst
@@ -0,0 +1,59 @@
+.. SPDX-License-Identifier: GPL-2.0
+==================================
+Device Initialization (devinit)
+==================================
+Note that devinit itself is a complicated process, subject to change, and this document
+only roughly provides an overview of the process using the Ampere GPU family as an example.
+The idea is to provide a conceptual overview of the process to help understand the kernel
+code that deals with it.
+
+Device initialization (devinit) is a crucial sequence of register read/write operations 
+that occur after a GPU reset. The devinit sequence is essential for properly configuring 
+the GPU hardware before it can be used.
+
+The devinit engine is an interpreter program that typically runs on the PMU (Power Management
+Unit) microcontroller of the GPU. This interpreter executes a "script" of initialization
+commands. The devinit engine itself is part of the VBIOS ROM in the same ROM image as the
+FWSEC (Firmware Security) image (see fwsec.rst and vbios.rst) and it runs before the
+nova-core driver is even loaded. On an Ampere GPU, the devinit ucode (which is separate
+from the FWSEC ucode), is launched by the FWSEC (FWSEC runs on GSP in heavy-secure mode
+and devinit runs on PMU in light-secure mode).
+
+Key Functions of devinit
+------------------------
+devinit performs several critical tasks:
+
+1. Programming VRAM memory controller timings
+2. Power sequencing
+3. Clock and PLL (Phase-Locked Loop) configuration
+4. Thermal management
+
+Low-level Firmware Initialization Flow
+--------------------------------------
+Upon reset, several microcontrollers on the GPU (such as PMU, SEC2, GSP, etc.) run GPU 
+firmware (gfw) code to set up the GPU and its core parameters. Most of the GPU is
+considered unusable until this initialization process completes.
+
+These low-level GPU firmware components are typically:
+1. Located in the VBIOS ROM in the same ROM partition (see vbios.rst and fwsec.rst).
+2. Executed in sequence on different microcontrollers:
+   - The devinit engine typically but not necessarily runs on the PMU.
+   - On an Ampere GPU, the FWSEC typically runs on the GSP (GPU System Processor) in
+     heavy-secure mode.
+
+Before the driver can proceed with further initialization, it must wait for a signal 
+indicating that core initialization is complete (known as GFW_BOOT). This signal is
+asserted by the FWSEC running on the GSP in heavy-secure mode.
+
+Runtime Considerations
+---------------------
+It's important to note that the devinit sequence also needs to run during suspend/resume 
+operations at runtime, not just during initial boot, as it is critical to power management.
+
+Security and Access Control
+--------------------------
+The initialization process involves careful privilege management. For example, before 
+accessing certain completion status registers, the driver must check privilege level 
+masks. Some registers are only accessible after secure firmware (FWSEC) lowers the 
+privilege level to allow CPU (LS/low-secure) access. For example, to receive the
+GFW_BOOT signal.
\ No newline at end of file
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 22e5712ac6b0..301435c5cf67 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -29,4 +29,5 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/guidelines
    core/vbios
    core/fwsec
+   core/devinit
    core/todo
diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
index 21fc9b96d498..bd6a5c57c444 100644
--- a/drivers/gpu/nova-core/devinit.rs
+++ b/drivers/gpu/nova-core/devinit.rs
@@ -10,8 +10,8 @@
 //! 3. Clock and PLL configuration.
 //! 4. Thermal management.
 //!
-//! devinit itself is a 'script' which is interpreted by the PMU microcontroller of
-//! the GPU by an interpreter program.
+//! devinit itself is a 'script' which is interpreted by a microcontroller of
+//! the GPU by an interpreter program (typically running on the PMU).
 //!
 //! Note that the devinit sequence also needs to run during suspend/resume at runtime.
 
@@ -30,7 +30,7 @@
 ///
 /// The GPU firmware (gfw) code includes several components that execute before the driver loads.
 /// These components are located in the VBIOS ROM and are executed in a sequence on these different
-/// microcontrollers. The devinit sequence itself runs on the PMU, and the FWSEC runs on the GSP.
+/// microcontrollers. The devinit sequence typically runs on the PMU, and the FWSEC runs on the GSP.
 ///
 /// This function specifically waits for a signal indicating core initialization is complete before
 /// which not much can be done. This signal is setup by the FWSEC running on the GSP in Heavy-secured
-- 
2.43.0

