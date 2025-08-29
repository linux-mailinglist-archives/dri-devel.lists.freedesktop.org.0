Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F49B3AF86
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 02:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CC510EB19;
	Fri, 29 Aug 2025 00:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H0+LImXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE24710EB18;
 Fri, 29 Aug 2025 00:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5v35NVOR4nmlREQ2GMsVJLRzeMJlnbMHmW5+Z8QW4CmvsOXBtN0qcAqBfPsbEnU4pgNOjpWMVlAWzuzigJ+kMVjzBsFpFl07aeNYlFr+ScasphLq4X5NZVU6/kVphcdyYDeVS1fRophfisWBdHaa4Ims6IlJfpvD4bvMhYDvFaaZpf9cLZo3EHYB3i/peaD042PRaKsp+hLiDatzh/znEn5z1ZKJ5+u9m/VIYdihhU4SqionY+CfNzdwbnPP/NmHpLtrnIEXAqM2NDD3RRploMKEJM7eV0mcX6U2MEKRf9ACpgqy3HrvxYMaIsspFpeN7B/meQnU14E6d1Cua8o0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79mPQREkixfIzryDlGYR+jCJpQxbrtwaStnbbxmF8AI=;
 b=Gw8zk6yyV3nDZqnTQ8R20/Fk0i3gBG8PQVAysO0rpzM3QcEV9ApF5ZsFlfW34SWLiQExgd0GW7gXYmKeFDg2FH/R7HrVbeUm/xStU+7nD5IE6pgo8uR9jlWgT6myZB5TOTQFDnMyPNQ+CvD22Gagl5ufdiIMHGfiBZY0rtQ80zu7HitkiQdEC65kJy0BGZBSa9I4OP+9+m7LboJhMuSq0vTZjtk15T0wJCo8vmjh0Vl+Mh67ZoVaXYeyQuc+GgVQaqUh6aMwzFAyj+C2evGEQnWiaqdK3mwQNAbuutF+/CF71XUhq5oJ3kGgEzPtBsTRJd3IefU7y4bBgYkVwTdnKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79mPQREkixfIzryDlGYR+jCJpQxbrtwaStnbbxmF8AI=;
 b=H0+LImXBKZCNdNtuSPCJXfpsgcrsLFDGj3U79y/jgDRlAuW0T3I9aBCNuDyy5p7V8NqmGzK72rbqE9g3ydl0X725IkyHR+GQWwfhRW11oOd2HYx0/yYfSUIF6jhhpA4pTUweD9nkT5E7DQM9n6yplhec9oCCi03pRrv0ldbNiL7K7UI1ZXYyHuQ2CDNXtZ0L2meq7gemblujZjlRY/tZ6rTazeP3kvZq9rN4sjnfntSLXvxCys6fMn2hP3AMRHewTMxVruc34vau/fslz0sfA6SzbiveKTWDPBqyFb0ekL2POOalJO9IZIo/QKbQoYrC5iaZL90BRi559uAAARfSvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DS0PR12MB8575.namprd12.prod.outlook.com (2603:10b6:8:164::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Fri, 29 Aug
 2025 00:33:53 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 00:33:53 +0000
Message-ID: <07a99b0d-5a56-412f-b4ae-330d27d11832@nvidia.com>
Date: Thu, 28 Aug 2025 17:33:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] gpu: nova-core: process and prepare more firmwares
 to boot GSP
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <dc18894e-09d3-4088-9be0-22c2070b61f4@nvidia.com>
 <DCD2P4ORDLYV.2NSHXI305AF2E@nvidia.com>
 <79c7d5b5-5fe0-4306-b8c4-3c91758a4c00@nvidia.com>
 <20250828-precise-python-of-witchcraft-9d9a8c@lemur>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250828-precise-python-of-witchcraft-9d9a8c@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::33) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DS0PR12MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b9af390-93e0-4a08-a655-08dde693bb3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ek1MYUdLdEx0U01uNC9sQ21sS2NQS1hrU1hSMVBsV24zNnRZT1F6d3o5Z0Zy?=
 =?utf-8?B?L2VMamluK0YzaTM5eTN3WWJ2NjBtR3RtOERDc2JOU1drQ0xyZThYR0pycHd3?=
 =?utf-8?B?OHJoSk12T0xJWU1CZTBGNm5BOHNxV0FlVFhYQW4rZm1Kdm9GdXl0a2lIbVhs?=
 =?utf-8?B?ZVBUUDIvZ3FyNHdlNzdRQi95R24wYXhTU1pGSUkwUFY3SmpSdzBweWNsdm9V?=
 =?utf-8?B?eEJhZTd2OExzblBnYmQ3Q0k4MEcxOWRuVUVlNy9zSDhackV5YTlWZXVJYitu?=
 =?utf-8?B?NWFrdTRqSEYzazJCY2NQeW5WM0diRFR4QWpkN3JxQkplbUVoK2p2aTdmMW1j?=
 =?utf-8?B?TFlKcXVvTHBSQ09LLzBQeUhHakNIZTQvVktSOWdmcHl3d01INGJzZE5Sc1Jw?=
 =?utf-8?B?UnFpNXJHU09SdzRzejRrWGdTY3dRYnRZQzdKVHovTERCWEdrZ0svNWxxWUI3?=
 =?utf-8?B?WjU2bGlqb1lTREpuMExQb1hsczdlODkrSm5xRERlVmRXYWEwZzZ0TU83L2Rz?=
 =?utf-8?B?OUtxV1NJM3RyaHU4RmxlTWkrWFcvcTNJN1JJaGxQOTJKMGM5a3hvcEg5d3pw?=
 =?utf-8?B?QzJORlErWXZUR3BReUlxc2Iwb3FnUmF1b2NncFNuSXEwbzE0T1RDRC9NOTdV?=
 =?utf-8?B?N3ZjdS9QOFE5bVZ5N1BGOXZJYUlML3NUZlNrN0UrdnJ5UkdQR0R5dy9xVXBs?=
 =?utf-8?B?aEZGRm43Mnd5elNxWTBsbXlXUTZoS1kycDA5TkhMei9LVHdiTnRhT1dPS00z?=
 =?utf-8?B?WTM3N2JibFYzdmlCRE1UQ0tKRjhqZjlBNE9RL2hFL3JIekU3RllVM082RDdj?=
 =?utf-8?B?S2kxcldGaXdOaStzSllaM0dRd2JTbUtZTWNWVFZCbXkzWnFqVmQwdkQrLzhv?=
 =?utf-8?B?NnpIZEN4RWpySUo1UEltOWFFay9ML0kxWG9OTEM5THNiaDQvV05uTUNpMVZs?=
 =?utf-8?B?NzBhYktKaXdjUVR2RUlnZmc0VkppZjJIYldYbGhxbklLWURBOFd6WStobDVE?=
 =?utf-8?B?U0FYWWpCeXkwYzRpQTJ0a1c1WGNGMHFUeW9jNDNtd3pRck1YZjlMVjVtWmJ0?=
 =?utf-8?B?eHJKbHJjMTVxM3htZjV4K3lYS29TQXpuNkdGc1dhNmtxNTF4a0tSc25HTGZG?=
 =?utf-8?B?MEFhQ096SHY0bGdEUllvSzUvTDBYQmxJZDBpaUJGa1B3eU90elV4ZGNFUlN6?=
 =?utf-8?B?cWdldTJTd2prdkFtL0Q2NUlMRGhVNWw1d2NtdDhUMy9rMTlwbytSclNENHhm?=
 =?utf-8?B?dktwL3hHTXZqcitjSE1Wck5lMkZuN1VvK3FDc0pvclpmL2pqUFlNaFlJcW1M?=
 =?utf-8?B?cWFWRmJ1b2Vlb1RJcXZmN0VlVjE0ZzhoaW5TZ2JvZlhXaUtySWZDM3Q1Z0xr?=
 =?utf-8?B?djhKa2RxelFTOHkzODJsMzA2NjZmcnp2TlJQOHl1dEFqbW1jcStONWg3SmJU?=
 =?utf-8?B?ZHJIdzJTOTZqTEVQb3dBaEtySk83RXo3U2RBTzdNN1ZQSk1hd0JyNlFZNkVn?=
 =?utf-8?B?UUd2c0ZJRzVrL2w3VzdlTDB6b1dSOWR4eGxsVmxjMW02Z1JFbmRQK0FGVVJR?=
 =?utf-8?B?ZWk5TkplaEUyQ0dWOFF0RTg1MWQyUjQ3OUR4Rmw3aXdCUDJNMEx4NXZIdWVr?=
 =?utf-8?B?cWJCc0o0djU4dDMveG1RRk1WSmdjL2F5U0Rpa0hkRG8vZytRZzZFazh2aEFH?=
 =?utf-8?B?b1RmQWUxSmdpbnlrMGRsazN0d3ZnNEZQaXNvbFdXY2RHSDYvbGRtR293a2tM?=
 =?utf-8?B?OU1MUTcxbzh4YUY0R1dhdTZQeVdwUUJacUxFK1dVK2hFVlM2cHpVZndBay9T?=
 =?utf-8?B?T0k3bzJUVHdnQlpjMEZYaWxPTkFIM2pMVTRQZDJNZ1JGcWtWSFFsanE5V0hM?=
 =?utf-8?B?OWpwdGxTWVczbHlCYnZmZzNhNzljUzhCUlhsS0pGNE1MYlM5b2RKcGwrRFFs?=
 =?utf-8?Q?xJnG8ywhWUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODZhY1o1dE1SemZpdlJURmplSGlrNkVldWQrMHRBY3ZxU2tnVTNBZVZMTTBJ?=
 =?utf-8?B?Q1B5N0dsYy9kQ0M1Zi9pa3ZXcEltT0J1OGZ6UDFPTEhIemVzeW42aDIzUy94?=
 =?utf-8?B?L25WbTlKOFZreW1BTzhvbGFGbzg3UnRoMmpjT296MGppMzhNY2FGVW1YdnVp?=
 =?utf-8?B?QzRiMHpjNmRybENOTWdsd0ZyWmpFSGJpSGJiZzZOTFNJNk5waTByTGxWOTFt?=
 =?utf-8?B?MUlQRkdBT3lNSXZ3RTlyQzlia1JCcUZ4S2t3b0oyUEZVMmNWRUluK3FLQW9v?=
 =?utf-8?B?NlNKWjZRVEhPSlM5bEFEYzJHbFppUGo5b2I5QjRKeUJDSU9pMUNoK0twVHdh?=
 =?utf-8?B?NTNGOVluZzlQYTgraWJMeC9ZbDhXNXo0SXhxVk9sc3ZBR3NQNTV3Wng0Sm5p?=
 =?utf-8?B?eXBrb05xL2tNc2VEU3ZPc3c2UVZ2SjBZWGFGMjRyY2ExWHQyZmdVTWlFZVNR?=
 =?utf-8?B?L0F6NzM5UmVIQW41R0tQcmQvcGlydUF2OGhDeDN4cHF3UU1BUGRFNVhENEdi?=
 =?utf-8?B?VWdaRFk4OGVGQ3MyK0hlUlFHWFIvWWhjZCtJOGwvV0dZaFR3WE42dWNlaDhX?=
 =?utf-8?B?NVI2M2J1dk03UlNaeU1RSlBkOTZ0YTFaeHViZC93UHNJd1cyRXV6UUdmV1Nj?=
 =?utf-8?B?SFJmdkU4eUljQ3AxdFJXaWRSN0JvcytGMkY4ZzZiNmN0UjRyeUlkRDlReFdm?=
 =?utf-8?B?MFlqMG93NXJ6VFFLbFV0c2NEZFExNDA1VFJWdTQ5S3BoUkhJZ0ZSQlZISERE?=
 =?utf-8?B?Ym0yS2FmOEVNVVlzSmM2WEV3Zm9YckEzYmFQa29ISzlFL0YvL2VOcjZNak1k?=
 =?utf-8?B?SGd1VW5vL1M1Z244K1hMNU15SERKY1hRRTRpdmtkK2R5bDAyQy9BVG9Ld1ly?=
 =?utf-8?B?dnZCY2JWSGpNWTI1TzFBaXNqRm5ycHExbkZCc0tMbGxWZUpDMUIyRGhxNDY3?=
 =?utf-8?B?S3NKbHM4NHQ4aFZOWXBuQlAxWm9BeTB5aHZXM2EzQnFLTnJzVG95YlBGcXhs?=
 =?utf-8?B?emRPVlE0b2dRRTJ0aEtHZ0U0c2p6SmFaZENWbjlCUE9SNXNwRkNYWTlPYVNU?=
 =?utf-8?B?SXNVQzNIbmtlNnFWcDNMeXNLaCtZTzZ2LzBheWZFMjRmNXBVcmNMTEpHc2pT?=
 =?utf-8?B?WnJUeWJqOUFiSWwzckdOc1J1UkpjYkxXVjliK2paV1BzN2xGSUhUa282dFhS?=
 =?utf-8?B?WFg4WVpoeC8vcnQvUi8za1ExYWNhNGFDUG1EaVRvU3RLWHJXNlJhRmM5THhl?=
 =?utf-8?B?LzRwNzBhZTZVMkdMc0o0TkRWOTFuMzZCTFVnVHFLYnpnSEl3YlFHM2pMVEc5?=
 =?utf-8?B?RU5qc2tubG1RSUQ3TWtWNHB6RTBYcTcvaWlLWXJqSDRtalZWNndYSjJla1l3?=
 =?utf-8?B?SENOcjhBaVZhOUpEeXlGQ0dsT0htbFJ3NHpGWWx3by8vNndUdjYxUHRPek9O?=
 =?utf-8?B?VU82K3pFRUhUVVVNWlVKdjBpcjhjUkNtcFNYZlIwWmZIcW1tQ3IzWUtqSFVo?=
 =?utf-8?B?RkFQNVdUMU5paWszaktVNWM2eWZxTXFaN1l5SmNZN0FzaEk3RkY0TlRFbzJq?=
 =?utf-8?B?Q0Y5OGZ2YVRBa0MwdWhpQkJqb1R6YTU5ODVVNXQvemF4bThna25BemxQM2x5?=
 =?utf-8?B?dHRoRTFvakFtZEl6UGlEdnZ0RXZnYk1PR3FOVTNRVHlhVG8xOFkyOWxPdjkz?=
 =?utf-8?B?bVk0eDRMUi80NFhMeitVUDh1bFVsNndCRXZrVzhxcWJGMFlKckRlVlRyU2R2?=
 =?utf-8?B?VE40bi93UHJmc0NzQVdva3lMZHJBRGhQMktlRXpNcGpBYzlObEdlWStOejZG?=
 =?utf-8?B?U1E1dUdob1l1YXZMdWJlQjdIVG5wSFhqaS94SjQ2NlF3OXB4cHNsVGxOYmxC?=
 =?utf-8?B?Y0hROTVkMHE1bFNJNFE3VUtkaWZ3eWxZRmtaQndlWEQwOXRuOHdrY1h6TGpl?=
 =?utf-8?B?SFlSNkN4RElpTFgyVlRjK0dLTkpzUktxQWJ3VkpENURKbE5WWEh1Y2pzaCta?=
 =?utf-8?B?cHlCeDRwQTRsdzVwc05GaFhpUUx1SmhnaEt5WUx6cFcrVUtmeldId0xTVmJE?=
 =?utf-8?B?QkhDNUFKN24wQkFsYTh6b1pWanhhSXM4ekprS3hod2wxWktkSnM1M0VacG1I?=
 =?utf-8?Q?juV2pTK65+CHT3C1a6MTwP80A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9af390-93e0-4a08-a655-08dde693bb3d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:33:53.4705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHxUeKA6FTnD91CJAIWLWu0KshuXao4Fl7nl2J1E82E8y4mgbRStRndDZM0COo+nKfBhK1km/yyR5a8x6pcF5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8575
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

