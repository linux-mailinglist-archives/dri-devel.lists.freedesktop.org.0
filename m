Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B448AC554B1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A3710E7D5;
	Thu, 13 Nov 2025 01:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nQqQyWp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010057.outbound.protection.outlook.com [52.101.85.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91ADE10E7CA;
 Thu, 13 Nov 2025 01:41:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKhbqsWgQeftlTMLNBQcRLBkDb+OJ9z6a29/8CBObQaMDKIlTkHML+u7UU2uyQiVS6fdlz5XfKuIgm4p8oXh0gA84H4Cfo+Q2D4MVwW3m2KxSmGokMKJCL9Z0TEfx78mrmIhYksOAw4B6cP7PMDU5vo2rNkmy/slvFxBJmWd0rnDpk8Xn9HjANniao9y16GFTXaadGl2L7n3usXZf5N+p+QGu6mwQC9FoVr67geItQxZQob2poMDDWXSFz246HHUo2hP+YYKB+tpz6fhjOibm+HBasTEf8ajrAgTIesZfC/ycvKdQb27jSkS3dReCPcQ5wlZcxYj3VB+roEbKStqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wsRU60PxIXA5Wylvi0b3QhRKsGEyoIycqgg24m6cNI=;
 b=Bp8pL/iCc6hM2fTt4gkNNX13OFGSgzN51l7Gms0umX7/XprH8jF/8IOxvFVOGj5xaZnac7sd8A2eczu2lkS9GExoIA3FCp40Gu144385Lp30ESctiF2iIWVFNoHNoFafjW4pXv8Q9haf0RNSEDokZ+zaoBWryELobuJg3SVe31VLIpWZEAbbXYyNaxZBid6qz5dahY8L7rlDuMcbx3Q1gOr5UZ7sXlimtvA58/Zyj1cAEG458TMnV1uz4xZzXvuagtVuwP+bEeEyUwoPrbdD/up/hgWTyFYG6EzbI1MmqeVE/SpuxrKmXER7SuGTzD/ifQnMvcjDBkuFWO2qOS/iPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wsRU60PxIXA5Wylvi0b3QhRKsGEyoIycqgg24m6cNI=;
 b=nQqQyWp/CLrS4Ujegohw9REs7WibkvWEfsKllIifVtbAsS+tqoG9bRkpGzmDFz13RXosLLhNNLVj4WUjfnu9/v3mZw1HjQVIDaOdvX0DKhAT1jVUeFaM4pSeHiow8ioNFlffKBlSxX3IrI7DXqxDrPg5EW9o7QLFynDN3Y4usv6Y96hKtjr6VmFN+HWFqCN8WDMQHNQRPNX4unAiQ+A3XNO4GDK2qqJzixyi76zVibDp4zwWOGsBlA48MP+YDtJfXXxkpL2RC/cZlilJqvR1ksOyhMaRJhF7nt8wBi/vmf1TYUDzMJQGxoLTrNo2LIZb5PBU/iR6xJJN4kWFV5Z0AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 01:41:29 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:27 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Lyude Paul <lyude@redhat.com>
Subject: [PATCH v4 03/13] gpu: nova-core: falcon: Move mbox functionalities
 into helper
Date: Wed, 12 Nov 2025 20:41:09 -0500
Message-Id: <20251113014119.1286886-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113014119.1286886-1-joelagnelf@nvidia.com>
References: <20251113014119.1286886-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::30) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9e712a-4461-4495-096d-08de2255c31e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0aNPCqhIWEJW0GVUwThBCTQFJ/YrzNQ693XjItAso0YUfGnq+85pc/i+5Zlh?=
 =?us-ascii?Q?0rpcZmjjebwwxJZmp7b1+aW9hFZF7MYYsk+mwui1Towc+GL3Zl0An41Y6vNt?=
 =?us-ascii?Q?od1rzks6kV0hYA9twJdqTt3zQbPW5j9AT251UV5X4sy34AlHw59V1+EiBUq8?=
 =?us-ascii?Q?CSDIrf2RCNNobZfx0GLAqrFY+cCbAeH0gbXhe+p88DfmSGLm3thXBm1HXPdb?=
 =?us-ascii?Q?0fbdAipVIOlcQrZDOVlFSb1eD/wxIHDjWIK8CRFikAvsmWofa06TJi3G68ma?=
 =?us-ascii?Q?O7036BQbt+4a1o7e44WOtxdnGVYspk44divEO58ALw8a0ySB2++FZenUaniq?=
 =?us-ascii?Q?vrZAFWVOHZ0CyoLYUbGf/SuPEPiie3pDnQgXhgGyiO2qyRyWY49DntesQ9jR?=
 =?us-ascii?Q?rjM7thHJh1v/DqpiJiqnkRUrMiYrEDNdmpbS0ev35/MJ8gZx1u+zx1UGwzkU?=
 =?us-ascii?Q?fDDeYgrIW6rKl2atR08+I6e638xLFif3HleFhhdjac7KjTuhKnRGEAhLxVK+?=
 =?us-ascii?Q?fHH+FA4DjbJKKan3oI/bnO9rS59deVnkVStTOVAzvID5995JjtRQBS5qoSWc?=
 =?us-ascii?Q?CCUqB+Voz1Zt/JLWOyOvCiP/g8iJzh2A3sIshW9Ckr4m1YpOHryfBK0zYqGw?=
 =?us-ascii?Q?RB6RKPCGOKLeSrBQKg1qE22gnSloReRTgmA3QVUhDX6bnE9Iu6KXE5LpZrk4?=
 =?us-ascii?Q?MOsRE5NRXf0yPj7LGxnnWdXTdl3A+gRs4Gy7CkZHv8GwCMwZiAYwg1zrKmEA?=
 =?us-ascii?Q?YCEI1bFIlb4cdJA3dW3vst6lboBwefdmaKhNSqQ/bGDWt2tge7N43ODpf9V+?=
 =?us-ascii?Q?9mixEg5px1roHD8wCVIinuslpGMKJ3CQfK7qRtzCiZ+z16aL49a6tFOZ/TO/?=
 =?us-ascii?Q?cWgVnGd9/ZlijsKmZDyZUSVbLZb6q03+B9r2neBoFgX5FrREW6g0ffOKXAYH?=
 =?us-ascii?Q?Jx8nGMMqjMUV7y7VihZGVHLQ15CpyKAtX65gLIcIG7HWg2rcFRHQAz5ixF8m?=
 =?us-ascii?Q?AuHKmX0Do9yWFlXG/wHIFsMrVuK9JGM+yhl17fhR8xugyQfmI3Mnn2Q71yF3?=
 =?us-ascii?Q?oGMZQpiPSj9OfJlLXtR2ZnKwNyZ8rwtOR9bgDxkPz8c4GI4dr6QbfZXjwBvb?=
 =?us-ascii?Q?DIuNJs/jGQyxR6DHBE17CYPmZH8XcVK8vTGm/tHgqeqqDU4+CFI8xtgeBJV0?=
 =?us-ascii?Q?kRzmyZPBFPRvUjgYsjE9fqIQNkM92v7bUCSewEpJvmoBVcBIdzfSaCdqOy8R?=
 =?us-ascii?Q?4eG1IUjSJ1o89JYblqndqLKlBNkppq0Q4f1aqNUvJfxf8kOn2ETU9x2tjl2g?=
 =?us-ascii?Q?9rur/1hEfVJ+8wtDj91ksAM9lHTcg6PXh+gPQFxqzm/y2WiOFkqTOc3kZwmy?=
 =?us-ascii?Q?M7gNC902AHS6BwVEZBN+e0i76Pg5qvGjClBJjhEn4XdTYNCDtGu9PZf0SweT?=
 =?us-ascii?Q?WE6RJOoQd/SCJENBlPCiumO5Hmn1bZdY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ekS0Z04LV52Py8q6ZeJV64S8Q97RNTEwzV99g6AO5bvycQi5YzSKbEoahIX1?=
 =?us-ascii?Q?B3+QNvjKcQCqozI0/9lUFJAYKKqWMPnusGoPekZ2FmvSEGLBW8aeSECCobor?=
 =?us-ascii?Q?hLX+aAkB5vMWnA4eqJmv3WMQgFRtKiCAd0Q8Rrec21Tcm2yroXBC4p0WCCd6?=
 =?us-ascii?Q?1nBF4WivrNeiYy47HxlIJMjVxbjHhXxx1LgRY4fKEs7tejQMTYSS+iFx+FrG?=
 =?us-ascii?Q?Qtgs+uu+Sl+TZv2shV+zSbTjJ5pTzn74eYwGrnQ4KC1RIpFYa7Vlu57lp8HH?=
 =?us-ascii?Q?QycYL3fgZuKUPo24z45rtuyZtVQXV+zfEN/GgDJWnPRQhd+wHpveIBt2wEQL?=
 =?us-ascii?Q?QXg+Y/6DSjWFHfqjPDQgQFc1xODbUgBbdcWDVwut9BMaHrggWTQUArxaGbYy?=
 =?us-ascii?Q?qCEZhHsMdVP1zSw7Cl1wa8VZqXewVTvPpDwTIftEYpjK5yHew70cwwd8qSW6?=
 =?us-ascii?Q?wWb+BxSktYxvNseb3A+KNXsFw7ewWY608ghHjwGL/gmCQTkOt5q5m8z3l9ub?=
 =?us-ascii?Q?0pUxtWhdFTYiu29ZVKV7MeHXT4JAGBr2q1/OtbSNGdtHjP1B2QSy8FJI9YzK?=
 =?us-ascii?Q?yR4XY/v83xBT7XvKOPRy7OUY1txGbaHOOTVDSIJJngN7Wqj6Ypvn6vB9lTLK?=
 =?us-ascii?Q?tLMrETaPe4T2nZkllnU35qdqt/ZLaCejiAaOKBhkQxoWxA5SmNVKvSpsxje5?=
 =?us-ascii?Q?YLByfuM5/xxBIGe0N2ujyo+ow1JYPcwe5E7jcfAMSd8aNiJfecSCo1fFUuKr?=
 =?us-ascii?Q?YIo70+18bK2xpPEMmNRIPuYjGkLYAr2m35E1SimPMbbnSVLfP6/qnkQo6YMu?=
 =?us-ascii?Q?cHyHCJfwbZw1T+g760K/y3wG8zDIGMFYBKiuiabyL0xyFEnTXxyoomUK7sMk?=
 =?us-ascii?Q?nDMm5DtZMh36JhnVriMQaV8mgaxT2O592fEY9jLkQqyZ9gTLbLJcbYpGzG+j?=
 =?us-ascii?Q?dKVaq+TCebTnHgRNsCsO1jTNTXFWExanYv0C57x5qv225k00hduWJmTNsrhj?=
 =?us-ascii?Q?Qnmqrsw2Ku9Ac2EQB9N4Oq6YFNSLtwhaqEYHzTeP2nac47dXNPzuPxhZ7uUA?=
 =?us-ascii?Q?pK8mOg54SVF6wuLWg4TmNw0MREW3vIhTcrED1dfA/0OTOxWFyfgvVr3JlvaJ?=
 =?us-ascii?Q?OiZoACsgVdhisJo5axNTs3BiL2ZYSkaxCBOpeLuZorZSyzbn/IbSlvo0/bRR?=
 =?us-ascii?Q?Mn7bby3prxzpppiQ9If9dVgsqPFDZUXSwpp7xYWp+4cbMKcKnbv8WU5IklmN?=
 =?us-ascii?Q?rWUie29AkJXw89PmS4MRzD6/CZi+4v4CxEu89Po7MCnk8jkDJF32r7t7P3+k?=
 =?us-ascii?Q?HWArAPWMl7BCrcOZ92dp7F71f6EKHMGHhhNS3Z8RehjnZehQzn2Mr5qBsOWw?=
 =?us-ascii?Q?3djd8C3qsqk4iJmxhRnLWfMmtBMobU2NSJxfvxBfqo3Ze6pCRI7olnlZy//S?=
 =?us-ascii?Q?Fdedy3SsOPNVytkz5FaQeof11m8MXiNRaKFzGVOIzKmKxNBu7Bbavz5iiELS?=
 =?us-ascii?Q?z/eIyOvskI1CrS/NIRMdgLL7AJ6kyKqcB3e+yb7zuvc/cuPsDkWOUvidCBhE?=
 =?us-ascii?Q?RoL6yIkvaTAyE7XPr4V/fyulnOOnRxQ2DwDzWMUh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9e712a-4461-4495-096d-08de2255c31e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:27.5215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/fr3JWSsdQzgAZtTPMRmOHpuPwZo9UrxMQXZERA9liwyqa0cr6xsbKJ8GgFd81gLKFxP8KaCWce60ZJ7dW+GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908
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

