Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BD6B9CCF1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 02:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5491D10E818;
	Thu, 25 Sep 2025 00:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q83bs2B1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011025.outbound.protection.outlook.com [52.101.57.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A2E10E818
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 00:06:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQMmP/LmxG5390kHg6Tvb0vHmnVHC8/9D6Ij23SL9fBmsG+Hv8YbruZIYw1K4faQOg42Xfj+FWfPlnfd+2ry9zayGOH7vRa6DUEOx6NrYNmZnOhsn4zhlMFV6tIQh2dpKge79/fVB/aQj/XDY5DecAU7em0x4mhsR1b9iSzjzmpxiODT1JOLuF0JDQO8PW0iHwvtDrluQeZHeLEfcvXZKrNyyYY564t6aiP99M07oJHualqKRQG7Z+LvQHym2HmPjMWaN0imzaAcLhWhczlFA10TT6yBmv+lkJEVj4czo1CEpdwgjdSDV9tEnHgcFNfXExhcAv+DD8zXu4duGiO2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owGUinnAF4x6oKMwGLdHMjP3suXXqPW/pvB4UVimNS0=;
 b=f828aL1XPtq1UsWARSA04r4BShzNdsGc8pFnHioWTpEkH40pl6lg6WmL/BydikNCTNOdJHH3X5E6SQiPwfFnz/hpPtPTSvCdpXpzg7RuJWtpdIxCDng5ZDYvW9NMW3JtI2Cs9rkddOaVkYnJdAy9QxcToUOXiebti9i6xV+frzlT2a5V03a/z0ha3wCseTaJQlTfIGkAFGknz8MwtBu7BAuwG39aph1jCgcgaFaspxsUJJalEH1YWkndG3/YdZJuHUKJ+xkgSfbG+eMw4bauzrFF73qkk5RLxieoSH7qu7WAjRIZuxjbGkc6gmSd1uPWd7IWDXVgcqhHkqGts0SGYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owGUinnAF4x6oKMwGLdHMjP3suXXqPW/pvB4UVimNS0=;
 b=Q83bs2B1MxosHZ/Nqyp/N62/fhKWxrR5KP45bZptTVRlyhze+2Axrg1qNEpJELAyUtFqjbujErDc7ZhLjxt0/ONbw24bxsT/wlAv125/4tdSGqspPf/YYsNvUt329Jt+XZV8aXS7J5R660v/nApqZKmF58LDv22QXaMTII73YLDNVI+skR/GxgmMMfjdQv2TJD7CyCMiyhmwgoPh7PQRo2OkTPETR1uAtw3jYqc9TffxyHS3ELGt3MYuJamAwfS0egLapan2cWnJ3y7K/bjV4IRSl+HhuIP1l8yu9LCsEFI+Yl1SIR14RtiJy8zUjqb9EvaF5tuj6GwMvoezd9egOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB5688.namprd12.prod.outlook.com (2603:10b6:510:130::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 00:05:59 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 00:05:59 +0000
Message-ID: <85e7c025-a372-4211-be00-f00f439d319d@nvidia.com>
Date: Thu, 25 Sep 2025 10:05:51 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 01/15] mm/zone_device: support large zone device private
 folios
To: Alistair Popple <apopple@nvidia.com>, Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>, Oscar Salvador
 <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
 <9c263334-c0f3-4af0-88a8-8ed19ef6b83d@redhat.com>
 <66A59A5C-B54E-484F-9EB8-E12F6BD1CD03@nvidia.com>
 <lcuuqa3e3txmhb55c5q3s6unugde4hp2wsmvkahgddeicyn2tp@xdx2zqjmd4ol>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <lcuuqa3e3txmhb55c5q3s6unugde4hp2wsmvkahgddeicyn2tp@xdx2zqjmd4ol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:a03:100::32) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb6e096-f07a-42e7-1e28-08ddfbc74e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmJSUUxJRjM5NVNLd1VlTW9xZEdVays5eUdMd3Q3dDB3WHJJTkVydkdTNnpI?=
 =?utf-8?B?NkQzRExzTHNjbzdtUnNhY3ZrYWZXSHNiMWpZamZCMkxTS3VLdzdZSzNzQVZI?=
 =?utf-8?B?UE9Da2ZzMHR4OFV0aEh6TUovSmVjSDdqR1E4UFY4NkdIQk1NbjQxZFVWZ3JT?=
 =?utf-8?B?cUVXb3hVYkdnSTIwRkZ6Z0tZNm1ScWdJcC9iTHhkTkt1ZWlDVnczMGhBM1Z4?=
 =?utf-8?B?b29oNVluc2NtdnI2MjN1ZWtURGZpc3BxYjE2ekpxQXYxbEpmQXp5UDBsMW4x?=
 =?utf-8?B?R09hZHVNY0tLVkJDYlY0cWRlTmFrUmJncXVaR0lZNTFBeE8vNS9TOUY3UFBQ?=
 =?utf-8?B?U1hiNDNOMzFBcHRXUncxRytHdXZwcldkVHhFN0N0TzI0Ni9aYTZyTUFVZ3Jh?=
 =?utf-8?B?TzNra1plZzZNWGR0UEpqckZGdWFrcjRObE1CeTdGOHJMMTY4cEdTSTVhbFZv?=
 =?utf-8?B?elJ6QmpSdWwvVEYvMXNxaHJUbFN5NjAwSXZwMkNMS0U1NmE0UUtzcmtTMXFM?=
 =?utf-8?B?bFJUMStGeFdsbC9nWnJwV2had1hMTkNlcVBhSWhaclF0ZmpiWDZMWUtVWmdO?=
 =?utf-8?B?cVhQSm1PK3NMVFBtcDA1UHc4ZGIwS2VWczlicHo4bmx1Y2FxL2UwcDIzdllS?=
 =?utf-8?B?enk1UnRvcmJxZlJ1UGlrZW9seFhsTXYzRWk4VkR6Z0M0elRiSkZIbGZNbUFH?=
 =?utf-8?B?eTNDdG1TbjUrazcveHBHWmIxb3cxaVNNL3F1bVpZNzFsV0FxQkdiMVB6akdj?=
 =?utf-8?B?VWxzRHYvTW9CZEpoRmVUSWRLQ093K1gwQjVSNDFMQnBPSi85T0FBTWtTVWZC?=
 =?utf-8?B?RnFzRHZyeHZ2MmYrRzZGV1dKUEpmVWNGNkR1VFZqMTN1VGphMVNrZndTajh2?=
 =?utf-8?B?ZVNENXJpSDQ1U2FnOEZLY09Tc3JsT0xPM00yVERIU2RGWWZqVnM4bFhua1E1?=
 =?utf-8?B?M3g2b29uWVlLdnQ5ampQcmg0NEJrTDZxWk5oeHZRdW1oM0lsOUlVcVdBRXRn?=
 =?utf-8?B?QngrczBBTjJnbEt6T3JzY0dMSUdXd3o2ZFc0a0RzTDBDTWtUdzJYMXJkQXR5?=
 =?utf-8?B?Z3VaT2cvbUFna0hISm9WOWhFc1JxeWNRZmF1amFWWUcxaG1zeUM3YWY2b0ZH?=
 =?utf-8?B?TmlUc1EyeHNlRnorMU83citXTXV0ZGJ1VlVSNHJ2MEgya3c2R3JEaVU2eldh?=
 =?utf-8?B?ZEErMS9OVVlLU21sZUpUSlZTL1l6aHhka0dPS3F0MHNxS2FQMXFKZkgrRlRn?=
 =?utf-8?B?cHFJeU9ndEpJSktXR2MwNE1zdmQvdVdmWlRTNk9UcEpOejRoeFVjOUpCUkky?=
 =?utf-8?B?SlF2VDQxS1V1RXZzQkhDeEUzdTdmdEdHNlk0N0Q1VDVlTzJCc2NkTmF1MStD?=
 =?utf-8?B?WXNDMlgxemtqbENKeFpmWlBmM1pMTXFDV3JWbW9nUk9mZlhjY0RrK0FRVGFt?=
 =?utf-8?B?b0t4TXV2bU5wVjRLZ1dJaElxYjJmakFXT0JaNzFJK1ZudEMxZXRMMnk4TEVy?=
 =?utf-8?B?QURnUTZMYXRWTG1EdlBKN0w3VkpOV1lNcWMyMHBwbEtubkdhSlFpdzFxbVpm?=
 =?utf-8?B?TUZDZTErWUJkaDZXUjJSS2llYjVNaWlzaGIveUtqcHp1UEpzeXp6WEMwYXUw?=
 =?utf-8?B?Zjl6Sy9lVGxSelFGSjZmaGhNZHY4Sk5UQUJLanI4YitKTnBpbTZTNzNMVmQw?=
 =?utf-8?B?TWtWMEtOTm8xV0xrRmdGQ243bVV2ejVGSFVhbzJuN20yWUxPQWpLTEVEdUVa?=
 =?utf-8?B?RzFRWmhmb0duNlZCTWxDT3B3cVFSSFFZb1Y5anN3WWNaclFPeDdvTk5wUnly?=
 =?utf-8?B?bmdNcHNkSUdxSVMrRzQ2TTJ5L21pbjJTc0ViSHZZMDdhOGlWN1VLd0hmU1BF?=
 =?utf-8?B?TnBCVWJNTjczaHY1V2hUZFpKYm1veWt1TnBrLy9Oa2VPMGZHWHJCOSt5QTEr?=
 =?utf-8?Q?krjgCSLKjgo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0loMXlFengzeWxmNEpNOThWNkZVNjR2NXZKaVlVR2hWeEVIdkRaL3hSdnd2?=
 =?utf-8?B?RkUrbDhLY2VKYWJFUzNrTk9QcjB5OGdJcDdXMlNZSzZxbXUrSkhYbjA0M21F?=
 =?utf-8?B?TnVseWFMdVJ3b290UXZtdXo4SHBWaDlweGFpQSt4aVYwaHV0RWo2cWZmT0Jt?=
 =?utf-8?B?dTJsVklvTDkyY0pVMUJSaU81N01CaC9DcitHTExxckZITWFRRytKNGxxNnky?=
 =?utf-8?B?OUpSME84WGtkSnY3amVZaVZWS2VCdlVVR296WE5aaEJuQVZiTFpVejcvN215?=
 =?utf-8?B?ME14ank3cElTYmJvTVg3RDNjNk1NYWMzTUlyT3VWZytwV09yYjVHNmRqMzNN?=
 =?utf-8?B?K2dNZGl4S0NEK1N5YTZXTnUxMjZWakI0eHlHaVhhWVlySm84anNoemRJM0JN?=
 =?utf-8?B?emo1SmNnVFZZM0RaT080NEFYcUViQVUra00vVCtqZlMrNG9pY2RaL0pVa2Fi?=
 =?utf-8?B?ZCt1NlpNUDRhV0sxblo3Y2N3MmVBN0NybTFGRi90ek5QWldvbXJWT2YzdTNS?=
 =?utf-8?B?a3lrSHlxR2I1QlRYZWE3TjNxTHdoOGJOeHF6Q3gzampnamhaUGlmMHVWV0ZU?=
 =?utf-8?B?N21rcTFKVjdVcHVYMUg5OFZwSWlNeUlJV1FESmw5RzdqRUt3RGpKZ2lHZjdt?=
 =?utf-8?B?UzZkS3NyanU3UVlCR2w1Z2RlQzRDaGdLSDJCcFRoSXNVV2dGQm5MUnUvakFk?=
 =?utf-8?B?YXpudVVkQ1NYNEtwSitBK005T2JScFFwNitiU1gyY2hzc3ZiNEYyOHB4NzFk?=
 =?utf-8?B?MTJnT3U2dWNPV3dGWk9UR3RyOTdqZmNmUzBJV2EzTUt4WGxpWmV2a3lqbm9k?=
 =?utf-8?B?di9jcVJidmFxMVdNM3NYTmY5c2R3TTJvaGhJSW85VFBSUlhNZEFHMUkyRytM?=
 =?utf-8?B?TzVsSWxTZk8xcXhYK3hhTk5nU3gzNWpNRy9yRy9DeEtTNTVjRWZKK3Y1T2l0?=
 =?utf-8?B?WjBtT2FlUmNhK24zdDNZdGRMS09QNk5VZVVKbjBjQUMwWFp2WTg0KzBWSElz?=
 =?utf-8?B?Y0VGK2pUcXZ3bCtSYnNxQmlNSDNZdWFyQWJMSm4rdHUwbVNicUQ2aVFuMVZO?=
 =?utf-8?B?SlFpbmhRaEJPQVdRMkRnRUV2UWYyV0R6ajZ1a3pYZGVxWTBlWUM4OU1vUm9p?=
 =?utf-8?B?dHJMQjlQbEMrMFN4T1FsdGczSWFMYkV0RFVJOFJjMXoyQk05TGhNMFhYeEpX?=
 =?utf-8?B?VVY1dGFVMmtOTG9DSk5NM3Nya1RZeWNTQ21pM2JuZFUyeVlTcGVxSWdOY0V0?=
 =?utf-8?B?SGN4am9GbDZ4M0RjVHRQUFFjSmNlWSs4dytLSEJVbElJcEloeCtIZElNN01T?=
 =?utf-8?B?RzdIcm1LUXlueFJDWlhxMUFqNFpEbnpTVWQ0WjIzU1owb29peFphcklJUC9S?=
 =?utf-8?B?Q1lGWmQvN2l3TUVVdW9PYVQ4U2hnTEpjNFhraEtpKy9zM3pPTldZREtHWTB4?=
 =?utf-8?B?TFRlaEI2K24reDJ5UmErQUpGVmRMbk9hY3hrVWxWbUxML0pCbURDTWVvUnFj?=
 =?utf-8?B?azdhb1dWYkhnS2NhVk1hM3J4TzhrOTRlMWVJSG1QdmpCM0ZVUVZjYlNUcGsz?=
 =?utf-8?B?UGxmUmZOQXRWNFRXdmM2anF5by8wV2U4SVNhWk90Nmg3bUoyRGpLeFc2aXFz?=
 =?utf-8?B?dis3aHNhVmdVaXJVM2cxYWlZeUhYNkdIeDliV1FaQjJGWTloM2dnSW9zaTRP?=
 =?utf-8?B?VlJBc3hnVldaT053SHNJZWx4aHRJcnlTQjFVZkxQVk11QlJkODVYNjBDRlkr?=
 =?utf-8?B?V29hc3hTUU9sS1NCU3JjNlFJdkZTSUhnYWQ3VE5neExUNzBoUno2d0pWdERv?=
 =?utf-8?B?VmNDcGc0NUQ1UmZraEdoWk9QZ2NEUERCSWxaVkc4Zm1lNVJORkNtZ2ZaVXBR?=
 =?utf-8?B?WWZUZmZnWWtvWFZLcHdPUUNsRXY5SEQxQkQvUXoyVFpvQzRVbHJFVUtNbzZF?=
 =?utf-8?B?SzVvRlpDSElMMFFRSkZubHhIcGxNR0ZsSVpRQVQydjZIc3QrVkRVSXNNWlZO?=
 =?utf-8?B?MnY3ZnZIS2ZIV0dIT0hYRXVwTjNYTStNcTd1TG9TWkxoczgxdk5FcTVid2Nk?=
 =?utf-8?B?QUhZa2Nrb3dLLzk1T1VINUh0VGZLTHNSVVBmV29VVG93RlYvY2wvU1ZacDBh?=
 =?utf-8?B?SFlyTVNjeWU3TUN0d0lxZGU5eHBTdUpLdkQ3aXYxeDdUTkxNMlZ2OTBVWkk0?=
 =?utf-8?Q?1EBcA49MMdpyDCMOR20FAkSmdTkY8CIjRYz/uRECussa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb6e096-f07a-42e7-1e28-08ddfbc74e9a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 00:05:59.4489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVbFnUFekGgVBzI6dW2DN0Rcfq7gQOPv5P2bglqhQrAVI4BibBBE6nneWQBfqLrvaD+ClBT+vAUsg//jmtq+Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5688
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

