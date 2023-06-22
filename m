Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B881973A393
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 16:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CE310E579;
	Thu, 22 Jun 2023 14:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517E310E574;
 Thu, 22 Jun 2023 14:49:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nc9x2+ax4qYdqsNmCfW7L5c3MlHmwJ161fIwfpQOdCKm2HiATkOWlEMQKK+998zdgtWBbjbgStP8F4k4JTzkMxs0rpnuAccJmhk90TTk89lw3p8TByyZCrWpluyjBC65QAGt85V5BT3qbjOMstooS3FhgaQC3q1pKvGDUDM6l9/8KJSydMediWx6qvqm2fjbhrVbEGyvkas4S+zcF4qCPdCczRn6Lp7iMO9XqfmFqEE6YWQiNc7QidnbtW2+G2ZciSJ9r1b1hhzFoZHe/5NdiK4Bym33wPv98+vWl8tTjrfEYpYgj4FVUgoKM53EF9/BokdzMkZBageFPfHVfS+X6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+M52ZCzCi82PiZaDtskr8pH1tAOerOvXTWM9PWR2rY=;
 b=HZXlNUnpsUrjnDNPi42UT06Ty9gIkDlT+HM/+LKeBFIO/AwAZsKYght0rumFnwHv112Mur6gIi5t4ejd61XdkfvGtEAuH3q0whVYTP4iK6dxw+2V7VG9wpQO0rAd8wH9jMCZJQT25rU2Ir0Nk1slyJG912w8Wa4TARO0oI/hPz+r4GDcWedhL2t+c8jQx+5KElyI5VQY4ZDJDYIhcWgpakyAzf3BlP+90QDRHfi06JuLgLYJptennAX6JbOw81sMTef9YgZgGbBtaDZDFSYD6otQNLYc/EoY6mK78ZcC0IoMb37xVVdrH2Z1OZVX4fuVO1RfjRrTJnf3VsrCZL9I/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+M52ZCzCi82PiZaDtskr8pH1tAOerOvXTWM9PWR2rY=;
 b=YH0RRK1zP3nm4fkGdZRK+rBmA/SAXljB1yBF8ZEH/XgshTRAOYKkGSANqKSf8BMfoqnC06P69rq8jcfpAXDfj+foIway6mSNiosOc6pAMzQoiK4wr916j3HnBWkmgGD3g8YHDWypmLZ/Fq7HJfIel/I5TN443iYYilcDTBZs81w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6223.namprd12.prod.outlook.com (2603:10b6:208:3c1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 14:49:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 14:49:00 +0000
Message-ID: <196a7f74-66ac-1eae-4795-a42691f4793e@amd.com>
Date: Thu, 22 Jun 2023 16:48:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/ttm: Don't leak a resource on
 eviction error
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
 <20230622101412.78426-4-thomas.hellstrom@linux.intel.com>
 <ZJRSyp7fT6VXpow7@ashyti-mobl2.lan>
 <3a089ebb-7389-3d3e-beb0-13a8d64eb04d@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <3a089ebb-7389-3d3e-beb0-13a8d64eb04d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: b60f48cd-3f4e-4b60-d1fa-08db732fd0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0kxN/W84Jb6pd4Q7ZMJ763qvuliqPkVmV280nwSL3/dN8OgZyIqDcWu4bI+AC7wPsyuGn5vbvDq8jZOVQYYYL5os2zn4mHnnHKTsSJs6V/7zi6mQRWVvuCT/pbyJ9LiXdvqDzASfAX8XE9iqTgtRBJP+GTELZ02BP9+m+pxm0q9o0Pmzr9ZlWqQjQXW4a9pJ/8o75FYOIJBrSTjpxJOz2venYiA7rQbzFvoTI6p8Zkb/6MGGp9mARLAPATw2R4XMfWy9PI7XFnbxj2p1nExM8VqNpO0rPm9/x9BFeznW4BWNwLC/O7wacu/1nqLB/M6GE6T83hUY58BqH6mtDWCCgF6ODwo4hc1IFERNkm1On7w0IiQlQEqq60vd6fHy8+LIeHjVstLYSHf7JNj8uz6ifKzxSz+QnrvJIU2N7X/e8TWC8eAoqwdHA08cKlRHhhd3w4h3dK1sw+CJ5H2fi3qcnuaQKpCbCVquXu0ZHAz5RKgtueU+s82EIWBi9CL+Nc014P43Y3UXPEq0uwplY1trut3s0CSzIu4kDF+CL56kVHlRUY03PWAG0mCXJSbrHrlCzHhSBmjf6hd5wwpa0U6jwGr8hnCoRLY474I/DkZU3ND1VBobzLQetQsChR6+48pOcDw0HLIK9JX61prkgWKmGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(66946007)(66556008)(4326008)(316002)(66476007)(8676002)(8936002)(6506007)(6512007)(41300700001)(186003)(53546011)(2616005)(54906003)(110136005)(6666004)(6486002)(2906002)(5660300002)(478600001)(38100700002)(31696002)(31686004)(83380400001)(36756003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzFNSEwyY3FSSkcwOTdUY0t3R1FDZTVEQTJKTVVlaVp1NGFza29vOU9Ja0NZ?=
 =?utf-8?B?R0VZb3FvaGJ2MGk4WC9EWVpNWE5uZVhXUTBmT2lWdy9Fc3BpRTFlLzU5YUpv?=
 =?utf-8?B?bzdlTldXdmIraE8vWGJUQkhLSXd1SGY3R2lEU01qWDh6QlZHV1hpbytESUh5?=
 =?utf-8?B?bWdsdVRBM2dmbUhMbEVvajl5MCtFWlk4MGlzSmVrK3FEaG5vb2NGTjA5cFp5?=
 =?utf-8?B?VDNWZHNDL2tIMHZxRk5sQ0FiQkVFTTRrTjhZaGU4K2JOSEdzakkvcWZTWEJx?=
 =?utf-8?B?cVlacWhvQjNkdG1xQ1ZsUnNodUdtMlprVzhKN2pMSi9MKzdGd2I4aXBSency?=
 =?utf-8?B?a1oyM0JqTXdNVmZ5Yk40dTlJei9BekZZS3lKeEJYb2pFbXZTUGlicXByNkdv?=
 =?utf-8?B?cDRneW5jUXBiV0hhY1hobUlMVDA2Y1VXNWVGcGZOMytSMHIzRzdtU21MNDFj?=
 =?utf-8?B?cHBZYzAvV1pZbXF6ckZqMk1lUFJDclNGa01jZ2ZNMXdVK0VGS0xMRVY0SzZ0?=
 =?utf-8?B?UVhUYUV5bXNPZEV2SlBwNitmNVErYzNWWVFvbzFvYlB6Qy9URmhWeGFuejBi?=
 =?utf-8?B?REdIYXBlbWZ4c3FSODlUZmRsa0hVOFBUemJFM2VtT2lBMzV5c2QvMGwwVGg5?=
 =?utf-8?B?Ym5kOTRqN2FnVUQ5ajZOUG14L2lvVjJZNEdIM01NMGd4a3JyR2xOTEMzZURl?=
 =?utf-8?B?SERsK1JuYU8vZkVpQldvV3o0QktkT3k5R3hlN1V1WHpkVnNNRHF3WVljZXBK?=
 =?utf-8?B?SVlNamYzSkRHOWpuMWVQUlZRTEVCZWIxOEdZbjdYRXI0VHJmbVJIMU8rRWlI?=
 =?utf-8?B?NVUvaUwrNk1ZSWluNnpLUElGSjN4Uyt5VVhMNkZ2T0hJNG9LQ0Fja2ZOWnQr?=
 =?utf-8?B?VC93WjZFYnBLOUFRODVzaWIySjNFRVlYZE93RUR5dkVxZE04VVBITDFKV0FR?=
 =?utf-8?B?aTZobjNXekNMSUVIbzFkZ3FuQ0RDV1NqS3dpS2p6YWtaczJuWW9pN3FXWnNR?=
 =?utf-8?B?blNLMGpHWlJ0bVAyYUhiZWcrQXRPR3hqM01RSkxqbkR2NFUzSGlUbFgweXBv?=
 =?utf-8?B?K3pBRWp0djk4VWhKS3FhK1lYd0pZa3RKc3RjdWNaOHNuVERlT1RmTU9NNmZo?=
 =?utf-8?B?a2dLTXBodG9VSmUvRWVmamllNmNTbGE2MjJERllLcjJmR1VtZEQybm1zMkZh?=
 =?utf-8?B?K1pUdS9sUFErZmdRdk5KRjBpSURPNkNXelY4WlZqN1NnTVlYUUxGaDVQdTU1?=
 =?utf-8?B?VzdFcmFPTjYvZzRGd0N6cDNVZkIrUWErNjFTTFM4dDZycFg5bk15b2VGVHRl?=
 =?utf-8?B?V1J2OG9HZmxOV2hmT1N6a0x6bzB1SG9pMW5RakQ4a0JkWSsya1ZHaW04OGVk?=
 =?utf-8?B?enNRWVRyVHE3ZTFJd2FpcUR5UU5ISUJFN05rYXJGL281eFZBNGh4aktTZVpL?=
 =?utf-8?B?YlYvcURUeFpFTkt5UDlBM3lXWUlxQyt0Zksva1hqSk56b3lqcUZkdHU4dDk1?=
 =?utf-8?B?WWlmeU5ZdHNoWFJUZFhyQVdheWI1a2hyTWM2K2xxakxvTXdoMTgzblhrUjNZ?=
 =?utf-8?B?NU9WZDVFUWYrTHp5c0hSS1JQZnV5MktIK3ZHbGNOU3EvU3NzcitGektsQkJt?=
 =?utf-8?B?c1hlZG9PZFB3enpuV1dTWFk1Q0VsSmpXWlZaWjV0UjdoKzZ2NnAyTFM4U3FL?=
 =?utf-8?B?Q1NyamQzYTR0N3czbkpxSU40eGI3elJCMUJKczF3dmhNeXhYWkZFOEUwZ2Ur?=
 =?utf-8?B?a21rcnE1cER1UkF1VnJKNjB3M2VISHFSZHo3Q0RJUFplcWFoL3E3dVBXcFpj?=
 =?utf-8?B?Q0FpUEZKVWh0WWtBbitXMmM2YUU3Mm8vZHhnRmg2bWU3MXg0dmhNMzNlYmow?=
 =?utf-8?B?T2d3QXdub0QwRU8zZWxWUk9aN3F3VnkyQjBhRW9tbVQybkpuYkJ1bVFxZ3p4?=
 =?utf-8?B?SEROK3dVWUY3eG53ZS9xeTNscnN4NHJabHRKUytTWE91aEtNVHNrOURmcDA4?=
 =?utf-8?B?MnlNNmg5WVdobGJqMExHeTFOWDNuOEpIUUEvQmlLV1d0ckVITCtzM1E1NEw0?=
 =?utf-8?B?UzF3K0NZU0hZTmF2bEpsSjVnVmxidUdBbHFFalRUTThDOXBkdUNFNzk3M2JQ?=
 =?utf-8?B?OU52WG9ESFBiMnFuZUhCRnh4a3ZHOVUwRG1odkF2QjRWL2RZeHJTZ2x1cHo0?=
 =?utf-8?Q?BW/59/wPKq4GKP7I81DtLHwPEl+GlTb4y36LhcMo66Bd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60f48cd-3f4e-4b60-d1fa-08db732fd0c3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 14:49:00.8706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaY//ReOh4DfqX0D5/WHziYrA0d/mi/0KicyYQwubV6zXErX78Ctn4vrBhGpd0X4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6223
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 22.06.23 um 16:08 schrieb Thomas Hellström:
>
> On 6/22/23 15:55, Andi Shyti wrote:
>> Hi Thomas,
>>
>> On Thu, Jun 22, 2023 at 12:14:11PM +0200, Thomas Hellström wrote:
>>> On eviction errors other than -EMULTIHOP we were leaking a resource.
>>> Fix.
>>>
>>> Fixes: 403797925768 ("drm/ttm: Fix multihop assert on eviction.")
>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Huang Rui <ray.huang@amd.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: <stable@vger.kernel.org> # v5.15+
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++++++--------
>>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 615d30c4262d..89530f2a027f 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -462,14 +462,14 @@ static int ttm_bo_evict(struct 
>>> ttm_buffer_object *bo,
>>>       ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
>>>       if (ret == -EMULTIHOP) {
>>>           ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
>>> -        if (ret) {
>>> -            if (ret != -ERESTARTSYS && ret != -EINTR)
>>> -                pr_err("Buffer eviction failed\n");
>>> -            ttm_resource_free(bo, &evict_mem);
>>> -            goto out;
>>> -        }
>>> -        /* try and move to final place now. */
>>> -        goto bounce;
>>> +        if (!ret)
>>> +            /* try and move to final place now. */
>>> +            goto bounce;
>> As we are at this, can't we replace this with a while()? Goto's
>> used instead of a while loop are a fist in the eye...
>
> I'm completely OK with that. this patch already did away with one of 
> them. Let's hear Christian's opinion first, though.

I'm not a fan of that goto either, but could we somehow avoid the 
while(1) ? E.g. something like do { } while (!ret) after handling the 
multihop?

Christian.

>
> Thanks,
>
> Thomas
>
>
>
>
>
>>
>> It looks even better:
>>
>>     while (1) {
>>         ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
>>         if (!ret)
>>             break;
>>
>>         if (ret == -EMULTIHOP)
>>             ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem,
>>                             ctx, &hop);
>>
>>         /* try again */
>>         if (!ret)
>>             continue;
>>
>>         ttm_resource_free(bo, &evict_mem);
>>         if (ret != -ERESTARTSYS && ret != -EINTR)
>>             pr_err("Buffer eviction failed\n");
>>
>>         break;
>>     }
>>
>> Andi
>>
>>> +    }
>>> +    if (ret) {
>>> +        ttm_resource_free(bo, &evict_mem);
>>> +        if (ret != -ERESTARTSYS && ret != -EINTR)
>>> +            pr_err("Buffer eviction failed\n");
>>>       }
>>>   out:
>>>       return ret;
>>> -- 
>>> 2.40.1

