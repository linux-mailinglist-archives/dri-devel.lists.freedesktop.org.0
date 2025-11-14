Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F27C5B21F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74C110E997;
	Fri, 14 Nov 2025 03:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WYHn6T1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2713910E997
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:30:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esF6KkgAYC3DU1cB8gVMusWJDERrotDosbRBUgoLsLq8bAy11JSwj00ESghKbD7jH82jy+neFJVHwiaAlnngcW8BuoFuvWmLPAPOxWDFa9P4Avmy9Q3Zv48cVH95bDFsV48i67pjLFJWul9uHGUGK3xwVH8vrW0qy937+K7rrIScnq+eslBiYUMWTkSYWH4BjWM1Wb85BTBtffaginA5smtfrkiPiOotxSmdMatc5pu1MmqywrKegWplAOWuzFbJChd8jwhCsp4QoRj9OthdKNmUQ0F/QzGhGgHuzi8KKLAo8IdJrH9YYbpBQeG5CadC4EJZConu65l2WknsMD9srg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJmvOPKq/f7c0q446TCw+xkNjnIHOr5eABv80wtIVjc=;
 b=dWxMbgQay12J2QuoN3OgdBgQKN50d77tSYkelWxAI/xheZWL1smMOnKe27rhLnhoW8FZ5zBqOJkhEahKdFgAxYIFxvD27LMSznBAzrwec+t1kuSC6ZG2ejMwCPXkDvk3l874W6QDR1LslCllzWuwkc/JXMOA+dWSLwhBEOYI0Lp4DtqzYB6tUHusICpVcBtdR50atsaOF4qwBunB/bpq51gjleml1CqTxhdqHUlJlA7cFJHSjioN+mu01OTewFmAmPxPrz+hLSZP9aUPT0w2yYyPlOLkG7B9H5a41sGNVG93o1MC0kNwrGZ4j/FJ3+Zwi8NUqzQHKWnNrvmboreYjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJmvOPKq/f7c0q446TCw+xkNjnIHOr5eABv80wtIVjc=;
 b=WYHn6T1qlIwlFC6wFBA0qdRqaIK+u+6i+RgYmSTGaBSxnkETnGK2iozDVisYGs1y88e8A6GvN67C0oaDBId4rKaFzfCSPaVT+94nCSBc1FgitjVn67jWMx0kwADZtDxFhcQuyy9iQ4I/ONB717RMQi4ndrPT7sQOxUIZhxKX/kh/7p5LfyFj5n7+epevmvMKW/UKhL2ljIKEYXuvnZxt8T8I4wiNd8KX+sOU73G48PcMVNozkQRFOopGTRjzBDmXvIybJZA4/pYxS+HE+MNAcYig4PwJuaSPATMlvw+TBgGdLjzLktHFJwS9yiqOAAlUDHj2kRKeAH8AvlI0XMchgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS0PR12MB9276.namprd12.prod.outlook.com (2603:10b6:8:1a0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 03:30:11 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 03:30:11 +0000
Message-ID: <870151ce-ca90-4cd4-8f21-35f4da329924@nvidia.com>
Date: Fri, 14 Nov 2025 14:30:03 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
To: Wei Yang <richard.weiyang@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
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
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251114012228.2634882-1-balbirs@nvidia.com>
 <20251114032105.sdkjaoiwpdmpynew@master>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20251114032105.sdkjaoiwpdmpynew@master>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0071.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::48) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS0PR12MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 36579ae9-7e6b-46eb-155c-08de232e1e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTV5RmpOOGsvb2FXSi9hQmpmeWpRVFd2RVpuN0ZockNndDh3SmIxUUVYTllO?=
 =?utf-8?B?OWRXSFc0NzArcVZQc0tkRHN4Vi9iVVE2TGRRMkxBZ29LSk53bnplT1RDNFBD?=
 =?utf-8?B?bmNiaFN1ZHlFOFV4RC83SDVDeFBkUGZkdEt3N0djQjF2cmdZRzNGc3gzOTlI?=
 =?utf-8?B?M3U5bmxjdXhwS2lKdWNGWk5vWDZLNTg1NzNvd3NUSWF4NzQ5bStKTG5GU0Fo?=
 =?utf-8?B?MUg3NTR5em1YdnZMQWcwZ3RrbjVqSnc3dlNHMlVwWXdUa0tmSWFmb3ExUzdF?=
 =?utf-8?B?MXN5NkdKM1JaTU5GaitWT2NJR015VG0rcWd6NDVoMXAxYzNpMldBN2plQ0hH?=
 =?utf-8?B?NFdUNFZ1SU53dzBGR1Q5b0w5aDVDZFJaM050SG5EM2luc1ROQTR5N2VkZjlI?=
 =?utf-8?B?Q2p4dGRweTl1Ym1XQ2t0Z1k3cFB0U2kydXRwWkN2YW5OZVVYaU12ZHRWU1Nh?=
 =?utf-8?B?ZDBubldVbVRqQXkrQUhrTVJzTjZyVnlMWkhYazl3YjVIR2lsQ1ZiazJ2bXg4?=
 =?utf-8?B?K2FOWWxBVlIvSHBwR2YwV3E3N1R2cFRaczZSUjhmUklIVExQdlR0WTlIZHhr?=
 =?utf-8?B?UFFKZHQ2SGFMbUNuM0ZvVXFnWjBNWjBwcGFrczVScFRpS2pINSs2TlY3VHlr?=
 =?utf-8?B?WVovU3BPcGhoOGhxcHhpcmlNZCtaNmNYQlJLRitNeFhJOWJ6STFOazR4alhJ?=
 =?utf-8?B?L2w0cVVaT1B2OWIzRnlvZFMybnhNWnNXdlJLSW5vOWJZZ1ErS05HdXJsT2o4?=
 =?utf-8?B?T2kySG04R001dnJTUzFpbFF6N1M5QTV2RHhQWHdqOVpIQVBHZDhqbFlabVVE?=
 =?utf-8?B?aW52MjVlRUgxdFNnd0JDVExwMFV3RElWNGpwZURScVVEczc3NGtCbVJxakV2?=
 =?utf-8?B?OWNxa0tWSEVPbkdCell5R2RGcEJwNnJoU0U5NXl2VXJtOHNIQXVkK3o1V1JX?=
 =?utf-8?B?WGIzeS9OcTNmRlRzbXBJL21HbnNWR3dMVVJGMjZmMGZ1blZwZWJ5K2h5eXR5?=
 =?utf-8?B?RHJIL0pOYkhtTTZQdldLbW83aVhKYy92UG5KS2JMdjhqTkd4cEE4K2EvdlJt?=
 =?utf-8?B?TlVWcTBPdnN3SjRWTFhHL0h2VlFmamo1SHY0ck9CWUo2V0dJbUFiU3BIa0g0?=
 =?utf-8?B?dWswbWNndm1ZQ05hb05PcnVDb0xvUDNkeWlxZXVISmxUL1l2MzRRd284Q1J0?=
 =?utf-8?B?RXhGNTdISEVFdnVyYWJvM2M0K1g4UkZETzZGN284SVd6eUFiemxDb25Wbkti?=
 =?utf-8?B?dHN6Rm9YeFBMY2pmSCtYV1BZWkRxbHAzQ3A4SkVEWHcrUk91R0JqbU9BdXhr?=
 =?utf-8?B?Y2JTcVdnNk1xSkRiSmxqRDQxbnkzS3hqV2V3VzNBVmd6KzlMUFpZcGFqTmtL?=
 =?utf-8?B?cWRGRlhOWTJZMDRRM0FjNE5BOXZXN0ljaDh0cTNkQnlPQzVkQmtPVnFCY0Vn?=
 =?utf-8?B?YVBPMVY2OENZUEJnWC9jbnNWMWd2bm9YYk8wdU1wSDVkUWVwN3F4VFh6SnI4?=
 =?utf-8?B?NXpKVjNBVldxQ1JIS28zSWdDaGF4RVd6OFBXdVFwZ2ZWTHQ0TkJnWSs0ZWJ3?=
 =?utf-8?B?TWVERDg3Q2VsQW0vZWIzSWFkSEtpQlZ4MXVKRGQ5MlBiNVVJMjhyUjIzb1JQ?=
 =?utf-8?B?YjZIUndKako1YXlzaHFFVDFielNyczFkSVlLWG5GUWtFdmNDOUtMRmtSenJW?=
 =?utf-8?B?RGtwNXY4NVI2dHFISThPMTI5aDhoN3JnRG1pWjFoU09ZSUNwdEhKNktvNEdh?=
 =?utf-8?B?US9NVkpHT1gvdzkvZ2VlZ2UyUFlybUFNUHpkNkxrL2pSTjI0YUk2ejRhNE5p?=
 =?utf-8?B?cmdCNG9KMlhUeURxVWV6QTUva09xU0NPSnA4Q0l6MWlRT3MrSEl0dGIvNVZj?=
 =?utf-8?B?QzcrbVhDR1VXWmduUjhGUXRaNzhMemZHZk1QUzJKendZRzZrMUhtN2VIY3l6?=
 =?utf-8?Q?0A88U6pwTbMUj2yc1s2uzVCWq0RDr0Gj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHY1b0VMc2N4TllkRFFhMGNGMzQxWnZYNGcvSTBTWm1DcGpXbnpadEJQbm9w?=
 =?utf-8?B?OVU4ZDJFeGNPUjRrMVg5WjNiQ3hJMW90WnVtWi92MEpPRitBQUpBL0ZHQndz?=
 =?utf-8?B?T3lOU1VzTXg4SzhxNzBMa21JY2NjWFgxRHRxUUIxb1dBNUg0TGdVOHNzUFhL?=
 =?utf-8?B?dGlzZ3pDaFdqN2FSUjBWVGIwSC9rbW5nbWRJMjhFQnN1WEY5eFRKanpkZzFI?=
 =?utf-8?B?eTF2K3R3ZDNrcGZERlZKb3JVdnFkc0t4V0ZGUzlpb29UQmx1Uk01d2JqbFRk?=
 =?utf-8?B?dTRKL3ZIaFlDandWY2FobXJZZFJmWDJhWmhOVm14UXhTWGxueEcvWkF1cmlx?=
 =?utf-8?B?TytjY0VicVNBcGtwalVuU1lWK2hHUXlZVlhPNk84cE9IbHVLa0szSjAzRFNG?=
 =?utf-8?B?MmtUTVdUM3BhdTZVdlJ4OTgzRVBsWTdNS2NFaEN3UkZQMjZpSUYvdGtxMHQ5?=
 =?utf-8?B?UlhSdDdPSXZrc0V3WkFGYUVScnhKM2pwaFhvMXkzcUp3eEZYK3BndmxDdGJs?=
 =?utf-8?B?aS9jYkk0eDRLMW4rTHhDa2g2UnNaNlJrSXp6d1pUYm9qNDdGQ0Q4ZU9jUE1s?=
 =?utf-8?B?a0IxeXFIL0JtZVYzK0Rqb2pFdEdGenpoZG9jcHVwdzRLSWw0NG1GQW5LcHlo?=
 =?utf-8?B?bWVNVGVQNWgySVhXek54TmpBOE1PaThSWkU4OWY3alJaRVN4QzRTa1FIN0V4?=
 =?utf-8?B?T21aS1I5Y2N4Ri9JNjcyZmsxa3dOYyt6VTFVazIyY3NKd3FrTFdPMWZuSTBK?=
 =?utf-8?B?RitVd0g5ZTR1QWdkbG9mNXE4dWd5UDN5eTdva2VQMU01aGJKVjNmT2JWbWox?=
 =?utf-8?B?SERSa1Z3QndoUG1pKzV5UVFoKzhoQjVBWUJrM3RmS2hVQkJhcTMwYi8wUW13?=
 =?utf-8?B?MGlOS1c0M01KbkFxc1VCV1pFY1NVdjVLeVZhT1YydXhBM1BZKzg5eUNCUmEv?=
 =?utf-8?B?MlJtRXFjdUJiQ20wcHBadWpWVldvVFBNOEphemlMRVl0TDhCbW9RR3dBTldp?=
 =?utf-8?B?dXNTYjlRclNJalp1OWhiQkdMeXlha3VaaFNtT0tzSEw3VFU4NEF2Si9jcTVk?=
 =?utf-8?B?MEZuOHhJQkpEcXRpa2k4WDFOem5URjVzTW5kL2JpSUdrbUd4MGZNVnd1bmdH?=
 =?utf-8?B?UnZpa21ibGRYd0M5TkpyV1BHcVBKRkFRZThIdHhBZitEVFZvZUZ1Q3djUjZI?=
 =?utf-8?B?dHY1WWNTOFJJMWFWV2lGNnQxVGRvdVI4MXM2U0t5RVNBWXFzajdJTXJxWHVl?=
 =?utf-8?B?TEEvV2h0WS9ZanZOSGVsbFlNUzhEL09DeFZ6dUxlckd5OVJQbDQ2L0s1aWtP?=
 =?utf-8?B?a2wzVzJnVWljZXArcEhvSnRRdTR4TjZ2VXhQOU5TOXNMOHVKUVo3VVZEWGh6?=
 =?utf-8?B?am9OWGt2UFFHblo1ZnBsaHJmZ0NuekVBL01ZZUV1WStHVVM4SXB4d2k3SWNN?=
 =?utf-8?B?Wm9ub2FsUE5jZVhCVXZXOUwrZXRXNjI3UXJFVU0ycS91UUc4RzZHemRTVEJR?=
 =?utf-8?B?eUNoYVdvWEM0aGNtc2NidEMrYnk4QjZmQlhNQVFpUVlBeGl4MFRlYWRvaDBr?=
 =?utf-8?B?UExsOEJiWGRZckhPMUIwbjlSZDhOWVNFQTJ6SmVCeTQxQ2thUWxERnBKd2VE?=
 =?utf-8?B?enZHRFRSSWNQVi9Fcjc1QUYxTG10UXpObzYvY0VjSE9hOHlzdXZNN0xmZ1NP?=
 =?utf-8?B?MkdYMHVOZUxEY01UR1RLRHNKVkpxMEtPZHJqK29sN09JcTlscTY1NzdQazZ1?=
 =?utf-8?B?dnVmUmwrT2FPZzhYK2lLTXcrQlRLazRKRFJHS2pka3RVNlUveWc3U09nRzdG?=
 =?utf-8?B?UlJ5S3dmZHErSXppZG9GNmUwb3JYblVTYWowb21NVlFnSnZCRnZDYXRMdVJP?=
 =?utf-8?B?MXVFc2twUzd4aVJFSlk3bWRrcThOQUxhNTVldFRHY1l3NG41dFpxcnFGRFg1?=
 =?utf-8?B?SHBKWWQ3UjQvY3dWdWR5OUVuUzRSTHpqSFlkemZ2cmRtQVAyVmFOZTRhVFYw?=
 =?utf-8?B?UE1EcjZNbVBlalpVWnhiSEVnMTRpT2VqVkNxU3pMTkp3N1JoRFp3RUdZSXkx?=
 =?utf-8?B?S1N1Sm1xMEg3R3JkYWNoMmM1ZHA2OVBBRnF5VUZYOU9IZDJIRzQ0Y1Qzb2Js?=
 =?utf-8?B?VGx6Qm9WUlJaZ0wvazBWNlRDUHl5amNvY2xVTE9oRGRUK0p3Y09oU2NZTTJy?=
 =?utf-8?Q?yI1i14Ol+7qFcOVcojmEjeCDYNQkuSIhnzcCKH/+5qnp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36579ae9-7e6b-46eb-155c-08de232e1e24
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 03:30:11.5478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRnx3gBfpJxLy2XLwpRhmwBzoS65ZnyGS1myGPl+HJqD73IVQmwfnVKscPrBVsuD+3diSVTlQQAb/RkEMxSmXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9276
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

