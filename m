Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A76C2298F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 23:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41D910E09D;
	Thu, 30 Oct 2025 22:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NSCMwTg0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8548C10E09D;
 Thu, 30 Oct 2025 22:49:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWIGmIKqlkUeMPH0EqIJDXRYU26oNqY+qHYE253fsCfBW5cyX6llKEL/AZzADUOxbAgvi/aeNO3BW9+VD5l9sfIvxRvA8fswSU7fUJExDkhMSQjUv+VLh5Gb7eXBIdGHG7UXs02lXCA/zPVOR4eRd0QfG92VlMx66Z4gnp1LEtAOOJKRcrBhOtrzBfxZl+LYjVMCoFa4kiF060ePhzceFQyM3/wK8lCzPsM6CFFeOCxMZJn35mVuBudWu/GkKXS7DOy84mZoACgdeho1cwaOZCNg7V9fUiJJ3gwfMxEVBjhyp6ey7K35FJdTBnNhnNomc6ALSIx2KDDOFEDmSogCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMT9vZ5X9GcRvR2+KaNvC47QpElM8truj0YU1Ya8MSk=;
 b=NY5xbJMwRoloZuWvC1a1eXHLPpKLs6lD1eodHPoI9CQdhHpVpl1kYlMZkGBTZlCIKpu4iRoSUopm1omk0KgGIuyqoP1jhoHPy+85SekurGleClgh0vPmWbPDzTzeZNBVuoJoKQQaw4shWhA02B4fnT3S4y9i44wMpNcY4tyK/+Qd68MPofyqi1WqhmMNHIvpbY8LGtlHYlfhbj+pJIJMEqoqh4obbCB22Gi1RRFis52JKZdoioevYEqN5dnwa8TEmLw+Wazl0bticwiHZrmdm8c9oQGSV+35Pz/qStbCCSf4Ld5AxGYX1AFKdzXS6wEEpZpBucKwFDR2cCold+j9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMT9vZ5X9GcRvR2+KaNvC47QpElM8truj0YU1Ya8MSk=;
 b=NSCMwTg0ofVV5xTXMTN4iVvvLQrgzfNhQrl+vqT6XX3UvbKmYzKxRAh1sC46AdKMq9h8Kr//7LEN2n48rR/YV00qinzzeOI6e4dXwbhy5h/pMOS/GXawEKa9tNRmAvcQZTClMKjJOGQ6mjpd+WIQXOmdvg6Gih1TohCUIVwWuklX3Bsf4NahpcSsiar3Jen/yCzFo1ypPJZ0D0VWiI1eb9cftOhT0coW1wJ8WcUgud2SIHfdvwe9BIqdRk7MY3gLka38kzyznVvQPxN/rfhaM0a9LSHVQSHlKgHBRJCzvB3licyBX2NegyK3OJYZIXKl8MQTGWQgNzyXilWBPPCR4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA0PR12MB4478.namprd12.prod.outlook.com (2603:10b6:806:9c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 22:49:17 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Thu, 30 Oct 2025
 22:49:15 +0000
