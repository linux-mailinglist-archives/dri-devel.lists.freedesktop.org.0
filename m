Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE886C3DBED
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183ED10E9EE;
	Thu,  6 Nov 2025 23:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CfjL5uLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEDE10E9F1;
 Thu,  6 Nov 2025 23:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZUflgKura7CDoxOoE/ibgGgSzob7/0aBS48k0TkTJNHnFe2q0NGlwMuhWchsxhLdKvVzwu2hNyKu09VbREmMPY5i4LQPhB759SrYotwoAuNhE5XqCMf82eAiDW5Wzz0rv4moDfd02Aj6kQoi3iBPiF8o8PG9B5wMvEcZviONbI4VA/RGUbDHmiV2GH4i/HlaL5qAKGOczBA3zzfFEjcr9++jwVxG9ZHyvdDSTHDu1eYVnWg5W7yqZtovu1QB5NW0gbNkTok71lsHSgfooOfUB+6E9sQ7jluU5OGpefN3vFrhvpb9BDGJaIGKU5Y7KeW/8PRqT0goDomoN+Ng95OxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQnRc8hQNy22K5Xma4xC0OmjnaZFggZzqwvUe/Bw5Mg=;
 b=ZX8rl+v1cV823NM06hXxuTAaalJCt+Blm6u4HsGu0rzczRMGLv9I+Cm+1D2i7I16/Rzv1O9/BB+RWLtGJIRD/y0n8UDvCxhT+afrdAFLGE/ntSOxFiUniizdroPCo9eMA/am/QeZ2owVpBgzYw1Ju9ObA9wTzgR44NGIpkxThLZM57n0ofhQ6Fmk1sWQx8qAnI4ZsfSEXOdcfauzRb+eKBz0UdJa+xfui7dk7nzEcuNZuocBvbO2keRzX5/xF0HwjelEUwJgWTd9BmJ0Oj0ZDm1bI/um/xTszqgZZJmIy+knvZ1G5hbYKyJwWOqwr+NFLOYoh7tek1yCwgXEhj0lKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQnRc8hQNy22K5Xma4xC0OmjnaZFggZzqwvUe/Bw5Mg=;
 b=CfjL5uLm7jvbA6dhdYNamCHyOJEvutcDzeHLEZ1tYl7eDpDj75iqrjswJIUj9F2mfDRgRf2/xXTPfaB5TD6Kocd2QylsFrBWSqSREPzYeGTau6R0sVFwoM/FLCYSqQfiVE+5KeyARDCCtNBMJu4cPEdDRcCnkQJs6MrAU76hsXCTHV07/OILq3GiJ9UJ63vRBaWASM+Xw0+D/DEFXMaiC11N4HWCEGvAFbPEqQ2ip7ceSdu7TAH7JNmrim2osf0KHhlsvhFaptqHaYaC+5TctUo8HCEo5viotabn059z1qoOrEinN8kDedn4dI++qA4PqUJkgJbG2FO8sWV6XpMJlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 23:12:01 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:01 +0000
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
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 03/14] gpu: nova-core: falcon: Move mbox functionalities
 into helper
