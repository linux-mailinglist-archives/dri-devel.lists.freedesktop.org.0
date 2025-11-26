Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED201C88796
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 08:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AB010E528;
	Wed, 26 Nov 2025 07:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BMbV1+tG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010009.outbound.protection.outlook.com
 [52.101.193.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6F210E525;
 Wed, 26 Nov 2025 07:44:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypm7G48Cl4QsHoQN+SLlEYvpWgEc+VjPyUzk1t6rs53BUFiJRYgeqKN8jAsuG+zqkG2+m8jGIYHh/HlmnjLle8um1EKKwIqbaXsv7q+D1S7gUuOCmry8Fah17R4WdHWpf6X6kyZybuPsAvgj9//z5TD1DYBVQozrxebLKCJGx9ALeGVmdHQPfnetFH1+wGoYWQKj0LeO3YhGi8lRUorNr9vtUgeCjirZy4P7hahPA+7A93UeQA1EAhXFjGOlXvZcQ8DF3plgna2P0rM0DxIW3/Ehd4B4xCqRkMvzVkuh9ft4o4EiVYoofRkBLCvAyWLqZCzzxEg3r5/PvzukN1cVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXq6bhZ0Xid/rCnSLbRAL7kcagIT3OeYWWdNIk3An9Y=;
 b=koKDMQgsMZ/Zx7YZmF/S0KIt5+e8qZLfPKgkzgTJDnredeIucPnVt74W4dGzfX28C4Oxr9x1lSyZ/k5N6xVsEkiQelE2S+HPka8DFhecIN2V1UWE1OwAYwDFc6DPztHSKtfc0AIaPC6pui0WSm+Mp/rfB3fybFCw8eTbsSuihYqEVEGZDjCAg+/pZtoTV90O3yj5CfziqnMUfkJRUpKIw0CX8BCSoWXhQrARDapITNIP9OWCN+HkvSMMfrZ7b2S00IEdXp7qNo7W7h9eDtIdAEZnNwLtdz+43di+tywBOuA0tYqDTs/OKbFiF/26pMWE1+lyyy2oDAoR4REcACtPVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXq6bhZ0Xid/rCnSLbRAL7kcagIT3OeYWWdNIk3An9Y=;
 b=BMbV1+tGWVgXis9uVWlTwu0JCiqpVx0D1LgzFFR1mdCrToi7iFc6+ekHbIND9SIMDtV3l3SJx/OBOesG/RHEWNM3w40l9Si5UTUB1wbF/6Nu2liiTHunPmdN84WWgfvZMaITEbhnIzKhyXM5WwQpuXLIfQxvkE7YPbePgqIvkffNDoYRO+dl/MEk9WiVT0hAnszc4/laXMEvIr96l2vEB0uNiF/vFAOHj18TEB92d4w/LFvi5OcYl9+0Ov5JDdXdbDNFSICZOIB6S1n1xskNRACDCoublSYnl52TIQYGU/SHTBaPEKhJLOG23D3lQ5VDzwxjaobniyIPzX5iPsPQmA==
Received: from DS7PR06CA0003.namprd06.prod.outlook.com (2603:10b6:8:2a::27) by
 DS5PPF7B9F1F8E0.namprd12.prod.outlook.com (2603:10b6:f:fc00::656)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 07:44:35 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::ea) by DS7PR06CA0003.outlook.office365.com
 (2603:10b6:8:2a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 07:44:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 07:44:35 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 23:44:23 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 25 Nov 2025 23:44:23 -0800
Received: from inno-thin-client (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 25 Nov 2025 23:44:13 -0800
Date: Wed, 26 Nov 2025 09:44:12 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Dave Airlie <airlied@gmail.com>
CC: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, John Hubbard
 <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Helge
 Deller <deller@gmx.de>, "Danilo Krummrich" <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "=?UTF-8?B?QmrDtnJu?= Roy Baron"
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 "Alistair Popple" <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin
 Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
Message-ID: <20251126094412.23373c13.zhiw@nvidia.com>
In-Reply-To: <CAPM=9tx5neQ=TbmK+2eAO=O-XW_67VhOGO-791kqyVDJEpTA+w@mail.gmail.com>
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
 <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
 <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
 <24d4f02b-8ecd-4512-a1f0-ba41684ede1d@amd.com>
 <dfc50417-66ce-44ce-b607-917d678c5631@nvidia.com>
 <9f433dee-7ad9-4d0f-8ac1-e67deb409b70@amd.com>
 <CAPM=9tyN_A3oEyQZCOWaLO1orO6oKX0ZukJHR7cFy12Go+7d=A@mail.gmail.com>
 <cc0db376-6cff-45d7-b3a3-d13be664700f@amd.com>
 <CAPM=9tx5neQ=TbmK+2eAO=O-XW_67VhOGO-791kqyVDJEpTA+w@mail.gmail.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|DS5PPF7B9F1F8E0:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6c02fc-8e2f-41b2-4121-08de2cbfa528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXh5STFveDNFUHR5YktkaktwRU1RRndTV2ZSQmZCbW1mTk13V2xDMW5rV241?=
 =?utf-8?B?dzdnbEV6MXc3ekROQ2Uva2wwbEJnZ2xnemtPeFdHamdHOFQ0S3RzU2VvUncv?=
 =?utf-8?B?RmtZb0dybE11VWR0TFQxQkhIcmxWZytUT2FiZHV5Y3BieVVwME9reTM2YVI1?=
 =?utf-8?B?bTFLS3Ezd1FBYXNKOTU0enNieVkxS0p1VHZid29mZm9WaUs5MXlnRDNodDhF?=
 =?utf-8?B?RDR6Z0ljZmY5eUNuc2dvQUg5M0c1N2w3blJ0cXFjb1BhcGFDM0V0V1h0TjRE?=
 =?utf-8?B?SkNjT3VKbWhkeW9tL3hicm1jQysyUU1xQkFRRzhKckFtMUw4Q0hmU21hbkNw?=
 =?utf-8?B?cEV5aHBPWTJmS0RJdEpicnVBM054T3dnNFlpM2JEYytKM1F0aE1qczNpQUxC?=
 =?utf-8?B?eVlOdkkyM0J3Y2lmdVdtSUJRd1FjQmFFdzJtSDhqK0NYeklCYzhMR0pNQVJL?=
 =?utf-8?B?cUZ5VWVoVXBDZHNVSVRoVU5HTHhmVFhpQlF0dVJ6bU5yQkVVeDcxdVNxbEpy?=
 =?utf-8?B?ckJoaFdQMmJZV0hkWnBjbGE1VWduUk9KUXc0ZFY3LzVrcEtsa0hMOEVrZCtC?=
 =?utf-8?B?UDR3TXlTTjQyNW5ZNnV6VXNnT0VnWHpUemYrNWNwVGZVNHcwUzlGbkhGak11?=
 =?utf-8?B?bnM0TXpZdlA0cm1UMVB4Qjd1NWhQQW01MmlpRkNFdG9tUFNUQ0I5S0FjRkFE?=
 =?utf-8?B?SGtVQWViZlVBQlhQVUM3WisyM3Y2WVNzNHlqS05nbks4RU9Ya1RNMnFOU1RD?=
 =?utf-8?B?NGpnMFpoN1gybWVSUG0yMXZBVlcxdE9DSWZrZGJDWU5pck5sUlZnRDlZeWl5?=
 =?utf-8?B?QzFyY2hiUUhSc3BsdFYvdSsweW04eW1leWt5L2Nod0Y4c2luR293YlFLdWpx?=
 =?utf-8?B?MGF2dHNUU3dWQkxKM1BaT1UzZ1dvOXpBRUVPc3p5ZWlWZ3ZOK0dOalR2S1ZO?=
 =?utf-8?B?V21WMmJVanNiTkFaNW9EVmNUYks0QnBISTZkSjN5V1VVamVkOHA3WUR0Q3NZ?=
 =?utf-8?B?ODVrNUJyTzE3d0V1R1MzYVE1eFpZUWhJNFl6S0M1Ri9ubWZsZDVuZDNUaGFv?=
 =?utf-8?B?TmZCN2lUQjNVa0tBNjN6Zk8wNGJIWDA4K25yMjRZV2VuMDRWdC9QRk5SZ2U2?=
 =?utf-8?B?dENtRWNhSFNOUGQ0RzhHSE1wOG5udUVTbHA3YmZBNzBFMitOZEsvbW9JNnFw?=
 =?utf-8?B?VzNjM1VTSDBBajJsZW9lWUlyN1lMaDBzRTFaVlhYelQwdGRPY1p3VjZvS0U4?=
 =?utf-8?B?N2lUTk90bW51Wm9YeUFJaEtrak1ycmZWQ01XNU9LVGo2amFWZll0bDJMODhp?=
 =?utf-8?B?bEorYmNxcFczRjhVd1REd204eXA0eWd4VFZzcHc5bm4xMVpOUUUzQlZPYTVk?=
 =?utf-8?B?MmNKR0xKSDNScXVHWXVFdTZsbzhHRFZOVDE3QjFBdFpHeVpRODNJZUFXM0g2?=
 =?utf-8?B?R0FReU9MQndUNGF0TllUWFFtMmdiazJwWCtTNHcvNWN5cm5SZDlGWkRwRHE0?=
 =?utf-8?B?eGZmU3VISWJBc1YyNmtGd2dJYW5TUXdld3JsR1JkSEk4d3BkUWU1Y0lFRHlE?=
 =?utf-8?B?QWpxU0dzeUtpWmlGcmd3WW9lbGtaTE1aL3lPU0Ivdmp6WGJ1MllIYlhxWmlm?=
 =?utf-8?B?MExNQS9SdHNyQ0FYVXVFblZ1YWpzOXZaM3hVRDMrbWJxRDB6eUt3cS9kTmI4?=
 =?utf-8?B?cjd6MldheFIxMW92VllRbGxZVUtQS2x1ZDAyN0FMcm1tNk9TUWdwTk4rT1dy?=
 =?utf-8?B?cXBnbEpsSk1HY1psN3I0VEtmbzl2NGRlUmdUSHdPZEJYUHRYUFZrNzFpeFFH?=
 =?utf-8?B?eWswVE04V2dZTTUvOHFKNjdhcXN6dmFweWRROUtYVEZNNFI1ZHpQNThxL3cr?=
 =?utf-8?B?TkNJNVhKbXVYY1BIYlV2cThTenBmTjU4SURnYjZKbHdQTFViakRPNlJ5NW9B?=
 =?utf-8?B?MmZUUlpYT2U1MHl1cXVxaktxbDFLMlN4OUZIanRHU0pkS0s5ejVmNFNqZTUv?=
 =?utf-8?B?OE4veEc5NzlYcUZ3QWxOQWJiVnBUSGYvU0tqV1VrUVNEd2pCQXRQa1ZMTmNX?=
 =?utf-8?B?b1Vvb0FWRzVQTS85anMxNVNWY1FJdlUzWmcvenBzTlZadEJ6Tk9pTTJyZnBq?=
 =?utf-8?Q?19Jk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 07:44:35.3778 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6c02fc-8e2f-41b2-4121-08de2cbfa528
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7B9F1F8E0
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

On Wed, 26 Nov 2025 06:17:25 +1000
Dave Airlie <airlied@gmail.com> wrote:

> On Tue, 25 Nov 2025 at 19:15, Christian K=C3=B6nig <christian.koenig@amd.=
com>
> wrote:
> >
> > On 11/25/25 10:08, Dave Airlie wrote:

snip

> So far I haven't heard anything about needing dma-buf interactions at
> that level, and maybe Zhi has more insight into the future there.
>=20

For VFIO parts, the vendor VFIO driver relies on the core driver's support
to export the VM's framebuffer to the userspace either as type a)
VFIO_GFX_PLANE_TYPE_REGION, framebuffer as a region or b)
VFIO_GFX_PLANE_TYPE_DMABUF, framebuffer as a dmabuf, which is usually
backed by a GEM object.

NVIDIA vGPU uses VFIO_GFX_PLANE_TYPE_REGION, so dma-buf interactions
are not required.

> Dave.