Message-ID: <721dff90-aefd-4df9-b383-d62dc54ca454@nvidia.com>
Date: Thu, 30 Oct 2025 18:49:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] rust: drm: Add DRM buddy allocator bindings
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-4-joelagnelf@nvidia.com>
 <DDVZ4L08QMIR.GFMG544BYQEO@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDVZ4L08QMIR.GFMG544BYQEO@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::11) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA0PR12MB4478:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b467aa3-81ca-4517-2f1c-08de18068d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVpGL2lBOGkrck5HMlVqY3VObEt0STlhYmZrczhKd0lTMkdRQUVOKy9xU0ow?=
 =?utf-8?B?MXlRd1lxWXdVOS85TlhYOE81TlJkMlk1VHp3eDM5Q1UyaFVvKzRrWW8xelEy?=
 =?utf-8?B?REpkSEl0a0ZUVzIrVUtnSGVnNnBJdFZGN0grWEM1VHR4OGh5M0U3NWpLS3dz?=
 =?utf-8?B?TzlNSkhkRzVIQXZ3MFArdHBiOU4vQVVXVmFaTXdJUUZzTm1zUEticFRxclNN?=
 =?utf-8?B?alJJRU1iOGtvQXVla1BWbEl2MnZkblNYNmZMNC9ZajA0ZXNIaC94K3A4WjVI?=
 =?utf-8?B?a0FHRWk2d21Ya0FYMDFzV1JaeHViOUM5SkU0NlJVWnJOZjREV2tCNjdwRE4w?=
 =?utf-8?B?Zy9JcmdjUEYyMmpZVzkwUisyREpuei96UCtWc1AwUWhDdEY1eTdwK0gvSVVv?=
 =?utf-8?B?czdTaDdrTzJsSVJ5SHF1M0YyNzA4YndHNjl6NUNaQjVkeDJ1VFVNK2dmSll3?=
 =?utf-8?B?QjAyMXQ4SWhITlo4TUJoekRRT1JqZ3VPVE84MW5xRDdOeDdXQXMyWHQ1MjZH?=
 =?utf-8?B?ZjdDR08zdEpIcG9KK2pvb1ZuR2M5eS9aMEJxM2VUdGdVeW1MckwvNWRvS0ZS?=
 =?utf-8?B?Vm00WHlvMDBJd1pOYzRiUFEyWU9RcHFnQWtMREFCakVmbS9pMDE2aFNsU2JI?=
 =?utf-8?B?eVBobmhDWC9DalBGcUh4VVZ2ZXVYRHlpODVONG5aUGlxOFZaQXhkNWMra04z?=
 =?utf-8?B?U3ozWFdkdXhoaUNTVnk3eVhYUjJrR09LaHVDYy9FUU5PSjJON2ZzaFZHT2xG?=
 =?utf-8?B?cVN3a2ZFd3ZMb1ZPODg1TXRXWWNQTGJGNG1BSytpc1FPdk1NczNOYVlIVXpW?=
 =?utf-8?B?UWIyTTFnNHBUb3hLbE84VXd4OUIraFpGd0R5N0p0S2lQbUc3eTJValBQbmNk?=
 =?utf-8?B?Y0ZxZ0lLdTZNRFRRMGxjZTMxQ0gvbmJYWEtLeHErdEt6d3FJaHcvclpRVU5q?=
 =?utf-8?B?SEhPQnh6bHZ4R0pwYXh5SUs5S0FqOG0wYjFUS0dRQUhOUlZEYW92MmYzL0px?=
 =?utf-8?B?ZkJhcUNEdEJHTkJoR0JaN1AwUnVQbUVtUkVKdHpiNTJ2MTZWK3ZqY3ZtOGxM?=
 =?utf-8?B?VFZxM0RlcmRVNEkyaFd1RGlsc3YvNlIyNHlodjVlUXRSbGRFK0Fzc2lDVENX?=
 =?utf-8?B?bHltWlVqbFlZY3k3MXFzREdrbmxLVTBlN3hVUVhFZ2hjTDk0S1Y2dVlCakJh?=
 =?utf-8?B?QnVzTkZIdWdVbHlTVDNSMG5CNU51eHV1WkFtd2YrV1VROFNPd3JmTGdQcVVK?=
 =?utf-8?B?cmVtNU1KQTdYV1RoZFlHR2NTMnFRSmJYU1NkNWtUTWwzUjFtNWNvZDhuWXdN?=
 =?utf-8?B?WE94TUg1ajYvdk5tRHlZNWxiYnFLSGVIbGNNeXFPaXJtM0l6UlNSZEpZTXJ1?=
 =?utf-8?B?ZjRFZVBreXVRbHBzVGY2UWtxTUpFMUpwWEhBYXFvajQxZDI0V2dONWJpUUxG?=
 =?utf-8?B?cEg5RVFtWXlHS0xad1hLMWpmR1lhZm5Rc0FPaDNEK08rYVpyRVZoaEVWN1hF?=
 =?utf-8?B?cjVjK0VDN3JyaEFvQXkzVFJhcldPUThGa3RBNTNNbTJ0ekVKRTFsWDhsL2JW?=
 =?utf-8?B?YUhOT1Y2anc1UlorTTVTT0dQWEV0a1k1QTJjYWhUZTd6VHRhS1ZsZ2FWUzFw?=
 =?utf-8?B?NkxiN2k4V0FGUU9VVnE4WmhLdUZJYWdIRDRuRUl6bUZzSEJzc09LU0t5WkFj?=
 =?utf-8?B?citINkxBSVpxTnhpVE1YbTlVUytDUlZtTTFLRG9FRmllOERBZ3BNMmxPbWlN?=
 =?utf-8?B?RFRhVG0vTmJZVlFWS0pvRWZDUDVyalhZbjV5aE9pckZUTFArOGtkeDFoRWtV?=
 =?utf-8?B?ZnBjMU9NSzRINDVFUSttMElnbGNlYlo5ckVJN1pKTm1rNm1XUDVobVl4bHZj?=
 =?utf-8?B?UWRXTzRyakxsN2hzSG82eUlEUlB3ZFk4TzBnclRXM0VVb1dBeENPaGc2a3NR?=
 =?utf-8?Q?6xVmDOP4JmhoCgZKeOUxEamZV/cQ9r75?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTFraHhaMXNab3NBMzdZYTBtN3BIUkhIRnlIc3JRQjN6MVFZTzg3OXdneCtB?=
 =?utf-8?B?dzZqd3NZVldvUE91elQ5ZVM0dGpjQWRpeXZpZUhlLzhscDc5VGtFd25CSDhB?=
 =?utf-8?B?RWlQZFNnOGo4SkhhTkhNL1dCSzFLYW1LM2lDMFg5SFJMK3hvRXNiWFEwa0lN?=
 =?utf-8?B?NCtOTzVJSkMxLzVwb3VjekQxdWk1WnErNnI1d3NxUDE1eGwyNGhrcjdRWVh4?=
 =?utf-8?B?YktjSGRJTDFVWE96ejNjcmN4Ti8wUjMxc3lMckJFUFpZWG5IRnlmMTZidGV4?=
 =?utf-8?B?V09zbFkrK1hWNDJPcUdEVTFjdC9WeVhLR0RSODc1a0lsYW9hcHNUa0NVZ1Ri?=
 =?utf-8?B?RzJEZ3E4NVBrcm9PS25rWnhyTkNRa0NXbE9HaXFpeVN4ZC9PQ2o5Y3JrSTlR?=
 =?utf-8?B?b1JxMVY5dXY4SXJSS2VlTHJod3VYUHlsWmpiN1BvTmVjaHI2dnYrT08vTWNN?=
 =?utf-8?B?Y09JYjRJZEFhTDJVdXlHaWJyTmFhK3BpUG5FYkp5bjNFWUpoNDNCWU5aT2d4?=
 =?utf-8?B?YUxiNXd3SjNvdmJSRGFOL3VQVjN4UlVpNlU1NDk0T3lteU1BZG1ad0xiODlM?=
 =?utf-8?B?OWx4UFg0YVZHVDJBMnhlalZMRDRqaUo0dzdwbFNIYjU0ZVpCQm5zU2I3ekxB?=
 =?utf-8?B?RktPMjVHM0V2R3paL2crWm9BSGYvTHBYeFpCYnZBL0EwK1hvcGYwdE94V1Vn?=
 =?utf-8?B?eUU3WGFkSHZCUkw1V1JFR3BET29PRkNwUCtSa0hwZVpUdFdXdzVvU0JJbmY0?=
 =?utf-8?B?OXUwbzhDQmlPeDI2aEZPbzBsRHdnUFBWdmRHaTEyNDBvL0tJTFRPUVVocHJ6?=
 =?utf-8?B?YkxWUTFkOVhSVE5BUTFZUmgxTnBkRlRUTEFUeXFtMWxRNUZqZjVnM3FhK1Yr?=
 =?utf-8?B?dENoV1FTTmRmUm9DbTBVQjVHcGtKcUZwVmJHb25qVDVlcENUaXlpRUpaZDN5?=
 =?utf-8?B?bXRkeG9ITHlHbnRQalMwSklWRXB5Y2pSY1FpVjNXbjVtNUVmSEs2OUFMT0U5?=
 =?utf-8?B?UE5vOG4wQXdhU3hUbHNmaEs5TTU5TGs0TUx6RVYyL3htRFdqc2F0aXFXc0dY?=
 =?utf-8?B?ZnVPQXhMaEFTVEJwVkZzekVzaVN0Q2lvUzB0amhYWEFDcjVrUGYvTU5vZnFm?=
 =?utf-8?B?NGUrY2Q3SDlLZ1FOVWV2dk1mRjI1b0QwWU4vUDVibmFkblN1TSt1Mk1MaFRL?=
 =?utf-8?B?K1pVUTkzR3NQTytNeUxFTStCU2V0SVdjM1ZYbVFvQWVEUFg3d3RoTHZGeCsx?=
 =?utf-8?B?MjJUOHE3eUVabkExbndjTFh0aHhBa3dIVTRNbHh2djlVazRZSkFPNjdCU3BE?=
 =?utf-8?B?dVdrU3N3N2p3eE5aSWsvYkhsV2x3L1NmSDNrTWVLYWlxUkNDWVJXQ2RzOCt0?=
 =?utf-8?B?VTNOZnZ1bitDaUdLN1pST3ZFVDFwQ0g4cnIrbTFwK2VqbjFzcDRXQmNXSnhn?=
 =?utf-8?B?Mm5Od1d5c2R6a0tid0JGTHlqaEtpTEZBeXlUanFyMUgwZFdtSjlDRWdxZ0Iz?=
 =?utf-8?B?a2lGdzNLOXZuTkJlbmt6a01GcHVDb0NwT0tiWVQzZE15eVhIV3lMWmY5VmpV?=
 =?utf-8?B?SU8xK1c5OCtOT3huZURkV2RCeUV4SkFNQnZZK2lSamlyWUl4SUp2S1F3bUZp?=
 =?utf-8?B?blpxNTBBeG52NlRTSHNnUENlVjJ5OWdBK0FhUUxKb01wRGlNd3RPdzFvMEZR?=
 =?utf-8?B?WlZRUHpFSXE3d0Q2UEU3U2xGTGxQU29MMHNpVFBacEdqMS9BdjFVa3RZQ3RW?=
 =?utf-8?B?cTZJSkhnR1lJZ0ZzaVVDSThUeitOazlhNUFNdWR4MVBKSjRoSEY0NUFFZWRs?=
 =?utf-8?B?UlhWTW54OWFzeWdKUkNhUFI2UW45YUllZjNpSW4rWk5zQTRCUW00Q2wvWUx4?=
 =?utf-8?B?ZHJvY0NEWlRibkNUMVJGelV6OVZ6SjNrSU5UNnZ4M2YzbkRDWXU1U28wb0ho?=
 =?utf-8?B?aVl2bEpTOUsvdmdEbmxOTFRJV0cwRllOTTU3VlVWbkVqbDRtYllrMHNWSFk3?=
 =?utf-8?B?ODZzS0ZranRzTFBSRFpvT3EwUExXNVg2S3dqbXZmOTYxQldTWFZuN1BlL0h4?=
 =?utf-8?B?SGVZZUplWXI4UXBzaXcrOHRBa29qVWdURERySjFtaWhKS1gwMkhOd3ZjMk5z?=
 =?utf-8?Q?67ZNIPvtU9N3paC8Py4FsK2LJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b467aa3-81ca-4517-2f1c-08de18068d82
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 22:49:15.8240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UI2z9wv3LS1+a/mE0Iqk0X+iZ5Us3WUtZK8XYdzapUe7d2kcaMAEQrdhTJuM14WMxtLB28r/XWdy2mUHNUKyng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4478
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

