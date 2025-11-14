Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30544C5CEAE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 12:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7800910EA44;
	Fri, 14 Nov 2025 11:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C2+0Tk7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012031.outbound.protection.outlook.com
 [40.93.195.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F5710EA44
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 11:46:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfxykXTmC2RzWGc5kdhxq3IUBCYY/bJClR1f9hN8huYaXWQUv1c1gDPVyG4fgOB+YDXpl3KbJcHC7k074gID2WxpQnkbx+vL25Qayqdvgykn5zCfq2KXi54oxztkUfArQ7WRmlFvM7w9Af4RK34Ym7w4GBQ42kVLGFuLEMfHzA3V1QhYqUv7du8fTss7h+LQ6Q8HtXCsLpKOMZsRRKMkiUp9MovK1L7M3mfpzzsI1uWUyD4gDwzgwlpjPBtMDiSyysmhPdmnYwpELYaGCj3hY/CY9COxLY21YDaglp/znnAxw/OxOetb8go2l40oMCqSvQdWEli4NGM4I4/9/uW3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NF88rsvBnHr8y4GoGivRAncFGdfv/LXLlueZ7hq0qtI=;
 b=d30vtY7el88/WgxVQE9mvPwvnOD+X/V1K0dUr7YblKvj/Uc7QwjEYkIg8DI2uET+Q4TJzcdeqOU/xTDqV1ar+i6bqPp82AIEAx+H8O2KQXTwKpd1tj2jYRPjkcYwIaD/WdqrDbsc23yQMuSlv1DKAAUHtWw4UPWHyxsRGlWJC2s2acsfQDV9XJ6YJ464I6+osu3p5Y5MO/Gx3yBmDE+yjOclVreJFAwPybdhnx9nrYAsIZ5Og+AzKmiq6R8+QP968hucu5tsed2m1Hw2LKxMwHDFU08hE8q4hjxeponV6xLK6i/YPAhG7b6+MnURz7KlZ/Bw+79zKI4HXpBI3XyaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NF88rsvBnHr8y4GoGivRAncFGdfv/LXLlueZ7hq0qtI=;
 b=C2+0Tk7EesNBQTkKoMEQc9UC9VClEXsJMv9oq9OrQTU0XNiKH+kfiKtU37a1Ppx50WO8VnczNtDJbZU5euR3qMUJpOISA9eBR0c6TTUxXE0WWGEnjxkdYMB/F5SvW+z3ERBdGhLVnetYiFlp8PrH0npPJ7V6sA1ok1VPP/8x8sPXRJBhVRRvu1+NYyfRHOZkqvVBc9scRknlz6dpv6CcvBhXeMWxoUIX6tkZ3Ozzzb7b4/aCQ4ITM52ocxne5vD/H/NKXgyKccAlFY0RuNI0o7aFGaCUPORGRG6drh0eY9MjMkzK7y6P71pHQZifWlD3gKuW86r9d++S5X5u+Oc71g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB6285.namprd12.prod.outlook.com (2603:10b6:8:96::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Fri, 14 Nov 2025 11:46:10 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 11:46:10 +0000
Message-ID: <0289aa81-a33b-4945-b3e2-5f61d5227bcc@nvidia.com>
Date: Fri, 14 Nov 2025 22:46:02 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: fix override of entry in
 remove_migration_pmd
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
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
References: <20251114012153.2634497-1-balbirs@nvidia.com>
 <20251114012153.2634497-2-balbirs@nvidia.com>
 <e8f4546a-5c48-4488-a115-5af65c06f1dc@kernel.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <e8f4546a-5c48-4488-a115-5af65c06f1dc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:40::40) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 4770834c-b84d-4b91-d7e0-08de23736794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVVHUm1FOVg2QmQraW5uTTNBaisyaFI0WkhwTFpSQmN4eWFELytIUHg5a1Vs?=
 =?utf-8?B?dnluSWJkaUxkZ21KRVEvdndReXhQRGVaQXJNendraHpHZkRuK1VEMmpXd1cz?=
 =?utf-8?B?WWtickh1M3RIZmNlRkRYZDNvbEZVT1JzNFh6UkVrL2pkOWFoL1MwOVBPc0Ez?=
 =?utf-8?B?OUFob08yelJ3NVlKWmZ0RjRHamlad2JWUFFVZWdPeHNvaDZxY1VTcS9vblZR?=
 =?utf-8?B?eFR5clRIN2hTSWY1K2ZVQlRiVkhnQ2RqMW5HZWNHd3VFMlJQVHRYL3VVcmEz?=
 =?utf-8?B?ajYwdXpraWVBQ3RTRWFWZXpuYVpTTEtWYXc4ckNaUmFzb21Iak8yVjBaejc4?=
 =?utf-8?B?RG1vUjluUE9KbmVMbHI4QThoWnZuZVdvRDFVc3N6Y3V1K0h0aTBXVGNjZ1pW?=
 =?utf-8?B?Zmk3cFpLQ1Y0akJpbHdYU2RERWYrQ1Yyd2czajgxUDJ5ci95Y2hneWF0THow?=
 =?utf-8?B?aHlncGNyZG5wMnNzQlBZVzZDdGZLWlhWWHVKc2NveFdZbWozRDdJYWRydExP?=
 =?utf-8?B?S3U0QnRmSmd4MlUzOTQ0UlJ1c1FsTUt2UjFpNXdEZnRzUFdhNEtXSFJESjNG?=
 =?utf-8?B?cVZ3aWNJNjFBQU5kK054QTRrNmVqdFlLKzJmQnVRVWFySHNUeFpaRzBwS1F5?=
 =?utf-8?B?cjRBYWVBOWhJSjZpTi9VaU5ZbkIvcExJd2JJRm1sSExyczU1K0s3YUswb2J3?=
 =?utf-8?B?eTIwYUJBUWdRczNKOHd4YVNqVnEyMFZSR3JaNzJzbW05ZDFHMGVIQ1BwRU0y?=
 =?utf-8?B?L3dFU2h5bzMxQkNxMXFKcmEzQ3kzZnBpSmpmMllJWFU2M044WUZyaEJzNVB6?=
 =?utf-8?B?WnU4QkNEZjFObnA5OWx0djQxTkgxdDdDVEtWcmZOb2MzcUhRczdnUzg0aThl?=
 =?utf-8?B?ekh5VDdyaFFHR2FDRnhPMmI3RzFRWTFCanNBZ1I0TUlxa2YyMDdKVERNaU5E?=
 =?utf-8?B?T0dTc01JQWxlV0tRV3FRak1yOWoyYWhxTm1mMksxaFU1UFRJMk9zbnVOb1Vi?=
 =?utf-8?B?RFAyWGtNVDJLVFk5c2pPcGhSSXd5bDFPSkxFRjhtc1hJMXFrKytIdmRJd1ow?=
 =?utf-8?B?SjRMUFBLb1ZuN1dKUFlHdlNsb20wYXhYNlhYZGt5NVIwdXpMQUdSZkRKQ2Fs?=
 =?utf-8?B?c2ZwcGI5OUtHZEdNdzhxSUJsa2I1aXF5dyt5TEw0Mlg0N1lJaytjd0pWb3Rz?=
 =?utf-8?B?cWpmaDJJNG5PZUgxNmM3U0c0SFNkZ05rTUxyb1dWejlrSlBVUHUrWnduRTVx?=
 =?utf-8?B?aTNDdlR6cVBsYmdJWnNHbnkxS1NTRmNUV1pMOGxuZGRCeENOazZDbTVodDEz?=
 =?utf-8?B?WFhsbXVCdVVCaGdTdnJkM1RzOS85T25NL1RYQmFPRXVUbHZpRUlJQnA3djlq?=
 =?utf-8?B?Z3Myd1I4d2pzaFgxUysrbkJyMnRJRERmaE5nbnZxMzNReFRKR1B1V3lNTm5l?=
 =?utf-8?B?VlVLUXVxenM3WkQ3MitVa0x4SjQ4NmU0aVM3aW94eVN4T24rVUw2cFl2eGov?=
 =?utf-8?B?d1dZYWJrdFNndDY0QU5JOEVEVG16UG9aTW5BMGpJY05uWWZ3V0pacldTK29i?=
 =?utf-8?B?aXFWTE51OEtvYldkcFZpZ1JSVjJHZHExUzBqb09iMHZVN2luWnRKNElPVFlO?=
 =?utf-8?B?RmNjNllYd3Z3TDRhT2FCV3dFbWFEWXh6c1pwU1lFcjlnNG5vNExyblNVVWJF?=
 =?utf-8?B?dm9WWEptNzZ4Y2RjL3BaTkRwUkU0QlNmc3RtWFNzZkJUNDEzeDR6RlJJSWI2?=
 =?utf-8?B?UC95QVhJZzlzNzRoUndaZ3hXemRFdEE0bUVqT3R3Wlh1VzJXT3pLM29TY1JW?=
 =?utf-8?B?SGROK1NSVlhWRVFaMUMzeDJzQmpDcXFQR0tvTWhUWFRSUFVRQVlqWFdCU2tJ?=
 =?utf-8?B?eGNOeEdsWk93NEJ0K2lvOWVNOGRyVDZ2WFdWR2ZOcGJVM29pZHRva1lWUVFs?=
 =?utf-8?Q?cM/AaXo+7rSAS4efiLs4VX31NDBmxEOC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2d4STczNFJIQXNhSlV4Skgya2FUK2VNdWZMK2FORmFiQ1FmK0pVSFQzWUda?=
 =?utf-8?B?c1JVTStPVTJ0N1BNdkNJUGloYU5XdXN2SUgwMlVkK3JvalMrcm0zMGtpaElm?=
 =?utf-8?B?V0FFWDV4a2J1S1dTRWNjK0ZxVkFqb2xSbko3SEhORmNoeEV3em41OXFXbDFr?=
 =?utf-8?B?S01lZmY4ZXdtK1VWSHAzalBBMXVlckIrMTM1aFlSTDVndmVTK09iV3cyRk5D?=
 =?utf-8?B?U3ZraW1NZDNWc2labm04OUlDOEpwbXBLc25uQmhrL0RrTDYzR3BjNGN6NlZ0?=
 =?utf-8?B?NHFsb0NwVGcwVy92ZkFkV2x0aVltY1dVWGd1REJnZzRZRzlqY0JuTXd4SlpB?=
 =?utf-8?B?TWVjcHhmcUxrV0hxWkcrbHgzSHdoYkFpS3ZWR1pRQnZkYVp2bXE5NkdwSG84?=
 =?utf-8?B?R1hDczJOa2tJN1VJR0hQRGl3U0JqdE1kNTN5UUYwQndMcjB6aGFkNFhVNTlN?=
 =?utf-8?B?Vm56Z0wwV1I4Nkszc01EYkZ1SUJZNzdreTFLRDR5UGp4cU5VdUFiYnMvMmVB?=
 =?utf-8?B?ZWV6NnU3Qk1nMUdiRERGenMyOENQOU4vUW9kOFhaODdlY01vTHcrZzV6eStr?=
 =?utf-8?B?SGlKZU93aHdTNVIzVWlpTkFOZ2gyZ1FQUjNHRUk1VnVGZjByTkkxNnlhVmcy?=
 =?utf-8?B?MmFXS04xZWxxQkQ4WURad2psUTQ1OW1PY01JV1VpSkQyNUhGeGxBcjZGVE9F?=
 =?utf-8?B?MWFvSUYwNHJOV2FjQTVQRjhoQkFHNmNHRlM5Q25WQWFtMk9yaHFQV1RpRHFl?=
 =?utf-8?B?eTRUWnFZZGd6bWVlY1RTMlJFU2JNejdmUlpuNUVDS2xEZzlvMmhYaXhnZVll?=
 =?utf-8?B?djFXMVluVmt4aUN1U1gyK20wNDhtaWFtNU9rb2pBQm4wcUVMNzQ5RkRXTlRo?=
 =?utf-8?B?cUZReUxSNDRoNHNhdlVIUXl2N3lhUitvdjREUHhNRzZBK2pFZ0g3dGF5NDFC?=
 =?utf-8?B?SmZ4ZVVFOVZ6K2JEWnhUK2dYRjNWM3lEaldNcm40WitDbjNRQWV1UDYyZGQ5?=
 =?utf-8?B?MHJKOHFFelZZTGdYNTdQSS9DSHZqS3V5eHJQMnpXaFljdE5uOVI3LzJKWndP?=
 =?utf-8?B?WFdTbkJ2NDNTYi9Od08wTFF5VFVMYkp6RDBENFlUeE5vRzFMeDROMWNhRGcv?=
 =?utf-8?B?QlVQSzl6c0pCTEVFNTZwWUk1YnRsUldJa25iU0s4ZUV3WE5obW4xWkZhQm5l?=
 =?utf-8?B?OW1Hb1hJNEZHcldwZkVqL3FhUGF1RGhwa0JyV2dwa3VWUi9kanRQbHIxZW4z?=
 =?utf-8?B?VDcyeWE5NzVCSExpeldjeEZPVUpleXJodHkxSUlLbHV4b200STh1bFZ2bkU4?=
 =?utf-8?B?OStuZld0cG5JVUxRTFBQTGtTenhvd1YwNnducTVOcWFVTFUzZ2pVeUJpM3pS?=
 =?utf-8?B?OUhhRTVveFpsMExIa1ZacDdERkpneURnSS9rMzBPdDVoeTgrUWtZWmJZNzJa?=
 =?utf-8?B?L2hqdEZxUklMTnNLSWc1dDdXUjZwYjlxVWQ3RldsdVdjbzlXVWJyMXJhYzN1?=
 =?utf-8?B?YnV3bnQza09Id3BWMDF6Uzg0YzArYWJ6dUNySkl5bEd2VEt1NE00aENOMjNx?=
 =?utf-8?B?VkVFdXVNNUZmVDRIVWo0WU5CdVZDS0NlT25EMzRqTFovcWJRakV5VmlyNXVF?=
 =?utf-8?B?ZG9HQ3VOclIxOFhZMUlRQlFMcnd2cURlMnZWb3F5bk1NazZ3azRkS2p3RjRD?=
 =?utf-8?B?ZDk3d2kzUEpCZDhQR1JwTXV3TjU2ZWZSM0FQRHhjTHFZN3QyRElxODZJOSth?=
 =?utf-8?B?VmpBSElkMXpXam11aUNTNVJyL2ppaWVNYW1VMmd4bjBsbmcyekVOR25RUHpW?=
 =?utf-8?B?YVNDYnBCdi9vblNCM1RhN0M1WUZDcGNFbnFIMU9OQ2orT1pFNis3NUUrbG1F?=
 =?utf-8?B?aTJNbXV3eTVhVnM1V0Z5UE9DY3k5OTQzVHFzTUY3L1QrcUJLaFAxVWNKNmE4?=
 =?utf-8?B?b1dJWWdHSHoyWXBKaGpXanNMNHhaeDJNSTc5Vy9iazNmNzgzd2hKVjFGTWNP?=
 =?utf-8?B?SGlRUHdoU0NtQ0t3cVBxb2pPSkRZTzQ5dGdFL0ZLaDg2amNzRm9PcGVrcXlZ?=
 =?utf-8?B?NjRvTmI5NkZzLzRKUTl1WDUvUWdNWDBWNWJzdkNUZVlHdkhlYVYvUmVKOG4w?=
 =?utf-8?B?Q1RlUDUxNTg1UjUwcEljNXlnN3hpMVQvN3ExS214WTNMZ01hR1Nzb0RvbnlP?=
 =?utf-8?Q?ejy0Do/6xHDU5dov4/cIRU2Oxhii0aAvbKX2YyXBkB36?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4770834c-b84d-4b91-d7e0-08de23736794
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 11:46:10.1966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILeEKdoNXuMEtq/5F5Afmj9dDlPOvuizUkZrjsv8OrkrM/gPoD+3fCY7f1oUnjupjzvy1MeTvGLcpwzF+Y5+vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6285
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

On 11/14/25 20:23, David Hildenbrand (Red Hat) wrote:
> On 14.11.25 02:21, Balbir Singh wrote:
>> Recent changes exposed a BUG in remove_migration_pmd() where the
>> migration entry was being overridden when the folio is device private.
>>
>> Use scope local entry for creating the device private pmde. Make the
>> pmde writable if the migration entry is writable by moving the check
>> is_migration_write() prior to creating the device private entry.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> ---
>>   mm/huge_memory.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 9dda8c48daca..df93768a6e15 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -4698,7 +4698,12 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>>       folio_get(folio);
>>       pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
>>   +    if (is_writable_migration_entry(entry))
>> +        pmde = pmd_mkwrite(pmde, vma);
>> +
>>       if (folio_is_device_private(folio)) {
>> +        swp_entry_t entry;
>> +
>>           if (pmd_write(pmde))
>>               entry = make_writable_device_private_entry(
>>                               page_to_pfn(new));
>> @@ -4710,8 +4715,6 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>>         if (pmd_swp_soft_dirty(*pvmw->pmd))
>>           pmde = pmd_mksoft_dirty(pmde);
>> -    if (is_writable_migration_entry(entry))
>> -        pmde = pmd_mkwrite(pmde, vma);
>>       if (pmd_swp_uffd_wp(*pvmw->pmd))
>>           pmde = pmd_mkuffd_wp(pmde);
>>       if (!is_migration_entry_young(entry))
> 
> There are more problems here: you cannot call pmd_mksoft_dirty() etc on something that is not a present pmd! We have pmd_swp_mksoft_dirty() and friends for that.
> 
> So you'll have to completely split both paths.
> 

I'll follow the pattern of remove_migration_pte(), where all the device private handling
and that of pte_swp_soft_dirty and pte_swp_mkuffd_wp is done at the every end after
migration processing.

Thanks for the review! That might also take up any softleaf fix-up's required, I'll check

Balbir

Balbir
