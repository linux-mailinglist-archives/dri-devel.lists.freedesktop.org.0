Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949C5BD1A2B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7DE10E3C6;
	Mon, 13 Oct 2025 06:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pq1AwWD/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4125610E3BD;
 Mon, 13 Oct 2025 06:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILyfAovupilR+xcp1+DZr0wz8XanyfkPO29hN/iXYZ/0jHhIeUah8iJE9Tz+1C5yBmFUPQBm9dhEmnC8guUBd6BpbcQhPd4UcRmvK1Xfq/HuKy5nH/vI9uOvDNRHX21Kjj+0Aoy6jAwej5yt/W/ojhRrbCasAOuqht7z7OJ7kzbvDG+MtMbbUKqdl2Mdpjz2Hzn5x9iJKasjtzwEmUjbuZ+AhZOmbbLD3+sUPiN3z789ziidfXJ+ANLfOq1PxRlHFx2VECdp3GefgZ9PM4TtgB+5E86UpvwWLDjUkE6E09J9hqgikp58a07L/1WmME7G+mOGoSvWPVMXMJk81s4dWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YH//zDOnPNDWjR55GYjV0YCDDW6AXQn837vFF70r+2k=;
 b=EiEA+aQic6ivKSP8X4XRYG1Al5NWZ23c4pXfz7U1ZRtZ3fgp+BDj9/2tyjp8zO/3DUu452nr3kr7jA345itSWOIZNWoeT2jsSNL01YVFefoOktg6EDG0tgL07HnQa2z/xdI7snnwm5/Tq1yhX3Fd11TAFu4OW2FQXrgWukGu+9uFJaDVGA+ptjrVc8hCiF4W4GlY9LVn+jj6gFAQrZuijPJO6ljzGm1q+G/DmOUgQ1crGh1NfAb2iw63TXQzCPb9/FMmInZFgfG3cssdiz3/DMGvEVduNDo0Vd9+ShBPuzLEFvWInypeCQ5s60rzzYCVaNOe9uZyGwH0zIqwXgTPfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YH//zDOnPNDWjR55GYjV0YCDDW6AXQn837vFF70r+2k=;
 b=pq1AwWD/tnNCW4E2zeMR30EoxIa2EbfcINXPldzufP4kp296BP3/GYKqhGuRKei1sZv8SoebEM0NxEZSSPD0DQbwRZCWbQ4t4P9v/KuxwfhAIjKYS9SVxr9mRjTEr0L9DL/ikWgG7es+MXml8uHttuyobe4PVYo28I2QS2ire4qsbjSEDKCDl8LzdHZEAijYEVyBlK5Z/nGybZ3mdLGj4I4oJbENT2sY2jbvHuVC5ElnVl1GdbayZcGdeAi26sP1mwWK+GizdjoMHdpE21V6GF6mi1CiTbU5O6pnCjWNEzBszh/alBuVexNVyDlIgErthfnNLdIyWIgggHCxZg9XIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 06:21:46 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:21:46 +0000
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
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5 12/14] nova-core: falcon: Add support to check if RISC-V is
 active
