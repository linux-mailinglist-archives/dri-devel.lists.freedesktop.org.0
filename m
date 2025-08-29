Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E678BB3C1C6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFAE10E1F1;
	Fri, 29 Aug 2025 17:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NiDf+0iO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB07110E1B2;
 Fri, 29 Aug 2025 17:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qolDzcvIX0TwI6prCjunB6XAbNhonWFGCvDQtlPSfzGDpRPi6vhmmlWGl74gYq5Ea/HXcr+ZWrO0EUSMULatTpKzYHC9NYAOgm9Cm57ZLkRdvPCWjmDQBfNqOaJvOeOl/OR5v53PnEEVLG1HHrK/Oz6TJTRi6XdHc7NtiDZFdzfSHMaZofZ8lW8fUDUdM8VrnrnTYMhERE+Q5MfMjXiW0iC1z+AvwE4yNem9yv82CGlYPmpdK97pELsNzCtUFJHTVTjwRxs18rZ9fNaol0Lj0i5y5Cqc4a3S7/vaMMs2LC2mVP1usHBLZx0uqClTv9G6X5UkKL+Yz7cCqtfqSWw2oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSyJkHvb0BGUgQwnicjndloizivoVWZBwqdHOiporVk=;
 b=iimHizmv+8j/Ht4tY9nWvzi8YDBMIGg1BHOV08zhTv4mLMg4l+t5cLld0crgO/hjMNHdopgmDhj2cCQ4QDNUF1J89qDFE3RLueunl3bHMu37nLz6kfhsswvN3a6zPrmDAUkx/I1P4GWmWrO8f+imGLDgagPhlLWbkjX0HLIVN2stF19BbqTdeGiA7aoPbavU+n2InjU4un/JMitZUPOQGpQq/Th4jA/0x5JmyCF36sgEoyJsJNwCLsVjG6DYpJZKNtGVSxuULlAPwXzKue/BAmLAChUXIidMKe447pv0xoEvDT2ynSL7Wh/pzSmvVEWM/JFZYC1SnnXinUOq2mrRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSyJkHvb0BGUgQwnicjndloizivoVWZBwqdHOiporVk=;
 b=NiDf+0iOvc3ly/eeT6MkiAYas2gxUM881UJ1jnT6h38i8UqIQU0o27uTiihAa7I3UBGAIvBo+39QH3Hdn4E3vLESg40YK7Gu0Mwd64igydGWJl8kTeGrUldfRLwJUEPCpfdbdINIxlZxoymmwioDFVQ34APzvj5hqrYXcwnRxyoxBaX9GmSu0MftuauwYTz2dMxokmwIvEcowQS5ng+UI4JQFtrliJfDX48vtWSQ8heFaylOWSAzLPBl5YOS1lLUFscznGj5hwIma9V3FFIq/QFE0L7HGtFYmCDBYUuR1sqDeudvhq1v3Y8feqGIvFrWv5jPAVH4KEPCTHaw9oYWaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Fri, 29 Aug
 2025 17:33:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:13 +0000
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
Subject: [PATCH 03/17] nova-core: falcon: Move mbox functionalities into helper
Date: Fri, 29 Aug 2025 13:32:40 -0400
Message-Id: <20250829173254.2068763-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:208:32b::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: b84a70fb-5340-4cc9-a1e4-08dde722215d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VBX09/lcqF1tnJZEtnm6YYq1fdagPg4ylrd/CzZgXaGIOO8O81twRxr5olcI?=
 =?us-ascii?Q?pSjeAc3wOUA6SZlswPpR+rhAl/9MKdSstpaOZ5HgfSaG23F8sybudNfFDmSE?=
 =?us-ascii?Q?XesOeAZkoEv2Wg9WgS5SZk2QUeRq2geSuvsSixVHUukXKQp1USbfh6hXpzry?=
 =?us-ascii?Q?DNu18cvQsv9/02UL40ZWsDMD7ZF9Voz8Qc3BiAtTmfXjJvTM2anE8++Oy3EH?=
 =?us-ascii?Q?VqHgo/U0Qzbkr3zGrVZHVQT6gKV4wVzDEZRvnmjnBMlVxZ6oN9IMYStZXBUG?=
 =?us-ascii?Q?1GZvv/Iq92tY1qxCsL+vDJ7IRClVMC67OSFSIHBXOcMYDUt4ATkpnHgCziTE?=
 =?us-ascii?Q?uoWk/mw5KN4n6gKQV1gxBDoFiMUfy1sqQj9AE5nKgwTCEOvMhQOfWMdMtrE6?=
 =?us-ascii?Q?fdaD9Kp5YLV30GlxC1g0XoEIeKEZQZDQLCNrRqH/ioujWnMk50Nha1jRyeIY?=
 =?us-ascii?Q?fIF3p2ADXPnniI4GCejGzo1EwLLGO2IisLaY8nMqd8Hiq7bYrbKMvZfq0Oqm?=
 =?us-ascii?Q?Tv64VDdRaC/ZeLDY5eoMu2D2x+OKLAfjLZkjGrt6ki10EncitDT4NpVqLS/A?=
 =?us-ascii?Q?QeRXtN0/fsRZS4FxZCfVv14PodI8D4yby2NzOcseh30WjtAvd3UNKAmh7XDP?=
 =?us-ascii?Q?TtpAqhirnn2RkolrpS0pWAJo6oRJsSRb1QiqLAzS+AjHYI+ble4/9PF3LVgB?=
 =?us-ascii?Q?ku5hWMmix6IQ3oDjYxBV2mMZDMIOCmQTpbqqAefOmUxzEjEyJ2eNr5JaDS3b?=
 =?us-ascii?Q?orYnDy/xHjHppMTma+JecXkcpzb7Schy+0wrOhQWeM2hSmk1jc7MmnOLtxfU?=
 =?us-ascii?Q?Kg/BDgwdNobrVzmL8XMg0OFz/Syz4QCft9yrhl9ReRmDzxgrjUflb5UnAYS2?=
 =?us-ascii?Q?FzcYXDAXKt7VQJNHx1GsLPnddjDtFvbjACRZoOU3j95SpFQlgkyfRzhtAlpP?=
 =?us-ascii?Q?ZGJk7VtuEjmeaNgg4LwLsNOHQ+9ZjnBJOx9urYBnkzSBTqNLhDsC2wSJkq6W?=
 =?us-ascii?Q?tXoBdlYles3VuZwqVV+5osUgBFl18ewtGoVFL6a0PHNt8gXTY0W3SX+5bNAn?=
 =?us-ascii?Q?3w8x2MEPrgxLHCKVNOxqu8iePAR9qhPusUmMgqyb4BwU5I5bmSj3Zr1tQYOy?=
 =?us-ascii?Q?soDJEokMGCMsOrNpdB8b8YSlBGXQOoKNeiQHhB2jmbWifOZosdajllh1VvtP?=
 =?us-ascii?Q?wlaYe0p6GJYGzo0wB4H+yloYxUCcqlzk3u6XKulCKYmHrAwbs34A17AcDB12?=
 =?us-ascii?Q?eh+Sj++tUVIdQOye03wCnPfpNreQQMwqiadQNkMtCcwlK88orbhh7KCUdCSk?=
 =?us-ascii?Q?T9s5z6DTAwU8m5jGk774sVD9IHRsexkiiTYqxFB9QZxUA/hgvmfvqBhGs9Gv?=
 =?us-ascii?Q?jldVBWDl/lPRAfqn2CkPqThZ75cu4Zy6z6rM9kJmaH5GXZpk8SKAAndt73tk?=
 =?us-ascii?Q?ZZeQfTkU1vs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P27xEKB4gXlarV02yczhggJryQLJLetmIhBBQLxv5kQ3x0urQphYPDHoAqbs?=
 =?us-ascii?Q?85R9XHQegqbtknB6AzrM/5JnfTHCUH06BYt2R1H39HObutoA5kLWwd1zW+oE?=
 =?us-ascii?Q?/7jfzKWbCNK+UUoGSx1aKI7QQiNLqXZfd/ucd8jU1fpVt3Q74HQxOxUPHDQy?=
 =?us-ascii?Q?6QJJ7boh5MFnDJvvVUjSl5vjo4qgxn4tA2a1XyOMPyS4XchPpUg2GfL4/myY?=
 =?us-ascii?Q?lv6BAOkp1zEFqM0aO+ykUQ0hNFXBdAv1DFPZEWx/zb6nGrp/I+F+yO/5WGnD?=
 =?us-ascii?Q?QDbWmE9E/Vh0bfitBC4pTnGLKZZ7Dkeqz1xHfu0cFKAPJNQZfG4HqDxILqOQ?=
 =?us-ascii?Q?ZjSRk5Z3iHhEoIGCUaX/E64BqpMaPKsEolp4kXMnpHW6nv/FtDz4zrDqvjgD?=
 =?us-ascii?Q?SbXjwxx1iyHfUmRz4b2mj4Tg2le0YENQH+PgSLmqAG+cf5ks46fHr2Sjg/7B?=
 =?us-ascii?Q?AIPfY/k+B46WQbwYT29wnjQFC21vTWshO5D1lD9GsgkQZF+MtKtC5rIPpUAz?=
 =?us-ascii?Q?locPwIapmURRxbrac9ykvKryq0UC0ZAFHmom/JYJGbU5NXJWxYwPVqqOiMFz?=
 =?us-ascii?Q?qX2wgLi0RjWH+Eljqk7dFFWXjAKVu/+JVf74VjSKH9wQrS2ogXZg6ClQadye?=
 =?us-ascii?Q?DKIU3qdfPknVTBXg9EIV32gk+IS9DF+QIxf+PnJk9qgQpD+vi6KGfFuwu/36?=
 =?us-ascii?Q?r1r8PuzOF9IHYCw3C8qVdAVgycs/piPPhl5q53AvCNxBmKP0iGeTF0lsGTdm?=
 =?us-ascii?Q?rOOMGdZhnDaZlcwRzTfRQdGLm/9lgugx0dmNXPPxQOUwe95AqTlMcHc0eyiA?=
 =?us-ascii?Q?LsC9byypgD2XaAa+H/HnZj6bntg1nQF0cze8uMLcqgOwi9ZQPU8UDsj5WR+g?=
 =?us-ascii?Q?A9LZIkLpI7v9lZb0/WZFLTU7s68F57QWalumKtn2DbOVkxHy/7P/3CkJUDIo?=
 =?us-ascii?Q?2o/RpkFJJ5PYZOMgcr0NKdOi0ZHOuKB15mQnbCkifq6tEeEKwyBOBTmRvEGp?=
 =?us-ascii?Q?odyCgnpqYjwMTZVmdrgqmHEZEzB8uGhA4I7Vut1oHQKjdVP4cmU2lJvvsXqB?=
 =?us-ascii?Q?CLNDPqiWCAoXkBt0OR85MyGe0xB+xmeGWqeKouiXOG1N4oYCRJkR0a1Qs6AF?=
 =?us-ascii?Q?vv2bFFE8ed3FENXcFyp6SQLi+cX81B9a7y2AdYzijcp3lqTi84vdMeLHQYLF?=
 =?us-ascii?Q?F9XZBcM1m7aiiTQuUQelH4m6l32RRSugpJlSyKiypg0X9PvMMsjEPcuqbq2O?=
 =?us-ascii?Q?e6FKCkQX7Q/C/xPF0T+SBqrZtj7T5ZkxScYNu02XGDwjaXcgU8pgiwlTSTLn?=
 =?us-ascii?Q?3+yzqM9Ix/mkKJLQ2eHujC59qGPR6UbyFLkdGlZIzdoTfdnK0/AnQWaxSEL7?=
 =?us-ascii?Q?GNT6dQWHgnuklMDueuqrzyK6ytvVDIzEd5PONOw+JSjYd2hmXAQqOwAcZSnu?=
 =?us-ascii?Q?QNO4TuKWLo5ENHQbOaUsS9EEF+ld1CrmZKaFM3mEb5YNOtIJGK1zZJDNJ2ol?=
 =?us-ascii?Q?fXKr0vllywhOO4r1LbCt+b4P3Q+fqMDu6LfGY23FLWZbx+Qztp6uY+m5TWJh?=
 =?us-ascii?Q?OXHAtmmW1wLtcGAE3ygAHb9eT/MJgdQ2TaYnJ4Kx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84a70fb-5340-4cc9-a1e4-08dde722215d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:13.2321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcFryCeTBHb/txVe12Yvk8qXOzvR2uw8iLEazzMAWpY6sq/9zOIy8zxn7LXckI//k6Bac7DG1Yixfvd47nTkOg==
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

Move falcon reading/writing to mbox functionality into helper so we can
use it from the sequencer resume flow.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 51 +++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index e51f4d7469c0..054be6c094ba 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -576,19 +576,13 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
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
+    /// Write values to the mailbox registers if provided.
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
@@ -600,18 +594,45 @@ pub(crate) fn boot(
                 .set_value(mbox1)
                 .write(bar, &E::ID);
         }
+        Ok(())
+    }
 
-        self.start(bar)?;
-        self.wait_till_halted(bar)?;
+    /// Read the value from mbox0 register.
+    pub(crate) fn read_mailbox0(&self, bar: &Bar0) -> Result<u32> {
+        Ok(regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value())
+    }
 
-        let (mbox0, mbox1) = (
-            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value(),
-            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, &E::ID).value(),
-        );
+    /// Read the value from mbox1 register.
+    pub(crate) fn read_mailbox1(&self, bar: &Bar0) -> Result<u32> {
+        Ok(regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, &E::ID).value())
+    }
 
+    /// Read values from both mailbox registers.
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