On 8/28/25 1:44 PM, Konstantin Ryabitsev wrote:
> On Wed, Aug 27, 2025 at 02:56:26PM -0700, John Hubbard wrote:
>>> Right, b4 is supposed to be able to help with this as well, but indeed a
>>
>> It really doesn't quite, though.
>>
>> It is true that "base" (git format-patch --base) helps "b4 am" set things
>> up, but then a subsequent "git am" fails due to missing prerequisites.
>>
>> b4 isn't set up to go retrieve those, on its own anyway.
> 
> Sure it is. :)
> 
> Try `b4 shazam -H` on this series.

That is nice, I've updated my mental model of what b4 can do now.

It still fails for this particular series, but it at least tries
quite thoroughly to get the dependencies.

I think this demonstrates a case of pushing even a very capable
tool such as b4, a little too hard, though.

<blueforge> linux-people (nova-next)$ b4 shazam -H "<20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>"
Grabbing thread from lore.kernel.org/all/20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 35 messages in the thread
Analyzing 10 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✗ [PATCH v2 1/8] rust: transmute: add `from_bytes_copy` method to `FromBytes` trait
    + Acked-by: Miguel Ojeda <ojeda@kernel.org> (✓ DKIM/gmail.com)
    + Reviewed-by: John Hubbard <jhubbard@nvidia.com> (✗ DKIM/nvidia.com)
    + Reviewed-by: Benno Lossin <lossin@kernel.org> (✓ DKIM/kernel.org)
  ✗ [PATCH v2 2/8] gpu: nova-core: firmware: add support for common firmware header
  ✗ [PATCH v2 3/8] gpu: nova-core: firmware: process Booter and patch its signature
  ✗ [PATCH v2 4/8] gpu: nova-core: firmware: process the GSP bootloader
    + Reviewed-by: John Hubbard <jhubbard@nvidia.com> (✗ DKIM/nvidia.com)
  ✗ [PATCH v2 5/8] gpu: nova-core: firmware: process and prepare the GSP firmware
  ✗ [PATCH v2 6/8] gpu: nova-core: firmware: use 570.144 firmware
    + Reviewed-by: John Hubbard <jhubbard@nvidia.com> (✗ DKIM/nvidia.com)
  ✗ [PATCH v2 7/8] gpu: nova-core: Add base files for r570.144 firmware bindings
    + Reviewed-by: John Hubbard <jhubbard@nvidia.com> (✗ DKIM/nvidia.com)
  ✗ [PATCH v2 8/8] gpu: nova-core: compute layout of more framebuffer regions required for GSP
  ---
  ✗ BADSIG: DKIM/nvidia.com
