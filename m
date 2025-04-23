Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E91A99BB2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 00:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A8B10E1C1;
	Wed, 23 Apr 2025 22:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sv7oCpfN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC8010E3B7;
 Wed, 23 Apr 2025 22:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ew3tPXV8+p4BiqQSOfw+HPTf2NXXMz9TnKXRKyS2LXM+TO8RaKrBvZjvBLlMVbcfm2suq3ia6TsiEuSxi6J29/3zhbqimN9lMzFJNGzz5JP4T+I5L92tKJ9j/ZGsSZjurV9hRGYJAoVmUYoXcgqx+MtVhUYB9hAJHF6eFwNTtheaPwWfIp/lmiv866THN6/RgosDITEXqOIVTEq09jlqf8RYd55MdFm10cpBA9VtjZxLOE1z3/ntP9fzCaV7WyYT2x7dO2pwSnEBbJH+F+rtg2y4oDWIPBLETH1mX+M3QFWlIiEY6h91halcmYxy0Ea98+4OaEy6NaxLxZvIPVspFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ta1OUUm7qJCHFUdUqBxBwszEa7RYr8OO+Uwxal3riSQ=;
 b=wmjKrEdKSvYAKyyKtLVx386Ee1NgLcvILGDztZ10PRWd6skKwln9rqLjmGG62RUivBpPyTZo0ZcZBVhw3cSae9DL+dVnSFySVJ5FBQD2cOjCGc3L3d1d3xfl7779vrLmpit0j2tnvG7lSJ5+O6TeC2T2iVHZ4wrqJmrE8W4pDeslzyqdy1sDVD0FcRfsAAytkBiVGi5fmwZrVEL0EIyecA748e95fmTdYE//0rYrDn9p5PX5oOkF7bwCMBpZw5z19oOOqCgfjeDzOGtSGboMfN3Pk5B4SdGHLlKNtQq2pkTXNC6vT+2Bya3uJ3c9LgnZGfG9obyNtlKEatpYHIa2+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ta1OUUm7qJCHFUdUqBxBwszEa7RYr8OO+Uwxal3riSQ=;
 b=sv7oCpfNxZIoFt9vSqzVkZDV3bqp8luSW/FTwUtfMxjOBSaIlSwprSlyveL/jagfmchFsPQ5F2CLQhCVrTADRhLX39BaeH8AAcobHBZN1klw/+zjt6Zf0pX0JbJQ3ofSbhEww5J/o1XTQ0vhUsHOnH0aKq4otUUJWjBeD7fQExM0cH7UQi9tyurIejLPbDa6gI0JHkU/CeX3SMBJdkQfx+knPVltzp1bhYuJusWYLzcDYWNAQBTirM7xKsOAO3gzKbJZgAEE6yxpBx8gvEeNyRS27hKmLVuv8pYmKHonmBUDGgH11f3IPAUHvNLz2hl10n/iXxFwLhRmMIroP/gujg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 22:54:19 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 22:54:19 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH 1/6] nova-core: doc: Add code comments related to devinit
