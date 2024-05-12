Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BAF8C356C
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 10:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE8110E145;
	Sun, 12 May 2024 08:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uWr/WF1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A62310E122;
 Sun, 12 May 2024 08:04:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=er3OuwfShQuaTgpXY0p4jycP607HPL7Auhg+DXg23pNJTlV/kZXyk1sG1W6v/RJWUjp/F8tvMCNDKKewA/enDF1YtRyG/QgVzN05Bg4Q2MtILWlR/ms8VkserRAT2zx7m2dNf/Snxplbv17CPrOSMzU4hvnrRLjU6vUyz1UGa/HmUaq58NukGLhmM+MPQCWhw74Rjc5fzOoXjfULH+f52munaVuD/0PfjxlHm0SExwd2qmz7gj6X4Z1Fzqlo9NxV36/Mbsf9LNQMqK/R1MCc9BSKX+qziA29zE6BVXnIFKJIV6uQoBSFM0ZJKDPFCCBtn6mSPFic1zB0lZizkHnDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwcsJTTNYAXjam1NZqIwh/rd4isr0wbhenOwXnbrVzo=;
 b=RlnUbgaM/V1vzcZSUqorhDISboa5nOvGuyjEHAMnmIYXe4AISUO0zdTp7ejsNVZ2pMFwH9tiBmHeSvcNgX7u8LgR5Y2U1j1p0bpU6oM2wS84uxRlX/7zm+Gp5jatirIMhNlBZW1uyPCCSIwrnWyN7giHpVD8vl2PpDaaPbHZpYnwgn2OwNWmpwQZN8Iqe2eLvnzBnLgBzm4WxRf88yGD4wsoeyO8hu7WercgJcY8KUkJhqjnfnyVmxoAzheS+4B46fcMOtw06GEMnhc7HOXHLturDEdkjO2cHvnTwqkvWWP6p+2x2Mcyv1Wxv8Y9BzlO0sN2HMAsmiMwCsM0GF+UVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwcsJTTNYAXjam1NZqIwh/rd4isr0wbhenOwXnbrVzo=;
 b=uWr/WF1qsdj1LkvN35PeUeOzZDmCnqqyViKKmoVHZ7JxQQEi6hJpUYjEM0Iu6LA4xKecS6leJzswv9cSXVUdzCOTqRO1jwfnUvGkai2mLxgdzKuO1xFdSwQE6zilc6qkctQBvFw4JV7bL24CBBrASgMu7c51TzXKs11cntZzIEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM4PR12MB6470.namprd12.prod.outlook.com (2603:10b6:8:b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sun, 12 May
 2024 08:03:57 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%6]) with mapi id 15.20.7544.052; Sun, 12 May 2024
 08:03:57 +0000