Hi Danilo,

On 10/30/2025 5:27 PM, Danilo Krummrich wrote:
> On Thu Oct 30, 2025 at 8:06 PM CET, Joel Fernandes wrote:
>> +    ///
>> +    /// Returns an [`AllocatedBlocks`] structure that owns the allocated blocks and automatically
>> +    /// frees them when dropped. Allocation of `list_head` uses the `gfp` flags passed.
>> +    pub fn alloc_blocks(
>> +        &self,
>> +        start: usize,
>> +        end: usize,
>> +        size: usize,
>> +        min_block_size: usize,
>> +        flags: BuddyFlags,
>> +        gfp: Flags,
>> +    ) -> Result<AllocatedBlocks<'_>> {
>> +        // Allocate list_head on the heap.
>> +        let mut list_head = KBox::new(bindings::list_head::default(), gfp)?;
>> +
>> +        // SAFETY: list_head is valid and heap-allocated.
>> +        unsafe {
>> +            bindings::INIT_LIST_HEAD(&mut *list_head as *mut _);
>> +        }
> 
> Not a full review, but a quick drive-by comment:
> 
> bindings::list_head has to be pinned in memory it should be
> 
> 	let list_head = KBox::pin_init(Opaque::ffi_init(|slot: *mut bindings::list_head| {
> 	    // SAFETY: `slot` is a valid pointer to uninitialized memory.
> 	    unsafe { bindings::INIT_LIST_HEAD(slot) };
> 	}), gfp)?;
> 

Sure. I will use pin_init here.

> if you're doing it by hand, but as mentioned in a previous patch, I think it
> would be nice to have a transparent wrapper type, CListHead, for this.
I like your CListHead idea. Let me sketch this out a bit more and see what the
lifetime relationships look like, thanks! - Joel