Date: Wed, 23 Apr 2025 18:53:57 -0400
Message-ID: <20250423225405.139613-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423225405.139613-1-joelagnelf@nvidia.com>
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:91::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7dc0e2-8237-4ade-a297-08dd82b9c7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DYH85Vz2ZaLV2mVvBcjVJiZs4WTEdNUu8o/s6gdlwuVXXieNrKJI68QrT5cD?=
 =?us-ascii?Q?CclfjdVMWz71ReqJM+U7zelm3ok5n0z8q9G5uQiY2a189efEg9MaQBWI0Wrl?=
 =?us-ascii?Q?nltiglo5o0y7GS3j2fQMQ1vJ6WnBDS5g2Tlh4Plqr9xFvDYWyWtUFHEcS9Yn?=
 =?us-ascii?Q?WofBCeNsK+yclq9moFdXs2/yuf71tB/PMcQdSpeZFN9RxfY15LkUXzfdDb8W?=
 =?us-ascii?Q?GJkxjpNJWzbq82gfP7DFMAxSpJXBE4HNPHIE9b9BTmgPXKL0npmbLTY8W1T/?=
 =?us-ascii?Q?WOLsxLAwjFRxlZAleCk8xyoUwhePO9dtUXjRfxrmWKoz7zSHTXicIp6qGRfl?=
 =?us-ascii?Q?2i1+xTdMziqsCvSyHsdZwifFKHQB+w5cuzQO8vzMeDVb5HC8kqnvcbCB66EF?=
 =?us-ascii?Q?/1rQ+NTEjMxSR7mZu0ryBUgB4T9nebez6Kf1jDudGMta2vk8SRYLnrEWpeeq?=
 =?us-ascii?Q?fyRr9cfmK0t+w2qZQcanCqY7ReQnBRH8l6gJl8bKHWXkJM+RNRfgKNDObByu?=
 =?us-ascii?Q?XRs2nEDSH23qpMSGt/KjYp+LbW7Fe+/bStX5a+nyjYdMStrPNyUO07O+LNhe?=
 =?us-ascii?Q?ximgb0vQDBFhdLXL0xz3mZxXrneRIxY3Fi8jfZGhVAzLMzjZRP6xg7CTpYmo?=
 =?us-ascii?Q?x+umbqY3jwAhQsPO80JePrHr7bymMuA3tIzzv90CuUW1fe1sYHVG5Doog2EY?=
 =?us-ascii?Q?P5jHpmEow+rKnjg+CIdDwQzDrLvOVeTf7uCwscvrKCdkAzUyLOpFOQ705A9J?=
 =?us-ascii?Q?GMS35Q6G01psaeYRqCKq5aZwbeu9AhdB6Tuj2S1vbFyPRxFUB3+nOZ3Pnshi?=
 =?us-ascii?Q?WD0uuj6vEXHZusjrMqzk+j5vpHVuqhesCRIPP8qZhPLPsPQ5FcWsHeLfwHvN?=
 =?us-ascii?Q?y5A0m5knw0BD+T7qKsl6p8p2GwNts6cw2pXWNiKwv1AOKm33A99P8b+Jqq5I?=
 =?us-ascii?Q?1h/Awe3hR79oiF9YikiIpiCYT4FTukr77qX6CX5cLRGGEd+CIdc5Am2RroMh?=
 =?us-ascii?Q?H4UxS5rHAgtyKgnaVO6p0IFECL8IgKj62A6dCxJF3lrdfsw1A81uh64VtSfq?=
 =?us-ascii?Q?XjZkaLQXOrS5/gHS1/Ufg+i4iANroas/iJvJiv2CDmS/EH2TdEaB7JYaARvP?=
 =?us-ascii?Q?W6hQqeAIPtYQjJKB5gJHtwdV1FQhHjbr2ncZFKbSxIRmHMZUz/5avwtWD6Ju?=
 =?us-ascii?Q?hxtCKZ8CVWNPw36nl5AAwkMqC1qmMRtQ0Nab6+9DIb38cHAJokPrvw+NN0m1?=
 =?us-ascii?Q?hToZp89EJIU5TTNiHk7Xmkz0hFG4dloWOR7l5p5T+0kvDf/emKCHUL47hifS?=
 =?us-ascii?Q?SReSzqglpLr0Tl468gb9nvWP+VpwTAsJuGWAJO0WHnwfGAfR6U3QOV+qrbzx?=
 =?us-ascii?Q?v2lAtCQSiZ8JNOMKGv/dmcmfOQqBpVW4n1Y6QEDTr8H8WRBL65PW3ZTzOCU/?=
 =?us-ascii?Q?sMsAJipTSWQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IZnS3GS7JOxfPi2grUQN5NUPDCJjnA5VQ2C71+a4lfx2AEud/AL5kX9n4d63?=
 =?us-ascii?Q?GoR5sRtmdUdGytAdms4PKfZv0wh0MHn4dU5G6rc17ofSBDd6yHjxpO/yrMsz?=
 =?us-ascii?Q?eOteojtQNG2EctEBMpRjzn33B0mTvEvnXaRnZdnXi3ZLlV/E0q5piVV4dWg1?=
 =?us-ascii?Q?qRrcWCrpRU56vuJaCbpJ0uG1CqDDR5E8rMQ2gAbq2jU9lac0gRIF/O4hjIfF?=
 =?us-ascii?Q?tzY+NbCtDOXQqD8cfij4jl8zxJaMP7ZzfMoBpomy1vG/aJPrkac1Efy8zAuN?=
 =?us-ascii?Q?JJnGc7DPi8F4Nem4F+CkJjwV7W20nPcajbrJo1qxzhJ0kp1HhgX0FJHwDxce?=
 =?us-ascii?Q?G9vXkrGiTOJXrdhlN76tjeAUUVUEBJ5MVFJUkv6RA70Hn8RsVcMe3NOmGDL2?=
 =?us-ascii?Q?TzWdMqiEQlWKFzfaJZ1fCNfQgsaKuPYlRIcgAsrmn7Bz+jW7X8C17jio8iCA?=
 =?us-ascii?Q?LspgnktNfp0dT2gBBEK4DjhSNJz+CHp0ea5YqRfFhW63uxhr9XjRpbOAs6HE?=
 =?us-ascii?Q?uWah6ydGW21s0qwiyJzL3PyI0jtcy9kgNtZKkBI7YUW0YJ4clEXzfBcBzgAd?=
 =?us-ascii?Q?LxSN2ywDRhGHJflwBp0ENEGb9y9FvcFEIFmSb3O5AeUeJb8l0A5edj++jx4C?=
 =?us-ascii?Q?1zNnlBAOguqU2pB1HN+SD6c/6XhO+gVMjl0qv+INCfYYXhcKjGOvYMZybtye?=
 =?us-ascii?Q?jS9rnPtnOmWYfXOpUrT0WPr8xoiBuwVlQ6G6BP8sle305DA7sSwU+BUzEO8A?=
 =?us-ascii?Q?DEi96PwgQGz3oX6l1E11mNzUB6IfKJ/i/7XCHojq6lanuljThI/A+aLAcdSo?=
 =?us-ascii?Q?h21iqHrRywTwEE0x+kLo7fUMBKszm44UVlMOPEctDpWOvtfKkOCkdJC0Pdc0?=
 =?us-ascii?Q?48lmef7e5OtRyUnQ2IRtAp6jpSdqdtpwMvCJ6gPIiLsDkrxFGWDe9VZr8CRc?=
 =?us-ascii?Q?ucQX1rvSV8O1r+WZxIkEV1XQJlZT9NSSN65f3QEsBb+9wDy1bxySdXtQPM22?=
 =?us-ascii?Q?wtSWyR0lbVlnMhtHoDAZVUmfqFT80OR4+YvGI59j3J08zezZQ2D7WqrlaTdp?=
 =?us-ascii?Q?r6K6km9qdYCdDcUXhVX0yucu3fgK0ylwrY9jeRDVZu4lp4ch+UUH57YVNWZW?=
 =?us-ascii?Q?IYhp3OiSmgAsCjk1KJv09RjQR6xOwG+v4h2jR6G1i1ch2hkSn7HZ5P3hL0zw?=
 =?us-ascii?Q?S3T5nW92zMknl7uoeX5fWYFeG7RIFIxc4VAkpBOEWV9r3nZMzBgUZE9VADli?=
 =?us-ascii?Q?Pq3OsQC8WTfQDPmwYwqUzNfyZQ5EY6xR0gdj1KMM/59AMsufjn8C+BEdKucN?=
 =?us-ascii?Q?9Il9dN7TJVmHNXvLkSM5Qs75+N+vup2tIEImxd0zPiOiL781lzS8k7fcbZPw?=
 =?us-ascii?Q?um1zuayeQyg6DN6Tw5tgi9QBENALCqowVoMMuwHUyFk4m3aElWtEyplg8oOW?=
 =?us-ascii?Q?30Vvi01Svd5Yye11kBbXDGaiusvJHhwpTbMlWEFb0mkNntBHEpUt9RE3wq6b?=
 =?us-ascii?Q?JvVUUuezz6TUSvZ0o3Hj1h2cPZYHm1XkPiDmxbT3eU7dK71Wi6W6XR3R1lyP?=
 =?us-ascii?Q?AI6nckkK+4pFxgeor4ats2rVEfmsOXK0XMp8ueTx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7dc0e2-8237-4ade-a297-08dd82b9c7e9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 22:54:19.2618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXUhyMqjWQY8UUte6jOsTls7FenV+264wbqBZjDgClWgWn3Ur28YDg8lk0zyrccMg0VAXSHRX1S3VNVifMRqOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340
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

