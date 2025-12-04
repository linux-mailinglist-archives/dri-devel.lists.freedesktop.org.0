Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB03CA58CB
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 22:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A074610E9C8;
	Thu,  4 Dec 2025 21:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PAnhEyZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010032.outbound.protection.outlook.com [52.101.56.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E6910E042;
 Thu,  4 Dec 2025 21:53:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdILrwDTKAg3+H1bVVu5vVYUKw5mRcVVVikpPT5TXJ4+KY59ko+mylrYfBMfIyjpX722MyZVKrZ6sjI34x+WFgbXMbKxdflSOxGzBb40EHm8cHYYUt+NTaQKtT2PU6+B/A6stnuZedVLUQIH3R3reHohZFL2DhpXiXTHBpdLLRc1BCk0TBXHMeDIBQC3W0ovMsVsoSQZ/l6iNHyhI6YZJcHiMKJfhyNcrgf7/wcNHJwY8oehCVndo0ihzxs1WmJmqcJ+5MuizDeIWDP4m25jK13ZFjpIUf7YaaI4QT/0u/HSH6XCSf1tYrLszHqvcS2vDRcuXJFrqSGuu/8V2p6qQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taN9FTrDOhQGC33daCrYNVcKpBp7+pn+C/EfVDIWfic=;
 b=YejJzUMhDwcD2iy/wpLYDcKBqDHyorwxXcqJPDc5tKvUXRdZOEjm1PXoBUjaaJ4bNwVrcRl6g3Su8M5Dk/Z+sGcq1i/ANlaoTktmo2kgPFTYeBaHMesk/by9AThY/mvnkTwl9C1K9eFVjwedAfafAb6th+f67atLvZErBNb1xVyC9kXbbhnbdo1L8ImXO1rQIK1wIiVXBB0McImbGfZmhZ+D6CMXAoNtEk369m5V6w1DcQFkZ5P+fPmjx4le1CS93RBHxoXJvOoJawelBixEgaxk8YUVULHLug5LSdyGSAEpaKED7SPMtzfMFsFEcu5qW74wowr4BcxgbHxMMRZ0Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taN9FTrDOhQGC33daCrYNVcKpBp7+pn+C/EfVDIWfic=;
 b=PAnhEyZyXOViEeUyeImn/TTTMtnoJ5VLvLWLsLB1xliNA4uCfw51YJaz8YwtzlaWkZSzjCj/ZaH1W2kDLsu1Xz2JrSVAvRVJzU1/h4GfQWJw0JQNBy/2G0Ejl7DKXFdm7oqCQOfaFbTPmfASh6nIxxTvdiSO3CVl9ChXszUtJlyrP9YkdGpIj2v3sa5JFku6a4XPaX1b7UJE49FNMenhHmF15T2dq0kCtRHLLDkHJ50+2lQDX1cplACWjhMXyF9Z9BJiaV/uDN9FZqIK1s9d4HXrY7+yrgl8fj4nMRwAoCGyTLcAXvMRQc70lgLgafX6ykwQFUQYq1KG99HW0ep8KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN3PR12MB9596.namprd12.prod.outlook.com (2603:10b6:408:2cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 21:53:05 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:53:05 +0000
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
Subject: [PATCH v4 0/3] Introduce support for C linked list interfacing and
 GPU Buddy bindings
Date: Thu,  4 Dec 2025 16:51:26 -0500
Message-Id: <20251204215129.2357292-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0268.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN3PR12MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec291d5-a988-4b4e-f919-08de337f80dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f4ky3M5WmPwlFuwIJD6wDpTpnqOyoJj7mhqy1g3yrl+qfRYuofbis8MoNsVs?=
 =?us-ascii?Q?poBtK2WaHefPYNpF3YT6DLOFnaG5vHT662TiyUZlhGnlE+xrA+S+DLzuqSxE?=
 =?us-ascii?Q?zrNOqaxz50/j9i8Rl++mxE44crADsdjqgCKxxHvnm+/1G7K3tZoiREtTB9lN?=
 =?us-ascii?Q?ChC1l4WsBH9ygL6YXY1gUPa8ykqQ/Jyq4p+7j4cUs4atGlJG4jcdZI9ItukS?=
 =?us-ascii?Q?jDTeUAbvjRUEM3gI2G+hO+DaqNq73VKFaMiBNY0KfNcYu/TPu+u7VL9VMR2K?=
 =?us-ascii?Q?lO+uSeOD7OZdW2C7UGI8KHorXXu4fLfXTeeAn8gdDfcFW39Ua512O98XdsnF?=
 =?us-ascii?Q?/2qKBaRudVeZIZy7lkXcdD/+CiVWWiVNr+h51ngvlMr1VuHUGrPmhLI9cof2?=
 =?us-ascii?Q?+a8qSjEbX4uaGoA263D6NfG9BHFPLnFKTQkgONpVRNqKan+J3reImAzlOWUN?=
 =?us-ascii?Q?OE1AYPlJwWJGIimfF2+UuJ86xEtBXi2Ylr47OlLfyerGlJX6uzZ/HY7Fyy9d?=
 =?us-ascii?Q?DgwWu5uK+JRIePwy8L58DskekA1D5sxNra5+lnyUFlx1A6OFKWDowIgYtlzE?=
 =?us-ascii?Q?q6nSe+++TUrosJafb6AfyRmnq5RO9jkMpCCHdA9o6CYCPpntly27+uR+sr4b?=
 =?us-ascii?Q?xCLZ6N88/TcLbhasfSxXsDLlWK5IBKnCIYM08VkFcCs1vitgVOprWL/wGi+G?=
 =?us-ascii?Q?G+EkEIOguJSXlXYp75XHh870CvKDXl7uxQuYHfqDgtqcNsxv1DPuurRbMBvh?=
 =?us-ascii?Q?y2U+sCMelW1TJoR7Dfpkwp8GtlsFh9E39k321sZ/ydia+bXnvW9RxpDcZkbc?=
 =?us-ascii?Q?u5cb5A14pW5aIXXChG13IRmfmhDM2tIoVC9NKNQKdWw8VETJ3Veef1P6lK+S?=
 =?us-ascii?Q?nNINxg5gvUT/ihTD3HN/vjalxYgoihssFJ0uldapW6ihfppwaclLYlYnAh+g?=
 =?us-ascii?Q?6ufFyb/LZ3AcZXOVUj/V9h/3S7giDPCbjzFq+YPIkeFKTAiF7ZdBOrWlEi+j?=
 =?us-ascii?Q?kGckXxV8OB5CxYKEgYf7XR2tsHmVRZKM9hxqaQoq4n+++xKVpuhngv1RaWrt?=
 =?us-ascii?Q?LTC1pqrrORG38/Oqjykt7aCZKOZmamgI9Sp9WGPfAMOmZafXkSX9EnCtn4Ol?=
 =?us-ascii?Q?PZX1criAJ2kgIvY2Wv0RQpWRNMrGv/RQRq7u0m0gYAMDsZDV/HHZp8CWpp3p?=
 =?us-ascii?Q?JqMEGiaX/U/FTXshzSuWRIv3lQoPZEabg44WWPuO3CFkrSlaHSLOLbXE4EpL?=
 =?us-ascii?Q?IuPu0aVE7I6U7B7HWnhnjhEoGjGMb9KJrXtbhgzAxm1c403PrNGKSU5fQDqB?=
 =?us-ascii?Q?EUiMwjuEyMP9OiN7KLhsnCG3IHuFfpFMuAhf1F4Ok+rpaoXiXoCiUzVM1oxC?=
 =?us-ascii?Q?ZaGLSZepQppadQ+O77fL2Y9zcgzZ+ZwF3dZHM9PDl8ItNr/qFmUo3h7DvujT?=
 =?us-ascii?Q?xhHK2W44feDnDX/ha+u/htwQxBYQBInEU4rOqYZ8NNCLnJhmUK+v/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OlYXg1v3VU14qYAlg40DgLd05c16tFCRVFSjTyvOmrEFrKR6KcwZY/QEehvr?=
 =?us-ascii?Q?dvx3L+GywgnN+qt+/yu96Q7oNZL84sdOXHZTQQme2NSodqwcZefAUQEfY3q0?=
 =?us-ascii?Q?AQEBpburLt4Zir7b2fRTA53eap24N4/o+JOi9kYMusXr9ZGx+NM0HCZuGfSd?=
 =?us-ascii?Q?10/gkJ/kkX3PpiEwhlT3mV+W1RiEgCw0Re6AtjSaqyUk1wKeEVDH4Ert1+uU?=
 =?us-ascii?Q?NtyJEFh0gqqvN6vME9ww902f+L3TbfGhxcRvph4he5HBfI20toOt/yvTeaSS?=
 =?us-ascii?Q?i1u0Pp4sNb6vEkRkxRWrJhY/qXgZgyoHuCZpk8e8kuZdSFikqcJEoi1sECjA?=
 =?us-ascii?Q?Edm5hZ18b/uvATBdX4/D2MMY5g/t0LmqCDInUulwU3oErxTA9vmaxNojnWJx?=
 =?us-ascii?Q?uUICTOm1LUo3paHn1U+WP4CmGiFCIXlAuybI5HBvw+YYJv91dTrbU6+2lT5+?=
 =?us-ascii?Q?qNPJc3kEEWRaBLrHQ/6uOoLE4FcLsy2ukSOBnQ5ATyRnn4mdEtYGSacjoavj?=
 =?us-ascii?Q?i5zzo9extsmgWLrxmVFDzcQF23Lydn+PCKikJuzSdwyAf6zRCgA1YZNOjXpU?=
 =?us-ascii?Q?hBOLvIkrPFieSBhNOHIM8rr2Lmtm/KhNARh+w1pqOopDiW8J+xcHg1bn6mBu?=
 =?us-ascii?Q?lV1pSXaNz8z4FfuUOhGYexuzECFrmhWpClr4yg0EKVkbBuR+wV1d6jvu7ltY?=
 =?us-ascii?Q?5CxSRkXHMUz16WY5SjEaW/H21yeYQCfj++Ri3COnEpmBny8bTzfqEgsnO5EK?=
 =?us-ascii?Q?S2t+OKaJHMc0+rRd+zRFTgG0x5tcPsJ9Lr8WX9GMTzlXyK9un5GtUj4MdUTO?=
 =?us-ascii?Q?5z/0HMWnPxDjd5yccMyRFMkQujD2nST3vH7nQC0eRKdOruDDIKSus1vlJlJM?=
 =?us-ascii?Q?1edS2SKjI+a1kAJ46837XX9K8C7z62h8xOnVJfDyYW4FuTV4YAM1wCN275ET?=
 =?us-ascii?Q?TW7FAh8lqxDnsmgh3yLi5dL3kZfKIsrc8YX9db9YdGC2CEwCaFZ14wkqyFx4?=
 =?us-ascii?Q?ssTevpdIHlCHF64MiBNROW7zTZMkpTPXvfwNrEFC0ZjDZyVVY0luGjm2cW04?=
 =?us-ascii?Q?/c3xX9SF/ML1wSy0V+fhNYIdeCpwbdf9lI912Dv/k7ApwZiSxxNJUaNs13kD?=
 =?us-ascii?Q?t3aTbz/5CuMTuTPA/DKszZ0geWIfqDk4jqqLJnEi3dEbR5oCEaRsgpP5A3gJ?=
 =?us-ascii?Q?yTuBFt6jW2/S9erT6qwyYZLdr9TpmU/9IOWhmgry5IjLyeYaDmdfh6/Q9wdY?=
 =?us-ascii?Q?xfalSiSae1ez/hnmdojfnL7PGbXyiXNwNBmcEUNnXBtMbn6YD2Is5AHjiFfZ?=
 =?us-ascii?Q?fRZO6nKWYtPawbcWgFRJ9bJFW5qh6qLqscNVTb3KVjckqfaJUmfAGgF+0PTe?=
 =?us-ascii?Q?p1qobk/jbNWBuOjukHzLS17PRfy+t0ez42hNHoaUAU4/EvBfaKVxSgVDjznl?=
 =?us-ascii?Q?D9JN+qVQaEacogzl+VH6ewvZxnMQODKwe7l7R3BKcROND3uAniLgjd3XzT+T?=
 =?us-ascii?Q?6XCXFP0lFu1Mg8vd6+vSJ76wchkWi0GXK65MdXqjWYggxb7voTwdXuueRolK?=
 =?us-ascii?Q?66Ii2mfLsEINzU4Xh8inCuJ3gVOjAkKA+f2AiQtP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec291d5-a988-4b4e-f919-08de337f80dd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:53:05.0645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xThhxNzD2avh4HL1QEogLpMsjcFkxXVoUbztxXCERYHQQHdSqaIYhCKCoVktELcf8TOuSx68WlAE9kYeOAPqhw==
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

This series combines a number of other series which build up to the same goal:
to make it possible to use DRM buddy from nova-core rust code. See links to the
different series below.

The git tree with all patches can be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: clist-buddy-v4-20251204)

Changes for v4:
- Combined the clist and drm buddy series:
  - A rust module (CList) to access circular linked lists from rust code.
  - DRM buddy allocator bindings that were originally part of RFC.
  - DRM buddy allocator one level up to drivers/gpu/ so it can be used by
     GPU drivers (example, nova-core) that have usecases other than DRM.
- Add Rust bindings for the GPU buddy allocator.

Notes from past cover letters about CList:

Introduction
============
This patchset introduces an interface to iterate over doubly circular linked
lists used in the kernel (allocated by C kernel code). The main usecase is
iterating over the list of blocks provided by the GPU buddy allocator.

The series also moves the DRM buddy allocator one level up and adds Rust
bindings for it, enabling GPU drivers like nova-core to use it.

A question may arise: Why not use rust list.rs for this?
=========================================================
Rust's list.rs is used to provide safe intrusive lists for Rust-allocated
items. In doing so, it takes ownership of the items in the list and the links
between list items. However, the usecase for GPU buddy allocator bindings, the
C side allocates the items in the list, and also links the list together. Due
to this, there is an ownership conflict making list.rs not the best abstraction
for this usecase. What we need is a view of the list, not ownership of it.
Further, the list links in a bindings usecase may come from C allocated
objects, not from the Rust side.

Link to v2 (clist only): https://lore.kernel.org/all/20251111171315.2196103-4-joelagnelf@nvidia.com/

Notes and patches about DRM buddy code movement and DRM buddy bindings:

Link to RFC: https://lore.kernel.org/all/20251030190613.1224287-1-joelagnelf@nvidia.com/
Link to DRM buddy move discussion: https://lore.kernel.org/all/20251124234432.1988476-1-joelagnelf@nvidia.com/

Joel Fernandes (3):
  rust: clist: Add support to interface with C linked lists
  gpu: Move DRM buddy allocator one level up
  rust: gpu: Add GPU buddy allocator bindings

 Documentation/gpu/drm-mm.rst                  |   10 +-
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
 rust/kernel/gpu/buddy.rs                      |  527 +++++++
 rust/kernel/gpu/mod.rs                        |    5 +
 rust/kernel/lib.rs                            |    3 +
 42 files changed, 2944 insertions(+), 1800 deletions(-)
 create mode 100644 drivers/gpu/Kconfig
 create mode 100644 drivers/gpu/buddy.c
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