---
Total patches: 8
---
 Base: using specified base-commit 331c24e6ce814af2af74bac648d1ac1708873e9c
 Deps: looking for dependencies matching 39 patch-ids
 Deps: Applying prerequisite patch: [PATCH v5 1/7] rust: page: implement BorrowedPage
 Deps: Applying prerequisite patch: [PATCH v5 2/7] rust: alloc: vmalloc: implement Vmalloc::to_page()
 Deps: Applying prerequisite patch: [PATCH v5 3/7] rust: alloc: implement VmallocPageIter
 Deps: Applying prerequisite patch: [PATCH v5 4/7] rust: page: define trait AsPageIter
 Deps: Applying prerequisite patch: [PATCH v5 5/7] rust: alloc: kbox: implement AsPageIter for VBox
 Deps: Applying prerequisite patch: [PATCH v2 4/6] rust: alloc: layout: implement ArrayLayout::size()
 Deps: Applying prerequisite patch: [PATCH v4 7/7] rust: alloc: kvec: implement AsPageIter for VVec
 Deps: Applying prerequisite patch: [PATCH v3 1/5] rust: dma: implement DataDirection
 Deps: Applying prerequisite patch: [PATCH v3 2/5] rust: dma: add type alias for bindings::dma_addr_t
 Deps: Applying prerequisite patch: [PATCH v3 3/5] rust: scatterlist: Add abstraction for sg_table
 Deps: Applying prerequisite patch: [PATCH v3 4/5] samples: rust: dma: add sample code for SGTable
 Deps: Applying prerequisite patch: [PATCH 4/4] MAINTAINERS: rust: dma: add scatterlist files
 Deps: Applying prerequisite patch: [PATCH v10] rust: transmute: Add methods for FromBytes trait
 Deps: Applying prerequisite patch: [PATCH] MAINTAINERS: Add website of Nova GPU driver
 Deps: Applying prerequisite patch: [PATCH 2/7] rust: gpu: update ARef and AlwaysRefCounted imports from sync::aref
 Deps: Applying prerequisite patch: [PATCH 01/18] gpu: nova-core: register: minor grammar and spelling fixes
 Deps: Applying prerequisite patch: [PATCH v2 02/19] gpu: nova-core: register: fix typo
 Deps: Applying prerequisite patch: [PATCH v2 04/19] gpu: nova-core: register: improve documentation for basic registers
 Deps: Applying prerequisite patch: [PATCH v2 05/19] gpu: nova-core: register: simplify @leaf_accessor rule
 Deps: Applying prerequisite patch: [PATCH v2 06/19] gpu: nova-core: register: remove `try_` accessors for relative registers
 Deps: Applying prerequisite patch: [PATCH 06/18] gpu: nova-core: register: move OFFSET declaration to I/O impl block
 Deps: Applying prerequisite patch: [PATCH 07/18] gpu: nova-core: register: fix documentation and indentation
 Deps: Applying prerequisite patch: [PATCH v2 09/19] gpu: nova-core: register: add missing doccomments for fixed registers I/O accessors
 Deps: Applying prerequisite patch: [PATCH 09/18] gpu: nova-core: register: add fields dispatcher internal rule
 Deps: Applying prerequisite patch: [PATCH v2 11/19] gpu: nova-core: register: improve `Debug` implementation
 Deps: Applying prerequisite patch: [PATCH 11/18] gpu: nova-core: register: generate correct `Default` implementation
 Deps: Applying prerequisite patch: [PATCH 12/18] gpu: nova-core: register: split @io rule into fixed and relative versions
 Deps: Applying prerequisite patch: [PATCH 13/18] gpu: nova-core: register: use #[inline(always)] for all methods
 Deps: Applying prerequisite patch: [PATCH v2 15/19] gpu: nova-core: register: redesign relative registers
 Deps: Applying prerequisite patch: [PATCH v2 16/19] gpu: nova-core: falcon: add distinct base address for PFALCON2
 Deps: Applying prerequisite patch: [PATCH v2 17/19] gpu: nova-core: register: add support for register arrays
 Deps: Applying prerequisite patch: [PATCH v2 18/19] gpu: nova-core: falcon: use register arrays for FUSE registers
 Deps: Applying prerequisite patch: [PATCH v2 19/19] gpu: nova-core: register: add support for relative array registers
 Deps: Applying prerequisite patch: [PATCH v2] gpu: nova-core: falcon: align DMA transfers to 256 bytes
 Deps: Applying prerequisite patch: [PATCH v4 1/2] rust: add `Alignment` type
 Deps: Applying prerequisite patch: [PATCH v3 2/2] gpu: nova-core: use Alignment for alignment-related operations
Magic: Preparing a sparse worktree
Unable to cleanly apply series, see failure log below
---
Applying: rust: page: implement BorrowedPage
Applying: rust: alloc: vmalloc: implement Vmalloc::to_page()
Applying: rust: alloc: implement VmallocPageIter
Applying: rust: page: define trait AsPageIter
Applying: rust: alloc: kbox: implement AsPageIter for VBox
Applying: rust: alloc: layout: implement ArrayLayout::size()
Applying: rust: alloc: kvec: implement AsPageIter for VVec
Applying: rust: dma: implement DataDirection
Applying: rust: dma: add type alias for bindings::dma_addr_t
Patch failed at 0009 rust: dma: add type alias for bindings::dma_addr_t
error: patch failed: drivers/gpu/nova-core/falcon.rs:4
error: drivers/gpu/nova-core/falcon.rs: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"
---
Not fetching into FETCH_HEAD
<blueforge> linux-people (nova-next)$ git am --show-current-patch=diff
fatal: Resolve operation not in progress, we are not resuming.
<blueforge> linux-people (nova-next)$ 


thanks,
-- 
John Hubbard