On 11/14/25 14:21, Wei Yang wrote:
> On Fri, Nov 14, 2025 at 12:22:28PM +1100, Balbir Singh wrote:
> [...]
>> @@ -4079,6 +4091,36 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>> 	return ret;
>> }
>>
>> +/*
>> + * This function is a helper for splitting folios that have already been unmapped.
>> + * The use case is that the device or the CPU can refuse to migrate THP pages in
>> + * the middle of migration, due to allocation issues on either side
>> + *
>> + * The high level code is copied from __folio_split, since the pages are anonymous
>> + * and are already isolated from the LRU, the code has been simplified to not
>> + * burden __folio_split with unmapped sprinkled into the code.
>> + *
>> + * None of the split folios are unlocked
>> + */
>> +int folio_split_unmapped(struct folio *folio, unsigned int new_order)
>> +{
>> +	int extra_pins, ret = 0;
>> +
>> +	VM_WARN_ON_FOLIO(folio_mapped(folio), folio);
>> +	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
>> +	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
>> +
> 
> Compared with original logic, we did check folio_split_supported() and
> check whether new_order is supported for the file system.
> 
> Currently folio_split_unmapped() only pass 0 as new_order, which looks good.
> But for a generic helper, it looks reasonable to do the check, IMHO.
> 

This is meant to be used in the middle of a migration where the src/dst do 
no agree on the folio_order() due to allocation issues. When mTHP support
is added to device migration, order support will be added and checked.
FYI: This routines supports just anonymous pages ATM

>> +	if (!can_split_folio(folio, 1, &extra_pins))
>> +		return -EAGAIN;
>> +
>> +	local_irq_disable();
>> +	ret = __folio_freeze_and_split_unmapped(folio, new_order, &folio->page, NULL,
>> +						NULL, false, NULL, SPLIT_TYPE_UNIFORM,
>> +						0, extra_pins);
>> +	local_irq_enable();
>> +	return ret;
>> +}
>> +
>> /*
>>  * This function splits a large folio into smaller folios of order @new_order.
>>  * @page can point to any page of the large folio to split. The split operation
> 
> 

Balbir
