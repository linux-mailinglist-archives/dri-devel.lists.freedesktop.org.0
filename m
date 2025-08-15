Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809C4B27FBE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 14:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F348710E8EF;
	Fri, 15 Aug 2025 12:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A/KnKbZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAA310E8EF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 12:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3c1Q0GcLcXWvmrPZdM0UBFjtDNO9Rj0ykfYUIuWyhud5Tj6McHrP+710/VYvLJWtfctCAB84lLsjfUaImtYlUHc7iHIwO1SsRDiCJ1BwCiKPdf6bh1NCXW2H00jGykIlyWjqWc5EvRAswozhesrYsg3NjlcmjAi1T9RMpbxU4+KkdbKV742VijCe6Au/eexvLwOBCZ1QR+0xE1VQagkypiZlARWcAI2Qmr8w+3SCiz8ZNiqth6xg2I1WxeomB3bHKLHAa6wI83p5a75rs6UGR2Zhf1dQIqe/7RD+WJ+ArPpt4VEM1Z/xyUfQYXgNANRNYHYcqCk17gBTeBF7TczBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJToEOn+2oecg5FXVNFEUMzqc2UUIZs66IFp28BPMLA=;
 b=rTAJTH+sdAcf91DVqOlN0NH6kh/EUUb4sX9NxnJDF7rVO4XMMe0NHTF9UtZ5WrpgQjsA+0SeO9Gc8oOd4DHTrGWTogp3v4c9u9wIbmuI65O8Qvxavfcw7AdLQEFsEPLHMiw2i39ZQRIlYFxC1J8skZtOWVWRrOHEIcfWD0INqUmMn4xtVso8z5mDjtbOrRQ66HsLq39y/TX+wBPPzfNq5Nv07V/nFEJm+pc5RTYdUej2u6vzqEfEENk8+AM20pmvQ3exy8nXfSsmz7wGtU/tesEcoUS/9DDW7oNNJEmR2JofuBXT4YZJAf2zz7D4xnMS179bZ6+lLP+PtopNB2BlUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJToEOn+2oecg5FXVNFEUMzqc2UUIZs66IFp28BPMLA=;
 b=A/KnKbZGAHvVT3OIpIm4WP+ekycfXcsCXFKR1OH8wHqEx/uoBssVw/6HjYJQjKrQjW+57Cc+oIGWUEfXQjhnwIFXHi0pXbCRqzPS6xptnQvzcXnx5Vih3rhbixwOwoFWXfklzYP9/pzTR6miza4EJ8TuooPsmxr6CejmAjmo2/OB53HBLfGln48FgVjkJkzPyyaBeHEOT8pCFJ921slOytifubWIiOIRyRL7ZZUdylRSO3cnpUReCiNQkIwHg6GAs6UK2ACExgV0CRDtKBQIaW/YAVouT8yjOAbdnsFq8CWJwvGyQOOMTEv2ieg39SChpeUqTExEmFN/+u5LCIbufw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7034.namprd12.prod.outlook.com (2603:10b6:a03:449::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Fri, 15 Aug
 2025 12:09:24 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9031.012; Fri, 15 Aug 2025
 12:09:24 +0000
Message-ID: <aba6cc29-3ce1-4897-8397-05e8c7b7f8f9@nvidia.com>
Date: Fri, 15 Aug 2025 22:09:16 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 03/11] mm/migrate_device: THP migration of zone device pages
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
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
 Francois Dugast <francois.dugast@intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-4-balbirs@nvidia.com>
 <81ca37d5-b1ff-46de-8dcc-b222af350c77@redhat.com>
 <9207451b-ebd1-46d5-b277-2adf3028f361@nvidia.com>
 <23a3e9b9-ad35-4469-884d-279aac0868de@redhat.com>
 <a8732499-161b-47f3-a936-580a43c6f323@nvidia.com>
 <aJ55c8yrcAN6upp9@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <aJ55c8yrcAN6upp9@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:a03:333::8) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b281416-c788-486f-3772-08dddbf492eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0w2S3E1b1ZrbmFRbWowYWwxd1U1VFYvSUQ5bFdTd1h2dmdFcEpIN2VwTWRr?=
 =?utf-8?B?MGcwbWtNZ3dHbVJmcWxua1BFSmErdko3Yi8xeUpaQVF4NnUvL0lUK2dxUU9E?=
 =?utf-8?B?RXc3cDRUUE9oMGlVOEg5ZGM3NDcvNjVSUGgra3lFT0JoSlN3QjhnaHhwYUlF?=
 =?utf-8?B?bVhxVWVpMU5XV2xZcEw2Ynh5OG55NGpDNVRUU1RFWWVhYkhuU2MzNUsxQmxp?=
 =?utf-8?B?ZGRJVVZNVWpJSldNT0Y0cXlUbHNQZHFMcU9XQ002SXJGcTZYdTY0b1lqWVpr?=
 =?utf-8?B?V0dwd3c0OWNOOEF0TWt2bklHYkluR0pSWDlodWl0RWoxZ2d0cU9OK1ZMQ0Nn?=
 =?utf-8?B?NzV5OHI1TTRlS1Fyc0pTU092dVI1c0ZwNVg0cTVsZDZ2aWNnSU85djhCK3Vh?=
 =?utf-8?B?QmdnakRjV01OMGJ0RkRyNHE0TmQrK2xPZjJzRDZtY0MzRG94NHZzL3VyV2w3?=
 =?utf-8?B?NnVBdlRsUVZXbmZTRmw4bjFJQjRRbG1NeDdWRVg3YlN3Tko3ZHlqaXVycllU?=
 =?utf-8?B?dDdrYmJCY0JPdXR6ejhOOXFGWGZLb255OVV4YnFCMXNhaGFLUDVlUzcrdGJs?=
 =?utf-8?B?NEpwQk8ycjFmY2N6U0txTEUwNGJOZkxYek5hbERWUW14ZW9KcG9JT3hvaVRk?=
 =?utf-8?B?RVp6Z1lPejBCc2J3WXJDbHkyQU03WEt6eHZCSkhFSzVSMEZVeWxxTldqRzlx?=
 =?utf-8?B?OG9PMDVHUGtqUmFrWW0zV2Jja2ZCRTV4bmxPRmJndEtJTU5mdlN4L3dUdTBR?=
 =?utf-8?B?QmhUWGg2ZXp5d01YNGpQT1d3aUhoUzcrOE1jS1VKbnhXdUFkTzM3TUpjRkxD?=
 =?utf-8?B?UGpJd0lraDhEN05GVzRVRUVhOWU1RExoZmI1T3VjNmhvQmdSTzI0c0dPK0Z3?=
 =?utf-8?B?Nk43a0lGS05zbTc0ZE1KdHpsV1JZSGJTZFJnWmE4SEx5Y0hpMUhWT0xMYnov?=
 =?utf-8?B?QmJCTk9nSk1QWEI2ZlhiTndEUjQ5ZlgxYjhqR0NYenhPRkpudG42R0liRTBq?=
 =?utf-8?B?b25nRU81Qnp2Q1MzQW93enQyUWZyeHkwSWNFSktnY2Y0cHZEYkQ4UEU3Ty9u?=
 =?utf-8?B?T0NZSU5pOTBLUzlwdis1V0hBZExPQmpVNHVIZUZsS0wxZm9kRFlUcEhVZG8r?=
 =?utf-8?B?VS9TRDJ0MkdycHkvT3BSNWxKZTh4a3dncisxbVJKeGlIcEpnV045Q08vQWl0?=
 =?utf-8?B?c3dkaWFxVS9YbXRsSDdPOHlRellRc0JOR25SWEFKOXdhR053MTh5bGc0ZlRB?=
 =?utf-8?B?bm9wbEFjQjd3b0J6cEp2STEyaGxqcTljcE4wTG5ydjB5Yko3WC9uZTgxQ2Jh?=
 =?utf-8?B?SzMzSlpuQys3cmNDSFdpbEN6ODlIQ1FiZTNhc3RNWThFUjMxcWF2ZGlnUGNO?=
 =?utf-8?B?NDVaVXRTamp3NG9qL0ZDUW5ucS9MTHNWRDNVQWRBMC9qUVMwRWVaZjlSZ3JG?=
 =?utf-8?B?UmtYc1VNdzRmZEduRVB3RWFnWFNXZ2ZFckRwUmFUQXc5cER5K050akg1emYx?=
 =?utf-8?B?T1llQVowSDZjMmVFRXJuTHF2MGFRTFZYSzE0Y1R1eEtCamZRVDBPd0dNUXl4?=
 =?utf-8?B?blNGb2YrcDAwc05ZMTVFZ2QvejhIT0VFV2NMQW5QLzJvQ2xFc1BvVVM5Yzls?=
 =?utf-8?B?YUlSaWJTeFYxZUwrN0tGZTU4TmNaQ1BHenc3NG9sQnNWZVpiYnc0N0oyMlBu?=
 =?utf-8?B?WFg5ZHd0U2xLUW8xQWZ6OHBjN05iQ0JsNnNRdE42MEx2VmxxTExxajBybENl?=
 =?utf-8?B?MmRiK2NNcTRvZXIxY3FHc0dTV0VPem51bHVjR1JGOFd3OG8wa3lsdkJtQXpW?=
 =?utf-8?B?dW5PWDE5b2IyMXhveEJCc1Q3N0FPMlFaM1Qzd2NseGFQa2ROcDJYQW1sUzZU?=
 =?utf-8?B?QXBHSDZEQTlKTVh3WHVPUTlKNkIybnJPdGxWTVpiZ3hGVXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1VyamdwODdpL0NMenpZVTZ6N0p3L0IyN3IreXlmWkpzT1FIS1hiY3JVc0dP?=
 =?utf-8?B?cWduYzR0dzc0ZzN3cWZXdGtMRnMvVE5lc0tJOUxTRHdaSG5EMVNRZ0NwaVB3?=
 =?utf-8?B?b2ZTdktLY1kxSEJaMU5VMElyRm0xbG1qdndILytEYzdXQ3JHU2JiSTByZW9O?=
 =?utf-8?B?SlRxWW1JUGJ6clJGQ3dYQW9PcDVmNVRJQWJMNVhwSEFCajJPZ2R2VFlwODY0?=
 =?utf-8?B?NUk1azdzNFdjbERqQXpmMStUb1B3c0p0cVhMUnp0U2RuZ0xocXUxVldCSGI2?=
 =?utf-8?B?TElRZHBSNElvQ2h3V1NkcS9LMUdTUUh1OFJHTHlrbnBTb2VzYTIveG0zRGFX?=
 =?utf-8?B?ZW1kQzBpVzZIUDRVT3dwTGlEWitXRG1sQVFyamlmaU9UV21JcWdVOTJjK1VZ?=
 =?utf-8?B?T003TzRmYTNTQUg0QzNlVUFLTVVqMnpxZXllSFk0RE9qWlgxYWpYbDBtSUo1?=
 =?utf-8?B?U1JlTERvQWd1U1JMalNGRk80ZEkrZ29tOG13dTVTekdSblZKSmlrSDdIZ21C?=
 =?utf-8?B?QjVPbkkrUi9Hc0tFcmRDNy9ZaWZLQWNMMW9SblZUWStMRWQwQkZOQ2RWY0NH?=
 =?utf-8?B?M0E5dUh6cUVrQ3RHZFh4ejVER2xkOXlRcXVkREJzcFIxVVJzV1crRmZVc1BN?=
 =?utf-8?B?U2g0RkZlLzIxSTh6SHpaUWpBYWQ2TGpEcjFicUh5WTBUcktlbUNPUG9hUlpC?=
 =?utf-8?B?Z1g2Rlk5WXhLZUZoVlo1NU1rM1ZRdkhVMStGM0hZUHZ1dHhTVVN1bnNjeTl0?=
 =?utf-8?B?N1U1bWk4cmtzSlFzYytJSGhKUk1sTXE4ZU9XdVp2RG5Oajg3NkIvclpBUFlE?=
 =?utf-8?B?UnRnZ3ZicjdsNFdhbzdFOFN6MWV5NnlqNEROMmd0S1MxaE84Q0dXcDR2NHNT?=
 =?utf-8?B?MFVraVh4WU9tNGVUczRMQkVad1pwU29IQkI2N2JrYUJxTjgyYlQ1VUxmZ1M0?=
 =?utf-8?B?cnRYYmJwM0E2Z3U4NzUrcHZ6WktjUG4wRTBWWXUzNEI2bW1FRXpwdHJ3SGZM?=
 =?utf-8?B?a1NDUWZSNzFZRlh1bk80dDJWWVBhbmtJbXVleHpnS0hXMmU2STRBejJoeFZW?=
 =?utf-8?B?Sm5pdDIvVjFMV0d1ek5UY0hBaExaVzFkYjR6VjhwTHhoc3VtcWpCbldPZWE4?=
 =?utf-8?B?dVBXWUVOMmI5OUd6N0tMR2xucHNYendsVzd3UlArZGFvOXIrSVlDbytJNndq?=
 =?utf-8?B?OEhHcEJNVWVjYjMrTXNGM2ViVWVyaUg4dTkyRktPdGhBNDdzY1k5MWprUi8v?=
 =?utf-8?B?dTcrb09iYUpmMzhkUWFLYnUxTU9Eb2pNNmpCaEh2RFZPU01BVW0yczdRcHF2?=
 =?utf-8?B?Nlk1YWhNVWpWaFNwb0tXcFBxZ3ZoQTgxd0dNNlV6VXFwVTM0cWlwNzE2V0VF?=
 =?utf-8?B?M0FMWnY4YTE0K0JxN3RJOHZSN2xvT2c3R3E3ajRreVh2eGkySk1FMVFFQmRT?=
 =?utf-8?B?YThHSzVpQVJkSSszQTR1VlhHS3N0MVFMNzdKZnlQWHBpYXVWMUNQekpvMXhk?=
 =?utf-8?B?amd4RENVaFVKWm1tc2FESU1XK3RzUkduUWxlcjZ1bDZ5Tk5IMWtTMEg5TG5B?=
 =?utf-8?B?WFE4U0c2Nk1iS3NoVW9RSmVWaE96enJjT2NwMVZQWVlPOXNYd1YzS2puSXdB?=
 =?utf-8?B?UFBhSlBVQThMVUFSVk5WbEEwb1Q1OEFtMzI3bkcrY09KTjBlUHEraEYxalRj?=
 =?utf-8?B?dnN6QUU5NHA0U29IU0crY1luUXJlRHczV0tmTldHQm5qTUx3czM1Sm1hNERM?=
 =?utf-8?B?MGN2QSs3SFA0bUJTNFUycTNSbnpuU2lNelFIN2xTQXRHbHJIdHdwc3VqQUdH?=
 =?utf-8?B?WWtjVFhCV011TE4xZkRaZUVRSjBMbDRZVjFmK1k4QTFxd1pLUkJSYk1rbUxx?=
 =?utf-8?B?RlFnR0NHVU1RcmVGM3QwTW9yZ29JYnljNitVa2RTT3llN3hKVzF2dlZrUkxy?=
 =?utf-8?B?bWJIVWtTb1JkN0h1ZmlGZy9QVUJJZjRxRkxSVEYxcDBaVk9OdllRRWZPNFor?=
 =?utf-8?B?c1czNmxmanZWZ0lCeElvTk9uRXovc0tLRjdEZlg3bVl5Y0xUQURjeWlueXVN?=
 =?utf-8?B?c0ZvNWNPKy9ZWUZTUEttbFhMazVZek9uYTRndHUxblNwQkVhKzFmUG5YL3Bp?=
 =?utf-8?Q?gwHblTFYHup5xW2kt9WrSg8/8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b281416-c788-486f-3772-08dddbf492eb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 12:09:24.0898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpOv2aDr0ufZtAHdnJuNdoEKDKS+FPXo5jWpJkNJnLddAvubu5EsRrhKy+KxMezspPtdDnc6ER5F3VDrScUZhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7034
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

