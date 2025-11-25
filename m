Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53197C84FD2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251BB10E3C9;
	Tue, 25 Nov 2025 12:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YqPAWWNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AF110E3C9;
 Tue, 25 Nov 2025 12:37:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+grb2HChM5qeLBQvVjkT9TuMzLekpyQdWbtuFWd2Mlsh8TmrZpgOQjumQG80kE/Kicd/1w7E3r9EncSSgbooizaAMoIdSla3JOzFBGMR3nM9bsfOYAqO5wT41JOhUpn08YpMRBu6G9jQblMHL+8LqFzkjvfZuU1j5qBdtVFwbczvLHy1kFBW7c2F42FgbkcgqiBfurP8F3mA4MYR70tl4HBzxAICmYROirX1geoh99egzcY2LfRlkXGCRvHjHbUG8hYtp8tkOIDwIi8EnqAjefnPq9/w9DZJXQFLt/HBWYdipg8PXj14BijcO68oYWfj7nW6Z6jG1i+r4P5rP4VdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xma9UvU8PoLFTBawQdwrJ+49n0jnmFMW1enKInh4CNo=;
 b=SFfdg/VBKqv0TckuDTZHziOx2ok7HYTwOLM8BbOMtmqMToBq9unsBD1zhbceA33AL3AOqCJjiVLS3SQkLQ3/CP4H8Pl2lUyOT2IV3G/lRS3WF3P9xZvyQnzgRUNVBZ76lhDIffoFbVyhoYayTbgknVe4wFgHOIPqFtSu4dFpA9ZBHzzywDSnp+GNW6QVfVgtrR+juQvgJXXWkwsS3WxYCqp0CPPz7AeEqFISzA99Jl0pJSaxUiEbxctcDUTdMBxNvL/7nS68L7SDDWpgz+94pJvszsdf33ZwAdpkd8rzGuN5O4IdNmLFun/aEkMFClmFd+7PXRn74UM6fwdaaaCSrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xma9UvU8PoLFTBawQdwrJ+49n0jnmFMW1enKInh4CNo=;
 b=YqPAWWNksdTylcxSj8im0y8NVzgBRD7dVh4A2EmTX3VtC/L+iIi2K6n5YhsZP+8tXfgSyHKp4lxMY/y8r6P0HPYU1Q6aizDz1DNNFaMR6vxcVe5p3iD/SU3t+GaZDhacBgUaH3TxRQjD8daCFyYq2uAyXBItciCQIrT+bYM7/b0hyfnHRZBEc0S3SUS+dl5YwfhSfiUG0h2pVk82K1V7zvJnfRCoCkxQJxRclFrUopJET/CfaHM8j6wCTf1eZ32BoFQKParzlv/9L9ITEq7euD/QgF1JQYqDRf7o8t8nDuN6F4sINDfpxIICZLHqi5PQGBzmdEc5V51VuHHB2wnS7Q==
