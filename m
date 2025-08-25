Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522F7B33E45
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 13:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE06110E24A;
	Mon, 25 Aug 2025 11:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2mhH2fF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C5410E24A;
 Mon, 25 Aug 2025 11:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQWiE7O/ms47I4locqgxlgG21QyQVo83RdaIhShN2TxWl4a3rPy5Osnx1K3atgI8Q7fbvbzygJYS6GQlPJAqY95qqzAYH8mzywVXKUhw82SwZ+mvAPPnBEBVfu8G9mEm0Mdm6vm2HdpoY8MseDT3OXkNRgHC0+S+I2a4u9pJiVi1X8dtVti0yczQ4AYQybAMrtdl1tDr9V8On1M+M2uhJCkxhlzcOI/X6XScKwrrkI5ewjX+FChfYyL/sRxuLA0LHaTd0qpEfX/nXreOqfJeI/HPu0a2Qv19zlOgwBq6TYmqpKxytYvq8AyrYDCEbgVs2Odg9dZkq3sBgtb/PJGHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxMqiIdNJYH1Pr7phBgk18B8dlEtj9nVDIYI1/18CP8=;
 b=wJgvHhXqvtbV0FwRQxX7cXudQ6K1kVfY1gMV9uZhXYnRnXoyhLdfhOofP8ZrLtayY9tamYzsgkexEcCFAZNA4DK/zGHfik/hogHznQlHpXNoinoygcZLBQlCb1VukJ+OU9HUo+9Ol0GzWllzHgmTd0RpQZcrSi3/oODaMCMcB/YK5lOQDs3aBtRqEmeUbAQFvAkgpH22m6s5c7g/qPSyo9WrJaYkF3Z8/p6SvkpNiDE7t/WCsquFdlzPWzOKBFpag/SitjuhWsbIiSnCzJlQYpbiAloCLmo3gFuQHNI38P78/AJqTgjBjT/FDmm/6SMbXZ5u1wRML1/crMpKTcT0NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxMqiIdNJYH1Pr7phBgk18B8dlEtj9nVDIYI1/18CP8=;
 b=2mhH2fF8eqM/Kr7blnoGNazFmiSyTYy3GdZKAzfSEZA9GwWGUxUgxPFeHRO/e5Hrsuke8Jh24ied4jgz1C0tSEHwDMvCi63bl9F+l8cKjNJdMDn2Lv2s/NN3Roq62RuxJ9mpvviFf2UAaYYp/HIwaGe8MKJEk9nsfLQiUlXRals=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Mon, 25 Aug
 2025 11:40:57 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%6]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 11:40:57 +0000
