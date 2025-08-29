Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F171FB3C1D0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20C310EC12;
	Fri, 29 Aug 2025 17:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tLpEs4wV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBEF10EC0D;
 Fri, 29 Aug 2025 17:33:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbmBTyh/kMfTV93HoWVxSp4iK2t9OTQ1RZMVB8TQZ7z769NFCsweh04SlX7K6ZhljNygxdG2EbRP9NKC2sNG6Koj8Il7w+N4Fz0Cd3+aoYja/nQJ3wDTqielvHnC3/gJXtbEruVmiyQ1+AAKmPGxz/o7JOetXyL7VzBjSX2H8meUigCSp7K0iE1pRQo3KWO5ruQ2P0hAfl0TpQFu0wA+x58l2zMQXhsHApgEOhKjT4urUtMRsdCbwxExgXTQBNJe0i6ot0nC4v2mNCV59Z91V+TzMagXObYsOv31k77aPjxGFoPDOEPalI/Zm50THBLevtX0N6yZJOc+2+ErjGq0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GG7OVm4r4RhKaSZGng+K3pp/FDpDHwJtI7qEweR+RVA=;
 b=Vb7ZiP6CUk7Xq/KyLAd0A4pd7mpW2Th7+st0ZA2PvoLyrncytIicfMsG9wS0J88JVFxV2wwfyu5PRl1zuHMNx/T7caxIER7MvHAdS4o3pd+kbZSyhcYrHJ56yFWiQQI69HpWDZ7cNo8eS409AtXtwv2JSkb1cscH07LQkLouS/ugPLslQiZN37eue7rFsjejCxcFoGdQXGZXdYCROkLr5KhVTt8DCrgodipPvHPc1l3LKMOPokLrwht+G3l6n24k7ysV/1xGYqoYznfbky/bBPR/kD8qJ9WN3QLRmrwjG2pTrP/6oieshJ5omCDeP75KgwK/iiotKd5lulHi5+AE5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GG7OVm4r4RhKaSZGng+K3pp/FDpDHwJtI7qEweR+RVA=;
 b=tLpEs4wVLz5IXRXKzO9JIcEmx4KV6IeJ83T/LrqRZoDLj639THqJ3LHiYUrnvaZofD+G52PcW26+as5Tm8Xq2I2KFmo4rriNSY9sfgX2cmZG3wOGiAmw9r1uZuq8hgC/PHG5hjcphSdl6CaPVWEjW9+8OKrN6GPuQZDB4JjR5/bdhI8TKzxQSEEk2aU14P4mbmjMgCx1qRmzJ52mmPNXmIRZYAk4hs+GIC7EP0FUk846352iBtaIfVv0hO5ZwE3pUCbVmpKnli5tjp/+survKSBDNzwrRtE3jxK9kM+DsA2NJDVw0fFvvROSvaZhO4KdN2Nv70w24dxrLhpWtT+VEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Fri, 29 Aug
 2025 17:33:25 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:24 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
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
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH 09/17] nova-core: sequencer: Add delay opcode support
Date: Fri, 29 Aug 2025 13:32:46 -0400
Message-Id: <20250829173254.2068763-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:408:ff::8) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: fd54128a-7de5-4e88-11ca-08dde7222854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?07Gsmet6761AXMIQwrbQgrUT/q9PaOYB5kGJunCiAr6KfL9qGyoRn0xrRVcA?=
 =?us-ascii?Q?j6inDgCdpq+u30RTcuEB17hpjY52zApvsazr7gkyRu7mG9byZOYJecMUHDDM?=
 =?us-ascii?Q?9gw/QqWdjKR0FicPK4dyunIjtF+gnx8MJpYkSQ15iG/RAU0ABmzlpEkxY2NE?=
 =?us-ascii?Q?7MzyWFlnWxcBp4cMNFPsNDnzW8zd6JjENPRMIb7+tUmZWP+tPaDyOibTQnZ2?=
 =?us-ascii?Q?04+jZKrfmFBaaSAB/x5me/OHVe0aykrmUjrvQt65w+B43gMD+cG+ruTdvQ7t?=
 =?us-ascii?Q?yQxdA4gxajI8ReF8jBdA5UwI5d9qzxRnBkHHqtkN9/gQgKEVZMgN7zTNN7x2?=
 =?us-ascii?Q?sh3K+Ed2VSn8dm2D45CiMjDAkx59d7L1r6togGa7bue9GK0cxcFRiaqifO+Q?=
 =?us-ascii?Q?NqVQsupUjj5R7oNFyX6gsN/AX6GtK/WntGXQKwng0pFNp3fX8bOrsdJrr6Rh?=
 =?us-ascii?Q?D8DRKHrmGYd9QVoS0Nx1PnguCzF0/JN6sZC0uzFGAnQ+ML4A2YW4MZDIcnWa?=
 =?us-ascii?Q?32TzBZX58o4tuT8dmmi85wg124rLWuNdTgLROz4Tq5Sv9fql1TcWm8+13F3i?=
 =?us-ascii?Q?j57Lh9d8t+CYSWeC/GqNMBKC+kIp0F/f+e3gQXomcX98aG1lTVjMkBqo9csv?=
 =?us-ascii?Q?pD5ufHMuwqV/YarKRjR4OVbcHNAKxe80b1IF8Aws8R2ON8mYluWlYApJm4JA?=
 =?us-ascii?Q?uejYHe64IWbB2IyfaH/mMsNtd4kk1oIbvdR3mi6mWPSRHh4PEtrcW96aIdPt?=
 =?us-ascii?Q?34m6OEbWY+MLYWLwF9RLiQZgow0WZyjk1oGTKI9RxPOGTGAaBI7aInvCJOD0?=
 =?us-ascii?Q?KAMEILH9B0iC4VNCJ10D0azYs3K3dqOS52aSEJ6ejD696FSMqo6Z6/yU9I4Q?=
 =?us-ascii?Q?R1mYsfu98ltsor9zAJTk5Fszbhk1k+xbxdiBgnOJkvFCQYGrERPNQfd+aw7J?=
 =?us-ascii?Q?oQmT0i+5BFQ3Wai5sraAiPgbUxxmRUnenvi7WXceU821rkoaBLBhsLGYg2bf?=
 =?us-ascii?Q?BC87Pxg/n2f1BAMD+gueiKMkuRuCxvAF/byJk6hR5Xq/VSLra/Ncf+W9+bvq?=
 =?us-ascii?Q?pVDtLPghcPAGzEyN1hBoc7q0batIb831uSWgBOgXgFqPVUm0yoi6RCqjb/J3?=
 =?us-ascii?Q?y+0LJY2O9RUDD1RaDF+ReGv40K+tA/vG3agOvIV1U2PzIWygPgTPn/Wz+blH?=
 =?us-ascii?Q?Cn8aq9XCVy5DGYPEOah1vNxRQqVuleS9oD/wyVgP/Ymu+Kv9edg3AX+fgDJ2?=
 =?us-ascii?Q?h2B/9QK0AMm7snpufnp9p8otATpShWVm9X44wfCsSgZv1gfkg2pwQ3w2lhXn?=
 =?us-ascii?Q?/dV81Vb0ZN724Ux4dMQyA5H9ad56c1pWpo7Shc5ovFArg9RiyFug2TsAk71D?=
 =?us-ascii?Q?aNNJZaxWEoOIZduTN3A7lNnJgu/qA5DNYEBF6iqzEyTJMOyEVT9xcMj2uUls?=
 =?us-ascii?Q?CcKFlg7SFuc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EUCS3501gTP+hjbau0xTZ5xblV7osWDcI+wZtApJE3k+wkHG8yXpsGVUNYCH?=
 =?us-ascii?Q?JaQ6imyU0y7nu9ww+5p0dQFmAGGjVV03nCbOd2K0WLTg3fl8grHasiZ8zPE9?=
 =?us-ascii?Q?VKLN60O8H7NtRAAmf3xAjG8ENgz0OsvUHBVFfZtWILILynUIoK1RYbS+Q4Eg?=
 =?us-ascii?Q?AYdwm5GNLOk2YifExYjZ7lyBFGWiG+y4scodx1XKnIx/9j4nN9QgQ6OvrgmA?=
 =?us-ascii?Q?Sk6+lsNBP5WchOfVPZvKAJXa8D0jsQ3LMjgzqxkapi+oQ/FMa3GDdU8mk5BF?=
 =?us-ascii?Q?hQbCjgjiaSzBMOhdGXzl6M6wl4evJop89LMNRT0I3qKLynf8xe+iRMQtlFMd?=
 =?us-ascii?Q?yVHEhBjfuJPMUXlDm9DPlsh96dA1Eiy7KCSvSA7EpRvV181GbxKUSKd4V8Ge?=
 =?us-ascii?Q?0JV1iePLmI1OcMocuBfw32zWkHR9tvu7YEf5Ln5o9gyQ4+B1ZQkSMgzmIy1w?=
 =?us-ascii?Q?JCoQVg7zSrgpVs+V2ZI5qdxvYa+aIpHRMc6t7368wi2SqZhfynW3o0l9FbBD?=
 =?us-ascii?Q?17CSJFXms7Cnigvlfzfd/w33PzRK7ymKl6nrsGNntmoiWW+POy0yIerTE4eN?=
 =?us-ascii?Q?gnG/12qLlJwfWjiUhVQkztP7ejxQBwzbdkbu/2H2W7PvDF1zmDRYmZYwu0W/?=
 =?us-ascii?Q?TSFx5IPofpcq8BUggDUsLPINydAvjyOFzj8m6P6vLD/hNSbE11rWJmyV6s2o?=
 =?us-ascii?Q?2PaRgO4ujDGSKHPIMLFV5Pn1GjptWLYDoHfnP7YNTJd932leZnqQTLq2cntD?=
 =?us-ascii?Q?Zj4YF3jxozNXCoFNYpovHEGuGT65dz6KIemeoo5giGQKuvdk14VOzz7JeXth?=
 =?us-ascii?Q?BZNpQYjFfqpUBtXDEhNaeNLl0LAFOYT5xodrCmZylZ/3PNWWBy6fdDEgsW7d?=
 =?us-ascii?Q?Ktth/CBa7d9iuMVsz55COGy93iEmDK2EOhxfbwZ8LlbmNIBahe5rPsjLVydD?=
 =?us-ascii?Q?Haxu+NcvnyBcwLKitjIRLubDi7UfsGboGvTYJliuj82aYq23gbpu/12ZjifN?=
 =?us-ascii?Q?AR3zMlhxi4zQhbDiIB4gIcbPYvimr/dWruNnkfEDeSTaiAfWAoJFhHwYKlce?=
 =?us-ascii?Q?OKQZNaeN6pzLbdhFBZABME6Iogh7wXTmlWnqpvPOiWIIcgOqIWAPet/bw2jq?=
 =?us-ascii?Q?N4tIXdzCV6dkgOf04PTvfebc/0usedC581uSAnMHTXjjs9sjFKAucIOXERQr?=
 =?us-ascii?Q?U0XzwLoTh+HApgYXqJnXriNU9Ndv2rWkrru7RZvC6FbHfHAAp0+qGFDz6V1J?=
 =?us-ascii?Q?8bow3Qn7R9DZKU95LMedFSdk5M/VRAM9mmuhW9qGLTcswDh4BY+MJJ4+jMhQ?=
 =?us-ascii?Q?AiGgfZNnjsugqnHNCWV+O3nFN7rak9CMECQtlGpzYhom16O2avYLO+FvaN2t?=
 =?us-ascii?Q?3s6o8DYTtGmdzdIeQi+JXcprZZSP6SsTTZbhHy0S6+s90tmnFBBE6NgYIg1e?=
 =?us-ascii?Q?WaP70zqtTO0VKIWGBVXq7hwoGFPDrnHE0MbA59N8IS6K/oYJ1zqoleTB2z/+?=
 =?us-ascii?Q?q99mhynRIdfvR4P/9iFhz/VTUrmpgU0GRosiXIvr+n/7N741JBpvnfjcBMq2?=
 =?us-ascii?Q?4VFd+H/kCZ/ZTnRUS18GNLNHRtF8RTCC+aHUQWH8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd54128a-7de5-4e88-11ca-08dde7222854
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:24.9020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZQx07qkiqLOKrWTtCwqoHDcMgphCgam496EsafxQnaWP0PFqX0scvkt1mQAR8zQalkeS8cxFjafNNmmNRo0Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017
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