Add several code comments to reduce acronym soup and explain how devinit magic
and bootflow works before driver loads. These are essential for debug and
development of the nova driver.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/devinit.rs | 36 ++++++++++++++++++++++++++++----
 drivers/gpu/nova-core/regs.rs    | 17 +++++++++++++--
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
index ee5685aff845..890bdc4d9522 100644
--- a/drivers/gpu/nova-core/devinit.rs
+++ b/drivers/gpu/nova-core/devinit.rs
@@ -1,6 +1,21 @@
 // SPDX-License-Identifier: GPL-2.0
 
 //! Methods for device initialization.
+//!
+//! A clarification about devinit terminology:
+//! devinit is a sequence of register read/writes after reset that performs tasks
+//! such as:
+//! 1. Programming VRAM memory controller timings.
+//! 2. Power sequencing.
+//! 3. Clock and PLL configuration.
+//! 4. Thermal management.
+//! 5. Performs VRAM memory scrubbing (ECC initialization) - on some GPUs it scrubs
+//!    only part of memory and then kicks of 'async scrubbing'.
+//!
+//! devinit itself is a 'script' which is interpreted by the PMU microcontroller of
+//! the GPU by an interpreter program.
+//!
+//! Note that the devinit sequence also needs to run during suspend/resume at runtime.
 
 use kernel::bindings;
 use kernel::devres::Devres;