Message-ID: <954a19f5-899d-42fd-8b45-e32680817fae@amd.com>
Date: Mon, 25 Aug 2025 17:10:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/buddy: Optimize free block management with RB
 tree
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20250821150641.2720-1-Arunpravin.PaneerSelvam@amd.com>
 <6c813ddf-639e-4816-bd7d-70142a656663@intel.com>
 <0353c333-2673-4157-bf93-08c6435e5827@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <0353c333-2673-4157-bf93-08c6435e5827@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::11) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 09105666-eae7-462c-7432-08dde3cc415e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDhrWVZWOGtsNEtVV1dFY3A4YnFGWGQzTVFNZE5xN3A3LzEwVDBZVmhwb0d1?=
 =?utf-8?B?dDJCbDJ3VnlyQmExeXhWR1hTQTgxZG1hM252MTBTclMxNS9nSkJGc040ekIy?=
 =?utf-8?B?N1JZNUZMbGlLaFZsQjRvbXNCWVRGZmsxaWJBN3AzdWhjdVBpUkZiNVlYWXBM?=
 =?utf-8?B?dVVTWXZEUWdTM0F4aWRQY2Nrb0kyNnZQdTk1S1FxVThQMlV6TDNwMys4QWh5?=
 =?utf-8?B?eTZ0by8zWFNzeGgzcy9IbTJzSHE3Rnh4M3RlcE10dnZxUEFnVFppT211Z0k3?=
 =?utf-8?B?SlFYM2xhcmp1SmZNeENBd3M5TWMzK3ExK2xPMlpyTmhxOHFQeTFuMjE2c056?=
 =?utf-8?B?STdMWHlJdlRxSlBYVTlIRkQvNzNXOVpNRXFhcEZIZnordXNVbzlsbkI1ZkxY?=
 =?utf-8?B?aW1VRGlsYlRKNElrUEUxK09IU2t3ODN4RWxTNWNDS1hpRUZrcTVwVXdXZ1RG?=
 =?utf-8?B?RW9RazVxMVBIRGpQY1FrVC9OYWcxMk01eDJiZlBGbXVpSDRTeFpkNDhXRjBp?=
 =?utf-8?B?aVY0TEVjUjI1WkVIZG9RM0ZETmRLUkdYbW93bnJVbHJBaktacmpNZEFPUVNl?=
 =?utf-8?B?Yk0wQnBzampTZnNzRUl2YktvMTFwcWhzR09TT2JQZ25iMHdsNmhVTkladDBa?=
 =?utf-8?B?NFpsTmhhV3VmTmJOck9qYnV4WVdFVHdRdjJIUGQ2bGpWNnljRXJVMmFLd29U?=
 =?utf-8?B?VzJxVmRZaW8rUVZCNmpOcHRISTNnb1ZsQWNLMFErU1NtbkY2Mjd3NXZvREJC?=
 =?utf-8?B?NVBEYzRPaVZFTlhpdkRvTWhxK3JERWlraCtBNFU0TWpaTzd4NU1uNE5nZWt4?=
 =?utf-8?B?Y3JwUTJ5dDU4WGQxWHlSVCtLK1J5b3l4Z3FVZ2U5U2ZZYlZ1Y0lKdStkK0U5?=
 =?utf-8?B?TFFGcEdQR1kwdE9SeTBCMzN0L0s1dkJlT0xOQTBwWGtQdThJbDBnZXQrNFhx?=
 =?utf-8?B?TFo3Qk8vN0dLZmlFSEI5M2JNanhlQlFrODRxbGxlQlFKeG12bkcwcEpmb1RZ?=
 =?utf-8?B?K2JCN1Y1SUNuQ0Y4eTRzNW5hMEdDMGNPQmcxUUFvSWlUMUVFdGEwYmEwdzl3?=
 =?utf-8?B?bi9sbDVwQVIxd1RlWEtsNFphQ3NDVEowQW1MdkNYS3dTbGVHMjE0Y2JFZStU?=
 =?utf-8?B?WnA2MEtWTE9jd3FKNVhodHVRSXB1K3ZCZnZnY1pvbE1OWmJnOUkyc1EwYTZB?=
 =?utf-8?B?V3ZWR0lQVGJMTGt2Szd5Y2hsRUJvWHBiaDNrbGdoajJGbWp2blVCWThuWVFH?=
 =?utf-8?B?Rnp4VndqYmkxTFlRTUpSazI4SlQrSUM0aVl2R0Z6LzFQeWYvbFJobmRjRnhQ?=
 =?utf-8?B?VG85eXpEWmJiWmx6K0hYZmdyRTZWQ09XNzBmSXhicmhpakY2VzY2QXdETU9m?=
 =?utf-8?B?RjlZbHlTcHBGWE1SUHV3dXdTdGFKc0gwWTZOcnRCdklWY2JOVXhQUXIxeDd5?=
 =?utf-8?B?VnpSV0VIb0M3V0h3L2RXaFJtQ2I3QmhYV3lzcllzbmltR3Z0ZHl6TFhBSStV?=
 =?utf-8?B?QzZXeldrSldXQXJOVTBHbzVwQ1dTak5sbmc1c3BxVjc3ODlLSHpaWW1tZFdZ?=
 =?utf-8?B?VmJRVXpTQmMvV1BIcHhvNjYvV3FOSlg3MDdxa2ttK3A1NWtqVUsyMVQ5UlAy?=
 =?utf-8?B?cEtybWJZd3B2WjhvYTQ2a1ByUG5XNHdSd2hQaXArbFNyZVBZS1RmNEJDU0tl?=
 =?utf-8?B?eWc1aml2cWJnS3NYdHQ4cnRRMWZTcmZudDEvSW4rUzUzdHFNeXhLZGpSdHUr?=
 =?utf-8?B?VWVaMWhWaEdQRjdEYld1Y2xHR1c3SWdOTE55MlQ4WWh3aXBtQ2svWS9la3Jn?=
 =?utf-8?B?R1V2UGVjV3BaNkhVLzlCUmUzVWUyemh0ajBOcCtwM3k3eC9tbVd2U29mSU1o?=
 =?utf-8?B?bDFMOEdTRHBCUkYvdEZicTRuOHFUb0tqbHVncXRoNVUxd1VLbm1iYjJkUXBZ?=
 =?utf-8?Q?ERpbNjywIds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmlDd0xxdHBtY2YxQktLVTBBWGhTMlNkSSsrMUZwcFpKMTVuSmkzSEpvMEpO?=
 =?utf-8?B?NjNnMmlIVW1GMmFwNjdVbjNvcU02QVJ6eHlIL1I5aHVBZGFmbFpxWm03eDl4?=
 =?utf-8?B?MmNlY2xPU3AyNHhCcHJwS0tPRGp5eGFTL1ZhNFVtM1pNRmRQbkFOeUZxbTZz?=
 =?utf-8?B?MjZUUWFkOEJYS1FNZ2w0Tk94QmNhZGxrWkVCcW96YXRITVR3eEY4QlcxSGRr?=
 =?utf-8?B?VVRVZzZleVFDNmVuTk9aWUtZTWtTOW95bTVFYTVJV2Q0byt2b2p1R01Tc2tV?=
 =?utf-8?B?OXVVRGpuSERQUmR6cHBsV3c2eksySWlwcUgwNDEzek9ZUnlyUWk1ekJsbjc5?=
 =?utf-8?B?dk91QkQ1YjZxWCtJYVE2UVV6bm55dGdLcWV5cVNqQ3RNSjdOU3VFcW0wM2JK?=
 =?utf-8?B?UkU4K2NDMHJYejhBNVIzTStiQWI2aEhQNkIxYmljT1FsUW1nczJqQXNhSHE1?=
 =?utf-8?B?Rzh2TGU1RFhKWVFEMWJqaUJyM25URlBrdXRxYmE2Q1BRL0F5ZGhveU92VE1U?=
 =?utf-8?B?VmVDK1ZpQlVFNEE2SWNWSk1iU3l6OWkxejZJeGFrWHpXZXBXY01FNE4rdHVw?=
 =?utf-8?B?VHNUejRRNXBwZE9zMURxL1hFUnNmaTJrL1J3cGM3RDJSRjBjQVFTdnZhQi9M?=
 =?utf-8?B?VXBnZEVJRWRWSU54a01uQ2gzYXlFYnZPelBnOFRraWVzc1FrQ0I2VU5tY091?=
 =?utf-8?B?dWFmK1MvQzZJbkh3OXZsZkRpNDRpZ3hTRmx1ZW5zeGxobVJvZzVkZG42d3Bn?=
 =?utf-8?B?ZXc4Szc0V0crMWJ2c1grSWNIa0tMcTI4QllJSEpCOXJOMlJNdlQ5ejgwekdz?=
 =?utf-8?B?OUlhSmVwK0Mwa1piWTYvRlc5U0gwTzFZTm9nYWlENTg3dXp2RUpoSmZ2VVRi?=
 =?utf-8?B?aXBSdFBHRS8vU3ZWMDRzQ1hNQURibEtGODZhYjRjRUczRFBCSFRoY3ROaUZZ?=
 =?utf-8?B?eVFPMmtIQVltcFpzRGlZUGsvVUt6bmFGeGdGVERCN1UySGlIMnZJMVVNMjBN?=
 =?utf-8?B?bzd6WjhUYXZGRWpYbzd6amI4QXE4SFl2by9pZ0tUMEVFWnFWc3B3ZGN2Z3Jr?=
 =?utf-8?B?L3lINUU0THlzM0VjdkcxUWEreURaUFFwRm92MzRQcmJhVGtBTEplL0VDc0Q0?=
 =?utf-8?B?SFFGQWpYZ2FSTkdlQTRHYmRiNGFydXpHcmUrWUs4REwxbE9hV0dzOFRDQmpI?=
 =?utf-8?B?YkhDZVJwWjlCbUoxc3RDUzBFM29GdnVMT2w5amtKVTdOcFZVZG84OWpONUI1?=
 =?utf-8?B?N1ZBNjBlMmtzRytVZ3ZuWEhhdFNKeGJWUzlaYXV4a0JKZlQxUEo0dEVCdWtm?=
 =?utf-8?B?UHZFNjVnOFZLVDVmL29uUjgwQmI1anhINXNRNDB0ZlhISkpsMTVLMWIvak1J?=
 =?utf-8?B?M1JTbHdwVFF1aVQvOHpUc3dEUDYzb2lpOW9QTC9EazE0YytHVlZDSTErREJ6?=
 =?utf-8?B?azN1UUFGUGYxUU5QelhvU2RZMERsWHQrSmhqTEtLOC8rQ1dXZVZZbUxkVXd0?=
 =?utf-8?B?NXNOakY2N0pQOWFBSXVEYmlVcjlhbkVMQm9NRUVGZlhLT0ZkNnVRRS84LzBa?=
 =?utf-8?B?YVNkOWJLc29RMnZDTDlaNU80SUNIbWNyb0taejlYN3NHUDdoMDNQU0lsMkQ1?=
 =?utf-8?B?b3pIVG8zNkFjbXlJMmZkYzhoTmZxRVJjeDdCeEpIaUlTTkxta09PbkJsY3ZM?=
 =?utf-8?B?K3BhR0JCSUpoZnJMeVFFYmhQVW5Ub2RDYVgzazhzTEZLbi8rMUpQU0t2bEw2?=
 =?utf-8?B?R1BsR2VONU43ZVpHbDg0NEVkcG85c3YyZnl6VHJaaTBvenhsS082YXBsN2Y5?=
 =?utf-8?B?eFVTSjJqdU5GKy9FQlZMbzVGVmZBOTh3akNDV1N1YWQ0UnQzc0RUQzJlaTMy?=
 =?utf-8?B?YkN2NndGNlE2cyttQXVxQkZzbkRiSHFTamV0TDdYWjk1bWtURmNiSFpMeENI?=
 =?utf-8?B?TEtwcTZ4Q0N4Nll2YzEwcXdMajgyRG9OUk1NNC96ZlI0cVgvZnZPaEtKdkFY?=
 =?utf-8?B?Zmg5Nm9hc2RGTWVidnptbzVhNmJIcWRVdFB5cUVhZC9OcUdPMXZia2UyenNG?=
 =?utf-8?B?RUxiYWN1SDRPMVZiUzU0L2J6VHE3MVl4OE9DOFN0Ui94cjZWc3E0K1JDOUJh?=
 =?utf-8?Q?S3wT7bQJVbQfxop9C/9NH8Y99?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09105666-eae7-462c-7432-08dde3cc415e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 11:40:56.9630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+IuemJp8FzvjoFaW3S3h14YZOWtKh+1ixUJ+QbErL2RsF683SdcLWPfeewQLjY3lMwZtEWXRYei4UdFu1KL3w==
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


