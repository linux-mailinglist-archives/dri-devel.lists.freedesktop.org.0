Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D1C3DC20
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145F110EA02;
	Thu,  6 Nov 2025 23:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IhYvVmmk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595EA10E9FB;
 Thu,  6 Nov 2025 23:12:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuPNuqkU8fTq9AQ9QJg0RSgfFWkekiDj3kFJG5HqYqdq8aktOm5Ee40Jc4qg00J9/5kOIIpS7sukPj4xDMuo8sbnkYsgodaTJ+PomBhI1Qj5uz2G5tnVEgbuoRa9z9nEom7wRhnQ4sIBsRqry7YLMLX5oET+sIVUZRY3Zxrs8lJsvoRqncHcbPE2M0lm6d0sR83Nwq3H1Or1en1CPUg8fsH3cxCivZD8CE8wGBSo9n7oZxZTGgwP0EYXiGDeKVAHcb0wWuqFZPlefWbICf5lJJq6wBMiI2m0CHVge/pJIH64TewiuM2XdL83Y1k61odrD1rYUeb11Z/2N8JVJCYU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXNWnz0rdTSFwjJBYtE54UQFRr73LqcXN7kBSUVya5U=;
 b=Kov5x1I4KVm0nbF83xrQVHkw29Sm8vh6tqbyDeaJbdEtoZ0Ho9vIYf9lo4Gs2aDnIsxTwdNDPHxxw2MLdJv85q/0JCtpSKFUjxhF/kh/cZSewBX6vffuy65EeUKMQRkFNJjCgEd2zw1dVCrhZ4kT90orljcpX/+cef85PELNXK06xn9o+mS6va6IuWAIUW85weQobViQbsRnOgs/fuVvAJghrX+V1ZIgVC4y39t8lkCyH8bgQKRbNHOtRQjAhXKo52yANtni+VyZ1X5t3SPkREAKURIaQrvsf23yNcmMLqdI0p8CyPkhXWzsAgNQo9eozI19UogStbmshePRrr5zdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXNWnz0rdTSFwjJBYtE54UQFRr73LqcXN7kBSUVya5U=;
 b=IhYvVmmkkfVsNtZTTXhnEsSbcCVuJvRZLCwosqxHIZfoD6D3e5XVJ6Z+W/5ZxUMmSYV9AqpjMIt4ZaxSy+y+t5lKbKqUQWQJ5hMIqeq6Gp056St8MxuLsiuUr4AaneHRRuRFL+KwD6GBC4t1+PpaJ42StwaLuYbMBxvaiWGRaYAA3IWTfzzTdubYx223RFrpjw73GxNdx4hUqIpyJsm1WPW0c0eYKU3+CfLNp5W5YEv0Yn3dJpubbwBGRPMwrpkvA27O3Qb1B8h6L1gfThpZ/psClECEdfFAXpIjF4S8pkt9Q5khRsAUObjoiBePFD7KrCg6qrAXBmvd96tgMgCc3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN7PPF62A0C9A68.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 23:12:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:13 +0000
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
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 11/14] gpu: nova-core: sequencer: Implement core resume
 operation
