Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0573CB37D9A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA1E10E77C;
	Wed, 27 Aug 2025 08:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b86uS4b+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C5A10E772;
 Wed, 27 Aug 2025 08:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2bRQA0MWnz92pPARo7LQ7GhvC4rxuj6hPSyqBf3JiI+fb8uenFs437sI0VAWFGdawUOFDcOWwDIiamZG187rLXu7lu7Hgoi+WYimU+KpLO3k2k/SVbwPkhHWct1p1TJ1zMdOzCYbdawi+1/2OUBmCaAP7WQqrxhJqa+wAYuvxeowwy2wNA4g0gqc9jzQoSth6y6GT0uVUXe66Wxe+XZpGIMw8tmmVMgYZIW58ETqpfVvcue8OJV0sEE+VQdpv6IRKVTvNxhgGvqnIHiAJwfDKBGLG6+IMKnYPf0+wcjh422b+S0zFYqZPanv/YawYitvpSIZVqiCeW/RG9Orsoaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z05PtgecVGsaN19TFTh5R3zcXqX4Qv+6BsO51OPXQ5I=;
 b=fQ/C/G0k1yhU/77Xzx2SUkY5qkawejj1ovvbdrjJ0sxs6/FgCFvXoH3JWnrBzkthSQgRcOpG+xM4vkH4l8y3Q21jLcF8P4PL7tkFSaH1bTVB3AUj7PwqQEnALoQch/PzfeBKrjBxfBYuYxDzg8dPyaGhPXm5Rh5sNwyMe4g7lIpZ8pzqbdxXR7ssLnCw2GGAWBtrUZOhXGIkwTxfsRAKNJ+DPud4Pddj3jPTqYtzASktbWKXUBNCOXMMrKgPvOU1fG3iMMJYFbrzy7E79JPc8UVRWbzUqUDYloBS7fmV0i2PBaFZUv6g/X+eMq/9ukE27WSxxUG+xzhD8C0JUbGfzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z05PtgecVGsaN19TFTh5R3zcXqX4Qv+6BsO51OPXQ5I=;
 b=b86uS4b+V5DdEYWBdSeIhmmi5QN27nBrgssgZums2GPPAJOgz0TK8iYRdP7z5YIAWV7nypVp/I6iMD11PLePqqo7csXrwz03h9M1UHcs7xzaoyS3dmpQBR8KujsW3mH5x74shUaa0PmDi04ivbl/bmQ/ZeH9N5GpfuzPLJHO0JfV416hPPU5jX6u4crDKdtWtd3JZzQbPUOA586p7H1ZHeBYeaEBVLAHFjwloWxUlogS9vR5b5kQ8KzGdqPMOdHqiUmN8/+skwpeAV/iSIHs3FfamwRQAGtr8bqQxVd++1708UIz7tUAOdo0uoSNXJZPf/JPHS35ee5U4DQ159jSCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 08:21:13 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 08:21:13 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH 09/10] gpu: nova-core: falcon: Add support to write firmware
 version
