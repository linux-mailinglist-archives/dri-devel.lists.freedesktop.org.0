Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C49C29AE7
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5C010E202;
	Sun,  2 Nov 2025 23:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SJf5jgJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010027.outbound.protection.outlook.com
 [52.101.193.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF12F10E202;
 Sun,  2 Nov 2025 23:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8BiaChozXqfjFKZcMe2etX46pVNYF/y4VWyq376ejv6fEQGoheuQRGCYIY/pq08nXlLp2PPhO3WJj9ijzubY4QTpY+9l+Zmbb12ygQrugAzXAdQ6IlahYfr9V72cRjotCcHtyhefcbKby6/rohHd5IoUckp1h6C1EyCsMPLbgJ3Cnkfwey2A7VO5rBnluFfd6jFYO/ZHRryIYmvbtNs5ZOG0dXZg28aWMTblLplt2j7PmIK1h0oG3PsHoWV/g13+GnKQuEErgZt8Wg5PI1r6qSPYSsGNQEwnRey9iHCIEVMDl8VIvU2L8CMlUevJTl97pzvxRfbk1oUo4mpS6dSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9VIQNlPxx4BGFzaIttg1dT5Sc4pwV3Byt5rWrUkszk=;
 b=FrnPizMsxcSP927nPIklLSfxVhUdlsdmQJxwQmBDMvtlkcKl8q7YQ80A5V7Z9MnN7U5UflJ/BWzdVzg4wUG+zFS8Kx+zyIoSsLcY/oqne8NGEhRfQ8aY6Uc3ZecSkiVJ9diYZe6YLpedipZaPWVHvg07EXobthSVSmik8RGRkAVirHNbRDAfJtKtcaDSXn1osHsWT3aPe1htSzaCHKltuj4MbL1OBYcAX0HVCCSyg3Hl/w9jw2mXwXELkkKEPn63PYZd0V3Gpz9kcOb38UzVM+XQU8uhOJi0GDbsgjaNGnUI70ELBmxXHRbUYXJsVgous68KWK8bIHSYuOWX5H39/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9VIQNlPxx4BGFzaIttg1dT5Sc4pwV3Byt5rWrUkszk=;
 b=SJf5jgJNhKTqJIFKUwuMGwfSzryaxBtpF7v59VNsUxclY+z7OixlnTbIpRlpxpv2eHSOA1bEPdQ38ZYC4PQSUgnLtBVSr+H482Cx4TsVGtQ2SS72BXF/RDpeGZPT0acT476oOCQ0fIF6BqXXd39DXyiCw8J0yvXoZX1NJKCbf75OCna8kJFt8VPy7CxXaD+Ye8hdM7pzPH0XwkcSXnIOkqgw+L8dGMGuP6WnYFP7WB7lkdTBB3BUyBmAES5TChwmSAoieSt+W7nivq7aQrORAGlycOZYPjsQwd9EfMuzkn6QFc+jPMNVH6ZIRJP/8t6fqJVT1EpbP3O8DP09hLGUtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:45 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:45 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v2 11/12] nova-core: sequencer: Implement core resume operation
