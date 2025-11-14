Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC6C5F200
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9943510EAF3;
	Fri, 14 Nov 2025 19:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LJCt2NP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94FE10EAF3;
 Fri, 14 Nov 2025 19:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFORU0PbR8+9QkUR3dm/XHOqgvHLM/eD5isT0+P9bZf+om4IEXZ84penkn4jqWTUilqosVIDeEfZF2Mk9y4eVATLRBK2mgezzhePn4rusx4lD0a4VmygPkHHV96c0eiMbV32D5VoI+9Q43yt7SgZe7hfjQRWCnWfRaBW/fzsvCnQJsxAzZ9i0F9st3PZJ1D47IZXfhjjWf+/M/XRmRVaLWEYzVAuXG1D5SpHRX/T/QbFSP1Zij1aeUIZzsJLijWnx+fZZAwk1ifpId3Bxu4cMWqHYBlhZY49cKRZ6zGYKP3QAz60dd/jctxlZJWD94DRc9o2VJGpsqhPfQTYb4u0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wsRU60PxIXA5Wylvi0b3QhRKsGEyoIycqgg24m6cNI=;
 b=xv94wg9CXcWhwkFZzTI4pVdFHZY5AWpxL6gVx3NinpRU7eoSEDxFF9nhmLeUb6r0i3mRulbAxAZOUI5BRYxtADTAh5od4OvxmOcczrVoMbDsG18jLxz+u3pDA4e7ER5MznL9rXWwe8sepanjvwoeOBIrECO+4yAO3v6Z1cVCRcVt76fNSzd3jchVAjRZomBJhGPJLMJW29jCWjDMb+HtzAFE0S8b8xz6cj3c20qRki25cuvb7+Ht8x9rIcZqW+B/oFQJ9uAsmt46wsHeC+QYzLcTWH12YTdcUM5dl99+jm5poPfzDkzXMd9hO+Xha8G2pEbDUeb5OOi5yfDjO9naqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wsRU60PxIXA5Wylvi0b3QhRKsGEyoIycqgg24m6cNI=;
 b=LJCt2NP25JtHdOI9sal4ZyBbxvX1/mIbSYSulH5L0Izs27lNAYh7itM3+Zkmzap3fSVRPjREyBhfAl+QBr27Xi7JcxCrxTI2YkCeu35rhThr5dJ9GBpUkZx08CHjhCLrpbC8cRX3q6ZvPXrpD5QwZhNgtdncGkSgi1BeRyZH5YPfSwkkrRa/maLnW0QyLSEzesoN9ACINeMYxPiCTpPG4Vj4Hi8R/uY75ikc81J9CLsE8oteM20nbp90PtVn42h+hC+DJKWXf3Kf9KCLimqBdaCpQrSG8br6Ul8xmCrrGzlEDlEgLX3rlcTsFwOAj1PTWlJKCKUEwPJqBh2Svt7fXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 14 Nov
 2025 19:56:02 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:02 +0000
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
Subject: [PATCH v5 03/13] gpu: nova-core: falcon: Move mbox functionalities
 into helper
