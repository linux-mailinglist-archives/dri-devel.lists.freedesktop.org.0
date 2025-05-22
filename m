Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B642EAC10E1
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 18:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BA78903B;
	Thu, 22 May 2025 16:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DEl4BY7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF7210E5AD;
 Thu, 22 May 2025 16:19:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AalKygZMX6AEbiDof7+dScZTfWTVVg9tk1/UOlzbryJUoB+8zkTlPTRPrSpS3asSHqml4fPEIOXZg3/sk5oyE6s1AClmNj1w0vDqksdK13bbl5Cl8m8FKrB8js6MZq95bfn39XQqUWhOndwaKwZej26jAO7wX7ASrJZEDLdswFd2hlnexbIoZgetydeUKOektbEd4nHGvNARCxGeBkr546JF0OQl8bXpD1y5Xf4lncM7HmzzRPCVwM3xFXASbOlecL97U8tsCH86jL6pbaJuPbWJQcgd8RUEkNOuWqVo2ZCbLu3sHY44kQdVinn20WynViENYPFkJ+AladnUGFpoKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NQNapjCdjYuHFMkLNk08CyBB7PfjzqXBpPisauK8ZM=;
 b=GNGhaaVCILouZ/6wD2ZiMDUIFJBr6JZa4fmTMjjUpx2nK9LdBUsTJfMfac7ElGYa1jFxh9DhqUZHpxHP/eS+HopbVI2SFurVnlokA+pgBtK+0+80CPh34mLA2zgPZOjivFLqZiO1Bh10azWRxCQU2sKhImx2UFMLXAIkZin0LRVyt4zHzcDuFgs9q6yXHFUOXEUxAeSmG7RPiWj8PYOF2GDQAa3DJajT9QPnvyCWBJVW+w5jvM+q8z0t50udsHXN0GWVN7kpLsh6aBX4bh9pgkuP+qOuQ612B+Vwq1TdGKBB78dWhehIG/ebvJn3m63F6kCHTDRyqnI8GYJ2tNgCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NQNapjCdjYuHFMkLNk08CyBB7PfjzqXBpPisauK8ZM=;
 b=DEl4BY7FHCOuNTEqb2V7fhrCQCJhP4wwpw2omkyLmNjTaVXoeKItk9DEZ4qYVdXms3sO6yMpxwzsX7Ho3PNQwYjpIwmbiAR1f01X6vZESIusnTHyJHo8Wt82LNfiTDIzPq0b7vv01n5goO1J6kmsKWzxQQMcW4U6Y3Xobt46h0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 22 May
 2025 16:19:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 16:19:23 +0000