Move falcon reading/writing to mbox functionality into helper so we can
use it from the sequencer resume flow.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 51 +++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 30af7fc2814d..5c9f054a0f42 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -578,19 +578,13 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
         Ok(())
     }
 
-    /// Start running the loaded firmware.
-    ///
-    /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
-    /// prior to running.
-    ///
-    /// Wait up to two seconds for the firmware to complete, and return its exit status read from
-    /// the `MBOX0` and `MBOX1` registers.
-    pub(crate) fn boot(
+    /// Writes values to the mailbox registers if provided.
+    pub(crate) fn write_mailboxes(
         &self,
         bar: &Bar0,
         mbox0: Option<u32>,
         mbox1: Option<u32>,
-    ) -> Result<(u32, u32)> {
+    ) -> Result<()> {
         if let Some(mbox0) = mbox0 {
             regs::NV_PFALCON_FALCON_MAILBOX0::default()
                 .set_value(mbox0)
@@ -602,18 +596,45 @@ pub(crate) fn boot(
                 .set_value(mbox1)
                 .write(bar, &E::ID);
         }
+        Ok(())
+    }
 
-        self.start(bar)?;
-        self.wait_till_halted(bar)?;
+    /// Reads the value from `mbox0` register.
+    pub(crate) fn read_mailbox0(&self, bar: &Bar0) -> Result<u32> {
+        Ok(regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value())
+    }
 
-        let (mbox0, mbox1) = (
-            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value(),
-            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, &E::ID).value(),
-        );
+    /// Reads the value from `mbox1` register.
+    pub(crate) fn read_mailbox1(&self, bar: &Bar0) -> Result<u32> {
+        Ok(regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, &E::ID).value())
+    }
 
+    /// Reads values from both mailbox registers.
+    pub(crate) fn read_mailboxes(&self, bar: &Bar0) -> Result<(u32, u32)> {
+        let mbox0 = self.read_mailbox0(bar)?;
+        let mbox1 = self.read_mailbox1(bar)?;
         Ok((mbox0, mbox1))
     }
 
+    /// Start running the loaded firmware.
+    ///
+    /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
+    /// prior to running.
+    ///
+    /// Wait up to two seconds for the firmware to complete, and return its exit status read from
+    /// the `MBOX0` and `MBOX1` registers.
+    pub(crate) fn boot(
+        &self,
+        bar: &Bar0,
+        mbox0: Option<u32>,
+        mbox1: Option<u32>,
+    ) -> Result<(u32, u32)> {
+        self.write_mailboxes(bar, mbox0, mbox1)?;
+        self.start(bar)?;
+        self.wait_till_halted(bar)?;
+        self.read_mailboxes(bar)
+    }
+
     /// Returns the fused version of the signature to use in order to run a HS firmware on this
     /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
     pub(crate) fn signature_reg_fuse_version(
-- 
2.34.1

