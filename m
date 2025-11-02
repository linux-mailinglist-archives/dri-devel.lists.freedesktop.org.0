Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894AC29AD5
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD5410E1EF;
	Sun,  2 Nov 2025 23:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sQ3ZE5Pu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010047.outbound.protection.outlook.com [52.101.85.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3617410E1CF;
 Sun,  2 Nov 2025 23:59:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQlBCapvWMq1QN7xkBAgyowS0EZLD5+nUXjxTMWEaYP7Dk8k891FVnANC5hKW7G6RUN8CaydobVh9zGkMV6ArPb4D2Ycy7gv0OBYYWaI+l5W5i3oBqwtJMK/ugKd/DEhTOWsh7lP2g177kbhzF4lHh1JvS+cBPs8ywlDNSVmWLbigoV/tmISC0geo+FYwMq2zHvlFiyHRL2kTWI2Di9HzPvwTqDHeQlecTSMi7M0yJe0+7DSQAgYXDMtG1o5th86rBukznAFaUJuXltKYyn6sf1xVIGZySJjkYM4VqsnZiBKx/ePoR1nMQncQrRAqDsA9/0yuSyKA6leiMbd5J/UEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZQqWajyee1eW53tpZt3HDJX6Lkb5g6xvmzWMelz+xU=;
 b=ZBzPz6tHQiIHxv/BKKt61C1xASZAEnBjrQv5WN5RS8liPD8ONh5PMbiueYE9+yxHeJjseZfWgDjYugziXc9bTy8ysON2u8rfEAsUsEWyuLJPFuGXMcK333NWOrEnDtJolcsk65wJQP2eDawl2HtN8IR9cWEtLePpk0NrnW1V55duVJGnDKIcgD2WdSd7+BS6G8sHPZJjyrFviJSIcX2nNUCWeRvrVvAOjktgMTk/PcO2QW4VUwMYaiHZYnK+II6gOlhE02/x+XEkQpJ+NqNXLYVJKnjntcyqFgfawzJBCHBuenX/AOaTnf3bR6/UbKp4Qwizs4EcTYGX/8ULBS3P/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZQqWajyee1eW53tpZt3HDJX6Lkb5g6xvmzWMelz+xU=;
 b=sQ3ZE5Pu9S2ugVSc9kKXB+WgN+PBsyqCIECyu25IYi56/xLzr4IMf12o+Neu7TcfquiVwjzaxpufTwykxDFOtuOrQX1hlZILwbsZUc3Ep+hY0X3Se0TvBeNw2gqiFRjaHcvOvTQOGLVQ+gWD1HjpAR7kuuIZ2B86w/aDgy5KX7ab7tYlppXlzvAYsOdeSly0KEgBvrXwlXU7R+vzcJ2YSMlpIZKGDKZMbLfBWFAHjDVpAiLeZoEYQj87ELM3ErNyu+DUQb+cgtl6Nq4y8EdLkLZyega0yeauqINkg6owCpSHTJpEsCvu8vt18MkyRuM50/so7nVFiIPUV5cvkhXrdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:40 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:40 +0000
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
Subject: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
Date: Sun,  2 Nov 2025 18:59:16 -0500
Message-Id: <20251102235920.3784592-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::20) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 41284ef7-0e72-4b7c-3269-08de1a6be30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sCijbzCBuxfkBGL+o2kdIUvjZg3F0/MgPp+fSJ3r1d6LrsbcKPnwsdCLQ+0l?=
 =?us-ascii?Q?J2GhpQ4/k9TAu1G8OUZUIqmA8dPPYXwArHb2JjfZ9nkLfI694kx5GGbX6hQr?=
 =?us-ascii?Q?YZttph87+m5MXyCP+38wyGkQS8YXq9Qa2J8+kV7cH88gfBCo30gPahuiIr8F?=
 =?us-ascii?Q?+ugwbSLFaSyA5TVuAmCUJADKWY2S86q+UFaUIFeUhgzmHtO+F8xjMX0Ma6xs?=
 =?us-ascii?Q?+IDV7BAFgms0dSWF0wE8Tj1l715irqi/jcK2i81+unjAcAkT6sj/ITbZ2Esq?=
 =?us-ascii?Q?jSN+P5GOx7nK4iUqzdiD6Ink8GnXHRKFPdU4gK2lV4B3y8FKQfS2anUksat0?=
 =?us-ascii?Q?Pxp5V4ngq44+5p3Rp/Jhooq1XJfRye7iMXUCElblz+lCXFc8UR9fzPt1heU6?=
 =?us-ascii?Q?yZYiPI1NxsGNZIQrq6uy4htANwKNJk0tKOnfT+OHreEl4ivs759+PDBasvdZ?=
 =?us-ascii?Q?X+KOH4/x5pMpuRZvuUACU2sVpZwCuvrnSYb+raZckDx2nIWzjiw8juDoos/N?=
 =?us-ascii?Q?koHwr8yBTrUXwp1ZScnFLrXjG/zycMnrBjUBRfZex8pvgvZzgpHRZwMJjokc?=
 =?us-ascii?Q?AyknjXXzB26I+0faKq4n/85Cc7wvmN/qNipIQKXXl3tra6WY8xoxGnePfQBo?=
 =?us-ascii?Q?jzPsok/qMyN/UQNAfGne7I4UFtNso/WdQXxZRztqGvsA9tJVLEZBwHXGdH7F?=
 =?us-ascii?Q?XTZKOsY1cETVi9lOXBkfNo0xwQ+4tzTG6Od1c3SCPpc3Z9Kpu89fewzODCkn?=
 =?us-ascii?Q?i4Z388vnfT+eRhIJT92SObrZNdfCUPHfGwUtjmAQyAz5OEOgZ7AkUbWjtbhx?=
 =?us-ascii?Q?TGvBj7I3ZnsO4HoWC2gzXHyQKYrZSBNnjnMTPl/MKkTr6XFuo0r1aTMuOPa9?=
 =?us-ascii?Q?vOiTBXWaeMpmCG3YAVkKoxkmAY5UQtruqjFJ0orzQlUqPo8Ipo0Av9fVMKjO?=
 =?us-ascii?Q?QVmj8Fq4uIkNyENdfPa6yNa3wHhojliehI2YJGz1AcCgPAQLh27ilNqOOwAR?=
 =?us-ascii?Q?tV4uONFwCJFSQyvUVVe9w6RjOCBinwmItRlVPHAC53GSANw28jA14w8zylWP?=
 =?us-ascii?Q?C7mgk4iSAvl4NaK9jhZ83YRsgjwQK2aKtwkpl+bokd8Xvioa7ptSzraRwatg?=
 =?us-ascii?Q?Zylml9E7+5j9H0fI6npUaGcWNynlKbeZPIPVvQIyuWYJWKzs76ZoalJVEAFN?=
 =?us-ascii?Q?ERSpMoKEIA1amgehX/4+AIzI3mpCnNB/CwwM3Mnb1NhC+6YLux6vRwW230Hh?=
 =?us-ascii?Q?ffI3Y77l/ljRQTQDGq+UDu+LtT1UuI+iibjfMFEGXFigCShb3OKLei8E6Sdr?=
 =?us-ascii?Q?NFpcQ98JPAXO/E9nrjJLO2XwEzc5evmOLmPLeu2RYUzfAv8vESM47CjTznXr?=
 =?us-ascii?Q?EWr22Fb13JRnushdy0j8fN2/Y5oThJioAHKkIoXcjV3+3Eg8eomT1RynP73j?=
 =?us-ascii?Q?qk40FHnvulN/RKQrZLQ6Y44vNbGkkpCa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iGH1Fi6HIGIxzFMQuqAYUz/2Rq5DHHe2ffglNO0bWgFP/wyd53otAdnkzCEb?=
 =?us-ascii?Q?y+NF5em9e1AfqtoBVs7knR1180cy1av9BT2B0VRslPnFMSP84o40aYYz7qma?=
 =?us-ascii?Q?Ig8I9VEccQqWNAoIyrGeSjoEgcrj9aK7hTon9fF/cmpkddijJdQJUTtzkb30?=
 =?us-ascii?Q?hq868chVnzBPn/l6iT2BWWwLvP7rk7G24gA9Flz8ZL2vILF4hcHB3C6Y0lwN?=
 =?us-ascii?Q?pWUIZBtEW2oNGFYPQIM6bTlodji3xRznzcXLhzjH4YSjQYJ8Hqzb3SNn489j?=
 =?us-ascii?Q?kmBM1wIrdmxADulnnEDb05bYXgLFh1ZqIr/P/+t7gBmo4d3CalKyDqwvXzuw?=
 =?us-ascii?Q?aSfjfec0uuhnbt2HWN2ESFcKIIxosSBFTUUO9sHywEDxSkuxmiBf/yxWb1ri?=
 =?us-ascii?Q?4je/WkCz3JSQ+Pv3OYF5efZYnbDXfVLnpxHEoS4+QvUdNzUrahgqLY20JeT5?=
 =?us-ascii?Q?jO6EZVIpWFJfNBTzD2hBsVtU4+ijVy9yrxn0k87zrwevZxUr0MxRBM0RaKu2?=
 =?us-ascii?Q?PJGIPZ0nENF9IKzKuuF214hd0cM89/JvnDSS2uRv6w9xiO5B3KimSR/NJ6O/?=
 =?us-ascii?Q?Ydt6oDnqzot+YCG/jQ4ds0e6NcbwQ0Q5kfMCoBjnIwD1NXk3nd7dGk5SbOJD?=
 =?us-ascii?Q?NkKCW8IBASc1N4e3x8AJZCZ1dWCaP+naugL6ulNDQB+jQEkrujXbGxVAwHHr?=
 =?us-ascii?Q?riSQFeV9/YWGFVVbNR8X9Yse+6fW1M42CwRiJ+0InhGpzI10+pPPMzKMH3Ee?=
 =?us-ascii?Q?CGNJNXDrln34rRUUrAOgKQ3OF5ZVulQJOhzHNk/J0KHWHosYdsaN5zRbzLhK?=
 =?us-ascii?Q?O/5zpuejPimhn4iROXGCq6Hb5IGmRur+VZYTh84EeyhyKPSs0MfqES1LQZcW?=
 =?us-ascii?Q?YWSFAac6NZyr6xaZc7eAFtydU5sO01/BhKKRyPEAKrHk73PtnkhmXrFUbPpL?=
 =?us-ascii?Q?vJMcKu+ulHh0/FLNP7jc+RAHjLac2Bmt66UIftBTCyLtTw6VWSFzv9H2Jpmi?=
 =?us-ascii?Q?g548pr7sGV4ZY4jxFCy68Kih0CEbnsvtgGGdXhkPykplDjwpg7uYHENUW2zc?=
 =?us-ascii?Q?gVop2rRoUzLTZJMf0ebc2guFB3AXevVgthfWtTGrKlu0swRcArf0LZGDhKZc?=
 =?us-ascii?Q?wGh0yX8eLz7L6OFYT2e319IwYPaoxnERNuJ3tpCVXlym6kKkJsLuOUsx0CLR?=
 =?us-ascii?Q?WsjiPGxRmJm4RQcDlaNg9NABmqU3udAdrpoLvAC1CBAdYVg4t2nIaeJPPLW0?=
 =?us-ascii?Q?TK1OaqepRxue4ciYQLKVTNnsEtMhkAMxi7Vg8Aync6fNvxuKlfvMzApE2ZSq?=
 =?us-ascii?Q?7R2LANtN7T46L+gDTZ83PnZv55YUlkfopUqfTFBgH+Q2lw8/PRHb/WQJ9V0z?=
 =?us-ascii?Q?tEDaKLsRlCBU/DDYwnWWsT6HqTxzlqNxCoQJh5EcDmDCokLXsbnKYzIJst4X?=
 =?us-ascii?Q?zQFvtZD5vnykZ1uHs1hDQn3YGBKerl9RkIIQ1Rbr1ioNmMGtqWnJfTngHWJY?=
 =?us-ascii?Q?ZB5/dHlrZ5Fy1Hs5ytbIPqkMpAe842lqnjlzj2/hwgV7A3o5Z8frMDkfEnCW?=
 =?us-ascii?Q?G3KLHhXi4gfo/7Y04HoHqwsXuN8z1Q2y0TliBJsK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41284ef7-0e72-4b7c-3269-08de1a6be30f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:40.7437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlO6E0sQbLRasPfzidC44ZDt58yW+IL7fgrSW3Eux0g3a7FRxpMTFTSVsOELIALNwRL+0K/X2Zku0vGqyNlXcQ==
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

