Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73397BF8F1B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 23:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE3510E34C;
	Tue, 21 Oct 2025 21:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EW+EPY+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011002.outbound.protection.outlook.com [40.107.208.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA67B10E315
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 21:34:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAeEC7wJTR4jfejq8csV5kwKlhfjw0fmLW8ZX70oHE1OzWG0Xu9sfxHUCcCDpIi60CaQZJnjTsEj59meWM65b8KFwyCF4elXtPhUQPYHWA/2lsW8FvsB638uWvljNU+muDoeyvAwFtM5o1X/s+oEeqvNez3VD7DpPpim5Cm0gFBQA2Teo7I7+RjA3y0UYBm/o3e4ThpnBWhItyNXLLxFnl0cPmmqWDjNW28hSQQEEyBVMOMky4N1xPBDwDbncoN28pqn5ZoGY7e/c8JhEcqjEqJpDLCA81iDDxXZkWda2Lg3N9KU7OyONj6xUw2k6uuP76udOYh0N1aa0yPJOytibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOihgv4aMeK3+eyETh1PQBPG233ERddE9kb1Vs4Ua8k=;
 b=Bh2MXscvt9XX6XBQwi5KpW58aOB/8MP4u9d8vsTIEPv9PNfVBH1f78fwS7zsxG55uTwsbuyNmAfndz2HRiMe0EtGmzDAm1Y/tO+zA5acwBpUEQ0dEcDXmLwcI3myq5Ea8gY7q9hLyQI7WIYSvTGETal0xdqwNJ1heZAH+C1IsRZIZ2EpmCU4YnWLV8YWJpsee3KQzH16KMtnjRpTC3xe6SwszkLs7F+ZxP+wCmx6F2ow4+fwdDexqD9oo3209tRXaliJQpd3iTmGrFSjhDMpxP+mkwtaP+4sZnYP9OnazuRTXk/rVokn25vu3wmqPapbOqXpNN/RH/K5VyYL9iy43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOihgv4aMeK3+eyETh1PQBPG233ERddE9kb1Vs4Ua8k=;
 b=EW+EPY+aFi5tPqjS6KZbEkoGZGZsy/mfSD29IrCBvxXq5QPoKQRkiVSYHldY2STp31H+u3TX6GGmaaoRyp++J3DjI8hwkAWYBAp9JFDdmIhWHjGiUhaGuQDjlN+EE46SN6LzRWAll6BOAu/jG3fLAkkSA6AQ7cy+negabLmrrl5HXYt8gXG1wCqBwX1mXSmLfWysrjj7DB3ajPIOVOGYHhazcWFzkTOrAgWT6WIQn7d3bkSfnGxLvy2j8Wy+5klYxgdRASMBtjm/TPgsZtxLmeh/ztC0IKpx90iN96xAQp5Zt0NQfHxpldYL3Fb60Mj5i3FN4Qja0QUIFfYp7QmmYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 21:34:25 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 21:34:25 +0000
Message-ID: <debc988e-45cc-481d-b688-a5764647f3e5@nvidia.com>
Date: Wed, 22 Oct 2025 08:34:17 +1100
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
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <97796DEE-E828-4B12-B919-FCA2C86756DE@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0064.namprd02.prod.outlook.com
 (2603:10b6:a03:54::41) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6c3d20-2f3b-440f-429e-08de10e99b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2hMWE5kTy9jc0ZHV1ZiVXBrK3dUcHV5VmF2RERhcGJkbVBza2tCSXE5dC8z?=
 =?utf-8?B?R2Y4bnpuOWRLSVJxSFRKWGkzYlBvN25sRkZhTzNyWHJBOGtjZlE4N3JGV1Fr?=
 =?utf-8?B?aU1Zcnk3Ty8yK2V6U2ZQQ2RXYkdKWTRvbXNHM3ZTN1ozRE9wWXh3ZndPZWFQ?=
 =?utf-8?B?cnBwampyNjkzdlQ3cllVbVlzWU5HYlRtSGVnenlrbjJBd1cwNThldTlocE0z?=
 =?utf-8?B?WFkrRHk4aGJFS04zMlk0V0p5dWN6bnJjdEtOR09UTjJuRk9FaGUwc2RSRm42?=
 =?utf-8?B?Qm9oMStrZStrR3lSN1VLWGt4VFRjaGZsNXVmejluYmVRdXk2R1hRTTdjc3pE?=
 =?utf-8?B?aHZsYW1LZkowandnNzBvMEZYTlZQQjRIWUo2N1lRUThtZDhKdGdzVzNNbXFI?=
 =?utf-8?B?d3JZOEhPbnVNekIwQTB0NENSR05uaHpmcVhCUmZIYVdpRGk3UWxDQjBiaXRx?=
 =?utf-8?B?RlB4aXVnTm5KYitNTFBKWlpya2VzYzlkUnRYVzJyRzVsQ3ZVRlR6SmtDRGlj?=
 =?utf-8?B?YmRMbFlkWVhtUmJPdEFrMmQxYjUwSGU5R1pEZit5b09Da1VDNDRjZjk5WUV4?=
 =?utf-8?B?bkxwcGZzYlU2aDZ0UW96dUNVYjc5d1ljR3d3c2xTQ01ETzVyV0o3dW1MbHVK?=
 =?utf-8?B?YXJ3NDcwMFpqZzVYNXZ6dXR6bkp0ZC90SU9ZUVZpazBPSjQzaXlUcm0zWTdC?=
 =?utf-8?B?cmltM2JLak1YTStkOEJrSitraVFoNnJKSHhvdWFyR0dqMkxGN21OaFlKN0F2?=
 =?utf-8?B?MTB4TzZqOURmWUdsczBwbmQ3Y2Ztd0NZWTZYZUdGaDZNTCtJNlJ4ZDg1UFZa?=
 =?utf-8?B?MVVROUZEQmdkdGlDLytaRCsrYzZVd2FNTUthL1IzZVNNdGV5aVhUbERvRVF4?=
 =?utf-8?B?UGk2eHlFd1lFOHpjODNWTzl6dUF1QTUwNzlxUFBkMm85MFJTQ2JIUmNvbEd1?=
 =?utf-8?B?Rm5MSUtSRFVFbXBsK2JkeG1kUHVNbjZtWnQ0SVpONlFRdC9EWm1aOHBnRW15?=
 =?utf-8?B?eG1RSHZubjZ4ZnBvUTNVamRIa2M5S1BFMjNkYVkzR1AxOUl1c0xwUFQ5ZFpP?=
 =?utf-8?B?RnV3M1VJV2J0S2Y4Z1EvajNMNGptcFBwUlU1a245dzJXM0Z6WGYyQWU5b1l6?=
 =?utf-8?B?ZVY4dUNRNDVBS05sSVF4TmxRRDVJUmdDSDJ6TVU5ck5WNEtuVklTWTQzUGNm?=
 =?utf-8?B?SG51U0FiSk1oSll5NkYxZWJIWHQ2azhDb2FIbFhKeDBVbklidkxJNXNDVytQ?=
 =?utf-8?B?dXJrV2kvMk1uY0E5N1NETlJ3V2UvWFBKaVhNTVV4N0liaUZwd29hd3JSSkQ2?=
 =?utf-8?B?c3RxeEhmVmZVYTIrWGRQRHJqY0lpYkpQYTEvdWtoU0xtQkZKc1pwVDNsYXNX?=
 =?utf-8?B?NDg1SGFzOHM5ek5qakJEeUhNQkkxaFAxczZ5UjJxZjZRVmc2bHA2c050Mlhp?=
 =?utf-8?B?MnhZN0RYbHZRTlNDeGk0THhrTkFlaXJsYjl4Z2Fyb3Q2WGhWTlByMjJTdms3?=
 =?utf-8?B?ODJ3emFIdkw3V3ByeGU4aFZFTFYva05SSUYzU0ZRWjJuNkdHMXo2cWlLdWRr?=
 =?utf-8?B?L2pzWE4zQjZraTBaYU9yOVJaTUUwekRQMHAwMlUvTVUweC9QNWtHTktrZVc2?=
 =?utf-8?B?QUJxY2s2d0VTRmpEWDd4REZiNmhMd0VPNTFFMkpISkc3OTdUU2toWXYyV00w?=
 =?utf-8?B?L3FVekFvM3VmL1lpUmJKYnRmQnI5NWZkVy9SR2dVVUQyY0M5RDBVeGIzbGxv?=
 =?utf-8?B?ZlB4N0FYOHVVL01CdGxBR25PZG5KWXlxdTZzNFQzeDNhdFlyZFkydzcwV0lT?=
 =?utf-8?B?Mk52Vk1Tekl0S3dYN1M3eTFQSmkrSVVqOUFta0FCUFpIYTBwQWtLWS9TQXRJ?=
 =?utf-8?B?eG1VTC90Z0k4UGVweXRWS0NudDdLbWZzbThPcEozNUkybWVRQTlTVmN2UVpU?=
 =?utf-8?Q?1sh9wdgxFPkLtNxePitOvuOL4lVAv2Hj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGhWenZvK01xOGt0VmVVVnJ2MFRYN3ByekNlV2lxOEp0Q3kwZUNJeXg0K1pu?=
 =?utf-8?B?UHVaQWIwV1JDRVhzaDdza1JsMkNkOFRYNGJVVlowWTVVSS9pYldqclk5bmZ2?=
 =?utf-8?B?UnFiTzN5aGZoSnVXRThBazF4UFl4Wk8yMDFBV0tNL0pETWY0N05BZHk1aTR2?=
 =?utf-8?B?ZjRvMjRmUDFMcXE5a0FaTytRZ2VEK0Q4VmNLQlp6bW5HOHgrbGhKME9IdXpn?=
 =?utf-8?B?Zy8vYmRIMkFTQ3IwQTdDT21EUDlLbytMY0k3eHRtSFB4RjZDbFVnZUZuL1NI?=
 =?utf-8?B?UVNGMUxNMDU5MVcra0pJanBQMENZb21ZMXRaenRKSFBNaElwU0llVGJHcWhN?=
 =?utf-8?B?dGNtQVNidDVDcGhFL1ZvMS83WXhmWEVET0tTNXo3bFMwK3d6aWp6NkVNK1VG?=
 =?utf-8?B?QXZSNVh4NWNCc2RUUWxmRXhzdEZaWkw4SW1jWFQ2NW1xekZzdmVkT3NVTmVD?=
 =?utf-8?B?WlVTcW1uVXJaeXhyZFd4bHBaclRCWEJJZmFUNXJUd0hSRXA3S2dvZFlXdzJG?=
 =?utf-8?B?eitTZkNoYzlnWFVDTUVZTElqSktCbENwdnVRZmRjNkNYNm16N29vVWtmSVZK?=
 =?utf-8?B?Q2dBVWloNmk5RzJIaUhFSHo1TWtkRHpHNlNBTk8zQ2ZTa0lJcXVzUUdvb3Vv?=
 =?utf-8?B?SUNOZTQvOVpkMzhXWG5EakZYekgrMldkTGdSL2NoMlF3NDc1RmRVcTVsVUxh?=
 =?utf-8?B?VS9WRVVEVnR0SHJIM0luMFdCc1ZNRCs0Q05TTjlGcW9TZG5CczBMZzRrM3ow?=
 =?utf-8?B?bDd0N3lnUkRCMWcrcm9NMCsrT2NnMkRIdXk2dGFhajljZXdTWkMwcmVWM05B?=
 =?utf-8?B?VW04MEZPYnRjcHYwa1NPQXlhRDgzWDJsb200WEZ0aXJ1c3h3c1JaandIdity?=
 =?utf-8?B?Uk85WjVnb2V3YnBuamErRmNTdVRhN1ovY0VINVh0SXRjbytoTzJXbHU0ZGg0?=
 =?utf-8?B?b2syN050aHU2bWdKRU1ndENTWUlIZlJtZmpuVU5yeEQ2dDRNRlZEbUFDL0Uv?=
 =?utf-8?B?MGE0NVlYN0g1eUtaU0NqSzE4dEtWaGFySDhVNGQ1dHVLazVrR2JWVzUydER2?=
 =?utf-8?B?NkIreUM2TjZEQ251MG5XdUkwT2VBY0lxL3BIS2VMYmErVWdST2Fuc04vckNy?=
 =?utf-8?B?YVJjM1FZQmdrczRJU2c5UWtVTmlKSC85elRoc2I5VFhLWUhRaFkvV29PaHlS?=
 =?utf-8?B?b29YVmJyUHFpbWViRjVWYmVxWEppVnk5LytDeVhGQWlEMmI0ajRDUTVkZUNs?=
 =?utf-8?B?VjBndjl2bHRDeXBzcWx1eVJKSzA5RithcEhCWU01MkFjYVo4Sm45MVZKSVht?=
 =?utf-8?B?WHVVeDd2aTNhVG1ZNjRqS2dTenpxenQ0OGprY3JhTU5id250L1YrZHdUSVJw?=
 =?utf-8?B?a3pQSUw1ampVdmJaTENpL2tQVTZwNUUrSkNzUE0wc0pZRHZXZ2k0YkdwV3J1?=
 =?utf-8?B?RkNwOWR4VGw2NjR0UkNrZ1BrWHFMZm43WVNSVGxPNXZ2UFNKUzAwc0ZCWFNs?=
 =?utf-8?B?clN5RklzZUkrNjVtWDdRNW5sU0NwRE9YeTB0SFAySEY5Uk1WZDJlUDQ0L1U3?=
 =?utf-8?B?Z3kvWXVYTFFjcTROMnZNcnp4anZ6Wkg0d1BMakVoeXkrYTV4WXlRWW5OZ0VB?=
 =?utf-8?B?bGtWUUorMWt1K2c4bk5tN0NoU0ZsbHhEcHAwVndEWEhCcTFQUFNmb3JIZllE?=
 =?utf-8?B?SVpKeXR5VmZpYTEwSitYaVZmU29DbW8vallLeUV4dHk2d2YxeU0zSm5Pency?=
 =?utf-8?B?WW02VUNxVnBJZFpQMlpLT1EwWU9KSmZzMXB2TDAwcmFWUmJBYlpWSThmUUMx?=
 =?utf-8?B?bUhITmVyeER5OHlMbi9RN2tYWlZnZEppUCsvWlFFQUNONmdWOW5NaGNtTnox?=
 =?utf-8?B?dkVzQm1vMjdLQXdKYlhHNVNOY3F2UXJZYjFDMlVnUlBWd2x4QjcyazdaaFVm?=
 =?utf-8?B?cFBVd2R6bXd3K1ZoR1lTWTMza3BzYm82bUx5cnRlT0RMRElIdVpTQ3VFczBl?=
 =?utf-8?B?eHN5S1dVOUI4Ym94RVFua1NRcU1HRWJLeDZXNi9DakFDNStyWDJKWVZIdkFw?=
 =?utf-8?B?ZDZhZVBEa0xZbFJMVXZ0QWdMSWdQV2I2V0dXNlFLZW1Vc1c2M1I5ZjdLd3hW?=
 =?utf-8?B?VUtGTWl2bFdQQkEraVBNYWpNVE8rcnRjK3hFN2ZOcmcvZUYvazhxdlRuV3kx?=
 =?utf-8?Q?zoccJc6+rrRs16R7XEuLDTJOP2bxOQqQhJznqOSjwNVO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6c3d20-2f3b-440f-429e-08de10e99b6c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 21:34:25.6462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUDMLmv8Vj6GNUm/PYkM1pgUlREBfyqZ3oSCt0yrhkAbL+9gPcy95ocT2gG/M09T1AjtY+8DCskApqrgUBa6jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996
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

On 10/20/25 09:59, Zi Yan wrote:
> On 19 Oct 2025, at 18:49, Balbir Singh wrote:
> 
>> On 10/19/25 19:19, Wei Yang wrote:
>>> On Wed, Oct 01, 2025 at 04:57:02PM +1000, Balbir Singh wrote:
>>> [...]
>>>> static int __folio_split(struct folio *folio, unsigned int new_order,
>>>> 		struct page *split_at, struct page *lock_at,
>>>> -		struct list_head *list, bool uniform_split)
>>>> +		struct list_head *list, bool uniform_split, bool unmapped)
>>>> {
>>>> 	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>>>> 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>> @@ -3765,13 +3757,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>> 		 * is taken to serialise against parallel split or collapse
>>>> 		 * operations.
>>>> 		 */
>>>> -		anon_vma = folio_get_anon_vma(folio);
>>>> -		if (!anon_vma) {
>>>> -			ret = -EBUSY;
>>>> -			goto out;
>>>> +		if (!unmapped) {
>>>> +			anon_vma = folio_get_anon_vma(folio);
>>>> +			if (!anon_vma) {
>>>> +				ret = -EBUSY;
>>>> +				goto out;
>>>> +			}
>>>> +			anon_vma_lock_write(anon_vma);
>>>> 		}
>>>> 		mapping = NULL;
>>>> -		anon_vma_lock_write(anon_vma);
>>>> 	} else {
>>>> 		unsigned int min_order;
>>>> 		gfp_t gfp;
>>>> @@ -3838,7 +3832,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>> 		goto out_unlock;
>>>> 	}
>>>>
>>>> -	unmap_folio(folio);
>>>> +	if (!unmapped)
>>>> +		unmap_folio(folio);
>>>>
>>>> 	/* block interrupt reentry in xa_lock and spinlock */
>>>> 	local_irq_disable();
>>>> @@ -3925,10 +3920,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>
>>>> 			next = folio_next(new_folio);
>>>>
>>>> +			zone_device_private_split_cb(folio, new_folio);
>>>> +
>>>> 			expected_refs = folio_expected_ref_count(new_folio) + 1;
>>>> 			folio_ref_unfreeze(new_folio, expected_refs);
>>>>
>>>> -			lru_add_split_folio(folio, new_folio, lruvec, list);
>>>> +			if (!unmapped)
>>>> +				lru_add_split_folio(folio, new_folio, lruvec, list);
>>>>
>>>> 			/*
>>>> 			 * Anonymous folio with swap cache.
>>>> @@ -3959,6 +3957,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>> 			__filemap_remove_folio(new_folio, NULL);
>>>> 			folio_put_refs(new_folio, nr_pages);
>>>> 		}
>>>> +
>>>> +		zone_device_private_split_cb(folio, NULL);
>>>> 		/*
>>>> 		 * Unfreeze @folio only after all page cache entries, which
>>>> 		 * used to point to it, have been updated with new folios.
>>>> @@ -3982,6 +3982,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>
>>>> 	local_irq_enable();
>>>>
>>>> +	if (unmapped)
>>>> +		return ret;
>>>
>>> As the comment of __folio_split() and __split_huge_page_to_list_to_order()
>>> mentioned:
>>>
>>>   * The large folio must be locked
>>>   * After splitting, the after-split folio containing @lock_at remains locked
>>>
>>> But here we seems to change the prerequisites.
>>>
>>> Hmm.. I am not sure this is correct.
>>>
>>
>> The code is correct, but you are right in that the documentation needs to be updated.
>> When "unmapped", we do want to leave the folios locked after the split.
> 
> Sigh, this "unmapped" code needs so many special branches and a different locking
> requirement. It should be a separate function to avoid confusions.
> 

Yep, I have a patch for it, I am also waiting on Matthew's feedback, FYI, here is
a WIP patch that can be applied on top of the series

---
 include/linux/huge_mm.h |   5 +-
 mm/huge_memory.c        | 137 ++++++++++++++++++++++++++++++++++------
 mm/migrate_device.c     |   3 +-
 3 files changed, 120 insertions(+), 25 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index c4a811958cda..86e1cefaf391 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -366,7 +366,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
 
 bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
 int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
-		unsigned int new_order, bool unmapped);
+		unsigned int new_order);
+int split_unmapped_folio_to_order(struct folio *folio, unsigned int new_order);
 int min_order_for_split(struct folio *folio);
 int split_folio_to_list(struct folio *folio, struct list_head *list);
 bool uniform_split_supported(struct folio *folio, unsigned int new_order,
@@ -379,7 +380,7 @@ int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
 static inline int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
 		unsigned int new_order)
 {
-	return __split_huge_page_to_list_to_order(page, list, new_order, false);
+	return __split_huge_page_to_list_to_order(page, list, new_order);
 }
 
 /*
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 8c82a0ac6e69..e20cbf68d037 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3711,7 +3711,6 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
  * @lock_at: a page within @folio to be left locked to caller
  * @list: after-split folios will be put on it if non NULL
  * @uniform_split: perform uniform split or not (non-uniform split)
- * @unmapped: The pages are already unmapped, they are migration entries.
  *
  * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
  * It is in charge of checking whether the split is supported or not and
@@ -3727,7 +3726,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
  */
 static int __folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct page *lock_at,
-		struct list_head *list, bool uniform_split, bool unmapped)
+		struct list_head *list, bool uniform_split)
 {
 	struct deferred_split *ds_queue;
 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
@@ -3777,14 +3776,12 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		 * is taken to serialise against parallel split or collapse
 		 * operations.
 		 */
-		if (!unmapped) {
-			anon_vma = folio_get_anon_vma(folio);
-			if (!anon_vma) {
-				ret = -EBUSY;
-				goto out;
-			}
-			anon_vma_lock_write(anon_vma);
+		anon_vma = folio_get_anon_vma(folio);
+		if (!anon_vma) {
+			ret = -EBUSY;
+			goto out;
 		}
+		anon_vma_lock_write(anon_vma);
 		mapping = NULL;
 	} else {
 		unsigned int min_order;
@@ -3852,8 +3849,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		goto out_unlock;
 	}
 
-	if (!unmapped)
-		unmap_folio(folio);
+	unmap_folio(folio);
 
 	/* block interrupt reentry in xa_lock and spinlock */
 	local_irq_disable();
@@ -3954,8 +3950,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 			expected_refs = folio_expected_ref_count(new_folio) + 1;
 			folio_ref_unfreeze(new_folio, expected_refs);
 
-			if (!unmapped)
-				lru_add_split_folio(folio, new_folio, lruvec, list);
+			lru_add_split_folio(folio, new_folio, lruvec, list);
 
 			/*
 			 * Anonymous folio with swap cache.
@@ -4011,9 +4006,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 
 	local_irq_enable();
 
-	if (unmapped)
-		return ret;
-
 	if (nr_shmem_dropped)
 		shmem_uncharge(mapping->host, nr_shmem_dropped);
 
@@ -4057,6 +4049,111 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	return ret;
 }
 
+/*
+ * This function is a helper for splitting folios that have already been unmapped.
+ * The use case is that the device or the CPU can refuse to migrate THP pages in
+ * the middle of migration, due to allocation issues on either side
+ *
+ * The high level code is copied from __folio_split, since the pages are anonymous
+ * and are already isolated from the LRU, the code has been simplified to not
+ * burden __folio_split with unmapped sprinkled into the code.
+ *
+ * None of the split folios are unlocked
+ */
+int split_unmapped_folio_to_order(struct folio *folio, unsigned int new_order)
+{
+	int extra_pins;
+	int ret = 0;
+	struct folio *new_folio, *next;
+	struct folio *end_folio = folio_next(folio);
+	struct deferred_split *ds_queue;
+	int old_order = folio_order(folio);
+
+	VM_WARN_ON_FOLIO(folio_mapped(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
+
+	if (!can_split_folio(folio, 1, &extra_pins)) {
+		ret = -EAGAIN;
+		goto err;
+	}
+
+	local_irq_disable();
+	/* Prevent deferred_split_scan() touching ->_refcount */
+	ds_queue = folio_split_queue_lock(folio);
+	if (folio_ref_freeze(folio, 1 + extra_pins)) {
+		int expected_refs;
+		struct swap_cluster_info *ci = NULL;
+
+		if (old_order > 1) {
+			if (!list_empty(&folio->_deferred_list)) {
+				ds_queue->split_queue_len--;
+				/*
+				 * Reinitialize page_deferred_list after
+				 * removing the page from the split_queue,
+				 * otherwise a subsequent split will see list
+				 * corruption when checking the
+				 * page_deferred_list.
+				 */
+				list_del_init(&folio->_deferred_list);
+			}
+			if (folio_test_partially_mapped(folio)) {
+				folio_clear_partially_mapped(folio);
+				mod_mthp_stat(old_order,
+					MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
+			}
+			/*
+			 * Reinitialize page_deferred_list after removing the
+			 * page from the split_queue, otherwise a subsequent
+			 * split will see list corruption when checking the
+			 * page_deferred_list.
+			 */
+			list_del_init(&folio->_deferred_list);
+		}
+		split_queue_unlock(ds_queue);
+
+		if (folio_test_swapcache(folio))
+			ci = swap_cluster_get_and_lock(folio);
+
+		ret = __split_unmapped_folio(folio, new_order, &folio->page,
+					     NULL, NULL, true);
+
+		/*
+		 * Unfreeze after-split folios
+		 */
+		for (new_folio = folio_next(folio); new_folio != end_folio;
+		     new_folio = next) {
+			next = folio_next(new_folio);
+
+			zone_device_private_split_cb(folio, new_folio);
+
+			expected_refs = folio_expected_ref_count(new_folio) + 1;
+			folio_ref_unfreeze(new_folio, expected_refs);
+			if (ci)
+				__swap_cache_replace_folio(ci, folio, new_folio);
+		}
+
+		zone_device_private_split_cb(folio, NULL);
+		/*
+		 * Unfreeze @folio only after all page cache entries, which
+		 * used to point to it, have been updated with new folios.
+		 * Otherwise, a parallel folio_try_get() can grab @folio
+		 * and its caller can see stale page cache entries.
+		 */
+		expected_refs = folio_expected_ref_count(folio) + 1;
+		folio_ref_unfreeze(folio, expected_refs);
+
+		if (ci)
+			swap_cluster_unlock(ci);
+	} else {
+		split_queue_unlock(ds_queue);
+		ret = -EAGAIN;
+	}
+	local_irq_enable();
+err:
+	return ret;
+}
+
 /*
  * This function splits a large folio into smaller folios of order @new_order.
  * @page can point to any page of the large folio to split. The split operation
@@ -4105,12 +4202,11 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
  * with the folio. Splitting to order 0 is compatible with all folios.
  */
 int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
-				     unsigned int new_order, bool unmapped)
+				     unsigned int new_order)
 {
 	struct folio *folio = page_folio(page);
 
-	return __folio_split(folio, new_order, &folio->page, page, list, true,
-				unmapped);
+	return __folio_split(folio, new_order, &folio->page, page, list, true);
 }
 
 /*
@@ -4138,8 +4234,7 @@ int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list
 int folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct list_head *list)
 {
-	return __folio_split(folio, new_order, split_at, &folio->page, list,
-			false, false);
+	return __folio_split(folio, new_order, split_at, &folio->page, list, false);
 }
 
 int min_order_for_split(struct folio *folio)
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index c869b272e85a..23515f3ffc35 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -918,8 +918,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
 
 	folio_get(folio);
 	split_huge_pmd_address(migrate->vma, addr, true);
-	ret = __split_huge_page_to_list_to_order(folio_page(folio, 0), NULL,
-							0, true);
+	ret = split_unmapped_folio_to_order(folio, 0);
 	if (ret)
 		return ret;
 	migrate->src[idx] &= ~MIGRATE_PFN_COMPOUND;
-- 
2.51.0


