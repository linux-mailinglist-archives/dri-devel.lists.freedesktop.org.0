Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A42402630
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 11:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B18F89E5F;
	Tue,  7 Sep 2021 09:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346E689E3F;
 Tue,  7 Sep 2021 09:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maQMgV4vojDJ539KUmbTuGHNv+lCSOWeGJSuGQknFgmJ2rdvFuTpNdtRCaTxoXdz51cIash++2oiNur+YIcpR6a/hj035qTyNoX5cvrk2JtqpjizMDADl20AD7eOyIWPHucQ3OBAMVuaYZjtNooubVT8aLt1bFIyUXrw5IU0LRYJvS4UrCH5LUK+rkd4juUmZZaLHbO6Or0BlNJcJGh3SMdNIQIhSMlJr3c9+RS1tWg1rRtOvUvT85d26QmayemSju+usvVBCu0IifrGMV10KVjw2kXfvcHr8R8Gcxl95ovSr+QctDNG1XL55Johu0M1JO4PHejWc2HBiePADnywcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fTDQoYMstZ6jpafDKVLqonMxvjAmZYbbT8ymBqXRjjM=;
 b=OxY7TKtaKekugiRl/srtEwrQiDLj9B1tPujVqr901x7/5c005usAeNrjbjRnq7nkBzUGkzRHY0j25X4hTrEcDyPAtUihP4eKprevMsjGMxYMJQKBzCFzUTZgEMMKnOMiJckfNIw8hKrebq4Dvj9wrOBR2czyZuIRo1t8kcZpUwh7l7r45z4tJgvhNx08p/o5vKk+bHPV8mkTsfufgjVzJWeaofnSZ3sMqkopRn9rrYhVWB2l0InsjDkl3D4RFHiZRQDI9uO4mXu1xbwADaK5tKO0ib2KEDhKYEdM/VDkNOLimi7Y5/PwsgMPhwYapacwN8hTwFbv7sCMGVk4vkIwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTDQoYMstZ6jpafDKVLqonMxvjAmZYbbT8ymBqXRjjM=;
 b=FGFSwkpwmVbrEqSYCMvUexihFsBbbXKmDjY3txj1HqfkFJFTtTl+SZKZN7g6JCkS1yRXN1DhrFFiYkUXtPvUH87ynXcjoHR0eeZge+R4U311rm3vVMisOBDAYfjESLbBBUuWj/3e02/W/M6KNN89K8Jj9PhR1/WYDkrvIRZOQ/g=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:162::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 09:28:28 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:28:28 +0000
Subject: Re: [resend PATCH] drm/ttm: Fix a deadlock if the target BO is not
 idle during swap
To: Daniel Vetter <daniel@ffwll.ch>
Cc: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210907040832.1107747-1-xinhui.pan@amd.com>
 <074efe24-db7a-df68-3624-05989596f44a@amd.com>
 <YTcrcw+hxWuyyl4C@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <37412f7e-9f6f-04bb-41b1-72931ea1381e@amd.com>