@@ -9,15 +24,28 @@
 use crate::driver::Bar0;
 use crate::regs;
 
-/// Wait for devinit FW completion.
+/// Wait for gfw (GPU firmware) boot completion signal (GFW_BOOT).
 ///
-/// Upon reset, the GPU runs some firmware code to setup its core parameters. Most of the GPU is
-/// considered unusable until this step is completed, so it must be waited on very early during
-/// driver initialization.
+/// Upon reset, several microcontrollers (such as PMU, SEC2, GSP etc) on the GPU run some GPU
+/// firmware (gfw) code to setup its core parameters. Most of the GPU is considered unusable until
+/// this step is completed, so it must be waited on very early during driver initialization.
+///
+/// The GPU firmware (gfw) code includes several components that execute before the driver loads.
+/// These components are located in the VBIOS ROM and are executed in a sequence on these different
+/// microcontrollers. The devinit sequence itself runs on the PMU, and the FWSEC runs on the GSP.
+///
+/// This function specifically waits for a signal indicating core initialization is complete before
+/// which not much can be done. This signal is setup by the FWSEC running on the GSP in high secure
+/// mode.
 pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<()> {
     let mut timeout = 2000;
 
     loop {
+        // Before accessing the completion status in PGC6_AON_SECURE_SCRATCH_GROUP_05, we must first
+        // check PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK. This is because the register is
+        // accessible only after secure firmware (FWSEC) lowers the privilege level to allow CPU
+        // (LS/low-secure) access. We can only safely read the status register from CPU (LS/low-secure)
+        // once the mask indicates the privilege level has been appropriately lowered.
         let gfw_booted = with_bar!(
             bar,
             |b| regs::Pgc6AonSecureScratchGroup05PrivLevelMask::read(b)
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index eae5b7c13155..f4a6a382e83f 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -59,13 +59,26 @@
     31:4    hi_val => as u32
 );
 
-/* GC6 */
-
+/*
+ * GC6:
+ *
+ * GC6 is a GPU low-power state where VRAM is in self-refresh and the GPU
+ * is powered down (except for power rails needed to keep self-refresh working).
+ *
+ * These scratch registers are "always-on" even in a low-power state and have a
+ * designated group number.
+ */
+
+/// Privilege level mask register (PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK)
+/// which dictates whether the host CPU has privilege to access to the
+/// PGC6_AON_SECURE_SCRATCH_GROUP_05 register.
 register!(Pgc6AonSecureScratchGroup05PrivLevelMask@0x00118128;
     0:0     read_protection_level0_enabled => as_bit bool
 );
 
 /* TODO: This is an array of registers. */
+/// PGC6_AON_SECURE_SCRATCH_GROUP_05 scratch register used to check for
+/// GFW boot completion status.
 register!(Pgc6AonSecureScratchGroup05@0x00118234;
     31:0    value => as u32
 );
-- 
2.43.0