Date: Thu,  6 Nov 2025 18:11:42 -0500
Message-Id: <20251106231153.2925637-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:208:530::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b22017-1b26-4e1d-2730-08de1d89e468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wvfO+YDNrWHqAO14Qlz4OmKVDsjt2Y1rixxD2W2TXGrJEkllSNpbKpNJ64Kf?=
 =?us-ascii?Q?NI351IIeGXkmuVpQVadrLizEr16d1OilYMWOwSEz88TgT7VKdM5IgRPRfwyo?=
 =?us-ascii?Q?S0XwYSq9tOKdETy9BZMJbSIOzQgJ8HSfG/HMiHn+d0Z2hd++WcQI+PAQCZpu?=
 =?us-ascii?Q?SjJvrRa8wk3HvoxF8wcT1LyziDa50cnLTXyi8towCoScLpd/B0UzMER66cTH?=
 =?us-ascii?Q?oJJSsLxiQmPiW70mNJBrs3LwfUm1HZtPOiel+N42Q8PkyrkmiYq1VQpispzt?=
 =?us-ascii?Q?XDzwmpcBHRVPvfQVLmi5qMknsJ0YajYLzWY9QTLxci4wt/8fYXylE3+fhe1u?=
 =?us-ascii?Q?EEGbXQurb33P+frQkjTHUb/esXxk0T3R2j0TPrqT+Tv21ctTA5Hu+shG64Ng?=
 =?us-ascii?Q?IOW+4vDfDci1LvRlYiovChJoF18P62V7kx3GNYY5h/vO91h90RGHTWDg8SLV?=
 =?us-ascii?Q?POXDvZ5vTNNMAQ2n/pLOf37/sIOdeZEmAIHYfa6FBcKCTDA6a5zU4MH+KYkT?=
 =?us-ascii?Q?UzsSdREExRu3LqlC4emn/1kxBnmPzl1oKUi8+SLT4m9XOlMgR13p5iffFMDg?=
 =?us-ascii?Q?cRyeZOfQseJQqcALFGX2dE3V719nnzODnAADDU0tpWGOn+Sa4meLCoOjn9OU?=
 =?us-ascii?Q?cWTo1lUfm9UK9x5qDPyqYFZCyECeP0MP69ifdbHoIGzvWMqM3y9T4Z2NciXQ?=
 =?us-ascii?Q?36fxqlpqaZDOg23v9iNCFeNs8v58ZgknrO2OKUXmH8E9xaexZE7xVyjo1H6B?=
 =?us-ascii?Q?uH1oyyol9LC1WMgrrD1OZ1A4yRJl9Lo8dqKhVrHWn/mSDoJvcMClxWGAMauM?=
 =?us-ascii?Q?+XKARpuYUCsWbUnFo8Wj7r5+JYkeD2ZCpsKk0DJuA/yRY6+2hYjpf0c7+tIH?=
 =?us-ascii?Q?2OwKafjrHLtBJ6i7pkhRtjYeYUwZg+OCEyg9GnzUj1I9bH6Ysp77tLEdtUvX?=
 =?us-ascii?Q?o+cKDlMf76xp5LdwhPQvGstxgJoFYySJvlwW+oy61locMBrRhpaDn0fxaS5u?=
 =?us-ascii?Q?OkBf4JH+o/yrpGZPsS1b87KvOrzsTg+jVRle4MohamwYaBkIgpwbfmcyD20h?=
 =?us-ascii?Q?FvYG1IIoG+l7D8GqiPfIwUP13h8qE9KPdG0ajVnBFj//qkHQnYImt1bNDmiV?=
 =?us-ascii?Q?L69N8gErK6iRdfkkeE5ulRt43LAUwzFE/ttG4kNPENG15PopmwBg0G/M0VYI?=
 =?us-ascii?Q?VpUYMzZi7wbdwfAufCziwxH6G5gLpFRXnZFlr6ZY0Z2ShTLyh7YPLn5b/QWJ?=
 =?us-ascii?Q?4RnSEmUyFTPhwBtFsdNO5cCcdDvRf6cOI+Bg8PalNUY7UKmRLIDFq4ZpV7jg?=
 =?us-ascii?Q?nhPaU3loH9e/XDIqzKrsyyY5da8K6/WmutfACY6TpDCyvweuhdBzC6Eyrt69?=
 =?us-ascii?Q?iDvpn5Hc5raLn2Zq7/ucr4knH6VMaHXdfOd1OcwlJ4fT01RNSR/2J60fnt+S?=
 =?us-ascii?Q?V4zApQvyVEhXyOhDuxQnvCi/DqemdU4C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IlVZK4vEKl6lIbNfY2mtQjpaUpDg6hdu6DQQNYmv1T2mBRFVZdlec79c5Yns?=
 =?us-ascii?Q?9iER34TYT1jwDNiygGWYCrwQqJhugS93u4orTHoTrl5NZ7ynAcuLcbJlH6rW?=
 =?us-ascii?Q?v07Z7iiyGNFgVI1xewtJ/1KVhjmPXFmztJUIdunLOZ1WvgTObPfyF1HvzAsZ?=
 =?us-ascii?Q?XxBsqMBCHWQ+Fxn7rj50Cl86sYBQ8RHgUNe9/QTUEGd3cWptvMdKzJ7GQyr3?=
 =?us-ascii?Q?dd0kb/7+1iQ29xHpSLECYQ5Og+BWSVABaT8U/ncHGILL7HoR2eQ+hQBHlDUS?=
 =?us-ascii?Q?og7r5nFIHkJr5mKc/L8jlAh3GWIsS8gQch0W1J/yC6UKXNy2Nu5NRbL2mzvm?=
 =?us-ascii?Q?0A1yJCv2CpFPjRltmrVAQryReoXakWO4f5lGWaoZq5bhCTk5RKD/eKj9NiRP?=
 =?us-ascii?Q?/IkfIpXYA36izDsxw+5qDat3U4aB13LIciys/BXs+MDgTlYEX+Q9RZzpsOVl?=
 =?us-ascii?Q?hOkluE33LlvdvG9lHe4ee6iJL2PVa5VomvSXOrJtRS0cGUdz3XA6wloHJeQu?=
 =?us-ascii?Q?mnLCSLZjXHLgglKzH3WxNZ05GzA4EkvUPcHOqlJPFhBPtedt/KxSSd3O2Qps?=
 =?us-ascii?Q?fpxVeHqn32lbKB0h5eHe0GybiUxB7XcUqzAI/KPeCu9PJZyt/w1dUtxnRzbU?=
 =?us-ascii?Q?uwACCTMeW+3cp4xnZiMLmoB+znTR92QnhPI3IqTQ2nRG+AcSQp2e8IZOQsOX?=
 =?us-ascii?Q?RB319AH2PN7EZXX0ApuGxLnNnSfqC+RMXfYjxGlVDuoQvazWBOhoXtpvUwQ/?=
 =?us-ascii?Q?weaA6qnDnPJMTSO3YSLxcaYXSH6+0VkVb43imjCEHzv3qROiqHrtjUH7fIs6?=
 =?us-ascii?Q?ER8+R2O4jI+QOBVi3P7/rcaw3bjsgOftZprvgyDab0kVS2+3Y56Jk1e7rsxl?=
 =?us-ascii?Q?tcuFKSqcE+mAUlpKGws98xKMRoQS2mdFIEVjxOjWPrSCj+A0TThMkOb8lSLd?=
 =?us-ascii?Q?MDyB09tJbt0Bg+iiJT+v4W6S8o1PJCHS4o9dPj3Co381CaE8fpneincCgBw7?=
 =?us-ascii?Q?XMMgkK88CpsbcuVuODx0oQymoe5/YwH87s6nGRKzGQG+TKQ7Z8y0VwdvCF7U?=
 =?us-ascii?Q?lWG8Y+hWUrgquta/atz7MSlr50iaHRbcOTwhk4Fy7EwImcOtiT7mozQUzlSu?=
 =?us-ascii?Q?n2bWryfGenXC/9Dtsx80BKYs1AhbTxoOH+ADcpitMTsIDKH74eTa02F2UtTe?=
 =?us-ascii?Q?10IVpksefaRvsq+b7v0sziIEuKK/01Q6v6H3m/jrt9CL/H9Q/SDYnKDH1pvh?=
 =?us-ascii?Q?uSpMfKcj3/CX0fp+SSEtjnqHCNAZ7eRItCcehIO3iQFjJANjlD7ZcRZHhhFp?=
 =?us-ascii?Q?oYr5sOVKg18dIxK2raFfmwYtSIRadfBNITOpczAbPaF1tK9zxWuKsIq70Toe?=
 =?us-ascii?Q?JU/sZ52fUHpkwV3vup2faeQ8FVPJmSGsDLKHocVtloySwg32KfvgpAa2o1Wp?=
 =?us-ascii?Q?UEW1FvM+T1B2i+zLjcwJckiqUrhCyqziQwcfNf1wNjdBg2lenoHb8bmedGuJ?=
 =?us-ascii?Q?rFJXqYhl9uGpMg4V+msa02jQ6NOjHD2MfA/kLyPl1R7ufYBtD4/ThT3L7JrA?=
 =?us-ascii?Q?Grsx7um2dNgwyr/+qeEaXpq+Bsv4sPRsxebkblep?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b22017-1b26-4e1d-2730-08de1d89e468
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:01.4303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxEdv1T9jXTfgDUtC9oXGTBChZZV2GE0EJa3aqKWNqepF45c4YSKTLRGhbEYUUWEC2ZF2WAK23po98aBm+s7Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014
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
index 1bcee06fdec2..181347feb3ca 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -567,19 +567,13 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
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
@@ -591,18 +585,45 @@ pub(crate) fn boot(
                 .set_value(mbox1)
                 .write(bar, &E::ID);
         }
+        Ok(())
+    }
 
-        self.start(bar)?;
-        self.wait_till_halted(bar)?;
+    /// Reads the value from mbox0 register.
+    pub(crate) fn read_mailbox0(&self, bar: &Bar0) -> Result<u32> {
+        Ok(regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value())
+    }
 
-        let (mbox0, mbox1) = (
-            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value(),
-            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, &E::ID).value(),
-        );
+    /// Reads the value from mbox1 register.
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

