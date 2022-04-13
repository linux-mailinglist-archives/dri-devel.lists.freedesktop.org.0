Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E694FF2EC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4181310FE86;
	Wed, 13 Apr 2022 09:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21AC10FE86;
 Wed, 13 Apr 2022 09:07:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuR9RQnqc+6vJf1hs5b7ZBQmyh0CdPl02oM/rdTQLjQQcAv7lh9Letbz3KIIIBnBpmfZQsW+579rtKkYtTlKXAjSG7F5w2jei3TPVz3VYd6bkY4588mRoG/Dpy/V50dVs8RgdRTVAN4ZIMa6mQdeaU3LM6Lqkdf/XKcxbwV0+SeM2Ry6ca0KaT5243GrBhlhFMm+ft7y8DfMaT0jFb0qMWuqDE/kNVP+WDZgBDW9z9+Vmoebg9GHa2Od1TzR7LMgAoCrWjpfR83n1AmT0z+dFjDyvtxjz0VRyfH1Z60zOfS0m8biEumHUQBLHu8RLy1EXXUkHWXx8T55rCUzUX0Ypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMbsUhvg6YHf8qyOJwdjMOF6kPTUBtXs5ZilqeKFFTo=;
 b=YgiATaPTurksXmoo9oBxPNE8SeLO/p1FPr070Q1XzIrTjmqdOd2ZNtyOkiy9AVhO/cuyzlVchzwPS745dOk8VkWYXCRLbr5IgbetDq9CuQIu22gIvuKC/rXJTtjFzXt0lPX/6B5kFnGFZYlQV0aaFQHXSK0POYM2rDMmi25SVZfV5fV+d0F63De5xBj4Wi4HUu3K+szJchxcgp0wGlOBjC/me6GqFhVCAtNdL8/ADrDq4ehuX7yt7PB+CWsgFjsNODCrf7+uiLPFsx33hFVjABDLGs9m7MSIadZdfELDmKpS0GKKf/BzDo1c4GQSBydhjlOavjEWlWvrrLcttrLxLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMbsUhvg6YHf8qyOJwdjMOF6kPTUBtXs5ZilqeKFFTo=;
 b=1Hp7z2ymWy4SNeSynV9pezRfTMrpVDDpg7rMSCkbCGHxCcJsY60l3yuBWm/z6swb+Fko4ZjrtHD+XSswfdqy70Z59k0PC1G9JMdRPG0Ie5JTCzWIRcbQcYMSO8xdvZrev+4fBjUkOeAzS5n5eqDf861mOZEsN8UaQnc1UDdCqPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 09:07:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 09:07:09 +0000
Message-ID: <ca6c710e-8087-4b19-77d8-475179a63d0d@amd.com>
Date: Wed, 13 Apr 2022 11:07:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: fixup ttm_bo_add_move_fence
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>
References: <20220413082133.272445-1-matthew.auld@intel.com>
 <YlaNf7I7IaX6a7Mp@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YlaNf7I7IaX6a7Mp@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0047.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd0e8047-6313-45f8-4d41-08da1d2cfd48
