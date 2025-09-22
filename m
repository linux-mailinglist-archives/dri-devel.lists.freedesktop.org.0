Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8752B90601
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0813110E438;
	Mon, 22 Sep 2025 11:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ff9l+H+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013050.outbound.protection.outlook.com
 [40.93.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D20E10E438;
 Mon, 22 Sep 2025 11:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2bmyuA9NlVGoaAQ9I+bf9P0zL1ufdEGLwRLI+7+XNCenG3bLQEOnG/8YVBYo2CbnZqsgJaMFbSocBE5mXvsmPLbpT8o0GqTS6uW8BQbmlpmINnXzZGua0WY60nWTaUg5X8TEo1UimPkccl+Q7BvdbzFOzIVkCjFqDJcYBEc5BKXTe7GvhjAU+s3Os3KA+M7EsHUKv+V1RYHGqW6rG3yRP/Fu5hjRSMXkQkWgEcd4DxeNvgBJZPZuVM5PsZUXlsQnhRXy4qRe2XPRWVqr9yGFworC77wg71AT7T321pnOrq9rHe+7Co5qOCgOxpOa246P0LDA1FeNhzxoj7W0Fh3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwM7jCu+XmEztv06lNbnehWOVPrRRYvp/BL4GPbg4kE=;
 b=epGBnl37hO+CVYOmcSHVU55ksbLS1Fw0A8FSQkASsx5fTRlrFIY6tpZOxuoe/WHSj6H0Bh/n/bLfM7Wq++aonZcU3sryZnZNhqmAeyMAKy+92rF59IFuiuQoO6c5/+mBDlKiaYzdwyQiNvVmqL0M+lwABtD1sh5Ljlflw6PwI8i/9lki+lPqdAYrc7zoQ4rP0NgsoV0WXdLh5r3GYBXmVfltAtlUp77x48KS+gRr6YnNb9RzMgGmXLj64qyto9DTt5c+iyhfpzPCJL3ZuWTUgZmO8cZA3n6INfDM4/PgrDpnHD0gO+Q+FFpKOD8ohQfrJmtiHpliw72YDpZX/lBPdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwM7jCu+XmEztv06lNbnehWOVPrRRYvp/BL4GPbg4kE=;
 b=ff9l+H+Kh34Ud5uWIl+gPNQ30JM5VHVyGwEkhERNy6EVtCH0wUERUFyUiu70U85ZDb5JsQE6FFj/TjwExUJitQY5AqFJ/hKrXxvaNKKSU1QzbDBOjHKfSExEh7ZJNFNgFvMFagzT0Amc2Wnk4VkORjeshk1CG7dF4dq299DFPbycjmK2iKNOos9bKfevRVXqsH2P4TRmY/hcIpF31pCcTKBDa4owlEOFqptLFgsUoBbp5LKl+jyz0Rr6ZpM3tmJfqt3NfhsNf4CAWVK8RhHG6QlidfL5gsxD4SXW+OpPXiRhuHerOC5MS6IcQBncdLJ1uq3qYbWUBKesEQaD1FRfCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY8PR12MB7683.namprd12.prod.outlook.com (2603:10b6:930:86::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.14; Mon, 22 Sep 2025 11:31:15 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:31:15 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
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
Subject: [PATCH v2 06/10] gpu: nova-core: gsp: Create rmargs
Date: Mon, 22 Sep 2025 21:30:22 +1000
Message-ID: <20250922113026.3083103-7-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922113026.3083103-1-apopple@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY8P300CA0021.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:29d::18) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY8PR12MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: abf8eb2d-54ed-4c6f-e15b-08ddf9cb8a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?85KREc+tJ4HUZjc3y8xJAFB+1y7VyrRgK2ai2YECSfTUHMpJjkHa5W8EQxOP?=
 =?us-ascii?Q?Ck6bhyQ4rSqFJg5PkA7BQXJBNt5laKPknrnL1LjZtg9FxO/NUllsCAdUN9uG?=
 =?us-ascii?Q?Z68xa3MvzA5DQK6ASYHfdsWn5qctg07SnbOaodsGDZU0S5bvEgXccf3UFzem?=
 =?us-ascii?Q?aHYBOkh/CkTBU9maOdqO1Lm9sUa1PyI+JORBwU0+fZRSj9fuGW4zB+v2IXrj?=
 =?us-ascii?Q?o+dBRD+Cwmy/SovAw76H+GsLRuBHdj7hEo2lb3uZP5NeQyZXCAeNMNteo2My?=
 =?us-ascii?Q?fla8eaf/gacdjHwSKXBr6g/D2w5KS/XW8C95c8mvLdUplZhBcF8IIYFjSi9Q?=
 =?us-ascii?Q?hEiJAVHdhT4BTSB9b5TZCLkosrd1UueOHOv8qqPIIJgPEx8chp8LqocF8QxA?=
 =?us-ascii?Q?qemgQo7Tm5I4s4Qh2oVmfMYakuaS60Kfwir0ZOB5VyEdsdcXN3jOJYlSR7OI?=
 =?us-ascii?Q?9CNeAfEiadXooJuQb50LKTAmZ28ICLXzR4WqOq7jlrx06i3Ajxm/x4vToUs8?=
 =?us-ascii?Q?rija1TGzmwNQdTYTj2eOlcjnL+2VdO26JZtmY6Ktt6zy+nPxir5a+B/192FZ?=
 =?us-ascii?Q?4EUpFC9hnAVAEHoHVIdOwyaWyQe2Bru7gQdoUL560Yu7agcxd1lvJVs1fAG5?=
 =?us-ascii?Q?6qyxLcNeQ/DV2dffMBlZEFD3/55IhrAIAd1LEP8B49xT7LuVcVwpJ0J2Ak3Z?=
 =?us-ascii?Q?iV4No/zpngfy0qGGU3tY/O24KelWSi2dgGvDpFcI4DY69quoRmpXRbWQ/4oA?=
 =?us-ascii?Q?2Vb+O02SkFGUvJTVh/GUXoUe6J8/53PmIb5BI7/Vac8bVRTJyjpeGegxa+eN?=
 =?us-ascii?Q?9EuJyYs/fXd6M/zIl2oRsfMe2bi8b/fuBDSZQbvl9pipt9f0FPFbJNtGrMRl?=
 =?us-ascii?Q?vjIosejeZadpBHm01Prr9SWxVjI5eviy/BNJNHcDJBK2Pq6+UXA0FzD6v/5S?=
 =?us-ascii?Q?6Y3fPVj52ksezJ3KzxdPTY/t2wocHh4njMtrzg7QVqHGJ3SxBAd5G5/nZD5D?=
 =?us-ascii?Q?Q391B8D8eP2cJMKWMpuCrhxGNoSY0Px4uN9OW80jwGqaQ4a5lHLOT5HCy3h7?=
 =?us-ascii?Q?xNzz6XGmKQaFshucp30okQcht0Tn8G2L+AHM8XUFKm52xvBDJy9c8UDqYLJw?=
 =?us-ascii?Q?zEc3In0Z2ElJLvOoyfLFNowHcWl5JDQTq3NnB7XUAUuznfr6ImCrjb9kHJ7D?=
 =?us-ascii?Q?+obq/N4T2Cug6ZeyrM91FQ6eEut+4KpgLUTKOlyDPccbwhMoUL9zSg6kcJsQ?=
 =?us-ascii?Q?RnZxG2WfoU7HXzTCBVMJP2OUJIm7eyd8BYcDM2k0SWZfHHxJ0uY7/33dKcrC?=
 =?us-ascii?Q?YPliTXkcOlTwGlptsnTYfVqPBY8pJrPQj3dxUxyRRxkn4oyZaAqNpvosn+0G?=
 =?us-ascii?Q?ljMVg4lmO0puIM4CULtncbR9Em5EKSzignTRVdb2iNd9okO7iw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W+0S7+O98QIxNblDfrcG8MtpsTj6pqxzrS8oLpOHAqZczmDB29V8mUYVFzj8?=
 =?us-ascii?Q?nt+6WH6gMYvbZpMwADEE5drxzuwxZ/23F9G99BQvChQL01MsV3BwXmZS6GQs?=
 =?us-ascii?Q?TXX/QfOUBCBrfae6b4woI1SPYWTSm2Q5Th4Goz1tLEcQ9sBvVcccmNGCW+xB?=
 =?us-ascii?Q?MlUEf+8gXCt9+7PZsW5u9O7dKGeeoIDsXu7eyKzC+o5Ri9cPY0GI6JZUsiIP?=
 =?us-ascii?Q?bk0FUJEMlkPYIQr0rzIbpHq1ELLq1YTgd7jgaCsQcSYUdySFzbbjeawbr1LF?=
 =?us-ascii?Q?bwVWlbvWu9gJgxrA8+kQ+ajlgBENRxyZfsD8r8xddwjLw50kwE28WZLW03IL?=
 =?us-ascii?Q?bXfahfcxOHLABsP1k31kQM+Gxt1NRXFItVWSCRV985WFveJovJJUgSSoBSXa?=
 =?us-ascii?Q?tHmi6TagK2V8CcpX8pI5GRj+WKF24r0O3bzn1GmyvscFWQpjpzcLveJOUHvJ?=
 =?us-ascii?Q?7/aoKgyTeRzYkVYFATvo9iX7h0pRBBnCnQ7TSx0sNsEhpO+XGWM+AoUMl/Jw?=
 =?us-ascii?Q?hAE28CSW0y1/qtV9wr+DNB0Ay9MBQQACXZSSixmB4ho3pRQuixqt9T7uC4hc?=
 =?us-ascii?Q?ir3p0ujX2uY37Qb9qd9h2NvtI6EA10ckfqR0eRDq52nTTcKFCa2MBeg895wi?=
 =?us-ascii?Q?s+InOKQstz/8CdLuPVxxVJqRqnE3D2GdCRXsHNWZhLj/FlpLZeJqiltYc9t6?=
 =?us-ascii?Q?3gA7mLDy8FmcJyZgDKu+0pss9DvIRgzDltviCTPqvIRek5YmrpCPc0eWvckW?=
 =?us-ascii?Q?Mwege8AZM7yLVY/MJJScM7T7lhOCunYFv3kD9D+5mEsgu0m3O9/+S1nHp4jo?=
 =?us-ascii?Q?xIa8gkkTRaoqmb2sPl9jdYeo+eecKh0Qi7AgRJfxDLPLkARNlQp36TTktbVy?=
 =?us-ascii?Q?D3qZGsQMHdFRG2cvh/G43AmFiAA0HjJe2vp1ZHwdUGCG8+RUjtML1PPnxXZk?=
 =?us-ascii?Q?+KF0wroH/98cl/7dVSGCOCXUEfARw0Yv1c4Cq4tBOxvYI4GHU7naFxqmiQPg?=
 =?us-ascii?Q?T9Bc6jDra7SMjdlP2VzP2houUNT4jW7xrDsI0HbLH7utuoLR5tL/FJuYm11H?=
 =?us-ascii?Q?A4MflpRcsZnUKcpbPpI5l5xVfWHSni8By3+pZVykja9LOUmHI03e3Xk3yxNV?=
 =?us-ascii?Q?iV/iCVsDanuHrPYoE7TXz72WLOC5SS7tA0C15enBdGilVYYs3xe//T/w7v6h?=
 =?us-ascii?Q?OH3TwucNSewiR5U3iXgelpkZxSeuHKxaC31QgGhoNUgIb5I2JhNVQ+bIjx/a?=
 =?us-ascii?Q?ZoHsisURR1eaBMPKfhN6eh7NwZFbVgqrmXvsv4VA9wqf05nLDVAkJ/jdg3e6?=
 =?us-ascii?Q?qZb+6kS+NZCuknyCW888wsOcLHxuPdfs78PsDJVb2n9n4H0kegSeek9Nkf4Z?=
 =?us-ascii?Q?aOg7xGV4YZ8ztC7xcUG0Vi9A5vPZf/uxhDeyTePPMxXBVYIfFDAtx2C4Drr+?=
 =?us-ascii?Q?/HdDa4hFmj9aakZzIPwWWU/GYJml7K+O0m5CuoWAvpmNkytmSMMCmDP+5tLY?=
 =?us-ascii?Q?M8Y5EPwUEDRYSYSlacS10Z2uY9y5Z3rCODcz9TXckmn8YxceE2HZblm6E7mu?=
 =?us-ascii?Q?1K0IytPo+YxOTG99C4HP2Ihl8f1YIQY+1o2itgFU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf8eb2d-54ed-4c6f-e15b-08ddf9cb8a12
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:31:15.0894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uWjRmFMF/wsARspfqdQSt8v+ijouJi4mNkyF8jMfuJEYJg8wPqDDXqMXDsedU1+PhYoCsUc0yaLL1KObhSLrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7683
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

Initialise the GSP resource manager arguments (rmargs) which provide
initialisation parameters to the GSP firmware during boot. The rmargs
structure contains arguments to configure the GSP message/command queue
location.

These are mapped for coherent DMA and added to the libos data structure
for access when booting GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v2:
 - Rebased on Alex's latest series
---
 drivers/gpu/nova-core/gsp.rs                  | 29 +++++++++++++++-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 14 ++++++--
 drivers/gpu/nova-core/gsp/fw.rs               | 19 +++++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 33 +++++++++++++++++++
 4 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 3d4028d67d2e..bb08bd537ec4 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -17,7 +17,10 @@
 use crate::fb::FbLayout;
 use crate::gsp::cmdq::GspCmdq;
 
-use fw::LibosMemoryRegionInitArgument;
+use fw::{
+    LibosMemoryRegionInitArgument, GSP_ARGUMENTS_CACHED, GSP_SR_INIT_ARGUMENTS,
+    MESSAGE_QUEUE_INIT_ARGUMENTS,
+};
 
 pub(crate) mod cmdq;
 
@@ -33,6 +36,7 @@ pub(crate) struct Gsp {
     pub logintr: CoherentAllocation<u8>,
     pub logrm: CoherentAllocation<u8>,
     pub cmdq: GspCmdq,
+    rmargs: CoherentAllocation<GSP_ARGUMENTS_CACHED>,
 }
 
 /// Creates a self-mapping page table for `obj` at its beginning.
@@ -90,12 +94,35 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
 
         // Creates its own PTE array
         let cmdq = GspCmdq::new(dev)?;
+        let rmargs =
+            create_coherent_dma_object::<GSP_ARGUMENTS_CACHED>(dev, "RMARGS", 1, &mut libos, 3)?;
+        let (shared_mem_phys_addr, cmd_queue_offset, stat_queue_offset) = cmdq.get_cmdq_offsets();
+
+        dma_write!(
+            rmargs[0].messageQueueInitArguments = MESSAGE_QUEUE_INIT_ARGUMENTS {
+                sharedMemPhysAddr: shared_mem_phys_addr,
+                pageTableEntryCount: cmdq.nr_ptes,
+                cmdQueueOffset: cmd_queue_offset,
+                statQueueOffset: stat_queue_offset,
+                ..Default::default()
+            }
+        )?;
+        dma_write!(
+            rmargs[0].srInitArguments = GSP_SR_INIT_ARGUMENTS {
+                oldLevel: 0,
+                flags: 0,
+                bInPMTransition: 0,
+                ..Default::default()
+            }
+        )?;
+        dma_write!(rmargs[0].bDmemStack = 1)?;
 
         Ok(try_pin_init!(Self {
             libos,
             loginit,
             logintr,
             logrm,
+            rmargs,
             cmdq,
         }))
     }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index a9ba1a4c73d8..9170ccf4a064 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -99,7 +99,6 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         Ok(Self(gsp_mem))
     }
 
