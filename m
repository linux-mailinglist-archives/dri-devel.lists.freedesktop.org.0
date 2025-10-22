Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76353BFA7D9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 09:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C5F10E6C5;
	Wed, 22 Oct 2025 07:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JaqMkq4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDAD10E6C5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:16:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9S7UYWOS4lwNCJWm91C04FR+cF/zm7ckqUj2P6JqY9bIJuZ/5hC7qx35pARxbMh4+oBv5R5FyY63iAEamAjnEcyHcIiAMUymhUAUujZFNNen4zJjrMdZCXLTwUCClyK4fNMIa6O8+CJXz5iZwrux0k/BQKYoQffEQMY4YY0BLYi9MswQa/+MDAGHo2fbAjLOyFY2PJ6fqV0mw9OfJ0ANOw9ETh81G+jPaBgoKwb4DfXhCT9Fr8VtFnpBbVoDHXgXd6kAuUbg3PsNHpwAXURa4Jpdj4s2K02tdGWUY8tBrjOUNNO6gLY2z5wm6Ud41h+PoEfuMqkCoFqPerX+6E5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIwSNbbYQh5xTE41IAzvsv3oTGPOKvqQtfc+W82GRtc=;
 b=JwkRnSMZNtGFHycWbuwUnryIFK87uKriu4V0MI64O4L/pdB1Wn/988cBqnTVFPBR4XUnRnmNOsE6nJ422Cu0RNdX8uSLl9+pX4Kh6EjeGH0lmTnkYSo1YFUfUm05mdmBhBmwJ0Ub+EDwmWIogtHr5omKSm3y4amNJEIeRlwTkntzDjgitL4hMzrgOvfsTzOUoOtcRTu/xbda7R21HBNC8AhxNSa1wvD/bhMOw4dXdwcJPh+MTorl8LpyYknu2He2eiPQ9jqzKa5UtFBIMQDP366kE7gdDeKCZl9990jo9TcQ+c+ws0Mzu7ayqXUmCgRajiYihGVAbbA/9yFsgGMheA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIwSNbbYQh5xTE41IAzvsv3oTGPOKvqQtfc+W82GRtc=;
 b=JaqMkq4/Krg0otKBh6U3r4rXjGyuLR7vLOaiEq4X8/uqTLl3kv/JcouEl8r1M+QxTGAtr/8VESzGJ43TDLlwDNhulXv6xyXKMhxZpQpV5FP/Os4NiWFzDrD1ZRc4BwyNtg8vE1JhnKa9u1SvJh/bJioETf2MpppeKQbNi4Ni0uj8VZKfk3H9gcDM1oHp2urkIwehevZtbuxam6TfdifxbfpY7bgbtlMJK1day96fqmllxztcHdLNwfOlSMAXuG9WDmlCH52eqq8upR0dpaSTHNQpLvI4VU9aa/w7PHxZNpiGEdpJaYvSAqyXMJa0F5Kg0VvdvmsD9L8uDA4bFcY4zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SN7PR12MB7021.namprd12.prod.outlook.com (2603:10b6:806:262::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 07:16:16 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 07:16:16 +0000
Message-ID: <3d58b839-a24a-4481-9687-3083541b80a1@nvidia.com>
Date: Wed, 22 Oct 2025 18:16:08 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
To: Zi Yan <ziy@nvidia.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 akpm@linux-foundation.org, David Hildenbrand <david@redhat.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-12-balbirs@nvidia.com>
 <20251019081954.luz3mp5ghdhii3vr@master>
 <62073ca1-5bb6-49e8-b8d4-447c5e0e582e@nvidia.com>
 <97796DEE-E828-4B12-B919-FCA2C86756DE@nvidia.com>
 <debc988e-45cc-481d-b688-a5764647f3e5@nvidia.com>
 <D00196E8-E812-41CF-A2F8-A38251161ACA@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <D00196E8-E812-41CF-A2F8-A38251161ACA@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SN7PR12MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 739ba5e0-4c8b-4705-1d5b-08de113ae3c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEpBZS9EbE95OUR3dkh0SU9oYUJwdTBDZFhHQUdlRklzbHZibjhjbXlhT3k5?=
 =?utf-8?B?UGxCTmtPUHo3VG1lVWZ6MjNEdkxoaWdHc0U4SnhzL2Y0bkFKZlExVVdUMEJx?=
 =?utf-8?B?UnIwcFlyRlZBTDBhaldMbEtnWFl1VGNmZExIVzBMdFMzanpnRXBGTkRjVUts?=
 =?utf-8?B?a1BleEwwOFdteW11c0pmK3B5Y3JIYXQrbXZtQTdhWEh1ZGYzWFNKeTB3ZExJ?=
 =?utf-8?B?OVJYMGlPc1NkUTNwd20vUVpyaVE4R0p2ZFF1MWsxZmhybnVtM0ZEK2VnZXVM?=
 =?utf-8?B?SVNhTEdSQzBXRlNyRkc2dElNQ3doYU5zbkp2UzlXdDQvL1Y0eHYwWWI5UC9C?=
 =?utf-8?B?SWQzQUF1eXc2WDlvUTFtWEZsSDJXRnJINDVIcGFOcmNiOUlHOHJUeDMxUUpo?=
 =?utf-8?B?SW1YbW5jYmhCN21kdTFScWZYQnBIWVVSckVta0hJb3NyeUVieVZ0ZWJjak5s?=
 =?utf-8?B?NFJTQVlERmFqNDlLUWcvbzEzRFBpblE3MmJhUVJ1VEJmaFRyR3FZaUdXWGl6?=
 =?utf-8?B?R2FKU3lkUUN3Q01hWHFrWSs4UnMyTWJVNWJ5YWtGYTh0K2ViZis1SUUrUlBv?=
 =?utf-8?B?SzhYa1Q1NnlUTEViWmxDNGhxMTRJQnZOSU1Uamc0aW1FN0UzSmpVREZoRS9w?=
 =?utf-8?B?N0V6KzVVMEFvdE9XNlNVdkdoQnM1R25VY1haUEdUU3o5L2VRZHhNZk5VTnpy?=
 =?utf-8?B?YXc5YjM4NDFsMkJlcnB4Yk5EYmk5UlluOFppRWxLbElPSUU1R2RDdWZDTFlD?=
 =?utf-8?B?RHMvZ0xmeGJEaWlaeUszSFNjQjk0Z25uVzlBd29kem5JMHo2clVBVDZjUWFY?=
 =?utf-8?B?ZkNsckY3aU9jM2t5aXUxeG1xRXZOTGRUSVR3VENaVHVQUU4yQnRqVWVQbVE4?=
 =?utf-8?B?L01XYVBGV2h4VjMremo1VjdiOXZzSUhNaGNHcDgyOGJHUzFsNHQzS0JkTVly?=
 =?utf-8?B?S05KY1A2NGRoeklVYmVJd1k0K1NDWkkrZnk4U0tSUStOK3J4emV3S1NjcVRN?=
 =?utf-8?B?dzJqOEVVUzJRaE9OTXk4VnZ1dVlJUnlseDA5Z3dkcDQxN2QrNldtYnl5TnRx?=
 =?utf-8?B?RUMySTF1QzZxbTl6RnpaKzNGNnRtajJsU2xuRHdyb2trZnVKcVVwd2xBcGt1?=
 =?utf-8?B?dE9LUlJYWFBVU043bEFZdU1NVE5TY005cS9aSnFNOXFDNUxRREFtN25SV2g5?=
 =?utf-8?B?dC9CcGkzQ0phbncxUFllQ0duRy9wOVJpb0VhUHkvZzUxS0djWVpLalUrN2VT?=
 =?utf-8?B?dy9sSklMbm9zTW5LZzcweC9VZ3FMRG9yd0VjZEN6YUJZdDhqWjRndENva3FB?=
 =?utf-8?B?SzNIRW9mb2ZrTFZ5WDliWGN6YkFkZmc5TWoyREtlcHJlNlIwS0NEZHhUUFFE?=
 =?utf-8?B?NXNXSkdUUGxZejVrTWRNNGdQekNQZDcwcXU2RS9PNURkdFordTNPRE1wUDBu?=
 =?utf-8?B?aDBqM3I1THdDbUpCc2NLbjdnVWNyWmlMaTE4WHh3SXBkcXlCaGN5N2FpY1Uv?=
 =?utf-8?B?YTdHQ1ZzdjBtZE5MK3U5YVkyaFEvTTRBNUJ4L3ArbXdadDF6WWdLeEVvdmNX?=
 =?utf-8?B?RjZ0bTJNdWVEUytRV2J1NXBxdlBjQitEazZFRWlXNDBzTnlmV04zYXNPaGhT?=
 =?utf-8?B?aWlmQTBqcnZ4NmV2WGFoRWFyeGcxT0dCZzkrWlluSDhZYmYxbkxTR0FBTXVL?=
 =?utf-8?B?alFFS3hncUs5QlhvL2Q2V29wYlh3NW9yN2VKNkt5Smo5bUNGU1J3Y2F0UVlk?=
 =?utf-8?B?MW53dU13U0tabHY4aldpU1NCb01JdENCNmFJQjFuY0RENXFiMkNVaC9YVks1?=
 =?utf-8?B?UzJrbUxMbzZOdEx1MENwU29RZC9CSldHR2l3U3BiNE9tZmtWMzUwMUJUamtv?=
 =?utf-8?B?QldFMmRDZEVWQm1JV2xhTHNqc0J1UURJenczanF0dy9BWDlNUmZTR1RyZEtF?=
 =?utf-8?Q?W8A0n0qgHhPoKZPMstsTD6jdz+ZPK3ae?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlVhNTZjOFBZaStQRmtKZlpZVUVFODU1all4aHFvRWc5eGg3ZmRIbzNoOERv?=
 =?utf-8?B?b2hkeWdtYkJURFBCbGJVb2duNXJ5b0djbHlOejk0NnpZa2w4dE82a0Z3NDNu?=
 =?utf-8?B?UzdBVkhEc0RXNDB1cVkyT1l1VVI4Q2ozeXlrdmtUTktyM1l0U1NvaFFyS0h2?=
 =?utf-8?B?N3NvMVpzNDVhU0NhOUU5WnNSVE9VREdHMjZRWnpMK09UTWdxeCtPN1ZGT1Nj?=
 =?utf-8?B?L3JSazFIWDBnbFcyMGJsOGI4YStwSm0waTNqdTFuWmp5Q0J2VjBMQmhRTUxO?=
 =?utf-8?B?a25LbmtwNEhQL2hmNW9pY2xHeGVmakFSbVlTaUladEF6TlZEc2N4K3V4S09E?=
 =?utf-8?B?VmlDYlBhbElReWt2VXcvSnkvRm5PSlBHeGVkQWFyakMvMlpEczlkWXFRMWZx?=
 =?utf-8?B?QytTeE15L25VNENteWpkUmdheFdObTgzclNuUG9GOVF0ZzBLNVBMdUlSQmVs?=
 =?utf-8?B?RDVHUTRnZG9wb0hvdkl3Sk9PTUJWaG4yb2Q2RlMzN1EvWjRZN1JhaytjZUFH?=
 =?utf-8?B?cGNiVVJKOGg1dXY5NlNJM1AvM2I5T2swWk1vY0o5aVFMSHZ5K0g0SU56NkhC?=
 =?utf-8?B?M1dwdGV0ZFg4Z3IrRUlqcVJ2UWo0KytpcG95S2dndjR5bmpUSjhvSUgySkJv?=
 =?utf-8?B?WHhTVVJqb3lQTGxiZ21JSlBybEtsdVh5UE8rM3FvL3BobjVweWRud1JRdXQ5?=
 =?utf-8?B?YTBTNjd0TDlscTVxRW5UeXY0UjU4alZoNThkWnRacnRIblQ3T0pPMW4zQVpi?=
 =?utf-8?B?R1VjdDFtSmFFbUt5UnJqNUd3U1FubXdhaUFyaUEwc2NWdStUaTJmd1FOeFVn?=
 =?utf-8?B?ditGN0NZVEpJb3E3Y09BS2M5TmhSN3dkRUFOaTh0cnJVRUd6aXI0dlY0bzRO?=
 =?utf-8?B?RjRRR2JKcCtsVUlZZTFGWUtFOHgzTW1yTnNya3lUZkZ3TmVTMHBVaUd4VVZV?=
 =?utf-8?B?VFN2UEF6aHRaZm8zeWVkYlpiZGRndnFySnRtTERUakJGMDlaOHRXbGRRTVZC?=
 =?utf-8?B?VG9rczJwTzVXVFVlRjk2NE5kOVpWdVBkdTZLanVxQzNZVVUxd0RDSXM1V3cy?=
 =?utf-8?B?dFlEcGNOTHRWSGNGejY3c3NSZ0NQZnhIZzdiTUxrUnJBdDJIaW1WdlRkMkg0?=
 =?utf-8?B?Wkd1clJ4dDQ5UklndmMzRW9wMWVlV0VuQXhEeW9WdVJKVGNrV0toM0Juekxm?=
 =?utf-8?B?QzlBUUMrUVVma2RGZFdWTmt6dFhvckNNNUoveFNHamZSdE0zMENiRXdpSEZX?=
 =?utf-8?B?c1R0OEdOTllmaU4wanRZQmFqemFUQS84RVBRSjZQbnVPNDI3R1FobnlNeHVu?=
 =?utf-8?B?VFRJL1VDWVBoWTJHYXRTUnVVNExKdXRhZE5QTXBUc3ZsbVdaRFhTQnF5Wmkx?=
 =?utf-8?B?WEJFanQ4M3dEUW1iYzZDcXlwcFUzQ1FvS1hjbzB6L3lqc1kxM1RncFl1NzVv?=
 =?utf-8?B?Vm1HWHh4ZXIySVU3d2EyT0xIMWlHejZMYVNYajNYdk5VaklGTUhlVk5sYnM3?=
 =?utf-8?B?b2d4ZkZUcGZ5ajJTY09ScStZajlsdm9iSXNpSDVJT1NsZHRjYXVBV1VMWEFi?=
 =?utf-8?B?TVJ2dkRiRS9lRlRja1NlbzRGcjAvdUFMSlFlbmE4ckg1aGUxWnRJWXl5L3Zp?=
 =?utf-8?B?T3VVMkNDS3k4cEhpeER4SVNnT05USmE5MmpoSDdLcW16TEdnNnBKU2Z1bnBz?=
 =?utf-8?B?SXZIRE1rK2tua0pOekpRQU1NVjJxTnhxanBQalJvSitXcitmN3V2eHRoOXcx?=
 =?utf-8?B?dk5GT2E2ZDlNamZ6QmU0VHhablZqMmhaaUVJOEl4Mlg0VDhmTkdQRVlJeDBI?=
 =?utf-8?B?TjVrTVEzTVM0VCtZblB6bzJMTzdPZk15NUtkWTlOeTJiMEd6YWhjd3ZQOGkr?=
 =?utf-8?B?b2dhVm9CNUFyTDJXMzh6RXdMdXQwbWlIamNlanQ4UDFxSVhJTmZiZXJtbGQw?=
 =?utf-8?B?RUdaeVVvNCthRnFSdFJLdFllWWVIYkh0VXpWYXFpdHduVHdPNTVrcWxWL2Y5?=
 =?utf-8?B?NzM0dWZZY3k5ZmYzNU9FQUhteXdzZUhJaHkrSHRKMUp4Szk5ZmxScXcwREE5?=
 =?utf-8?B?NHUrcVVVV2R4ZzhzVlFSL0RVOFNlMHFLQ3g5U0hYWEp0Zkk5ejdRZGIyWUFs?=
 =?utf-8?B?eDhKM2Z1NEVzSnBlSWRaNG1wMFlaVnBxandmOFViNUtibDRQSFBDSkhVd0pz?=
 =?utf-8?Q?5XcI+8kSR4SzZOrYbAWXUa3mdio81tHxmxtojetiZlfS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 739ba5e0-4c8b-4705-1d5b-08de113ae3c1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:16:16.1854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIt80NPbtiw0Zx6VfB4TiH9TDq8uFYFYmQ45bFANdGW+AEd3JxK4GhvkxdA3PPKiGamQGyOUwPBwOYnI80JrSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7021
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

On 10/22/25 13:59, Zi Yan wrote:
> On 21 Oct 2025, at 17:34, Balbir Singh wrote:
> 
>> On 10/20/25 09:59, Zi Yan wrote:
>>> On 19 Oct 2025, at 18:49, Balbir Singh wrote:
>>>
>>>> On 10/19/25 19:19, Wei Yang wrote:
>>>>> On Wed, Oct 01, 2025 at 04:57:02PM +1000, Balbir Singh wrote:
>>>>> [...]
>>>>>> static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>> 		struct page *split_at, struct page *lock_at,
>>>>>> -		struct list_head *list, bool uniform_split)
>>>>>> +		struct list_head *list, bool uniform_split, bool unmapped)
>>>>>> {
>>>>>> 	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>>>>>> 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>>>> @@ -3765,13 +3757,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>> 		 * is taken to serialise against parallel split or collapse
>>>>>> 		 * operations.
>>>>>> 		 */
>>>>>> -		anon_vma = folio_get_anon_vma(folio);
>>>>>> -		if (!anon_vma) {
>>>>>> -			ret = -EBUSY;
>>>>>> -			goto out;
>>>>>> +		if (!unmapped) {
>>>>>> +			anon_vma = folio_get_anon_vma(folio);
>>>>>> +			if (!anon_vma) {
>>>>>> +				ret = -EBUSY;
>>>>>> +				goto out;
>>>>>> +			}
>>>>>> +			anon_vma_lock_write(anon_vma);
>>>>>> 		}
>>>>>> 		mapping = NULL;
>>>>>> -		anon_vma_lock_write(anon_vma);
>>>>>> 	} else {
>>>>>> 		unsigned int min_order;
>>>>>> 		gfp_t gfp;
>>>>>> @@ -3838,7 +3832,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>> 		goto out_unlock;
>>>>>> 	}
>>>>>>
>>>>>> -	unmap_folio(folio);
>>>>>> +	if (!unmapped)
>>>>>> +		unmap_folio(folio);
>>>>>>
>>>>>> 	/* block interrupt reentry in xa_lock and spinlock */
>>>>>> 	local_irq_disable();
>>>>>> @@ -3925,10 +3920,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>
>>>>>> 			next = folio_next(new_folio);
>>>>>>
>>>>>> +			zone_device_private_split_cb(folio, new_folio);
>>>>>> +
>>>>>> 			expected_refs = folio_expected_ref_count(new_folio) + 1;
>>>>>> 			folio_ref_unfreeze(new_folio, expected_refs);
>>>>>>
>>>>>> -			lru_add_split_folio(folio, new_folio, lruvec, list);
>>>>>> +			if (!unmapped)
>>>>>> +				lru_add_split_folio(folio, new_folio, lruvec, list);
>>>>>>
>>>>>> 			/*
>>>>>> 			 * Anonymous folio with swap cache.
>>>>>> @@ -3959,6 +3957,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>> 			__filemap_remove_folio(new_folio, NULL);
>>>>>> 			folio_put_refs(new_folio, nr_pages);
>>>>>> 		}
>>>>>> +
>>>>>> +		zone_device_private_split_cb(folio, NULL);
>>>>>> 		/*
>>>>>> 		 * Unfreeze @folio only after all page cache entries, which
>>>>>> 		 * used to point to it, have been updated with new folios.
>>>>>> @@ -3982,6 +3982,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>
>>>>>> 	local_irq_enable();
>>>>>>
>>>>>> +	if (unmapped)
>>>>>> +		return ret;
>>>>>
>>>>> As the comment of __folio_split() and __split_huge_page_to_list_to_order()
>>>>> mentioned:
>>>>>
>>>>>   * The large folio must be locked
>>>>>   * After splitting, the after-split folio containing @lock_at remains locked
>>>>>
>>>>> But here we seems to change the prerequisites.
>>>>>
>>>>> Hmm.. I am not sure this is correct.
>>>>>
>>>>
>>>> The code is correct, but you are right in that the documentation needs to be updated.
>>>> When "unmapped", we do want to leave the folios locked after the split.
>>>
>>> Sigh, this "unmapped" code needs so many special branches and a different locking
>>> requirement. It should be a separate function to avoid confusions.
>>>
>>
>> Yep, I have a patch for it, I am also waiting on Matthew's feedback, FYI, here is
>> a WIP patch that can be applied on top of the series
> 
> Nice cleanup! Thanks.
> 
>>
>> ---
>>  include/linux/huge_mm.h |   5 +-
>>  mm/huge_memory.c        | 137 ++++++++++++++++++++++++++++++++++------
>>  mm/migrate_device.c     |   3 +-
>>  3 files changed, 120 insertions(+), 25 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index c4a811958cda..86e1cefaf391 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -366,7 +366,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
>>
>>  bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
>>  int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>> -		unsigned int new_order, bool unmapped);
>> +		unsigned int new_order);
>> +int split_unmapped_folio_to_order(struct folio *folio, unsigned int new_order);
>>  int min_order_for_split(struct folio *folio);
>>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>>  bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>> @@ -379,7 +380,7 @@ int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
>>  static inline int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>  		unsigned int new_order)
>>  {
>> -	return __split_huge_page_to_list_to_order(page, list, new_order, false);
>> +	return __split_huge_page_to_list_to_order(page, list, new_order);
>>  }
>>
>>  /*
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 8c82a0ac6e69..e20cbf68d037 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3711,7 +3711,6 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>   * @lock_at: a page within @folio to be left locked to caller
>>   * @list: after-split folios will be put on it if non NULL
>>   * @uniform_split: perform uniform split or not (non-uniform split)
>> - * @unmapped: The pages are already unmapped, they are migration entries.
>>   *
>>   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
>>   * It is in charge of checking whether the split is supported or not and
>> @@ -3727,7 +3726,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>   */
>>  static int __folio_split(struct folio *folio, unsigned int new_order,
>>  		struct page *split_at, struct page *lock_at,
>> -		struct list_head *list, bool uniform_split, bool unmapped)
>> +		struct list_head *list, bool uniform_split)
>>  {
>>  	struct deferred_split *ds_queue;
>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>> @@ -3777,14 +3776,12 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>  		 * is taken to serialise against parallel split or collapse
>>  		 * operations.
>>  		 */
>> -		if (!unmapped) {
>> -			anon_vma = folio_get_anon_vma(folio);
>> -			if (!anon_vma) {
>> -				ret = -EBUSY;
>> -				goto out;
>> -			}
>> -			anon_vma_lock_write(anon_vma);
>> +		anon_vma = folio_get_anon_vma(folio);
>> +		if (!anon_vma) {
>> +			ret = -EBUSY;
>> +			goto out;
>>  		}
>> +		anon_vma_lock_write(anon_vma);
>>  		mapping = NULL;
>>  	} else {
>>  		unsigned int min_order;
>> @@ -3852,8 +3849,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>  		goto out_unlock;
>>  	}
>>
>> -	if (!unmapped)
>> -		unmap_folio(folio);
>> +	unmap_folio(folio);
>>
>>  	/* block interrupt reentry in xa_lock and spinlock */
>>  	local_irq_disable();
>> @@ -3954,8 +3950,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>  			expected_refs = folio_expected_ref_count(new_folio) + 1;
>>  			folio_ref_unfreeze(new_folio, expected_refs);
>>
>> -			if (!unmapped)
>> -				lru_add_split_folio(folio, new_folio, lruvec, list);
>> +			lru_add_split_folio(folio, new_folio, lruvec, list);
>>
>>  			/*
>>  			 * Anonymous folio with swap cache.
>> @@ -4011,9 +4006,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>
>>  	local_irq_enable();
>>
>> -	if (unmapped)
>> -		return ret;
>> -
>>  	if (nr_shmem_dropped)
>>  		shmem_uncharge(mapping->host, nr_shmem_dropped);
>>
>> @@ -4057,6 +4049,111 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>  	return ret;
>>  }
>>
>> +/*
>> + * This function is a helper for splitting folios that have already been unmapped.
>> + * The use case is that the device or the CPU can refuse to migrate THP pages in
>> + * the middle of migration, due to allocation issues on either side
>> + *
>> + * The high level code is copied from __folio_split, since the pages are anonymous
>> + * and are already isolated from the LRU, the code has been simplified to not
>> + * burden __folio_split with unmapped sprinkled into the code.
> 
> I wonder if it makes sense to remove CPU side folio from both deferred_split queue
> and swap cache before migration to further simplify split_unmapped_folio_to_order().
> Basically require that device private folios cannot be on deferred_split queue nor
> swap cache.
> 

This API can be called for non-device private folios as well. Device private folios are
already not on the deferred queue. The use case is

1. Migrate a large folio page from CPU to Device
2. SRC - CPU has a THP (large folio page)
3. DST - Device cannot allocate a large page, hence split the SRC page


[...]


Thanks for the review!
Balbir
