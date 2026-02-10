Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKEXEBXAi2m1aQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 00:32:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA882120008
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 00:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2110F10E61F;
	Tue, 10 Feb 2026 23:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pEHQUYiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012023.outbound.protection.outlook.com
 [40.107.200.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564A010E135;
 Tue, 10 Feb 2026 23:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8KC1hIZ7ISWMqDhEeYciUhPzrK07xM9rq5WmQ619RyS3wQ4V0ZaiB09wG09ycCuBwVEqYXFX/Y2Kllm0PBZddJI29mSOYEClhtxh25HsS62QDtvMnCUV2uQCDxe+8ymKooPm/AaxV/kMjrXM7vRx2GFjxeO05jnLdeN1rCrNizn6S+zGvNhVzFQZFMfb9pPI0lTbVY7pknmDSFpQ3CcCJQFTfifCWDOnKiKPJCPNviIg++2pA29ZUnQvpjQtOm+oURNzbQUlVPQ7GFsiSfoD53wy7FYF2LMZKkgUqTZtQ0vPDXg83DhKSDXgzfg8YdYhd+QJ1rVQhIdmDo486dWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNsiECXK2jxOwC0wWhs3b0oXxNKQAoQ5yH3CrYiCEd0=;
 b=WzvOoeUnHvZZqaypz95LgUqQT+K4iSBzZ6DDCyrOtTupjomPS0PVgmOxT4QUuhce83bYP90JU2rxN4wTwl83Gof89KHuw6DguTIqM2bUopCFGq60vvuZeHT/5+RIv1lc/ZHc/+mHkVBXJ3JbI68OVsS/g0/fnw2E2bLnAptrjFnZAeHNkaoWksk7iQW8fcKmEB+0k4o2VlFFKypoWPXWOVVBdTS0Exi6CAU5+2gpTm1BXDQeVvrAWwOIIgRRLMe1QoWm4CGj7vy1PqTp06O9ZD/BhOQh8m82ki2M5ap+cLKf1uOnlOVQqTq36TpylcRISZhLH3DrsrcJhyfyaHE/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNsiECXK2jxOwC0wWhs3b0oXxNKQAoQ5yH3CrYiCEd0=;
 b=pEHQUYiq3jLfshxs0LEfb50N7Szg/ypw3ydilcOSarmVZK625HjyTYgCLv3JtcNkoZ0Bt3+y4LhRKEXpzhw5NBp7w9Jj2Ms/RsA7V0S6pmfmNxQVIvHzhUxoPPEskxQRpEDb1eWDhv6wmVLYkzrVBtUbTZrVFIlejZaJX3Q2VPu091n01cMHjduqQUkjzLMsU0GxOVP08i6Iy7t3ytmseB0CJiV2Rd8ox0yt81/NehKw9kGd/oYA9JY1Kj5UChNj9TfaWt8MRPyORCDyiuOGPjiX0p8VPPMJ6JM1a8bx0bl8u8QA7bWY+KPhocdyaGzZfaHT8FyOTKEzMfZtCWN7gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Tue, 10 Feb 2026 23:32:19 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 23:32:19 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 David Airlie <airlied@gmail.com>, Edwin Peer <epeer@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH -next v9 3/3] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