On 8/15/25 10:04, Matthew Brost wrote:
> On Fri, Aug 15, 2025 at 08:51:21AM +1000, Balbir Singh wrote:
>> On 8/13/25 10:07, Mika Penttilä wrote:
>>>
>>> On 8/13/25 02:36, Balbir Singh wrote:
>>>
>>>> On 8/12/25 15:35, Mika Penttilä wrote:
>>>>> Hi,
>>>>>
>>>>> On 8/12/25 05:40, Balbir Singh wrote:
>>>>>
>>>>>> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
>>>>>> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
>>>>>> device pages as compound pages during device pfn migration.
>>>>>>
>>>>>> migrate_device code paths go through the collect, setup
>>>>>> and finalize phases of migration.
>>>>>>
>>>>>> The entries in src and dst arrays passed to these functions still
>>>>>> remain at a PAGE_SIZE granularity. When a compound page is passed,
>>>>>> the first entry has the PFN along with MIGRATE_PFN_COMPOUND
>>>>>> and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
>>>>>> remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
>>>>>> representation allows for the compound page to be split into smaller
>>>>>> page sizes.
>>>>>>
>>>>>> migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
>>>>>> page aware. Two new helper functions migrate_vma_collect_huge_pmd()
>>>>>> and migrate_vma_insert_huge_pmd_page() have been added.
>>>>>>
>>>>>> migrate_vma_collect_huge_pmd() can collect THP pages, but if for
>>>>>> some reason this fails, there is fallback support to split the folio
>>>>>> and migrate it.
>>>>>>
>>>>>> migrate_vma_insert_huge_pmd_page() closely follows the logic of
>>>>>> migrate_vma_insert_page()
>>>>>>
>>>>>> Support for splitting pages as needed for migration will follow in
>>>>>> later patches in this series.
>>>>>>
>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>> Cc: David Hildenbrand <david@redhat.com>
>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>>>> Cc: Gregory Price <gourry@gourry.net>
>>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>>>> Cc: Nico Pache <npache@redhat.com>
>>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>>>> Cc: Barry Song <baohua@kernel.org>
>>>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>>>
>>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>>>> ---
>>>>>>  include/linux/migrate.h |   2 +
>>>>>>  mm/migrate_device.c     | 457 ++++++++++++++++++++++++++++++++++------
>>>>>>  2 files changed, 396 insertions(+), 63 deletions(-)
>>>>>>
>>>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>>>>> index acadd41e0b5c..d9cef0819f91 100644
>>>>>> --- a/include/linux/migrate.h
>>>>>> +++ b/include/linux/migrate.h
>>>>>> @@ -129,6 +129,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>>>>>>  #define MIGRATE_PFN_VALID	(1UL << 0)
>>>>>>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>>>>>>  #define MIGRATE_PFN_WRITE	(1UL << 3)
>>>>>> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>>>>>>  #define MIGRATE_PFN_SHIFT	6
>>>>>>  
>>>>>>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>>>>>> @@ -147,6 +148,7 @@ enum migrate_vma_direction {
>>>>>>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>>>>>>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>>>>>>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>>>>>> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>>>>>>  };
>>>>>>  
>>>>>>  struct migrate_vma {
>>>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>>>> index 0ed337f94fcd..6621bba62710 100644
>>>>>> --- a/mm/migrate_device.c
>>>>>> +++ b/mm/migrate_device.c
>>>>>> @@ -14,6 +14,7 @@
>>>>>>  #include <linux/pagewalk.h>
>>>>>>  #include <linux/rmap.h>
>>>>>>  #include <linux/swapops.h>
>>>>>> +#include <asm/pgalloc.h>
>>>>>>  #include <asm/tlbflush.h>
>>>>>>  #include "internal.h"
>>>>>>  
>>>>>> @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>>>>  	if (!vma_is_anonymous(walk->vma))
>>>>>>  		return migrate_vma_collect_skip(start, end, walk);
>>>>>>  
>>>>>> +	if (thp_migration_supported() &&
>>>>>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>>>>>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>>>>>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>>>>>> +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
>>>>>> +						MIGRATE_PFN_COMPOUND;
>>>>>> +		migrate->dst[migrate->npages] = 0;
>>>>>> +		migrate->npages++;
>>>>>> +		migrate->cpages++;
>>>>>> +
>>>>>> +		/*
>>>>>> +		 * Collect the remaining entries as holes, in case we
>>>>>> +		 * need to split later
>>>>>> +		 */
>>>>>> +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>>>>>> +	}
>>>>>> +
>>>>>>  	for (addr = start; addr < end; addr += PAGE_SIZE) {
>>>>>>  		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
>>>>>>  		migrate->dst[migrate->npages] = 0;
>>>>>> @@ -54,57 +72,151 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>>>>  	return 0;
>>>>>>  }
>>>>>>  
>>>>>> -static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>>> -				   unsigned long start,
>>>>>> -				   unsigned long end,
>>>>>> -				   struct mm_walk *walk)
>>>>>> +/**
>>>>>> + * migrate_vma_collect_huge_pmd - collect THP pages without splitting the
>>>>>> + * folio for device private pages.
>>>>>> + * @pmdp: pointer to pmd entry
>>>>>> + * @start: start address of the range for migration
>>>>>> + * @end: end address of the range for migration
>>>>>> + * @walk: mm_walk callback structure
>>>>>> + *
>>>>>> + * Collect the huge pmd entry at @pmdp for migration and set the
>>>>>> + * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
>>>>>> + * migration will occur at HPAGE_PMD granularity
>>>>>> + */
>>>>>> +static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>>>>>> +					unsigned long end, struct mm_walk *walk,
>>>>>> +					struct folio *fault_folio)
>>>>>>  {
>>>>>> +	struct mm_struct *mm = walk->mm;
>>>>>> +	struct folio *folio;
>>>>>>  	struct migrate_vma *migrate = walk->private;
>>>>>> -	struct folio *fault_folio = migrate->fault_page ?
>>>>>> -		page_folio(migrate->fault_page) : NULL;
>>>>>> -	struct vm_area_struct *vma = walk->vma;
>>>>>> -	struct mm_struct *mm = vma->vm_mm;
>>>>>> -	unsigned long addr = start, unmapped = 0;
>>>>>>  	spinlock_t *ptl;
>>>>>> -	pte_t *ptep;
>>>>>> +	swp_entry_t entry;
>>>>>> +	int ret;
>>>>>> +	unsigned long write = 0;
>>>>>>  
>>>>>> -again:
>>>>>> -	if (pmd_none(*pmdp))
>>>>>> +	ptl = pmd_lock(mm, pmdp);
>>>>>> +	if (pmd_none(*pmdp)) {
>>>>>> +		spin_unlock(ptl);
>>>>>>  		return migrate_vma_collect_hole(start, end, -1, walk);
>>>>>> +	}
>>>>>>  
>>>>>>  	if (pmd_trans_huge(*pmdp)) {
>>>>>> -		struct folio *folio;
>>>>>> -
>>>>>> -		ptl = pmd_lock(mm, pmdp);
>>>>>> -		if (unlikely(!pmd_trans_huge(*pmdp))) {
>>>>>> +		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
>>>>>>  			spin_unlock(ptl);
>>>>>> -			goto again;
>>>>>> +			return migrate_vma_collect_skip(start, end, walk);
>>>>>>  		}
>>>>>>  
>>>>>>  		folio = pmd_folio(*pmdp);
>>>>>>  		if (is_huge_zero_folio(folio)) {
>>>>>>  			spin_unlock(ptl);
>>>>>> -			split_huge_pmd(vma, pmdp, addr);
>>>>>> -		} else {
>>>>>> -			int ret;
>>>>>> +			return migrate_vma_collect_hole(start, end, -1, walk);
>>>>>> +		}
>>>>>> +		if (pmd_write(*pmdp))
>>>>>> +			write = MIGRATE_PFN_WRITE;
>>>>>> +	} else if (!pmd_present(*pmdp)) {
>>>>>> +		entry = pmd_to_swp_entry(*pmdp);
>>>>>> +		folio = pfn_swap_entry_folio(entry);
>>>>>> +
>>>>>> +		if (!is_device_private_entry(entry) ||
>>>>>> +			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
>>>>>> +			(folio->pgmap->owner != migrate->pgmap_owner)) {
>>>>>> +			spin_unlock(ptl);
>>>>>> +			return migrate_vma_collect_skip(start, end, walk);
>>>>>> +		}
>>>>>>  
>>>>>> -			folio_get(folio);
>>>>>> +		if (is_migration_entry(entry)) {
>>>>>> +			migration_entry_wait_on_locked(entry, ptl);
>>>>>>  			spin_unlock(ptl);
>>>>>> -			/* FIXME: we don't expect THP for fault_folio */
>>>>>> -			if (WARN_ON_ONCE(fault_folio == folio))
>>>>>> -				return migrate_vma_collect_skip(start, end,
>>>>>> -								walk);
>>>>>> -			if (unlikely(!folio_trylock(folio)))
>>>>>> -				return migrate_vma_collect_skip(start, end,
>>>>>> -								walk);
>>>>>> -			ret = split_folio(folio);
>>>>>> -			if (fault_folio != folio)
>>>>>> -				folio_unlock(folio);
>>>>>> -			folio_put(folio);
>>>>>> -			if (ret)
>>>>>> -				return migrate_vma_collect_skip(start, end,
>>>>>> -								walk);
>>>>>> +			return -EAGAIN;
>>>>>>  		}
>>>>>> +
>>>>>> +		if (is_writable_device_private_entry(entry))
>>>>>> +			write = MIGRATE_PFN_WRITE;
>>>>>> +	} else {
>>>>>> +		spin_unlock(ptl);
>>>>>> +		return -EAGAIN;
>>>>>> +	}
>>>>>> +
>>>>>> +	folio_get(folio);
>>>>>> +	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
>>>>>> +		spin_unlock(ptl);
>>>>>> +		folio_put(folio);
>>>>>> +		return migrate_vma_collect_skip(start, end, walk);
>>>>>> +	}
>>>>>> +
>>>>>> +	if (thp_migration_supported() &&
>>>>>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>>>>>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>>>>>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>>>>>> +
>>>>>> +		struct page_vma_mapped_walk pvmw = {
>>>>>> +			.ptl = ptl,
>>>>>> +			.address = start,
>>>>>> +			.pmd = pmdp,
>>>>>> +			.vma = walk->vma,
>>>>>> +		};
>>>>>> +
>>>>>> +		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
>>>>>> +
>>>>>> +		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
>>>>>> +						| MIGRATE_PFN_MIGRATE
>>>>>> +						| MIGRATE_PFN_COMPOUND;
>>>>>> +		migrate->dst[migrate->npages++] = 0;
>>>>>> +		migrate->cpages++;
>>>>>> +		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
>>>>>> +		if (ret) {
>>>>>> +			migrate->npages--;
>>>>>> +			migrate->cpages--;
>>>>>> +			migrate->src[migrate->npages] = 0;
>>>>>> +			migrate->dst[migrate->npages] = 0;
>>>>>> +			goto fallback;
>>>>>> +		}
>>>>>> +		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>>>>>> +		spin_unlock(ptl);
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +
>>>>>> +fallback:
>>>>>> +	spin_unlock(ptl);
>>>>>> +	if (!folio_test_large(folio))
>>>>>> +		goto done;
>>>>>> +	ret = split_folio(folio);
>>>>>> +	if (fault_folio != folio)
>>>>>> +		folio_unlock(folio);
>>>>>> +	folio_put(folio);
>>>>>> +	if (ret)
>>>>>> +		return migrate_vma_collect_skip(start, end, walk);
>>>>>> +	if (pmd_none(pmdp_get_lockless(pmdp)))
>>>>>> +		return migrate_vma_collect_hole(start, end, -1, walk);
>>>>>> +
>>>>>> +done:
>>>>>> +	return -ENOENT;
>>>>>> +}
>>>>>> +
>>>>>> +static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>>> +				   unsigned long start,
>>>>>> +				   unsigned long end,
>>>>>> +				   struct mm_walk *walk)
>>>>>> +{
>>>>>> +	struct migrate_vma *migrate = walk->private;
>>>>>> +	struct vm_area_struct *vma = walk->vma;
>>>>>> +	struct mm_struct *mm = vma->vm_mm;
>>>>>> +	unsigned long addr = start, unmapped = 0;
>>>>>> +	spinlock_t *ptl;
>>>>>> +	struct folio *fault_folio = migrate->fault_page ?
>>>>>> +		page_folio(migrate->fault_page) : NULL;
>>>>>> +	pte_t *ptep;
>>>>>> +
>>>>>> +again:
>>>>>> +	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
>>>>>> +		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
>>>>>> +
>>>>>> +		if (ret == -EAGAIN)
>>>>>> +			goto again;
>>>>>> +		if (ret == 0)
>>>>>> +			return 0;
>>>>>>  	}
>>>>>>  
>>>>>>  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>>>>>> @@ -222,8 +334,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>>>  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
>>>>>>  		}
>>>>>>  
>>>>>> -		/* FIXME support THP */
>>>>>> -		if (!page || !page->mapping || PageTransCompound(page)) {
>>>>>> +		if (!page || !page->mapping) {
>>>>>>  			mpfn = 0;
>>>>>>  			goto next;
>>>>>>  		}
>>>>>> @@ -394,14 +505,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
>>>>>>  	 */
>>>>>>  	int extra = 1 + (page == fault_page);
>>>>>>  
>>>>>> -	/*
>>>>>> -	 * FIXME support THP (transparent huge page), it is bit more complex to
>>>>>> -	 * check them than regular pages, because they can be mapped with a pmd
>>>>>> -	 * or with a pte (split pte mapping).
>>>>>> -	 */
>>>>>> -	if (folio_test_large(folio))
>>>>>> -		return false;
>>>>>> -
>>>>> You cannot remove this check unless support normal mTHP folios migrate to device, 
>>>>> which I think this series doesn't do, but maybe should?
>>>>>
>>>> mTHP needs to be a follow up series, there are comments in the cover letter. I had an
>>>> assert earlier to prevent other folio sizes, but I've removed it and the interface
>>>> to drivers does not allow for mTHP device private folios.
>>>>
>>>>
>>> pte mapped device private THPs with other sizes also can be created as a result of pmd and folio splits. 
>>> Your should handle them in one place consistently not by different drivers. 
>>> As pointed by Matthew, there's the problem with the fault_page if not split and just ignored.
>>>
>>
>> I've not run into this with my testing, let me try with more mTHP sizes enabled. I'll wait on Matthew
>> to post his test case or any results, issues seen
>>
> 
> I’ve hit this. In the code I shared privately, I split THPs in the
> page-collection path. You omitted that in v2 and v3; I believe you’ll
> need those changes. The code I'm referring to had the below comment.
> 
>  416         /*
>  417          * XXX: No clean way to support higher-order folios that don't match PMD
>  418          * boundaries for now — split them instead. Once mTHP support lands, add
>  419          * proper support for this case.
>  420          *
>  421          * The test, which exposed this as problematic, remapped (memremap) a
>  422          * large folio to an unaligned address, resulting in the folio being
>  423          * found in the middle of the PTEs. The requested number of pages was
>  424          * less than the folio size. Likely to be handled gracefully by upper
>  425          * layers eventually, but not yet.
>  426          */
> 
> I triggered it by doing some odd mremap operations, which caused the CPU
> page-fault handler to spin indefinitely iirc. In that case, a large device
> folio had been moved into the middle of a PMD.
> 

That is interesting, in general migrate_vma_pages is protected by address alignment
checks and PMD checks, for the case you describe even after the folio comes
in the middle of the PMD, it should get split in migrate_vma_setup(), if the PMD
is split

> Upstream could see the same problem if the device fault handler enforces
> a must-migrate-to-device policy and mremap moves a large CPU folio into
> the middle of a PMD.
> 
> I’m in the middle of other work; when I circle back, I’ll try to create
> a selftest to reproduce this. My current test is a fairly convoluted IGT
> with a bunch of threads doing remap nonsense, but I’ll try to distill it
> into a concise selftest.
> 

Look forward to your tests and feedback based on the integration of this
series with your work.

Thanks,
Balbir