On 9/25/25 09:58, Alistair Popple wrote:
> On 2025-09-25 at 03:36 +1000, Zi Yan <ziy@nvidia.com> wrote...
>> On 24 Sep 2025, at 6:55, David Hildenbrand wrote:
>>
>>> On 18.09.25 04:49, Zi Yan wrote:
>>>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
>>>>
>>>>> Add routines to support allocation of large order zone device folios
>>>>> and helper functions for zone device folios, to check if a folio is
>>>>> device private and helpers for setting zone device data.
>>>>>
>>>>> When large folios are used, the existing page_free() callback in
>>>>> pgmap is called when the folio is freed, this is true for both
>>>>> PAGE_SIZE and higher order pages.
>>>>>
>>>>> Zone device private large folios do not support deferred split and
>>>>> scan like normal THP folios.
>>>>>
>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>>> Cc: David Hildenbrand <david@redhat.com>
>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>>> Cc: Gregory Price <gourry@gourry.net>
>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>>> Cc: Nico Pache <npache@redhat.com>
>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>>> Cc: Barry Song <baohua@kernel.org>
>>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>> ---
>>>>>   include/linux/memremap.h | 10 +++++++++-
>>>>>   mm/memremap.c            | 34 +++++++++++++++++++++-------------
>>>>>   mm/rmap.c                |  6 +++++-
>>>>>   3 files changed, 35 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>> index e5951ba12a28..9c20327c2be5 100644
>>>>> --- a/include/linux/memremap.h
>>>>> +++ b/include/linux/memremap.h
>>>>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *page)
>>>>>   }
>>>>>
>>>>>   #ifdef CONFIG_ZONE_DEVICE
>>>>> -void zone_device_page_init(struct page *page);
>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order);
>>>>>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>>>>   void memunmap_pages(struct dev_pagemap *pgmap);
>>>>>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>>>>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn);
>>>>>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>>>>>
>>>>>   unsigned long memremap_compat_align(void);
>>>>> +
>>>>> +static inline void zone_device_page_init(struct page *page)
>>>>> +{
>>>>> +	struct folio *folio = page_folio(page);
>>>>> +
>>>>> +	zone_device_folio_init(folio, 0);
>>>>
>>>> I assume it is for legacy code, where only non-compound page exists?
>>>>
>>>> It seems that you assume @page is always order-0, but there is no check
>>>> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) != 0, folio)
>>>> above it would be useful to detect misuse.
>>>>
>>>>> +}
>>>>> +
>>>>>   #else
>>>>>   static inline void *devm_memremap_pages(struct device *dev,
>>>>>   		struct dev_pagemap *pgmap)
>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>> index 46cb1b0b6f72..a8481ebf94cc 100644
>>>>> --- a/mm/memremap.c
>>>>> +++ b/mm/memremap.c
>>>>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>>>>   void free_zone_device_folio(struct folio *folio)
>>>>>   {
>>>>>   	struct dev_pagemap *pgmap = folio->pgmap;
>>>>> +	unsigned long nr = folio_nr_pages(folio);
>>>>> +	int i;
>>>>>
>>>>>   	if (WARN_ON_ONCE(!pgmap))
>>>>>   		return;
>>>>>
>>>>>   	mem_cgroup_uncharge(folio);
>>>>>
>>>>> -	/*
>>>>> -	 * Note: we don't expect anonymous compound pages yet. Once supported
>>>>> -	 * and we could PTE-map them similar to THP, we'd have to clear
>>>>> -	 * PG_anon_exclusive on all tail pages.
>>>>> -	 */
>>>>>   	if (folio_test_anon(folio)) {
>>>>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
>>>>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
>>>>> +		for (i = 0; i < nr; i++)
>>>>> +			__ClearPageAnonExclusive(folio_page(folio, i));
>>>>> +	} else {
>>>>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
>>>>>   	}
>>>>>
>>>>>   	/*
>>>>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
>>>>>   	case MEMORY_DEVICE_COHERENT:
>>>>>   		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>>>>   			break;
>>>>> -		pgmap->ops->page_free(folio_page(folio, 0));
>>>>> -		put_dev_pagemap(pgmap);
>>>>> +		pgmap->ops->page_free(&folio->page);
>>>>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>>   		break;
>>>>>
>>>>>   	case MEMORY_DEVICE_GENERIC:
>>>>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
>>>>>   	}
>>>>>   }
>>>>>
>>>>> -void zone_device_page_init(struct page *page)
>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order)
>>>>>   {
>>>>> +	struct page *page = folio_page(folio, 0);
>>>>
>>>> It is strange to see a folio is converted back to page in
>>>> a function called zone_device_folio_init().
>>>>
>>>>> +
>>>>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>>>> +
>>>>>   	/*
>>>>>   	 * Drivers shouldn't be allocating pages after calling
>>>>>   	 * memunmap_pages().
>>>>>   	 */
>>>>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
>>>>> -	set_page_count(page, 1);
>>>>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
>>>>> +	folio_set_count(folio, 1);
>>>>>   	lock_page(page);
>>>>> +
>>>>> +	if (order > 1) {
>>>>> +		prep_compound_page(page, order);
>>>>> +		folio_set_large_rmappable(folio);
>>>>> +	}
>>>>
>>>> OK, so basically, @folio is not a compound page yet when zone_device_folio_init()
>>>> is called.
>>>>
>>>> I feel that your zone_device_page_init() and zone_device_folio_init()
>>>> implementations are inverse. They should follow the same pattern
>>>> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
>>>> zone_device_page_init() does the actual initialization and
>>>> zone_device_folio_init() just convert a page to folio.
>>>>
>>>> Something like:
>>>>
>>>> void zone_device_page_init(struct page *page, unsigned int order)
>>>> {
>>>> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>>>
>>>> 	/*
>>>> 	 * Drivers shouldn't be allocating pages after calling
>>>> 	 * memunmap_pages().
>>>> 	 */
>>>>
>>>>      WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
>>>> 	
>>>> 	/*
>>>> 	 * anonymous folio does not support order-1, high order file-backed folio
>>>> 	 * is not supported at all.
>>>> 	 */
>>>> 	VM_WARN_ON_ONCE(order == 1);
>>>>
>>>> 	if (order > 1)
>>>> 		prep_compound_page(page, order);
>>>>
>>>> 	/* page has to be compound head here */
>>>> 	set_page_count(page, 1);
>>>> 	lock_page(page);
>>>> }
>>>>
>>>> void zone_device_folio_init(struct folio *folio, unsigned int order)
>>>> {
>>>> 	struct page *page = folio_page(folio, 0);
>>>>
>>>> 	zone_device_page_init(page, order);
>>>> 	page_rmappable_folio(page);
>>>> }
>>>>
>>>> Or
>>>>
>>>> struct folio *zone_device_folio_init(struct page *page, unsigned int order)
>>>> {
>>>> 	zone_device_page_init(page, order);
>>>> 	return page_rmappable_folio(page);
>>>> }
>>>
>>> I think the problem is that it will all be weird once we dynamically allocate "struct folio".
>>>
>>> I have not yet a clear understanding on how that would really work.
>>>
>>> For example, should it be pgmap->ops->page_folio() ?
>>>
>>> Who allocates the folio? Do we allocate all order-0 folios initially, to then merge them when constructing large folios? How do we manage the "struct folio" during such merging splitting?
>>
>> Right. Either we would waste memory by simply concatenating all “struct folio”
>> and putting paddings at the end, or we would free tail “struct folio” first,
>> then allocate tail “struct page”. Both are painful and do not match core mm’s
>> memdesc pattern, where “struct folio” is allocated when caller is asking
>> for a folio. If “struct folio” is always allocated, there is no difference
>> between “struct folio” and “struct page”.
> 
> As mentioned in my other reply I need to investigate this some more, but I
> don't think we _need_ to always allocate folios (or pages for that matter).
> The ZONE_DEVICE code just uses folios/pages for interacting with the core mm,
> not for managing the device memory itself, so we should be able to make it more
> closely match the memdesc pattern. It's just I'm still a bit unsure what that
> pattern will actually look like.
> 
>>>
>>> With that in mind, I don't really know what the proper interface should be today.
>>>
>>>
>>> zone_device_folio_init(struct page *page, unsigned int order)
>>>
>>> looks cleaner, agreed.
> 
> Agreed.
> 
>>>>
>>>>
>>>> Then, it comes to free_zone_device_folio() above,
>>>> I feel that pgmap->ops->page_free() should take an additional order
>>>> parameter to free a compound page like free_frozen_pages().
> 
> Where would the order parameter come from? Presumably
> folio_order(compound_head(page)) in which case shouldn't the op actually just be
> pgmap->ops->folio_free()?
> 
->page_free() can detect if the page is of large order. The patchset was designed
to make folios and opt-in and avoid unnecessary changes to existing drivers.
But I can revisit that thought process if it helps with cleaner code.

Balbir
