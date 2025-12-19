Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF027CD1C5B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 21:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FA610F0B4;
	Fri, 19 Dec 2025 20:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KSpBVpsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010044.outbound.protection.outlook.com
 [52.101.193.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BB610F0B9;
 Fri, 19 Dec 2025 20:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrBBbw2V14POtHlXrXvgx7VXrQejnK7yQXqs/7V5/GdmLz1ipJADMi5RtXgpcoE4DyPr2qM+51Yihaf8/Ui6h8xZ8LACtflDEZnKkL3Q6RM6BEhNu4MzG6mANZ+m27x5To1I2SeBBwm0ZqaMjFNOxQD9eDwjJAYU+Y4QZwaTzkThgwGB1FYKE7QS7wN7L6PMM4VC+yS34/9P+/Cu1asSm9g8J49sABz5iF1M1B8fRncJKBAlzgK5MwTEYRAufkLLa5ouYcNnJpp1V0dYAvrSKnYaugWkinln1EJtD7Pg+dljGWtLV64bogEKkS0xWHbqb9ubgn2q62uZ3MIrXYDj/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYkY4Jitome6fMArzQZjUSNPOBnCjXoEwDWPuV3E6dY=;
 b=xy35qCH7GYxbTvYq80xdS4DCcop7TveOCxBWhc5QVP5PG3AtjbS0x5IDJ9/Hf6XyIpP1CKtMn052bvvenfxuIY3gVT1t/fU3J20cJjfJqKjSi4PigKOmO6ZScGaprrOl2LVI5toFIBGyKEUHacP/E3ZcGvTMz85Je0eLdNunL/NMhmtnX5oGFy2kzXbBiabNRSoUjBpR5ptBUNkC+tg8tcQtcwgbpTwQfmw4GmZRGpgY6xZJf1qR0rB+zXe1ilkhvyVnk0/jlAqIHQW3DYIunT0d/gMNTbtpbVKodsPvDN8y8DCvDz6ezjYBZleycBtFMnrIRFCHi+CJpIW/B6tO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYkY4Jitome6fMArzQZjUSNPOBnCjXoEwDWPuV3E6dY=;
 b=KSpBVpsYJpgcSeHMfwQRpBhNWKYRykCa9L2CGPOci98cqBiwcVeoloDG6i4nszDcwpbz+rn6SJ8NPBsGJFtQHOyd2OWN3+JOTpMeg61HbN7gCv6iXLd7CWQO15Qsdg6glfwjJfV9WUENhBBTsAGJmXSA4xVDzspMabOlV4lWTZkUhNkkTSm0e0roxUeIMXZ36f/69+prMRHHpRL077+cLFAF7f0fpSetA9OFDWfrhSQqNuLK6QbXA9IHRSFZQijfLcPyH8ShIgNqi51p58rmbi/pr9MKxhm0ldGoysDCn8O/z8Sm7uQO1NYtCZWYJfvLZFUN5UACs4Ui8PNoQVlvBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 20:38:18 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 20:38:18 +0000
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
Subject: [PATCH RFC v5 4/6] nova-core: mm: Add support to use PRAMIN windows
 to write to VRAM
Date: Fri, 19 Dec 2025 15:38:03 -0500
Message-Id: <20251219203805.1246586-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219203805.1246586-1-joelagnelf@nvidia.com>
References: <20251219203805.1246586-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:208:335::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: a7383991-7d55-4664-c1c2-08de3f3e8a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bju/Dy62ylSCf0MzUot7fNLT7dOhksNQ4hU5OIRmVjItOhK86rOtM6DWKIjN?=
 =?us-ascii?Q?uo49ttXLt1jOBI1xch/6kBfmT35PZIMutxA/NctoYnRlYN46VFE3EyruInFF?=
 =?us-ascii?Q?j1kuASLh5kctVUZ9qPILYdUIIVVLBCgystIhvHqQMqsMm+lGYLrGW4aNaQDB?=
 =?us-ascii?Q?UbOv8N2n50JwhTFyNpsVY7CE4Xhf8inwoesNTV/430qYeSQ+J9DlyNFobSCA?=
 =?us-ascii?Q?xz1x557IwdF/4PFJcS/5PjCNaTNgdxTK5+focMkU9Xd5oDgJstcO+wWlZslb?=
 =?us-ascii?Q?wYwSBJ2h36VsHUXZXODdsKrL9XHNnxQXZ+MxRxhJAa0+v2ilR4XmPSCE2kvo?=
 =?us-ascii?Q?z8Nq4QL+q0qDR/zFmof+mZU5kz0AwMnIP7qi3+FHg5xQJgcXwGtrzRnoSoHS?=
 =?us-ascii?Q?EYnJqqIOc5Zocv1XvyLJWUT88uuFcnqEgoIoy8gBFy05W7s+MUTdxYpn4lud?=
 =?us-ascii?Q?hVfZ8W5mUvkYV1cQGSei6Jabh/Tj0xppIggkw8uqjERSLvdehHff0DDGh1UL?=
 =?us-ascii?Q?gkqCsiHN3zmWP92IRxwwl2VogZzy+23fpb/8a/9hYnf+i88xskQcyW7ZafKm?=
 =?us-ascii?Q?tW4iloBIUSkGbCOxI3HaHMG6XNG+hZjXM4Ahpic2yOis6X72ur7S6eXN9EHU?=
 =?us-ascii?Q?BpPSWX1hiakyYdrCEkNUO6u4J2RwjlIFDtUXmOD5Cd9Av2G0Qgjh4nYBzxFk?=
 =?us-ascii?Q?HK2Re/oofVnWVOFnBPbDSzWrXF/KiJmSIB6ec1q+dWn4wYyZNI3d0Ef4bu6I?=
 =?us-ascii?Q?oFNX+EYy1ofl7hdCtWFU8wYUNDma1+2/Ds8e+JuQM4OF8lN6sERXY6kFTBsd?=
 =?us-ascii?Q?ZzCWSRtAMkzUZ6MnUgS8ndqJHvsd5m/Dk/XCGxQUnw3RKB24Z9KuwTaFyiwK?=
 =?us-ascii?Q?TFyVB8yCBDE/SICW9TB2rbk3zwNM66X5l6Msc+yRXwcuAAjXUK9PmwV5GEYj?=
 =?us-ascii?Q?sM3uoL0k7QTjy7hIp2apdeSpznZ6BQwufR4BRnBrjty9BoCpS+7dPyBSUy64?=
 =?us-ascii?Q?or4qwPw/Txqq3FPrDsF8xYFcCDOwjIUBEqkNIomXQazlmlZGPeL4fo/FaKex?=
 =?us-ascii?Q?iLRcWqCJl+GusRN6g11ZNxZE9Y5+71ggJeSEGpc6CgagVAi16rUK8lRwNvrD?=
 =?us-ascii?Q?ZG5tFXTNqh/zfjO/9GbpWebFAvXTp4kKie5V+NpQfesw0QyWVj9TzQpoffGn?=
 =?us-ascii?Q?71f8kSoToOzo6OIhv/tBk0w9AG++sx45oLdXMLoQVeH1A4SDEWZLBakwx4Xy?=
 =?us-ascii?Q?pv434zOTEe74AVnJCNofSx/hYMe838XY7sTZB/d0xNojVCWu2JosR/sf8GHb?=
 =?us-ascii?Q?ShvF7lYyJNKKgEVl/DLlhfhgdKlDqxWX55lMehPj1Zum18Tae6otuEQmgWwT?=
 =?us-ascii?Q?h2RR6OWbmbalKWTUqCIlceWM6BxBK4mxxdZh6QBfCZpZ/+9wpcsvdyhPVzRL?=
 =?us-ascii?Q?HnuJZw4HVqUE8HkHN1AGgXrxGvnTZIbFBjWCmWr9PHYH6j0d1iGDMcfSpLAk?=
 =?us-ascii?Q?9Mg/S+/Yck5j468=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EHYV5xV+d7oOt0o3G6SUtE9LgYy3ljlwJqBeulGA8alGdqAqqvWU0wFngcDo?=
 =?us-ascii?Q?wtPpGdF5TFuT9OVwVHS3GJpOQNqJ2QtQ0gLd0ZkULI0+NowPY//jPdxdXg+Q?=
 =?us-ascii?Q?b9RibtMAD6fUfoxPA5A1qpvydl88lERlrfzXmdwnqv8UxXyTYbiXK2AVjSGT?=
 =?us-ascii?Q?eRsdgP5yJdFibTP3CnCmgxsKWxCmD1Vs3DpsfEP+GCNJvtUcwX2lPcta4/Bn?=
 =?us-ascii?Q?47Ggx1HNBNQKZeHdNbcPIUaTCqzC5+FCya2UViNNvHWYzX/5RN32cvpF+ni2?=
 =?us-ascii?Q?1wZn0ATftopiIxw5SBRds7zuJVww5GM+iR47gevP5ZYYPs8v4GfKNWh8gWar?=
 =?us-ascii?Q?8ImrMaziSbcnnXGdB7gQkG9TEFq+U7MFSNi2wtqf+Qa7zfC0biOpYokgT8OZ?=
 =?us-ascii?Q?za1WINTzYlrkRcFqNXUeWNEphZgvxnY56cgp9U0RKXaoqiI+eVDZ4LNiFEPN?=
 =?us-ascii?Q?okh01Xk5YTPWRbYKJssRMK1z4BHLyb2Y1+g1uNOLREdZG5bIjAN8ypBYpPFd?=
 =?us-ascii?Q?tvYaF7yi6UiLkFPimW9sS9S5cQI2e1agQJk24yNvzjQa5xyKAUNcPMlQ3ycn?=
 =?us-ascii?Q?etYsn4dBvIbwIiEFVKjvrajecbTVAsmvgFZFMGRsH0yPFgjXknkAov6TyuaO?=
 =?us-ascii?Q?aIeB18JB0BmS3WaWiRSwi1x2yujF0eDdT1LnD0V+H46giEUxt5pOAFOnT3CB?=
 =?us-ascii?Q?XBrG4tZKncwg6cW33rPGDpdFCRtbHfzNTHzVz7dWZE6AyXqHGuuwKjM2qbcl?=
 =?us-ascii?Q?b+BKa/186y/jaAFDm2g6pkfEPYTLWVRC5uhfdnh63fzmHFAUpm7oFkTwOBDP?=
 =?us-ascii?Q?q5YoV5xaaHTyVfqvukWPPplij2d/CdpoLKoM0cTIzBTf48ZQj1QuAobt6GeP?=
 =?us-ascii?Q?8SBxRICoR5um/SZ902bbOwvMgQURizdpCgStLtvNuZYwdo4QphTo+nUtFOPV?=
 =?us-ascii?Q?kVL/J/FHZg77p14EFS1qur8fQxYaHTi7QZTEllK8dYO8hR5Slf3gLNAjn1JA?=
 =?us-ascii?Q?yaBbyhbN0Doj0yrI1zspKqJrHPiOt97gaYJuOwlecyUtQD8Q1cMKnPm3ggia?=
 =?us-ascii?Q?CkUJF/XwOeWzJ4d329thyDXiIfII/+80eZX+sxuaQBNW09EquQPxViWSY2pM?=
 =?us-ascii?Q?+kNWq/xOqXTNw5CMblRheIui5WCf65YUGv31lXwQqVzoYK0SgDHdAHBoMdVK?=
 =?us-ascii?Q?TpS/+H3//Xr7NIOaQniK3HmbwA/bkfOwDWu6DJJyoEHZMrS0jyCx03Edg47I?=
 =?us-ascii?Q?i85d+8lvlh4C3l28uW5fAIoRuc8BEH95DoWOse2+VPIpc+cPderyBi9EpeQk?=
 =?us-ascii?Q?i+vfzE4uHGH3EI1UysoVp+2838bfDMPR6Kr+thWLi5fOORmsMmnIo7BumBuX?=
 =?us-ascii?Q?ThLMjWEUNsIK4KgnNqZirtyv6c88Z3Vsp1LRrZJoIpipnJI/BZbZ4Z++BZ3J?=
 =?us-ascii?Q?RC53wXKPsVZses3b2xOvLMKK8c7AcuahFbRaxrGZlab4moYQibWC6sC4XcGb?=
 =?us-ascii?Q?x89ciI+M1VUFeSjYYt/wILo7OUvSmknXUiVxD0c+F6n0p+EcxBdxetYWsmni?=
 =?us-ascii?Q?rfVkaPSVujZAjRfaWcQv9Wm/eQCzsauIUF6Q5et+RQs+zTeM9txZfbylDXd1?=
 =?us-ascii?Q?G3rkbiHC6Pe/TUfTBT8yejY3xH8LIA76OUZFLIZd8FwYhZ93+zybKrt8napI?=
 =?us-ascii?Q?yyUUetUVHZYPEUxLyPVKjcP4aw82FWwq4dICAEA1y1+2l56nWTkrfWpgrZXg?=
 =?us-ascii?Q?/JM+BC9qGA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7383991-7d55-4664-c1c2-08de3f3e8a9a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:38:18.1420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjNPgylueXnhfYAe7ddL1Kxnwgz5+Nb4NIfZiTi5cjikeyLQhICVOTCkkWDq0ZlqPKhxcskkqdl9tK6SdHNowA==
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

PRAMIN apertures are a crucial mechanism to direct read/write to VRAM.
Add support for the same.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs    |   5 +
 drivers/gpu/nova-core/mm/pramin.rs | 200 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |   5 +
 4 files changed, 211 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/mod.rs
 create mode 100644 drivers/gpu/nova-core/mm/pramin.rs

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
new file mode 100644
index 000000000000..7a5dd4220c67
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory management subsystems for nova-core.
+
+pub(crate) mod pramin;
diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
new file mode 100644
index 000000000000..5878a3f80b9c
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pramin.rs
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#![expect(unused)]
+
+//! Direct VRAM access through the PRAMIN aperture.
+//!
+//! PRAMIN provides a 1MB sliding window into VRAM through BAR0, allowing the CPU to access
+//! video memory directly. The [`Window`] type automatically repositions the window when
+//! accessing different VRAM regions and restores the original position on drop. This allows
+//! to reuse the same window for multiple accesses in the same window.
+//!
+//! The PRAMIN aperture is a 1MB region at BAR0 + 0x700000 for all GPUs. The window base is
+//! controlled by the `NV_PBUS_BAR0_WINDOW` register and must be 64KB aligned.
+//!
+//! # Examples
+//!
+//! ## Basic read/write
+//!
+//! ```no_run
+//! use crate::driver::Bar0;
+//! use crate::mm::pramin;
+//!
+//! fn example(bar: &Bar0) -> Result<()> {
+//!     let mut pram_win = pramin::Window::new(bar);
+//!
+//!     // Write and read back.
+//!     pram_win.try_write32(0x100, 0xDEADBEEF)?;
+//!     let val = pram_win.try_read32(0x100)?;
+//!     assert_eq!(val, 0xDEADBEEF);
+//!
+//!     Ok(())
+//!     // Original window position restored on drop.
+//! }
+//! ```
+//!
+//! ## Auto-repositioning across VRAM regions
+//!
+//! ```no_run
+//! use crate::driver::Bar0;
+//! use crate::mm::pramin;
+//!
+//! fn example(bar: &Bar0) -> Result<()> {
+//!     let mut pram_win = pramin::Window::new(bar);
+//!
+//!     // Access first 1MB region.
+//!     pram_win.try_write32(0x100, 0x11111111)?;
+//!
+//!     // Access at 2MB - window auto-repositions.
+//!     pram_win.try_write32(0x200000, 0x22222222)?;
+//!
+//!     // Back to first region - window repositions again.
+//!     let val = pram_win.try_read32(0x100)?;
+//!     assert_eq!(val, 0x11111111);
+//!
+//!     Ok(())
+//! }
+//! ```
+
+use crate::{
+    driver::Bar0,
+    regs, //
+};
+
+use kernel::bits::genmask_u64;
+use kernel::prelude::*;
+use kernel::ptr::{Alignable, Alignment};
+use kernel::sizes::{SZ_1M, SZ_64K};
+
+/// PRAMIN aperture base offset in BAR0.
+const PRAMIN_BASE: usize = 0x700000;
+
+/// PRAMIN aperture size (1MB).
+const PRAMIN_SIZE: usize = SZ_1M;
+
+/// 64KB alignment for window base.
+const WINDOW_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+
+/// Maximum addressable VRAM offset (40-bit address space).
+///
+/// The `NV_PBUS_BAR0_WINDOW` register has a 24-bit `window_base` field (bits 23:0) that stores
+/// bits [39:16] of the target VRAM address. This limits the addressable space to 2^40 bytes.
+const MAX_VRAM_OFFSET: usize = genmask_u64(0..=39) as usize;
+
+/// Generate a PRAMIN read accessor.
+macro_rules! define_pramin_read {
+    ($name:ident, $ty:ty) => {
+        #[doc = concat!("Read a `", stringify!($ty), "` from VRAM at the given offset.")]
+        pub(crate) fn $name(&mut self, vram_offset: usize) -> Result<$ty> {
+            let bar_offset = self.ensure_window(vram_offset, ::core::mem::size_of::<$ty>())?;
+            self.bar.$name(bar_offset)
+        }
+    };
+}
+
+/// Generate a PRAMIN write accessor.
+macro_rules! define_pramin_write {
+    ($name:ident, $ty:ty) => {
+        #[doc = concat!("Write a `", stringify!($ty), "` to VRAM at the given offset.")]
+        pub(crate) fn $name(&mut self, vram_offset: usize, value: $ty) -> Result {
+            let bar_offset = self.ensure_window(vram_offset, ::core::mem::size_of::<$ty>())?;
+            self.bar.$name(value, bar_offset)
+        }
+    };
+}
+
+/// PRAMIN window for direct VRAM access.
+///
+/// The window auto-repositions when accessing VRAM offsets outside the current 1MB range.
+/// Original window position is saved on creation and restored on drop.
+pub(crate) struct Window<'a> {
+    bar: &'a Bar0,
+    saved_base: usize,
+    current_base: usize,
+}
+
+impl<'a> Window<'a> {
+    /// Create a new PRAMIN window accessor.
+    ///
+    /// Saves the current window position for restoration on drop.
+    pub(crate) fn new(bar: &'a Bar0) -> Self {
+        let saved_base = Self::read_window_base(bar);
+
+        Self {
+            bar,
+            saved_base,
+            current_base: saved_base,
+        }
+    }
+
+    /// Read the current window base from the BAR0_WINDOW register.
+    fn read_window_base(bar: &Bar0) -> usize {
+        let reg = regs::NV_PBUS_BAR0_WINDOW::read(bar);
+        // CAST: u32 to usize is lossless.
+        (reg.window_base() as usize) << 16
+    }
+
+    /// Write a new window base to the BAR0_WINDOW register.
+    fn write_window_base(bar: &Bar0, base: usize) {
+        // CAST:
+        // - We have guaranteed that the base is within the addressable range (40-bits).
+        // - After >> 16, a 40-bit aligned base becomes 24 bits, which fits in u32.
+        regs::NV_PBUS_BAR0_WINDOW::default()
+            .set_window_base((base >> 16) as u32)
+            .write(bar);
+    }
+
+    /// Ensure the window covers the given VRAM offset returning the BAR0 offset to use.
+    fn ensure_window(&mut self, vram_offset: usize, access_size: usize) -> Result<usize> {
+        // Validate VRAM offset is within addressable range (40-bit address space).
+        let end_offset = vram_offset.checked_add(access_size).ok_or(EINVAL)?;
+        if end_offset > MAX_VRAM_OFFSET + 1 {
+            return Err(EINVAL);
+        }
+
+        // Calculate which 64KB-aligned base we need.
+        let needed_base = vram_offset.align_down(WINDOW_ALIGN);
+
+        // Calculate offset within the window.
+        let offset_in_window = vram_offset - needed_base;
+
+        // Check if access fits in 1MB window from this base.
+        if offset_in_window + access_size > PRAMIN_SIZE {
+            return Err(EINVAL);
+        }
+
+        // Reposition window if needed.
+        if self.current_base != needed_base {
+            Self::write_window_base(self.bar, needed_base);
+            self.current_base = needed_base;
+        }
+
+        // Return BAR0 offset to access.
+        Ok(PRAMIN_BASE + offset_in_window)
+    }
+
+    define_pramin_read!(try_read8, u8);
+    define_pramin_read!(try_read16, u16);
+    define_pramin_read!(try_read32, u32);
+    define_pramin_read!(try_read64, u64);
+
+    define_pramin_write!(try_write8, u8);
+    define_pramin_write!(try_write16, u16);
+    define_pramin_write!(try_write32, u32);
+    define_pramin_write!(try_write64, u64);
+}
+
+impl Drop for Window<'_> {
+    fn drop(&mut self) {
+        // Restore the original window base if it changed.
+        if self.current_base != self.saved_base {
+            Self::write_window_base(self.bar, self.saved_base);
+        }
+    }
+}
+
+// SAFETY: `Window` requires `&mut self` for all accessors.
+unsafe impl Send for Window<'_> {}
+
+// SAFETY: `Window` requires `&mut self` for all accessors.
+unsafe impl Sync for Window<'_> {}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b98a1c03f13d..3104fea04128 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,6 +13,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod mm;
 mod num;
 mod regs;
 mod sbuffer;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..c8b8fbdcf608 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -96,6 +96,11 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
     31:16   frts_err_code as u16;
 });
 
+register!(NV_PBUS_BAR0_WINDOW @ 0x00001700, "BAR0 window control for PRAMIN access" {
+    25:24   target as u8, "Target memory (0=VRAM, 1=SYS_MEM_COH, 2=SYS_MEM_NONCOH)";
+    23:0    window_base as u32, "Window base address (bits 39:16 of FB addr)";
+});
+
 // PFB
 
 // The following two registers together hold the physical system memory address that is used by the
-- 
2.34.1

