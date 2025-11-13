Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB262C55C54
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 06:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAB010E202;
	Thu, 13 Nov 2025 05:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CokhR2it";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70FF10E202
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 05:13:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6Fm1RK0fWcwgrUTIybcsuheKwZ9xN+T5PsjOgCuwirrOnqvIpSP3EyUg5HrCRgGNX3L4g5XW1rW/o4irFF8jUCQW4ABSGL0CZTYC+HKNqOT9W4du55ZXUR0aFI7mZVA7cfw9QdJ8UgY3OpIFxvon1l3OtHAyKN8zpWqW0UZn9jEG8FhoDMAUO6pl/+CwRW+Dakh07Qpu9XtAx8gAO7mLfBqR/We/ELb2opqo1V+LjkJJv0facmZShe82hbLi6mnRlWNbqz2/9uWMY4tKeDyyCp95Ebues4zjsl87ZDMhqIg1hsO893V6KFovn0Z8GDDuPgVmksngVhCvZxqi0AFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2e0XTJU9CvcG7cfPNHNVcr2/hpB+09khUSn7WOUVzaY=;
 b=DZAFqg65FAL/mA/+xOoQys8CvLavOqAh+aNdurhzJF8aZtHNhJj8hjQ/xAJI/2TMDjRDE3Af9MdzqMaitg9OC6zMR4kC/bK3U4bwV/rsPSTrrifBXmoeq8T+MbrrGSZ8+QD8+ChBs8hiSrvEl4yJhpFV3V2VnEacUS+6edzoID9b1YFzaA3AlPs4rk3hddxofJebjYSeQn38tgOkBmPj80Tn3ggBROI71QklBzER0jL/AN+zjkEMA2rhX5209iZKaiaDxNldXxMC2olUq7m7SWBR+4e1ca2zMUjWzspyMaUe9jeCI/APjSj3+MhBY9qqmNlz6tthDVMIy4mdGhvQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e0XTJU9CvcG7cfPNHNVcr2/hpB+09khUSn7WOUVzaY=;
 b=CokhR2itodnROvQE9ted0hXkU1vvBu2OGkLR09wIGK735bv8GL9VEEjbv5MAr5vwmMnNIFu+Dp4PN25+z5k9WAbfLN1Qgsn6nIXy+eY4lJmd4f0S5mof6w3jvSYhnW2gcV2XJyWE6/RXCkgNaWKxpkLk5o56sRP9RTZtuTjSW7mvzunD1/OUp250WL5dWMBM3CdM4b5NUPXISSfJjAUjv3aSjnv4LklrCYCN7syy0oF6K8gn1HF7Xrcn3SruaL9Y+JcVi7nWT1mo0SxnDOrT6Pnvf05z7TOSUgil+rrKl+rUY3MVi2xsljTmiq77Za97h4EIDt4AV9Unmford5X47w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by LV9PR12MB9832.namprd12.prod.outlook.com (2603:10b6:408:2f3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 05:13:30 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:13:30 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Balbir Singh <balbirs@nvidia.com>, kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] fix gpu/drm/nouveau: fix return type in
 nouveau_dmem_migrate_to_ram()