Message-ID: <bdf82e27-ae7e-4580-ab77-c05842bc8ec1@amd.com>
Date: Thu, 22 May 2025 18:19:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency a bit
To: Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 phasta@mailbox.org, dakr@kernel.org, amd-gfx@lists.freedesktop.org
References: <20250522134117.7561-1-christian.koenig@amd.com>
 <20250522134117.7561-2-christian.koenig@amd.com>
 <a96a73ee-32a5-4c38-b277-e76101b94837@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a96a73ee-32a5-4c38-b277-e76101b94837@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f349b99-0ebc-4390-9a3e-08dd994c6a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0RQZFVZeDlrRXpMcFJmdWxqTkxiZ1RZOUVHOXhVTjBYNWNCSmtBM3dvS1ho?=
 =?utf-8?B?a2FzYi93aFhhMVcxUUtocXgvUVhEQnZlRzhoOFpzMjEwSkNMY01sd1grWG9z?=
 =?utf-8?B?Rmc5RTVONlNoTjJHZGdYK2Z2SmVFVWZNVUE4Z0pnRmxnNEorNGtrVTN5TDJS?=
 =?utf-8?B?RG9ZWjhiZ2ZJRWJnVnBjNnRsSUxYRlpvNGJLc1V6UUxhSmVXd2crUWxrVDlD?=
 =?utf-8?B?TGU0N1JBWWNiZEZhUWVHTHpPTkZ6UlpycjZIcFdVR294N3RxK1BDNWUrblV3?=
 =?utf-8?B?cDIrbWUyTnpDUklBVjlOYWVPYWdhOGJ1OWJGckVCVmhYbi9jUUZ6cEVVcU9X?=
 =?utf-8?B?RHZzMWJZSmU2Ti9wWHFJUVF6ODYyM09JcjcweE14S0h0YmFWcFphM3JSVzB3?=
 =?utf-8?B?VkZjRFJBd3Bva1c4TlZRS2xZWDhzTEgzd3FZa1RlSHp2M3lKczlvd3lRVVVi?=
 =?utf-8?B?Q2VIZHBCZWtMNW9UT2NYVHRZak1yejAwK3JmN3UrdkxpdEhHU2wrcnBhNEZK?=
 =?utf-8?B?Q2hwVXJHZWVjejI1a2JsaDhZN0RIY01BMXdwdlQ2Nkw0QkpnOW96UW9OZjBK?=
 =?utf-8?B?c0dwakJpMXNTaW0vcDNXek5mZHNIc3NNRVdKdk5NcDN0b0RvT3hCZEpPUlcx?=
 =?utf-8?B?UUU5ZktxU0hLWXJkRWJsc2xPaE5Ca2tBSGloWm5kc2J5VzZTUzNRNnJPUERH?=
 =?utf-8?B?ZWVBQ2ZrTUxFbU5VRWN6MlBoeGVhSHJFejdBblpQL2kxT1h0Y1BkcTloRFRn?=
 =?utf-8?B?S1NLbU44dlk4aTZ4aWxKYTlOdFFpMFNrRjk3OGlGcURxM2NsVGIydVNkOUhK?=
 =?utf-8?B?Mk5NSldPem9mdVFjV1hrd1AvUEJaWUdzNVVBUkRxSGZkcXkzT1p3Y2VYWDRs?=
 =?utf-8?B?MFQveE5OT1p6K3Y5Qnh4alBhdWY5SlhtcERLUGsySUsrSzY0blgxWncrRUp1?=
 =?utf-8?B?VGZyNDFiMXpDRVoyUlJ5K25aREpqcHVCdmo1VDVzVXVTUGE5MGRtcnZrU05S?=
 =?utf-8?B?NlMxdkFUNXBiOC9mQk5EYXN3TkRPN1ozbmd1bTVmUjlpQnROdmk2YVZuOFhO?=
 =?utf-8?B?dys1QXVySGZ4R3dVRGNEVE1sczU5aVJFRTBwOUYzRG5CWXNFT1krRldhTk9F?=
 =?utf-8?B?NUtnQTZseVB5NEFtaWNJTEJNem9PRFhrK2lPWkR5VXVlVUxyQVE1OFdMRTZC?=
 =?utf-8?B?Wm5hNnZmd09LdTBSNmVPZHRtUjVVekZmU2lDMlRuNmdkQ3dHMTEvYjdnbVF1?=
 =?utf-8?B?azY2OTFjRVhnK21YNlg2bzkrMTVQb2xURUNjQTQyS0g1Y0xXSzE5R0Vha1Fv?=
 =?utf-8?B?clVkOThlTk9yVWkyMzIwK3VMZ0t3TmNndFNxZVI3N3RYUnl6dDR0T2lNbjBh?=
 =?utf-8?B?RnlyZmF2eDdBajU2N2dnRGRPOWZYeXdrS09rT0Jrcldaa2VtbXZXeWZMM3Rr?=
 =?utf-8?B?MHB1azZnb3BFYnQ2T1E0ZG5uL1lHME0yeWtHMzdycFZGTlVxb0I4NnllcThX?=
 =?utf-8?B?MkZBWEN4ZjJjNnNvMlB0UE0rYUdCaUxmay9jSlFjRHQxeUZMS3laV1ZSUE5O?=
 =?utf-8?B?Y3k0T0VWQ25tUFQwcFJXTURMQ3RmdDZvcWtlY0FCQUtOTTFKYmV5aVo5clo4?=
 =?utf-8?B?ZzBMSno5dEtMVXg2K0VUeHVnQVYvaTZSbEgyeTNmUC9RZ21GcURES3ZKaWZS?=
 =?utf-8?B?QlpOVFpEemJCbnlXclVXbWdnbEczeWtORTIvMmJLb3JsVXFGWHpaUVhQaUVX?=
 =?utf-8?B?V1RPVWYvNjc2QVUySFhUMldZR1NLL05Lb1EyZHRvdklieWIrU0RqVDhzU1lY?=
 =?utf-8?B?OGN5MTF6YllXZHVJdlRNMkV1b1AyazhPYVpIR0d3OG9hTVp5VXo0bHErS3B4?=
 =?utf-8?B?TVJKS2tqL0NIT0ZYc2F2RUNDTEQvVWZ2OVJiTHhuY1BlazJXYXV6UTV3Skgy?=
 =?utf-8?Q?ZJHkRlX1Yl0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDFuOTNUTEREYmtkbEtkV1NRaEI4SVhtS3MwaWJZbTRTR0ViRnViOGx5VHNE?=
 =?utf-8?B?ZmI2OU1qYWlCdjFNSVBzN0t5dDhPVzdQWTJldlRaazBkQzQ5MWhZUkJrWndq?=
 =?utf-8?B?SWswUVo5UDJhSCtUM240dWpyc1g2Q3pYVjQ0QlZ6N250bWRoRG5TVXNkbjFD?=
 =?utf-8?B?TXJtaVFVUDMrWnFobFhFZjgwWDlDTzlaUTdJZkVtWGJJeENJY3JEd2lFSjNp?=
 =?utf-8?B?bytyZVJMMEsySW1FTVpMRGUyckt2TndMK294bnpTNnI4QktEVmF2eTFrdEdN?=
 =?utf-8?B?Rkd5akxBcCt5MFM2UVhncmpScndoaGdkMWp6WUtRQTJac2Y4YXhaRG9KYlRj?=
 =?utf-8?B?U0FYM1UrNHpFUHUzdkJObHdWRmxRanZXVDJJcjF6TjlYWDdlNFdMWTNFVVd1?=
 =?utf-8?B?a3ZKakY4M2hURUhQZit5LzJHSmNXdmhtRDVlZlBPZjZKaGdvYzUyaW1CSGMy?=
 =?utf-8?B?WjJ5bTlDaFhIaVVyMWhaRGVuR3V3V3ArUGFjZDRVQzNPRUxqeTFpQUdGbE84?=
 =?utf-8?B?VkFIM0RENFVGaWFBeFhSQ3RlbWhQUXpzcE5uTFVxU1BBYUM0N1ZrSXJNTDdK?=
 =?utf-8?B?NENKNzhHTXNPb2tCS3oxakNxNnFWUUhJUjMxd1ZBcDZsUVBtSzhzUEJKbDBN?=
 =?utf-8?B?RlAvZGlFcTZNK3pnbis3NEllNlNCOVBYNGFqUXhoQmxpUHhaMENrWnQzTmRV?=
 =?utf-8?B?MU1Ka2V2RU5GaGVuSnRRZTRJMjZEZkl0TG9RMDlwbXhwNmxMb3dPL0dNSHBP?=
 =?utf-8?B?d0JFN09ib0NLai80d3pVdnhtVVJVUURqaldFSDRyTy9qd1JYckxzMFF2VUps?=
 =?utf-8?B?N1pOMHBVcy9xQXlzWkV0d2ZhQlEwY29Pb2VvSDJvczVibGUwUGk5Q3Bid0Q5?=
 =?utf-8?B?djNxd2xvNFlYbEpWekpNd0tpcHpZZVF0a2R4Z3BaY2tFYlN1ZnlwUjdLL2Nj?=
 =?utf-8?B?bkRwem5zZy9VT1B1akVvYzBtaDI5WXl2QjZxYjdNei9maGg2T3ViSjUrbTd4?=
 =?utf-8?B?YU5JemU2L0ZycXA0dGlZS09kdzladUljMytmYVhRYndPbDhHNFVpcmMwOTVQ?=
 =?utf-8?B?TjA4akt5QWV4dit6L3kvcmE5NDErUzBMeHZpY2U1V1JlNFpvendrc09Zbi9N?=
 =?utf-8?B?YXRRWlhIZzVBT3B1MWZHS1hKMkVYQ3N3OUxIMURRNGpoaW9qU0dPVWE4Uy92?=
 =?utf-8?B?bmx3T0dSZGp2aFFXREVneUZseWcrc1R5N3hmUHNxTlhmb1d1aDZCQ1F0MlRv?=
 =?utf-8?B?YVM5SFd0Sk40RVFLQ2ozVmlEQ2NDaDFFQnRoaVlZS1FUTFF5T3hEQXd0bnNr?=
 =?utf-8?B?N0pXbDIwa2F4WFh1MnZTVFFYWEhQa3BsaXlsdGo3R2QxelRWazEyeFdHdzBv?=
 =?utf-8?B?YS84YkNoNFRpWmZmclBQZldNZkpwTnNQRjk3NUJiSEV1aVcxMCt0YWZyU01C?=
 =?utf-8?B?QzFwd0llcllwNy9FeVE5d29PR3grVlVPS2NwTEs4aG8vdmRPQXF2djN4Q3hJ?=
 =?utf-8?B?cmhEMS85U1p3Z0gzMnhMekl3dmF5ZW45d3dNb1NNOWpNMDFsTFIxZEorQ2dy?=
 =?utf-8?B?M0FDUGROTkJxNnovNlFMRTZBVlV5RnBObVdRR0VBaTVtbXJzUVN6MklBTHI4?=
 =?utf-8?B?S3FZUVNiL1RnUU1keGZlcHgyWk9YZEJiaVJReFpROGJ0ZkdkemVveml2WmtL?=
 =?utf-8?B?YzBOYXRDVjhhdkxoWExHeHU0ZXowQmthWHM4d3ZQNEhoYjMwYkRTYmFYaHov?=
 =?utf-8?B?VThWTm0zc0E2ZTJXMlU3MU4vekxVeWNpTFIzM1ZvNmhpUGp4MzRSNEJKQmRo?=
 =?utf-8?B?Q1o3b0pPbWl0SUxPMWliYzFHdDNzTHdRdzB1eWU0NE1RTHdneWZXYU00Umhv?=
 =?utf-8?B?cFgzTU1FUHRkVlViZktackdSWGxrM3VPaE1jbFk2TlRGSlBtVE15V0hRc01E?=
 =?utf-8?B?M3JQZGcxTE5aWWg3ZlFCQVBoZm4wV3MzcURaWHJnUzkyUkg3Wng1S0xxa3Iz?=
 =?utf-8?B?bDRZZWh6ZmFuTUV3dHlRekJnZ3BTM3MyM0N4eEUrOHhKSkdNbXFZRk9WL29z?=
 =?utf-8?B?NlMwUDB4MGlmaUtJd1RkdnpCaEpjMEM3RjdqNUVQSWh2OUl2cmQ0Q2tXc3Rs?=
 =?utf-8?Q?LjkkjrQkfj8SqgjsUwHRB+ouv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f349b99-0ebc-4390-9a3e-08dd994c6a01
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 16:19:23.4182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1kmr7cExeVEpVeg7gm70MpO8YhlcWLvucRfaPHtp6Vf9Cg+gFwWBJ3w7AB9Qqmw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6942
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