Received: from BN9PR03CA0422.namprd03.prod.outlook.com (2603:10b6:408:113::7)
 by LV3PR12MB9329.namprd12.prod.outlook.com (2603:10b6:408:21c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Tue, 25 Nov
 2025 12:37:25 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:113:cafe::3f) by BN9PR03CA0422.outlook.office365.com
 (2603:10b6:408:113::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 12:36:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 12:37:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 04:37:14 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 04:37:14 -0800
Received: from inno-thin-client (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport;
 Tue, 25 Nov 2025 04:37:00 -0800
Date: Tue, 25 Nov 2025 14:36:59 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
CC: John Hubbard <jhubbard@nvidia.com>, Dave Airlie <airlied@gmail.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Simona
 Vetter" <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Alex Deucher
 <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Helge Deller
 <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 "Alistair Popple" <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin
 Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
Message-ID: <20251125143339.361cc3bb.zhiw@nvidia.com>
In-Reply-To: <9f433dee-7ad9-4d0f-8ac1-e67deb409b70@amd.com>
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
 <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
 <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
 <24d4f02b-8ecd-4512-a1f0-ba41684ede1d@amd.com>
 <dfc50417-66ce-44ce-b607-917d678c5631@nvidia.com>
 <9f433dee-7ad9-4d0f-8ac1-e67deb409b70@amd.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|LV3PR12MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: 578f5653-2621-4fa1-b357-08de2c1f6379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZExHbDVYajdCSFZ1aFIvSG9YaG5QWlN4V3dVWWVqaTlvL2lScHlBVTN2ZzEw?=
 =?utf-8?B?d1V2d1YwQW5uSk1wNTdVK0NaQTF6YlpxRFRQVVRwZUdLYmVPSENGdlkwUitU?=
 =?utf-8?B?WUU0cmpJZXYrYnVBRW5ObXM0TnNjQitsdXRRbU5GdUV1M29mQTgyQlNvZmg0?=
 =?utf-8?B?V28vdFN6N3FlY0RQSzB4Wnl6cFFoaXRwU21xSFdmMjE4a1lLKzhJVCtTaEdN?=
 =?utf-8?B?bVpDMzVYQkxuaDRKdFdHVXUvaFJ2aXIwMHdqNjV0aTBPUGpPMUQxQ3kvT044?=
 =?utf-8?B?QXN3Slp4LzlTQW4xWHZHTUo4Zk12ZnAxcmN1RnNTT2RCd2FVLyt4dXBPTGdi?=
 =?utf-8?B?UmJUZjV3S1ZXZmlkK0MxMG9vMXRhOEc0NEY1NFptZER5d2NrRUgwK04xUUo1?=
 =?utf-8?B?cXR1U0JHYXNSbHMvRTA4bmtodEU1WnVKUXd6a0RXZ1N4QjVxMkFWWU5ITVUz?=
 =?utf-8?B?OXF6cHczbTNLSE1KNXhQUEpyVXFnNi81Y2l2U21MUGxKOHJRWXdGSXk5VzVG?=
 =?utf-8?B?a1JDajAzZG05VWU5c3dkVlU2aVV3RDQ2emlPcnV4WXU2Z1VpQkFMb3o5ZFpJ?=
 =?utf-8?B?eFg0MzE4MU8xQVhVN3FIL3lBTDY1cGFrY2k0emlDblNpRExveVVmditIbk95?=
 =?utf-8?B?VkZnQ3ZVUUpxUDFDMWZVd2xRZitMOWtPenhvbnZuZ0hzZ2xUcVBURG03ZDFr?=
 =?utf-8?B?NTN5TWk3UUgrRVhhUFBTU3h2enhhTHU1WTB3L3oxMk04dUZ4QWZWYU4rSlNx?=
 =?utf-8?B?UjRmeExVYUNHby9PNncvRGlGZUVhcDk5czNKRENGVVBYQXM1VGJtZVdqRkRL?=
 =?utf-8?B?eEpEaVBjSWQ4RisrNXNPYU9wd1A1cWw1Z1YybUtVQytlMWFnWVlSbmRpb2ti?=
 =?utf-8?B?QXI2c3BadEk5TytZdzM0NWp6MFpGaDJDa0dOMS9aMVpKb2xoZklYZ0hzYitU?=
 =?utf-8?B?TEMzTncyeDBFR1BiMU5talVlYlBQNTZxb1c2LzFyT0FmYzFtZEFTbStyWGlD?=
 =?utf-8?B?cExyaHJvWkFWTVVaOEZLTDViNkpvQnJzdHQ0eTNiak1zRTUrZEJ0VGptaFZp?=
 =?utf-8?B?V1pDb3RXNjlDY2ZEekpKeHIzMEx1T0E3T3RxVzUvaWlwQS9zY1JHdjlJU2dX?=
 =?utf-8?B?eEt4SGJQd3cxSWtQcHJ6Rk9kbVk0VldDTGRYOEsrZGtrbVgvZE94Y0xnNzZJ?=
 =?utf-8?B?QjFybWV0R2NNTUVlNjlVZHN5Z0ozV29XbjdBYXVpZjJSbkpmRk1yQU92cG9m?=
 =?utf-8?B?TmNrbFIzM25qS2s2VjlVb3JkcExoUGN2c1lYL09GRk81aW1ORjhpVWM1eHFa?=
 =?utf-8?B?NmhGc2ZFNjRZc3dYclg0TXhEaWdrazVpVDlDbytrMmxDSmdpRVYwL1hOWmMw?=
 =?utf-8?B?ZWFrRFJFMjdtbkdTaWFMSzZXUm5qcE1CcTRucit2ell1N0Z3a05seGNNMUMw?=
 =?utf-8?B?b2VSazFFSTBFeW9WZVo3ZHJLNGlHWWpEUkpEamFZcXUxZ3Y5bU1PLzR2L2hm?=
 =?utf-8?B?N0hlK0hoeDJnYTZPd2xpRGdXajBoM3ZWeGlKRHdza1djbEVLbXBVV1cvSmRP?=
 =?utf-8?B?ZWZYVWpKSDdIQmU1cnBLUU5lQzludHBVVEQweEZ4Q3RtRDJTd1pra3dmOC92?=
 =?utf-8?B?Sm1ibEFUeTJDR2tMN2VPZzFOeU9YQUM0RnI0NlA0YW13TmQ0bzEvVUtpdmwv?=
 =?utf-8?B?NEhNZWNrcWNqY21RQ3hpRjEwZUowbktoYWhPRktyRW0vd2RzRkI3OUwrblBN?=
 =?utf-8?B?cjg3ZUVhRXQyVU9oWERkdkVKT2ZGQmJIZGFiblJsWGEwTVRWVDJPaVI0ZDJa?=
 =?utf-8?B?emcvQWxaOHBDcGVZTW41SURvMTVWUkJ0ZWh5NStaKys3WlBoS3MxSGZ5QTA0?=
 =?utf-8?B?UzNuSWY1K2YrQXJGd3ZwSzgvTzVWaEZ1QmkwaGNlNk15UEZCaDNCM3dlOFZG?=
 =?utf-8?B?d0RMMXFpVmx1OE5pODNSV3V1V1RzUnEwODJ0Y0VoQkttYm5Hc0l0YktmQ3hK?=
 =?utf-8?B?OFpGaDJDR3BoVXZSYlhoU1MyQXlKU2pjSHNNR3FFRWJmTml6WWdZWFRwS2tG?=
 =?utf-8?B?NGJVSUpXRnZqRE5FKzMrb3NOTkNiRHREamluUWFOaG5Hc1R4ZDQ1ZU5sRWxr?=
 =?utf-8?Q?uhLoUdzPNl2T4TZwr5CTDz7xK?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:37:25.6225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 578f5653-2621-4fa1-b357-08de2c1f6379
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9329
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

On Tue, 25 Nov 2025 09:10:54 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 11/25/25 08:59, John Hubbard wrote:
> > On 11/24/25 11:54 PM, Christian K=C3=B6nig wrote:
> >> On 11/25/25 08:49, Dave Airlie wrote:
> >>> On Tue, 25 Nov 2025 at 17:45, Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> > ...
> >> My question is why exactly is nova separated into nova-core and
> >> nova-drm? That doesn't seem to be necessary in the first place.
> >>
> > The idea is that nova-core allows building up a separate software
> > stack for VFIO, without pulling in any DRM-specific code that a
> > hypervisor (for example) wouldn't need. That makes for a smaller,
> > more security-auditable set of code for that case.
>=20
> Well that is the same argument used by some AMD team to maintain a
> separate out of tree hypervisor for nearly a decade.
>=20

I guess you mean the VFIO driver? [1]  In the code, it is bascially to
support the migration, which is simiar as any other in-tree VFIO
drivers. The questionable parts might be how to clean up those
callbacks supporting migration and get them into mainline.

Those callbacks stays in the PF driver, either talks to HW or firmware
interface to control VF states, obtain the bitstream, which contains VF
states and data.

IMO, they should be quite self-contained and userspace shouldn't be
invovled. Userspace (QEMU) only talks to VFIO.

This is just my initial impression from briefly looking at the code. :)

[1]
https://github.com/amd/MxGPU-Virtualization/blob/staging/amd-vfio-pci/amd-v=
fio.c

> Additional to that the same argument has also been used to justify
> the KFD node as alternative API to DRM for compute.
>=20
> Both cases have proven to be extremely bad ideas.
>=20
> Background is that except for all the legacy stuff the DRM API is
> actually very well thought through and it is actually quite hard to
> come up with something similarly well.
>=20
> Regards,
> Christian.=20
>=20
> >=20
> > thanks,
>=20
>=20

