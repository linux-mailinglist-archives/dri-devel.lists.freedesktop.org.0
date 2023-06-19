Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A857350DF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 11:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D749B10E1CC;
	Mon, 19 Jun 2023 09:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A7510E1CB;
 Mon, 19 Jun 2023 09:49:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTV62qz+6pJU1g3s755AJN05rGZcGESl87VLqlvlJqGeG/4KRn5YJ9/1EqDtLSRdD0LbW/Mjkb8oPwJFyH0v0jtiLBjn4n7oqyLtybY4ot/aMBFvLFOIuzIyvAl52crP5dWI96EsyRRbWuu5HjEmmdiZaJykGVZFc4ttZW7Z4n7OLDjyPQNTYwCdxwu81Ue9LErMLvAROhEsUb8jMiRtJqyQbF5Hm2tGdreY6JxG8OSXt86gW+ieoe3kAi4Vv4Awbz97pR9xgb8lFrsDuLZT+EKrmKOSU67Hbzg61NN9qlOiIaQTx+yb3nDmSdR/SccbLQflPp3TMkBAcJYn1P3q5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iktlPZi110exciOQkpNmFgw5g2TvEoV0LkLG4ypPTBo=;
 b=RwOCBqDo+qhVNn6ChSzUTfK8GnR3MYsRTx0IeIDVZijtCcG1HZxwAA+w9Nuu/xQg8yzS7IEOD4mHyPp6Dyh0Cm+qB4V2oRfQWDoYoz4G2ZaEKrmuqySsR//jD6pIkBUhEQR9lyF+t8vMsFCE4JJIk3Q/s1kYekUX0LLLmDaIMU+7uziipoLXNga6fnjEcB0haG08yrLWIbYR0Cfm/kFux9uOOGA6cWDUaDOIYnDtNWY+ZTQvIv+5ruM1BMvOJYYE7KLNtd5Z7gKGB8FihtNMVySKjmdNwbewBnkZYqA8uru+A7j7cOgKcA5frqoJvehy0Ccz06N+Lk953II9yT0SLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iktlPZi110exciOQkpNmFgw5g2TvEoV0LkLG4ypPTBo=;
 b=D5YQp4KRIp+XXvZh4r+A3lNbo6sXe03oIX6R5CpAaSX3A5uPPgSr6z1gUIfCDPYnv+WYvKpDHS8IrPUHnmKz6fAFAxXfXuOGjPZ61W6cMNa10ecverqvp6tVk7pzjJfHKtm/1dicyUMoc4194TQ0uD6Z4Cm9Vu984O/Ik/Rl710=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by PH0PR12MB5468.namprd12.prod.outlook.com (2603:10b6:510:ea::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 09:48:58 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 09:48:58 +0000
Message-ID: <4ca0aef0-824e-383a-95e3-72bb3685b567@amd.com>
Date: Mon, 19 Jun 2023 11:48:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
 <20230614150252.6ceb42fd@collabora.com>
 <20230617135434.7dd3a25d@collabora.com>
 <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
 <94f9393a-17fe-321d-c4e1-e12663dc3106@amd.com>
 <e8e93582-e741-564d-4d26-4e507ccb5906@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e8e93582-e741-564d-4d26-4e507ccb5906@shipmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|PH0PR12MB5468:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a43044-7a91-4da7-0375-08db70aa66ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2UyZumAjZimgwevh8vdVNvAuzQIEzIHKOxrBAjAKcRUFDvTs+6ktUL/z841qCnbwUgAK7A7iPRmed25bO7x+yrFhgqZTUAT7qpS0Vrwk++Cs4a2GXOWfwlQenSoXCblJD61ym2rx30R4bESEtO4Jq3pzVe7m685wj5SCAGgTkLONQyEF4RqZKRE4HkoBlYsE+THXFJYN1D8snz32s+ByF5itbPZ6ZsBoNUfJ0C1mtO620voNw47LTP2NsSE+5+7mpauBWQ/3zDZNfl/QDSjln1kSesqKVJNcDcH6S29EQvZkuYFpORF+FvKpXtJKBJfh/geC6OrXvvwRaC+xizjeU7rjsOLNSteuo24N/B2HjDwVvo5qCMY0z0fgklff9gqlXfqAh2JVLWsK/XRTyQLwOiXtMNFmTRY+MhE35DAX1MSSchEmphsDuv9NsfvD/zXA4uGV4bX/pHCMD6FceVLkv5++4HEuyeSfQeBl0CF2QAehRRdxiqTUPt/7tjiUE+Ede2rtfK58alVC51Pqec9GedBeSK1DE9JYYzWAF+9Ad+sbxG/8yohRlruuq/yz/WS9sEw2ShBAJuQfNqLxda6CO15JpE8gsMzynl0Q318bkBMu2bksc+OR3zVsy4WnNxv1DEMVR+FLO7/O1tYPO4REPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199021)(31696002)(66574015)(31686004)(83380400001)(38100700002)(86362001)(8936002)(41300700001)(8676002)(5660300002)(66556008)(66476007)(66946007)(316002)(2616005)(6506007)(6512007)(6666004)(186003)(6486002)(478600001)(110136005)(4326008)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3FJQlRCSFBFTGE1aWFCUU5SUnNJcWRkdFlmT1RKSHRrc0UrVnNNeWM3YTIw?=
 =?utf-8?B?eml5Um1CQmxFUUpQeWRkTXVsTFRLdTM1MGJXbk9EUHIrVEMrTnhOVnVFcFNW?=
 =?utf-8?B?dmdQa1o0eXBiamlLY0RSampZWW9xRlQwYVovVkxBN2pVc0VjMXR1WDdsMURz?=
 =?utf-8?B?OG9lek1pMjJzZjYxdVFRK1A4MDZrUVVsM3Fnc3lRU0FtUXBONkx0WnNzdS9q?=
 =?utf-8?B?bW5YdkpEMXU3SVlTZ25iSC9iSllkUkdFNVJITXc5aE82RVQwdXowclVzNzhZ?=
 =?utf-8?B?WkQxYUIvNllHOWk5VmVqalhSaHBuN3BkSzg4WEtXeXREYlc0VExUYTVlZkI0?=
 =?utf-8?B?Uk9rMEhsVkZVMEhsaDVRaVV5OFhZdDZBMU9OejVOdjh4aEYwemtzKzQwZW5v?=
 =?utf-8?B?dCsyaGFQcnVRRkRxZFExWHpQLzFDRk9vQXhod3ZoQkR3NitsbGxOUTNGcVdH?=
 =?utf-8?B?VFhVcE92WUhIK1lLQzVQZ2kxdVByTlc0QlY0Y29uWWpSekdJR3gvR29zdXAz?=
 =?utf-8?B?Q3JodGJMRmFjT0RrNUl2Zlp3QXduZ0pSN3ZLajJNTk9VVXBuODAySHhiVnQz?=
 =?utf-8?B?LzUybXduSzlLY2hBNjMzNnNUNXRhZnVsTDRVMkxoT2JseVl4K294ZXlIRVBY?=
 =?utf-8?B?VktKWkx1SDRqbHQwVlpma2lubjIrMFBIN2xEaG1YNkFVTytFSDBQbFBVaFp4?=
 =?utf-8?B?OTE4OUJ0TnlZK2d5ZjkvQ01FTDFjN0Z1b0FNQlVYRlRhZ0daellUVHdtZndX?=
 =?utf-8?B?c3hWdlJ1TE1xYTJkL0xkQjZWVmNpcDFkb3FlZi81c3paWkt3WTVNeWpsY0JP?=
 =?utf-8?B?QmJLM2tQWGQ5MnBsajRTcGdscWRxb1hWWmlSMFNUdXFMZ1lJTXdneDUzVEVT?=
 =?utf-8?B?ZXZpOW5IVGVWNUhlVG50MDdxUDFDcU5yR3RHWUgxKytKbHZnWEFvWFp5b0Vn?=
 =?utf-8?B?bVQxeUVqcS9QdUhiQVRTZXlhemJUNlhKbk9WdVJkSVNETGFydnJVU09FMnlZ?=
 =?utf-8?B?NUhaZ0dhQVkwVW5GOTUxWnFDZVhoZ1lyUHZ4MHZFWEwyZDVuMFhIM3MyQ0Zq?=
 =?utf-8?B?Z0wwT0dBMGZ4UDBOR0dJcUg2Qk5zL0t3YlVjMk9Sa3c0YkJSazQ2M3RvTExp?=
 =?utf-8?B?cjBYdGgwajRxd1A3OFVrVWlYYTNyU0dVb09BZ0pnMGdBQWFTSDVleFVmRnNl?=
 =?utf-8?B?L0hKdEhQQldJeHgyUFF2elJrOHhWTXk0dXpiYlYwcDVSSi9qTnNSU1Uzcnhy?=
 =?utf-8?B?cEwyaUtZemw5cFliYzVNVlhGWCtIOXVkWGVCWXI3d3RsZ3JRM0c5VC9nMU05?=
 =?utf-8?B?YWZrTHl5enRYdGduZTdDSUUxdmZBLzF6MExaWWowY2FjUThuZklMODBqWVhh?=
 =?utf-8?B?d1pzWG8vbUxVY2xDeExaVURmREtVcDRLUzMvdjVFVStMSFFjajlmWDUvMWVM?=
 =?utf-8?B?cGJielNzenQveUJQZWY4cWgyeTRVV1dvTXExL2U4ZkJzdHhuR2JteU9GSVdW?=
 =?utf-8?B?TStEWWtwc2d1bTg4aGZHeUxTdUtBRUdhWVgzak05SEQvNzBDeXk4REJqUDF3?=
 =?utf-8?B?ZVdPYXpSVnEyQWpLZlZzR3NXVFh3bTJSblpwYm90RStoZ3JoN2hTbkhkVncw?=
 =?utf-8?B?U2ppbkwzTk5ZSDRoSDRlSWdhR0tYOTdlY0lKeWpjMHN3cWlBbWp5R1F0N0lV?=
 =?utf-8?B?Y2RWYldyUjgxc3lTNmlIbUdSWjd0OXMrLzBNbENIYlJQdFdJVVpiSEZMRVBt?=
 =?utf-8?B?Q3RWRlYxOU5rMWdPSk00RStwNmtkTUwvUW1sc05JeFovSnB2NzhtR3hMVzVF?=
 =?utf-8?B?bDZnVXRaelV5TVZZWnhkdFpBWmVHUm81eXZma2tVdEVER3I2T3JleGhmZVZ3?=
 =?utf-8?B?aTZQdk11TUtWckNLbGZYOXZ4cThLQjBJU3I3YkxxVnlIZjRwTDBuNVBiMFlJ?=
 =?utf-8?B?YkdBdzh5YWFqd0E2QnViRFU0REtQeG8xeURYaGh4aHowdU9lblQ2NW5KVC9J?=
 =?utf-8?B?bzhjcHZHaVcrWXN1c1I5OENtWk55a2FuQ2gxdW03dmQvcmFITlQ5UU9yS2R3?=
 =?utf-8?B?TFdFY2VWQnRnRlFnRTA3dWNFVDRwcVB2V0ZEMWlLNVp2SFpzQ1Q0em55c2hW?=
 =?utf-8?B?dnVCbkR6bUFBN0xVSEF3dlc2S0hEU1Z0U0NyQjJuMmtOZjV3OEJLS1ZIVDdx?=
 =?utf-8?Q?PWImqHrCHo/A5o+GMRGn0S58i3o0onMphMx0+dd5/L8y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a43044-7a91-4da7-0375-08db70aa66ef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 09:48:57.9978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrm9ZE4MJlUNf2VOD1sKhdziiOd+4bUaFre6C23iZmegpz09oV2MuDam4MA0nfIO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5468
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
Cc: Matthew Brost <matthew.brost@intel.com>, arunpravin.paneerselvam@amd.com,
 felix.kuehling@amd.com, francois.dugast@intel.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 19.06.23 um 11:33 schrieb Thomas Hellström (Intel):