On 8/22/2025 5:58 PM, Matthew Auld wrote:
> On 22/08/2025 09:37, Matthew Auld wrote:
>> On 21/08/2025 16:06, Arunpravin Paneer Selvam wrote:
>>> Replace the freelist (O(n)) used for free block management with a
>>> red-black tree, providing more efficient O(log n) search, insert,
>>> and delete operations. This improves scalability and performance
>>> when managing large numbers of free blocks per order (e.g., hundreds
>>> or thousands).
>>>
>>> In the VK-CTS memory stress subtest, the buddy manager merges
>>> fragmented memory and inserts freed blocks into the freelist. Since
>>> freelist insertion is O(n), this becomes a bottleneck as fragmentation
>>> increases. Benchmarking shows list_insert_sorted() consumes ~52.69% CPU
>>> with the freelist, compared to just 0.03% with the RB tree
>>> (rbtree_insert.isra.0), despite performing the same sorted insert.
>>>
>>> This also improves performance in heavily fragmented workloads,
>>> such as games or graphics tests that stress memory.
>>>
>>> v3(Matthew):
>>>    - Remove RB_EMPTY_NODE check in force_merge function.
>>>    - Rename rb for loop macros to have less generic names and move to
>>>      .c file.
>>>    - Make the rb node rb and link field as union.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>
>> CI is reporting a crash in rb_erase when running the drm_buddy kunit, 
>> somewhere in drm_test_buddy_alloc_clear it seems.
>
> Found one bug in the second patch:
>
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -507,6 +507,8 @@ static int split_block(struct drm_buddy *mm,
>                 return -ENOMEM;
>         }
>
> +       mark_split(mm, block);
> +
>         if (drm_buddy_block_is_clear(block)) {
>                 mark_cleared(block->left);
>                 mark_cleared(block->right);
> @@ -516,8 +518,6 @@ static int split_block(struct drm_buddy *mm,
>         mark_free(mm, block->left);
>         mark_free(mm, block->right);
>
> -       mark_split(mm, block);
> -
>         return 0;
>  }
>
> Otherwise the mark_split might get the wrong rb root if we reset the 
> clear state first. Might help with this crash.

Thanks, I think I missed updating here when we removed the new tree 
field and modified it to use the existing dirty/free bit in the 
drm_buddy_block struct in v3 patches.

I will add this fix in v4.

Regards,

Arun.