Date: Sun,  2 Nov 2025 18:59:19 -0500
Message-Id: <20251102235920.3784592-12-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:208:329::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 47164f5d-9cf6-4043-ecd4-08de1a6be5f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dl0IbVB4ZnlAFV3pBC/xl+xDc/U1avadzc/BTBp7VvkNbJjO2ssjSi7ib6C1?=
 =?us-ascii?Q?7jvuIZmxGEetpvkvC4xgU7SYJKUAsqW7J3frgW1t/o+MaeNsQnXgSdXdMd0j?=
 =?us-ascii?Q?snt8a+ASx9rWad3FKNlrDPM3f8SHJBSf5g3/Ufi/A98NoHQXdodMH7kLzgEU?=
 =?us-ascii?Q?Qp7HUJnixkQT8q7xwNJZPfSqCp2jeyPBtDtETh4k8l0plqa9acZplaSqEjc/?=
 =?us-ascii?Q?7fqgQBvhG+nj69TwblYHZcUteRCHHQZaE/8aeLfcqBifgJjpc50wHlRX6TMO?=
 =?us-ascii?Q?NqZxo0Xc8tF1K4jVP1q24ScEjEijUiOPSHg/arp9IsbMLRi7PD6BYXeHgxtf?=
 =?us-ascii?Q?+Iyo5SpM3S5kUSXoSRRyswWIswQrr7FE2GaGgReCutml+biShA62PAAYMKGV?=
 =?us-ascii?Q?I8awZJu21S5/Cml5hIqRayBJI5cm84Bqji0BiHj3xgDi504VI6IsdpfTvNfL?=
 =?us-ascii?Q?Ng6xQwFmvfAGLTEnuE71wnjVCx/oIIZ2vU9ax6CE3lL5Casiovhm+JjjLtbB?=
 =?us-ascii?Q?XitcxKFLo9FLNZJfhNgIMG8i3LLu0N925m830SU0frwYrFFCbnGbxIE6A2jH?=
 =?us-ascii?Q?nwatnEV0wBhuE912+pCTUR81/qBQYfM68g+ZRLzm3dOs3qx220mf9hUmHIV5?=
 =?us-ascii?Q?sS1NdcxBQ2U+DHtOAM2Gu8YzxrKcnANgaprYNUXqpy/b4o25O+A68Io/Los+?=
 =?us-ascii?Q?85p1p2W0cQKC/vv/vjzN6O6jWZgK4YJrPYX7QkJgs2pHQuAyFwOOy2SVd3kD?=
 =?us-ascii?Q?mVokbAR9p0dauorMvwNR8A/jV2PDtvGPbSlmU3KhVisXZ3EzJJHuGE/ZbUVW?=
 =?us-ascii?Q?YPamN/ajXZoTyxpLNmdVGXq3Y7Zq926G7gCG2Pg03FLukyHUHQxFDQLs8SwK?=
 =?us-ascii?Q?fYk0NXJw1+5HRGjGKVKserrpc67aYo/lMkJmQaWwBtSfWOu9jM4U2OSPQYI3?=
 =?us-ascii?Q?YHTgsjYcH5U5a6I5VRMYdb4vRA6UBj7MW9ou+imeUJr4tstUG6F5y4BtwhjS?=
 =?us-ascii?Q?rqHLwFlQfNKHtruojcRTsH7gdkopptkeWBca8J3Nm0FBwoXiU2gDqIpQhDJ3?=
 =?us-ascii?Q?CONaCbBlkHGyuG3ufpQi4lPzHQS6GS7THZpsqUF9oCIxOcoYmZHvwEm7LORU?=
 =?us-ascii?Q?Mt4UNvo4pQdzLTTQghBNBd56xDDjf1xH86wrJCJAxAPX7PC+Hcn1pyyicNT0?=
 =?us-ascii?Q?aGTNS59XSsLDa2IVxxOzg95mGA2aYaO+8qnMbIz7Y9WzBc/MQq10DH/a3naY?=
 =?us-ascii?Q?zBnz9/p0z3gQItAmZkSAbBlg/jhLlAwFpYQxsaduz6JMt/dS+ugkNbGsxcV7?=
 =?us-ascii?Q?HgtxSrXHdEE0p0dx/lWPEXGWxxE4mIYA3vTZDozq1u9fo42mefVi+vkF1YOc?=
 =?us-ascii?Q?ws5BDRaQKNxnyf9btLIwbfKPIVGg/GhStFjovTQdwXrPLtxdiD3E5iDdGkri?=
 =?us-ascii?Q?wyK5VgYuIqCz9ETImgFDRYD9p8jMLMq+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IlRGavFw921UuwGRxY1LiVnowQSaoJm4dPBBsDLnNJuahUYUrElxEmrlviiS?=
 =?us-ascii?Q?jsOrYDL//6yNUZ00Omz3w4Xog+mwb5h0xWKpS9e36q5g2o5lNLkmnd3SsfVy?=
 =?us-ascii?Q?BFT0De7kb+GUlicHgRdwhKfiM/BjpucpIF6i6xRHELv0qMv5tosh4P5plEU0?=
 =?us-ascii?Q?kZgrWSTRYOg2Wy4eKeCLM+B4onTVFvRt1CB40hfzsb16l6thsu+f7o0BPo6M?=
 =?us-ascii?Q?CfORdqYooCczbt++bmmqR/5+naudNTjyS6R9VHKagznSee1LUjYZw9/ALxIo?=
 =?us-ascii?Q?Fz0jH7MNq0PjvEhx+9kkYqlcidPCf4CDNwg+vq4sG3NMhTUMM2xkO7fPmp40?=
 =?us-ascii?Q?wSw7xbF5Z6m8/KvlikR10EmeuWx+QH35NJ7kBpHDksmkQIUN0D5vJrHCh3PF?=
 =?us-ascii?Q?HQ+yC0l6/GqAUPiuA0XsrXQYrPYfUWMX15X7vohakYPWPKjJ/9JIgluzNYaK?=
 =?us-ascii?Q?E+XtWim0okp4H01JgCt/ydwkcLZS6gRlFav6sCN4lU0uvZdOQrNNahf2BaTM?=
 =?us-ascii?Q?OSn3W0O4AHM15OHRAICFsVCOEuUnYEFgSL4rVGu74ylMuAzPbjYIwZMLNy6W?=
 =?us-ascii?Q?O36x1iadUbag6fWJWaCecghXo/u8uesWaqYJt+Kg6xDjmzr3TH0URiaServh?=
 =?us-ascii?Q?sXcmQunyHEGOHLgZsDfIJIsX23vB12C6SbfHOomBkGqOVSMTrQXLYJ7x3vSF?=
 =?us-ascii?Q?q08RnOlmM1vYAQZnVM8yFDycjLRjUN/VBIbwX6I9kqcVXdOa/NHZybCYv4o/?=
 =?us-ascii?Q?2x3Ywf29KFzhQTICnKPytyusWqXr+wUZUcyJHW5K89D0qUO30LkIsZR/yAe6?=
 =?us-ascii?Q?5k3IV83hf6YeRq07+hWVV9JynQIPYLeGs0/5Cc26u2jxTvqqyoFOrXObFMxm?=
 =?us-ascii?Q?O0bPu9qmOQBesBdTJyrqVq2mf3KMHHneQmoObiPHkeGOBBctuISSDLjloP0g?=
 =?us-ascii?Q?vOGFDw5qc6LVYDbnkINGtMJP6vY6/5B4M9TehorAm/k2mYvL60yZXSD3mQ+K?=
 =?us-ascii?Q?DwwxopO/NciWcIprF4kFf7yE3U5G1CKjnMiGPorkeIAu0kt0PD8KAvkM09fC?=
 =?us-ascii?Q?wkdwuOAbHqf1ApzAgjvdlFGh8kytpMkNNN0i2RjDJCO41w/gJ2kFRLKhOEbE?=
 =?us-ascii?Q?q1R6MVT2rbbXa0fEMwdBxV4YwmcWF3beLjVJFe3HQeXuagdZZvTpVqPJA+Hu?=
 =?us-ascii?Q?07ZOmqdynizPr5trbZ+oA6vGJkI0YL6XSyT9oKHld/H9QymCZUrxSlqM4FUo?=
 =?us-ascii?Q?Wh3DgVmtuL0uv3elYjPhlLPifL7fWRMFnhQH39KelXo2mQBi+qQ5geI02t7S?=
 =?us-ascii?Q?Kq1Rw4K5ExfgYPIa4iLf1fTfi7oOE6K9AV2/22V/4/zvEK6IxlMdPrKVKJbZ?=
 =?us-ascii?Q?z9k10/jZqL0RX9DBkX65LebgVIVouZJpVpgpDOO84zgHedyy36RXzjbLq9bl?=
 =?us-ascii?Q?/MUMQuDUhK2BKSCmfMu5UmIe9Cca1BUqhHwPwxZZMlFhiQ6bmnNGEvvGn4L6?=
 =?us-ascii?Q?ly0kY/2aA8z7xke94ZPj1FuU+ZS55d/2mDhYX1mBmeEgHXS5PVUwmTUMqGoD?=
 =?us-ascii?Q?1TbBUa5CO7KF3bIFVtVHfSakoV3TqajATGB+4UZb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47164f5d-9cf6-4043-ecd4-08de1a6be5f5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:45.6071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbgEuYqGMmxH0PstYcEQYhWsfAexwQ+jyXw3pzMlK2ArTO++G8eU4qHiAuA5GSAEJXWgylm2y9XlwX1zOT3f4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
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