> [SNIP]
>>> Sometimes you want to just drop the contended lock after the above 
>>> relaxation. (Eviction would be one example), and not add as 
>>> prelocked, if the contended object goes out of scope. Eviction would 
>>> in some situations be one such example, -EDEADLOCK leading to an 
>>> error path where the object should otherwise be freed is another. 
>>> Perhaps we could add an argument to prepare_obj() as to whether the 
>>> object should be immediately put after relaxation.
>>
>> I was considering a try_prepare version as well, that should cover 
>> this use case.
>
> That sounds a bit different from this use-case. The use-case above 
> would, on -EDEADLOCK actually unlock everything, then lock-slow the 
> contending lock and then immediately unlock it and drop.

Hui? What would that be good for?

> It sounds like try_prepare would just skip locking and continue with 
> everything locked so far still locked?

Correct.

>
>>
>>>
>>>> +    ret = drm_exec_obj_locked(exec, obj);
>>>> +    if (unlikely(ret)) {
>>>> +        dma_resv_unlock(obj->resv);
>>>> +        goto error_dropref;
>>>> +    }
>>>> +
>>>> +    swap(exec->prelocked, obj);
>>>> +
>>>> +error_dropref:
>>>> +    /* Always cleanup the contention so that error handling can 
>>>> kick in */
>>>> +    drm_gem_object_put(obj);
>>>> +    exec->contended = NULL;
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_exec_prepare_obj - prepare a GEM object for use
>>>> + * @exec: the drm_exec object with the state
>>>> + * @obj: the GEM object to prepare
>>>> + * @num_fences: how many fences to reserve
>>>> + *
>>>> + * Prepare a GEM object for use by locking it and reserving fence 
>>>> slots. All
>>>> + * successfully locked objects are put into the locked container.
>>>> + *
>>>> + * Returns: -EDEADLK if a contention is detected, -EALREADY when 
>>>> object is
>>>> + * already locked, -ENOMEM when memory allocation failed and zero 
>>>> for success.
>>>> + */
>>>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>>>> drm_gem_object *obj,
>>>> +             unsigned int num_fences)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret = drm_exec_lock_contended(exec);
>>>> +    if (unlikely(ret))
>>>> +        return ret;
>>>> +
>>>> +    if (exec->prelocked == obj) {
>>>> +        drm_gem_object_put(exec->prelocked);
>>>> +        exec->prelocked = NULL;
>>>> +
>>>> +        return dma_resv_reserve_fences(obj->resv, num_fences);
>>>> +    }
>>>> +
>>>> +    if (exec->flags & DRM_EXEC_FLAG_INTERRUPTIBLE)
>>>> +        ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
>>>> +    else
>>>> +        ret = dma_resv_lock(obj->resv, &exec->ticket);
>>>> +
>>>> +    if (unlikely(ret == -EDEADLK)) {
>>>> +        drm_gem_object_get(obj);
>>>> +        exec->contended = obj;
>>>> +        return -EDEADLK;
>>>> +    }
>>>> +
>>>> +    if (unlikely(ret == -EALREADY &&
>>>> +        (exec->flags & DRM_EXEC_FLAG_ALLOW_DUPLICATES)))
>>>> +        goto reserve_fences;
>>>> +
>>>> +    if (unlikely(ret))
>>>> +        return ret;
>>>> +
>>>> +    ret = drm_exec_obj_locked(exec, obj);
>>>> +    if (ret)
>>>> +        goto error_unlock;
>>>> +
>>>> +reserve_fences:
>>>> +    /* Keep locked when reserving fences fails */
>>>> +    return dma_resv_reserve_fences(obj->resv, num_fences);
>>>
>>> Ugh, what is the use-case for keeping things locked here? How would 
>>> a caller tell the difference between an error where everything is 
>>> locked and nothing is locked? IMO, we should unlock on error here. 
>>> If there indeed is a use-case we should add a separate function for 
>>> reserving fences for all locked objects, rather than returning 
>>> sometimes locked on error sometime not.
>>
>> We return the object locked here because it was to much churn to 
>> remove it again from the array and we are getting fully cleaned up at 
>> the end anyway.
>
> OK, so if we add an unlock functionality, we could just have a 
> consistent locking state on error return?

