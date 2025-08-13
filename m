Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6EFB24B42
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C73210E72E;
	Wed, 13 Aug 2025 13:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZKiJgbWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A647310E72A;
 Wed, 13 Aug 2025 13:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzL5kf4cXHkuVX/RfLc1534bsKKdI3c/LeNv8F+x1AR//8rAk7ZwXD93TtuU8Pqdh+1b+SVL+fO+TbXSR5f9wbM+hqikoGtmKzPGCT1NBIzPnwK8nyf/q2YdZf5krJmLsAda7c2BH5rApfFt8mFRtBZzY4QlNE7IcHqYPecn5l39IiZ5aEWkux3iAzGvQ37Vj4Z4FDfUZ78zGLNngpGHAvgWjJcU89MOb54VpxDJgazBvCNqzzcdScvWHQBwr2dNOgrV1LodhaDDyn0LnJJPi5vGDkWHBTbvurYEE0ML0gwO38doKQeKAEsPDms8vtbPJ5K4HFu2KWqmYW8TmfdYlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIXFtECcAxzlZYaxUhvHlQa85wHQ36Kn9zF0ybQI+TU=;
 b=AewoTfDHMavgI6Xp7NVukqacagm8D8IjWyQvLGoZKLVfS4jR6+7IlYbY0MAcZqbY4SMlIDLedbe5wlElWTCci6v1mhsN72L+po4YveCqWcs/aanmjtVZyW9tmn2gs9mzLfWJ+tT+DN/kw9mwtjKWXAmC+IqVKhz+bGCA4HLVfgKWB2zjUgw3L6MoL6iOkVqwALMMPkUdfEXtk3ddkvFQal5vGdIa8xibAOA7ms1QOpNertn64yeDoK+9QFnaOhcjpeN+FlLuRWTLbVB6MGRYfMU+Qit+pPeMU7v+9Jlk5h6XEIUhdD+E98EfALG+3pmsnSmON0aOJQ4r/wt/vExNLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIXFtECcAxzlZYaxUhvHlQa85wHQ36Kn9zF0ybQI+TU=;
 b=ZKiJgbWF3YODt9snFfCge1JZNJtAAqnJlogaU/4ZftCHK1q3QAl2UF1EZb6uJFxv8T1ob1z2Oph/rUsqfuxA00xsyAcbueqRDDcP5h7XIYT2IX0aQIOc0Uf1yuJyl78hauYmxcBFv6rNVFVl0IL6x4/vGbgwcf0twjaxWMYOqTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7849.namprd12.prod.outlook.com (2603:10b6:8:141::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 13:56:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 13:56:54 +0000
Message-ID: <dd43f03d-cee3-4645-ab6c-351b69199323@amd.com>
Date: Wed, 13 Aug 2025 15:56:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/buddy: Separate clear and dirty free block
 trees
To: matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>
References: <20250724104640.2319-1-Arunpravin.PaneerSelvam@amd.com>
 <20250724104640.2319-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250724104640.2319-2-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: f6db1095-12f4-4b1c-d9dd-08ddda7142e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3RacDAwQVhiSXVqV2FiTUlidWVCWjc3K2JKcFdHWk1zRStJYy9QczQ5UlFB?=
 =?utf-8?B?bnhDQmpSOW9vZkRpbmF5REx3QjdaYWt1THhUK21sU2V6MkVQam93SVRKUGZW?=
 =?utf-8?B?NDhnanZHbk1FYklzeTlTTy9VZHR6VUxtbSt4dVVDa1BiNk9vK3VyNXlJSkFK?=
 =?utf-8?B?b0U5S3c3SUlyaTVSb29lSXVkRk9kVytrWkkvVjZudTZVTXJ1WGxyTWxjVnhE?=
 =?utf-8?B?UGVFVG1SN2REeUw5aHgwTnhTNU5WYWtrMUhNVEpZa1RlL3JmZlRjcE8yRDY2?=
 =?utf-8?B?UTVTSG5mVEVpNVZZdjZVQVUzWDYrd00yWHhCeU12b2l3c0xMcjUzMGlJMHJW?=
 =?utf-8?B?Uk1qc0lGeTFFRlpEaXNjWGJUS05FMG5hL2FPRWtSS05sSGZybU5WL0xtZTYy?=
 =?utf-8?B?dDBpd3hEeURoVVk4ckFuL1hNVUhYWFhTQmV2NzNTejRybGdSemVyQjdubVJv?=
 =?utf-8?B?ZEZzVlByTy9TMU93aGdhQWJJT25LNU1HMlFqTDUyUktPNHVSZFQ5YW9qdXFU?=
 =?utf-8?B?MVRzUWgyN0FuZS9OQUhYeE96cXpoWmZMVGJIT3VoVEZiSVUwUXpXQXZmSHZu?=
 =?utf-8?B?dk4xOFV2a3NleXpPUzFVWEVYUko5S09HdDZ5WldrSWlxa04rZXRaeWg2NldX?=
 =?utf-8?B?c0ZRWEN6ZGFXeFZXaEVhRTQxNjIvd2JIRkFnSHRvYWJleUlVTDhCZ1ZmM3Uw?=
 =?utf-8?B?UElydWxPZjMvaDhhRTFnTjBidFoyWUs3L3lrU3hxOWRwT3owc2JYYlc1cHFJ?=
 =?utf-8?B?TC9peHE2d2JpSnVBYlU5VHRCeFBSVWZ4U2hpUU84WVNIM29HYnVia3JSQk01?=
 =?utf-8?B?eVdZSUl5V09hKzdTWVpCbFl5MmRKNGNoejBBSTIyVG1jUXJCYnY1M2U5dU9F?=
 =?utf-8?B?NGE5a3hjUE9GRzZkU0RMcTB3ajdDWXUwdjRKU2hjQ1kySU02SHlPV1dnODB6?=
 =?utf-8?B?eTRKbTdqS3RUaDh5MGxGNWFrTmhGMDhHcitLWUxTaWtOSHkxT0syTytTTzZO?=
 =?utf-8?B?VE1VM1NhM0lLZ0E3UWRJMkhuanB4bkpqdFJRN1ZCeW13d3crdXJGWEJFMHlQ?=
 =?utf-8?B?RjJ0YTJJbzU0b3FrQ0daNEhNZVZmWld6ZlhsMnNLRktZZGxoREZyZGdjdVlp?=
 =?utf-8?B?NUZRZU03d01md3dzbmRiWjlMMkNkRTVibFc4ZUVrSDNzTlJFeElCNFlwMlJv?=
 =?utf-8?B?UGRvdGlhTFQxK0xQelpqaDdZYXRUUXBWd1ZGdHFaaDhTZGtmd21EaEliWFRN?=
 =?utf-8?B?NUtCNVNiMlVwL0FRd0hYNU9nYjlKNDJKOXBnd3F1NWQ4MjE3VmEvK1VFL3Vu?=
 =?utf-8?B?YkRyN1lOdU5adEptMlJveHRUSHM0a2Q4ZUpkVFBaMUpTcXF3TUpwTllGS2xs?=
 =?utf-8?B?K0loMEl5YXJ6d1hldFV4UG1kdTUwUFg5c2VTdmdLLzVMbWE3UkErWnYyc2xH?=
 =?utf-8?B?UVBza3FOS1EwNUtJeThjV3czZHhnaWl2bFRmYXMrWWhKamFEWjYxbWdRYnBP?=
 =?utf-8?B?V05UbVd2UFRZWUJxdkJDZ3NhdUhYelpmbTVnblM4aUdHSzd6T1dObHJramcv?=
 =?utf-8?B?MlRpSkl3dDU0QW10L0hvYXBaWklVV1NxWnlwM1YxYlQyWExRVGowbnhKcTBk?=
 =?utf-8?B?VzNJQUNwZU50RHpIWkk0Vk9MVzRhcjN4eVhQcTVnOTVqRGhUaXlzY3JEUG1r?=
 =?utf-8?B?WEZUckdqNGNsQmFrR05mMkhSVUVTS2I1Yk5adEU0aVlhQk4vb2JLbVY4NTgv?=
 =?utf-8?B?Ulp6T2REMytmZ2pSWGdoL0VpbFByd3RCbG1KQnR3TzUxYkQyeHBpTHBqRDNS?=
 =?utf-8?B?b09Uelg4TlpaRjl3aUxvRm9OU3RJZWdVS2pJRFRaUVJxc1JCZ2dvaWl4bndW?=
 =?utf-8?B?Mk80ak9HR1llTW4vdzRPR0FtTVBkSkpxQi94N2FVdHY0QncySTV6djRrWnVk?=
 =?utf-8?Q?siN4en6V9Ds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2NQeHlJK3FqcnFJeThtdi92UDVEQ1RNYzlLMGo0TGpEYS9kWTRyT3c3cExW?=
 =?utf-8?B?RUUrOTkxSmE1bDh6dzBMWXhMQzR5WG5nSi9SYUc1UEhMem5jR01ZK0xGZ0dH?=
 =?utf-8?B?VlVCbFVEbkpqVEFZczhueHgrMWRjRXc5UStzazZOMEtOeXdySzAyMkVMODRv?=
 =?utf-8?B?R3dJWC90UGkybkdFc3l2eTV4L3hkZHhXZDNWN0NOSWlJczkyMGYyeXR3V21r?=
 =?utf-8?B?bk94N2NLRmcrTkYyK1JjbTBxbHBWZ2hKQkV6ejRUWWNqZHhNVE4wQVFidWNx?=
 =?utf-8?B?OUFGWHZvY2c5NXZHaDdRbGF3emhXNEJXOG83SXBOVm5Yd1dUb0pudysrTUVq?=
 =?utf-8?B?QTUvWUdLdW1IbXdMZFB0WlU1Zk80cVBzRDJRRHBuUXdXK1NOcDFzeWtJMW4v?=
 =?utf-8?B?N2YxdmdwYTZ1YmVidjBOekphMkpWNDA0bzFNWWVDV0tmS3ZlaEVPdUFhTDha?=
 =?utf-8?B?TUJ2aHBMcTlvdTZad2pVTWt3cnIxZGQ2TURQRlhwVFFBeEJqT3h1bHcxMlZD?=
 =?utf-8?B?aVFMa0dpNGRCcUl4UGg5K0VnUGxmbFZsNUoySG5ycHdYVGtzOXhsTTRzeVJR?=
 =?utf-8?B?aC9qL0hzSW8rM0d5UnJnaCsyOWF6T0RvYzZKNHY4S2NPUW1JbnVodUtGczhZ?=
 =?utf-8?B?d0RidnhPbkZ1ZnQ5MXU3dmE5YXBJc0Rad3ZrOGVla3dIYXlMSVV2ckUzcmNl?=
 =?utf-8?B?QmpIbG5ETUpmRzloNFF3U1NzYzJ6RUp1SXhseFF0RVlVc3pZb1RMRGZNbnVC?=
 =?utf-8?B?SlhzN3pnaDNWT21hK3g5SFZ6dm1zemd1VURucTFtV0VNVlZVVitaa2RnSkg2?=
 =?utf-8?B?UkNUZ0x6VXhTS2xEUGJXODZDZ2JjdDdydE4zOUdjbUd5Vm03RmxrQlZ1dEU2?=
 =?utf-8?B?WC85aWhjTzNEdFNEMnE1TDdjbEtONHdWV21kTklJNFFGSnlqYkhWS0wydlk1?=
 =?utf-8?B?WmtMaWgvZ0lRRWh5UkZiYjJ0bkoxODB2ZkIvdFIzejE0UEcxVVQrcXMzamlL?=
 =?utf-8?B?bWk5SWFWZDhvTjNiN0t1UTBuVzFXd05TMjZaM1g4L0lQUWx5bWhRWWg0VEEz?=
 =?utf-8?B?NmxpVzRGeTB2aUpGbHprb3NES2l1VkhLMUxtd2JRNzFHbHh3NFdrNG1NamJP?=
 =?utf-8?B?aVZrUk9LeWF4LzVpcmtLWEE1NW52UEN1QzRmbTU3a1g2VW9RRThFRk5wS2NH?=
 =?utf-8?B?N0FhV3ZEK1lxb09XdkE4YUcwc3doazZsbHplQWVYVVFiSnI5R0wzdDV6Ylda?=
 =?utf-8?B?VDRFdC8vczFsTFRIKzdpV3NLTmpoNGRaV28zTU5keVJ3dWV2MXFjT2JKUDRN?=
 =?utf-8?B?dFhaeEtvalYrd2Uva3lBLzVKeE83OCt6U3oxV0lvN1Q1RHpZM0M3RXZGNlh3?=
 =?utf-8?B?VzhWd2dSOFJIU045QTRkOXMwU1N1bnliLzl0enVYSnA3ZU1LZ3ZwM3JQN0Fr?=
 =?utf-8?B?V1ZPZWFaU3hkWGFvZXoxWGltKzArTnpPYmNjQm0zbi9wS0ZKbVRxWTJiVGlz?=
 =?utf-8?B?OWJHckdrcnBhU0l3MzlZNGVsVUQyRFZ1aXYzamNEMUduWVJXK1U2YlhSWEFR?=
 =?utf-8?B?VGRjblluaEdXNjF6OE5jTkw5NmMvNSttSzljOFZVMU0vSXZjVWRGalFyYWhQ?=
 =?utf-8?B?bnQrR0kvWXNIQkVuMFUxaVJYaVIwa0ZqZXAwVDlaRkF2VDkrRGRSWEtkV1J5?=
 =?utf-8?B?UlZqcGRndjk1YzVjUzRhb0tMK1AwT1ZKb1V0MnZTZGkxb3ZEdFBMNHpuRW90?=
 =?utf-8?B?cHRxb25rUFJuMW1XYlU2dVp2THo0MTZ0bURyMXM4R1dHYkpVN3FyaUhhcE0r?=
 =?utf-8?B?R3hOcnAwWFljUmd4b0RJbE14OGZUK0w2QXJNQWNSa0JBYUQvMXlPLzYvMXJ2?=
 =?utf-8?B?aUVIOXhBUm1HYkRmeU9WU1cxREt2ODRBby9sMFMySDBYandHQnJRei9NSlZU?=
 =?utf-8?B?czhLWUFCekVqbElML1orSGZVeUNsRXhmQ2hIYmdtT1A4dHUwejVhV3BlZzVE?=
 =?utf-8?B?R2t4RW1kOEQ4ZnN5cTEyWk9BWjBtYXlYQkxvWUJBalphLzNtZCtKSkp0aCta?=
 =?utf-8?B?bWptN2JGeXZoZ2NmSVM4emVCRE9UYU45YTliVFVZQ2xEbEhEZWFyWkZLMEFu?=
 =?utf-8?Q?RkugXmgaRqGYFPqBya1rK8QqE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6db1095-12f4-4b1c-d9dd-08ddda7142e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 13:56:54.8120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRsuTjP58EWLu3neGPftiDAjLioqiSvDsJxQAUyFkFY+64GVYK3TFnWh8EOzi0TL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7849
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

Gentle ping from my side since Arun is on sick leave today.

Matthew are you on vacation or could you take a look? It's kind of urgent to have this fixed.

Thanks,
Christian.

On 24.07.25 12:46, Arunpravin Paneer Selvam wrote:
> Maintain two separate RB trees per order - one for clear (zeroed) blocks
> and another for dirty (uncleared) blocks. This separation improves
> code clarity and makes it more obvious which tree is being searched
> during allocation. It also improves scalability and efficiency when
> searching for a specific type of block, avoiding unnecessary checks
> and making the allocator more predictable under fragmentation.
> 
> The changes have been validated using the existing drm_buddy_test
> KUnit test cases, along with selected graphics workloads,
> to ensure correctness and avoid regressions.
> 
> v2: Missed adding the suggested-by tag. Added it in v2.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/drm_buddy.c | 316 ++++++++++++++++++++++--------------
>  include/drm/drm_buddy.h     |  15 +-
>  2 files changed, 204 insertions(+), 127 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 19e9773b41be..0ffb68474b83 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -43,27 +43,84 @@ static void drm_block_free(struct drm_buddy *mm,
>  	kmem_cache_free(slab_blocks, block);
>  }
>  
> +static inline struct rb_root *
> +__get_root(struct drm_buddy *mm,
> +	   unsigned int order,
> +	   enum free_tree tree)
> +{
> +	if (tree == CLEAR_TREE)
> +		return &mm->clear_tree[order];
> +	else
> +		return &mm->dirty_tree[order];
> +}
> +
> +static inline enum free_tree
> +__get_tree_for_block(struct drm_buddy_block *block)
> +{
> +	return drm_buddy_block_is_clear(block) ? CLEAR_TREE : DIRTY_TREE;
> +}
> +
> +static inline enum free_tree
> +__get_tree_for_flags(unsigned long flags)
> +{
> +	return (flags & DRM_BUDDY_CLEAR_ALLOCATION) ? CLEAR_TREE : DIRTY_TREE;
> +}
> +
> +static inline struct drm_buddy_block *
> +rbtree_get_entry(struct rb_node *node)
> +{
> +	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
> +}
> +
> +static inline struct drm_buddy_block *
> +rbtree_prev_entry(struct rb_node *node)
> +{
> +	return rbtree_get_entry(rb_prev(node));
> +}
> +
> +static inline struct drm_buddy_block *
> +rbtree_first_entry(struct rb_root *root)
> +{
> +	return rbtree_get_entry(rb_first(root));
> +}
> +
> +static inline struct drm_buddy_block *
> +rbtree_last_entry(struct rb_root *root)
> +{
> +	return rbtree_get_entry(rb_last(root));
> +}
> +
> +static inline bool rbtree_is_empty(struct rb_root *root)
> +{
> +	return RB_EMPTY_ROOT(root);
> +}
> +
>  static void rbtree_insert(struct drm_buddy *mm,
> -			  struct drm_buddy_block *block)
> +			  struct drm_buddy_block *block,
> +			  enum free_tree tree)
>  {
> -	struct rb_root *root = &mm->free_tree[drm_buddy_block_order(block)];
> -	struct rb_node **link = &root->rb_node;
> -	struct rb_node *parent = NULL;
> +	struct rb_node **link, *parent = NULL;
>  	struct drm_buddy_block *node;
> -	u64 offset;
> +	struct rb_root *root;
> +	unsigned int order;
> +
> +	order = drm_buddy_block_order(block);
>  
> -	offset = drm_buddy_block_offset(block);
> +	root = __get_root(mm, order, tree);
> +	link = &root->rb_node;
>  
>  	while (*link) {
>  		parent = *link;
> -		node = rb_entry(parent, struct drm_buddy_block, rb);
> +		node = rbtree_get_entry(parent);
>  
> -		if (offset < drm_buddy_block_offset(node))
> +		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
>  			link = &parent->rb_left;
>  		else
>  			link = &parent->rb_right;
>  	}
>  
> +	block->tree = tree;
> +
>  	rb_link_node(&block->rb, parent, link);
>  	rb_insert_color(&block->rb, root);
>  }
> @@ -71,27 +128,15 @@ static void rbtree_insert(struct drm_buddy *mm,
>  static void rbtree_remove(struct drm_buddy *mm,
>  			  struct drm_buddy_block *block)
>  {
> +	unsigned int order = drm_buddy_block_order(block);
>  	struct rb_root *root;
>  
> -	root = &mm->free_tree[drm_buddy_block_order(block)];
> +	root = __get_root(mm, order, block->tree);
>  	rb_erase(&block->rb, root);
>  
>  	RB_CLEAR_NODE(&block->rb);
>  }
>  
> -static inline struct drm_buddy_block *
> -rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
> -{
> -	struct rb_node *node = rb_last(&mm->free_tree[order]);
> -
> -	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
> -}
> -
> -static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
> -{
> -	return RB_EMPTY_ROOT(&mm->free_tree[order]);
> -}
> -
>  static void clear_reset(struct drm_buddy_block *block)
>  {
>  	block->header &= ~DRM_BUDDY_HEADER_CLEAR;
> @@ -114,10 +159,14 @@ static void mark_allocated(struct drm_buddy *mm,
>  static void mark_free(struct drm_buddy *mm,
>  		      struct drm_buddy_block *block)
>  {
> +	enum free_tree tree;
> +
>  	block->header &= ~DRM_BUDDY_HEADER_STATE;
>  	block->header |= DRM_BUDDY_FREE;
>  
> -	rbtree_insert(mm, block);
> +	tree = __get_tree_for_block(block);
> +
> +	rbtree_insert(mm, block, tree);
>  }
>  
>  static void mark_split(struct drm_buddy *mm,
> @@ -212,53 +261,52 @@ static int __force_merge(struct drm_buddy *mm,
>  	if (min_order > mm->max_order)
>  		return -EINVAL;
>  
> -	for (i = min_order - 1; i >= 0; i--) {
> -		struct drm_buddy_block *block, *prev_block, *first_block;
> -
> -		first_block = rb_entry(rb_first(&mm->free_tree[i]), struct drm_buddy_block, rb);
> +	for_each_free_tree() {
> +		for (i = min_order - 1; i >= 0; i--) {
> +			struct rb_root *root = __get_root(mm, i, tree);
> +			struct drm_buddy_block *block, *prev_block;
>  
> -		for_each_rb_entry_reverse_safe(block, prev_block, &mm->free_tree[i], rb) {
> -			struct drm_buddy_block *buddy;
> -			u64 block_start, block_end;
> +			for_each_rb_entry_reverse_safe(block, prev_block, root, rb) {
> +				struct drm_buddy_block *buddy;
> +				u64 block_start, block_end;
>  
> -			if (RB_EMPTY_NODE(&block->rb))
> -				break;
> +				if (RB_EMPTY_NODE(&block->rb))
> +					break;
>  
> -			if (!block->parent)
> -				continue;
> +				if (!block->parent)
> +					continue;
>  
> -			block_start = drm_buddy_block_offset(block);
> -			block_end = block_start + drm_buddy_block_size(mm, block) - 1;
> +				block_start = drm_buddy_block_offset(block);
> +				block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>  
> -			if (!contains(start, end, block_start, block_end))
> -				continue;
> +				if (!contains(start, end, block_start, block_end))
> +					continue;
>  
> -			buddy = __get_buddy(block);
> -			if (!drm_buddy_block_is_free(buddy))
> -				continue;
> +				buddy = __get_buddy(block);
> +				if (!drm_buddy_block_is_free(buddy))
> +					continue;
>  
> -			WARN_ON(drm_buddy_block_is_clear(block) ==
> -				drm_buddy_block_is_clear(buddy));
> +				WARN_ON(drm_buddy_block_is_clear(block) ==
> +					drm_buddy_block_is_clear(buddy));
>  
> -			/*
> -			 * If the prev block is same as buddy, don't access the
> -			 * block in the next iteration as we would free the
> -			 * buddy block as part of the free function.
> -			 */
> -			if (prev_block && prev_block == buddy) {
> -				if (prev_block != first_block)
> -					prev_block = rb_entry(rb_prev(&prev_block->rb),
> -							      struct drm_buddy_block,
> -							      rb);
> -			}
> +				/*
> +				 * If the prev block is same as buddy, don't access the
> +				 * block in the next iteration as we would free the
> +				 * buddy block as part of the free function.
> +				 */
> +				if (prev_block && prev_block == buddy) {
> +					if (prev_block != rbtree_first_entry(root))
> +						prev_block = rbtree_prev_entry(&prev_block->rb);
> +				}
>  
> -			rbtree_remove(mm, block);
> -			if (drm_buddy_block_is_clear(block))
> -				mm->clear_avail -= drm_buddy_block_size(mm, block);
> +				rbtree_remove(mm, block);
> +				if (drm_buddy_block_is_clear(block))
> +					mm->clear_avail -= drm_buddy_block_size(mm, block);
>  
> -			order = __drm_buddy_free(mm, block, true);
> -			if (order >= min_order)
> -				return 0;
> +				order = __drm_buddy_free(mm, block, true);
> +				if (order >= min_order)
> +					return 0;
> +			}
>  		}
>  	}
>  
> @@ -301,14 +349,22 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>  
>  	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>  
> -	mm->free_tree = kmalloc_array(mm->max_order + 1,
> -				      sizeof(struct rb_root),
> -				      GFP_KERNEL);
> -	if (!mm->free_tree)
> +	mm->clear_tree = kmalloc_array(mm->max_order + 1,
> +				       sizeof(struct rb_root),
> +				       GFP_KERNEL);
> +	if (!mm->clear_tree)
> +		return -ENOMEM;
> +
> +	mm->dirty_tree = kmalloc_array(mm->max_order + 1,
> +				       sizeof(struct rb_root),
> +				       GFP_KERNEL);
> +	if (!mm->dirty_tree)
>  		return -ENOMEM;
>  
> -	for (i = 0; i <= mm->max_order; ++i)
> -		mm->free_tree[i] = RB_ROOT;
> +	for (i = 0; i <= mm->max_order; ++i) {
> +		mm->clear_tree[i] = RB_ROOT;
> +		mm->dirty_tree[i] = RB_ROOT;
> +	}
>  
>  	mm->n_roots = hweight64(size);
>  
> @@ -356,7 +412,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>  		drm_block_free(mm, mm->roots[i]);
>  	kfree(mm->roots);
>  out_free_tree:
> -	kfree(mm->free_tree);
> +	kfree(mm->clear_tree);
> +	kfree(mm->dirty_tree);
>  	return -ENOMEM;
>  }
>  EXPORT_SYMBOL(drm_buddy_init);
> @@ -393,7 +450,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
>  	WARN_ON(mm->avail != mm->size);
>  
>  	kfree(mm->roots);
> -	kfree(mm->free_tree);
> +	kfree(mm->clear_tree);
> +	kfree(mm->dirty_tree);
>  }
>  EXPORT_SYMBOL(drm_buddy_fini);
>  
> @@ -417,15 +475,15 @@ static int split_block(struct drm_buddy *mm,
>  		return -ENOMEM;
>  	}
>  
> -	mark_free(mm, block->left);
> -	mark_free(mm, block->right);
> -
>  	if (drm_buddy_block_is_clear(block)) {
>  		mark_cleared(block->left);
>  		mark_cleared(block->right);
>  		clear_reset(block);
>  	}
>  
> +	mark_free(mm, block->left);
> +	mark_free(mm, block->right);
> +
>  	mark_split(mm, block);
>  
>  	return 0;
> @@ -632,26 +690,22 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>  }
>  
>  static struct drm_buddy_block *
> -get_maxblock(struct drm_buddy *mm, unsigned int order,
> -	     unsigned long flags)
> +get_maxblock(struct drm_buddy *mm,
> +	     unsigned int order,
> +	     enum free_tree tree)
>  {
>  	struct drm_buddy_block *max_block = NULL, *block = NULL;
> +	struct rb_root *root;
>  	unsigned int i;
>  
>  	for (i = order; i <= mm->max_order; ++i) {
> -		struct drm_buddy_block *tmp_block;
> -
> -		for_each_rb_entry_reverse(tmp_block, &mm->free_tree[i], rb) {
> -			if (block_incompatible(tmp_block, flags))
> +		root = __get_root(mm, i, tree);
> +		if (!rbtree_is_empty(root)) {
> +			block = rbtree_last_entry(root);
> +			if (!block)
>  				continue;
> -
> -			block = tmp_block;
> -			break;
>  		}
>  
> -		if (!block)
> -			continue;
> -
>  		if (!max_block) {
>  			max_block = block;
>  			continue;
> @@ -672,36 +726,38 @@ alloc_from_freetree(struct drm_buddy *mm,
>  		    unsigned long flags)
>  {
>  	struct drm_buddy_block *block = NULL;
> +	struct rb_root *root;
> +	enum free_tree tree;
>  	unsigned int tmp;
>  	int err;
>  
> +	tree = __get_tree_for_flags(flags);
> +
>  	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> -		block = get_maxblock(mm, order, flags);
> +		block = get_maxblock(mm, order, tree);
>  		if (block)
>  			/* Store the obtained block order */
>  			tmp = drm_buddy_block_order(block);
>  	} else {
>  		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> -			struct drm_buddy_block *tmp_block;
> -
> -			for_each_rb_entry_reverse(tmp_block, &mm->free_tree[tmp], rb) {
> -				if (block_incompatible(tmp_block, flags))
> -					continue;
> -
> -				block = tmp_block;
> -				break;
> +			/* Get RB tree root for this order and tree */
> +			root = __get_root(mm, tmp, tree);
> +			if (!rbtree_is_empty(root)) {
> +				block = rbtree_last_entry(root);
> +				if (block)
> +					break;
>  			}
> -
> -			if (block)
> -				break;
>  		}
>  	}
>  
>  	if (!block) {
> -		/* Fallback method */
> +		/* Try allocating from the other tree */
> +		tree = (tree == CLEAR_TREE) ? DIRTY_TREE : CLEAR_TREE;
> +
>  		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> -			if (!rbtree_is_empty(mm, tmp)) {
> -				block = rbtree_last_entry(mm, tmp);
> +			root = __get_root(mm, tmp, tree);
> +			if (!rbtree_is_empty(root)) {
> +				block = rbtree_last_entry(root);
>  				if (block)
>  					break;
>  			}
> @@ -859,34 +915,39 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>  	if (order == 0)
>  		return -ENOSPC;
>  
> -	if (rbtree_is_empty(mm, order))
> +	if (rbtree_is_empty(__get_root(mm, order, CLEAR_TREE)) &&
> +	    rbtree_is_empty(__get_root(mm, order, DIRTY_TREE)))
>  		return -ENOSPC;
>  
> -	for_each_rb_entry_reverse(block, &mm->free_tree[order], rb) {
> -		/* Allocate blocks traversing RHS */
> -		rhs_offset = drm_buddy_block_offset(block);
> -		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
> -					       &filled, blocks);
> -		if (!err || err != -ENOSPC)
> -			return err;
> -
> -		lhs_size = max((size - filled), min_block_size);
> -		if (!IS_ALIGNED(lhs_size, min_block_size))
> -			lhs_size = round_up(lhs_size, min_block_size);
> -
> -		/* Allocate blocks traversing LHS */
> -		lhs_offset = drm_buddy_block_offset(block) - lhs_size;
> -		err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
> -					       NULL, &blocks_lhs);
> -		if (!err) {
> -			list_splice(&blocks_lhs, blocks);
> -			return 0;
> -		} else if (err != -ENOSPC) {
> +	for_each_free_tree() {
> +		struct rb_root *root = __get_root(mm, order, tree);
> +
> +		for_each_rb_entry_reverse(block, root, rb) {
> +			/* Allocate blocks traversing RHS */
> +			rhs_offset = drm_buddy_block_offset(block);
> +			err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
> +						       &filled, blocks);
> +			if (!err || err != -ENOSPC)
> +				return err;
> +
> +			lhs_size = max((size - filled), min_block_size);
> +			if (!IS_ALIGNED(lhs_size, min_block_size))
> +				lhs_size = round_up(lhs_size, min_block_size);
> +
> +			/* Allocate blocks traversing LHS */
> +			lhs_offset = drm_buddy_block_offset(block) - lhs_size;
> +			err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
> +						       NULL, &blocks_lhs);
> +			if (!err) {
> +				list_splice(&blocks_lhs, blocks);
> +				return 0;
> +			} else if (err != -ENOSPC) {
> +				drm_buddy_free_list_internal(mm, blocks);
> +				return err;
> +			}
> +			/* Free blocks for the next iteration */
>  			drm_buddy_free_list_internal(mm, blocks);
> -			return err;
>  		}
> -		/* Free blocks for the next iteration */
> -		drm_buddy_free_list_internal(mm, blocks);
>  	}
>  
>  	return -ENOSPC;
> @@ -1198,11 +1259,16 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>  
>  	for (order = mm->max_order; order >= 0; order--) {
>  		struct drm_buddy_block *block;
> +		struct rb_root *root;
>  		u64 count = 0, free;
>  
> -		for_each_rb_entry(block, &mm->free_tree[order], rb) {
> -			BUG_ON(!drm_buddy_block_is_free(block));
> -			count++;
> +		for_each_free_tree() {
> +			root = __get_root(mm, order, tree);
> +
> +			for_each_rb_entry(block, root, rb) {
> +				BUG_ON(!drm_buddy_block_is_free(block));
> +				count++;
> +			}
>  		}
>  
>  		drm_printf(p, "order-%2d ", order);
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index a64d108a33b7..afaf62ee05e1 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -14,6 +14,11 @@
>  
>  #include <drm/drm_print.h>
>  
> +enum free_tree {
> +	CLEAR_TREE = 0,
> +	DIRTY_TREE,
> +};
> +
>  #define range_overflows(start, size, max) ({ \
>  	typeof(start) start__ = (start); \
>  	typeof(size) size__ = (size); \
> @@ -23,6 +28,9 @@
>  	start__ >= max__ || size__ > max__ - start__; \
>  })
>  
> +#define for_each_free_tree() \
> +	for (enum free_tree tree = CLEAR_TREE; tree <= DIRTY_TREE; tree++)
> +
>  /*
>   * for_each_rb_entry() - iterate over an RB tree in order
>   * @pos:	the struct type * to use as a loop cursor
> @@ -89,9 +97,11 @@ struct drm_buddy_block {
>  	 * a list, if so desired. As soon as the block is freed with
>  	 * drm_buddy_free* ownership is given back to the mm.
>  	 */
> -	struct rb_node rb;
>  	struct list_head link;
>  	struct list_head tmp_link;
> +
> +	enum free_tree tree;
> +	struct rb_node rb;
>  };
>  
>  /* Order-zero must be at least SZ_4K */
> @@ -105,7 +115,8 @@ struct drm_buddy_block {
>   */
>  struct drm_buddy {
>  	/* Maintain a free list for each order. */
> -	struct rb_root *free_tree;
> +	struct rb_root *clear_tree;
> +	struct rb_root *dirty_tree;
>  
>  	/*
>  	 * Maintain explicit binary tree(s) to track the allocation of the