On 5/22/25 16:27, Tvrtko Ursulin wrote:
> 
> On 22/05/2025 14:41, Christian König wrote:
>> Since we already iterated over the xarray we know at which index the new
>> entry should be stored. So instead of using xa_alloc use xa_store and
>> write into the index directly.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index f7118497e47a..d2d64bf17c96 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>                    struct dma_fence *fence)
>>   {
>> +    unsigned long index = -1;
>>       struct dma_fence *entry;
>> -    unsigned long index;
>> -    u32 id = 0;
>> -    int ret;
>>         if (!fence)
>>           return 0;
>> @@ -896,11 +894,13 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>           return 0;
>>       }
>>   -    ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
>> -    if (ret != 0)
>> +    entry = xa_store(&job->dependencies, index + 1, fence, GFP_KERNEL);
> 
> From the code it looks index does not "move" for NULL slots?

Correct, but I just found out that the macro initializes index to zero, so that approach also doesn't work.

*sigh* going to look into this again tomorrow. It looks like this use case is somehow not well supported at all by xarray.

Regards,
Christian.

> 
> That is, if someone:
> 
> 1) Preallocates one entry, when trying to populate it index will be -1 after xa_for_each?
> 
> 2) Add one, preallocate one, then add one more - index will be 0 after xa_for_each?
> 
> Regards,
> 
> Tvrtko
> 
>> +    if (xa_is_err(entry))
>>           dma_fence_put(fence);
>> +    else
>> +        WARN_ON(entry);
>>   -    return ret;
>> +    return xa_err(entry);
>>   }
>>   EXPORT_SYMBOL(drm_sched_job_add_dependency);
>>   
> 

