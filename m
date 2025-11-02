Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDFC29AD2
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86E110E1EB;
	Sun,  2 Nov 2025 23:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L+CwLbu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010063.outbound.protection.outlook.com
 [52.101.193.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2263910E1E5;
 Sun,  2 Nov 2025 23:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mo/kmp8vPG7QhfmUs1rlPJ9nL6N5poZOoTigbkxLbQytuLL6XmS7Lx1ljJXorqo0p87BvzOzjwk/mYbAELAY5d8V1sZt1ERvMRhOlWzWMl2Mfwdl0/zay0wsto3Jkb6DZkwxQONHW1eJDfhjNH2Zeh3Eye3wn007pW6jMCu09oZAUjxFcDtXh5qorjqbxJcDF/TvhTtIn3Qp660f77s5TUrdfvAmz2ubO2w0+hFCHG5RUhtQXNepfWqSaVJLB49O3my0ybIgy/LW5bEWI9x8GxrzbaRkEuHa6/o2aphIklqoTasJyIZE3hOEkeVdTYuYzfXwikn6a1+dLU8BBuPn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbr8MR7v/SPTXXezo1T1NaaKZLVMT5RC5w054eIxFpk=;
 b=tNC2BTTxAObQbuw8X26rEs3KSXRDIKpveEKMoU3dF7vD2KURL0azXvyXQ3TJh//xrVzmdPjNBizCyE5BRZmGj1H1QyiPIVx1rsC9da6Q5yLu15nJawydxHfu/ORnTU89PtAJDmagn0SX/5CB2w5UNmlVcTRa6dY+gbDZCaTj9wejEc3B2PomLhx5uTRFt3HibNo5eGgbfKZYS8Sh6/ByjLk4xzuVsNMLapEqmofxbn9T9Q3NS9tpPJLmDjyFU6IHEZM8BQeXd1cSOrV+IJExspAR8WF2eGe75Nd4PLYnaLFXP1OsbQt65Dszw41nYMHsEv/vFdToHRWZPgi4cixsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbr8MR7v/SPTXXezo1T1NaaKZLVMT5RC5w054eIxFpk=;
 b=L+CwLbu+kB8tfFXn0gOusMTQCga5j5JiapoSjsWLnJZ4xpV6M4LifVsiEAVbDnbq1AnrNyMLlUxAGzGdOBfI5Zjog5mDGgsPRVmks71po6z88c+eo+8388LN5FQIYrSNzK5MzmPA979faMdHFJHwbnTZXWANoc0wsE9KkVlZSlecGNHpcU9Z332N/kDvlfwlj2GUqaNhl7XR2/vwQakpQMEY0um61T2eTY4bbdrz4sBZs2jQfthMF/yHJOKLeYg593Cfw2VOttXBXf1TQoI89kp8mDOxkHEJf0i0syn9xOuX+ae7xvbi0YpuhD/tWzugbp1QBe1m1Oi3zXXgw9bR/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:42 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:42 +0000
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
Subject: [PATCH v2 09/12] nova-core: sequencer: Add delay opcode support
Date: Sun,  2 Nov 2025 18:59:17 -0500
Message-Id: <20251102235920.3784592-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::27) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec8e691-37a6-4643-9e3b-08de1a6be400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zImF0iOScaE2oZhmf+x4MCbHuwSvjetHSpCAEFK96tuQVrhTpbsmtCwFpOib?=
 =?us-ascii?Q?edloAmSuobwF6QgqHvgywe00+CBMJncXNYOCzqH0ESKi0ckUHmLY/s39aHl3?=
 =?us-ascii?Q?Z0rcTh9lEysAjuUVOWNitLJTrS/yYYkEg0mBGowyjMWmxYKltEa0TcEN3pvj?=
 =?us-ascii?Q?05fjmdekEYtm+mUXtRfK7P/emBYVJWWQkoxwsKFVop+p+OHf/LW+gfcr1A1A?=
 =?us-ascii?Q?ba++cuVxri3zWlW2LsDCuW1DZdP4kJqGhdAhKquLbtHSk42HsLQTWQu8S/OX?=
 =?us-ascii?Q?Hca6tozFyTlHfQMFfmgaYzJSmaDRKYRSOKvMvP2fM0u64+cWVB/eJhmkVI1M?=
 =?us-ascii?Q?VKvSzhLGIGqwScv9znfLFqkf0SLDwabYw+z0gBzdLhqikWvqHuuN4qsMiyLj?=
 =?us-ascii?Q?TpVOvcP2DnErCOFs4Y64Ks52TFpFJ0GwiJtiqKgAfOY1HYSyXecwpBK/o+yQ?=
 =?us-ascii?Q?bZeaI6vp7xjcmnHDh3t2qE+G8nM5O3Rdmpv5D6+YQWxjm1wvhotcdhJt7U2H?=
 =?us-ascii?Q?7eY+uGTVTM12vfNydQEKbDEOIhebnYcDqFh9Kxut6mcipuIW4F+XOQW5rOCc?=
 =?us-ascii?Q?ITOONtAAXMsQYwbqrfvxv8UuJhMmpYyfZEK3J8GTcdejGsxDyfkPGna0CNEa?=
 =?us-ascii?Q?8UKZxd8paAvVf9RLLhz1L0CnBnxFrZHqWuMAKemjNTBV8AcM15viz5sVd+aO?=
 =?us-ascii?Q?xVRMZw1R7Vpk+7xAtb4kwKaEj5FAnDyD5bPtKZ49GZ5l/xtqh8vcZrwZ9rNn?=
 =?us-ascii?Q?7iqJTuLm7+sMdkYrRC1jJpiPj2tpmT4fmBprS1SqeeJ8BKWROK2QMVfQht9q?=
 =?us-ascii?Q?gpZYddMEYE5kcnnjw8YARRnyVWnqCNndy4YhAv2F5p5CvdllBp1gPJTr1VBt?=
 =?us-ascii?Q?xGBX4RhyffL5WCqpZqhS7Sxqa3YAtFfojxUFfPXrrwzpXnCYQUXlQBXr1D5+?=
 =?us-ascii?Q?JNOZbxovY2ydrO9TyylFrBws35VkcYkZ7IcI83A2K7mV9Y9MQibm0zXKbSL8?=
 =?us-ascii?Q?8L0N74rvIs7QyRfnBxn4xRz4hdZMOPzquRkHbzfgiXft2PDyUkI93wCQSLpv?=
 =?us-ascii?Q?rKNRk3FlY8qMIli7s+Gxd/Xy0ZZbRIVQS/PkO8+yu+ON8IMMBWk4gk7AUW/P?=
 =?us-ascii?Q?M6W0XLURoTA0o/0h4tUAR9Pyew7wb+3lJLpg32YOXHdrgiwKtQXtuciplACu?=
 =?us-ascii?Q?JHeiB9JpywsfGrgYoCmjMWkHcXQ0AAlhcCjZ4L0Te8emIoVi+3V3mF0ciJQi?=
 =?us-ascii?Q?NNaxLHu1WLQmMrIj6b8+7S+Np+xMR3hNACzg9ngtaS6qWflJDpokAWcjWkLc?=
 =?us-ascii?Q?6Q9o2XYktAWsd6OnYjIioMcuKpXT3e1korCmZpBbybwWiPkKfmA78qEp7X2h?=
 =?us-ascii?Q?pVvsdhsYA6jf/0b9LTkOuAwOBLBpLuYUzkqDswCQjkPK6bLD1Bup2l8acXvb?=
 =?us-ascii?Q?fHqtbggSv8l2tOr2gvPt4S1jRXIqjzQK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ptVoJ3WJl3wPsXWDiaMNvWsYZf1Jbe/tdyroWBO9rrrhYoqJdwX4LCh4aPnZ?=
 =?us-ascii?Q?VwBLFrzvYEJWzcouKfgxptGJPYY8WWhPBH6hSygFU0UuoLDZ0y7tfCLLdd+l?=
 =?us-ascii?Q?cTln+dz41vcTSlJ83MSoZ3qTR5nlBX2J0OsNbXKje/EFt6W+5ROKOfaj8qgX?=
 =?us-ascii?Q?/y+w2ZJCEq3wDpouS1lIoiyoPWSKsxBUCzX1/IaIiErGpLMxDsz0Ppukm5GD?=
 =?us-ascii?Q?BFDafAbNLHleueUDgvfrHny2PaaHU4L+tKnDH54p6cvaPknQo4qM+5I92WQR?=
 =?us-ascii?Q?BXCUF0VXO4Xt/acVCpaYXQ2WkjTP3+AVxLHRmdkH4nUAeP2f+i9e4+/N0IF6?=
 =?us-ascii?Q?2P4o5vzviCZPY6AaNRJB24X5QtVdfgL227gBCPZgmrlh+I8UF6d1sJ25Gt6q?=
 =?us-ascii?Q?mkhnM2egJmAJwto0vZ7wk0tmd+H2RKvP2cM1WoVJjLkRzqxuTPWZoSCVxy9l?=
 =?us-ascii?Q?+ACwoL3q7Vv5b7/0nx5EQMUXnGVx+7XKG+yCyNZQYlZoDOxMElsU9rVUDnBd?=
 =?us-ascii?Q?E3+4IHl98EmhVNw7sbcOr7mrnBFA/5F2NUfcOypVgPugNZGDAMTLztduU3NS?=
 =?us-ascii?Q?u8+v7EaoBq3s7pS4NR7tH+w2noyTbdHe8A22WRS/ySKjqG6hV9A07flGTwsO?=
 =?us-ascii?Q?nEgUinmsol8H8t6JupCgDJ+LK2DXDc4oGzw03c08DOqs0Ex0N9VbmUvxlEWc?=
 =?us-ascii?Q?G1vOXglnsbKXEHjYsRPkco6gjSji1dabMgv5mJQquXmSa7OMqDyHrD9xLkDq?=
 =?us-ascii?Q?t5JAI61lCc9fwxuG7gU2X+DBDycefEEwMiYgpYnTbLfZ3L5F6k2KJsA+YH0I?=
 =?us-ascii?Q?O/ztRNiDqGoAYI7UajfQLxuwP8yFDvnx/pO61k9zyQmAihekmHGCH7j/JJFD?=
 =?us-ascii?Q?QuJSiE7ytJ5g3xv0sGxX0MuFJ4K8Lz5k4X90FLuifsrFlcGWBEr+gRkvGRa/?=
 =?us-ascii?Q?CwmXBKdDKKXjV8qCiczyxslRXM4uLoK03VLLFq67UQQXk6ryhyoakykled0l?=
 =?us-ascii?Q?Rv+OvlEcX/OKKhvX2N46J2SaTJUXVwRZmUCdS6iKdcnREafL/CFXxb35+iV1?=
 =?us-ascii?Q?NOXZTPm6zbc5zBw7czyQ/YpkQyRV89vp61E+Czv6ipqvIe8ks/g7lPAWYUUT?=
 =?us-ascii?Q?g5ossMDOqFTExbAfNadrQfjVyWBgnj9JVuH0MxmD6+CPopQD+4HPvHUGkfP4?=
 =?us-ascii?Q?w89S45V9Qx5t7mNbOd2Pq7NOehLLsHGpSIhJX/UFc/2r4+CnMua4Zk0SSWWP?=
 =?us-ascii?Q?bH8kgIWLUioM+5i5oNXPK58iHrNy+vRiCAH4G32UvBbTcf4Su7+po4gcPq9u?=
 =?us-ascii?Q?GqFqbulKkLdi9D0gGYTul1o7D0mTnMOSiE6UtbfnuNnyY64FcXAmhFXnVhLo?=
 =?us-ascii?Q?C1XqXEqt6VCQEEuOAuw51hkVes10NgZ+UuRvSUSTC0pUhLGc2PqNX/inwv5X?=
 =?us-ascii?Q?nFXMLZER4C90K3wke6+cprYAy4Nk6vhKhlINMaN2jFY4a+jFLt/BZni/prjk?=
 =?us-ascii?Q?Fub9ZDZwosnGBTaIg5ELDKqpWm98mzf1erzVI2qXVQtmzsD4UDiJH2S2iKqW?=
 =?us-ascii?Q?WODX4qv9CJ0dckQ+V6e5OVCiDq6faJMTyViGKP+2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec8e691-37a6-4643-9e3b-08de1a6be400
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:42.3285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RE56QGt48p1ON47KExjmxWJLDMYx6QH40UA7WX6crPDI61+lXYumxq2epWJBXjViGZ20kZ7LRoUqC2g0tauHYg==
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