Message-ID: <127e58ba-cd09-4fb7-ad9c-7f4b9efdb80b@amd.com>
Date: Sun, 12 May 2024 13:33:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Fix the range bias clear memory allocation
 issue
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, christian.koenig@amd.com, alexander.deucher@amd.com
References: <20240508065720.125846-1-Arunpravin.PaneerSelvam@amd.com>
 <Zjs6wVITtRuXoRDz@phenom.ffwll.local>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <Zjs6wVITtRuXoRDz@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0128.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::13) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|DM4PR12MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc0165a-c320-41eb-06dd-08dc725a12c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmZLdG9zM0VPcnEzaUN3SDlhaVRnTk1MU25WOWgyeis3a1A4WUdQTmZYdi82?=
 =?utf-8?B?ZWM5RGRCWmZsa0tsbDk5djRZWFAreWVwanZCWHNIenlEaDV0UE9ZZnNTOWsv?=
 =?utf-8?B?WnlLUko4dlA1T3FVdlI1TlU2K0hFYVphUlQ4bktvbjFiMExUSFVWcTlqNlpU?=
 =?utf-8?B?SXRXbU11ZnBMaUh4V051c0diUStOSG9GK09UNjUvT2ZrYW9uMEFjTnZqdzdZ?=
 =?utf-8?B?YmtSZllQN2Q5Yjg5RXA5T2hJeTVkaTg0UjF2N0xzMUF5b3lrYkhEZ2xMNExa?=
 =?utf-8?B?dVExYW01WmMreWl2OHdlQ21tZ1NzR2hFQmZTUHEyWHljcTlMV2NpSFZoaVJH?=
 =?utf-8?B?bFV4c2phMUxTN0NtcXhlTkx0bEJkSGRMallqcDhoenBKb1QvajhsZk5mQUtp?=
 =?utf-8?B?bkdpdERDUUxuZ3BZTXQ0TWdvUmhZamlJcHVpajUwZXRaWU1jZmROd0graS9x?=
 =?utf-8?B?VDlEMHJrcjJPQlZLYmRYeG83bk1oQTFsQ2YycUlKY0xqbnZOV1oreUZoQVFm?=
 =?utf-8?B?WTQzKzlkaUtFOSsrOTl6MUZuTVhxOXNUbTRtcnJOQms2aHNqdksyYnNZNG94?=
 =?utf-8?B?SFpEdW5teHRuamZCOTdTU1ZNcXVYT3M3ZldqUzExeDFMWFRrVXlZL3lWNmhw?=
 =?utf-8?B?U3FmQkFsNHRmOVRoMy90ZTRsaW9VL0JibDIzZ3p2THdkRUphSzYvNE1sUmxC?=
 =?utf-8?B?MDQ1aHcrbEduQ2lrVDgvWE92VUhqeFowZklYdWVCUXRQNnJBcmZZb2JyZzJh?=
 =?utf-8?B?blJVdHFsakUreUhKYUlwdDJiL1FyUnJiZ0NTNEFsS1Z5UENtYTVNK2tlMFA0?=
 =?utf-8?B?UWQ0WGdadkRGSFNvSVhlUXRsTmJsQVlsWDRZUU5tblN6ZFExYkRuUS9IL2FX?=
 =?utf-8?B?eUplbk5ad1RMdVVGY1RWK0k4d0Vjays2aVpUcnVTUS9HdGNKcCtTcEU0Nzhv?=
 =?utf-8?B?Wm1VTDlRVklXSm9vYVZJQkIrcDFmY3ZGRzRTREFWcFBiUHJ5SWJ3OW5ob2FK?=
 =?utf-8?B?MHZaYUNFVmVSM2t2dndQV3hVWGV5Z3RUODBMODBQcE9vRmZKZy9mKy9NMkRl?=
 =?utf-8?B?TTZSRnNXT2Z3N3VrK0diV0VRbm8rWnpGTlljaitkUU5RbE1Ieng0cGpRZzBG?=
 =?utf-8?B?V3JLaFJXTDQrWVQrWVdRWWg1VkFkZ3U1UUJqZzdBNExGaVM5MFR3S0ZOQnlH?=
 =?utf-8?B?MTQ5N3pwa2NzcTI0MUkzc0tibFN6bUZ2MkdFVURlS0ZCVEp3ZmRJaE0vSk51?=
 =?utf-8?B?T0pIbCtIaEtPTEJtTGZhUzM1S3YwSFlneHVZYXE2dXRBVThXbjZMOUV3VW14?=
 =?utf-8?B?WXF6S1VvVjBzbjBWTmFGUERUZm5VT1NGakZ3VTBaQ3Z5bkdVSzlqT0FDR0FU?=
 =?utf-8?B?M24rL2JUVHlDZHlCL2ordXlZZFZkWC9YbFNxWTRmcERLQmRWTVhxTlhZWkFi?=
 =?utf-8?B?YkpvZ1ZzcytndExKQTlVdGpFblNYMjBZLzhMTXVJa0RxSElFdU1TTFpyZmt0?=
 =?utf-8?B?Y0Zub0JTR3Y1UkpYSEduY1FsRTFUTkhYMUNLMmpyVEdhQmYwNTBoUVBLYkNQ?=
 =?utf-8?B?Vjl3a1Q2YkZGNkxhYkM2ejNkTkVleFZKTHpuUm50MFcyRUIyeFg0MGhQaUsy?=
 =?utf-8?B?S1luRTZVd1BxMGxDT3F5ZnFvSGYwZkxqcTJCdmYwNUVJeHhOd2ZvYUdBWlo0?=
 =?utf-8?B?MVhqUGloVzdSUlZyQk9MM3h0K2hIWWdXNkp5Njg0aXNaZXNlcG5pQzlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTJxVHV3SWdxOENIUFdjazZXNlR1K3ZyMmNYUDFlSFRkYk1Tdi9FMVBPN0Rl?=
 =?utf-8?B?VnpqMmpCNnBGM0NCWUlYZU53M2JFVUYyTEFYQU9SU1NSck5wd1pBMGZjb3JB?=
 =?utf-8?B?TUc4LytpYXZpZDA4ZndFOGZobHh2ZUU4SEFRRmgxRVU0K0Z0dE41aHA1OTA1?=
 =?utf-8?B?bVZvQlkvNG9Ndi9kbUpCdlRaOFVLU3pWYlM4K0ZRTzhMTFNEV05YeXhMYmd2?=
 =?utf-8?B?VXVVcmZzM2lrbDQ3TURyMm56dVdCQlN5VDdqMk9WUFVSdEpmWlJlTitPditu?=
 =?utf-8?B?Mmc0RThiWWVMMTJSRUxYR2l5QlRYYzJETmpPampWOWFnZ1gvc2VOVVNGRWlv?=
 =?utf-8?B?OEg5UUdjNHZDWGdkT2l3cUg3MW1Wb1FvYk8rSDQ4Ulh4cGJwNDd2WVFGNC83?=
 =?utf-8?B?dUttbUZFNVlwS3lOS3R0R3VscGFLaktuYmRSZ29sbWVJWGxmRzBpT0xOSlFX?=
 =?utf-8?B?L1Bvclp0N0V5ZmJ0TGozNmptRjZaKzc2Uy9hcHJhWDFXcFhIQlpDZW1nWWcw?=
 =?utf-8?B?L3lyaFVuR1p0RVpjaDVHWFgyV1A5VkxjcDh4dGxpOU41UGpEWDEzcTRMYlpM?=
 =?utf-8?B?NVlQZnpaa1M1V0o3ejIxbkNQU0RqRE91amVvWUdub1NkVE8xSkNOTFprQUZP?=
 =?utf-8?B?dU10RDdSZE96OU9UcEJ1SDVwUjNUdjhFZ2FFL3RkN0N2cEVRYUNSeVAvSDNl?=
 =?utf-8?B?clR1UFFiUXE5Yi85TU1RS0RycG9WNTArRXNNd2xHcGQwbU1xdnpwN00yTXdE?=
 =?utf-8?B?VXFjZk1BYURBOVc1QXlUSXFKeGxybm04Vjh6ditFNHlBL2dvOTYvYnZJaWdr?=
 =?utf-8?B?Vm1tUEZBbTdmL3pEMG5lSllGRllLZkk3Zng5OFlsSEQvRDdTWi9KeXc1U09H?=
 =?utf-8?B?NlFUNnFHSmU4U3hkSG4yUmhhZHF4TFpWZWVqNUJYYTJRTStwZFgwMHRxSjFm?=
 =?utf-8?B?VmNFdVlFRytJa2pPMm90eVVhQUxsdlgxUXlKUzkrc2NTZFdva3lxL01UYko3?=
 =?utf-8?B?ZTZyT1c3U25Yd0tjemtyTENpRFI2ZE0xL0NpbDhsSStXY1BEK2JzTDlJcUR1?=
 =?utf-8?B?UEdBWlZDREJPMStWT0tRa0pyU251L1lOUlRrNVJ6QlkwUWJSSnhXS2JJbkc2?=
 =?utf-8?B?U0VVNFJkakFNcmdNbVVBSUlGYVVHZlJhMkxqdjNRQ3RTRVoxUW95bTU4QXha?=
 =?utf-8?B?SGFUa215NEZ2TWU1SlhwS212MW80WDV3NUpzOW85MExWQmVUNTZ0NXVuZCtD?=
 =?utf-8?B?WXNjVzZvUzZNRkxLblN1WlE3UlovTzU0QVZhMnMxbDEwOE83UTBhZjA3Z3JV?=
 =?utf-8?B?eUgxdkFBN1BORDJjK0ZpcURaK1J2c3NQSjZqSVYzVHRIbEJUS05lNDc4bXVn?=
 =?utf-8?B?OCszVXZxb3RXQm5kdVNyVzBRWW9hWFB4M1JCeTVUMnp3UTdEVzVRTWZtSTVZ?=
 =?utf-8?B?am9QcTVTMWxsSE1tQzcvS3BCaGNLYU1nRG1aZ09qV2VBZ1FySWIvL2lyWFBC?=
 =?utf-8?B?dFZNMnlyYUp2SUd1SG5RZHpIOWFnUzVRekRNQ0UyRmtsdjIvZldQWDA0SkpR?=
 =?utf-8?B?S2IzZVJUVC9mc1d5cmFvZ00yb0doVmF0OEFjUko1ZTZjcllrRUg2Tmc2UHBM?=
 =?utf-8?B?Ry9vdnhpR29ob2RVSkpiOVhjbkplb2xXcEF0alFCMlhxNGpaRmZUeUZKYlFY?=
 =?utf-8?B?Z01Cc3FnaUtpMUtmbUFFM2lyakNTV2Z3clBIUmg3L3VtdVYxWWZUTlJ5UkpP?=
 =?utf-8?B?ZG5CQ2U5K2ROZkFGNzRuaGNwYzFBRW5rWnNBSXJJMmlOKzZaZzIyc3p2dnJN?=
 =?utf-8?B?aXF2WjFqcXhUQTR3SWNHZ3FkditEWkFYU2RNMHpjWUhqenFMdjU5ZmdicGJr?=
 =?utf-8?B?Q2QxZTRjeXo0MGdzWXQwbmR2elJHbEQrN3VwV3hsK3RldXVvalBsZVNiM1lu?=
 =?utf-8?B?aTkvT1JnbGpESGpuYUVhUW5hVmZydmxQM3FQSzBQTzI3V1R3MUx4K01nZ0dl?=
 =?utf-8?B?ZjJsbXNOYWZXOWFON2dWb0grQlFKVG9JRmVyZEFBZTRZZ1BhRitobGVUSXdH?=
 =?utf-8?B?THY0R2tsbW1XN3N0UG1RbDFwbzA3UXM0N2d4ejlMeFBtV1c5WGxEMHNoVGoy?=
 =?utf-8?Q?dMCmiLx9rz4TXiE/urwiv+hgX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc0165a-c320-41eb-06dd-08dc725a12c8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2024 08:03:57.0822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txbhYawv4Wi594L7nXSopE1cjA4tbS067V78HqBYYyRjwjCRecbfu/MltAbE8FnsJx3awm4S2L9v3onyJ233Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6470
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

Hi Daniel,

On 5/8/2024 2:11 PM, Daniel Vetter wrote:
> On Wed, May 08, 2024 at 12:27:20PM +0530, Arunpravin Paneer Selvam wrote:
>> Problem statement: During the system boot time, an application request
>> for the bulk volume of cleared range bias memory when the clear_avail
>> is zero, we dont fallback into normal allocation method as we had an
>> unnecessary clear_avail check which prevents the fallback method leads
>> to fb allocation failure following system goes into unresponsive state.
>>
>> Solution: Remove the unnecessary clear_avail check in the range bias
>> allocation function.
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Can you please also add a kunit test case to exercise this corner case and
> make sure it stays fixed?
I have sent the v2 along with a kunit test case for this corner case.

Thanks,
Arun.
>
> Thanks, Sima
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 284ebae71cc4..831929ac95eb 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -574,7 +574,7 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>>   
>>   	block = __alloc_range_bias(mm, start, end, order,
>>   				   flags, fallback);
>> -	if (IS_ERR(block) && mm->clear_avail)
>> +	if (IS_ERR(block))
>>   		return __alloc_range_bias(mm, start, end, order,
>>   					  flags, !fallback);
>>   
>> -- 
>> 2.25.1
>>

