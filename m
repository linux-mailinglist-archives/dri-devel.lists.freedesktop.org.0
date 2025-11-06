Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC4C3DC0F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7845010E9FC;
	Thu,  6 Nov 2025 23:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BAOSUEDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE3710E9F6;
 Thu,  6 Nov 2025 23:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dP6i/RO26FmTH6XSzqNoAceS22CCyDl2atJCSoF5YSQuuS6m/VvLgDjaF8ilcdk8sHVHOxYtWQwuScgS13AelwZ5GTxgd9GpNtxTcX0oZf3i0fOcWTJ1PjRAf1p48M9l0ywjMWW9ImzNJItfbyb0PAwC5cuPjLor3l08VcZJtI/b0chwsMokcSr0lPiw5J4WSAC59KEgDOxb6TWk9v2baSoopdvxt5WFMaRz3TTv70caoSz6nKGJBJ3SzuC+0ofbH6yzNYsinY8UxgefKmAOouDZn3c/iX8EXCXFn7D53f6nd6lOaRq513VtXzkn0CoIMn8fNjWPEvs9J6zsyF8luw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS+fLi2cKCNAAGeKazVN45aaRxnRuC0Kr8JdboiMjhs=;
 b=U4Z/tudr4aPwxfYGhzuZMDpaZDa+06JWdfIMxC8RG4WKGFdqyEskaH1GIJDOUotExwKY5Xs52BbJL8oyKtUtW7yoLG7qDP3gBGQWopnI3Hfw+FMEFEJNs0ele/3yRdD+kEN0KYUDkW9Yj8ZVGDLkmfWkNzNSsZR1lIqbfWlH3s/BDPQpr07EYYGJKDAysvfUEJZkdoSoONxJ1fs+shI+wF/aIZ35MV0yguT6BormHjo033QBoI/dchuaZxOM5XsKe6Icc74xHO3RMnDypsLF/7kDFVI0xilh//od6c8KOs7Moer8Y6ckGz3uFcIpyW6kZIPJmwxT8ZNsxmZG6Kh9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS+fLi2cKCNAAGeKazVN45aaRxnRuC0Kr8JdboiMjhs=;
 b=BAOSUEDUyeeYRIIU/eSAoc4g4e9maSDkTrW4XDmQ4R6sO9hidyjeCKGBAEFCDEqPvFztiIUNLcMKxZatnG/qE2ebRn7+riKrzKFKwZvGKSkK5gmS5bqoKfKG6M5JfmPp0YwC6ot7jZBPqaANLjwqlXAQtu48THamp/7JUAhU4CBzyUPhjSCZZO/KDfhEaq/dbrzXPcBekT5GwrZDLfoNe2w6PNSnbT8Ee60tDdi/LUuLkJBD1arcF2o1GlsPXr1EaRm8XX5kUhD6+7hOWFTqFFk7z+psPpfttK35oDMwGdQdJGbOjgNZ31m3NtqBN5pKMSgPtOITrQU2IYWAuliwEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN7PPF62A0C9A68.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 23:12:09 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:09 +0000
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
Subject: [PATCH v3 08/14] gpu: nova-core: sequencer: Add register opcodes
Date: Thu,  6 Nov 2025 18:11:47 -0500
Message-Id: <20251106231153.2925637-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:208:120::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN7PPF62A0C9A68:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e541c6-a8be-400a-54c3-08de1d89e8ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t1P+CLsthRq+/CwbVj2wLmvb0nZ+ZgbT2DHncXE8ZHGitklc17aeK9LvC+E0?=
 =?us-ascii?Q?tffH3Ay+N/Mih2+lJeSy6zcgRd7SDuOW7x/eQntJkqnkkhqeCsIKbp30NUO3?=
 =?us-ascii?Q?nGn201EwPBQScy+YEqLf9JRDp1aKDdWjsF0pbGvvV9+zII+5horjxnip4DLv?=
 =?us-ascii?Q?yOc6X8F3Kn7fzQNDjNMjIDCBzEBWoCiYWLYsHrz84DcGgOy00IS7WC0i9zp0?=
 =?us-ascii?Q?ZdKJI0WsMK9xNkBhEHk97+L+CFQ5kid7pSbXvnAcPcIx+581mssMb0M5RA3D?=
 =?us-ascii?Q?JbgFKRjs5evGDintKeuT8ZTSDd8C1Ol2j9NSpWXYY547h1z+KXj361iVPc4j?=
 =?us-ascii?Q?VeBuqGBsDaSncRVwIwniMgv+27Q+E4iX18BbGs6QNpcCzRBXi2T702P0dqCj?=
 =?us-ascii?Q?+wN39srkqVWXh6krzvr+W94oBiq5S1oO1g2OXGCSzLMSizEVZHKMS9LxfDrj?=
 =?us-ascii?Q?s/pSWFUUy2Pj7ZGF6O/ViDktgDDXMQ2qzF87R5v299tZEo52kcbeJzYBqsHY?=
 =?us-ascii?Q?61RTGLag3OeqVwG6cEBYOsg7upvEF2lcVOR5hOIx43zB/U/vXlI4yOe+xe5b?=
 =?us-ascii?Q?uDj2Qj20Khj97MNk3Rmgo3QwVpqm9kbUFfhmtS/RBXDSYnXhNIKHmNeiS4vW?=
 =?us-ascii?Q?RUCTzEj+wi2q6PN0iVTNMzk3NmF293mzKE0E2ybjJ9qKTeIH9x6Ma2G8orHx?=
 =?us-ascii?Q?NVmf+uFwZstrKbrG0EFSx1w5qMTrZ9SDTRSIUZvgxiZjRX/hBsPfSz/nuemT?=
 =?us-ascii?Q?ZywTpMb7M5Sh4yZG6djT9H9dbKncikjF6wearxMAMJMSRRA7E5MsHocJaM1v?=
 =?us-ascii?Q?4BsluvIgiWAHhrJtyojkuB6L4ZNfrPuOl5nOqEvxQrfX1l/WRviMRZBgghd+?=
 =?us-ascii?Q?9fBdQhwgpc9E1gvxHypJx2STu28yNMJxDrytHPHJ8TcIWmeMofrxrSYKABND?=
 =?us-ascii?Q?kAx+VHqmAMKZWms04Dqqh0hB1ycywpRsfsuMs2sEeJqrQuL5jQ81UJQumKPh?=
 =?us-ascii?Q?r0sxM1An75uQKw80OMzSOnxr+pIe6t21qbE8g5qKgzVuUZ9lC4MkkSHx5m8l?=
 =?us-ascii?Q?FTPF5j6bHA3KHyYzjaMFXl522LuY3A705e+rie+lZHhtMhuGcRFv5Y4CKYoq?=
 =?us-ascii?Q?pFyFmTcGtlCMcoRlI0/+7FVUXJ779BxvVcoFJq4d9znLQn46crsQjQOaPopS?=
 =?us-ascii?Q?YFkLUeu/5EPAGw4aH/lNOA4t6NGdOyl3Uxf6Bv2mdIBBcZoKwLeyGa8AkLkv?=
 =?us-ascii?Q?6bkDsfvvHGYHzPj0DYu2YeHBuQsTnvVfK/ffWE9EhSeUbbJLPOsxjftLl+Gq?=
 =?us-ascii?Q?eruSFXUayI8iKqMEaizDbKGIDbIhsO00YdFo5+B14+szepyX4Geh84jWOz+1?=
 =?us-ascii?Q?51NVgyl8/Ab3xYQVASKSY8yDlnKvdyeIIlveO0yvd315kxl6IkxtzUBiSZUJ?=
 =?us-ascii?Q?q1UhL6oMLdnYSV/wUMnNniNwfhMh1NFc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p3ZNPT4aXe7ikW0jWJCJNA8bsCnrIqdcYnZYWnGnnjOkssl3hBcMV+Wi+BAN?=
 =?us-ascii?Q?xp24hihciX2SAPti69J+DIgqmRnegjd9+DabIpX3iocrP7wcnU+EQWyAz8Ko?=
 =?us-ascii?Q?20+u/Gk7VzMHp5R60P4GjyKjij5q11PGAbB8qSi3Me/9p5rdrUosXWVMnEJG?=
 =?us-ascii?Q?lDvpzkr8CyFqqK3gAL10sIhZQ5DTDxgh7d0nOiFxTHAFpkJ5sWTlp/PCPexb?=
 =?us-ascii?Q?5AARcjD5hUhR5E99uiY9M6hoYHeMEl9ihBgJ3qXQOp4lIQF/Sj/RopDxeY1H?=
 =?us-ascii?Q?M7yHg2b8K5OweqK9AV2fs7mt1JrRGXWE1GAoe+KuGioyKoQc7ZQUerYrlvcL?=
 =?us-ascii?Q?gW0uOxJ9hY+9U9MWx1HH4a0PG/ypxp4U8op2R0fSJJEXE418Lj9sHWHqA4qA?=
 =?us-ascii?Q?piItcVPY5Pl6oyj4M9qapAQXIuAI9Gag0gGPKNofFvglcX/lhLcd+cEEpMHl?=
 =?us-ascii?Q?wN5v9NvlNgtHLDVwiIB9ABRs0BtAo2in0vKPWJyY/qwf7+OsWGsIdn25ShxF?=
 =?us-ascii?Q?/uI6z0G8JWtBTgBmewQg1VoYn6sO/2ORtmuJK5hXr5IRJFSu9S/0cQnL4k+V?=
 =?us-ascii?Q?IQL63oaWWIYqxOTaLGxpdG+MzU8kNo10vat09UXVTxZsNChKfEBKlCntTOEg?=
 =?us-ascii?Q?UsNX2O8CsMONs0mLSq3zAgYYhisAMkyiH+75r8/RHchvenli85B+PAOi2lJH?=
 =?us-ascii?Q?j0LbZ91JhVBvaBwxFVO6EGl9WUKuLWJh6h9+ecWfqcjWopuoanIkWx5NwmP4?=
 =?us-ascii?Q?6AG+xA4eCHA+668T5/GiSoDAnxavCY0ERC8tMOiRw/T3BZBOy4u3RdynJz/M?=
 =?us-ascii?Q?yC4Aq5B8E8lxqSdTBmgV68g+sl9TcIS6ca4vxsiFIxenmizNHB2kFNFZeRyZ?=
 =?us-ascii?Q?9Z8s/n1Cq5iRjo1icjDtk9cchKIdYJ61/c8lj3yPacf4grhogG01QeYJG3M2?=
 =?us-ascii?Q?paPpNuiUAozr6+8SsYRpAMwzoVWSqS1LmR6FiQKEV1vTCTgWg5esJttz+irY?=
 =?us-ascii?Q?uaqzVAmQATB21Hj96SlEbuUMa5UTbCpAEQNgyZeRRTfcPpsnBnUk9gxPrf+r?=
 =?us-ascii?Q?nnGLh9BqXwWgKCQtrIhsxTAamlPPEkhQVQ/k9dBcNko7BTBKVAch4t6yggAk?=
 =?us-ascii?Q?+EOFubR5XEkpsZ8ohKiGKlyj/0YX9/F7G5vCaOiD/j8hkV0RJpixCxYhFwir?=
 =?us-ascii?Q?E4/AcaqBU9KfGZ47NWEjyzPkvOAEsVftxByM9QEUGVUDx6C2tFSN3o78AGMQ?=
 =?us-ascii?Q?2l0LkzZ9Nl7/+NdqM7nlCtoKV4J5Os5rhxgEOT4tXqd90AUd8x0JY7mmWL4M?=
 =?us-ascii?Q?rPLQDqcEx12ZUq+lPJ3bKK15D6eyf5Uo/tXa+7al8NpneadEvsMaAVmWR/I+?=
 =?us-ascii?Q?F69x1096Ed51fsKeoket8+JBuAJvtOb9mptthxWUooKHY80ZIoOJZg7kO3IP?=
 =?us-ascii?Q?MlVYkJ2ZHcKBRHCSKsxSmY+o3+8RqU5QhjkNkTq4OXRdksYkEyUUDOkBab1P?=
 =?us-ascii?Q?bRK+/RWO1uK07K7u9kJnLj53GkMhrdFdk9AWAZbrdeCloE87PyBXp+CM4ZOC?=
 =?us-ascii?Q?cghUIo9eocUSzUWGUtFfGYANpeqRfqSVvG+ac5+w?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e541c6-a8be-400a-54c3-08de1d89e8ea
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:08.9679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bObcHxZsD8G/rhCuNmaS10fAYUdT8NAE6Sxg92gljESs7wWfJTOOSzfY92L1ILwjo4HPQhDTrJ7ffMXmn4F+Vw==
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