Date: Thu, 13 Nov 2025 16:13:22 +1100
Message-ID: <20251113051322.1753532-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P300CA0037.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fd::12) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|LV9PR12MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5582dc-6ec5-490a-5269-08de22736280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk9Vb0ZhSU9Rb1FmYTFFbWFvMm5LOTB1cVA5eDBNOCtVVVF6NlNHKyt6VXRD?=
 =?utf-8?B?UkdFZmtkbUZaOHFaRU8yTy9MNjlGNStJVHVDajF3SFppMFVlNFdWZWZNTitL?=
 =?utf-8?B?emlRQkEwTUZlVC9nZzBBZ1dKcy9oRWhkaVdRUUdIVFh0Mm9MV3BYSGV6L2VK?=
 =?utf-8?B?SUYyaGxncFNYZ0lRRml6VHVxMUtpL2ptbTE2UDJrcCsyeVEwS3piNjJodVFi?=
 =?utf-8?B?UVUwUnQrdjEzclVtNS9kWUxEcEQvNjlMaXFFUkNNNVdJQi9sakhWSDFVMjJK?=
 =?utf-8?B?Uklqa3V1bTViaE5Ra2JNVERmQWJzS2dhUHVoVExLemJRVXVla2pIbFJQZGVp?=
 =?utf-8?B?ZmtPdmlZZVhXazZaNjhCNXVQQVNDblRhZzVmZUxqS0ZMM09kZCtiVFA3Szhk?=
 =?utf-8?B?ZThqZWhHeXAvdXUyYlEwT29HODR4OUpqbTFtbnRLc1RsYkpQUTRjLzd6dVd4?=
 =?utf-8?B?MFF1bEp0eEcvWi9oVzcxbXZTcE5PQ3hRRUVvOFdvWGhGL2pjdWlaMWNLc2VJ?=
 =?utf-8?B?M1Q3Rms4UnFCOGI5eHdta1ZBQ01RbnVmYjdvNzVUZk5mcGNOWnB4UFZYck9F?=
 =?utf-8?B?elNoL3c4NGhrWXZycnpOTXlrMjZWdjFYV3lZS3ZDNTNNdWZ3Sld6Ujk0L0Jz?=
 =?utf-8?B?YVZQejNkVVlSQjFkQnE1WWh6eGk1dXNVdyttZGdRbnh2Ry8yU0VEeWV2MmtV?=
 =?utf-8?B?empKcUhMWGVmVTlqem9SbmFraEFyTFpSQmlpQS9CMzFiZm00eVF2ZDBTVlRE?=
 =?utf-8?B?RjJIY2didDFhWG9PLzFmVFZJRnRoZThjNS8wK2tjbEtLMmsvU0ZReU1xd3h6?=
 =?utf-8?B?QnE5WUlmVkY4ekdwQ2ZDLzRzbVBVMVFBaTlPYUxXVndXQ1ZHR25Vc2liekw0?=
 =?utf-8?B?SDZES1lQeDE4UFNtVFJYcGcvOTFqYm8xVVFWV1duUGJmTG9wMVRQYno5WUtW?=
 =?utf-8?B?NjViZnNMUUdqUXlBc015akUxNmF4WmpuMmRsdGZrWEFmZVdjUjJEV3ZreGR4?=
 =?utf-8?B?REp6M2pIbWY2K3pvRVozcXpGYU1RTzE3RDJ3UXVlVTdYRnlvcEs3akxYeWtQ?=
 =?utf-8?B?MExCTnRxa2lFY2dPcHNyaXU4a2N0TlpReHROekxSWStWcUdwMDBOeG9NdEJz?=
 =?utf-8?B?QVJFVmFZVU9CVEp4STJOSUNFaDFnejV1Nk8ySFhPaG94anhsb2l0enBSckdh?=
 =?utf-8?B?RGNzeHZaT1dwMlh3cm82dXVCSHVJNlJ5clBBOVExOURaWHBSbjQxSjhsV0kw?=
 =?utf-8?B?SXdkcHdyS0hQdVFueFp0LzVkQlBGQnZxbnhhNmRCZU9OVzhGYVN1NHptU3kz?=
 =?utf-8?B?RjhvTkxJNmdlWGJoQVdHdzg2MElZVWZVdWdQSDV1cDNjcURTMno2RkQ5ZXFH?=
 =?utf-8?B?WlY0cU9pZjNmRm10T2JNYzJFbkFDRzR3YS9rOTZBeG1JSytLZ2p6cUF0MVZz?=
 =?utf-8?B?UTA2U1diUkZ6bElJcW9idUhwRUE3a1hUZ080eVBLMzA2d3VaSDA2OUxTM0pZ?=
 =?utf-8?B?NXM4NlE4Z1FyR3RLbStEelE0ZFZXam9kdmpQc2UxNWRlWjU1SVNQR3lkWGZ0?=
 =?utf-8?B?cGVaTWNIQklqazBXZEkxbEE4NlhXb3d2VmhuMXVSY0ZRZHFJTWs4UHhFYWg4?=
 =?utf-8?B?WVN6a1BSRUcveU1UZmxxcXIxUWZuaS94QTJJU0NJV1Z4a0JiZG9WdE1mOWln?=
 =?utf-8?B?NTdrdkZRMVppSkw1UDE3SjhPZ2t0Mkx6Z0Jab3Q1WGZOWnM5eHB3bE1ycnRj?=
 =?utf-8?B?YmxUcUp4THdWaE9wM1pMVmZXSGVqdTN0YTJsNVZkbVREczlpaTZ2dnBHdUU1?=
 =?utf-8?B?WmNUWFRSVWpsNkpNdXFnTXFIWFdocVIyeWVCZlh1cmd4Q2c1ODdHanhsUWRs?=
 =?utf-8?B?Yk9VWVAwZG9IQS80bWtmVGwvUjNORmtXcjMvU3pTQkZZa1FIZ09QamJUYk96?=
 =?utf-8?B?a3YyRExBcDNvUDUyODl5dUFkYjBTUmlHenZoRlBqMXRlMVRVL0lrT0thaGJo?=
 =?utf-8?B?cGorOFQ3c0Z3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekJQakxndnRPYklxZWVJTHNSUXJxWUtWTGR5T1c3Q0RiMXRoY1RSZ0hQU1A3?=
 =?utf-8?B?T05UTlREZm16Mm5GcnVjR2NmeG5RQ0JSK3dMeXdNS2lnQmZJNVV4ck90RHVu?=
 =?utf-8?B?d3p1ZzcvV0JxUVlvVDlobkwvZFExdTE3bEZjQnZUbmx4WTFNUUtlVFp0UWxz?=
 =?utf-8?B?ME95a0l2TjRNcEI4MnlILzVJMTRLcmxiMGVSeTlmYlJtWFY0cnUxdkFPMk1v?=
 =?utf-8?B?SERNZ3BVUzNFUlNrQUlYMVBMVk9rVFlyOTFuRUhzeU1SR0NWOGhkMmVEN01i?=
 =?utf-8?B?N2lJczdKS0lyRExROHJreFdGMmt0SkFJcDFqWFBSS3pNb2NJQkdUNjFabW13?=
 =?utf-8?B?UWNUR3FDTkw1VmVpRTNZa0ZSZ1dIYXhNcGRJbkxkRi9XMExYQlRYQVo0QldO?=
 =?utf-8?B?aWhvTW90bzFQS3JzT0hmUnZpa041WnVrenA2ZzRLTlRvM3U0T0Uwc3RtUUlC?=
 =?utf-8?B?c3hqV2IyQms5enUydEV3SU0zN3QvanJFTkpsVytRRUI4dVo2bW1MWjlQN3pK?=
 =?utf-8?B?RGpOMGdMTFdBRVVCL0s3WWdwNUtmVFV2WTQ3SHpVNnE0b1BIRnMrYUFkSGRF?=
 =?utf-8?B?OU9TNEdLNENFeHdld1QyRDQwdmlNb1ZmRVMwdHJIOXNIZnlPWHl1MjE1L0Iv?=
 =?utf-8?B?MTlBUTVyZVU0ckd4NElKd2VZMUxHMXdFQklRWUFNK21hN0psdVFQUG9ORmV6?=
 =?utf-8?B?dGRhdjhuUWsxaXByZXgyWjFhdHFVMElVTVJ3OFhJQThidElXNFF0VndNV3dG?=
 =?utf-8?B?cVlSVVlua1lwUUVDdzVPMkJUSWF3TmoxUmc2TTNodmpOYzhtTFYxbnB3UUxt?=
 =?utf-8?B?M3pNMEVuQ1FLL2hZNk50SnlsWmJsMU5ON09YYVF4cWkrb0p3RFAvMGZXbnlz?=
 =?utf-8?B?WGtZOVFQOHczQkhzMWRRRTFzR0FaL0NWc20ybEJCQVcvTXRVZW96RDZGZUp6?=
 =?utf-8?B?QUlxdnlPcG91SDJaRTIwV1JNeW80c0hNNjhHNDVjZWJIcnNXbmJIeVJVOWVh?=
 =?utf-8?B?dVlxZlhqcmUvWmppdDh6cGdScDNCb1BNd3FoZTgxczJQa3g3UUJ0dHVEVmF5?=
 =?utf-8?B?MW1yV0ZrR3cxaFk2N2xlTmd6YS9Tc0JzNXlZdTV5RGduQzlrdjVQVzd1cUR0?=
 =?utf-8?B?bExPRG1OZENZWWJEZTBEZEk3c2FYUmdFNUtVVFVHbFdSMDFhUFR5elcwTDFa?=
 =?utf-8?B?ZnlPSDJTcFNQeE14WDk1blhTQjhaYThFQVk5c3MxZW5TcE5DcGt5b2lFR1ZG?=
 =?utf-8?B?MXg3TkUyVlkrcThpZ2JJQXVJTzV5REZocitkRWQ2a1JmTnFzZXhsL1lLSFNm?=
 =?utf-8?B?RTA1TnV1cjNLWjIxZm05ZXZxTnlieHluenJaSWdEaytHUDZGUlFNeTBnQ01z?=
 =?utf-8?B?NWlyMEx5MnQvczJLWFhXN0FGT2x2WjFvdTVUV1F2MW16SStQOWtWamUyUzd2?=
 =?utf-8?B?cHhzaEVNcXQ4bkhITko0ZkJEZzZGRFVMbDFDbnZpWFJUWm40L0xuSXQ1L2J3?=
 =?utf-8?B?UlBac3VXMWNkY0RxTkRtemxnbFkrc3FKQzdQMEFYNUhqaTgzZkdwYkhrYjJt?=
 =?utf-8?B?emhuWkFVVkZPdmhpckRPMEF1dytaQno1WkhmTDJsRUhZTnR2YmxsZFhhejQy?=
 =?utf-8?B?akl4blNXeXVhdkNwRGc1SDdYWnJyK2x2NnRLVHQvOHFvdWQwSkFVSXJYbEFQ?=
 =?utf-8?B?QlFqTkpkci9jM1Q1M0lSRVJ5QnFwQ05pOWZQZ0hpS3VxRHVRaWMvUXdLTFVj?=
 =?utf-8?B?alJlNnlNc1ZnZ1p4SmZDUUhXZlk5d1VyaHJjTVVBeURJT256NXRjN2RqbXIv?=
 =?utf-8?B?R1k1dXFyaHhaVzFqeEtaTXBIdTVNNDR3aHB5cDZUL0VkeTRmYUoyakF2TUt4?=
 =?utf-8?B?T0luNnJIV0swTlRub1MwRG1UVHNBb2RyQTJqWEFDN0luMUF6UHZDRlplRVVC?=
 =?utf-8?B?cGdOdTJhQS95WmJMb1lGdGwrbVVzYTBzcGZCMUtQTGJITVB4SWI1Ni9xZjQ3?=
 =?utf-8?B?alk2c0ZJNUFzNnVNRU55SXVPV0ZIK3ZjQjF6L2tJTWhsK25xSndDVTUxMzdJ?=
 =?utf-8?B?K09mWWZoSTRzRk9mRytmL1JqZ1p1S3MraVM1UDNmTlhuR0JxZmU3b1JIWTVZ?=
 =?utf-8?B?dGtMTmcyQlF2bDVRQ3lCRGUrQ1hua3Ztc29udW1qZzVkQXVTbXgwSlcxQnRH?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5582dc-6ec5-490a-5269-08de22736280
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 05:13:30.5240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLJYhsWcZ49hpGxJilw2+FyGNMJJngUXqwAft9nW1fQ9f5PWvVuUV9/PBMAzMT3zQR+JPmGRBnPUU02D0TcLdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9832
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

ret of type vm_fault_t is reused to capture the return value of
nouveau_dmem_copy_folio(), which returns an int. Use a new copy_ret
to fix the issue. The issue is not new, prior to this the function
called was called nouveau_dmem_copy_one() and ret was used to capture
it's value.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511121922.oP20Lzb8-lkp@intel.com/

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 244812e7dd69..06f2c544c2cb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -188,6 +188,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_svmm *svmm;
 	struct page *dpage;
 	vm_fault_t ret = 0;
+	int copy_ret;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
 		.pgmap_owner	= drm->dev,
@@ -256,9 +257,9 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	svmm = folio_zone_device_data(sfolio);
 	mutex_lock(&svmm->mutex);
 	nouveau_svmm_invalidate(svmm, args.start, args.end);
-	ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
+	copy_ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
 	mutex_unlock(&svmm->mutex);
-	if (ret) {
+	if (copy_ret) {
 		ret = VM_FAULT_SIGBUS;
 		goto done;
 	}
-- 
2.51.1