X-MS-TrafficTypeDiagnostic: MN2PR12MB4096:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB409691413C4B703B3C58B04683EC9@MN2PR12MB4096.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N6dNY90gznZajDMQYZm7KWCZZIvA8HpygcyBwBHnHxKTCcyxF1jl6v5FuWthhfZAiDcoYbzod3zfrFA1jS4bPLkfj5u7MAi8WXrWZnSJ36qc75vb1BTebsx+ETZohHMlxacH5lQmHj60T4p4VulpciqDxNc2DU4aF+5///+kvzLKDam/ougQDG721FIRSRNXka3Du/oWj1yDMTcK/UlP0YqgiiDyscM9F6wjjy2Jr3uQTmstsQES75q1E8WZIVEGRpNKMx5inntXyOLQ4og+DA1MwQTeTNwfAvBA+X0lpQgUI6c49cLpvQ+TCrlgpLgrIaKSa0JiMQ19rw0hrdMn447fFuVm9feKwY62e23FRsGJFxJEDYdhKCQI6Gip6azlLfff6EsVro23MV9maMhJm6c5LjDYtS2oF3BgFvbJ/JKI8qgIj6QiLKJithRfiNz9mmaMq5PKaGWnRkt7mhxpmAYMYguS9NUOfuxVP4s7rlCwG+IJm8wSsa64/ReWvTg+a8bU1IhZm/MueH/eaeOhwTYKv1ie2M1abkva8qCKzrEy2mgdQVlmwwmcA0CEvN9/4jmyty6aBzyRpsXAJ3jopKFWLy+WGy+myVH7VflcGNuFPcrS2VFqNVYCIrRk51AEsJBN75XkFrPBi812ZrQwekeWOXiS879wnaVEjmEb11dZSr8PxZyF5XYhQZdO+EgN2eSYATuy+55D5KMWBSOFvCpYcnaYyGBCZrLdvm971mf06S1JfHaKp7UQsIsEFU6k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(66574015)(38100700002)(66476007)(186003)(26005)(508600001)(6506007)(316002)(6666004)(6512007)(2616005)(45080400002)(83380400001)(2906002)(8676002)(86362001)(4326008)(66556008)(66946007)(31686004)(36756003)(31696002)(6486002)(966005)(5660300002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFdxVkIxaWltMGVXZzZWWld2NlpaM3pram9HRkY2SGJCZ2JTQkc0Q3hHL1Nh?=
 =?utf-8?B?cWRQdmJweHRVNEZGWEJEeWFaL0VlMzRhckgyS3lQejJIbnpZZXo3WHpxb0FV?=
 =?utf-8?B?WTZWOEU3T2xRaCtnNmY4L083NDYvKytKNnNua240WWtvRUNOZmdnV2R0a3cx?=
 =?utf-8?B?RTUySkd6MHdTbDVZZXU2NUtkWU42NSt0S05ZZm5kQnZDck0yS0dGOU1pbUZn?=
 =?utf-8?B?Y2RPVytaOWQyYTlrZHVmVitpMXVTa2cweFJFWUI0bGZGVW5aaUFaRnlxc1FQ?=
 =?utf-8?B?ZDJuckJvblhYRHpScEh6M2RUZUFDS2NuZzBFM3BLUWplcm5MSDZkSXBXdlgx?=
 =?utf-8?B?Z0czK3lDcHZzRWplMGk0dTU5TUN4dU9hM1R5cldTS3dpSEVOYmloeEVFeUx4?=
 =?utf-8?B?enBybWxHUjFnM0NrSVVzaTg0YUl1bGRvbHVHbXZyOUxhMHBaMzh0ejBQMnhi?=
 =?utf-8?B?LzVpV3BRdS85eWdEQzVGV0VYTXNyMFlnbGJJOXFrZnI5U3FMekJhWlFFK1BE?=
 =?utf-8?B?czhsbXQrUUhXR0tQVFNuMFlndXd1bWlCeldjRjk1YXc1TTF1Z3RoUHFGQ3Rr?=
 =?utf-8?B?UmUyckNjenF0a0JMZVpnbitPTW9QL2pIS2szblhaamNuVy8yQ0JOeDlIalht?=
 =?utf-8?B?dWFKUEtXQ3RyT2Vpb1ZrZFZ2WlA5MkxMODd1Ty8xZzJ0djBnWHgyN3hEUmE0?=
 =?utf-8?B?ckdSMlNJSzlxbTdYMklCWEpNcmFrbDNiZFRYeUVGaXozWHF3M2pLMWxPQ0tD?=
 =?utf-8?B?RllHN3N6SXZUYk12SFFYR1JaVlpkYnl4VG9pZkR5MmtmQVRKUnFQaEU5d0ZB?=
 =?utf-8?B?Tm5iZkIwK1NwcERoekRhYit2TUp3QzJvbXRrUGh3R1RxV2Y4WDVWUWU3bFFG?=
 =?utf-8?B?dkZrNGxVNkczcENucTBOVHVpZ09lUlM0SjhHYmpRS0xiUitPZkR0dFlDNkMy?=
 =?utf-8?B?RmpRRjhOZXdLcVVxMG5yVXhjN2VVT21VdzZzQnBiWXJINDBMMFp1cEpRUUJK?=
 =?utf-8?B?bTZVcU1hTVlDUm5DdnZtZjFvT1JkMVRXdk9Qc2hUWGdzY3J1eXc4MmQzVzdC?=
 =?utf-8?B?K2t4SGJDdHlxM3M0WWdHeXBkRzk1czhPamhsT284Z3ZmUmVkSWxoVmdyblFG?=
 =?utf-8?B?dVorMVBOUFhHMmlnaHgxOFVzU2gxMXdWOEd2SE1GWXZqTERtRFhEcmpGd1hj?=
 =?utf-8?B?MFZkdjR2VlZoQmZTdFRYY09aa0J0TVJNZ05lV3dwam1Ib253eVc2R2hoeFdD?=
 =?utf-8?B?cHNXb29GMUF4MXpuWUxXZGVleHliM3NMLzVkSXAxSFVHckIyTUQ3TjAzbWNm?=
 =?utf-8?B?R1BWNWZaTm15NGkzNzJNTnZySEhwa2t1U2U5MzFiTTY1SnpVakI1YmM2Vkds?=
 =?utf-8?B?enVnTitNaytDOWRBWCtnTDVLWjNBb01GbnhKZXVMa3dLMTdtN2tXWm5CR09R?=
 =?utf-8?B?dEZtcVhYdERNd1RFY1hUeFhKcFBSUWRpK1pVaWl5THEzT25EVlFmU0Q0YW4x?=
 =?utf-8?B?aEdkYTRYVjdoSXgvVU5sT3pha1pZT0s2c3NKSi85TXFEYjFRS0tNbEdVU0s0?=
 =?utf-8?B?cmhFZ3h1dG1oRFBKMEJlWGZUOVNYUlpTc1FjMnZJSU92bzh6a2twSFJGMUVi?=
 =?utf-8?B?RnA1cnEyb0o2eXB4T2xSUFBqazVUa2c1WGdYKzJ4RmpTc1gvUkNWU0hjUHAr?=
 =?utf-8?B?QURJV0VFY0pNcmJGVGZ6R0NGaUl6Znd0L1V0OEhZR2Z5UGxoL0dyL1RDTDgz?=
 =?utf-8?B?dk9Tby9vaWo3WHBTNklHRklSUlZzOEt0S2FPNkxFL3VkYnVZSUllOE1yS2Ny?=
 =?utf-8?B?WXBZSWNOS2I5L015QlNkVU9YcVdUOEovaTVhcStNMVNoN2RCWTAwVWR2Y3la?=
 =?utf-8?B?VXhKN0txWC9GbkZRWllnWmsrRU1KMnNSOUJWVDg2MlVPcW1JT1ptNUhGWjFE?=
 =?utf-8?B?ekdXcFluc0w1WGtXNmliWHBMQUtzSHQxQnhLNjlZaG4rTUxLQ1Q5U0I0d1Fa?=
 =?utf-8?B?T29raFMzdFg4bnRNVG1RVzlHSUUwdFZOeG5ETXdMMVJYNk9sV2YycTNaVDlq?=
 =?utf-8?B?b2pBZHhlcDRhZmxWMms2a1R5ZG5Mb2x6VFpodDVFVzNBU3hEZWRhaElpU3Ix?=
 =?utf-8?B?ZCtzSnI1VlQrQU1MSlV2VkltNWlhSUlaTU92ODkwLzFKMFFraXFIVmhNd1Zr?=
 =?utf-8?B?dWxhUk1pblFCRUhVV0FxeVM4SmpJM2pNQ1pka3VWVzNydTJsSmNLYkhxWk5z?=
 =?utf-8?B?Z2Z3TWFNRkhWYzNmMGtuNWlldEF1WmgvbWVlVHBHcUlEVVRxMzR0VjdtRTQz?=
 =?utf-8?B?NldjRm8zcng4ZUltTkt4Ujdla2JMcC9OWHh5ODlXQW5nS0VzZHJVUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0e8047-6313-45f8-4d41-08da1d2cfd48
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 09:07:09.3674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h88YAM6Y38A3n1CJ87xDvtfxf3hkyKZqQ91MLBAG4lDJ6SqbbIHDcJ1yHTuABa3d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 13.04.22 um 10:44 schrieb Daniel Vetter:
> On Wed, Apr 13, 2022 at 09:21:33AM +0100, Matthew Auld wrote:
>> It looks like we still need to call dma_fence_put() on the man->move,
>> otherwise we just end up leaking it, leading to fireworks later.
>>
>> Closes: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Fintel%2F-%2Fissues%2F5689&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C989e8d698f6d4f0b37c508da1d29dfb4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637854363041323745%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=8lxdsjPRiu%2Ft8O4kEHQEKtrMFd7gJbbFz25mYMRk3Ig%3D&amp;reserved=0
>> Fixes: 8bb31587820a ("drm/ttm: remove bo->moving")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 015a94f766de..b15b77e10383 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -744,6 +744,8 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>>   		dma_fence_put(fence);
>>   		return ret;
>>   	}
>> +
>> +	dma_fence_put(fence);
> Please delete the above if () and simplify the function tail to
>
> 	dma_fence_put(fence);
> 	return ret;
>
> With that Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> And thanks a lot for catching this, I guess I get a prize for most useless
> review ever :-/ Hopefully this one here is better.

Well so far we one inversion of min/max, one missing put and the 
incorrect handling of the return code in i915.

Considering how complex the patches have been I think we are still 
pretty good.

Christian.

> -Daniel
>
>
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.34.1
>>

