Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155CC29AC0
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D8410E1DE;
	Sun,  2 Nov 2025 23:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aOMQZ4sm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010045.outbound.protection.outlook.com
 [52.101.193.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F3710E1BB;
 Sun,  2 Nov 2025 23:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPEIePxrXNPwL8uL0UHjodg38PLVSOCfRFaKh2TxYxG0H5O4BrZLkrgFlIpFPxzmjuMf1/1YfW+5MBHtxugOz6zzxbUDST75X6J1Th8f8sMiNbXoik4sEo+bnHv/wPs06y229XvYjYGEPRxcZMp1MuWRsv/xTcRIGWWUHDBZghZhSPEXSuPOzQnOgeOucTAG2+lbpmvaS1qZNKp8uC2+hddyNSf6ETDlSOTa6X6/V/u8xIdp6pHJ0tC0ihBhr7PJP7+5IDW6Kuw+NpfvFmHx79oYkp1GCHLMIih/XDRvZ+OFDT4dukhc9KvPPYrz57nNcFklhDUsleA+F7pKcQy4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYGoCEKz1pa8RNm179Y5227o8NH9Rea/RF1QN/7iOE0=;
 b=pzDgXc5NW9UCat12+Hnv3YuqkbcHp5+MFqfe6QECIWH3cADVa9M8T2DGPhmuL2kYavzfqMiQNVDNUzAoNTSR3nYgBFGd68fh0mIianGl1dzAiZF6d3v07nmaD68mUNsCUiXYE7SqfnF2SYsUgAIDjL2Z3C5ga8rEF8bR4+fFqIuV1dmvp2AwawyrMb1KU/vm2FAxeRybE1ZEh4raN/KwHRGwiWrpyFwyarOwbGmYmqR8wpvAv2i/2Go2mSgk4WQHE9qZQmOQbj+YzMOuxGzfIe3GT6aKdLi7eMtcF00AtHSN9SYLAKnB2KZhq57ISZEjIC/cqgfR2XBIN2MSK/By8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYGoCEKz1pa8RNm179Y5227o8NH9Rea/RF1QN/7iOE0=;
 b=aOMQZ4smdMH/QJxlbUdU4ASRueYxb31rO8XxeUcX2j8QkSgBSAe+n9xW9DfsVxMJatJoLRFjIvvYFIBRpXhMJmmOOAPX/H36/ssp1NEy1IzXi0XYhA9PoMmKlVP2OSkIQpXGMaTNEHGO6tpTgXd+jBPpfxltT3EGfotoNxw5yFKSvceqbqtXFXfVLoqK5THVqiCdpVE1fs9NVslFsyUsnPdpwrLsNftIjy5uKSFtg301JB45sYnYlg8+2LYt6Wa9RuRDbqVVl+U8I2Q1RHmdZqwFmTQeAqBKC1bKvRWBtxpy31hUjyE5nbYs8S9pj8TK2wH0PZb4CGrrwddpZmD/Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:36 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:36 +0000
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
Subject: [PATCH v2 05/12] nova-core: gsp: Add support for checking if GSP
 reloaded
Date: Sun,  2 Nov 2025 18:59:13 -0500
Message-Id: <20251102235920.3784592-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:52c::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 69580153-edba-43f2-7b04-08de1a6be063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3Sh1nZygoQ+arb7fX++AY/6W8hwfNwvil187+tgMThR2DvzzpW5gGhzY67ov?=
 =?us-ascii?Q?Bjsq66Q91tJyA3SNA5Y4sjXeQuBbtVz7WdaV5T/ztZSfiz/kKGuqcZL7zi5W?=
 =?us-ascii?Q?Hjgc0YKStyEHl0qmJSabEGNFLStXIPXgVIWQ8CzHKztoX1TwSmmJekKwZBHt?=
 =?us-ascii?Q?KvX49jnxgpPpJTs3mozOjWBwfyQ3dv3Zx7aiP+9PdPRsVonlbQ6ODIP7Ffrc?=
 =?us-ascii?Q?G4eCEOIu/UgGFbEzECHSuvEE3VtwiwSYzbOj+L/IU74/yGxh7ZlK30+AizE5?=
 =?us-ascii?Q?1iwyXE16jLySFehvLQi5mkxpuGOCe6awzyRLDkmJD05uNMnVnKJOWzwOfrH7?=
 =?us-ascii?Q?rw95GcvtfgxWSGdEGLVIYpIHGZd0A82CbeLqQvQJ649ll2QAHgo4R4QUzeLM?=
 =?us-ascii?Q?7HXS2bZ4gMOPtQ34dJtJTcPo8ATvfd7mFEw1HPwS41bwZvhSb8bjoJDL3mWd?=
 =?us-ascii?Q?5XE/sIpfQJZ0QDzLzTBgl1N4hhRtphmsJCqURrICuuQmy5LAS1WTbwVRx80/?=
 =?us-ascii?Q?uEXWpXkZh+QQ3GyWc5iuXr302fiMSSTA6rlBfATHrf97A/CXiX9VsSBIXhkx?=
 =?us-ascii?Q?zsgRZBkjWYj83ZT1NopXufLNk7yJUwxcRXa6mLOyq2hDjAnWG70FWcwA6yzv?=
 =?us-ascii?Q?74EaaUmJPOi2dKtp6HpBDyTf4pAbZrETCiUTH23oljjx0TlWNpQ0HhvFdUdX?=
 =?us-ascii?Q?CaHLuEnP3BAogOf0mmYARhJu/tJdZfW7Ol6SZcd4iICEhWGZhP3mKkyoay2h?=
 =?us-ascii?Q?kj03ysIM6lQAHA/p06/ssMszaAL4NuVeQJxeaAk5+1qmEZGsLW9Hu6JluT9W?=
 =?us-ascii?Q?BYOfuYzdTgpSz54lZIJYf4kgIgKpscf+Q0kEmBD9bjnkPFlBjfXztmSAwsdX?=
 =?us-ascii?Q?DX8hGtYa9rGr+vzd5HKD1SsBPPAKiw9XWFmfiXxzlTtee7EhK3TeFK9Jp5Ag?=
 =?us-ascii?Q?dFuDMwNe7wG4SA56veAhH5GkMPdERl37Niy5qchAUIOZDyj0O+JUU5OjkZzb?=
 =?us-ascii?Q?2OQBdeoeT1CWxdQHGT1eatzRDd8Hp7JVCWVPlBC6bGnbf7wtb9Lh1ndlwTVL?=
 =?us-ascii?Q?ZEoDsG19HGhHacelap//pNsv3bxg7TWAaZ1nQs0LX5xjsfPYEfM7lldh93Ec?=
 =?us-ascii?Q?Yh8Pn4sJ8Ho2MIlMcm4IxLulbL65AOa32hmoKkeD+MFSDm5lJDViEyGhWk3+?=
 =?us-ascii?Q?xtwvkzwM9ZkGA7lqYSE73txjlz9nh7jFELvwRqWclmzPFVBvx6NrcxMojtnD?=
 =?us-ascii?Q?qQiKVaJqCSsVPeNSOWaLE3yasLTx2NDrGaOSW0nIgBeUPKV8rZCJgLOwmEra?=
 =?us-ascii?Q?NWK9BVbhiFqU5njUhE01fsUD+X7/wRky+uhktH+GlqSq1qinv+EC7xyQOt/b?=
 =?us-ascii?Q?fxggmdP2U7iJv7nv+8VHX/OL+FYzm6TiTPzuMnTIRy43cfTjFgcNJZ95XKIE?=
 =?us-ascii?Q?3ihdQin1gQsD8ECYl1YeBYgHujx8Pg2Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CUWOtB1lJ3L9BIbnGu69uUm4LfyIBm94fpMBWDkNNMRlEV3bQlP63+hPuPa7?=
 =?us-ascii?Q?lsVNeoho92UKzqGIN0ajAf1eGnxuX0hjoRfvn7YC9u0MIztB3+Px7HM1wDE6?=
 =?us-ascii?Q?Ww0OWDQKLQgjRl4XfvoX9hWGsg3/FSB55T3DDOIzWN9Kpvij+JlHG8eGL6uu?=
 =?us-ascii?Q?SXthdjqGE0Ts78OVlWceVvvg92c2Uh+bMXzewlOJUQHdnV2vybF8eN8XYFXz?=
 =?us-ascii?Q?KcgQtEdeRlXYrBAwIaCjPg6JmRYC/itV/Igi56ZEG6fpU5FbI0RxG4z/4dyG?=
 =?us-ascii?Q?+mQmLc91WpEXhekZ5JaHm0BEd7KS7CGX+xiqeV2t+kRZT1thOOvncVpHH8FR?=
 =?us-ascii?Q?bZIELW3rELI/HedWnnXwKx84tMet54ttULync0h0wD+1GSVhI9j6TWo+Rt7i?=
 =?us-ascii?Q?efE0f3Bp1f/AXEx5bCVAvUYwjoiKG//IOTjQSotyBg6bh3thb1/+IjrscCPC?=
 =?us-ascii?Q?zQx4kfA5ljIIXxtgY2csyBp1WTdNDCGKkc6QEV7ZpsFFiZGSLH4GaOcwjHws?=
 =?us-ascii?Q?qlZv+UBZr/wPMaOqHsEMHLYdAz4NWvL2260dBP+4Nqt5aYBWh4S99KVR+8Qg?=
 =?us-ascii?Q?maRHLDPzbdDg2HzF90NweFsmB9HEAP1SMzFMP1QJ4QOlnW/ol1sv1x1bTBbU?=
 =?us-ascii?Q?JkiNy9p1kfDYOm+VNY8qnkUorZc5NujbA8qwmeOV3sSOqo/2VQSUrnMdMBNH?=
 =?us-ascii?Q?cjCDQ64eIKhEtEXCZvBfod+wqngpjKcOo7v0PljbtQntTqLX+lxMzlA0IbmF?=
 =?us-ascii?Q?gqyRuFExCIDn37JEou+7UtvKRMRzs3cEHnbF0Yg8IDapbtnky2OQjT4+Yyil?=
 =?us-ascii?Q?qEAdicSuGAkIJLvXilI34p7A0QDT1llAJ3U/eLtXDoEG4qPV5b5I8MjXbmk/?=
 =?us-ascii?Q?xoZ1F13DvzdrND+fNXtTF+eOyCyxS0bKQQbAUxeowsD0fTJi4EQ282y51b0i?=
 =?us-ascii?Q?NqRVS47qqtaTqaAdMz0zVnr6QLxiEypVlMhYzX72z5EWGoW8yQRcmsC/8HwT?=
 =?us-ascii?Q?pmWxcUDFyLXk0e2vViVH9CCKC6vGe7+ATg3FsJ4ZYLz0q89EN9Il69jj2iNh?=
 =?us-ascii?Q?rHGGu9oL6cBCp+Z/J8nwokKqSqgQNbG2zIOmSQhDU3BmC6okdkLI5t8fNVJT?=
 =?us-ascii?Q?75r5i/a6XdsXCLB33TCaZgOGRxs9IxhhDr5wQGDj6JB4YGjIgq6r5TqUnXDq?=
 =?us-ascii?Q?qXkHI3466BYPmKM9RXju5Gmm/qDGSBYa5mReDoiJoPAhZeGNOAnxhPMVbGxP?=
 =?us-ascii?Q?H3m4raY3CG5gO5pjJOk2mfAs1wZjIFjxIsBAcMS9HCbasu3wkHVJDe2zaoJE?=
 =?us-ascii?Q?tmYpvU/gsDLnKTne8hK8ggDLF3sqSgvO/N2+eXUNFwFpt8u/QzOPwaoRiy1A?=
 =?us-ascii?Q?C/xNLPBdh1YTP8og1xI29MMk7/SvOI855OcoY3x9fOW1QzH53Dat5D6CFIP8?=
 =?us-ascii?Q?WWyzN8pz1f8RB2rT5Q5eXBRntbxjHKWSA8RSUyBcX3y75sIMFhgMYIRavO1h?=
 =?us-ascii?Q?tNmFlIhL4bAXHoZauu7HJ7EvnA70VeVpWTvgw8gyJmOGUishtBk076RMUCR5?=
 =?us-ascii?Q?lclbyTG5u7zYgihggDNqyuwhX7Xdj5Hn3NkFgDgf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69580153-edba-43f2-7b04-08de1a6be063
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:36.2670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcNzfxsmtVkhh0hA5ldBHXj5b5sceNzd7l6PrcGZ2X4CM12UfYqcIgLSK9WSnkO43WKyRry12nr4GUMYNE6+Xg==
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

During the sequencer process, we need to check if GSP was successfully
reloaded. Add functionality to check for the same.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs | 18 ++++++++++++++++++
 drivers/gpu/nova-core/regs.rs       |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index f17599cb49fa..e0c0b18ec5bf 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -1,5 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::{
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta, //
+};
+
 use crate::{
     driver::Bar0,
     falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
@@ -29,4 +35,16 @@ pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
             .set_swgen0(true)
             .write(bar, &Gsp::ID);
     }
+
+    /// Checks if GSP reload/resume has completed during the boot process.
+    #[expect(dead_code)]
+    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
+        read_poll_timeout(
+            || Ok(regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar)),
+            |val| val.boot_stage_3_handoff(),
+            Delta::ZERO,
+            timeout,
+        )
+        .map(|_| true)
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index c945adf63b9e..cb7f60a6b911 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -124,6 +124,12 @@ pub(crate) fn higher_bound(self) -> u64 {
 // These scratch registers remain powered on even in a low-power state and have a designated group
 // number.
 
+// Boot Sequence Interface (BSI) register used to determine
+// if GSP reload/resume has completed during the boot process.
+register!(NV_PGC6_BSI_SECURE_SCRATCH_14 @ 0x001180f8 {
+    26:26   boot_stage_3_handoff as bool;
+});
+
 // Privilege level mask register. It dictates whether the host CPU has privilege to access the
 // `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,
-- 
2.34.1