Implement core resume operation. This is the last step of the sequencer
resulting in resume of the GSP and proceeding to INIT_DONE stage of GSP
boot.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs    |  1 -
 drivers/gpu/nova-core/gsp/fw.rs        |  1 -
 drivers/gpu/nova-core/gsp/sequencer.rs | 49 ++++++++++++++++++++++++--
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index e0c0b18ec5bf..391699dc3a8c 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -37,7 +37,6 @@ pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
     }
 
     /// Checks if GSP reload/resume has completed during the boot process.
-    #[expect(dead_code)]
     pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
         read_poll_timeout(
             || Ok(regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar)),
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 53e28458cd7d..bb79f92432aa 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -543,7 +543,6 @@ pub(crate) fn element_count(&self) -> u32 {
     }
 }
 
-#[expect(unused)]
 pub(crate) use r570_144::{
     // GSP sequencer run structure with information on how to run the sequencer.
     rpc_run_cpu_sequencer_v17_00,
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 127b293a161c..ecc80f668dc8 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -52,6 +52,7 @@ pub(crate) enum GspSeqCmd {
     CoreReset,
     CoreStart,
     CoreWaitForHalt,
+    CoreResume,
 }
 
 impl GspSeqCmd {
@@ -83,6 +84,7 @@ pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
             fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
                 Ok(GspSeqCmd::CoreWaitForHalt)
             }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME => Ok(GspSeqCmd::CoreResume),
             _ => Err(EINVAL),
         }
     }
