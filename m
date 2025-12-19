Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDD1CD1C61
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 21:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D006E10F0C8;
	Fri, 19 Dec 2025 20:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Eq9Ow23k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010044.outbound.protection.outlook.com
 [52.101.193.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41D810F0BC;
 Fri, 19 Dec 2025 20:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPykeSlIMjobCnMdAapfNn2BTGWDnAcfb4zW3iu23ZSt8SnARm0IoOwVkbd7ep5BgWHEC+A2INrnt4PCBX22uwxGYNBbkKDVlcbnaOmLKqWUSnRxt+3wsSHpFDANUGRyE1dm+4RY/UhCNxtCRrxKbC/vYuBQ9KvUDLetVSOz/AOTd8vFNv7OmeUxNVbjhYa/ncR2LRhwOwV263GQNGlMk6FG4T6CE/5nI8kJ8CvJAfKiRRQPNLCk4miuSt0gT9rsSaBqVl2fDOygDhwI6G9k5h4NrWM/GLxZ2dvHMVWv8GL58ck+m15eMR22w30/llzZo2DfUO+XyfEOsetdCm6HRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqTQb7UnwqgjDlKm+BA/yrgDupYrgAzAtczaCbm1koA=;
 b=reAn+l0cCMM0bDHEZTWPLdMtKmOlFLxIPnN9fUlOPdTtFHi5yMJbFj86yxrZf16YmBzCQvFMck436V2+/8bLUo+UBQKZc5Zs6/9KZ/L6ZDrTKSyCUQCxyBfTQQ1MSEBHK0Kj72lMca0iN8TE5bNw51JawL+4GWLFBQgOwsG3RaawY6j8rqOg6ABxIDtRY5tEM8qMi8+Thi090D+qram5qHkkZpHn5rybOfogyqwhRKM2SIC0GV9G8nEZdzihL08FFWssO0rrxnpTD3TLT7VQ1/qoIcqGNuO+0zeMrQXMND1eHmSVRkbCUhT4yAJrUDcf+j4w0iyDWHlf+dxA4zis9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqTQb7UnwqgjDlKm+BA/yrgDupYrgAzAtczaCbm1koA=;
 b=Eq9Ow23kcTSc/9XCOuvWbTgJwWc1aPGR7TrYUqnvEBdjO33oSoTUs47F0G/kJ0x+StOxBIPJPx4Xm0BM0ik6FhEji//V0ceIyenj2Zob6jFuH0kvCYQzJqPh0nXxVNtqpDzl09FwBOkBvuUTy+YCwYzD75DJ/QcNAW2SYNwaIGuCqMYfhj08XL1A/UVaeWBDEcKPIqNyv3HNVB2LdQY5PVexQS3oS0B9rpQLidJWTXWYf0YKiOZuULdQEeBESN6Zr1flCOVp+OD8QKMLR6OR0Nt8tG4gQCfQ7O4cXkgPwCVOp7fMFgcTxHjz/FK4DVlTG0lM9F3Z/I9KqHthjEtStQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 20:38:16 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 20:38:16 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v5 3/6] rust: gpu: Add GPU buddy allocator bindings
Date: Fri, 19 Dec 2025 15:38:02 -0500
Message-Id: <20251219203805.1246586-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219203805.1246586-1-joelagnelf@nvidia.com>
References: <20251219203805.1246586-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:208:335::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf55a9e-ed11-40d8-d8c1-08de3f3e8964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QtG3z+Sa1xpLuR9Y7U5wK4pYjkpeEVE2GkdQYQ+ywRHI5pmPHFRJies+ecRW?=
 =?us-ascii?Q?xfBTxeeq4lhJyNczcgvcozNJwh3cNqznkEP+shUxP8FLChmgxWjoVQxlO6Yq?=
 =?us-ascii?Q?XncdNIcSccKNZs2VHJdqVE9r3c/2jl/NSgug18l02W77W13/Dpyml/gliLgE?=
 =?us-ascii?Q?3AzL+8yw9yF74vNAPw7XxCJ82ETZ5cDX5erAtfCCc/MVhU5UhPYzSvSeqyR/?=
 =?us-ascii?Q?dkHiMFNNRMD9UaPs+bCAzKBiFuq2HGyU0nuOP8Kq4J/ar04ccdJza1Of1FZE?=
 =?us-ascii?Q?Td4C5f27oe41lKXc6bp2QMZLGbiLVW8m2qEbCLpkvFx/4qt5zrKD1wpPYPIh?=
 =?us-ascii?Q?Odwxzmu39UMR01IAir8aYwwJyXQPiRrf6afv6+mQe4rIzS2HmC/CNuzX8fPo?=
 =?us-ascii?Q?QdJtpbojiDX2J+ZWsURgctRCXQrhZbOo6GH/MloKRBn79vIQIPBd09ArnBfs?=
 =?us-ascii?Q?+GTnpuiyHlOxHrxpraUhjdjS0igQwhnZB5mqcFsb36TjlvOkct8Yw8XtkwB1?=
 =?us-ascii?Q?sN/8xGeZMQlOdlECggmF2G762TtKwQAez907oIE8o58CuKVzuTM0oSP+Gr4C?=
 =?us-ascii?Q?iiNDC+sCpM52noNaFiT8znLQL3NHuPzBChVKaZm/ZmuKfkmWm3hk0Ipanx1i?=
 =?us-ascii?Q?2LrfH6q5PQYaNP4Cqi6CGUer12eCaKvyBxAxnJnX50hLa/h/3gDxSApVxOU/?=
 =?us-ascii?Q?tf6tpy4SODLFIkKdIKwUoIhHNbRD5mPV/Q84Ufhhr08CzoQkjyGeq3/XwN+a?=
 =?us-ascii?Q?2NgcPkNaskIA1bo3nggeQaDHRonh7SyXJSoe2PBsC5wEPCtLTL6gedjw1aZM?=
 =?us-ascii?Q?SF0vtg6fW07cFrwXNCwxsHXbpxpEXdFlaDx/sjHTKZukpRm+ssIFXvqPDUyS?=
 =?us-ascii?Q?VZmNbgl4H4hQmPdqoS4jG1PmBDFdnYZxlGS5bR9iy2kj2VMk5utIdnVgndQi?=
 =?us-ascii?Q?WxYn5vKrb9++KVnORHhQ1CEPNedtbFEKC/5z7fj4SGxSv4TWdGosu8Bw8kIg?=
 =?us-ascii?Q?9p5e3iTxdbcTL2eb15iarX78kPnzuvKZY6U45yKzmV+pb2P96Gt10zqrOaR9?=
 =?us-ascii?Q?0jVXXY6Nesi7aMxfPORXlGuLwPxzg3oQAOy0q5+hjAzl0Cd3RacFLmU9O0HP?=
 =?us-ascii?Q?SEZjysmcnA0uaqdOuzW0Jlg8A9AB97H+zrnC43CO/RWINCRdKnLFolI7cuZb?=
 =?us-ascii?Q?CabfqJJA2qySkKipfDwEXngikN0x4s5tWoDkXLXBiBAN2BFaoQTdv2E5lH8N?=
 =?us-ascii?Q?u5Ec5M6f7J9ngFihtCkN9B3M3xmWzTviH9yl9+SEHVoss3mTobTyQA0LF5Pg?=
 =?us-ascii?Q?CRL8XB+e8zObPjjV08N2L2Mczi9BAQKt7vmP1q9kZnPUtoqEO5DzhnCo1332?=
 =?us-ascii?Q?Ikb89aKFQVwpTSLim2EGbaNVFZ/H/fJd1leYMF+UrknNsJXtN19OD72TteaH?=
 =?us-ascii?Q?39XAPg2QUAcZNVGLVhA2hN2WnwpXdPXOt+8rtaK0bt+64bVYjCY9xKv4j/tV?=
 =?us-ascii?Q?4ggIOIWvRtxxeQY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G5r7dYB9cdmneYYQnZy6tAGwKkz/8WiYSHAo5tweyzWoatx45qju3jh7BTfQ?=
 =?us-ascii?Q?T6uiwoV2Iqh/iIN0UD0ZWOFiFtuZyQrO8ck6s/kB7jfy/nv6xZFTECqEA4vr?=
 =?us-ascii?Q?Rj9qORSHjpa+Pjd3383py+ZdHy0mflTxLyHFu8h2w3+jTuB69TsUN/6sZQev?=
 =?us-ascii?Q?LSuYMiB5Bs12rZK/ILiZ+G+q2w3wzdTcHkRCuFg2k/f0lt8fB9d56fNSUvUI?=
 =?us-ascii?Q?A8uGT2dI6uVx3iLS73u1JED7LiQQJ1b4IAPbAETqfhD3DiA06bM8WYIEUSxn?=
 =?us-ascii?Q?Gt0JssRg/kBrGlnyAej5e9M6N0lWeSF/ri5d+2AeWlzQx8hsBNfx84S2Ieex?=
 =?us-ascii?Q?tVKMkcATLZflu21flDWD1tg9RDL0pLQzSdAD4GVH+/o8e9AlZ3gD7LUh6qhy?=
 =?us-ascii?Q?4p0jQ71fiBNhMBQiTffo5B+RTV2BfStRI1CHxnOvJyOGLyUYYlV7l047ZeKt?=
 =?us-ascii?Q?uLwNisn0NdTvRlR+ZFMoKQW6ODtwQrPOWQiySZQIWGlX0wwcMqUECXAzmOnl?=
 =?us-ascii?Q?IrI4pbPqAEl/1eVqwRU4tMeBjvR5eUrcOOgba390+bme6BdAEWGRM//jSIwF?=
 =?us-ascii?Q?06NrzqWmNzTr8GU6+n4F5nZaz41hvEk5ieLMeqlpTE9ZtRoc7DXgfqr3vHXK?=
 =?us-ascii?Q?5eM4G/TYTIxcMw3r/0ICHunqkn010oRS9aWSEuDTPOtiUeE061X3J5+BC+z/?=
 =?us-ascii?Q?R0QFu8vVYYgfeaNRfRcRU3KPkykjm3SWCyWuc2WLeyNCilzOzOcqlrH1BmdL?=
 =?us-ascii?Q?afEEOr8ElIrvDSlZSABY+hCS6dtruIcafFC6Z3Q2CMJYE5JGUwxSrHnmkQKX?=
 =?us-ascii?Q?giEtlbiOe2JbYKenn3r1rzoEYexcbgGZrwoQtxwyHkgjV/9R+eGf61wPIvD7?=
 =?us-ascii?Q?ISWLZXbwuAYZ41B5Mi0tgvAu913c/vZgvFDE7W8eRW5YupVTd9iNEkGxqNvP?=
 =?us-ascii?Q?QdvqklL8XN4x41SCdD26UOwTtCtj/yi0y4n2w8wf5Vz1cBsT4FfxWWmbwL7v?=
 =?us-ascii?Q?wT24RkyvLO+6xClsz4lJlQjvW3zNgfVYvKh2wKx09sAkA96TxYLUgyUSWESd?=
 =?us-ascii?Q?leMsFN/wiQKyH3Ys6nL9Wipa926XJfg5Krtu0SGdzkbT0bAanvxN2YmyRh/V?=
 =?us-ascii?Q?FfY6FigrnSUhTEvWIUriStjJyWAGrqYhxYm8z6H7bU7TgJ/+vgCDOf1Vs4zW?=
 =?us-ascii?Q?irNG/WOxjaIWW6+HzG7iZFolZp65mGo9ToXgMuWZ1l8a8syph3JESbkq+/xU?=
 =?us-ascii?Q?OXJukga07m+WZASwEHTGPQKOH8uc/StHKF4OnHdG3KUTQ0tQCAdo3aXu+J85?=
 =?us-ascii?Q?R35UZKcDYQwmViK5LuwlRmxn0j906QYSOkjxPdZhQHm+5eyvNfqIW1mjOiAG?=
 =?us-ascii?Q?c8XUWKgBiWutt2PKrGiI0BnNh++CoJSSPuWJXmr+WrMXRBpqJQcytbWCB57q?=
 =?us-ascii?Q?iy1ELAEn8Zns2FPgKqFspr7/VDOUzEnJuc2XL+MzPLjgDnG3y4Hur3eP0gQS?=
 =?us-ascii?Q?dzXI9VLorOIDCFK79v0Wd/o9pl8ezF9iuoHU6OAy9zWGBmGo142ig6o36pcf?=
 =?us-ascii?Q?ZV+N+RAVl4vaS+xwG9VjgiQG5Vc6mfLBQqfnrI9FwQ0s9ALQAfy06dnPwFaa?=
 =?us-ascii?Q?mQaPP3bNv+xrsMAWqVSpNTAK0x8+OZlYaE+FBiZP7mNnqrzJY8Be2TH1z5jG?=
 =?us-ascii?Q?skOoQk6OTCsjRBED594m9ctCG65QjmupQFP5IcwByObz59OQEwOMmRZCwTUT?=
 =?us-ascii?Q?erZT3N01AQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf55a9e-ed11-40d8-d8c1-08de3f3e8964
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:38:16.0402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTYUxAvoKahDlgIWAtETeSyScBiB23Sl3sm5LiRgaPqIZTFLGFlIGhV9diCCwQ+yHGatPo01OlELDmZ1HwJ3cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4248
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

Add safe Rust abstractions over the Linux kernel's GPU buddy
allocator for physical memory management. The GPU buddy allocator
implements a binary buddy system for useful for GPU physical memory
allocation. nova-core will use it for physical memory allocation.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/gpu.c              |  23 ++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/gpu/buddy.rs        | 518 ++++++++++++++++++++++++++++++++
 rust/kernel/gpu/mod.rs          |   5 +
 rust/kernel/lib.rs              |   2 +
 6 files changed, 560 insertions(+)
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b42..940b854a1f93 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/hrtimer_types.h>
 
 #include <linux/acpi.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -144,6 +145,16 @@ const vm_flags_t RUST_CONST_HELPER_VM_MIXEDMAP = VM_MIXEDMAP;
 const vm_flags_t RUST_CONST_HELPER_VM_HUGEPAGE = VM_HUGEPAGE;
 const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE = VM_NOHUGEPAGE;
 
+#if IS_ENABLED(CONFIG_GPU_BUDDY)
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_RANGE_ALLOCATION = GPU_BUDDY_RANGE_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TOPDOWN_ALLOCATION = GPU_BUDDY_TOPDOWN_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CONTIGUOUS_ALLOCATION =
+								GPU_BUDDY_CONTIGUOUS_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CLEAR_ALLOCATION = GPU_BUDDY_CLEAR_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CLEARED = GPU_BUDDY_CLEARED;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TRIM_DISABLE = GPU_BUDDY_TRIM_DISABLE;
+#endif
+
 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
 #include "../../drivers/android/binder/rust_binder_events.h"
diff --git a/rust/helpers/gpu.c b/rust/helpers/gpu.c
new file mode 100644
index 000000000000..415836b86abf
--- /dev/null
+++ b/rust/helpers/gpu.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/gpu_buddy.h>
+
+#ifdef CONFIG_GPU_BUDDY
+
+u64 rust_helper_gpu_buddy_block_offset(const struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_offset(block);
+}
+
+unsigned int rust_helper_gpu_buddy_block_order(struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_order(block);
+}
+
+u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy *mm,
+				     struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_size(mm, block);
+}
+
+#endif /* CONFIG_GPU_BUDDY */
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 634fa2386bbb..6db7c4c25afa 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -29,6 +29,7 @@
 #include "err.c"
 #include "irq.c"
 #include "fs.c"