These opcodes are used for register write, modify, poll and store (save)
sequencer operations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 138 +++++++++++++++++++++++--
 1 file changed, 131 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 48c40140876b..f429fee01f86 100644
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
 
@@ -83,12 +116,103 @@ pub(crate) trait GspSeqCmdRunner {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
 }
 
-impl GspSeqCmdRunner for GspSeqCmd {
-    fn run(&self, _seq: &GspSequencer<'_>) -> Result {
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        dev_dbg!(
+            sequencer.dev,
+            "RegWrite: addr=0x{:x}, val=0x{:x}\n",
+            self.addr,
+            self.val
+        );
+        let addr = self.addr as usize;
+        let val = self.val;
+        let _ = sequencer.bar.try_write32(val, addr);
+        Ok(())
+    }
+}
+
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        dev_dbg!(
+            sequencer.dev,
+            "RegModify: addr=0x{:x}, mask=0x{:x}, val=0x{:x}\n",
+            self.addr,
+            self.mask,
+            self.val
+        );
+
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
+        dev_dbg!(
+            sequencer.dev,
+            "RegPoll: addr=0x{:x}, mask=0x{:x}, val=0x{:x}, timeout=0x{:x}, error=0x{:x}\n",
+            self.addr,
+            self.mask,
+            self.val,
+            self.timeout,
+            self.error
+        );
+
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
+        let val = sequencer.bar.try_read32(addr)?;
+
+        dev_dbg!(
+            sequencer.dev,
+            "RegStore: addr=0x{:x}, index=0x{:x}, value={:?}\n",
+            self.addr,
+            self.index,
+            val
+        );
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

