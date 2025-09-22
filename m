Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B9FB905E6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F294310E433;
	Mon, 22 Sep 2025 11:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZamyCWtr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C61510E432;
 Mon, 22 Sep 2025 11:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsFGCUhXVX1WAfBfTzmHKBI6wuUjSG2JsyT+rYTIOG/qFhzzXvhh9Z3i38ljB7lO8MN80c2qLiDPNUfPRWzpEIdVWxXW/l0rpwviW+xwoAfqzBvzSYVnJWN13Dcs2Awo8sw3InoLzh7eD+dSJeVwwBJBzD3ArmvNJ7X9YDr1BP6lSJ2qChxjDTa0FVvln6y+Q6/x2z5CyiWHoat5ix7z0krOv2czllGTesqfPhVQBwl4dUHWTihpcM46vD2clymV2o99S4fn7Wp1WFSD7H4Uv6YseyDkZrAOA83ArXYfLJyyn64cF0b6O3/A/z86VRh3n9o2zB1opOYPkPXjrn+uTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnZgI/BBwK556n5+NPA2ROEslNmtawNc9cRHCSQ05Ag=;
 b=oXivFnhXicnVoc8g749G7NnrL/nLDpt6uD3MNX+Ha4oHkkrPurMUGnWRlMYMBzdAp9n27fDf/UUzeHY3BtqMUyljXWcbHyfP3eV26els9YIuS8fEjQtw0MUpHIt/zqQSfqnqdSwuDsuAB9B7Wv4mw+1ReARjzb/XnesRVo6EzWIBBAvipPTnAuSpUi3gPvGrVulGCSIGAKcQok+6K5KSbnIrO3MTWiLtOo2EyVvMjzDNcw39RTbDSoiFTldtkaUTaaa6IF5EDPdFjoHb1Sg+0sy4Sa2NhG0hJxUaZrc5Ml2ktnyU78GvfZT/2IpYfJ3gi4SDXsVBGcpoEbhxLNeeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnZgI/BBwK556n5+NPA2ROEslNmtawNc9cRHCSQ05Ag=;
 b=ZamyCWtrdTYEFHvYfUp4IlU3+DpBUBC6iNQ+Cs1+P5umZ3J/dNU/cpeI5D+WBab00QNA6tFuk2QRJZ6EfRoMMIHOUEmIivD+wSntPQQ9Y0E3QsRyb/tPDdt+JI79cE+sbLt1pp8FK/22piX9m5xJNHyE7LkJZscS1+ja0acvumS5+Jtr2S4Yuk4Fy48kt1nRH8y8kupIXcIv44l1l6h8+0LVm/D4M/vWeldlmYNPDpRIboIXdMgiMU4bBhVBV/tmETDjeaPOEuc0Mr4FuqBx7NSecNMJUSvB7YJf/fiaOeAPQPXOsBuX+wVVtJ4uXK+akmRXpSNZsVOX5MmaUXuUiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 11:30:48 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:30:48 +0000
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
Subject: [PATCH v2 01/10] gpu: nova-core: Set correct DMA mask
Date: Mon, 22 Sep 2025 21:30:17 +1000
Message-ID: <20250922113026.3083103-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922113026.3083103-1-apopple@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0149.ausprd01.prod.outlook.com
 (2603:10c6:10:d::17) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: e01f66d4-ccac-4f18-82fa-08ddf9cb7a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UnLqL21jaRk8J91ubo8Cy1Uoj/s4ULIwAs6OkUP7mORasvKEUbbNbpyBgzFY?=
 =?us-ascii?Q?z0EYSNwrOYkQH88Grj2bxhfX9xb1FqOAOy50oRR+ydGlq+68x+DZcHEMwtzO?=
 =?us-ascii?Q?jAQfX86J8eMmx6XLUgh36DEmOWNnPJIMIWYBhiBxD3EiBBaBosCd67IcjK3D?=
 =?us-ascii?Q?nyVUepizkMoymBnfMrEo/4nXEhzS1XbB+TQXIuKTwrKP2DEEp2zFodMsNA4b?=
 =?us-ascii?Q?JMrgmCv/ou6JvK+1uD5JGLDhfW5G7rm7YnyifvkZf5nfdOAFND6zUd0M0r2d?=
 =?us-ascii?Q?o2fscGaoBxwpqByB1U4tQ08jYATzJVb587ZJVUaiXoSnDqn6jrYgtTBLFI8y?=
 =?us-ascii?Q?2QQ9GKGquuMO+D6/5oAp/cK73hHa1FZ/N2aAIEmtUzkIqhw4vCMr8oM3rt5r?=
 =?us-ascii?Q?jsizISOR71vUuUedotziGfMN9sQCqb5Fz85qE91e4xkCNR3z/mxecr7rYGm7?=
 =?us-ascii?Q?idm2zF9IwXCeM5/nnFbnUmfz+h3RobDzckg9Fs9dzUbDnCGd3slwqsEK47qD?=
 =?us-ascii?Q?mIT+UgeTNT6SpKqIw0CdAb7U1ByRB40gm9d2mRUuaVKQ9GmUx/5XPZKOdSJb?=
 =?us-ascii?Q?1hXtZ1pYlBhDrPij4yFXUyKVFXC107YRSdJTn8aFOqQ7oJsSFmlgt5hiOfUw?=
 =?us-ascii?Q?kT3hmtIp6SaevHlpffMI+muhfhYfjSnGF8l6fEF0yy6FIoMUz6MV1vHFMjc0?=
 =?us-ascii?Q?d1N/lxEIA0lbSr3SeyUsrPo7ScMxCTGQkzP+FmT79rmnkT4jIcOHKU8VuwBv?=
 =?us-ascii?Q?eklgkMbItSmikpoI8k2Xkk1MsoK+XCBwTm3asdm2UhcwjZ9j4Oe1jlHag3F5?=
 =?us-ascii?Q?DvEc5AzBBAPML8nOKlO068I3qS5YfjFB9ajC/RUiI271vFY4wi9uQ33LY3bX?=
 =?us-ascii?Q?go82jmm7xPdXcbxdUjSjvJF/2E6NrSntwbWRql0hhO5lqdk5kof1FTzkpAM+?=
 =?us-ascii?Q?nuqgQZ/E/5aKPcVofj46Fo5DvIstaPOSTJLGU1RL12yO714y6bU7IoqB3WcZ?=
 =?us-ascii?Q?C7RzWNoGUxh9WqGQ+juJQ/AzIsoiRYIPgJQT9GFD8mzxRwQ0Kk/jkZ+KA5K4?=
 =?us-ascii?Q?xx+lc0O/DSXYVRKxeBZRwODZPhchilPHMVDYpEi69Q1zBPKEvx9XEfP4F4yh?=
 =?us-ascii?Q?y8v5xjsb/kwSa6D+s9Dxb6zs5goX5l7LHT5gUMQJvhPcsRJLb5rsgpVN/bL7?=
 =?us-ascii?Q?3Nt4bzob14Eqy0UvbiYLglDOplbGiKqgqKJCY1EeTA5ZE2hFUjh74SJtd1mt?=
 =?us-ascii?Q?fRe9K4MP75PeqtYGJyPdZh0wUPbQxEMmArko0QqpLvOCdAoX5h0frUCEy8s2?=
 =?us-ascii?Q?eAmUxU8zF3A9ObyCOKYstTYoo1/e6cpLU3vvVajLxVvVGUlTFP9oMyrnZ1hf?=
 =?us-ascii?Q?E1PgDBo64x+Eu/3xVNs6TeeFMh0hTpLYylfj42rO9qeqwIhIOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Gv1kASfJSNAmIrfmrdgrvN+V9C8D9UVJbut9TjyPILztwBgCVFwuR8Wv8KJ?=
 =?us-ascii?Q?yY+27Ago/eqsOzp7QJgex1LUOFGwbVbWsWCzM5PveEkvya83bWv2KB0ScqRw?=
 =?us-ascii?Q?3IEObT7niQH2sqcq5jL4asJBcZBaegmTa/COxsEIuGQ2yYNcl8yyh1cH3JWb?=
 =?us-ascii?Q?l9ziz0R9UU2mrJwmt+8XFwy1P0vD07X8w2+9kbik+cNqyG2tKVoXQe4Nf4PC?=
 =?us-ascii?Q?bzh9+oumkOPAGNATU4gPIep2EM70dtBfGYKxBS00vT7C7QGH8mf18K8c+3jd?=
 =?us-ascii?Q?4sggN/gFzVPYJq1Zb9UFKFrzkfNTxsDqGBMT7bNuNwUE/WyUGvgbOSBEj/iy?=
 =?us-ascii?Q?IH62ji+V5wYSXunF+D/pvZJFef4H9FHAP3HagKeXWB5ERpy1RMSQwtBIYdeY?=
 =?us-ascii?Q?+cJnQ4MvMkr55QgaP7V5ne3pdCbxmMffjFl5fdo3oKqMib71QeXykoZ5E0Gl?=
 =?us-ascii?Q?MNiRFaXBDBhE2ehomv3b8zz7yTPA7EqJjy69RZTmYHhxa4hwCPuENmi7CErJ?=
 =?us-ascii?Q?LCuNutZBN2d4u6CgdRg/X/U08Z7uJQ7PLQemhL1XdLxGYAN53rSXWNMlm4g0?=
 =?us-ascii?Q?1yiqRXIV7T/z+uUBzVTLGL9gtwnMwJOJljZdwpIlRj3CfdR4Udl2ECA+WfNY?=
 =?us-ascii?Q?fQv9TN5PCz+zXNJpM5DoLDywQC7hkKhrxRKm6znnBwv3S39+T+1t99dLkj3v?=
 =?us-ascii?Q?7uWpU9O/B2jxItdBqW6Dup47nFbEiiFDZIJtEN5Xyosg+hJUIvTp1Qr6l8yM?=
 =?us-ascii?Q?cokqdIX+mmMfpSOyfcNwdPAsCBuLg4y4AGfILARC8il04Xlhdz1Dj44LeLt2?=
 =?us-ascii?Q?ZtWsmQTz0fmZw0pKERJq/H7JXWu8Y88KJBC15zuEQrUxKdlyv+VHPKKk8ZJg?=
 =?us-ascii?Q?7mtFB20QUAJ9K5sWoTvKDT9VLBaL+8FbNt12I98sd53oHhAgnWS9VnyuIQJB?=
 =?us-ascii?Q?EfSqr9pqDdKWS5PF3WeK79i6JvMP0uitJTQs2Bk5QF/ycKydqgXklzfOMyij?=
 =?us-ascii?Q?79CDNQl3Xf8C2mbNRQL1MIhgV8mAL0f8cnJcnIJlnznymxaRxHOv90a4ehYl?=
 =?us-ascii?Q?lw2U6vZ/QWrMMhqerlydxJ9JDe+5DWXvWFPC8uvZ5MrBjox6GxKLmM5MLP3v?=
 =?us-ascii?Q?M8cEAKOFl84qIVK2pNMHK8uRbybwHtZUhIH6ij38eYz5SZWa+HCY1qv1Yak6?=
 =?us-ascii?Q?6oQa+CQvYZegE2i0scccayfmg8ACHcf2+Y9LwI9Dlmy9bPF5BjlpEVeuoZNM?=
 =?us-ascii?Q?78iz4BiPyUv211UZ3Ao94E6mnBD3DNjEe4beboal6BZyG+xnVSlAcLphLtHG?=
 =?us-ascii?Q?GXAdKoUZzko5kBZqKjU7uSiW5a3SUdRb4CpxmVMCZh0pMcp7C5NiVg6ffBRu?=
 =?us-ascii?Q?u5+iqKCL2O1GoDbLyrK3c40Hb0WJcqe/uJs+SDTzNq4nriRpghAn7yq8u4ek?=
 =?us-ascii?Q?2CnBaJD06J5evtmZorqt29jEk+gxYNw7VMsaDiwJDyLnHQPI/XLJDPRxaj9e?=
 =?us-ascii?Q?RkwbrCisNYk8cZEhz4NvrYlvGQso2QlRec5UVcJY3eQWnNGTLwf16Eh+OICk?=
 =?us-ascii?Q?g69kbETS0v8Ln03XWgkEUMsmr+WWtiZO/lQ07aFS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01f66d4-ccac-4f18-82fa-08ddf9cb7a83
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:30:48.7923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2DAWqj2SAjDbyGpTFlX/LGajTRjVd399QqtrSIDWeAE69FkKwW1oJsC8QUBLpIvuPNeyaf/jGGVqkBuReJPTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
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

Changes for v2:

 - Update DMA mask to correct value for Ampere/Turing (47 bits)
---
 drivers/gpu/nova-core/driver.rs | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 1380b47617f7..ccc97340206e 100644
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
+        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };
+
         let devres_bar = Arc::pin_init(
             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
             GFP_KERNEL,
-- 
2.50.1

