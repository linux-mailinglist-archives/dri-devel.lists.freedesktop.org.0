Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF026CD1C40
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 21:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DA410F0AA;
	Fri, 19 Dec 2025 20:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NHiYD59q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010060.outbound.protection.outlook.com
 [52.101.193.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D4610E053;
 Fri, 19 Dec 2025 20:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsuGWw9XgRunBdmEMiHEjrcd5ephnWyqqYPD6ITwXZQHfQ8HOGCiOsAR+Ps0uNHffObxjfnD9dMQQgxIR8k3pLf5EDRrMVmAKFrp6KMuQra4i40FWB3RiqyYhrfjD23wEY7OZco4r4mnJNBK0DE94C+UCYdfz39mg8bQne3IjofbnI7gdy5Cukna637Bt5EVm/XggaKCq1pufNW5Wwnrb/w84avlNsE875m8+ShESu7pviD0FKVVaIBnZ3q+y7fi2hbtipjQN8y7U/GNqV4E0VFVXkVzmdEHsx3q6M4GoZIyRVUHa+W87XcTm3dieqw+4VdrXS1uO+qaN6o6OolCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5vpq9kAsPE8M4dr8GKMjVgztODwSuR62pZ8lOOp6LE=;
 b=uIGTetOh7j/zX/HN4NVxP9D2yOwZxLfPHPBvY3R8o7iWIwtfFZB+CINb0GMVpDPaayohjPBELvZakJK1rxInmMaZfvfB5TtPptln6d7ETCfTy5GUVI+D7aeqoYaZcpf5/4OfANGMkt/nAfdAF5RaHmagZcvfNhmF+5bUrNmdWR0+0+B544bCGcnGIM/4oFZCYK/G5FOr8NV8JciL0yjqszwh4o4UyCuA8+dJsBuWgBUBP9PFH9YmBDkZFJOuejCwwU9F4Dvk2Viu9lHEt3XHx5W9qC2s93MxUyBsCir9YS9TmbPblz4eAkuNFJRtM9QjFIfYgXCUN9A4UEqm9eY9zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5vpq9kAsPE8M4dr8GKMjVgztODwSuR62pZ8lOOp6LE=;
 b=NHiYD59q0qf+5BqgQEf2h8eT73aP1FrVZeeDeRGl687O2po2VeGixmAmQspTDmsb15yqAfPKW9/NZS5poYmLwv5GYW6d7AhrMF5L+VWJUHPdYGx+i4AwMsW3jS9tXw4OhPzzSbqL0cwFJZVPT01vGSQrC/6u26eigqy7W3lQaFL0icSb4n9LsSeiWdWYzLFhFpm3ajxUcIPEuqVsv7SpoXA6qxDL7vJjEKu+6YW6Eo2to8rdorDPqeoD/MNNUE5vP7lGofqmU1/S2rbdz1QMGvtCMrgGQLrHXMuVWhejM5Rbg5Tmb1Wgooz1jZNiSpBYAG39ZHMw1PUk9X8kujQnSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 20:38:09 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 20:38:09 +0000
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
Subject: [PATCH RFC v5 0/6] nova-core: Memory management initial patches
Date: Fri, 19 Dec 2025 15:37:59 -0500
Message-Id: <20251219203805.1246586-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ba80d7-1b87-4ecd-8ee7-08de3f3e8580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Iu8cYFQs918VyX08wfS+mLJO7zdXRKeOogFR5C0hMzQZfDm8Vj0zf7/grZjX?=
 =?us-ascii?Q?VdT4t3hb7VWDZki58G1Eq0lV6keJBDBYmFvqOYSvj1w8ryCoZMXZEd25szK1?=
 =?us-ascii?Q?YevSpaCXV7h8mPl/P46FnqppAHQxZDUlsECYh08LvyPCJ4FHDw1g4ITti5kD?=
 =?us-ascii?Q?PDy0WLfFb8qhsSSUI/belbgfgxwIO5DGGfeC81rYj0qBUflH9KBkNdAqzeav?=
 =?us-ascii?Q?sQxMqpLcuAEz/l5Ww7R57CHqC+ty95uo7Ry4/uPRJuAOlcQyiemARi88Fa4b?=
 =?us-ascii?Q?zTMakFXiqtQp3DZrR9HVc7sXj+D5cn1gkJHpjVw7jzZ/JOlnnt3ueehv2/In?=
 =?us-ascii?Q?zUUTW49yeH0zWm2610/II1rCqSjNwSamHl2b26CAIBdK2dwXnU2CbFER5BDK?=
 =?us-ascii?Q?S08e0YWt5uID9lrskTkr+k/oKQBxnzc+/PXXxbKbpzZsAXVaLRqHcyDsL3OC?=
 =?us-ascii?Q?KcNu92lED/Pm73cQjxTbUjpudm/JXLMfSOLVwPQGRY6zlEkMx8vVDtvevwfg?=
 =?us-ascii?Q?K9CPsGLzg1/+kZId2wkcE677VwA18w89uGm9leYDvG9wmxZ9DMz7d9vdOh75?=
 =?us-ascii?Q?zir/4YCEwuFY/DNwvo6bT7FZR9g6t86cxZGmQCQZMTUx9sbR1t0mVbyS4vUa?=
 =?us-ascii?Q?O9vVsSl38IO4h8P29GB7Pc+hoAOumgqlAxtmfndt2cQt/k86z52KXKNKfHFR?=
 =?us-ascii?Q?L+BCNREuD3qhFDkLBte+la/he07wJfMzqUYnrktOjdQOiOROknUUAW4Sxoo/?=
 =?us-ascii?Q?frS0R2EB9ZxTAmDHEraxZ/EFKSOACaxGQ/1A9iSab6vTP5adjSN/bVutCl0s?=
 =?us-ascii?Q?K9Gbvm+Cr9A3gZx9hsQcX8IcX3fIlX/5ZYuGJiq0+juSWST3sHZFzBmFX4aU?=
 =?us-ascii?Q?TTijvKIk76yowubHdCXgEAmHTzYo/CMKvpMNl9k8YRLEGSVNEzZF88Q7/P7i?=
 =?us-ascii?Q?PyuWRGq83r3gQkiVu7oAFhDiOWuSS/rMgybeNiTnlHFFr0GK6DPhTRyJMaZO?=
 =?us-ascii?Q?wXU3JTug56Vm4Btks0I86cnzaxN2d8hEL60grIPvsp6hUwU5j0NmHKhiUZDp?=
 =?us-ascii?Q?RZjSnbNGReG7Lh6a6JIoGhqjN+iSKY3+n2hWwdr0k1cJdoreY3+H2aPmmz8R?=
 =?us-ascii?Q?0Bac5YU8PPcGHsl30/Mi9wC6Pk9xDT23+zz8N47UPxfu1EycS2jlxlbrt0yw?=
 =?us-ascii?Q?0vyAi/+4PIZoWhlVLuobJijBrZpPzAaD4YYLh7xmWOHC2Drx4Rmlqxwu6xb3?=
 =?us-ascii?Q?8aH2hX8BFfTV63j/MgnRcAEuv+S57jn2XCf99IpP7zpupi+Boo2KzF7TeoA3?=
 =?us-ascii?Q?GZ2he4T3y8hIN7843KtwM4CKgSXa7Ytn/t38FkW+wruhMOfr+2JBM9+63zdm?=
 =?us-ascii?Q?RipjAs56xgxHpKms2RA+UZg8mdLpqm04qKmaec2gveHg3HkiPBAsgyiCwLM4?=
 =?us-ascii?Q?/ShKKfL3/LEbMcKiFzuaamvTkiYTWHa6XCto3G8Nl0Vg8qkuys9SrztYCNHo?=
 =?us-ascii?Q?+vV+bGg+AbRZ0FONHLiHpk42QzqW6uve8qPJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TvTW6UlduMUJndQTMtpAxhGASHJRzxCJmREGfi0KIMetrjlvjNfyGCWdH5UV?=
 =?us-ascii?Q?dpGVz8HSnnsAyI502/iitmuSPhYD8435QzTyClUTcPebfPu0WsdEbrKAofGq?=
 =?us-ascii?Q?pDpu1CAl8lHJhtLvb6whlpoP60K/dSJBTv8vzQO1FzBR0QB+tFE4wO2FzDhT?=
 =?us-ascii?Q?gzjUaCYtkDbAAeFTf7oONTtuM3Rvbd4kZdpLpTw5lfI5YmNnn+3a1duwLu1o?=
 =?us-ascii?Q?iGrKmUFUq1f3bBTfqUPW8CquUzeVm2AK0Qta25ZL4SPthDMHNYKn+zm+hAKX?=
 =?us-ascii?Q?cWcNBBuMED2cHeS7ZBV+SoDF4GB9iK0WBpZmxlfslmZYic3EFIEaXhA2wPPi?=
 =?us-ascii?Q?gvx5geEr74tva1ASLhA6HdG3LSAuxwn5ny/Z8/qofyiyaB3cHW4UuJ7kcRZD?=
 =?us-ascii?Q?eUsL+gpG6taYNTyqhMfdXVwGsjWM0QLoPmH/amwxaVPFKldO7z0+EW3Z+vos?=
 =?us-ascii?Q?slka28HONSw41vkHaRZvyOnxXnS1dW2aw8Weix75ohaClmrBlG8sEaM+OSf0?=
 =?us-ascii?Q?HX3fTb7YmsXb2a5QzG88bHvSfdJ63IXyXzlNDBJcD7BkzexC83pW4tMcXWAk?=
 =?us-ascii?Q?Jg9KxMNFOYcYxXSTT1CtWtN4iI5xZoCNVSd3hRltYC1Y7eCb9+M/Bxx5qUF4?=
 =?us-ascii?Q?LTKE50SvKHTpB0hmhrbfaPlKIhSA+/HPfFwDWF2x3n4aYvSmFUCyVw6+VHnA?=
 =?us-ascii?Q?MJIl+9uI60FUUboOGfg2IMMXPMu1975jBwzVivASJEckmSqqgCYFpFab9Erf?=
 =?us-ascii?Q?Gl6ILni66IrRHlJGEQbLebU8GCkkVNItfTG8kV/FNrbdwqwZyLLrxmKZMbvk?=
 =?us-ascii?Q?hbd+XD0j+J/YkTzc+3g0VCVivur5Ep3m8LBbQB5gCYQcUEUXZOLiV1ZO7BtL?=
 =?us-ascii?Q?qBYMBeMUIRPTD1THbVoABPTCVJHLoZ1g8pY23baho4BJT3pQksJf1NXG67+Q?=
 =?us-ascii?Q?Jhn5TWoIiLIEa6de0brkMYbuLsIjX67k2sri9nx68aktvo1qlnF37qB81KOD?=
 =?us-ascii?Q?pseaWP78w7oon0CjlWGrWPz6padSSgfiLeg+K8veptHj4cOmj5FFnFFSiULr?=
 =?us-ascii?Q?3He/4GgOa+dtdjrzN+XR2cGoG63spvTDC816ix9eHHKh5BJC+KngRjxim8Sa?=
 =?us-ascii?Q?+kteduQ+qNneIMEyPDRfAexnfrEqccwisGUt9nDT5E61fzs73gbRaRvk7Iaf?=
 =?us-ascii?Q?Beg1kLnR6WIVCOmlB9y5RMzUnvup+QQpxBi0Ug9MCeC/SZBHTtGyutCwqZJ5?=
 =?us-ascii?Q?MfHvSnCMBXcmNbFaQ2T6+E5NhXFTAt7tnQDqGOhgHSWDgX1e42N1759MqCbN?=
 =?us-ascii?Q?KJZEVNwZJfC90fcgCDFOxG9QmzMmeIi+Ciy1K7+Y3hxXDPd/0c1vc1wLw/2R?=
 =?us-ascii?Q?nIOYnIqSzRbuC/3Mv1chVrOaAApGCPUTxG0nJoF2fkHcW1TsYNnQ2Zrcu+8O?=
 =?us-ascii?Q?i7xgWsSAs32zQvVuVmpe4tKSS1WyVwhGfPShcNAhGKVoNYOGF1fpFaK3sGyi?=
 =?us-ascii?Q?S/NfFen5lhThGtPeRjQJTdFlqwZXuxPEcO89mdMTCNLMHyv7mJNpCtRoIAwE?=
 =?us-ascii?Q?91HwBZbHeKoD26gqHa1IXeS/U/TibVcB2v7qlG6ADZpaRA4C8kBoyXWkM5uG?=
 =?us-ascii?Q?ZSh1KfkDZUBzH9GLmqAODK2CoV6oH3me2HiD7mvdsonureVG69EZeTVdiO16?=
 =?us-ascii?Q?k5Jl5E8E9qSHyAPN1xzMaYzA/fVjc+6uNmtdD929skjAuJ8CS2kypD5K1tqd?=
 =?us-ascii?Q?O4lOvIGG5g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ba80d7-1b87-4ecd-8ee7-08de3f3e8580
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:38:09.5085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMzFItwkBH5Piz2An0rQR1m/qV0U21KA12s1FddNnY177OOGwARcmuMPavXg2vMfzsPJaJMZyryqB8KTDhhMUw==
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

This series is based on the latest drm-rust-next tree and provides initial memory management infrastructure for the nova-core
GPU driver. It combines and builds upon several previous series and provides a foundation for nova GPU memory management.

The RFC series includes:
- A Rust module (CList) to interface with C circular linked lists, required
  for iterating over buddy allocator block lists.
- Movement of the DRM buddy allocator up to drivers/gpu/ level, renamed to GPU
  buddy, making it available for GPU drivers with non-DRM use cases (e.g., vGPU).
- Rust bindings for the GPU buddy allocator.
- PRAMIN aperture support for direct VRAM access before page tables are initialized.
- Documentation for the PRAMIN mechanism.
- VRAM read/write self-tests for PRAMIN (disabled by default via Kconfig).

The series combines various previous series since all the patches are related.
Moving forward I will only send one coherent series with the mm patches.

Next steps:
Page table types and page table mapping support will be added on top of this
foundation extracted from the original PRAMIN series. I need to make several
changes there such as to support multiple page table formats, as well as
updating it to use the new PRAMIN and buddy APIs.

Changes from v4 to v5:
- Added PRAMIN aperture support for bootstrapping memory management.
- Added documentation for the PRAMIN aperture mechanism.
- Added PRAMIN self-tests for VRAM read/write verification (disabled by default).
- Improved buddy allocator bindings a bit (fewer lines of code).

The patches on based on drm-rust-next commit:
97cf6bc0abd3 ("rust: drm: use `pin_init::zeroed()` for file operations initialization")

Previous series that are combined:
- v4 (clist + buddy): https://lore.kernel.org/all/20251204215129.2357292-1-joelagnelf@nvidia.com/
- v3 (clist only): https://lore.kernel.org/all/20251129213056.4021375-1-joelagnelf@nvidia.com/
- v2 (clist only): https://lore.kernel.org/all/20251111171315.2196103-4-joelagnelf@nvidia.com/
- clist RFC (original with buddy): https://lore.kernel.org/all/20251030190613.1224287-1-joelagnelf@nvidia.com/
- DRM buddy move: https://lore.kernel.org/all/20251124234432.1988476-1-joelagnelf@nvidia.com/
- PRAMIN series: https://lore.kernel.org/all/20251020185539.49986-1-joelagnelf@nvidia.com/

Joel Fernandes (6):
  rust: clist: Add support to interface with C linked lists
  gpu: Move DRM buddy allocator one level up
  rust: gpu: Add GPU buddy allocator bindings
  nova-core: mm: Add support to use PRAMIN windows to write to VRAM
  docs: gpu: nova-core: Document the PRAMIN aperture mechanism
  nova-core: Add PRAMIN aperture self-tests

 Documentation/gpu/drm-mm.rst                  |   10 +-
 Documentation/gpu/nova/core/pramin.rst        |  125 ++
 Documentation/gpu/nova/index.rst              |    1 +
 MAINTAINERS                                   |    7 +
 drivers/gpu/Kconfig                           |   13 +
 drivers/gpu/Makefile                          |    2 +
 drivers/gpu/buddy.c                           | 1310 +++++++++++++++++
 drivers/gpu/drm/Kconfig                       |    1 +
 drivers/gpu/drm/Kconfig.debug                 |    4 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |    2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   80 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |   20 +-
 drivers/gpu/drm/drm_buddy.c                   | 1287 +---------------
 drivers/gpu/drm/i915/Kconfig                  |    1 +
 drivers/gpu/drm/i915/i915_scatterlist.c       |   10 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   55 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |    6 +-
 .../drm/i915/selftests/intel_memory_region.c  |   20 +-
 drivers/gpu/drm/tests/Makefile                |    1 -
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |    5 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |   18 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |    4 +-
 drivers/gpu/drm/xe/Kconfig                    |    1 +
 drivers/gpu/drm/xe/xe_res_cursor.h            |   34 +-
 drivers/gpu/drm/xe/xe_svm.c                   |   12 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   73 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |    4 +-
 drivers/gpu/nova-core/Kconfig                 |   11 +
 drivers/gpu/nova-core/gsp/boot.rs             |    4 +
 drivers/gpu/nova-core/mm/mod.rs               |    5 +
 drivers/gpu/nova-core/mm/pramin.rs            |  298 ++++
 drivers/gpu/nova-core/nova_core.rs            |    1 +
 drivers/gpu/nova-core/regs.rs                 |    5 +
 drivers/gpu/tests/Makefile                    |    3 +
 .../gpu_buddy_test.c}                         |  390 ++---
 drivers/gpu/tests/gpu_random.c                |   48 +
 drivers/gpu/tests/gpu_random.h                |   28 +
 drivers/video/Kconfig                         |    2 +
 include/drm/drm_buddy.h                       |  163 +-
 include/linux/gpu_buddy.h                     |  177 +++
 rust/bindings/bindings_helper.h               |   11 +
 rust/helpers/gpu.c                            |   23 +
 rust/helpers/helpers.c                        |    2 +
 rust/helpers/list.c                           |   12 +
 rust/kernel/clist.rs                          |  357 +++++
 rust/kernel/gpu/buddy.rs                      |  518 +++++++
 rust/kernel/gpu/mod.rs                        |    5 +
 rust/kernel/lib.rs                            |    3 +
 50 files changed, 3385 insertions(+), 1800 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/pramin.rst
 create mode 100644 drivers/gpu/Kconfig
 create mode 100644 drivers/gpu/buddy.c
 create mode 100644 drivers/gpu/nova-core/mm/mod.rs
 create mode 100644 drivers/gpu/nova-core/mm/pramin.rs
 create mode 100644 drivers/gpu/tests/Makefile
 rename drivers/gpu/{drm/tests/drm_buddy_test.c => tests/gpu_buddy_test.c} (68%)
 create mode 100644 drivers/gpu/tests/gpu_random.c
 create mode 100644 drivers/gpu/tests/gpu_random.h
 create mode 100644 include/linux/gpu_buddy.h
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs
-- 
2.34.1