Date: Thu,  6 Nov 2025 18:11:50 -0500
Message-Id: <20251106231153.2925637-12-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::21) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN7PPF62A0C9A68:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be9f1fa-da9e-4d84-d81f-08de1d89eb72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0tUmPdevzCGipAQaqQ3soCzrz6SGWf2eAdfBoZyr2Whj37xJZ/b1dv84Dpff?=
 =?us-ascii?Q?GHs/MhLK/gNpqrz5eorKyuNNcsFgRXTDjqxV+n8KJD7OU6sniqqobOkDFO+e?=
 =?us-ascii?Q?Oa9SEcy+YAlIvn5OnENThCQasdpyCnLJevxRfETeRxazpc5U2CGYLeZuwIEV?=
 =?us-ascii?Q?koavk59VmYHjJRtHQYtUQKJcrsuhggEwK8kxTSBJ+Om5DrI06+EW0Z7K9UoA?=
 =?us-ascii?Q?TBXqmfgwP1HIenjrGInhSS3AvDL73T9oWNCmo8v9SSNRxFajFnse6oMz8eaN?=
 =?us-ascii?Q?IKWqOh/6ZYvTN+QIpwkXh+JC2xy+ZIZ2PExUo5yRc3e0Ry3N4uWKVKUh51Ml?=
 =?us-ascii?Q?gfgQJAmdAIJY/ziQfpbklGVEcQxzliNG2+GbE0E2EH7D4tEdBu2irgvF0ObG?=
 =?us-ascii?Q?E2EnWyUB22Zna/n6/AsCqi7i1zeJtOOhoiwQOkVTDcrv2k/pIyrBk18MfNHh?=
 =?us-ascii?Q?7CvLodd7Gd5u903v4j//dcAOmhdratxfp7aZixYnQWjgQAof//KLK4ZMH/g0?=
 =?us-ascii?Q?9fRBHTYS11gCzGN7orQSBN/Cvtsfu5elH113e/lFI3H3avkHbP0pEXnDnLWq?=
 =?us-ascii?Q?K2fsrdIoi7VUojpJLopSoh4XpzptGELDzk7pVH6t6iiQx3vUjEgigI7CIU8O?=
 =?us-ascii?Q?cmEy5IL4dPat4V4AHY0G7XqYtStfjkUwKAlwrUPY7P8vmM4G3A/xyerTBW4O?=
 =?us-ascii?Q?i/WALHd2cvGdirsKw93BJak+wQSgSdRMqXrvmx8ngQaEY1AZRTK3O9kfW/r/?=
 =?us-ascii?Q?f09FBmDoGfbZhRGtdZescD1LLhWjipAowE9gub5t9twdfmdvN4ALl7bfGZG9?=
 =?us-ascii?Q?cduy2EoxdvL4QpSetGmV1MkExoGGa+jVuvTnVnOQehQjit0fCQOrL6k0Xl7R?=
 =?us-ascii?Q?teFkQ1lHbPj/a0DL2+NjTFHe3XwgzjFFziyGcAkZKROg9aScwhNUISHParyR?=
 =?us-ascii?Q?7fcH+w3p3Qh7csPmQOVeElBCXhwlZFxKxKUF6oG3GeMjGTIDolMxhhqB11ps?=
 =?us-ascii?Q?5Apn5Lz63VAuQUexQHXB/eyx7Jdq+B5ZWEv5Bl5PiWNcku9AojkQX8cFP6y7?=
 =?us-ascii?Q?g6FYa18KgzTkIBxZwhBO7glme7N9Jgtz6jx3ZA83UGu0K4IH3ZFuz5sN/gDr?=
 =?us-ascii?Q?gQmM4XhLQdNaWllljGk9qWv4tVcSbk0XjKowDVNcGFUr307N1JyBMRB6B/4g?=
 =?us-ascii?Q?C4bzJcaihRuDJjVlE5i9f7zwc0KRNYwv+Xa8oy0g1w7SYOJ9wwg6/a4TiWGl?=
 =?us-ascii?Q?RYXGoUu/PmsMvvlIR4R7PB7VrffbWy8e7gLQpgKLIEYoey6kjijDvzEt4bTh?=
 =?us-ascii?Q?7n+9LwDOLjZcrIyvGexfqV/Id+h8MF2HaMg/2XwNQhQGVAQaMbOhrT7fNY4I?=
 =?us-ascii?Q?aojFQosujBsBkHdpPl9MLOGGZWU+CT3Kjvv7eaLgcTX2pc5ImVZfUnmC+Itm?=
 =?us-ascii?Q?jLHmfbgMtiJWK8EsHbG+YkECzyt67hwt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jtmsEjcdVPy0Nm065O6cjUe4T0HWka+KZFbGe9KrKXuEj9aRJTC0kqtNgEtZ?=
 =?us-ascii?Q?MAqGJHczQb/Yfi7qnG6/+XGMTRS81v4E167TrleULOr1dgjGITd7EL4mJL8g?=
 =?us-ascii?Q?oW3SUFvZHFcUgnph/Pe9swW9PO7HMEE9vdXF1RdVPOVqx/P+lOxsLsdEeXPg?=
 =?us-ascii?Q?ICl99wGbNFXT6EOjSMy5B70MguGhXE5OjDVI0LqmaHWMvmtYmhROcDQdoXgZ?=
 =?us-ascii?Q?vyNhcesGWSKCy8+v85GSOy9uPBGYawECrn4XJ/Fm6uB4tHdslmgWSvqqTlvp?=
 =?us-ascii?Q?2vLBwKY0zlM3WNGPO78q6hu1r+Pr8Kg5Sjg4vRh0w9GIt+yIabwlwnW1SmNb?=
 =?us-ascii?Q?jQ0WgQWCOr43adSlPmuNnFCo2tbJ9tJ5bzCAQgW/XsDBud9VHnIHbnRAWEcm?=
 =?us-ascii?Q?Mhm2qxmBVATtuSwj4GiTO7e+HJMG3J/zx5BB5ondd25xcFt+TIHvy6Vugxhz?=
 =?us-ascii?Q?vxeKBLnMzw1sNpov5lFZ1B+7j49vXCUKMI8YbYtbjdbovQO66O4OSODktYba?=
 =?us-ascii?Q?FP2oYrcXWIpyi2lE21kAg9kffb1oFhPDGAVUCV67OuJkeQNTwl7j01IsxAO5?=
 =?us-ascii?Q?LUHVv4qDd79YjsZfgxvClu/pjyhnUKKqmnXBBYBGxK+D+6vlRbgHBVFK6XKF?=
 =?us-ascii?Q?hB/qGJFRBv17pLPlh9TgJLDN5vK7hAsdmHo5YUH4uklHbrSgEndnZyzx8r9G?=
 =?us-ascii?Q?Hdak7W/NDNslNKiGsIOZDCwxtWIg9oHdmFE6wRZN71HYrbXZpb/a7a3km5dR?=
 =?us-ascii?Q?GXWBPHrqt8amzycuJkliIJIGZSTbjv5ItzBWFOWJQPMnrsr5+YrsMDz6B4on?=
 =?us-ascii?Q?AP/8b1XPo0KtYVro9g4U8grldsfYzYovxvDKauoWryrONDvYsJaDTFhStKrw?=
 =?us-ascii?Q?GUWVs+wc/6VsTVA5CH2uFrpapabRIa6ewOSAgavdJ07pTz/NY/b/19PqmR0W?=
 =?us-ascii?Q?lGP1P7YIPF0jb39JWqCggLbI/OLabEe2/GAlmYWcTTZZ/kyER7Rp60GZWLwM?=
 =?us-ascii?Q?wnI0SkcxYwDjUQDmZFII12PsMITT5mINcEFdgDUp//VKTUT8mgQ9+b9Vd/qI?=
 =?us-ascii?Q?PCFS4UC0vSR0Ptd1Otg5PStM5GXWFkC59UA7i0gg0Sm8B7eLOqSHygJdnohB?=
 =?us-ascii?Q?2vR8PGXN92OjxFKkSN8Zo7N+xJk1GFdKZwtY7336OEdtNJTgu5MgpeQ+A/q5?=
 =?us-ascii?Q?RD9qd895DjjJQgj9sgrS07gx1mSIGLxi5+QRG1jz7rWj9VfxALymqzsV2ZOp?=
 =?us-ascii?Q?ffgXsFatL0Ia6DYRmLeEUWSh1VnUq7jdtbkfhBNwtd7JzEASZIUJBa+C4oKE?=
 =?us-ascii?Q?FLe0GNkEepgQ1gD8P2JD9GOhHil7M7zVg/UHBxu0h5nZsiqVMGgSO4ImQy6h?=
 =?us-ascii?Q?o1/jEPBVo/EP8lfaAiJJjFg1/eEIYMjFddNPfGGvzWmmyxQtGNc2PXOL4M7S?=
 =?us-ascii?Q?ucq9hXQ4h5t53Qpyp9o9qH3A34gjErlHrPxbgx7HiheQq2DSFwQ9nlQZQX5U?=
 =?us-ascii?Q?NwbneWkz4m/9DR7q8mhBuz1Q1NBd25Ih0iCkgYYDyzGaRlzgStviqKjaivXk?=
 =?us-ascii?Q?8XJOWch8ZJYRaHpMTPrtuUDBFykqUe4p7a49LmQJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be9f1fa-da9e-4d84-d81f-08de1d89eb72
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:13.2718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62MjhDt2aNi2S6Av2TYNMDWKrZdKnDauIik29Mqr+Rdvj3FUTU9KsAAO6xiVHIHGe9QofgBrs/IsUCaZCJ8gGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF62A0C9A68
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
index 0192ac61df4c..3b4796425d0b 100644
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
@@ -227,6 +231,47 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
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

