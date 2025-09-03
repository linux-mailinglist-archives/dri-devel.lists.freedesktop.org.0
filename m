Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66DAB4208B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 15:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E536910E863;
	Wed,  3 Sep 2025 13:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NXCjeJi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D23C10E863;
 Wed,  3 Sep 2025 13:10:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5D3QjUy+w4BFc/v4wf3bHdrsuQrBbYJEaPZHCb08DM88yMs76RTl78+SEHIiUBpGN643uQS3fpBnuTWiHmqENQ67+bwpRMQs4mz+CzgZ7PTC7VCdkMQyr9uddJ96qLD7FpVtVVVI0VqHwSk7RrUsvNZklwSrt52HkzCU3DrG/sGCSFjmTn13fiAYeSlrhMdefSAgUhsXDPYkHaj1o9t/50BJsGS3Kl6dZAw4azAfOX874Ui4+APihFYxNpVeZ5pSQCvmiZYOOxO92rlmfQeIux6bc95ke3BOLUi70F3jz/QF6qE+GCqR0F3YppmhO8Jn7hpU8cdvceCtMwK8pWg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXGOh0kpy2fbSmViBAmrNexhLrWqbdSkM6I6mZB/EXo=;
 b=nI8pnPaTo4mkl4ta3aR5TKHxALJj3/lKAhrZNIH4QgL849zV6GN5XHo2jI/ifw+UxG5S0aK1/qBK0ZV1/f0c/bWgBqA3V78N4VeH2GkInoMnd+Y8NY0Nj+ykyYCbrF4n/JTsAEpEzqvQzlKAsw4M/XZda3NRZmpk7RSdIwrAyZWUvYpNuKqI8OPo9b04c5c/XZy8N6/rJpjmQXDsXIQ1Kx3wTQoXCoj1nab4Loq8oM//vFYa6uzpzgrWy3cFnKn/FbRYg0az9Igh97DUYMiSxbdJSyw4jMcKCy1A5CWEwXGYni0kjcZVKFUyifiJ1+g4eC6j4+yJLyf9JFhFAHhYhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXGOh0kpy2fbSmViBAmrNexhLrWqbdSkM6I6mZB/EXo=;
 b=NXCjeJi1OCoMvtADhO9TR6RC0kJv4uZX+TINfSje8fU9GDC38XbZZLv5LYbmGy+GbQ5G6IVYCi3XoA7NxCqPAeoIxjElLPHPXgRyX2Q9a8wH2xzYs6tzF5JLzcpONvqQgWw9J00nu9O+3ILramx576iDHfbFzh8kzD8Bf+ncpSatQi7Rs0AnTnur/0VxzUQb4BFm1/kzDbn5AJs1HySIKu0EhLuOfO/katPtK8EVda/XZ4R0ayiV19O+n6mXf8IYgU7ADhvOXxm2B/ThHkI11NhBCDyLddquIR2sIXp+Lh9umA/0sLktUUF0zsO3iZE5+9my+ALTdQcKAYzMvb0t/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 13:10:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Wed, 3 Sep 2025
 13:10:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 22:10:35 +0900
Message-Id: <DCJ6UUWUC9JI.MKBSK8M1E6J3@nvidia.com>
Cc: <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/10] gpu: nova-core: gsp: Create wpr metadata
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-4-apopple@nvidia.com>
 <DCHAPJRPKSSA.37QLQGAVCERCZ@nvidia.com>
 <iyjecyybwyilem2ituw6esmufid72cximthc5qo2fgdpzz4fko@cb6n2vcrptb5>
 <DCJ6G4DJ1JSY.1U6II6SNMZAZQ@nvidia.com>