Date: Tue, 7 Sep 2021 11:28:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTcrcw+hxWuyyl4C@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0125.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::42) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR10CA0125.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 09:28:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a009900-e4e1-4168-dab6-08d971e1d9aa
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3933613AD35735CE8CA9E75E83D39@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4fS1nAf8DtQmpWcUygXIXrs4ZEOH0YMkFRJU2AmB5yc3QsbjO+jfcyXZkfkyy445ULLtC6qLf8eq80k5sKjH97pvuA+iWQmOB3GMedoAHSWyzDdETJGIpO5qbjkJ2aP+hLpUcVwaBXvsfiQzf0bw7AT15qL7P7MIrneIVngLDasI3w3sOzR74Ix7nkDegJ5qI7zRMrdswgkQF0LW8edaCWJfN6cKKaujI7IKRSbZwpxfaurhZM7q0R5ghghbrodOGVLTgQJBnZxtoHFBpj+Ju3deUx32/06Whbcgn3ZqDlSjube+0dyecbhgUvFxieMkngJfXFKcaM9CUaPG+2cZGbkYCUwd3/Vob6QGoX8XqdsU9E8Uy2MFEXJF+o7nlVcS4Ai8IWcvgbt6raVqylJIN9edsI9DOIpdswtCZf6ucO6lYmAL2BwusQ8TEVGtdeR6kProVKcnathcElipVbHY3LKS+9krc8861Fg+hIbRj6757HVFqTo5qzydGjfDLBYu9QlhoMaOTh3PtuXw9bxlY0alGjmlAEUbnkVLBsBWoRY7nAQVuWBrdFKfFTnfb9Y3WQCG7nejLCTZcFmJ8oFLAp8k8Vbih3nU10df8n1DRAjulrgaxIuCdGuWUDGfj+0eFPsvDNXP06rTczJijvMevStWLXv/C3Nr63lvkLtl5TmIrm/21Ryh4/mdoCPslbzlvttwnCOmSPMGaiCSAUGsjf6PUIzyc+Ozxgcq7SWq96I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(4326008)(31686004)(38100700002)(6916009)(2616005)(6666004)(956004)(5660300002)(66476007)(66556008)(8676002)(186003)(26005)(8936002)(66946007)(2906002)(31696002)(6486002)(316002)(16576012)(83380400001)(86362001)(36756003)(66574015)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVFNcVU3bHkvTmg5M01XNTNXVGNoTk45d1NVZHRMTmFYZUY3bkRCTWpMNFVD?=
 =?utf-8?B?NFdYN0ZQUlk0dXYvWFAza3dmWUI0WEM5emNJSW81aE9sQ0F5Y2RxMklvcUhi?=
 =?utf-8?B?YzVhbFlqYUdvbFVJb0JqT3gvc0JYeWFIcHJlV1NJektOcGp6TTJ3MDJJSlI0?=
 =?utf-8?B?LzJ4VytaZXo4byszeS84bFdwdHF2OU1Zc1RRM0hBL1ZwRlNVOWJ5eW8ySWhy?=
 =?utf-8?B?WEVEeHkyZzVwcGFYR0lMZDBvWmZUSnBXRW5SNU9yNEZUNEVtaHNQL21TM3F6?=
 =?utf-8?B?bTc0UDlLMUxsVFhxbFltQTl4YjhVemNnL3ZMZTlKdGh4WGt2eFd0c2FuaGZm?=
 =?utf-8?B?K1hJbTBJWTVoRE4ybGNxbmNSUURJUDlGTGdad0FHL0RFUTJEOGl5bDUyMmdj?=
 =?utf-8?B?dHNNSkZpZTJjRko3dXB3QjN2OGhSU2VTNlZCQVU5MXlsOHBleEcrOGxUSnhz?=
 =?utf-8?B?QUJrdml2bEdoZ3VxYkM3OW9SMmoyRW1XRDVzU20xMmtNbzlEQlYvR2xpV3pi?=
 =?utf-8?B?UGF2ajh5SUE2VmIwZFYrVEJhWW56bnE2bmlEU3BuQjhOSU5uMUFlT25PWm5X?=
 =?utf-8?B?TWttV1ZEblBWbndHSVUvSU8zS1M4NXdBV1o2MEtlTmloUGdqU3V0L0JqQVRB?=
 =?utf-8?B?bC8rRHkzZ2lObitrT09VZDZiTGlXbHdxbVR3bUtHT2NlcXpCUVFCd0t0VUNH?=
 =?utf-8?B?ZllXK0pkUkdXaGhVZDB4bm9NUUdRZGpUSmFMdS92SldOb1o0aUsxSSt1N09p?=
 =?utf-8?B?NTNTZ25aOTVrVnlzS2dXbCtmc2w3UENOSXFxOFFRcW9nTU04UFVTcXhRMlNk?=
 =?utf-8?B?Wm5jK00zOFZ3S2FSdnIyYzhnbkVZNXA2aW4rcmpkeEhkTzFnZEVoRDIxeHZk?=
 =?utf-8?B?R2FwaWJuejNERi94WThxWGVueW4xOEdiV2xIMkVtQm1TYXNFT1JNaVFnaXRp?=
 =?utf-8?B?VTJCa1VxOFhuYmJkQzBudDkvYUNrSUdpeFpzcFd1TEcwRkRPdklQcWNkV0tu?=
 =?utf-8?B?RzdqNkpHemgwZEJDWmhZdFJQcnlBNWY3VXh2ZVJWNUh4Uk9VVXZ2V3VtZnEv?=
 =?utf-8?B?aHpQQkltWGlGdWtTTW5wSVp0QTNrZC82NnU1NHFZV296NnozK05wNUUvYzUw?=
 =?utf-8?B?b1NEckVZZnlibDNzQzdvUWtIb0VsRjA4bzJxL013RWJhblFQS3FmZUU0c21r?=
 =?utf-8?B?NmNUQmNuME5LQ2Z5NlZBeFN3bDZuZm01akc0NytzSGUwMGxxUmZ3NCtGajJH?=
 =?utf-8?B?OTZnQS9LajNpcnpMMXJCYkdMK3lOTGRSeDRRQWxhQXRDbWJWUXFIQXl5Ri9l?=
 =?utf-8?B?aUFUcm1LdzVGc2QzanVOb0tOcmhTYXBNa3oydzhvOVhQK1BTU3Q3bEY5TkNm?=
 =?utf-8?B?UjBKMWxVRFRGV2pQUGN0TnBmUUxJUDA3MDJRZk9XVHY4SmI3amkwVk5xVWV3?=
 =?utf-8?B?SjcxK0M3bElHNVR4UnJKZXRRWk92b2pTeHE2TkZHSFRxZ2ZlQmlLVDcwOEEz?=
 =?utf-8?B?YjM1NDFKWURKTEhtcXcrcmVxMmNPMlRaTlVCR0dSVnZCNVpyeitKZVJieUNz?=
 =?utf-8?B?ZWFQc252U01FNUxGOFZhcW54UjNUcGprNGsrWTlQakhPMWtISE9DQWQ0cTlN?=
 =?utf-8?B?ZEkxYUt5M2ZZWXdEVHFvS3VWZ2ZUVGdzOEoyb3ZjMjYyR1ZTQWxIT2JWajl0?=
 =?utf-8?B?OFBnWTFkL2w5TDNrSWVlQ2VuZWxDM2s4ajBnM1g1cE5Yb09yY093YkpQQnIx?=
 =?utf-8?Q?h9Zlc5AXEgKskthqPwWXqxQDMM+mwmWl1ZIk85K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a009900-e4e1-4168-dab6-08d971e1d9aa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:28:28.5227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHs90U+5tnzNNxpr0uG2Syzt6QwSbOiTltLXhDovzr56e4Jc6+EuR+2P8//VDGV0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
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