Date: Mon, 13 Oct 2025 17:20:38 +1100
Message-ID: <20251013062041.1639529-13-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0171.ausprd01.prod.outlook.com
 (2603:10c6:10:52::15) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b784bd-3e60-44b4-8716-08de0a20c8f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UN15Tdd+8xUvi+pHI20au33TWNRYKxxZlY38XNFWWFFGlTc13q08WUgbjkig?=
 =?us-ascii?Q?zqPWumQUBxVPQ3De09DS69QxIazvm6+n7hLZRWzJQFgw4R4ScJ166wnjZ/k3?=
 =?us-ascii?Q?T+5izSJUmlJx8KHQGTIKDABMfrdje0wipO05J/Q9L/ZZBWR4Xtcm3ZM3G3/t?=
 =?us-ascii?Q?J+6ilYUAs/fIINV762PnRJf6rw2I4Eu8rQnnnXlB/1Jiai6UNpTbNnkSh4rb?=
 =?us-ascii?Q?Ax6zFjuOKoOYl+aEi+6YeI4+E+SVHYdsJuHq81qK97hZr4P0m9R3MtG/sBDT?=
 =?us-ascii?Q?X3EU/dhQFLx4kJ1V08vdPkaIkA/36iGc4KZGCZgNoo4D/dVwAjmJCTcxHMKt?=
 =?us-ascii?Q?QMaVBPk3zVL7tDFeHGRxnNjfMh7BvBiuVi9fd/4Lab2O0WPLQkHF0tPhfveN?=
 =?us-ascii?Q?d6ajjqKD/RIN/gBrHCtSugONAklwILzNpKdtc+FHtbsXJaWseP9RqOK87bD0?=
 =?us-ascii?Q?c5lv0r6jd/O+F2JRpnmOFBJCknTp2SWm9o5Y4664AOUSoGekJW+hUjhbmXtB?=
 =?us-ascii?Q?01kTIu+rKmYU4GV8iMF5eqZ3Bn0JAuzmQ/D2wnB/S7k7oZN7Kd7+/AlYlTLh?=
 =?us-ascii?Q?UxjdpvR14eIC676mc9ytk5Toig2TafEyq77fJJVFR42qtI8e9nSFNcgHV6Ic?=
 =?us-ascii?Q?Ab2rtfB582SsvRy5k0s57Dah413NFaQ5yA60xi7fTg3MZOmCOf5PAon+qeOJ?=
 =?us-ascii?Q?Di4pWBAoPO/Hq0B/69cCn7MqDHGuTNPkwsSybHJ16lTUhd1OY3SiEP2nMuze?=
 =?us-ascii?Q?7Uv0unhUC0Mak1GPgM+PjTyIxgr6zGBYlQdsikx+96uE1Wv194RFfPyXiDoW?=
 =?us-ascii?Q?CLoqkBAnZZ2joFSfyksliL51kOUzUp6/aA22mEjiXPxMYvMreM3GFlA0BFJT?=
 =?us-ascii?Q?+Ic6rwao6A/L+/60SZhyjvP9Zt9Q4lT8QfuSkwJHdOjMxMFXO7lmo5FYUxMk?=
 =?us-ascii?Q?ilG1U/AT3hl3QrxwNkKRGsHRSj+8mw4ttCNOy0APmEylaSS1mDXRQLLknY+k?=
 =?us-ascii?Q?zF+09htRlmzKQtB+aIgKv8dHfOwgo9aDibYaLOchl4mTHt7P3jhd1mo2kYlI?=
 =?us-ascii?Q?8gU34h0XZVaUJAqI14lOGhm/9tl8P9dcYkyRrJGKXRNdF455e36p9uoCuzIR?=
 =?us-ascii?Q?ASVPysRyosGYYCnewUUWrSBJ/hvf201nouRHByYNJukSHz1vDwe19va33/W2?=
 =?us-ascii?Q?FHzS3+cC6amLviESBcVo3AbM3NLvgYi8IGnni8ugHTZpnI0hdEKlr1NQV/fK?=
 =?us-ascii?Q?BM3124Jtzdg8B3ZjGbV8MhVfuTEyXTN28f/zcdZUd8TTwgtfAiq4KjZFl6BT?=
 =?us-ascii?Q?nZSNOqnA+cOukhB94eJyOjd6YEe+Wv2RFH0bburR7QebJVQrn9E5jicr6r2w?=
 =?us-ascii?Q?7QlQq/ikj4xfEsGWS/jDLfq83/A/wXa6OLIPCIt7X6hUgrN5t4Tfe6Z38GxT?=
 =?us-ascii?Q?Xy0UTE1qwenc3IcorSDwdr0WIJguYKby?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2cF3b5rtjzcASo3l2e6Bg8lTVS2DHR3/VAgZjs3flEjXw6qxSasCAC1F9bHt?=
 =?us-ascii?Q?scyoqAQBB6V0wtLmq+2oe2C4M91Uu8mANuhKPiN86PTlPHtqWZH5zHDF2Lv7?=
 =?us-ascii?Q?b5zpUlXzhVge7eREH2we4fQNKpAuoqgOBdcl9VXzMsvltgnQOCuWY05sDEzT?=
 =?us-ascii?Q?xfl+LMWWCOh67v8GqiWU8SBE7jZuu+nPy7LOCX6irKLi5tm9v5y/YQYIVHCC?=
 =?us-ascii?Q?/gSZbYFg6ObP7fJgSzckxTedkzt3VpyTnPQ5VhxUYoZ0FvkTFeVenr0Xevry?=
 =?us-ascii?Q?XdmBw1KurEyTzODLCl282gOk+rxOtglmRHgwakks78uw3eWaW6wq6MaS2bGa?=
 =?us-ascii?Q?ZL/bIWjuAQL5pvfOkLFZLROiLG9GkKec3O/7yX2wcg2gJFVSE0Y8L+F3NBLD?=
 =?us-ascii?Q?zT3mggJHr+H2RRL6cT2RqKEgrpXdZG4f1Hjebmh3+xiUyDKsaCJmFOhsWzwn?=
 =?us-ascii?Q?l/dpER3QPv3ka3N0ym43PZtFKKZMRG0wkn+biRl4UhRC8ILe26uTW27SzSiz?=
 =?us-ascii?Q?Wn6DT8KK91TvLMHGJ1d4LIXGHB6RDmFFCKeg2tW8i3DA25FVtQQuufRlynDn?=
 =?us-ascii?Q?IZYTsuMYetHBg36UPdUHJ8BkQzLw8l6TnraY3QYKOGhZK8OpzOhD0WCMlWua?=
 =?us-ascii?Q?kEcrQhfwGUQTT2OY8pE77xjhGLMSm+57+t5kDOTTHjsN2YQ1Cdup07O95mE1?=
 =?us-ascii?Q?cin7GIljy98sY4fGLp4c0BHxc+FVV0MTxpZeeXe9gFvDuRzZaTYfN+VNKdU0?=
 =?us-ascii?Q?Z9P7t/pLOIZhU46R1XDdgtpsjUsaAJGNErwoM8t9p0YRHoaTkNKLgz68o1GE?=
 =?us-ascii?Q?7U88j2fpm/h6IB6f+RpAQUNO5+jxYtzzNe++c+tSVFMqTBm/z/ugSShezCqm?=
 =?us-ascii?Q?unAlg8n4u94Nw2j0Dax5Frf2SSfxFJ1yjvzlBkqOrLkTBbjb8kSRMR2IvrTA?=
 =?us-ascii?Q?oPcfJfHTJvj5PxHOK++jbrK4YGv+t2fbNYd12p86FV9w8/vGNFzuX6t26GSe?=
 =?us-ascii?Q?Vf9fL02GSVvtRiTAQ3bw4VSv/LupOobJ6uHICOtWxayK9UXIw8HHNOkA2UAB?=
 =?us-ascii?Q?z8u6lMtzfDR2O1Ci7yIYIlPDtptX19MTrDw255H3ko3AZqsB/8Weu3zLugWl?=
 =?us-ascii?Q?oS1XFXw9a0mHagnACtqgcwh3ItzmdXMFd4aqCyMOrcBT15fi/W9bzfNCKblB?=
 =?us-ascii?Q?l0j9RSTvcWOfHB2gTNd+O7AF7IZ1NTWhaycBCP6cQrXApDYSemETiUiNhy14?=
 =?us-ascii?Q?4FqrDZnvZ9ekf1ceDBKZCDSWj5BO4u1EGY6i+1fmAqyykwmEPEtgvRqj6mtB?=
 =?us-ascii?Q?SzBP53q4pXfbO296RVfctL7eHfYP1iImlqwMONvia2EqRCvGCEnXLaC5hjpB?=
 =?us-ascii?Q?MSxwfI5n4tPccoNImkXWGm0n5kzEYh3f6nnvAa7eizyixKzayAgr/pamHSEg?=
 =?us-ascii?Q?GOOQPucJpQrQsOSA89OiD2psPI4nBJoFeuHdnGvkJQDRGny1te+0/hzNvccy?=
 =?us-ascii?Q?9d5HWmfiMLII+y39XXtMHSetKNglzFdH9Knb81Ixb3ChdUMVOgBDWwjzCGLU?=
 =?us-ascii?Q?LAnVfXtV6fhJheLfX3xGW4Np7lllNI8d+sJmJta1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b784bd-3e60-44b4-8716-08de0a20c8f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:21:46.1772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MFu8gR8J3rreoSg1PYRMMLWNNbHTflCsuoiQx0Oo0QopiEfL+dJrnPpnnlwygJ3+00Sqcuyi9GkyQddqlREkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add definition for RISCV_CPUCTL register and use it in a new falcon API
to check if the RISC-V core of a Falcon is active. It is required by
the sequencer to know if the GSP's RISCV processor is active.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>

---

Changes for v4:
 - Return bool instead of Result<bool> from is_riscv_active() as it
   can't fail (thanks Timur).
 - Update register definitions to correct Falcon
 - Switch register definition order
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 734ac0fbfb49..185ed6d1cfb8 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -506,4 +506,13 @@ pub(crate) fn signature_reg_fuse_version(
         self.hal
             .signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
     }
+
+    /// Check if the RISC-V core is active.
+    ///
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    #[expect(unused)]
+    pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0585699ae951..3bd1bddb16bb 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -324,7 +324,12 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 // PRISCV
 
-register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
+register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
+    0:0     halted as bool;
+    7:7     active_stat as bool;
+});
+
+register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalcon2Base[0x00000668] {
     0:0     valid as bool;
     4:4     core_select as bool => PeregrineCoreSelect;
     8:8     br_fetch as bool;
-- 
2.50.1