Implement a sequencer opcode for delay operations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index f429fee01f86..d08664044506 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -4,6 +4,7 @@
 
 use core::mem::size_of;
 use kernel::alloc::flags::GFP_KERNEL;
+use kernel::bindings;
 use kernel::device;
 use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
@@ -46,6 +47,7 @@ pub(crate) enum GspSeqCmd {
     RegWrite(fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE),
     RegModify(fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY),
     RegPoll(fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL),
+    DelayUs(fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US),
     RegStore(fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE),
 }
 
@@ -65,6 +67,10 @@ pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
                 // SAFETY: We're using the union field that corresponds to the opCode.
                 Ok(GspSeqCmd::RegPoll(unsafe { cmd.payload.regPoll }))
             }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => {
+                // SAFETY: We're using the union field that corresponds to the opCode.
+                Ok(GspSeqCmd::DelayUs(unsafe { cmd.payload.delayUs }))
+            }
             fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => {
                 // SAFETY: We're using the union field that corresponds to the opCode.
                 Ok(GspSeqCmd::RegStore(unsafe { cmd.payload.regStore }))
@@ -96,6 +102,7 @@ pub(crate) fn size_bytes(&self) -> usize {
                 opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY>()
             }
             GspSeqCmd::RegPoll(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL>(),
+            GspSeqCmd::DelayUs(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US>(),
             GspSeqCmd::RegStore(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE>(),
         }
     }
@@ -183,6 +190,21 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
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
+                bindings::TASK_UNINTERRUPTIBLE,
+            )
+        };
+        Ok(())
+    }
+}
+
 impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = self.addr as usize;
@@ -208,6 +230,7 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
             GspSeqCmd::RegWrite(cmd) => cmd.run(seq),
             GspSeqCmd::RegModify(cmd) => cmd.run(seq),
             GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
+            GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
             GspSeqCmd::RegStore(cmd) => cmd.run(seq),
         }
     }
-- 
2.34.1