In-Reply-To: <DCJ6G4DJ1JSY.1U6II6SNMZAZQ@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 34a99fbe-62d6-4227-d07b-08ddeaeb474b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVRudGpUL3FhemxEMzM0TnFPeExKYitzYmt1b3dWdHpWRWFja044Z1pQamNS?=
 =?utf-8?B?WmlJbFl2YjlsL2J5NXU5SG9MbXM2bnJqT3l6K3doT3paajJjeXVwVjVpU3Rq?=
 =?utf-8?B?cTVXS1c4RjdnNFBhbTE3eC9ySkwrZURFaFBLNERSYWMrNlVEVkhxTDVqa0t2?=
 =?utf-8?B?S0RBb1lGdTUyK2lEbmxDUWtEby8wVkJNUFF1MUVGdzEvY1RuVUVGWllJTXlQ?=
 =?utf-8?B?OTZ0ZVB1R0FVVk5vc2ZydldYeFdlOW5zYURQOEVLV00xUTVvVkFyVHV3UlZV?=
 =?utf-8?B?VzVOQTVraU5mNGh2OEZncUpUSENHN29KWjc2cW1QRjRYM3YrSjEyQzlPN0Rq?=
 =?utf-8?B?ZTN2QWtMOXZXdnpvNnVYVVdoLzA5OTFPdmpsWno3VGg2bzdZc1JPbXFTS1lH?=
 =?utf-8?B?UWprQmhJL2F4RTV2SDlCMWtMSUdnbXFxMWxpSGU3bU9reStka1BuSy9qaTYy?=
 =?utf-8?B?OGphNFRLdTRaYVh1VGxiZWZXSHFodWFmRWxSUW5KQU0wS3NtOTNUSHMwdExV?=
 =?utf-8?B?ZS9MNUpESVVRNEFSSGF2THhGcGgvU0hEZkxVWVhwYTExUDFKMUxJM1N1a2NY?=
 =?utf-8?B?WXFXQ1hQZjRRelF3SHZiNi9OZXZPOFM4ZjU5MDg5VUk0blZBT0U5ejllUnpo?=
 =?utf-8?B?Z3NNMTBVOXJNV0ZCYml6UVVSdDJQSlJhVFFPNDhqREZlTFYvLzNMUlpuSXVK?=
 =?utf-8?B?US9JSlNjUEV6bWhzUmNkbmNlZng5UUs5T1dvek9zeUxXZm1nMDJYY2pOeVor?=
 =?utf-8?B?eGdLZzQ5VlZnUjQyQTRWWnE0emhGeGlXM2NCK0s4NDVxL1YvcjBMQkVnbU9E?=
 =?utf-8?B?TW9GU1pDN1FydVJoUmU1U29LNTFkeEh6V1ByM1NtaDQvdWkvWlZibEVWNURT?=
 =?utf-8?B?aVlEcFVibWNKSEFiQ3FCTjJrazArbzRLZGgvaXFwRG9rblB2UnFUU0tsd1VF?=
 =?utf-8?B?c1NCV3JLZ3FTZEpsNUo4QUVNVmlhcUg5d0J1RUVSNWNDUFNDa05SdzJmdXFI?=
 =?utf-8?B?RURHcTkzVzRyOFdzLzhKcUhlc253Qzh6TGcrZmluU2lOZGNIUmI4dmJHY0th?=
 =?utf-8?B?TGpiZVdvQmkvVkp2ZGVQS3FpQjhWZUZsRlhXUHJoVFYxc1hlNEFGeiszbHVs?=
 =?utf-8?B?TnZFT0o4RGtsNkFUVXZYZ2ZzcjdxZGg4WHpuUUxOd1FoR0s5QmN6Vjlwek12?=
 =?utf-8?B?TmN6Qm52STByaE1vUHZERmEySjNLZDhuVkJTZDBJMkY3Rm9hbHc4OFV3Ujc0?=
 =?utf-8?B?WlR1MGhzMGRIQjJjMFpLOEkvQ0hwdi8rQTdqdWNGYWd3dW45T0tmRlZoN1c1?=
 =?utf-8?B?QVlQL2NyL21yU3BBQ1gxWTFTTkdHdXJ6a3Biclo1TXFnMkNCZjVjSDV1Mk1K?=
 =?utf-8?B?MHFNdDhURTFLZ0JRN3AyTktxVUdSK2doZkliUTczYy9YV2ZuTUtGOHEybU9q?=
 =?utf-8?B?ZkVmNi9WeHpVLytRdFhkRGpPRW5UTVNUcWt1enZtMlVjS2xLMXIvYk1NTjIz?=
 =?utf-8?B?YlNDeHBqVXE5WkU2NzJoWkRWSmZnNko4ZDdoUStIUjdnWlc0U3JONXp0NTZk?=
 =?utf-8?B?dWVjK0J1UVdxaHU2Z01JUVFTOWcrOTczMXozRzV0M1YwT3FCUE5GKzVLMSt2?=
 =?utf-8?B?RS9SVE5mODJVcFozOXpnTi81ZWxYekNKNFFtaXZOUWlteldzUklCR2M5Z0Vp?=
 =?utf-8?B?Z1VaenpDM3ZBNzE5L2h4S1hYWHVWN3BUUFRJT2RlSWxia0lZVkR1RTNjbzBu?=
 =?utf-8?B?V3Q4cGt2a0pIYlEzbWUzdURsY2NFeWlZbENXSW9PcWN0NVJDMGM1SGlrcDR3?=
 =?utf-8?B?UHJBMkZneFB4QTR0RXJBYXF5Z3ZXUUIrTytaVnkzTGNPNHR6T3NZRHVwL3Rp?=
 =?utf-8?B?WmtQKzNDUURiazJ5Q0ppWlEzQU83T0JJMnJyZEhkMEE1TlpvMllQdlVJM3dR?=
 =?utf-8?Q?jM6sffDB2LU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDAxSDRlOTZ6Rm84Y3ZUMEpIVGVBbzVYU3VvbjlGUlJwSmRBK0IxOTJtUWFx?=
 =?utf-8?B?bVRlMGh5RHl2VGtKZ2dRZjBGWTFld2hGeU0vR29UZCtsRndwLzlZM2lXV1gr?=
 =?utf-8?B?b2lOSlp1WWFTcTZFZ2JxQ2ZVQlBqRG5qUHp0UUlYMHBaVFVGZFUrRFlWcmpW?=
 =?utf-8?B?MTVyUTRqV29kdWU3ZW1xeTd2WHd2OGlMZHVVcFlHbnRPa0VUdDNaN1hJUmh0?=
 =?utf-8?B?aTNoYTBMV0FBcjN6RmZ4TUszeHhZeEYvN21BOTBaRDIvODFvTDZvL2hwTFk4?=
 =?utf-8?B?TWM5QUcyWlMvUm9VYXoyR1dTcncxT0I0YTF5UlVIMmZvVVluRG9WVGhORXJr?=
 =?utf-8?B?bVdrNnlVYUJyU1lOajd3UGZNVGNlSjNCdjN4ZE5YNEdETnA2YVFvQ0g0U1hS?=
 =?utf-8?B?aUJXSUZEL0RRazlvYmc2alBlTmRMRTZFWko4VG9qYlpaT1g0MWlEWXlzMHFz?=
 =?utf-8?B?cG9yZWZnblMvckZQYWVJVjU5Zk5pRGNwdDhXK3pMOTFpZ0xIbFA1cWEzVmR6?=
 =?utf-8?B?R3ZHTXdYdUsrZ0lJNEdHa05FcFhVRHZMQlZjN1hyejNEZWRhNUExOUVEYmNX?=
 =?utf-8?B?eTdNR2JwbTF6QWowVFpNekhSeW52Z09MN2VoRmlUaXEyQkUzMXRxdDljMC9E?=
 =?utf-8?B?VVNjZzNrNGR4K1NpV0pxTzZsSGcwYVRBVWR6eG9haTBjS2tndUYrQ1JyQzNm?=
 =?utf-8?B?MTRWMm5Wa2JQcFNVeDBrQU1md3kycHVUSFVyYTV2d2dNRlRWbWJEdUN5eVdV?=
 =?utf-8?B?YkZ1dnJPeklIajBWUC9XOXUwT3d2d0o4RjFiM0F3eEwyQ2NoUXE2My8xbitu?=
 =?utf-8?B?M1Q1c3BWNHVHK2VxRjIzS3hud2loRktCeGUzZWNQWXkxMzhNL3JvMzdkUjAv?=
 =?utf-8?B?bStxVEduMUtRb3FUS2pNNjJhK3VKaWZvcjVaT085TFFMTDYwekU1djFnLzhZ?=
 =?utf-8?B?MHZ6eTJVRHMyQTJOZG1KZ0c2SkQvbm1FbjNjNDRidnRDK053RHA2Y0JXTUsv?=
 =?utf-8?B?TklJWXdzbWJ2T0lvNG9kVnc4SVdrczBHN3lRRFhjVGdkRzhLKzBjNHJpazFn?=
 =?utf-8?B?U3ZlMVNzUTRFSTlVaVRSMUREajRqYU1jTXNJNEJsME9MUkNLS1VrL3JRcS9Z?=
 =?utf-8?B?U1RmTzNFZm1OQjYrNzZwUFZZbkFUQS9QVGtEQ2NhR2hLN055U09Lc1FuN1Rt?=
 =?utf-8?B?czl5L2t5L2VFRW0zcEdERUZLRkZzZ2VuODBZQmhQeEpyNXRRbVg0UDVvZXdM?=
 =?utf-8?B?K3Y1djhMbExuL2w2cnU2b0V5czhQRFpkTCtlZThpKzJxSWlZa0ZHck1HWEdR?=
 =?utf-8?B?alJxaVVxZVlHUG9pb0w0eTZXa1RWTEFQTlNiYUxnN0t5SEdWQ25sWCtUVkhW?=
 =?utf-8?B?K1NhRlNBZHFWd1VjaGovd2F6Q1RvNDVHdkN1b2s1VkVzMHhJN0dBYjZuWEp1?=
 =?utf-8?B?bkJybDhJYmhDcmROOFZsSFd3dWxMRXZvSFZvR2ttVGxLV29aTDY0Ulh4MkNv?=
 =?utf-8?B?R2w2K0UxTEtwdzdqNmpqQ3I3d0NqZFFNZ3NxK1d2Nnk4Y2ZOd2MwVVNMVFMv?=
 =?utf-8?B?ZGNNa2RMbGZPeWJCQlZMdmNnME1sdUdObXlkVmFwdmVWK3hqWno5QWl5Q0gw?=
 =?utf-8?B?bGRnT2VvVDQ4R2lQNFlsNlc1eUJJcGxGdkVLT1ZMOCt4RTduaWIwTDNIcm5U?=
 =?utf-8?B?eHFGeUhidHN2NWs0N2JBL2RKSUpjYk1BVStxSDVkaVM1QjhOR2JjVmlYdTFY?=
 =?utf-8?B?Znd1TmFoVml5ZGQwYkVlTHhvbHV4QThiREYyTXJpMXY5NVVwb2xGazZUOTFm?=
 =?utf-8?B?VTNpWVpGUWhMNGljckxyY0xNeFBLTEg5ajN6T1FPUnZBeTlBRklyWjNrR3Vm?=
 =?utf-8?B?ZWJuQ2plV1RLWnVPNi85aFZxZ2FIVGpsZzlJa3ZwR2pGbDBqTzlLL0RCdHM3?=
 =?utf-8?B?TjBxU3dydFVoVmZRQWs0cDFBQnA3SWV6OU5xbTQvSkFmNVJDL01vSGlOeDBw?=
 =?utf-8?B?aTdTdkJpV0p0UEU3MTFBelArQU5pSjNYc0VwWUZRbGJMTHV4T3hCR2dHWElG?=
 =?utf-8?B?QlBVc3JXbnp6ZnhVRHRlRXZKT2VacUdTMjVzWXM2eXJZdlJOMlFJU2sxREtW?=
 =?utf-8?B?VUp4ZmM4OUlndjFmZmdqWktkbEx0eDFTUy90SjEvb0FkRGNZTm4wYngrbm5n?=
 =?utf-8?Q?nNOmYU+MVBR6PY5+igToAzns3NERi7v1n5aJyXOQ9MM5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a99fbe-62d6-4227-d07b-08ddeaeb474b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 13:10:39.2194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbB1hBLD48lOQD9RMC8Z79sEw5zxq9qe5WzP2AHxZ4ebSOP4MQ9q1VcbWpxkWAE0zsOh2hUWY0RFOrxbfkMlAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585
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

On Wed Sep 3, 2025 at 9:51 PM JST, Alexandre Courbot wrote:
>> And it's all tightly coupled anyway - for example the Gsp boot arguments=
 require some
>> command queue offsets which are all pretty specific to the Gsp implement=
ation.
>> Ie. we can't define some nice public API in the Gsp crate for "getting a=
rguments
>> required for booting Gsp" without that just being "here is a struct cont=
aining
>> all the fields that must be packed into the Gsp arguments for this versi=
on",
>> which at that point may as well just be the actual struct itself right?
>
> Which particular structure are you refering to?

Ah, I guess that was about `GspArgumentsCached` and the message queue's
`get_cmdq_offsets` method. For this I guess we can just have a

    fn new(cmdq: &GspCmdq) -> Self

constructor for `GspArgumentsCached` which grabs the information it
needs from the queue and initializes itself. You would need to have this
code anyway, it's just a matter of where we put it - inside a function
of `gsp.rs`, or as a reusable (and easily replacable) constructor.