Date: Fri, 14 Nov 2025 14:55:42 -0500
Message-Id: <20251114195552.739371-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0062.prod.exchangelabs.com (2603:10b6:208:23f::31)
 To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: acd65608-a996-48f7-88cf-08de23b7d6c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d2fVLwFtgIaWW4g14SDPH1qdq2mQmsF1TPaK+aDwd1CistmqroLxcbA+d6cV?=
 =?us-ascii?Q?61UuGF9P7azi7Q+1G7c0KjNf5NwobrSSC+SCfOFtp1Ddi+IeMPtj+3TSap0k?=
 =?us-ascii?Q?J9UUpCRWjB8bbML3Xwrdgd9daFZMlarIiFY3FZyejybf+Jvt+2d9oDr7KDD0?=
 =?us-ascii?Q?r6utoolfrfzrJBPUCvvrhwjzJpREAQdqxfwhj2MJvz6ESQ+lEbDJHi5BvECs?=
 =?us-ascii?Q?z1Z4y8a32TiwFYjSeMaD2Xk1AivakZIqTPDf6Qcqc2nNtpXmka48tO3f6mCp?=
 =?us-ascii?Q?zP2EPBBWE31uZLIvSS6UPOKYqNJuk1Q0XIuu0UgTIV76KFPXchZUX5ecmpHV?=
 =?us-ascii?Q?nDrbkrGUV5KBK6+jw0ksTH5qGsFzlDU3qMXlCOjrS7/qrwt+bPhBfGiXBmoF?=
 =?us-ascii?Q?1otbK2HPM7qLBu7Yfdwo6obwTmSluW/fy/LKVi4hsI7+r0SugpXKyV+8DS8R?=
 =?us-ascii?Q?OKz5pYFPZpjcDXbRcrupNdP9vNIWoO2CHT/9GNwLGj5vhTGAECUFDBsNBcLO?=
 =?us-ascii?Q?udJd7KJh1ucH7sTmjyAWxwUtQpInQiqQqTWgQbQmTCItEXYx+Nob8FFA9WrZ?=
 =?us-ascii?Q?kopyMD5mu09N+CTg5UEQ1Day/KGA6jHKAn44BQiSW4YFusDE+O9D73S0lzBb?=
 =?us-ascii?Q?CD56bnvY8skPYR9BDe1rml3oXT1kQjcq6sSThj65qsbE+YM3MMexV/pgo5Qa?=
 =?us-ascii?Q?JVeckBgQOHh6z2wlrMTp+5ndlgcsXjCHb1RFi2OJCJVURUhP89aLhfxwDb9h?=
 =?us-ascii?Q?DOFvWBeJWbGpuINJG9d04au5ivP3XTJJ8PgfnlYd0+ZiiSul2SyuvEURM85v?=
 =?us-ascii?Q?kVBUBQMKJua4FwAphgVPeEX+sPItb8vhyWt3EIyrJrpaU2gyje1I2327GCId?=
 =?us-ascii?Q?dmA/aX86Q6QTTU7LQ4U1IYpfalM0D0hqMxF5hDzbYoEzrcRSiNX+cO2iDq6q?=
 =?us-ascii?Q?OMjjajGuY+wGdSr3iptZ7wQOzvYwOmc0tJxxLJfL8/8xihKeLA7DOpRJFzsy?=
 =?us-ascii?Q?8fx87tOceeHup+WVUxZhhSYazqrwokYu8HxcEeH153HSHQzYrXL3Ky4kMTu5?=
 =?us-ascii?Q?kkzNMDCYUbHMi0fezB7UNPC9QDolSMOq/lS2bgpeFV2wNpEe1qUcVt5BkBOK?=
 =?us-ascii?Q?OpIkt5lo1b0PkxlGyKxIkkRGMRgXUNRnJqz7MdVJuBND0dClX4etRICy1t2F?=
 =?us-ascii?Q?3jTCC9Q9LLWvFIJNxUWnPlMkKgj8gpusu2eEKFdx/avFYqceYTRYH9DHQwQr?=
 =?us-ascii?Q?PYcRsWR+QudccdPhUn+0WRinTIxtyGJuqh/XYnBgP5b+tHl6yHI2IV9iyCOw?=
 =?us-ascii?Q?mG+I0mEYGWiSghQvK8+yy27jDu0F8J3Pk/kATk+KtRgFozU9jg4jl8w4m15T?=
 =?us-ascii?Q?MRD0XwNaHOBpI6Xdj7ku+fUUaDTCbPGhdDqyrJVhMvqi9W8Sv2kSqp595TbC?=
 =?us-ascii?Q?40DM6L+G4RMW7ZrfvWnbxHsMjhfrabj3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/uT+ILauO6SNOX+oEL7LdP9KhPwK8cA5Sq1G/qRArC4v9+zlgzQNTCX4MAsp?=
 =?us-ascii?Q?3gv6iGBo8813nxUHq+lIq0ZwtYHbiorRVOrGsxbSQQDL+5ZX/3sH+ZoXgzqm?=
 =?us-ascii?Q?U7cEy699H0GQxmMHGosdFx1KSG+h7gd9mWJ6VPtAZS4KLyJJiOuGDzKyoFET?=
 =?us-ascii?Q?kJ3krgF/3zLZ7kvrkESUg4O3czVe8Eu2+EVhF6Ckr21Ycwh8ozBgSyBGZ4Ju?=
 =?us-ascii?Q?hUrCwExOnTRgp8cj2y7L8XpNnyZj8CEFxdBL/v+DdX5zMef5UX2x7ZxpdsNx?=
 =?us-ascii?Q?7DlAjITEik0/+GpKyMuXWflMmqQttofrp3diaSQ50FQraYfxnKeD0bg5uOye?=
 =?us-ascii?Q?xPV0m0r0W+RE85Vzli0dy1TIX6aqVn4LS2FTQrV5sfmDV0XIz2t93reD3r1C?=
 =?us-ascii?Q?D2+bZFC9+wWpqk657jouXt9yExFJj+dhz9GzdiyYUrKRTaEiII35C5pG0qmb?=
 =?us-ascii?Q?s8z/xO3fMfa0/70IhAYrgwO3Vf2rlYNtqf4EFP4JMMfgHCHKArJVhmaZyx2E?=
 =?us-ascii?Q?7iLh5Ge/QQ+eRyxOtrKTeNqOg4D9gSuEJLEemU26juze0nt8F9M6JYFYSuK4?=
 =?us-ascii?Q?6OW7jG4bMTRV8wW/c6oE0k3IaMYn96UEl9k8a4RMoBlIMpXdkCWYhQKe2MrB?=
 =?us-ascii?Q?QmcIlec1QcN1Gtz2ncQd8fSPRQHeKz5WMzkHQH8P/kI/nnHRXklQ5fiPim5Q?=
 =?us-ascii?Q?pXFgUIe0TN3iBCJvfg++WgHu5HNIJY3DMgju45KV2GAJUz/DMzHTiAJEb4fz?=
 =?us-ascii?Q?wg7oRdV+M4cww4Qk8eke/w1FhRgluD9hFXAc9VXjIaF/nn9gpcdVNJjRtjeT?=
 =?us-ascii?Q?Tj3wB1xHJ0UjV6Z340z7OROze+ybvZSCie5DforXT7gx7gde8mDm3qBjmRjk?=
 =?us-ascii?Q?9g+J9f0a+NzBQVYCQxH6wEmbejUttL2YLC3MUzh3oN5O+x4qGVF1IB/0l6yF?=
 =?us-ascii?Q?jGupNalQAabYI2oorLJZqMlNdasXpaXpIY6Yr0UzmfpEFdzbHnjOJcWs6G6M?=
 =?us-ascii?Q?vkpGOphQRbgXtCWWFEf902pwkGSGmzddYrc+cNsb5f+O2DShk1YYcrPhgHRb?=
 =?us-ascii?Q?fowO1rEmVRHLsQUjGrzjQKBda41Eles1klwRnbF0jjeGFkQzb86iq+ma9Kyc?=
 =?us-ascii?Q?KJO1QUXugwivZ/6FanlBEBidfB2oRUO+Pn0byzuBMgIr5khoHt0dvQ6++/IL?=
 =?us-ascii?Q?YFSN6YCE94zOlQUWx7Cg2990IEqxrbcJo6iYzVgv98g1x8pOF7Tk/QKolw4I?=
 =?us-ascii?Q?rdDt+haXVBRro2arAybAtgyS3yZ9FN3F0CnSX5RYBo+7sl//mUls8acqkuu5?=
 =?us-ascii?Q?1WmUn8Nbha5ZMMzycKtQUMiCPJoTtZ6Dsn71l3E3xDkj33VJI2dpuWzXpSyR?=
 =?us-ascii?Q?fRuU5TueMV0zgVcguxmm4OLdPzpwWagJl6WCFwaBGjb6E5px6+457AaxnGVy?=
 =?us-ascii?Q?9owW+hvrOBlXTQL1IPX6rbAkbw1xw8ZHtJ6uivVNWYN/5ZbHRi1JFJQB7Zrd?=
 =?us-ascii?Q?lUzA5p3O28octwUO/GoSyiuV4dP723ffBOqWi7RuHvSFuwdb1Pl/jyYJN3m5?=
 =?us-ascii?Q?d423lrzhHH3uPCOKHlF2Qw37pTuznW7zHK5A1dQ6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd65608-a996-48f7-88cf-08de23b7d6c5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:02.3386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: feyQYT8mNlRd741LPHEDPtg6NZOiQ28sCq6J0RoOUcACyWfw9MCdrDbFDuSkbJnBqV/xcH/JqJ1ykFu30d/BDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5765
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