@@ -105,7 +107,10 @@ pub(crate) fn size_bytes(&self) -> usize {
         let opcode_size = size_of::<fw::GSP_SEQ_BUF_OPCODE>();
         match self {
             // Each simple command type just adds 4 bytes (opcode_size) for the header.
-            GspSeqCmd::CoreReset | GspSeqCmd::CoreStart | GspSeqCmd::CoreWaitForHalt => opcode_size,
+            GspSeqCmd::CoreReset
+            | GspSeqCmd::CoreStart
+            | GspSeqCmd::CoreWaitForHalt
+            | GspSeqCmd::CoreResume => opcode_size,
 
             // For commands with payloads, add the payload size in bytes.
             GspSeqCmd::RegWrite(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE>(),
@@ -119,7 +124,6 @@ pub(crate) fn size_bytes(&self) -> usize {
     }
 }
 
-#[expect(dead_code)]
 pub(crate) struct GspSequencer<'a> {
     seq_info: GspSequencerInfo<'a>,
     bar: &'a Bar0,
@@ -259,6 +263,47 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
                 seq.gsp_falcon.wait_till_halted(seq.bar)?;
                 Ok(())
             }
+            GspSeqCmd::CoreResume => {
+                dev_dbg!(seq.dev, "CoreResume\n");
+                // At this point, 'SEC2-RTOS' has been loaded into SEC2 by the sequencer
+                // but neither SEC2-RTOS nor GSP-RM is running yet. This part of the
+                // sequencer will start both.
+
+                // Reset the GSP to prepare it for resuming.
+                seq.gsp_falcon.reset(seq.bar)?;
+
+                // Write the libOS DMA handle to GSP mailboxes.
+                seq.gsp_falcon.write_mailboxes(
+                    seq.bar,
+                    Some(seq.libos_dma_handle as u32),
+                    Some((seq.libos_dma_handle >> 32) as u32),
+                )?;
+
+                // Start the SEC2 falcon which will trigger GSP-RM to resume on the GSP.
+                seq.sec2_falcon.start(seq.bar)?;
+
+                // Poll until GSP-RM reload/resume has completed (up to 2 seconds).
+                seq.gsp_falcon
+                    .check_reload_completed(seq.bar, Delta::from_secs(2))?;
+
+                // Verify SEC2 completed successfully by checking its mailbox for errors.
+                let mbox0 = seq.sec2_falcon.read_mailbox0(seq.bar)?;
+                if mbox0 != 0 {
+                    dev_err!(seq.dev, "Sequencer: sec2 errors: {:?}\n", mbox0);
+                    return Err(EIO);
+                }
+
+                // Configure GSP with the bootloader version.
+                seq.gsp_falcon
+                    .write_os_version(seq.bar, seq.gsp_fw.bootloader.app_version);
+
+                // Verify the GSP's RISC-V core is active indicating successful GSP boot.
+                if !seq.gsp_falcon.is_riscv_active(seq.bar) {
+                    dev_err!(seq.dev, "Sequencer: RISC-V core is not active\n");
+                    return Err(EIO);
+                }
+                Ok(())
+            }
         }
     }
 }
-- 
2.34.1