Am 07.09.21 um 11:05 schrieb Daniel Vetter:
> On Tue, Sep 07, 2021 at 08:22:20AM +0200, Christian König wrote:
>> Added a Fixes tag and pushed this to drm-misc-fixes.
> We're in the merge window, this should have been drm-misc-next-fixes. I'll
> poke misc maintainers so it's not lost.

Hui? It's a fix for a problem in stable and not in drm-misc-next.

Christian.

> -Daniel
>
>> It will take a while until it cycles back into the development branches, so
>> feel free to push some version to amd-staging-drm-next as well. Just ping
>> Alex when you do this.
>>
>> Thanks,
>> Christian.
>>
>> Am 07.09.21 um 06:08 schrieb xinhui pan:
>>> The ret value might be -EBUSY, caller will think lru lock is still
>>> locked but actually NOT. So return -ENOSPC instead. Otherwise we hit
>>> list corruption.
>>>
>>> ttm_bo_cleanup_refs might fail too if BO is not idle. If we return 0,
>>> caller(ttm_tt_populate -> ttm_global_swapout ->ttm_device_swapout) will
>>> be stuck as we actually did not free any BO memory. This usually happens
>>> when the fence is not signaled for a long time.
>>>
>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo.c | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 8d7fd65ccced..23f906941ac9 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -1152,9 +1152,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>>>    	}
>>>    	if (bo->deleted) {
>>> -		ttm_bo_cleanup_refs(bo, false, false, locked);
>>> +		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
>>>    		ttm_bo_put(bo);
>>> -		return 0;
>>> +		return ret == -EBUSY ? -ENOSPC : ret;
>>>    	}
>>>    	ttm_bo_del_from_lru(bo);
>>> @@ -1208,7 +1208,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>>>    	if (locked)
>>>    		dma_resv_unlock(bo->base.resv);
>>>    	ttm_bo_put(bo);
>>> -	return ret;
>>> +	return ret == -EBUSY ? -ENOSPC : ret;
>>>    }
>>>    void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)