Date: Wed, 27 Aug 2025 18:20:06 +1000
Message-ID: <20250827082015.959430-10-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827082015.959430-1-apopple@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0005.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::10) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: 677543cc-73e7-4beb-b9a8-08dde542afcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hsKCIYt5NDxk0ZZNKkpNlschRYFGxHTbQtg81BPIg4JXDeitGjI8MHXhP4cu?=
 =?us-ascii?Q?dZuDio/iJOCGiuV0Fkxd6Ui5al1z0wktg8Pc5fNLMwdRRxLOCuAgP9JtY6j4?=
 =?us-ascii?Q?lFahdKumtXGr+rZRpdSfr1iQQFmAUwoh4UB2wmekUtXquUtlkyj3tyq1KuY6?=
 =?us-ascii?Q?WxSX9TJndo3srvlSy273mbSERppt/YnDfTc2qRcnomC0lNAT7dJmYdpo/FZU?=
 =?us-ascii?Q?9bDiu0BaRiQEyK3+4x0OFrWVAqvWVGeQPJhYWFMRZlfZT8IC4cWvY/M/V/bq?=
 =?us-ascii?Q?H3TqQObtcGH2H2E6bEaN3Ue1SbVDmxQASo8T3XbaidmO2UfGOF8Bge6jA8NH?=
 =?us-ascii?Q?3Ia1II4A/roit5FQl8BX6Hg5vLJfYLEeKEFbH3CBqdh4X/LzAesIJvK5P9ei?=
 =?us-ascii?Q?C9cIEf5J7dUmTZVWFGg7kUZn1+Eb6EUlowqUvKiY5TIlyhrgOUxDIgu0P6YL?=
 =?us-ascii?Q?TSCOFcEw2DrFtS8pxvISCVk3tA5WVIcInaPcuHimePU1WyXxYsDIVtjdu/zI?=
 =?us-ascii?Q?k5S0HQhckMM0P9sqEcUE0dIvr+W1GN8O04bFOKKfBjbRBK8aQNEkAlPHcSMp?=
 =?us-ascii?Q?6Ctt7U/Ug7xz4pJEB42N732tYH0NUFIF9mcL2t04vNnf4m6rC8T4mndIaEuT?=
 =?us-ascii?Q?ERO4LHZYWOd0i2Ze3juFMDULB3farLmpO3/ukU2bIaBo8Q4a3wblEwP9Lmji?=
 =?us-ascii?Q?+UzyXoNR8AxCBwiXO8XESCK2w2PYOsA537ehPGgCiT1it1+IIzI2E8eoOPqq?=
 =?us-ascii?Q?c4nbmbRs8w7nEKSsh8Po/kgFnjWjLO681RiCcarsp4/gs8VohkEZBLT/riG8?=
 =?us-ascii?Q?vfzs3dxvPNkXoUSgas4pzzWrWv/E/okEJCkBc/WEhUOnNc3f0tj9h+/hy68z?=
 =?us-ascii?Q?98pVR0oa85ueXoap8iZG5TlARbOzxbGWlWCyMPqdIhyIN0qLLsXzsIeMsXMO?=
 =?us-ascii?Q?macO+B0xuRf8bvRNBJ9ONe9TS9pmeTndtMPMLzxL5Kjk7u06+nUBZ45fPIQ4?=
 =?us-ascii?Q?LfvnyyyjGN6b+87ams3UulDkH4GOW6lDI6BE1LeB1F0+ocyCqIM2nZ1s50Nv?=
 =?us-ascii?Q?FFhrtsnrZcHriOMZdVlWgFVa1O+Uk7ySwZjcGoiDryBbe1YDg9F+uQK+BPUI?=
 =?us-ascii?Q?ndnSHnETDh4hlFnn0ZddzS3icYumZwx7edJ1EOEopXFf/+PDA8WEeQS/WMKy?=
 =?us-ascii?Q?m+JVrMBxGSomlOXFjlcy/O434gBVfEOMgTdxeGW+HEC/ec9MvzUPE+nVyCnB?=
 =?us-ascii?Q?RKqbtR/CWsqu96f+h7Sxyn1t6B5lihbEdI0p5m4jolSOVWdMyMCPOH8DOdZ+?=
 =?us-ascii?Q?hU/ye8cOCx1/7ZNVyrNgoUgNzed/Sg9qsevGOJj2zZyUcYslLlG7c1QOcMW0?=
 =?us-ascii?Q?T4KEuaZFwpCPa5zo+wqjy00DRPKJ5K24PxwDnU7JW2tlB66Bfg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oFeyZuQg8jb+XDBZrbjBN2orHOSR8ZAgzG2xB0BJowxenLk027ZJXfDAOeC4?=
 =?us-ascii?Q?IWXApaPf7t2ycLCKjl5fidcRDid3rA1Ht33rgPMGRgeKWSIJhvJvVPJPxgfC?=
 =?us-ascii?Q?5GgUSgcCyXwXohUn2s7hhz0txgqOUDWC3w/JQJ3LSbRydAFFIOrVfI/7IlQv?=
 =?us-ascii?Q?LrTF/69NrQR3fNtEgubor4GkTImj0K9uUUmlwdD5IyUBGKylrCEOpfpWxUjO?=
 =?us-ascii?Q?jvAGs5Bfco/2448+34eEfaFIEfdP6jQqE7Z0/Kpk1FIk+IRsGY0MWx33Zde+?=
 =?us-ascii?Q?b3emZ1sieH1eU20MHcVBmqEuc+4vJ1zWk2TkTr2rwmck90CK4xYIHziTlyEX?=
 =?us-ascii?Q?d3TN4wK1VmZYnsER2u0m5tQAecf8u8zjw7FAx70S/nb9tuIcggZWo4Y8V30C?=
 =?us-ascii?Q?kREbZq4fWiG0KDG4oyrQStkUmlqgGuVVcroeW9axMac3Ps2yuth5RgPY9KXL?=
 =?us-ascii?Q?wjCQ/3x74tS1gmgs6xspFJZyRWi0mIaOwQTqf3RxFXiYQ297cg7idUhoCJHw?=
 =?us-ascii?Q?yLimkV0hy9nm5fQxJoa6+XzAwh91kIJCZ7feRM5rV9fcGrN+cQqixAAtCwnK?=
 =?us-ascii?Q?GjPuSMhGFrYXw0baYIhg9qlGGEFn619EY0HYnW8/dLAj/SNESh4Rz1QZLVFt?=
 =?us-ascii?Q?DtAjUks6WknpEby3EqQztbV24i0MLrUFonvwYEkDY07arOrLMZs+znq4O2iG?=
 =?us-ascii?Q?CXkUiNlOSGEoD4i/g+x57U+q1B9Gy3dsxAizFNbt4tIxe2zXZnnSsxUtIEYf?=
 =?us-ascii?Q?zFrGj+anMk0tZDQVir+42Xzwo8IHWT3MwR/EfkLsdjevZA/9ZGenmoeqE/dS?=
 =?us-ascii?Q?62Km+NqcGKDaIWxSCU4ppmk4XMVvAvfnNVsz/RtFbtR3mdRN5OxA9j9sY/Ro?=
 =?us-ascii?Q?mle6b3zhwuMyEDSIV7o1XcKs12TP+dj144pNxQIrmtmFc3Zym6wKbPZBS+aI?=
 =?us-ascii?Q?SPGM/LnDizqXxgUu6IXINtAoDUva7aYkbcbLTx51w70ICDWGWFCT116HPBWf?=
 =?us-ascii?Q?9DGRnRJm4SdhmGAbHljAZfalBCinZZJ7Ba+zC2zrA6JdkUKruMd0lekmQ6Tw?=
 =?us-ascii?Q?/W/cteJycwAlEUWCo1ki3zWUAQdFw3VAGuUMHiO6224iqcvIw4rz3kSHHxxR?=
 =?us-ascii?Q?Y42xqrerakyFxTo0CciY4YDn0rmrSVfeA9vROTp/iz5OrmJSO17KNHzvKMcf?=
 =?us-ascii?Q?nrFhWJZiz3X2qiqJTblxDjP1LN5lXt+jhxomc26e2SuHkcM1VJbJotlzkVRv?=
 =?us-ascii?Q?bLgsUwy4RHyLh5Ko9/Rl0ZQd/K8f6iOKYgm7VXJC/+8oa0fGv0aEH9ou2MpV?=
 =?us-ascii?Q?mZfMZ+Q3lI8EqEUhhUUNwXF4yVRGkbcXuMurvrnYD2kV9FR8XZYGtlmJ/1uD?=
 =?us-ascii?Q?pYEVzb2oxFY59rvtdmb2uOGNo0l7K1gxxdri0qdKdWzyaRtkM9ip04Z0H5Mx?=
 =?us-ascii?Q?11OiBejIB1aWX3XWNTgIiBUSB4RntWsMLexLxR5ooIqV2cH2aHq7FY4gY+wv?=
 =?us-ascii?Q?wJ6WPfzrBUC2ZVyXTKpHj6j89q4X2Lni9rCUrDkOSliAqLzWcAgryebq7Ej4?=
 =?us-ascii?Q?xW8QtZNAfdYMV+lpYtldhjpTc1G6bkEhwAkXYLH2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 677543cc-73e7-4beb-b9a8-08dde542afcf
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:21:13.8125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKeR8kZLd9SFhRe1tahzbBoHLZLxpBufRyEnN/WdchvaQC3UzFG1TOjR/iWjZwwFfMblkr1/1kS980GD5F2/9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9592
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

From: Joel Fernandes <joelagnelf@nvidia.com>

This will be needed by both the GSP boot code as well as GSP resume code
in the sequencer.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 8c4faff043455..875804499b077 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -618,4 +618,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> Result<bool> {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         Ok(cpuctl.active_stat())
     }
+
+    /// Write the application version to the OS register.
+    #[expect(dead_code)]
+    pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) -> Result<()> {
+        regs::NV_PFALCON_FALCON_OS::default()
+            .set_value(app_version)
+            .write(bar, &E::ID);
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5df6a2bf42ad9..d9212fa501974 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -215,6 +215,12 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     31:0    value as u32;
 });
 
+// Used to store version information about the firmware running
+// on the Falcon processor.
+register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
+    31:0    value as u32;
+});
+
 register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
     31:0    value as u32;
 });
-- 
2.47.2