Date: Tue, 10 Feb 2026 18:32:04 -0500
Message-Id: <20260210233204.790524-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210233204.790524-1-joelagnelf@nvidia.com>
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:930:6b::12) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 29016d9a-e37f-4999-03a6-08de68fca1dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KRHF2XDEHVdd+RxAiRhe73a61HyeUH5uVwD41U8TBVhsqsELvoQd58kXW4EI?=
 =?us-ascii?Q?I57JkNbOturs0fYJB1hFEg+e0Qn2DTXwzH3MJj1bd93dgcIFgC1I9jgr8c4A?=
 =?us-ascii?Q?mk4HiY6WLt23i06VZoWChspXMC0tfI85mNqYTpgA+zkafKwEanrdmPzbpxSl?=
 =?us-ascii?Q?Da80e9+JYkCZQhw8NeltnmkvIci+2fwDg5+Dm79nl0MrW6TjEkebTGqcdm9+?=
 =?us-ascii?Q?+zje3D7AQIKM3x7CnlOa63ClUROp2nB2+xNJ9xn/0uAhtOdmaYkCAcyxOj+x?=
 =?us-ascii?Q?2d4PTxwYnBA+xErL/CO+IRoGfAh3eu3STDZDeJwpPjG7LlvOwyzCSGwnOfEo?=
 =?us-ascii?Q?fSqBWKONDSb4FuhZyQJD5olXkIFubveWRIuPfPgKhGage0kipQPOgeH/PkhF?=
 =?us-ascii?Q?PExFKFbI6XVLzueJqtfZ6GRAfG48SyjPBYlly4OoPwK9z5HCVsaH1K48jcKV?=
 =?us-ascii?Q?tW3Em8qR0yS+bK7Xx6GW7l6jmId+qV4FSnHSHjF6i7zQ1p4f8ZiFbpDW+Ahx?=
 =?us-ascii?Q?XXCYnCOcARoMWTbhOTZWTLBgxGAYDEZf0++yewJ8KFWjE3CL6AqH8Ajglh2u?=
 =?us-ascii?Q?VYduv5xaFXeP0V4k6cetSjM1lasCSogKeeqV5c5E/PTqVEPk9fLya8PG1eNb?=
 =?us-ascii?Q?1IhS6tKvbaAV/bhDDP6aIUu+x6DIucjpquBH2MJD9p041131/BuQEP82r+an?=
 =?us-ascii?Q?M+VjTLDuk7QBFEIbiSOMCUGgAS6iu4S3yMbIs7LON3zMDlgCsKyFQ6JgbZlP?=
 =?us-ascii?Q?TgoP4q36N26+jWHUJk4GofnUv7cYpNYeazBC4tCmwihh8PMJKUwJ11uMC/AR?=
 =?us-ascii?Q?SOb24yWwMNH0te5E/O/fBPsj0qLBQ8JHsr/cvG8uwE0hNTdnMkny+8ieIX2p?=
 =?us-ascii?Q?EVCE78vFYfk5Lk0v+J48bSD5DuK+K8p+y/Anv1YWE7cv4Jl3uloclgVjsBb6?=
 =?us-ascii?Q?kz3cMcAr/2VLPtGLThORCtR2CvKDe32cwOLBeiTSmqgQ44FB7XKd3hR/XJXL?=
 =?us-ascii?Q?f+KiDZCHoRP0zTXrsF1pZhpSkIg59STzjWXxwuKCp3XILONUJ9lS66KzA5nU?=
 =?us-ascii?Q?UTmv12hW5/y3SLaePDINxu4F+mO9gIg2os4ETDWaNBiviL1cR97bSk/ZCs/L?=
 =?us-ascii?Q?s7fUThsbRcoBR+QglfAiPlkSqN/OWcxbHExObCp8qIW9tg/fz3wIFh9R+mv5?=
 =?us-ascii?Q?NdhV8oOJw07ihQ9YCtIMH8o9AF01nOwOtscgDMpCotMPbhWsrJ3daz1fgHMb?=
 =?us-ascii?Q?dyNMUV2QbteK4vkv0Xk17QgUUz9UivjsZFo7pRhs+TAezNNmvNLCwEh1l/xZ?=
 =?us-ascii?Q?v4n0chA3cq8seeEiwwBp7qCdduE3dWJQc72dk7UQ/z0pJiKY0cqTGRg6Ik9X?=
 =?us-ascii?Q?6Kt+Io2GvpPBxdjyspLUjmLS0/BSfjG2zMOOkWQPaVYNDvGqO/AQcd2MmXqK?=
 =?us-ascii?Q?FMwavncTYUNsASL1NMq7fB/wWZGK1t1t1sePr7AaUY5Y8ZsQJiW3Il/TS6O1?=
 =?us-ascii?Q?HGEfNjVgpynxsRPzgFFSOIJfMQhLVBMorTyCvhA0wscKE1/rDWorgWAhNXP9?=
 =?us-ascii?Q?BVA1iksHEzQ/0G5nYPM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wMLZd7eLowTkOiqzPso2yRzG1sTIglFFIp+ZNi7wCEackObAZF99f5zsnlI6?=
 =?us-ascii?Q?X3zKbgq+07n/kKYuMPywUq6+ceHxPtjNTogWRcE8loYNM4L5L4xBTYwCUOEb?=
 =?us-ascii?Q?kW004gSQx2DXiPwHyv0z4KIrIazSK7gloUG2R22vLQI2cQ4bT5zIIKBtjF+D?=
 =?us-ascii?Q?PN8aYQN6vTORJA+cgFBQwV9/WsCvW5aH61G9K4npOXavOf8bE7OEzKN+x3Ka?=
 =?us-ascii?Q?VqeqONztKkFPrZHFikgqZo0L0stkyxDFgtDJvrwWdMxxt6nMQrYGnf1sMu/n?=
 =?us-ascii?Q?iqe9XvtRI6ZzXkQre1RnGxK/XUj5Esn73I2ZcRSFE3iTSOGkWpTt/UeMty/M?=
 =?us-ascii?Q?z/jLu4EG9rVB6ivy0SiUqNVGbxiA9V3m1+sD9W2x/4mSqiTiB/VyaYBVySvc?=
 =?us-ascii?Q?rbss2E9JWigbVv6wQO+jJa2SYPHPzEzPuoINNrtsHD7ynYZnvURcg0zM/mKr?=
 =?us-ascii?Q?0yR7EXkRu9sqlC/yjargRC74JaIPs6Ciy/gyfWgkD9yTs23DgVRKv3h3V8Vl?=
 =?us-ascii?Q?ZmIrEVWsSXeh8Q5ix1K86XNLlNkpRcJAXSi2e7iJZhkhC+wwy3/CPO1roGy9?=
 =?us-ascii?Q?riTE0fwHF3gPjeyIG76NOh/hgFd0yXbsGeg+AWLo7DutEhHGPYP/KS+wzOzr?=
 =?us-ascii?Q?aef4lHbUop/CBrF45tXYG6/kles+dbjPM0wdSWN0k0GFToLmNxj9Vue0H+kc?=
 =?us-ascii?Q?36N6nEXwy8T9/cfaJ/MVE4uwCrNlLyq78pq5VIay++VFPkvz58MidJlWu4z3?=
 =?us-ascii?Q?s98jqtn2K5qP0kgkGWmmhvSWjZJZP4HLdXN0P0ZmHZYvcU27rZ+tukXhrDdV?=
 =?us-ascii?Q?kI1vBUb3yYCP+OZJRXRYA0NcdqLgaXvE61QUyoKp/s2bKfNzJFN6aPj5GY+i?=
 =?us-ascii?Q?VPaOFuUDygvlsYkcVT6KikAP2OD2FSUfbbYafhOpLYvFCJyuA/hJhkHe8fOe?=
 =?us-ascii?Q?nDcnXqif/cGD0z3BIobbD9SBL153FRZk1MpKq7CXd+IW5fd/0FSjgn6Vm9tv?=
 =?us-ascii?Q?2nV9hNUhueOM1UVJoiSncbN1TkhjH8YvpZRYRfxH5PwLWWKNBZx+1YnKiCUf?=
 =?us-ascii?Q?8rn7wCcQvtgo9ByPiZNohg9zVjds1x1WelP6uklv4WByy53lDi6M6uyfkP41?=
 =?us-ascii?Q?KMr7ywlW9ldPO7VduO1Wam/tspFbDDyVeMIZWGFUAW3Rdy3hhqlRgMZ85J5u?=
 =?us-ascii?Q?N9MOwBCnsjxGJBsBQagEZOk+QHZwQ+Q7iyppyJs/b+qXKTcx6BsmDyWPFYQ8?=
 =?us-ascii?Q?AEn1+QZcuv9fOwOhlwJ39irt1c8cT0kI7sraqgtiMxmmGaBDwcmNM1Lc9Vaq?=
 =?us-ascii?Q?+G+YLhrTY97MOyZuiRc0Q1nop7U/J2rSbZhggI0UmhOlUN9lixWxo64XYIOE?=
 =?us-ascii?Q?1YwLrLXV7RlAZ3+MZ6S4exLvJNLSawvhiXmS4amkxGSLA07Z3FN4OGTWWQmy?=
 =?us-ascii?Q?m6wFQQ0LxaWQzK4jlMz0kS8nPTObz/5LeXangsQAFeXnfnO3+nomgkaEEbFh?=
 =?us-ascii?Q?0kOf2s9ZShQIgb82b96KzyvWmDLHzMqnvkKC7wOnjBDz1kVfLxmstew7hsf+?=
 =?us-ascii?Q?CuzBxcKoTXIg3yiog9muBwMeKrZ7XOK9fdeAuFtNiPL0Cr75kV6JrjoEM7xX?=
 =?us-ascii?Q?klDGch71Z2unoIk9tY7Ft27Q0kfz0mbcJodguXEZZkQ0XXSH2DS3Tqnjj/Py?=
 =?us-ascii?Q?au4W23iVQ/aErOBjsxoKavRvCCTsB1KV+RC/RFdwXFGFDsXSoJJOHwx5Qrm3?=
 =?us-ascii?Q?VnW02PU/AQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29016d9a-e37f-4999-03a6-08de68fca1dd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 23:32:19.1679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RY7lXTMFDdvpSu3B4fn2ODs3byHCcoismnMBv8v4B4ZTu8posj0Ja1MWz9myscUp7YwSv4XB7bE5d2eplzEo/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: CA882120008
X-Rspamd-Action: no action

nova-core will use the GPU buddy allocator for physical VRAM management.
Enable it in Kconfig.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 527920f9c4d3..6513007bf66f 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -3,8 +3,9 @@ config NOVA_CORE
 	depends on 64BIT
 	depends on PCI
 	depends on RUST
-	select RUST_FW_LOADER_ABSTRACTIONS
 	select AUXILIARY_BUS
+	select GPU_BUDDY
+	select RUST_FW_LOADER_ABSTRACTIONS
 	default n
 	help
 	  Choose this if you want to build the Nova Core driver for Nvidia
-- 
2.34.1

