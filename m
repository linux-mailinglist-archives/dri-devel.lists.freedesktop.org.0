Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06905BACBED
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588E410E59F;
	Tue, 30 Sep 2025 11:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jdXdklHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012017.outbound.protection.outlook.com
 [40.107.200.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184D810E59F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:58:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6z5vZIxf6yKgaBX2dYkUhinH18cgIQk5S0NNAvW+5zTW5Q0YCaYGg5uQqz4mhJtKpqMB7nMc86rULqFyf/hYzWZJJ53hkzi7vh7H8PNvoksg0Djujp9ctJ6UaWSSRO4OCmcaPFXbyJDdgKlPwcgmdo5zzyjiM/0/IQNYlNL6knRuX0qNp7of7kURs1gmIzTL72AVh1/AaQVcmQk0j3rLC2qLrdbGKMF4KsX6bPpYa3jzUBsd8qu03WW2GJV57PqPlNvI6uhDp1E0cj0Uppam0LqD1ghd26U8rpeIdjHHhdVC2jS++5hCMTpOR6rpK70Pn+lSa6uVgVL+19YfxoO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NhhTwUayCFwiWGqdq5QAMZ/NIUlBifpeqv3sHCxMl8=;
 b=yw3SqFFn58hxZSTFdgY3EObzbjptr53UQfPxNkhSSKd4g6hlKosdVe9fNEaOjd6nrKaBQWbbi9WJBTpSFkh/LD2oz5BU9Auj9gKQNDntWOzpOrfczjgOyO0mor7lZa3lKYj0nf0OKDugm95TfEBp0tfe79zKSM0LpcVVNnsWpp/uorloSGQYq7nZreOj71dje371wM7Jdz2fYZ9uk4AsOvxPxV8TA7ex84wlvoJJQWjMBb8uzoyCJDOiO84VL+67FOseVb1Xqqqbt4YV7Kl+2oROZjucTuztfMq19vexArk19RzC3YMiecTdagyGKkow/Z+ssQaL5Apu5fqWaghBBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NhhTwUayCFwiWGqdq5QAMZ/NIUlBifpeqv3sHCxMl8=;
 b=jdXdklHWpU9d8GIWF9ZJiyOdS5FQ9VAETGhHhbwKuHsofgmmuy1KIhDv6eorgWWaDvK68kCyULoNTM0YMjEOj3tvk1Mug/lJXSrolztIFtX/Bxi3rEsZFLHtRcVvT5d84L8yM0WQY6hkXmN7H24MXeK32RPjvvDTzFc+Ldx4R6z9QqK4O4fUnunjJrkYpTj8tDCUQoqYVRvtZc8SzJDX88CK/tk+Cl3d75QaGf4n9kdKWFeJEvEwJyGsRWZILedH26A8XJA0GCv9cSHauGjR4PuljzDK3bUFTaTWImmfimWWVol5tMLz4Wam1SU/i1kJEoS5UaqcJMcvIP0FSxbM/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN2PR12MB4077.namprd12.prod.outlook.com (2603:10b6:208:1da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 11:58:47 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 11:58:47 +0000
Message-ID: <017d8748-8eda-4937-b69e-6244797ddc79@nvidia.com>
Date: Tue, 30 Sep 2025 21:58:38 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 05/15] mm/migrate_device: handle partially mapped folios
 during collection
To: Karim Manaouil <kmanaouil.dev@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
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
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-6-balbirs@nvidia.com>
 <3FE3F2B9-86F9-4EED-863A-093FE3959B1A@nvidia.com>
 <62fb7aca-cd30-4058-bfd1-d08f78d5c38d@nvidia.com>
 <20250923155640.lbtvyi54ueyv2tjb@wrangler>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20250923155640.lbtvyi54ueyv2tjb@wrangler>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0050.namprd08.prod.outlook.com
 (2603:10b6:a03:117::27) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN2PR12MB4077:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b244be-74c5-4cc7-235f-08de0018b642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTludGJmY1RsWlVHeENBWmFKc3l5TmNsTGFrM05VS0RSY2xubS9CQlVzNWNu?=
 =?utf-8?B?UFpSOENmaGgzMHdoRDYwUVIrN0hNZVEwWHBsRzVTdHpCajFNMjJmNmIrOTF6?=
 =?utf-8?B?eG8zMzRmK1NRbDZ0YkgwRDYzRUthRGFmWXMvOWZ5WG4wRmdBaEtEMjZxSGNp?=
 =?utf-8?B?Z0MyMWRIaHpkenJxdXhmU2FQT3BZMFR6ZG1UQkcybTEyUWZuQm82ME5nTlhP?=
 =?utf-8?B?MEtSdXlRSTRMTUNFcU9rLzZCTGFJOWxudWl3U09kRC90SkxJY0tDSjg5aVBz?=
 =?utf-8?B?T0xTOFh5K3hpLzJiaUVsZTNFWGVja05XVFR2b2kvZk1EMVJUTVpqMGlhaFV4?=
 =?utf-8?B?WDNyTFVwdEt1b2FnTXg1TGloSWxseW9EY2kxL29FMldUcy9ZK3JRVDluMXZv?=
 =?utf-8?B?TkdCZmp5S3RybmFncC9mekZ3QnBKWFFKMmVRTVQrZGIzcDJsTTFNa3l6N2p4?=
 =?utf-8?B?bDN0Vk1HQjh0NmtxL0FHckNVMGFJSGRhb3ZtM1Q4RjZiMWFLd3M4dnBVeW1L?=
 =?utf-8?B?VVlrRWdNNXJwR3FwdG13bXdVQytOOWlPV09TSDN1V2IraDFqWG5XNDE0c0xF?=
 =?utf-8?B?YUFwSS96OHcybEJsS2tLbjdSc0RIYXgzOGhWWm90WDZ5a1ZMOEh1QVFzSjUw?=
 =?utf-8?B?TzRSQkdqbkdYYWhRZ245bzh5SnhUWlZDUEdSOTQwTG54aFRPTXphMW9WMVYv?=
 =?utf-8?B?LzlkWkRHYXdwNnI1MU9iODY3Y09CZ3JHTXQ0NEFvNFVSLzNxcVUwWkhncTNI?=
 =?utf-8?B?RGdKZVh2NlRNZDJ4WGswbU8zSHA2dGw0R3dLSkpYOVUvU1NZaTZlTE4xbzdZ?=
 =?utf-8?B?amJYZ0JwRXBkaHRxV1U4K1dxL2dGWVBmM2x4Y1Fka1VScjBZaWVNUHJtWm1t?=
 =?utf-8?B?WEptaDFxRlBMVzBVaTE4VC85WHQ4dWtJSFk1U1dLaEJXZVZVSmk5RFJhWGto?=
 =?utf-8?B?OVlCS3dxRmFDRURlVHVtZ2Mrb0pnOHBBd0lnNjJycVY2MWd0MnZ6ZFhYb0U4?=
 =?utf-8?B?THFMNE5ycDYrUGZQVk8vQ1lubkRqWkpGVS9ucExOVGRQc2Q1R1JOZ0Y2YldR?=
 =?utf-8?B?ekM2QXZNbWpoeUZVajFTRUR3bktIYXUrTFRCUDNiVGFJdXlPQ3lGbWI1Zktr?=
 =?utf-8?B?Yi9jRXlDckFwSHV2NVEzWWtyc3QrazVEeVlJdzVVUFlKeGdxbE05Wkk0OGVT?=
 =?utf-8?B?NTU3N3AycXdLdnBpZ1NRZTdhRitTOTZhWlpuVCtiUFM5TjEyam1XakVFWGxk?=
 =?utf-8?B?VERBbTFhNnNEYm51Q1I4NXA5RHpaVW1HcUE2VDVZMTY5WTJ2ODQvQURLS1Q2?=
 =?utf-8?B?eWJFQzkxR3hNT21WQTBZUTV1Ymw3c2xremlMWFp1cC9DM1l1cFR6Wmwyb1pH?=
 =?utf-8?B?c0FzclJCYkhlWGNDSEtGZi9vbkQ0dXVHWU5Vekhmck1ybVdYeEI5Q3hrcjcx?=
 =?utf-8?B?NjdINFlwelVYRnlUMTR0ZXh4a2VCN3g2YzRuS2ZTWUdMNFpTR0JRRlZCL2Vh?=
 =?utf-8?B?SnBWaFZBWk5JTG1zclN5d0F5OEt3SVY3ZHdnclQrZTl2eFhmMVRMaFVXM2Iv?=
 =?utf-8?B?NGdKOHRCZGhjbzgrWmR2NlJQVkxlaHpxenNYdnlObTNqR3AyUjZ2dlByYnln?=
 =?utf-8?B?VUFpck5yaGF5Umd6SWgxR1JUelZjN29nMXNFTHRFUWZFMUZmVU1yUFNUQ3hy?=
 =?utf-8?B?UkdMMFdVMlBpUWYyN3JQa3Z0NGRzQWZ0QjY0VENqUEUwTmZ5NVpORThsb0ta?=
 =?utf-8?B?MEFINWppQmd0MU5OTzl0YUd3SkErb3YxcTdMbkVIbTR4UlMvOVYxZGZEOS9I?=
 =?utf-8?B?WXhDYnZqNjFFQ2syN3BOK1FmZlprT1I0UVNzUVBabHRrSGwyYjhPMVNYTllG?=
 =?utf-8?B?a2NaQXVpU01HUVplVkN4c1pwODhGVVQycXpZM1ZMTzUxamlCVC9jdlZKbGdB?=
 =?utf-8?Q?YXJmDeKO6AH16TlXtZikcmAGaB4xtI6C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dElCOHZNemF4OWZyUkQ2NnRBRnB6NndNWTNiQXBCeHpPTDNIaCtZWEx6bHBy?=
 =?utf-8?B?REtzclU2M3FnbkpOTnpNKzNadXZVTm12UloyOEJGOUFRUWp0VlkzWjFFSi9h?=
 =?utf-8?B?aldaVm1WVzRnV1ZzbEEwQVFQMkFoMkpKNW9zMVh3S3dPNmlpYnphSHlzejR1?=
 =?utf-8?B?Y3Ryd2hYalIzVXUza1N5QkMydkdGdE9Qd0lWaWtxTnZidHVmZ01GVXdoREQ4?=
 =?utf-8?B?ek9Nd3VDTnZFbGFLVEZ1TXczZ2p6bitsYWZrbEEvRUN6ODBOSStoVE1MS0Va?=
 =?utf-8?B?ZmJKdEdnWTFNRTBBWUpvb0JuOW1rQ1BPNThWU0x1MkhURlJST3JkbWZaNi9B?=
 =?utf-8?B?OHJxWDdXOXBCcjdFa05jL1hPZ3FJaUM1NG1tRW0raEIxMU8rUVpMNTZnNk1n?=
 =?utf-8?B?ckNGYlp1Y3YzU1lHNGhDbXdHOVhWelRYcWVuS25UbnArSVcwUzRoRkU3YVF6?=
 =?utf-8?B?UXV6emtNK1JLVkFQYlVPN0JvbjZJbVpOS0E1ZUxKVzhieXVLUSthMWFkOCtR?=
 =?utf-8?B?QjZiNTI1K3VkSk1XbXJ5RkF5UVVQeDFTSm5OTC80V0lmV1dac1Z2WlJlSmlN?=
 =?utf-8?B?a1JTYXFJS1hucDlTZEx3RVBNL3F1UDlzVVcvc0NxSjFrS200c1VVNXBoZU5h?=
 =?utf-8?B?UTM5QWJXQTRKb010UldvUm5oNTEzYkg1U3plOVljSDE2VWJvVmloMDhBeW1G?=
 =?utf-8?B?aG9Kd0FDUEN1T1BMa09TTjhiVnNEVXNGV0JPQzdsekM1bjRSZEFBR0lSazFt?=
 =?utf-8?B?SGpYZjIwc29XT2dqN2tvME5iUGNIUlozVzhQVlF3M25odzY1L0ZQYjcvbzJy?=
 =?utf-8?B?aE1qbGUxcVBQYjVST1NPZklhaGl5ai8xU2wvOFBDdWhuV3lIQkJUSmZPVTMv?=
 =?utf-8?B?bzVBa0VPZTlrd0l4V1VVR3ZiaStRY3ZQQ3N4WExMTzZTdUlqU2ZmSS9NVGpx?=
 =?utf-8?B?WHA3ZkQ4OFlCQm9TUkFydkNMSkl5Y25YWUthK20zTVhaUGhURnVBWmxkYTVl?=
 =?utf-8?B?VDZ2TVpRUHQzWk9qUE9NQ1J4UWl3bFI5V0gxMTFvdk5XM0c5bE5DcllvYTg0?=
 =?utf-8?B?RDJ3M0lXejRNYWNkVlZlblFtYzFIT0RLTUFSUS9ZU004UENQd29qNkFiYm9P?=
 =?utf-8?B?ekxWN0Q3TnBJK01mSXdKZXlFRzNFWDg2U3l4SDh0dVlibkY3eS8zUHRkaTdP?=
 =?utf-8?B?Z1VsRElVcE5pT1pjOWpFVlZJZkZvQ2dBTXA4bmhPT0pZTjJuaktVSEZIemJp?=
 =?utf-8?B?S1VadGNtVFV5Q3RpdGdSTG5EL2ZBVS9HNmVWVjVpclRsMkxWWXJDa0wyNDNK?=
 =?utf-8?B?NkFCMTE2U3dqbGlLQ0Y0OVpVMjJNSTR5NEdFTUJrQUpVeXcvSkJEZGJHNjdS?=
 =?utf-8?B?dTJyZmxiYUlPdmZ2eU5kOWRIYVVVVkRUQ3hjSjJGN3pabzQ2ZXFZQzFBSnFk?=
 =?utf-8?B?ekpkOW9TK0FIZU5hd1UzVW0xWWZudXJkQzY2Zlk2VnFMekZ5c0p2dmpibTVz?=
 =?utf-8?B?MWxacEVDamp4NlVieHBQMWJNNFR0a3RZTWhvbUdDNW9CdVdaejhzSHk1T0VJ?=
 =?utf-8?B?dDdNTTE0SlRmYXBNakRpaEdtV2k5UjN2aHZzWGxFYjR5bGlOMzl1OFUwRnNr?=
 =?utf-8?B?UWJuUVFXSzhmNUw2L2xkTjJxL1dtRXl4U293NU54NStIeGZ5Wm5qa0loekNa?=
 =?utf-8?B?K2laSFBPVktkeElBZXZaWDViMTdIUDg2LzlkMjJJQjBXSXE1MURJS0pjSmNP?=
 =?utf-8?B?WnFBa3JFeDZHbWdCKzJsS3VqOFBoVnNvYndiZTFaNVBLclliVDZ2TUxyS0hk?=
 =?utf-8?B?N0hZbURycVhVTkpqY1BmK3RwS2IwVkV1aXlvZnFlcXZzd2JIdmhOeDN2MUsx?=
 =?utf-8?B?aFE2ZnUwRXhpQjYrTEhtTUthL1NjRk9XMGpOYVM1dkhtTm1VWnpEaUxVTTNK?=
 =?utf-8?B?Qm1ocjlzQ0RDMGtWZHB4UGR5KzEvdlBoYU1WNkZYMTJKeVZLditycTg3Y0NK?=
 =?utf-8?B?UVN4bnFOYjF1ZEJpOHA0c1lsWmtMV2FJRTI1cHNuVlhSRnAxWisvenBtK21B?=
 =?utf-8?B?SEViVElEaGFORDhRN1NnQk9jN3AyRDBmUzZJSjJEcFdOMjhBOVNWekQ4bFV1?=
 =?utf-8?B?a0RQTEJQRXhrRC96OW5hNWVnRjNQMDZEeE05dytXMzJCRG1tVXJ5dEFuWmpS?=
 =?utf-8?Q?AF7/R2vkB0UUshcXnp83AxYCz43fNYHvEOJ+7S3ZsuSQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b244be-74c5-4cc7-235f-08de0018b642
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 11:58:47.2061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHJpHiubXvPO51laq3S1g534YWOihUC43VKj4dnfSGtRkLBqSXXLasvH2opPo9hhwy6AOvNqRNrmgKiqoAXjmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077
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

On 9/24/25 01:56, Karim Manaouil wrote:
> On Tue, Sep 23, 2025 at 01:44:20PM +1000, Balbir Singh wrote:
>> On 9/23/25 12:23, Zi Yan wrote:
>>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
>>>
>>>> Extend migrate_vma_collect_pmd() to handle partially mapped large folios
>>>> that require splitting before migration can proceed.
>>>>
>>>> During PTE walk in the collection phase, if a large folio is only
>>>> partially mapped in the migration range, it must be split to ensure the
>>>> folio is correctly migrated.
>>>>
>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>> Cc: Gregory Price <gourry@gourry.net>
>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>> Cc: Nico Pache <npache@redhat.com>
>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>> Cc: Barry Song <baohua@kernel.org>
>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>> ---
>>>>  mm/migrate_device.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 82 insertions(+)
>>>>
>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>> index abd9f6850db6..70c0601f70ea 100644
>>>> --- a/mm/migrate_device.c
>>>> +++ b/mm/migrate_device.c
>>>> @@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>>  	return 0;
>>>>  }
>>>>
>>>> +/**
>>>> + * migrate_vma_split_folio() - Helper function to split a THP folio
>>>> + * @folio: the folio to split
>>>> + * @fault_page: struct page associated with the fault if any
>>>> + *
>>>> + * Returns 0 on success
>>>> + */
>>>> +static int migrate_vma_split_folio(struct folio *folio,
>>>> +				   struct page *fault_page)
>>>> +{
>>>> +	int ret;
>>>> +	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
>>>> +	struct folio *new_fault_folio = NULL;
>>>> +
>>>> +	if (folio != fault_folio) {
>>>> +		folio_get(folio);
>>>> +		folio_lock(folio);
>>>> +	}
>>>> +
>>>> +	ret = split_folio(folio);
>>>> +	if (ret) {
>>>> +		if (folio != fault_folio) {
>>>> +			folio_unlock(folio);
>>>> +			folio_put(folio);
>>>> +		}
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
>>>> +
>>>> +	/*
>>>> +	 * Ensure the lock is held on the correct
>>>> +	 * folio after the split
>>>> +	 */
>>>> +	if (!new_fault_folio) {
>>>> +		folio_unlock(folio);
>>>> +		folio_put(folio);
>>>> +	} else if (folio != new_fault_folio) {
>>>> +		folio_get(new_fault_folio);
>>>> +		folio_lock(new_fault_folio);
>>>> +		folio_unlock(folio);
>>>> +		folio_put(folio);
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>  				   unsigned long start,
>>>>  				   unsigned long end,
>>>> @@ -136,6 +183,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>  			 * page table entry. Other special swap entries are not
>>>>  			 * migratable, and we ignore regular swapped page.
>>>>  			 */
>>>> +			struct folio *folio;
>>>> +
>>>>  			entry = pte_to_swp_entry(pte);
>>>>  			if (!is_device_private_entry(entry))
>>>>  				goto next;
>>>> @@ -147,6 +196,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>  			    pgmap->owner != migrate->pgmap_owner)
>>>>  				goto next;
>>>>
>>>> +			folio = page_folio(page);
>>>> +			if (folio_test_large(folio)) {
>>>> +				int ret;
>>>> +
>>>> +				pte_unmap_unlock(ptep, ptl);
>>>> +				ret = migrate_vma_split_folio(folio,
>>>> +							  migrate->fault_page);
>>>> +
>>>> +				if (ret) {
>>>> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>>>> +					goto next;
>>>> +				}
>>>> +
>>>> +				addr = start;
>>>> +				goto again;
>>>> +			}
>>>
>>> This does not look right to me.
>>>
>>> The folio here is device private, but migrate_vma_split_folio()
>>> calls split_folio(), which cannot handle device private folios yet.
>>> Your change to split_folio() is in Patch 10 and should be moved
>>> before this patch.
>>>
>>
>> Patch 10 is to split the folio in the middle of migration (when we have
>> converted the entries to migration entries). This patch relies on the
>> changes in patch 4. I agree the names are confusing, I'll reword the
>> functions
> 
> Hi Balbir,
> 
> I am still reviewing the patches, but I think I agree with Zi here.
> 
> split_folio() will replace the PMD mappings of the huge folio with PTE
> mappings, but will also split the folio into smaller folios. The former
> is ok with this patch, but the latter is probably not correct if the folio
> is a zone device folio. The driver needs to know about the change, as
> usually the driver will have some sort of mapping between GPU physical
> memory chunks and their corresponding zone device pages.
> 

On further thought, there should be no driver in the tree affected by
this, but I'll definitely give it a further look

Thanks,
Balbir