Yeah, that should work. Going to work on this.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>>
>>> Thomas
>>>
>>>
>>>> +
>>>> +error_unlock:
>>>> +    dma_resv_unlock(obj->resv);
>>>> +    return ret;
>>>> +}
>>>> +EXPORT_SYMBOL(drm_exec_prepare_obj);
>>>> +
>>>> +/**
>>>> + * drm_exec_prepare_array - helper to prepare an array of objects
>>>> + * @exec: the drm_exec object with the state
>>>> + * @objects: array of GEM object to prepare
>>>> + * @num_objects: number of GEM objects in the array
>>>> + * @num_fences: number of fences to reserve on each GEM object
>>>> + *
>>>> + * Prepares all GEM objects in an array, handles contention but 
>>>> aports on first
>>>> + * error otherwise. Reserves @num_fences on each GEM object after 
>>>> locking it.
>>>> + *
>>>> + * Returns: -EALREADY when object is already locked, -ENOMEM when 
>>>> memory
>>>> + * allocation failed and zero for success.
>>>> + */
>>>> +int drm_exec_prepare_array(struct drm_exec *exec,
>>>> +               struct drm_gem_object **objects,
>>>> +               unsigned int num_objects,
>>>> +               unsigned int num_fences)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    for (unsigned int i = 0; i < num_objects; ++i) {
>>>> +        ret = drm_exec_prepare_obj(exec, objects[i], num_fences);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +EXPORT_SYMBOL(drm_exec_prepare_array);
>>>> +
>>>> +MODULE_DESCRIPTION("DRM execution context");
>>>> +MODULE_LICENSE("Dual MIT/GPL");
>>>> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>>>> new file mode 100644
>>>> index 000000000000..b1a5da0509c1
>>>> --- /dev/null
>>>> +++ b/include/drm/drm_exec.h
>>>> @@ -0,0 +1,130 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>>>> +
>>>> +#ifndef __DRM_EXEC_H__
>>>> +#define __DRM_EXEC_H__
>>>> +
>>>> +#include <linux/ww_mutex.h>
>>>> +
>>>> +struct drm_gem_object;
>>>> +
>>>> +/**
>>>> + * enum drm_exec_flags - Execution context flags
>>>> + */
>>>> +enum drm_exec_flags {
>>>> +    /**
>>>> +     * DRM_EXEC_FLAG_INTERRUPTIBLE: Set to true to use 
>>>> interruptible locking
>>>> +     * functions.
>>>> +     */
>>>> +    DRM_EXEC_FLAG_INTERRUPTIBLE = BIT(0),
>>>> +
>>>> +    /**
>>>> +     * DRM_EXEC_FLAG_ALLOW_DUPLICATES: Set to true to allow 
>>>> EALREADY errors.
>>>> +     */
>>>> +    DRM_EXEC_FLAG_ALLOW_DUPLICATES = BIT(1),
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_exec - Execution context
>>>> + */
>>>> +struct drm_exec {
>>>> +    /**
>>>> +     * @flags: Combinations of DRM_EXEC_FLAG_* flags.
>>>> +     */
>>>> +    u32 flags;
>>>> +
>>>> +    /**
>>>> +     * @ticket: WW ticket used for acquiring locks
>>>> +     */
>>>> +    struct ww_acquire_ctx    ticket;
>>>> +
>>>> +    /**
>>>> +     * @num_objects: number of objects locked
>>>> +     */
>>>> +    unsigned int        num_objects;
>>>> +
>>>> +    /**
>>>> +     * @max_objects: maximum objects in array
>>>> +     */
>>>> +    unsigned int        max_objects;
>>>> +
>>>> +    /**
>>>> +     * @objects: array of the locked objects
>>>> +     */
>>>> +    struct drm_gem_object    **objects;
>>>> +
>>>> +    /**
>>>> +     * @contended: contended GEM object we backed off for
>>>> +     */
>>>> +    struct drm_gem_object    *contended;
>>>> +
>>>> +    /**
>>>> +     * @prelocked: already locked GEM object due to contention
>>>> +     */
>>>> +    struct drm_gem_object *prelocked;
>>>> +};
>>>> +
>>>> +/**
>>>> + * drm_exec_for_each_locked_object - iterate over all the locked 
>>>> objects
>>>> + * @exec: drm_exec object
>>>> + * @index: unsigned long index for the iteration
>>>> + * @obj: the current GEM object
>>>> + *
>>>> + * Iterate over all the locked GEM objects inside the drm_exec 
>>>> object.
>>>> + */
>>>> +#define drm_exec_for_each_locked_object(exec, index, obj) \
>>>> +    for (index = 0, obj = (exec)->objects[0];        \
>>>> +         index < (exec)->num_objects;            \
>>>> +         ++index, obj = (exec)->objects[index])
>>>> +
>>>> +/**
>>>> + * drm_exec_until_all_locked - retry objects preparation until all 
>>>> objects
>>>> + * are locked
>>>> + * @exec: drm_exec object
>>>> + * @expr: expression to be evaluated on each attempt
>>>> + *
>>>> + * This helper tries to prepare objects and if a deadlock is 
>>>> detected,
>>>> + * rollbacks and retries.
>>>> + *
>>>> + * @expr is typically a function that tries to prepare objects using
>>>> + * drm_exec_prepare_obj().
>>>> + *
>>>> + * If we take drm_exec_prepare_array() as an example, you should do:
>>>> + *
>>>> + *    ret = drm_exec_until_all_locked(exec,
>>>> + *                    drm_exec_prepare_array(exec,
>>>> + *                                   objs,
>>>> + *                                   num_objs,
>>>> + *                                   num_fences));
>>>> + *    if (ret)
>>>> + *        goto error_path;
>>>> + *
>>>> + *    ...
>>>> + *
>>>> + * Returns: 0 on success, a negative error code on failure.
>>>> + */
>>>> +#define drm_exec_until_all_locked(exec, expr)        \
>>>> +    ({                        \
>>>> +        __label__ retry;            \
>>>> +        int __ret;                \
>>>> +retry:                            \
>>>> +        __ret = expr;                \
>>>> +        if ((exec)->contended) {        \
>>>> +            WARN_ON(__ret != -EDEADLK);    \
>>>> +            drm_exec_reset(exec);        \
>>>> +            goto retry;            \
>>>> +        }                    \
>>>> +        ww_acquire_done(&(exec)->ticket);    \
>>>> +        __ret;                    \
>>>> +    })
>>>> +
>>>> +void drm_exec_init(struct drm_exec *exec, u32 flags);
>>>> +void drm_exec_fini(struct drm_exec *exec);
>>>> +void drm_exec_reset(struct drm_exec *exec);
>>>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>>>> drm_gem_object *obj,
>>>> +             unsigned int num_fences);
>>>> +int drm_exec_prepare_array(struct drm_exec *exec,
>>>> +               struct drm_gem_object **objects,
>>>> +               unsigned int num_objects,
>>>> +               unsigned int num_fences);
>>>> +
>>>> +#endif

