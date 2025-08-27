Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74BFB37D84
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B36A10E76A;
	Wed, 27 Aug 2025 08:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bSGqOAJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6040310E76A;
 Wed, 27 Aug 2025 08:20:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZ+O/55waa0OoeSSh16xCwFfdt/AchWcTTe4Q+eSglB57OVCmReKm0P59CikKkF06PJ6r+DG1MFIfNB2ndLBY/itxH6/+5mYLkANxx1LLAOzPynRIuk/Cp5BI7L9i9Y81QjgmUS1m6ep23h/zM+CXUreznoC8i69jlf/Zv3pwpmT03MpTqUvW0kGi8IAlk7q2NnOrq4BSCCKbbUfmWSoXMXVOZx9F0Nsr7ihoaL1iJa3iTzYOEGZNgtHt+DWbPLMCN6cOvj3ilYmeqkp7fFOpWScHFxvO+f/8UWFlfJbAlSQE98phQEdS7h2HKElyuiv0njv2Z/JR6gjJm7WlQv+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rd2VygAkmOePO8jDDLR2txJy6dob5WmXsCwU0r83Ctk=;
 b=V//GI1fBOsBhgVKjlv61sSBOWwZ76/nRWi7Em0NAjvZuyuxU5N9osRJEPHAzZiPEf/eifZGrsNbtdub4eNk1qvCiMNHV07jkel2XIi+ObxBv6wZdlqmE8D0WrrX5yKvP3YpeW//L7rRXACP4kQPeHL/EVWFqldcwTFrj+eW+JpjJhkFGPro56k1zkDXv22Tp7C/LYAxRaFSo4DdgbKSistUNpraedHMkxsXZ9F9JzCYp+yxce8sekOf5II3aYS1bB8BLB1B9O1E7XBWcDnmJBoV+9IJMGbiAIKJoEAk+1VE+P34sDHhxsOMtxd+p0or1Hy4hkSsVRpOTgwGae4m2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rd2VygAkmOePO8jDDLR2txJy6dob5WmXsCwU0r83Ctk=;
 b=bSGqOAJ+9Z1eAUQm2g6L2N1K6KqRPkGC6dDvbHJvES4/ukCsSQdyMgabrBdu9EImifckTWx1IVNUlJYSziQliP3Ki7AhsOfGSqsjYY1RZ/dMnpp/Oq1F0vl0uU7woRwVgZTdRSnKiggBS9QA+L1XOO0VSLayZ3+h69TX7XPBOvTV7pPioi1c/QQG3o6AXRI8xDlRTc7/gQ9aGnwGjjq37boEYSBwq9rZhX0B99UOj11ZIqdb1b+qdNSy8IdGYP4GV3H8+moN4DQPDI6gWSHoxIcldZc8KAnH10jdCjWBxYjdeSKmd6riRQpS9Q0KinN0PRJtQE5tJvLeFeh/er1AOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by SA3PR12MB9157.namprd12.prod.outlook.com (2603:10b6:806:39a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 08:20:29 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 08:20:29 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	acourbot@nvidia.com
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
Subject: [PATCH 01/10] gpu: nova-core: Set correct DMA mask
Date: Wed, 27 Aug 2025 18:19:58 +1000
Message-ID: <20250827082015.959430-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827082015.959430-1-apopple@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MEVPR01CA0036.ausprd01.prod.outlook.com
 (2603:10c6:220:1ff::19) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|SA3PR12MB9157:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cbe1fb-1efd-4ca8-c07b-08dde542956d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1yEAttgTI13SId5ySB6ydBXqRgRKpgo0RzIm53qAvNPk9oWFEAFfdN724nLy?=
 =?us-ascii?Q?3/UsniVKdcicuWcpvYmHiYrRii7FschyAxa3bbxM6QvbOVUTrHWqVmxyxP8i?=
 =?us-ascii?Q?yzEFQtO8O31CXi8oBFaNLNk3NHpKjQ1JyIWZ/p5w4RtbBUk7w0CBSAGycUI0?=
 =?us-ascii?Q?4HlSOA4YXyoBkiWdSrW+1EJhShIew8dbz+VqS0+0RJ+67LAE50cGnERsfwtJ?=
 =?us-ascii?Q?3wDRMy8WDw89byXfjZ3XSHCG07Yr3/+RNP0FVbIQm4BNxoaQpNwRBL3XqT/F?=
 =?us-ascii?Q?NOwKehPFUqIIxEQEsZg+vzR4vJl8qmpxXVDSlGPTSUKN/3nVRNWGqA2X3ZML?=
 =?us-ascii?Q?078pzNaplvJ5/WioGnur/fAJy7KGS3Cs7G0xwqvp0Pq8LS3i5c4BcvTMXk5q?=
 =?us-ascii?Q?D80dMpJYCobwzZcfWx9Zj07FRvi73ewTHIr0B2JPHVC0SiE4w393JIVvPoBt?=
 =?us-ascii?Q?hxCnLkUHu46+z9Obv3/c0PgHswKDJCTbF6CzHdLRw3358TCSZeebwG12KpS/?=
 =?us-ascii?Q?xCAtG2tuf2afPyU4Ge92Ky/4wA1s/mxjzhOiYX9pj5A1itWqPUjIF3szeaBF?=
 =?us-ascii?Q?4BqWi/L5k20h6dUz9VBCOVAkdW4RSDMj8gbv5pzVAL3rQzOdiPW5U4O+d8FF?=
 =?us-ascii?Q?k4K6FgWWnVKulGifPTCwoaHCmhAcUjweEDlBCOxhU6eo0Ns9SCn30d+1+6wP?=
 =?us-ascii?Q?o44Scxi2irRq4hevUVAiwj7GOkBorG3AEkjLyX8St427kl7gJ4z1xB6J8iYl?=
 =?us-ascii?Q?zLYM852I4ImLnFzQNoD7X6w/gfosaoeFWuCf8zKeYOWVMWS/329PmaV7ShWs?=
 =?us-ascii?Q?eB+8z1LHGQq3DUAXRtxsQLVadscoEfUOcm3q+9fqX6X9FAvcR2S01DUvrncs?=
 =?us-ascii?Q?lYGLEKy3wcYO24I/+qpCO5JDm5Mw7UBwJXYHeohRuleJq7oFLQzOpZJDv8Sj?=
 =?us-ascii?Q?F+myObVmN6i/KH34rxrtlWEQvRwM3alESb+ucMWcol9zM3uLJ0xW9oJzjjJb?=
 =?us-ascii?Q?Hmc8+gXsPLcRv2y1q+8aQM0fszK+ms4/6QH/Jjn+s1Pmj+v2ZTG7FYkBSri+?=
 =?us-ascii?Q?/Js+KLFgmlgDhJ/c89W2kYQ8yqBcuS3woaqNqVsIOW7tGwSpLMs3ve1m3HUi?=
 =?us-ascii?Q?2bmHqr2k7cY2NYYR9xYPJK6+HDuNHw/t6KHbvmHRG1W63HvwKJzjLBNdRqmQ?=
 =?us-ascii?Q?nZa896KW2uN3yGFrzdJB/eKv+UWVDpoEOhUYydaZ1loWxfey+zu/d1g2ZrBz?=
 =?us-ascii?Q?B68Kd4SVVUDut1LX/FVTsdvK3mn+TeU+T0mkBi0+Q+C37kznPTxm1GkBnuWQ?=
 =?us-ascii?Q?IU8xnmyTLOcnsbooGDifq8t1atjBXxz5B1HBpbvonOT4GCiJe6s3JQo7LtSh?=
 =?us-ascii?Q?hCa8uQQtfaTLzQNOSPnoSsKNvyv82NiZD4geac2fJuqtllZFX+33d3kBntCx?=
 =?us-ascii?Q?KamldtmdWpg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EpyTCXB1lpS+hdafJMt/zqMkVfp/H400DJhH3LxM8EHTFIQuCT+r9xcNVhVY?=
 =?us-ascii?Q?XFwaZoDDDUK3FuwoBRdr/RvmbwkmKdDK8UNyMGyMHRDBx5Gmhlodvj9WKxZw?=
 =?us-ascii?Q?4AwwxkiSceVFYu8IvqUHiV8+x2MM/LEbTGTfaALaWY9HXB0TzRQIsBIK21i+?=
 =?us-ascii?Q?7N7xUFFjFNRzp3F6sZ4g2AAPKstnHjrBGAMvxR0ymX9rmhYb0qw0k0/M/0j6?=
 =?us-ascii?Q?sUJOsAy7vtrtEaVZswm/3iXhI13HUdaR3WVbJ+uAgX+DtvnbFdobqgDbOCox?=
 =?us-ascii?Q?ELQiICZk+2Vernyoi7eMNMxGGTbF5Hj9PIiqfdmSeM2ed+5hOxsR3F/2E/DZ?=
 =?us-ascii?Q?G+nJ8wXSEW1dIATeK8QYp90lViXNLt9BDmTyUvlM33MDcdvC74vY3iXTcddu?=
 =?us-ascii?Q?ATe1RYl+/SPp9g/dF/1rEpP6p83n9a4hdJRreX+4qbaPcXrCq3I9NqNtG47X?=
 =?us-ascii?Q?9INkStGdr6qXXWQ6yqYyQFpBBms89l3pGgJ0OVUzRoHw9TzKkwfudpDAFMs4?=
 =?us-ascii?Q?bYDo8i1JSwEVEwa6Lm/4V3zE8o3GfGYpdC659F3pd1xGRN9w1ZG+ran+csG1?=
 =?us-ascii?Q?xZaK8oNLI3aVVIjlEbGEr4DBl/JEqyuegFyLpb1xjU+wN5sbVlmOqkfbuv0t?=
 =?us-ascii?Q?79x77lGhAKPrayLF0xQT989VYqnuAqSx5LTKr8GIHeUAtYBMkyD7pkS5UjCe?=
 =?us-ascii?Q?3pHrnZdrUbEDpda53BPaH6f8XJq8xURuFbTcqyVq+5T13mExKcyyD98kbekp?=
 =?us-ascii?Q?VWUijuyxFQoLSsMUm5gxkrhDoOlg+fnUxTV73Ds8kjVUgn3HDrCDw25HtPPo?=
 =?us-ascii?Q?dTlc2YRcbx7I6XVwklsGEGk0iinKBUnw1ndxGS5ZgI5O0hWnM6/Pxc/XxCPo?=
 =?us-ascii?Q?kx8C8jkrOcJ9ZoeJls7c8IGiTHjSO2gyGct9EMWOq+eMZKMkKjePoIU1j4M2?=
 =?us-ascii?Q?LJmLuoOsxI0Z2T+qexTN7nDISpaQ/sjFgy25b0W4URMRHChdghxt/9uBWqwq?=
 =?us-ascii?Q?ZhEof8Wzd5hfsPnwppI96WUVDthC2/LTttgmXCMzA+oPxSoBJLpjhxKgNCaz?=
 =?us-ascii?Q?jeGPYaYe/xEhBAdBpPM5HNg6Gc/u9ZqkbBHJUiPMWSoQgaKyHHz8zq0wp51m?=
 =?us-ascii?Q?e56+q37iC9cmwcQIIWfKEPaMulSZRXpsdMnJkb3inOeZtE2Qu6iGTgCMqnkS?=
 =?us-ascii?Q?jlPhqxCR/hQ9PF9ivCK9agCHrmQPLxwM8NpsHgZ84zesUbdQnjPVwqWU2GGe?=
 =?us-ascii?Q?Rc9U6DfPV3upsN8qDGl12+CAT7dzMpQeEpxtion6HjhpIUmUh4qg972yMWVz?=
 =?us-ascii?Q?QSikATgnixwuwOYX3yOIxppjc9o1qJjM1jDAczBVqk9z9oey5bGJDX1U4461?=
 =?us-ascii?Q?izfzt0sJTpckbDCHyAlxGGs4SsSrxFxj64wh72TGmarprMKkojJ9tv65M00w?=
 =?us-ascii?Q?pi5U4xDrfDnSF72AvxBXeKMiEIQ35C/TWowwEvsiid91rB0c72PESvG1zqPj?=
 =?us-ascii?Q?JpqV1y9F5UDgYvDRC0dXwB8YBxduAexaJY8xUw1NofaFOS4mJ3rgmuoazcdV?=
 =?us-ascii?Q?nXSTxqz9hOTD+MEtQYmE41LLAblDuLi5/Z4DTxHl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cbe1fb-1efd-4ca8-c07b-08dde542956d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:20:29.5599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njszexF9OF1Y95gfEI5ezdSrSzsZyF9KWf9uCtyWMM9NIBxUjuAkMLEtrCLV2fy+mCaeexeCValE4tTRIqeTdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9157
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

Set the correct DMA mask. Without this DMA will fail on some setups.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 274989ea1fb4a..3e154ffb6be4b 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M, sync::Arc};
+use kernel::{
+    auxiliary, bindings, c_str, device::Core, dma::Device, dma::DmaMask, pci, prelude::*,
+    sizes::SZ_16M, sync::Arc,
+};
 
 use crate::gpu::Gpu;
 
@@ -34,6 +37,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
+        // SAFETY: No DMA allocations have been made yet
+        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<48>())? };
+
         let bar = Arc::pin_init(
             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
             GFP_KERNEL,
-- 
2.47.2