Implement a sequencer opcode which for delay operations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 75672ae0a687..803956a74c8c 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -4,6 +4,7 @@
 
 use core::mem::size_of;
 use kernel::alloc::flags::GFP_KERNEL;
+use kernel::bindings;
 use kernel::device;
 use kernel::prelude::*;
 use kernel::time::Delta;
@@ -37,6 +38,7 @@ pub(crate) enum GspSeqCmd {
     RegWrite(fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE),
     RegModify(fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY),
     RegPoll(fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL),
+    DelayUs(fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US),
     RegStore(fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE),
 }
 
@@ -55,6 +57,9 @@ pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
             fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => {
                 Ok(GspSeqCmd::RegPoll(unsafe { cmd.payload.regPoll }))
             }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => {
+                Ok(GspSeqCmd::DelayUs(unsafe { cmd.payload.delayUs }))
+            }
             fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => {
                 Ok(GspSeqCmd::RegStore(unsafe { cmd.payload.regStore }))
             }
@@ -85,6 +90,7 @@ pub(crate) fn size_bytes(&self) -> usize {
                 opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY>()
             }
             GspSeqCmd::RegPoll(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL>(),
+            GspSeqCmd::DelayUs(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US>(),
             GspSeqCmd::RegStore(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE>(),
         }
     }
@@ -177,6 +183,21 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        dev_dbg!(sequencer.dev, "DelayUs: val=0x{:x}\n", self.val);
+        // SAFETY: `usleep_range_state` is safe to call with any parameter.
+        unsafe {
+            bindings::usleep_range_state(
+                self.val as usize,
+                self.val as usize,
+                bindings::TASK_UNINTERRUPTIBLE as u32,
+            )
+        };
+        Ok(())
+    }
+}
+
 impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = self.addr as usize;
@@ -202,6 +223,7 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
             GspSeqCmd::RegWrite(cmd) => cmd.run(seq),
             GspSeqCmd::RegModify(cmd) => cmd.run(seq),
             GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
+            GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
             GspSeqCmd::RegStore(cmd) => cmd.run(seq),
         }
     }
-- 
2.34.1