-    #[expect(unused)]
     fn dma_handle(&self) -> DmaAddress {
         self.0.dma_handle()
     }
@@ -218,7 +217,7 @@ pub(crate) struct GspCmdq {
     dev: ARef<device::Device>,
     seq: u32,
     gsp_mem: DmaGspMem,
-    pub _nr_ptes: u32,
+    pub nr_ptes: u32,
 }
 
 impl GspCmdq {
@@ -231,7 +230,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<GspCmdq> {
             dev: dev.into(),
             seq: 0,
             gsp_mem,
-            _nr_ptes: nr_ptes as u32,
+            nr_ptes: nr_ptes as u32,
         })
     }
 
@@ -382,6 +381,15 @@ pub(crate) fn receive_msg_from_gsp<M: GspMessageFromGsp, R>(
             .advance_cpu_read_ptr(msg_header.rpc.length.div_ceil(GSP_PAGE_SIZE as u32));
         result
     }
+
+    pub(crate) fn get_cmdq_offsets(&self) -> (u64, u64, u64) {
+        (
+            self.gsp_mem.dma_handle(),
+            core::mem::offset_of!(Msgq, msgq) as u64,
+            (core::mem::offset_of!(GspMem, gspq) - core::mem::offset_of!(GspMem, cpuq)
+                + core::mem::offset_of!(Msgq, msgq)) as u64,
+        )
+    }
 }
 
 fn decode_gsp_function(function: u32) -> &'static str {
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 2e4255301e58..06841b103328 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -158,9 +158,15 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
 }
 
 pub(crate) use r570_144::{
+    GSP_ARGUMENTS_CACHED,
+
     // GSP firmware constants
     GSP_FW_WPR_META_MAGIC,
     GSP_FW_WPR_META_REVISION,
+    GSP_SR_INIT_ARGUMENTS,
+
+    // RM message queue parameters
+    MESSAGE_QUEUE_INIT_ARGUMENTS,
 
     // GSP events
     NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
@@ -313,3 +319,16 @@ pub(crate) fn new(sequence: u32, cmd_size: usize, function: u32) -> Self {
         }
     }
 }
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GSP_ARGUMENTS_CACHED {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GSP_ARGUMENTS_CACHED {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for MESSAGE_QUEUE_INIT_ARGUMENTS {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GSP_SR_INIT_ARGUMENTS {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 3d96d91e5b12..b87c4e6cb857 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -319,6 +319,39 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const NV_VGPU_MSG_EVENT_NUM_EVENTS: _bindgen_ty_3 = 4131;
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
+    pub sharedMemPhysAddr: u64_,
+    pub pageTableEntryCount: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub cmdQueueOffset: u64_,
+    pub statQueueOffset: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SR_INIT_ARGUMENTS {
+    pub oldLevel: u32_,
+    pub flags: u32_,
+    pub bInPMTransition: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_ARGUMENTS_CACHED {
+    pub messageQueueInitArguments: MESSAGE_QUEUE_INIT_ARGUMENTS,
+    pub srInitArguments: GSP_SR_INIT_ARGUMENTS,
+    pub gpuInstance: u32_,
+    pub bDmemStack: u8_,
+    pub __bindgen_padding_0: [u8; 7usize],
+    pub profilerArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_1,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_1 {
+    pub pa: u64_,
+    pub size: u64_,
+}
+#[repr(C)]
 #[derive(Copy, Clone)]
 pub union rpc_message_rpc_union_field_v03_00 {
     pub spare: u32_,
-- 
2.50.1