+#include "gpu.c"
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
diff --git a/rust/kernel/gpu/buddy.rs b/rust/kernel/gpu/buddy.rs
new file mode 100644
index 000000000000..d75303baf4ec
--- /dev/null
+++ b/rust/kernel/gpu/buddy.rs
@@ -0,0 +1,518 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU buddy allocator bindings.
+//!
+//! C header: [`include/linux/gpu_buddy.h`](srctree/include/linux/gpu_buddy.h)
+//!
+//! This module provides Rust abstractions over the Linux kernel's GPU buddy
+//! allocator, which implements a binary buddy memory allocator.
+//!
+//! The buddy allocator manages a contiguous address space and allocates blocks
+//! in power-of-two sizes, useful for GPU physical memory management.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::{
+//!     gpu::buddy::{BuddyFlags, GpuBuddy, GpuBuddyAllocParams, GpuBuddyParams},
+//!     prelude::*,
+//!     sizes::*, //
+//! };
+//!
+//! // Create a 1GB buddy allocator with 4KB minimum chunk size.
+//! let mut buddy = GpuBuddy::new(GpuBuddyParams {
+//!     physical_memory_size_bytes: SZ_1G as u64,
+//!     chunk_size_bytes: SZ_4K as u64,
+//! })?;
+//!
+//! // Verify initial state.
+//! assert_eq!(buddy.size(), SZ_1G as u64);
+//! assert_eq!(buddy.chunk_size(), SZ_4K as u64);
+//! let initial_free = buddy.free_memory_bytes();
+//!
+//! // Base allocation params - reused across tests with field overrides.
+//! let params = GpuBuddyAllocParams {
+//!     start_range_address: 0,
+//!     end_range_address: 0,   // Entire range.
+//!     size_bytes: SZ_16M as u64,
+//!     min_block_size_bytes: SZ_16M as u64,
+//!     buddy_flags: BuddyFlags::try_new(BuddyFlags::RANGE_ALLOCATION)?,
+//! };
+//!
+//! // Test top-down allocation (allocates from highest addresses).
+//! let topdown = buddy.alloc_blocks(GpuBuddyAllocParams {
+//!     buddy_flags: BuddyFlags::try_new(BuddyFlags::TOPDOWN_ALLOCATION)?,
+//!     ..params
+//! })?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_16M as u64);
+//!
+//! for block in topdown.iter() {
+//!     assert_eq!(block.offset(), (SZ_1G - SZ_16M) as u64);
+//!     assert_eq!(block.order(), 12); // 2^12 pages
+//!     assert_eq!(block.size(), SZ_16M as u64);
+//! }
+//! drop(topdown);
+//! assert_eq!(buddy.free_memory_bytes(), initial_free);
+//!
+//! // Allocate 16MB - should result in a single 16MB block at offset 0.
+//! let allocated = buddy.alloc_blocks(params)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_16M as u64);
+//!
+//! for block in allocated.iter() {
+//!     assert_eq!(block.offset(), 0);
+//!     assert_eq!(block.order(), 12); // 2^12 pages
+//!     assert_eq!(block.size(), SZ_16M as u64);
+//! }
+//! drop(allocated);
+//! assert_eq!(buddy.free_memory_bytes(), initial_free);
+//!
+//! // Test non-contiguous allocation with fragmented memory.
+//! // Create fragmentation by allocating 4MB blocks at [0,4M) and [8M,12M).
+//! let params_4m = GpuBuddyAllocParams {
+//!     end_range_address: SZ_4M as u64,
+//!     size_bytes: SZ_4M as u64,
+//!     min_block_size_bytes: SZ_4M as u64,
+//!     ..params
+//! };
+//! let frag1 = buddy.alloc_blocks(params_4m)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_4M as u64);
+//!
+//! let frag2 = buddy.alloc_blocks(GpuBuddyAllocParams {
+//!     start_range_address: SZ_8M as u64,
+//!     end_range_address: (SZ_8M + SZ_4M) as u64,
+//!     ..params_4m
+//! })?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_8M as u64);
+//!
+//! // Allocate 8MB without CONTIGUOUS - should return 2 blocks from the holes.
+//! let fragmented = buddy.alloc_blocks(GpuBuddyAllocParams {
+//!     end_range_address: SZ_16M as u64,
+//!     size_bytes: SZ_8M as u64,
+//!     min_block_size_bytes: SZ_4M as u64,
+//!     ..params
+//! })?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - (SZ_16M) as u64);
+//!
+//! let (mut count, mut total) = (0u32, 0u64);
+//! for block in fragmented.iter() {
+//!     // The 8MB allocation should return 2 blocks, each 4MB.
+//!     assert_eq!(block.size(), SZ_4M as u64);
+//!     total += block.size();
+//!     count += 1;
+//! }
+//! assert_eq!(total, SZ_8M as u64);
+//! assert_eq!(count, 2);
+//! drop(fragmented);
+//! drop(frag2);
+//! drop(frag1);
+//! assert_eq!(buddy.free_memory_bytes(), initial_free);
+//!
+//! // Test CONTIGUOUS failure when only fragmented space available.
+//! // Create a small buddy allocator with only 16MB of memory.
+//! let mut small = GpuBuddy::new(GpuBuddyParams {
+//!     physical_memory_size_bytes: SZ_16M as u64,
+//!     chunk_size_bytes: SZ_4K as u64,
+//! })?;
+//!
+//! // Allocate 4MB blocks at [0,4M) and [8M,12M) to create fragmented memory.
+//! let hole1 = small.alloc_blocks(params_4m)?;
+//! let hole2 = small.alloc_blocks(GpuBuddyAllocParams {
+//!     start_range_address: SZ_8M as u64,
+//!     end_range_address: (SZ_8M + SZ_4M) as u64,
+//!     ..params_4m
+//! })?;
+//!
+//! // 8MB contiguous should fail - only two non-contiguous 4MB holes exist.
+//! let result = small.alloc_blocks(GpuBuddyAllocParams {
+//!     size_bytes: SZ_8M as u64,
+//!     min_block_size_bytes: SZ_4M as u64,
+//!     buddy_flags: BuddyFlags::try_new(BuddyFlags::CONTIGUOUS_ALLOCATION)?,
+//!     ..params
+//! });
+//! assert!(result.is_err());
+//! drop(hole2);
+//! drop(hole1);
+//!
+//! # Ok::<(), Error>(())
+//! ```
+
+use crate::{
+    bindings,
+    clist::CListHead,
+    clist_create,
+    error::to_result,
+    new_mutex,
+    prelude::*,
+    sync::{
+        lock::mutex::MutexGuard,
+        Arc,
+        Mutex, //
+    },
+    types::Opaque,
+};
+
+/// Flags for GPU buddy allocator operations.
+///
+/// These flags control the allocation behavior of the buddy allocator.
+#[derive(Clone, Copy, Default, PartialEq, Eq)]
+pub struct BuddyFlags(usize);
+
+impl BuddyFlags {
+    /// Range-based allocation from start to end addresses.
+    pub const RANGE_ALLOCATION: usize = bindings::GPU_BUDDY_RANGE_ALLOCATION;
+
+    /// Allocate from top of address space downward.
+    pub const TOPDOWN_ALLOCATION: usize = bindings::GPU_BUDDY_TOPDOWN_ALLOCATION;
+
+    /// Allocate physically contiguous blocks.
+    pub const CONTIGUOUS_ALLOCATION: usize = bindings::GPU_BUDDY_CONTIGUOUS_ALLOCATION;
+
+    /// Request allocation from the cleared (zeroed) memory. The zero'ing is not
+    /// done by the allocator, but by the caller before freeing old blocks.
+    pub const CLEAR_ALLOCATION: usize = bindings::GPU_BUDDY_CLEAR_ALLOCATION;
+
+    /// Disable trimming of partially used blocks.
+    pub const TRIM_DISABLE: usize = bindings::GPU_BUDDY_TRIM_DISABLE;
+
+    /// Mark blocks as cleared (zeroed) when freeing. When set during free,
+    /// indicates that the caller has already zeroed the memory.
+    pub const CLEARED: usize = bindings::GPU_BUDDY_CLEARED;
+
+    /// Create [`BuddyFlags`] from a raw value with validation.
+    ///
+    /// Use `|` operator to combine flags if needed, before calling this method.
+    pub fn try_new(flags: usize) -> Result<Self> {
+        // Flags must not exceed u32::MAX to satisfy the GPU buddy allocator C API.
+        if flags > u32::MAX as usize {
+            return Err(EINVAL);
+        }
+
+        // `TOPDOWN_ALLOCATION` only works without `RANGE_ALLOCATION`. When both are
+        // set, `TOPDOWN_ALLOCATION` is silently ignored by the allocator. Reject this.
+        if (flags & Self::RANGE_ALLOCATION) != 0 && (flags & Self::TOPDOWN_ALLOCATION) != 0 {
+            return Err(EINVAL);
+        }
+
+        Ok(Self(flags))
+    }
+
+    /// Get raw value of the flags.
+    pub(crate) fn as_raw(self) -> usize {
+        self.0
+    }
+}
+
+/// Parameters for creating a GPU buddy allocator.
+#[derive(Clone, Copy)]
+pub struct GpuBuddyParams {
+    /// Total physical memory size managed by the allocator in bytes.
+    pub physical_memory_size_bytes: u64,
+    /// Minimum allocation unit / chunk size in bytes, must be >= 4KB.
+    pub chunk_size_bytes: u64,
+}
+
+/// Parameters for allocating blocks from a GPU buddy allocator.
+#[derive(Clone, Copy)]
+pub struct GpuBuddyAllocParams {
+    /// Start of allocation range in bytes. Use 0 for beginning.
+    pub start_range_address: u64,
+    /// End of allocation range in bytes. Use 0 for entire range.
+    pub end_range_address: u64,
+    /// Total size to allocate in bytes.
+    pub size_bytes: u64,
+    /// Minimum block size for fragmented allocations in bytes.
+    pub min_block_size_bytes: u64,
+    /// Buddy allocator behavior flags.
+    pub buddy_flags: BuddyFlags,
+}
+
+/// Inner structure holding the actual buddy allocator.
+///
+/// # Synchronization
+///
+/// The C `gpu_buddy` API requires synchronization (see `include/linux/gpu_buddy.h`).
+/// The internal [`GpuBuddyGuard`] ensures that the lock is held for all
+/// allocator and free operations, preventing races between concurrent allocations
+/// and the freeing that occurs when [`AllocatedBlocks`] is dropped.
+///
+/// # Invariants
+///
+/// The inner [`Opaque`] contains a valid, initialized buddy allocator.
+#[pin_data(PinnedDrop)]
+struct GpuBuddyInner {
+    #[pin]
+    inner: Opaque<bindings::gpu_buddy>,
+    #[pin]
+    lock: Mutex<()>,
+    /// Cached chunk size (does not change after init).
+    chunk_size: u64,
+    /// Cached total size (does not change after init).
+    size: u64,
+}
+
+impl GpuBuddyInner {
+    /// Create a pin-initializer for the buddy allocator.
+    fn new(params: &GpuBuddyParams) -> impl PinInit<Self, Error> {
+        let size = params.physical_memory_size_bytes;
+        let chunk_size = params.chunk_size_bytes;
+
+        try_pin_init!(Self {
+            inner <- Opaque::try_ffi_init(|ptr| {
+                // SAFETY: ptr points to valid uninitialized memory from the pin-init
+                // infrastructure. gpu_buddy_init will initialize the structure.
+                to_result(unsafe { bindings::gpu_buddy_init(ptr, size, chunk_size) })
+            }),
+            lock <- new_mutex!(()),
+            chunk_size: chunk_size,
+            size: size,
+        })
+    }
+
+    /// Lock the mutex and return a guard for accessing the allocator.
+    fn lock(&self) -> GpuBuddyGuard<'_> {
+        GpuBuddyGuard {
+            inner: self,
+            _guard: self.lock.lock(),
+        }
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for GpuBuddyInner {
+    fn drop(self: Pin<&mut Self>) {
+        let guard = self.lock();
+
+        // SAFETY: guard provides exclusive access to the allocator.
+        unsafe {
+            bindings::gpu_buddy_fini(guard.as_raw());
+        }
+    }
+}
+
+// SAFETY: [`GpuBuddyInner`] can be sent between threads.
+unsafe impl Send for GpuBuddyInner {}
+
+// SAFETY: [`GpuBuddyInner`] is `Sync` because the internal [`GpuBuddyGuard`]
+// serializes all access to the C allocator, preventing data races.
+unsafe impl Sync for GpuBuddyInner {}
+
+/// Guard that proves the lock is held, enabling access to the allocator.
+///
+/// # Invariants
+///
+/// The inner `_guard` holds the lock for the duration of this guard's lifetime.
+pub(crate) struct GpuBuddyGuard<'a> {
+    inner: &'a GpuBuddyInner,
+    _guard: MutexGuard<'a, ()>,
+}
+
+impl GpuBuddyGuard<'_> {
+    /// Get a raw pointer to the underlying C `gpu_buddy` structure.
+    fn as_raw(&self) -> *mut bindings::gpu_buddy {
+        self.inner.inner.get()
+    }
+}
+
+/// GPU buddy allocator instance.
+///
+/// This structure wraps the C `gpu_buddy` allocator using reference counting.
+/// The allocator is automatically cleaned up when all references are dropped.
+///
+/// # Invariants
+///
+/// The inner [`Arc`] points to a valid, initialized GPU buddy allocator.
+pub struct GpuBuddy(Arc<GpuBuddyInner>);
+
+impl GpuBuddy {
+    /// Create a new buddy allocator.
+    ///
+    /// Creates a buddy allocator that manages a contiguous address space of the given
+    /// size, with the specified minimum allocation unit (chunk_size must be at least 4KB).
+    pub fn new(params: GpuBuddyParams) -> Result<Self> {
+        Ok(Self(Arc::pin_init(
+            GpuBuddyInner::new(&params),
+            GFP_KERNEL,
+        )?))
+    }
+
+    /// Get the chunk size (minimum allocation unit).
+    pub fn chunk_size(&self) -> u64 {
+        self.0.chunk_size
+    }
+
+    /// Get the total managed size.
+    pub fn size(&self) -> u64 {
+        self.0.size
+    }
+
+    /// Get the available (free) memory in bytes.
+    pub fn free_memory_bytes(&self) -> u64 {
+        let guard = self.0.lock();
+        // SAFETY: guard provides exclusive access to the allocator.
+        unsafe { (*guard.as_raw()).avail }
+    }
+
+    /// Allocate blocks from the buddy allocator.
+    ///
+    /// Returns an [`Arc<AllocatedBlocks>`] structure that owns the allocated blocks
+    /// and automatically frees them when all references are dropped.
+    pub fn alloc_blocks(&mut self, params: GpuBuddyAllocParams) -> Result<Arc<AllocatedBlocks>> {
+        let buddy_arc = Arc::clone(&self.0);
+
+        // Create pin-initializer that initializes list and allocates blocks.
+        let init = try_pin_init!(AllocatedBlocks {
+            list <- CListHead::try_init(|list| {
+                // Lock while allocating to serialize with concurrent frees.
+                let guard = buddy_arc.lock();
+
+                // SAFETY: guard provides exclusive access, list is initialized.
+                to_result(unsafe {
+                    bindings::gpu_buddy_alloc_blocks(
+                        guard.as_raw(),
+                        params.start_range_address,
+                        params.end_range_address,
+                        params.size_bytes,
+                        params.min_block_size_bytes,
+                        list.as_raw(),
+                        params.buddy_flags.as_raw(),
+                    )
+                })
+            }),
+            buddy: Arc::clone(&buddy_arc),
+            flags: params.buddy_flags,
+        });
+
+        Arc::pin_init(init, GFP_KERNEL)
+    }
+}
+
+/// Allocated blocks from the buddy allocator with automatic cleanup.
+///
+/// This structure owns a list of allocated blocks and ensures they are
+/// automatically freed when dropped. Use `iter()` to iterate over all
+/// allocated [`Block`] structures.
+///
+/// # Invariants
+///
+/// - `list` is an initialized, valid list head containing allocated blocks.
+/// - `buddy` references a valid [`GpuBuddyInner`].
+#[pin_data(PinnedDrop)]
+pub struct AllocatedBlocks {
+    #[pin]
+    list: CListHead,
+    buddy: Arc<GpuBuddyInner>,
+    flags: BuddyFlags,
+}
+
+impl AllocatedBlocks {
+    /// Check if the block list is empty.
+    pub fn is_empty(&self) -> bool {
+        // An empty list head points to itself.
+        !self.list.is_linked()
+    }
+
+    /// Iterate over allocated blocks.
+    ///
+    /// Returns an iterator yielding [`AllocatedBlock`] references. The blocks
+    /// are only valid for the duration of the borrow of `self`.
+    pub fn iter(&self) -> impl Iterator<Item = AllocatedBlock<'_>> + '_ {
+        // SAFETY: list contains gpu_buddy_block items linked via __bindgen_anon_1.link.
+        let clist = unsafe {
+            clist_create!(
+                self.list.as_raw(),
+                Block,
+                bindings::gpu_buddy_block,
+                __bindgen_anon_1.link
+            )
+        };
+
+        clist
+            .iter()
+            .map(|block| AllocatedBlock { block, alloc: self })
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for AllocatedBlocks {
+    fn drop(self: Pin<&mut Self>) {
+        let guard = self.buddy.lock();
+
+        // SAFETY:
+        // - list is valid per the type's invariants.
+        // - guard provides exclusive access to the allocator.
+        // CAST: BuddyFlags were validated to fit in u32 at construction.
+        unsafe {
+            bindings::gpu_buddy_free_list(
+                guard.as_raw(),
+                self.list.as_raw(),
+                self.flags.as_raw() as u32,
+            );
+        }
+    }
+}
+
+/// A GPU buddy block.
+///
+/// Transparent wrapper over C `gpu_buddy_block` structure. This type is returned
+/// as references from [`CListIter`] during iteration over [`AllocatedBlocks`].
+///
+/// # Invariants
+///
+/// The inner [`Opaque`] contains a valid, allocated `gpu_buddy_block`.
+#[repr(transparent)]
+pub struct Block(Opaque<bindings::gpu_buddy_block>);
+
+impl Block {
+    /// Get a raw pointer to the underlying C block.
+    fn as_raw(&self) -> *mut bindings::gpu_buddy_block {
+        self.0.get()
+    }
+
+    /// Get the block's offset in the address space.
+    pub(crate) fn offset(&self) -> u64 {
+        // SAFETY: self.as_raw() is valid per the type's invariants.
+        unsafe { bindings::gpu_buddy_block_offset(self.as_raw()) }
+    }
+
+    /// Get the block order.
+    pub(crate) fn order(&self) -> u32 {
+        // SAFETY: self.as_raw() is valid per the type's invariants.
+        unsafe { bindings::gpu_buddy_block_order(self.as_raw()) }
+    }
+}
+
+// SAFETY: `Block` is a transparent wrapper over `gpu_buddy_block` which is not
+// modified after allocation. It can be safely sent between threads.
+unsafe impl Send for Block {}
+
+// SAFETY: `Block` is a transparent wrapper over `gpu_buddy_block` which is not
+// modified after allocation. It can be safely shared among threads.
+unsafe impl Sync for Block {}
+
+/// An allocated block with access to the allocation list.
+///
+/// # Invariants
+///
+/// - `block` is a valid reference to an allocated [`Block`].
+/// - `alloc` is a valid reference to the [`AllocatedBlocks`] that owns this block.
+pub struct AllocatedBlock<'a> {
+    block: &'a Block,
+    alloc: &'a AllocatedBlocks,
+}
+
+impl AllocatedBlock<'_> {
+    /// Get the block's offset in the address space.
+    pub fn offset(&self) -> u64 {
+        self.block.offset()
+    }
+
+    /// Get the block order (size = chunk_size << order).
+    pub fn order(&self) -> u32 {
+        self.block.order()
+    }
+
+    /// Get the block's size in bytes.
+    pub fn size(&self) -> u64 {
+        self.alloc.buddy.chunk_size << self.block.order()
+    }
+}
diff --git a/rust/kernel/gpu/mod.rs b/rust/kernel/gpu/mod.rs
new file mode 100644
index 000000000000..8f25e6367edc
--- /dev/null
+++ b/rust/kernel/gpu/mod.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU subsystem abstractions.
+
+pub mod buddy;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index cd7e6a1055b0..d754d777f8ff 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -98,6 +98,8 @@
 pub mod firmware;
 pub mod fmt;
 pub mod fs;
+#[cfg(CONFIG_GPU_BUDDY)]
+pub mod gpu;
 #[cfg(CONFIG_I2C = "y")]
 pub mod i2c;
 pub mod id_pool;
-- 
2.34.1

