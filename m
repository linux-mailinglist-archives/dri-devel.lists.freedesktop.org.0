Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617AB3C1C4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B20F10E1DF;
	Fri, 29 Aug 2025 17:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WhF2b8YT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407D510E1DF;
 Fri, 29 Aug 2025 17:33:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1SOY/sPTamjot70BtHP0t4F8iT13n0ug7G1E7WsgFvQ5Ane/92OJAuzGMumc0T31nLgdDL+nSD4VV3qrSO/Xn26JphEyfdC1dkl7YLmVSQCw+2zdci95qepr4D9zqlNkdI0GB/hQeXVsW1TSyJhujEErhB3aEOU5EMn54pdDt62Lh4wi3dsGBhoV9EvodQ9sMuS+wM19JTCKSHf31CxeBRh1tvG9qFISSZf7jrkBtBvK8mKVRX+tJy5pHJDLN9/UsR7Agq8JOAHbC+y5AAVC0+0ZUUSO9AgHhAINgoMwhvHL1dP6in18e7vyY6AnvqA7Hy7fuCbCnxt8xcEgHqStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMZ4YmwNecklRu6QmIOFvmvuK0brJwjhuuDDYYGu+2I=;
 b=T1C9bByutpi2P1l/+1PpMzQBgvo6lomCGRdzPQQduH42zBMJ9NwOxYBlmZBe643tuUhTSvzLLt3Dp0HE97Y3hcU0D+Pl7CSwUKl8SPQG3+ESdkPE2KHpl3pMoLxyk6VuOkCCd3TUAbJ1e/QXhh83qhtBkO3y8h/SxgucgEnhw09Y8bfB1cHLqySOFgKnx8lVrG8wVmYDpC1YKYAOw2fzFTwvUOVYbRXYBgfDQnT7kWqD5XEQqokcTo7mMKaZMcFzA+7Wcdh96qeahPxkiw5GFvSqxmVxBnYZ1JpuNFpyYpEytsvdEisZSZ/R9CO3ebFaEpmm6bykFYkFIcFZVz4zvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMZ4YmwNecklRu6QmIOFvmvuK0brJwjhuuDDYYGu+2I=;
 b=WhF2b8YTMN+iuOLkiK7LnlCb4S+Yk++n9B+X/1JnQfvmyIkDX0hKUysjvsjO/Pn7h+ATjtCQgyrSZzM050hCuv94gvsQIqKsXX2SFevVcf58I0f7cQNVhCRxYrYGJVkVjpqkSGrblfO0DmvxhK9KeGK0RFqHrToR1gD7M2eGRJHh15yU9Gf04rcgsxjun/Pam13svCnZxEmS8740juil+UCIsl19C3h5IFDsTpp8R9upmyKutD2/yrqV1Rqt/5/448fCmKxba+275U4/C95IAH3+BPp/rYoi3ireICn9DmR65+UBkHWiOV0NfRF8EeaIetBPKPj7RDrexg1QXKcf2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Fri, 29 Aug
 2025 17:33:17 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:17 +0000
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
Subject: [PATCH 05/17] nova-core: gsp: Add support for checking if GSP reloaded
Date: Fri, 29 Aug 2025 13:32:42 -0400
Message-Id: <20250829173254.2068763-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:208:32b::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 660fab16-3826-4823-0986-08dde72223e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bxoMVukj2GJfgSTj5MkQh6CWKSHt+g9jyGZ4pgISg+lnpQtShwdh91chHbhN?=
 =?us-ascii?Q?vNaMIdm3Wlez8T+aNfOiQMjFLmmtKS5fISfYLWnLHCvA0YsKHBUq4FvydusK?=
 =?us-ascii?Q?sbSyzM2gOvR2Lg1jukRT3aw426r7I1sz7aUDr258ZZEiviN5R2ReKqq+rdOz?=
 =?us-ascii?Q?FB8DsdlKfCSv8Nz0P17xbQTwhVYORn85GT5EBuE8esryyWZ6ur9PqCtR15rS?=
 =?us-ascii?Q?YY+Ff8rf3iaK86w02GbA4vXgmcv/wjseRDvAAH9t4Hfxu6v4hMcBY09ph60e?=
 =?us-ascii?Q?7igD6YWAfNOPdYHUQhXXaA1ScLW5QebZAROOeus4H9G7rHKfMYXXTlmBu7ob?=
 =?us-ascii?Q?pa6MRfsH0mA8Dbe6t/z5vBieA6YXPoAqfYedP4yH6vgA+1KyIIDGbvKOAl/w?=
 =?us-ascii?Q?PFdIs4hcCN0qDmfaGfJEU+d+JpExXLwzhlhL89yO5t542CKlqIfGmZ4WvAye?=
 =?us-ascii?Q?HZjVvYI39KBANyDYeD5SRoZwbB8oXYLCZNEfL+HP1Ih3Tf+WLQ45YgxjXrOJ?=
 =?us-ascii?Q?tEl8CwlX86TlwbXMa8bd3SZHMDHBdtTOmtPhEdRtS7Qo3sBNnXCchnORzWZh?=
 =?us-ascii?Q?ROnnFMW76pK1jQYxCcrJnkyZhZ3giDWi8cxq9oV09Gv80obUJc47D7VkaDmK?=
 =?us-ascii?Q?Irek+DM+mDr6LsoZ2+k0zx1sLMSS3nh2bWEwfnPsbyCM0S8D+iP+ju/6wE6K?=
 =?us-ascii?Q?kRCqWCuJ0wUvCsuvZEqiGFznA9V30zEvihRMhmm/PaPuUqb7lq7ry1AqV445?=
 =?us-ascii?Q?JJJ4HyynopCEeJE2Ii377cBOe5DziTIL3of2Q2NG8z7EiGzxWxc9ocJ/2wxb?=
 =?us-ascii?Q?QNgY+KlNQiTnnIKj8AVOBKYWFei7UrdlJRxwiK7ZbN7cCBLK2sX+PAX15+Mt?=
 =?us-ascii?Q?xR2kZ7uY7REilS7doIUPa+rB/sDHQFTFUyW3noG4vneARgJniWt0cyWeTG4e?=
 =?us-ascii?Q?WR1zCyShLlbeg0UTtvjCJZvH2DoZ1sTEpHRMqT+8qbEbDpwfX7MF4Hg4sCHz?=
 =?us-ascii?Q?1mCWW9fmWQi3OweN50Mzarq/F5K+/Xdf4wGHCrCjACh6jjM/mcMlznq4u7Cf?=
 =?us-ascii?Q?DgqNRqFLrcDE9YgpiQ0TXXNFeleQXhoj8d8Whi/Cwzg0hFk/kD93N7C+qNiZ?=
 =?us-ascii?Q?a8y8MNY0M1xRON4yZXFbjZocps0t26ECilnFKYpwXMyjo6JPnTtEGDh9Jiar?=
 =?us-ascii?Q?guBhKIY130SoIHYT2qKZn/PdUcF8puZbywjwnUbZfoRJRvDivtmYKoOSXGaF?=
 =?us-ascii?Q?2IqBhZu4hvkSvk61/lMYxbaPHblRWlyOzy7M92j46JEGwKFmxeE2vW3R/qRe?=
 =?us-ascii?Q?zoiyQjKeJmvO4LGKm/sh18IXC8TJsyCqGDAh2pLSJQM4ZRCPrf1lPe0LyTt0?=
 =?us-ascii?Q?FFuR8u5KKYQmJG1xyjoz9Wrx3T0NXs3TETsOHR60L89iYlx2Xg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q0e2xZj2xPcYwxLNYMI5hyn9Yhc8FMXKSIUxoyS91cEm+F3shXYhkRnXKUd7?=
 =?us-ascii?Q?auxNr6IV88biAC70bAkjcBnOrhZ3Rrn28mQ+oRMDh2f9mwoD7ejsUZEzoevX?=
 =?us-ascii?Q?XL/9E/IajTPXtr4K6ToJmGurUa4bpCliZUO0RgPKGcGWWtxw5jNfpJ98//07?=
 =?us-ascii?Q?Qgtu+Q2LYzI0cFGrDkj7ruF50RsrPh/8TlZcxhIMCtMfQ1r77AglaLhQ8PIo?=
 =?us-ascii?Q?QYckMgkIp6T9hdRJdepFw6wRduEhXigEfjzJEoU+2+DSnkdJLALBKSpxMgIr?=
 =?us-ascii?Q?JJwrLWpMnHzba+aEYuyZh9Y73IJIQKVqi821QOuxHeZJ5T/MZT8vwGsaKEpx?=
 =?us-ascii?Q?GQ8WpBTv8QjoAyFAMQVgG6kQJkIRqbI74rdpht3gOmKW1noZJjR6Zi186KSK?=
 =?us-ascii?Q?NB0xvP/cYkz8gejRgfbvrb5V92niARXJTl4qRRxTxcMJc1v9vCSFXGEt9gqN?=
 =?us-ascii?Q?8a/3XEXr3b+bxJp8CqaPhW3JfyR8tzX4BhVkigd4pDaRgbzlPolr2qwEztcD?=
 =?us-ascii?Q?gYD2jA8Uu+RCDHZhYZB6WAw1qdqNQo62qI+0plfNx5S66Ey9SoBXDMuN28Vq?=
 =?us-ascii?Q?EwE/yux0AhoaJ+hLtBRgUj3Q8NrM+zYJpH86IJ6icphmWIA6761U61l7kVTY?=
 =?us-ascii?Q?geNFb4jK5uj38C5z+S9iVrr5qMi1OmW/KwLkjbJuGDYVD1Or3nq92jrIBy5t?=
 =?us-ascii?Q?VrpCD6eJf6EOfgf0Eg00Wb58jkTCgpBhWDTZ0bd6PcKzmpvuwgMm6TA8WbNh?=
 =?us-ascii?Q?8quKf8nZuaTb57VIqEVaETdvY7Kp9LfWKJH0PQZweV7pjbAwSZFxeGjhld3H?=
 =?us-ascii?Q?xsjF/iadpByKCXAzjEuvDPiocFC1qFott45PIMvtrZL2GbbnQmEgMKItJ1kr?=
 =?us-ascii?Q?r+cLMggx7VzUala7hRVbofQZSBkyFnCNhF5AHTiNdFzEf/UykyvaNVK8+86Z?=
 =?us-ascii?Q?69TNjvDlZIMfmHdFLb31fu8UY2YF1ZjPfsck80bed7BLrP7LLw9RRO61WZCw?=
 =?us-ascii?Q?QUbPVvlcmqPxBlhGwaqVrFtwjr5sgmDy5ouu9Y1aG9abf8+5qJelfZo804gU?=
 =?us-ascii?Q?5qTd1udmrgHO+QYzMfWVhy43smQ2EKvVddhLt5rmOB7NQWPKPgmptwQDVb2e?=
 =?us-ascii?Q?8rpEKgVE/QbEqJ1mZky4G2rTW8sbC0Nig6CEbFAtV/veaI74nSLUkk/9QCTI?=
 =?us-ascii?Q?n5ZM+E0Ev7sALJRdTMbubapCNjqp4npH7DDQ7ET+joaJ4XnTvGDcoyz5QKGE?=
 =?us-ascii?Q?hgCE7sSWr7nseQEUQ8beY4SAwTGdhJQAfSS2r3otF50004YJZ8NEv1ZE++jW?=
 =?us-ascii?Q?QDy1gHViT0Gkxb2kju3zfWetjYCbteOybWJLis+aIA1G27VxSw4A7W/jpXJO?=
 =?us-ascii?Q?yAweEU0mEsDZmA1yRTJsI3vUWp8rLQtd5SB7iRgPAt9tnB5Q3Hc++798McRA?=
 =?us-ascii?Q?kSAe3N9F/OzKzvXQoYmhgTsZc0O4wTRtrXN2C+NtAu1vWplJCC1HgtgK9irw?=
 =?us-ascii?Q?9uocnzUGb5y/4o5eJkuPKboMcM/SQGbD1n7DBn+6iBsFcvU7yF0qNaBMgg3p?=
 =?us-ascii?Q?G0c/8Zt5cHw7AZ1utHLCoi9tfgmknRFZrPXRnZs1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660fab16-3826-4823-0986-08dde72223e5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:17.7137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6EZe5uOmi+k4ioeRV5GuIxkpOUVGrdREZtgnIda5jZjnxbTCAbOjMlVj5UNFnCWl3/XFjboWUiQYRKMxv5eRg==
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

During the sequencer process, we need to check if GSP was successfully
reloaded. Add functionality to check for the same.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs | 17 +++++++++++++++++
 drivers/gpu/nova-core/regs.rs       |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index f17599cb49fa..58478ada6d3e 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -1,9 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::prelude::*;
+use kernel::time::Delta;
+
 use crate::{
     driver::Bar0,
     falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
     regs::{self, macros::RegisterBase},
+    util::wait_on,
 };
 
 /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
@@ -29,4 +33,17 @@ pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
             .set_swgen0(true)
             .write(bar, &Gsp::ID);
     }
+
+    /// Function to check if GSP reload/resume has completed during the boot process.
+    #[expect(dead_code)]
+    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
+        wait_on(timeout, || {
+            let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
+            if val.boot_stage_3_handoff() {
+                Some(true)
+            } else {
+                None
+            }
+        })
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index d9212fa50197..c214f8056d6e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -123,6 +123,12 @@ pub(crate) fn higher_bound(self) -> u64 {
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

