Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2427CA58E3
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 22:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8415D10E9D1;
	Thu,  4 Dec 2025 21:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YzTW+obg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012004.outbound.protection.outlook.com
 [40.93.195.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7938D10E9CE;
 Thu,  4 Dec 2025 21:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk4R8+XymV2GyMbfacLH9ULBvIk96MrWzRRnHp7yZzMuDG4ydro40ePwCx9wmv4+ukHpk7iluo3fUhEgUO3Y39M4Cv3oAGDU2BbuZToeIl+aF9zCBen3T//qev0KOSDH+UnJW5phZ/6n1qqzHidT4bJnrtwZ0YTzotgQqk0MVAsePGerkVWKMvwzMCcXTzcUetOpvAcXzlId/ZmZOEdkHoRxnKn6G0URicjsZaK5t6JTAolQTki5hYJLBppjEhSUsPhWo4RI3Znw3dZUDHdyFKbs5GRC71ZJPGbUC4QqO6+enEoqwv+r38HV4J0p3zIOt9h9hqEKKe/PcE5KuOSCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQ4+E9SJnOrGvVcCiDmjCL6pXuHQ8vQl1L93QaDCEQE=;
 b=DrMhbZsiOi7auAAjzzFd2VUS+LLz0CUMraWg69tJ4UvpgAHpPsdYFhAvN5ale95Z+aHP2yBYzk3LaD5ahAxz5+rvhrwXjgktLwCn7iW48eLxYiL9qPUl7mfjTPsFtZx1cdvxeBXj2BCEgcGHun9rZvTF8kMhvFQwbwaPcp3XyTW6aFvr/0O0pHabtbyQovBBNi8yQqTw2yaZRutD3eCQLD4o2OZbS7R16GaIi6Wp7X6fl6lT8xzmfBflRzU4yDjQHldz7oTgqZ3CJQN1EWNbbRAeuEcS4NbmOaC213xokqHopOfE70DJJ8EpbftcX6ZZYETt9hNLedBFiKeDhQgtog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ4+E9SJnOrGvVcCiDmjCL6pXuHQ8vQl1L93QaDCEQE=;
 b=YzTW+obgOX+8J0ayTR1tzY0cMwgLd3V7m/u1x+T6qKMlccfXVPTiM9BHbCxRpWk6NNBzVIXbuClM4ocYPPkiXVKZw4p+7hgiZ9Fp8m5GRs7GqYsuVCDoZ9YQTBdKj7EvMG3RQ6zmCCRcJnIWLTr8rYzu791knCodzuRQZNkTPMyzBIa2lQ61fCvtUX2VoozHfWvxY0TfQSqUzraUNToAuZsH6OE7SX335ensBRMjvTdsPDhGhKxUdKYaAN9VqhB3/ZVZjhDGRWgFmAQ1Jl8T7MJervjnpBgNH+PhSmOU53nB8YnJGohDx31uXZLZLD07r4rFv2W1bpkDqVVl4cnCNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN3PR12MB9596.namprd12.prod.outlook.com (2603:10b6:408:2cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 21:53:18 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:53:16 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org, Zhi Wang <zhiw@nvidia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Edwin Peer <epeer@nvidia.com>,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 3/3] rust: gpu: Add GPU buddy allocator bindings
Date: Thu,  4 Dec 2025 16:51:29 -0500
Message-Id: <20251204215129.2357292-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204215129.2357292-1-joelagnelf@nvidia.com>
References: <20251204215129.2357292-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::14) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN3PR12MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: c21ba09b-aa71-4ab0-675e-08de337f87d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NbNlC9ReqcCUZV3K2MwNwxLVdbCmscbfBYVoGuETRVtl/hEpPGZxyznhO59i?=
 =?us-ascii?Q?t81Oz6O+F9fVe11QoDAmIr2BtmViQqxj5iVtWwdZQMMt83X4wnd5Hxh2OXHj?=
 =?us-ascii?Q?ZO8HmYP2byV6S9m9jxF6oxVq79Nhz5iQX8lIJ9E2C9Gb+AOpDD6vCsyzgTH8?=
 =?us-ascii?Q?k56KBA9e5Yqhw6xodSx01vNqqPMUrLRee+Gf6KiqllPyQa9nGlOqmRGwnIql?=
 =?us-ascii?Q?OfVmWlyFYLMjUFfFl5SM3C8HCbFVPh0+MaURklCdO6Qb3F8fIB4M3q818Ryn?=
 =?us-ascii?Q?f9QuoTKcCuzWyjG1iGHLMkax80tQmAja8NfWYHZwCylHgSk6UA8hpA1SHGFH?=
 =?us-ascii?Q?5ZgUj277aU39MphrqhQZEm2BUsfI5cA0k6AdgvXGQqx9E37afDu7I/EX9m8j?=
 =?us-ascii?Q?9FsuvjIgF4ab7tKoDrtdhwaa+CAe78c/tJFRT7zhImwWQuLa3dLQmSWjsrQB?=
 =?us-ascii?Q?CHu0Cq+3k88X6cRKAAKgdKs/UDSTq7+HmVY1os5aDofc31nT2+z/HSSS48lR?=
 =?us-ascii?Q?RrlLgyNaEquOnbucfl0bEOTWDKfcW3Ax7EFC85E0i148J876btSU9kRTTCFD?=
 =?us-ascii?Q?LwAckJYZYv20Sk8ob5ZwwzEwlPWi6MYtm7CuhT+qRnyryqUdczHstJNUXFvh?=
 =?us-ascii?Q?7axIa66DrXW4fD41gODPqo5km0a8K/sVJRb/Sq3tNsIjlp5FSIOuu3eXsc17?=
 =?us-ascii?Q?iPrLh6uW6KJu4pq/DX+dvDYf3w4QKbGc4F3LuiVFVTpoqO5FVCgNjMpCtFIi?=
 =?us-ascii?Q?QpBcyR8Cg2ADHUtLS9UKRrFQFMe6GARhpmo9LRG0VsxE1MYIVGy7spkOIKrR?=
 =?us-ascii?Q?KY7M9WzQd40CS4j61OHN4VKQmRAX1klsD5kXnd0GuPdmCyhD/I5ijun9wg9t?=
 =?us-ascii?Q?nbg2fgi0jXdHa1o8n9fcFArBx9+ZbsIowP1TZnDKJtAMd9KpksnmR3asT/ep?=
 =?us-ascii?Q?V6xyfsFvj+ctQ73b5wm2DQdKvCokKZglIkcNwtpag60P4+uZMZ4uAlao2x/h?=
 =?us-ascii?Q?oe2NLID+YlD2IN3m/4DGjcvjyqnZxz0AFS83/kpUg6IvI6YDt0RuhDFUNMBE?=
 =?us-ascii?Q?O5dZ+u2yh4uX8a9DKS2qqs5QRYt3bbhjUiREWqQdc/Fnx8BjkzDAT31PF4Sz?=
 =?us-ascii?Q?0B/VIxrUk0DwIHUs6aHSXW9K95Ax4l9mzgkKL7AE+jBW6XYawWtU1BQpzkoF?=
 =?us-ascii?Q?Fxw54LI7h23kCFlTCrYk+kRQU4DdKW+EXZJBN+0N4byJpq/pP0PkBufJeMZr?=
 =?us-ascii?Q?1fPRH38KKq0y28Nv61xa8zQgeehHcIv3mDfntz0wzSx2B4HRLEokVToF4Vls?=
 =?us-ascii?Q?R6twVqyAUxkPYqX+bIbSzOhpg7bhdbcFN2P291Kh4gm+eFbCgw0pvzNy1pmv?=
 =?us-ascii?Q?v9ifGhRMpbSKNFHkrn5Df84gGkEKUbqJ/N5YWKLguXCvXFaSWsn9nXgU8BTk?=
 =?us-ascii?Q?RInqDSJb1lxjoYlvF1LFk1gaYuP4wq8a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ekXmWnJBv3R1LTVnaDgb1ENzX7pDFm1Gq6xU3yYQQciVnldNeGsDPAtEaRjV?=
 =?us-ascii?Q?kW7YIgKxmWiNpiRYb901uNRRCuNPWZrpTG8dcrfdcEN4nscO3m3CFP5UWB/a?=
 =?us-ascii?Q?NRD4CciDnkE/j1Qy8GMsG6KFOuwEzDgDVX7AFgVvWEqZ5Or+UwlCVMMDrahT?=
 =?us-ascii?Q?xD1FGgZQFgKs7sL1JCOl06v/4aZaLlaC5HvZ48UA5Ja0DKL6/o9zy/V5RMfv?=
 =?us-ascii?Q?BV/SFuzC/GVHpvPuUq6Uf2O37Ihydp1J5RFnZ/vDpIDjpz5uNl2w7uZe5CuJ?=
 =?us-ascii?Q?2rqs6oPqNZUAdqlMPxYjF3G/c2Hut8g0MmUFgNE2iFTolLsbsAE9g+Svw/NU?=
 =?us-ascii?Q?RDjUJzrFK1FPDn1/rLLYAhoNdB6gWrOO/KZRX5a/FjT452fRxtISZ+90zqnc?=
 =?us-ascii?Q?XLaHgNk2Qo+cso3FWf/yjRrhSZhvlHAA4jVXlwGerPtDvhs65UU0B1UYhk7V?=
 =?us-ascii?Q?TH6CCEKafdViP9H7wraahdOOYaY3uquEAhOzp9+UaAN/wlqc5QAEVVQxWl6B?=
 =?us-ascii?Q?WR3d+9UWc/fwayEugd92bwKl4p+bW9JmQHNp7pSEFjaye9VD/BHd+dZk4Mbh?=
 =?us-ascii?Q?b7W3/ik57uCcdXCIHVFGTFTaIyPAaHZ2c+Ctqht7Abu+Um3nAZiYoX9BPVOw?=
 =?us-ascii?Q?3rabP10XBBowaF52R0lxRcktt26k4JJrSJg7xitvxoaZfuf+BuPt43psBK4J?=
 =?us-ascii?Q?J7Y7cl5CkDyu20kmKyds+NlrJ8tPFTj2PDn84U3oVOExXj3p1bLn/hOScIvH?=
 =?us-ascii?Q?T4a125YgbqFzZsxteBEz1ecqRwxeDIzJMvHOeDoV/rQTpq016z629BhrcI4G?=
 =?us-ascii?Q?yX0teh4CywH6nl0zXSBVBiH4M4I5uBJZP211EkbZEoKx3bCsyNnI7LDnpJTx?=
 =?us-ascii?Q?1El5AHTtIJp0KSjtsu4tiy+/v2F8m0st+156AS/G45Bp+2Zguja/ldQJ0ZH6?=
 =?us-ascii?Q?/4FA98yTQkGyEce9/1CX864CMjVhjhp7RXjmsS9U4zu5e7BrvwCAs64EncmJ?=
 =?us-ascii?Q?0abN9Ut9RYUrNPdrop12xe9uiL41UMYFSN5bY2JSQucGp7jFTCo9zON1Jx/q?=
 =?us-ascii?Q?9vT1af2GQz3k3YWi12GD1GUY9cbsGgmLVawvSVMawgKBkLgk0BVsYK2l4HRu?=
 =?us-ascii?Q?zrDSsOF+ERaD1LVuKbLyj2pbsJ9qLEvkAOlaUFGtFSQJm65ZxrV6xOMV9mLE?=
 =?us-ascii?Q?1c9VUN57pAlWR6qGLLnAiGGJ6ugoT4QLwy6zn4aS6jSDDwYt6Aac5PdzimPq?=
 =?us-ascii?Q?27isqy3WxP9QU1ybnwrrusauvdtrNrRlnwp9woiE7cYgo2gDCTBca836JbmO?=
 =?us-ascii?Q?6DkseoQP92fAgtpTOgHJmP0gPbm2rPo0QilA6LQumkycs8d5qbuHTZ3UgArT?=
 =?us-ascii?Q?dBdSVsG2TAshDBFvyZeOn6qTmhe821fwQsfvS3ubkkhaf6TWSVLPaxVXPjRY?=
 =?us-ascii?Q?TDnKcAuRKKKpzC2oI6lre4hVTY0sa8wl5YkKk6uO/gcAE/Wb4fMUDFW95Y1k?=
 =?us-ascii?Q?qL4MPzfxohCivDcgXAHqjxliMrMXJBfmeuU8r5VYkqTXADEKt5ie8HYCLjJh?=
 =?us-ascii?Q?zC9oHKDmm6NcQOaqV/VYqdcFWTlzI8Ii+/kv9Ge8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21ba09b-aa71-4ab0-675e-08de337f87d9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:53:16.8796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gISBsSS0ilrfZAKInqQU7RwNU9fyxsKAO6jyLeorYRqLHB1V6IfMjCSVQryEM60GVzLX6qbLWHtdfGf3tweKBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9596
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
 rust/kernel/gpu/buddy.rs        | 527 ++++++++++++++++++++++++++++++++
 rust/kernel/gpu/mod.rs          |   5 +
 rust/kernel/lib.rs              |   2 +
 6 files changed, 569 insertions(+)
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 6b973589a546..86a7e304b7ab 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/hrtimer_types.h>
 
 #include <linux/acpi.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -112,6 +113,16 @@ const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC = XA_FLAGS_ALLOC;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 = XA_FLAGS_ALLOC1;
 const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE = VM_MERGEABLE;
 
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
index 000000000000..3e1a9617e6aa
--- /dev/null
+++ b/rust/kernel/gpu/buddy.rs
@@ -0,0 +1,527 @@
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
+        let guard = self.0.lock();
+        // SAFETY: guard provides exclusive access to the allocator.
+        unsafe { (*guard.as_raw()).chunk_size }
+    }
+
+    /// Get the total managed size.
+    pub fn size(&self) -> u64 {
+        let guard = self.0.lock();
+        // SAFETY: guard provides exclusive access to the allocator.
+        unsafe { (*guard.as_raw()).size }
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
+/// An allocated block with access to the buddy allocator.
+///
+/// This wrapper holds references to the block and the allocation list,
+/// enabling the `size()` method which requires the allocator.
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
+        // Acquire guard to calculate block size since it is calculated from
+        // the chunk size, which requires access to the allocator. While the chunk size
+        // cannot change after initialization, we still need the guard to gain access
+        // to the allocator's pointer.
+        let guard = self.alloc.buddy.lock();
+        // SAFETY:
+        // - Guard provides exclusive access to the allocator.
+        // - `block.as_raw()` is a valid pointer per the type's invariants.
+        unsafe { bindings::gpu_buddy_block_size(guard.as_raw(), self.block.as_raw()) }
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
index b69cc5ed3b59..850cbbf4c3e7 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -95,6 +95,8 @@
 pub mod firmware;
 pub mod fmt;
 pub mod fs;
+#[cfg(CONFIG_GPU_BUDDY)]
+pub mod gpu;
 pub mod id_pool;
 pub mod init;
 pub mod io;
-- 
2.34.1