These opcodes are used for register write, modify, poll and store (save)
sequencer operations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 106 +++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index ee096c04d9eb..32a0446b8c75 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -5,6 +5,7 @@
 use core::mem::size_of;
 use kernel::alloc::flags::GFP_KERNEL;
 use kernel::device;
+use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
 use kernel::time::Delta;
 use kernel::transmute::FromBytes;
@@ -40,13 +41,36 @@ struct GspSequencerInfo<'a> {
 
 /// GSP Sequencer Command types with payload data.
 /// Commands have an opcode and a opcode-dependent struct.
-#[allow(dead_code)]
-pub(crate) enum GspSeqCmd {}
+#[allow(clippy::enum_variant_names)]
+pub(crate) enum GspSeqCmd {
+    RegWrite(fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE),
+    RegModify(fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY),
+    RegPoll(fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL),
+    RegStore(fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE),
+}
 
 impl GspSeqCmd {
     /// Creates a new GspSeqCmd from a firmware GSP_SEQUENCER_BUFFER_CMD.
-    pub(crate) fn from_fw_cmd(_cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
-        Err(EINVAL)
+    pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
+        match cmd.opCode {
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE => {
+                // SAFETY: We're using the union field that corresponds to the opCode.
+                Ok(GspSeqCmd::RegWrite(unsafe { cmd.payload.regWrite }))
+            }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY => {
+                // SAFETY: We're using the union field that corresponds to the opCode.
+                Ok(GspSeqCmd::RegModify(unsafe { cmd.payload.regModify }))
+            }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => {
+                // SAFETY: We're using the union field that corresponds to the opCode.
+                Ok(GspSeqCmd::RegPoll(unsafe { cmd.payload.regPoll }))
+            }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => {
+                // SAFETY: We're using the union field that corresponds to the opCode.
+                Ok(GspSeqCmd::RegStore(unsafe { cmd.payload.regStore }))
+            }
+            _ => Err(EINVAL),
+        }
     }
 
     pub(crate) fn new(data: &[u8], dev: &device::Device<device::Bound>) -> Result<Self> {
@@ -64,7 +88,16 @@ pub(crate) fn new(data: &[u8], dev: &device::Device<device::Bound>) -> Result<Se
     /// Get the size of this command in bytes, the command consists of
     /// a 4-byte opcode, and a variable-sized payload.
     pub(crate) fn size_bytes(&self) -> usize {
-        0
+        let opcode_size = size_of::<fw::GSP_SEQ_BUF_OPCODE>();
+        match self {
+            // For commands with payloads, add the payload size in bytes.
+            GspSeqCmd::RegWrite(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE>(),
+            GspSeqCmd::RegModify(_) => {
+                opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY>()
+            }
+            GspSeqCmd::RegPoll(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL>(),
+            GspSeqCmd::RegStore(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE>(),
+        }
     }
 }
 
@@ -83,12 +116,71 @@ pub(crate) trait GspSeqCmdRunner {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
 }
 
-impl GspSeqCmdRunner for GspSeqCmd {
-    fn run(&self, _seq: &GspSequencer<'_>) -> Result {
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr as usize;
+        let val = self.val;
+        let _ = sequencer.bar.try_write32(val, addr);
+        Ok(())
+    }
+}
+
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr as usize;
+        if let Ok(temp) = sequencer.bar.try_read32(addr) {
+            let _ = sequencer
+                .bar
+                .try_write32((temp & !self.mask) | self.val, addr);
+        }
         Ok(())
     }
 }
 
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr as usize;
+        let mut timeout_us = i64::from(self.timeout);
+
+        // Default timeout to 4 seconds.
+        timeout_us = if timeout_us == 0 { 4000000 } else { timeout_us };
+
+        // First read.
+        sequencer.bar.try_read32(addr)?;
+
+        // Poll the requested register with requested timeout.
+        read_poll_timeout(
+            || sequencer.bar.try_read32(addr),
+            |current| (current & self.mask) == self.val,
+            Delta::ZERO,
+            Delta::from_micros(timeout_us),
+        )
+        .map(|_| ())
+    }
+}
+
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr as usize;
+        let _index = self.index;
+
+        let _val = sequencer.bar.try_read32(addr)?;
+
+        Ok(())
+    }
+}
+
+impl GspSeqCmdRunner for GspSeqCmd {
+    fn run(&self, seq: &GspSequencer<'_>) -> Result {
+        match self {
+            GspSeqCmd::RegWrite(cmd) => cmd.run(seq),
+            GspSeqCmd::RegModify(cmd) => cmd.run(seq),
+            GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
+            GspSeqCmd::RegStore(cmd) => cmd.run(seq),
+        }
+    }
+}
+
 pub(crate) struct GspSeqIter<'a> {
     cmd_data: &'a [u8],
     current_offset: usize, // Tracking the current position.
-- 
2.34.1

