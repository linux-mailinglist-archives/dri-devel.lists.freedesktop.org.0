Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A310F576EF7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45CC10FA40;
	Sat, 16 Jul 2022 14:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63DD10E11C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 15:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjrqiF1gupETfb23z8FH0vYOK9u2CD/9ahZ5McPSt2nPPsMoojbANL/qQFZ2hjDdPIqCD+sKleB0c4/I2pnftNalsfPsu2OxdcNrzKgb7CmQ3/va8LrVHF+wopnGaPyarYawV4Ngg0i6uRqx8zpK2K9DO6fX6ihVsUwCsWgwhW21JM8hsDe+zRKLpsu6yfsCsXrVMJQmS+hg/LqKHB6h+m4C33qezXYgUiQN4Lx6MtKjOBSQvz7T2WXliuAnBikxLWfR30J0H9hiDhXWsr4TeoaI7DFbR625jsMfiCAr+26UYMLcOH46NIR+ePd/lWV7QkiRCvc1DlLuGf8YpoD/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWoDDn+doWC/pKgs4LW4RDpHnpVA0pZ31/sxpgS4Y4Q=;
 b=ZahVlBXrxdLUeKJv26sgteHMJ9X5/RQpX9A/aYyR8OeZMei4r22Q4ciQ/WK05aZ8Yr2U4uDxFsdgNw4jtrCKuV/KeQ5Page0sIfNHGfSF+GxyIKjHHF0z+9DtlWGPVV/XDI95Rwxgmii7cCfcva+oeDdUQmcC8Zs1TU/iF9whrPgU4e4ScFUlTRTgzJLf2Ti3nsAnWTbIwqj9SnFOg9JiqVuow7ZHhO3bTyvrPtUZwf5+Y3xPfjIMsvdQA3x3iy1HM9xVXFURazxkVypp51+Ln3dQWocWoNrbkP8ni+Xa/B45UTBjGfuso4IVHTkSv09ZXH7FQ8sIh1lS0o0UXwLKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWoDDn+doWC/pKgs4LW4RDpHnpVA0pZ31/sxpgS4Y4Q=;
 b=o1dt+W7y+Mx/FQBPCIzVWTWHb0iSurAarGUUtge2ucYSIkVrFnNXV3ktc+ojtNzRqsvnZ3fZ7Wa0DxRIaVYH8WWw9zr5IvMw2FGg76KBhX8RhKr4/igu2bN0UjgRGzEZ2ZkfYoJL9RISD+riwesv2yxB9GsSJYDTH4wsrz96onI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5904.namprd12.prod.outlook.com (2603:10b6:510:1d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 15:58:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Fri, 15 Jul 2022
 15:58:39 +0000
Message-ID: <5bdedd05-3620-5082-1e6f-c3f6bbae9cc5@amd.com>
Date: Fri, 15 Jul 2022 17:58:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220715111533.467012-1-christian.koenig@amd.com>
 <e71431ef-bcb9-012a-ff0d-4ef350cd232e@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e71431ef-bcb9-012a-ff0d-4ef350cd232e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7097b38b-6f12-4804-8545-08da667ae230
X-MS-TrafficTypeDiagnostic: PH7PR12MB5904:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T1li0DE6MlrwRMhCUPbu3s1Ti/ulUpS5VRi/Yi9KTqxjz3tV4Q+ipFuAvpYocJnYpGEXgBbxPLFSZ7sEZkeeOmvLxBPUBHiH7vnm4kIhFHCJKBi2qWbRjyugtaCV2bGRNZ1RRvj6dfzTbb0F6gqThLC+md3Aj3KkMunIdFWxZA1T4D7+zjtQEONGjPDqOojsZ4gmfVWj1JZBPiiU2FhXpB1msqIjiznNKEUEbvJjF/UWFzFjOhTUI4iL2p1ySyxkpLe0Zew14AKbsGuebTPp2XT+ZCKjxct4L8Vyr9jpdIc4hcdaogVPR9kWuvWq4BxQnfa9lVLp/TmtkUjfGx4o0v9cxuE4z/cMYKwtmkVbR0374k43uyOtu5nGpb1BCJfcbhXMYBZ67HjNqn8Y1S9gYlvrScbxFMjDOW8k4dTrnLEzgOkCnGRIdjHYpxGwkgy2YSFuyg69Fqtd8nrT4TISHPwTVsd7BfeMMFzET+jHLn/an4nHRpl4SZXh4csFQK1DUW2DRFP5bQAZP80SjX22LykQg+rlTKFHVU7WbW//CWZ/afW00nli8OV6dFfWVDTUHTlafU2u1aXhzKMt9b5ydyrY7S11+u57lHA2irlrrv/qzR8s7slVHpqmXA2zHcRWcjoM7/nImjdFhON+DttJI5A/rTJo15+C6WnUfQSftztvqYJxXOz4D27nL7VKPvL4EjE4MXBLrDjVasCOiUa6AX6f6LpKOJlwN8Ujwlu3yrigPUOw8GiaaSoA/HnshzH5ezoTl8/s8XHNZQHms+uXYdTfGBetBvksTIY8TlxN8dnLMLdw82n3h7/U2dhbz75k7/XyLkg6yakJCTbmjEvyb0du7r8aKryMsdfz0Z1yvWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(110136005)(86362001)(316002)(83380400001)(6486002)(186003)(66574015)(2616005)(41300700001)(478600001)(6666004)(31696002)(6512007)(6506007)(2906002)(8936002)(38100700002)(36756003)(31686004)(66946007)(66556008)(66476007)(8676002)(4326008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3lFdUxRZWRZc054S3hPSjRCcS9TYVJJSVpjNURGbEpoc0ZZemtiU09wTWQr?=
 =?utf-8?B?eklwSWp6T1U5L1A3N1kxRTN6enN1K1VoOEw4UUI4L3BUK0tVZjRYK1BWMWZx?=
 =?utf-8?B?M0swb2JQbldha2FRZGJZbmI5cytTVFRRS2ZFZEZsb2srcUJRZUFGT0xQVWhC?=
 =?utf-8?B?QmFzK1B4WG93VHUzQko3RHZqL3JIOThad3R1alppbmUxaEJuY0FqUmlJR0h4?=
 =?utf-8?B?VFh6YjF1UWlJcjVtUWpOMC9YbEVybVgydUVlclNEMzdBRW5kcUxrZEpGbFFB?=
 =?utf-8?B?eTdiaUM0N2gyUUh6YWVRVkZwSm5PLzhRbGc3NlRaVEpiRzZlZWFuZmJ2T3pM?=
 =?utf-8?B?cW8zanozS2hjQTNPUWhzQ0xsZmFTeFM4VlFGNW1jVVIxUlBlVytkN1h5U3d4?=
 =?utf-8?B?RGc0eGd2bFVNOE1YMnE1ZjFLcC8rT0plNXIzS1FEQ1RkS29uOWozTEdMVlIr?=
 =?utf-8?B?eDhuc0dYZS95azJaYzZNOXlhY2NDdzJMZEZFblRmZlN2QWF2Tzg4SS91cWF4?=
 =?utf-8?B?TjVtSFArMSt6SExFaDloSlZRZGQyekw4bGVVbEVRaFQzZnZsY0FhcHhWc05o?=
 =?utf-8?B?UmVHRlg5bGQ0Z0cwV241V1N4dDlVTVUyZk01MTJtUWxoTC8yZEFIOW1keHRN?=
 =?utf-8?B?Mmkxdk44ekYzQXNBN2dUQXpDaDFlM2l4WEl3REFtQXhRREpKRDA3Tkw0TU9o?=
 =?utf-8?B?QWxnS0x5aU55NXVZYVovWFJPMzZTQ1l0a2IxN2hTWng1QWNDbHJ0N2dPVlVl?=
 =?utf-8?B?cU5KcWh2V0NmdTJ4cW9xMEF2Q3JYbFNHNitKdnp2aktSNXc5Sk03WG9IWHEy?=
 =?utf-8?B?ZmE3LzFSRytqUDllL2xjdHVMV09Mdk1Ua1VSenRTMDkrNC9hQlJtclJlR3lq?=
 =?utf-8?B?S2pBeVBpY20wZVBEN2xzS01rODZjaG5oZnpYZFhvUXZLcmpralBHeU5vd3Nr?=
 =?utf-8?B?amVoSThMVjg5Yi9YWk5SK1cvSGlqSkcyMnBJdHQ2dEdUSU9ScmEzN0M4UEtt?=
 =?utf-8?B?VWhJUEN6a1dHbHlEZXc4UmRTMlFUZy9iK29SbFc4MThTQWxtc0JxYjNMdFFO?=
 =?utf-8?B?c3RqamxEYWlGWDZvUDhWK1FJR2dSZk1UZWk4U0ZZSVFTN29YRlNCeWVNZ1RB?=
 =?utf-8?B?ZzhvVE5HNUZrQy9YTlM4WlM4ZEJxN3FWaVJia1BGZkY4SloydXlDU2pERTNh?=
 =?utf-8?B?Q0drNEt2VFZsTFBmazlHL2FoUnlWTnIzeUxsNlBXMkliR2owZ01kZUVkbXI2?=
 =?utf-8?B?dkNMZk9wSnQ5RTJhcmZjckErRVVua3NRMm0rUE5BcW8zMHlMcWV4ZjJRdWIy?=
 =?utf-8?B?cnBqRjdPdU8rWEhORUQ0cmUwOTFlT0MrMzBlOVJ4V0pKMkdaZ0s3U2Z1NytL?=
 =?utf-8?B?N3gyaE9VbUt3REkyeDdnaWw1L2hzdm5yYnEraFYwdVA1bWlNTDcrWEF6YktP?=
 =?utf-8?B?a0N5ZnUrWmV3NEdyNWxKRVBEMHNqRC9kbm1KNHk5aC8zWkwzNVgzc1J1WU5v?=
 =?utf-8?B?NnpNYzk2clFLdTZEbU8vcFFDQjNtTGVjblBFUWhIalBrT3F5QkpTdERNQWFw?=
 =?utf-8?B?dGVOTS9LWUprNEF3M3ZPVjRVQlFxRXU4dGlONWhXT1NpTlVoZjFJWnpncXlV?=
 =?utf-8?B?aW5QM1ZtUE9XcmFRak5KZE1lL3hrZG1ZR3M5d3NoMks3eXNUbGE3UVdLME0y?=
 =?utf-8?B?VmU2SEs4T0U3ZnhmWXpnKzZhcFZFbnlnT0Vick5WMXIrSktyUGQyNEZCRDBY?=
 =?utf-8?B?amxoZ0JQdUJKYStOMEdnRFBjWmlyRUxDblpqckMyblNtL0laM2Z3K0xrbjNp?=
 =?utf-8?B?aUxGT0JOU3FYNEsybDhHQXhUeDFDWjd4dkFyY2pXM2dBNXVYeTJSOGFralE2?=
 =?utf-8?B?clVrK25UekRSYWFDbktKQnVISitRRlA1MVFkREJDQU1NNVZ1SStXYUwrMGky?=
 =?utf-8?B?NjJPaXF0NHpMU3BUZVZUeEVBa2M4Zi9PNUJlTDZlSGVkYURWR1l4UVFZaW9G?=
 =?utf-8?B?RUtSUjZFdW9qbFJRcWlRUHFTblRmZjdicjZaSG8ybENsTXZqYUY2T3BvczZw?=
 =?utf-8?B?K0thR3FvUVl0ZCtGRnV3aVNWZWxLMXVzQU4yNmR2ck9Qa3BNek5RdWpadCt0?=
 =?utf-8?B?bHkzaiszMlh4R3ptcHN0M2dBWmNFYzNpamNOVUZBOUdjZE85Zklrck5yRWQ2?=
 =?utf-8?Q?i4SLIuO3kEyWlzv5IiiOVKDYeu+e+nK9kHsPXL42lc/M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7097b38b-6f12-4804-8545-08da667ae230
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:58:39.5251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRvZNgW1yGJbo9q53Un2hNSDXQPIXsb3MY6bT+S0jh50Qzr8jruHF6oykI1HQYe0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5904
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
Cc: dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.07.22 um 17:36 schrieb Thomas Zimmermann:
> Hi
>
> Am 15.07.22 um 13:15 schrieb Christian König:
>> I've stumbled over this while reviewing patches for DMA-buf and it looks
>> like we completely messed the locking up here.
>>
>> In general most TTM function should only be called while holding the
>> appropriate BO resv lock. Without this we could break the internal
>> buffer object state here.
>
> I remember that I tried to fix this before and you mentioned that it's 
> not allowed to hold this lock here. It would possibly deadlock with 
> exported buffers. Did this change with Dmitry's rework of the locking 
> semantics?

No, can you point me to that?

My assumption was that drm_gem_vmap()/vunmap() is always called with the 
lock held, but Dmitry's work is now suggesting otherwise.

We certainly need to hold the lock when we call ttm_bo_vmap()/vunmap() 
because it needs to access the bo->resource.

Thanks,
Christian.

>
> Best regards
> Thomas
>
>>
>> Only compile tested!
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Fixes: 43676605f890 drm/ttm: Add vmap/vunmap to TTM and TTM GEM helpers
>> ---
>>   drivers/gpu/drm/drm_gem_ttm_helper.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c 
>> b/drivers/gpu/drm/drm_gem_ttm_helper.c
>> index d5962a34c01d..e5fc875990c4 100644
>> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
>> @@ -64,8 +64,13 @@ int drm_gem_ttm_vmap(struct drm_gem_object *gem,
>>                struct iosys_map *map)
>>   {
>>       struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
>> +    int ret;
>> +
>> +    dma_resv_lock(gem->resv, NULL);
>> +    ret = ttm_bo_vmap(bo, map);
>> +    dma_resv_unlock(gem->resv);
>>   -    return ttm_bo_vmap(bo, map);
>> +    return ret;
>>   }
>>   EXPORT_SYMBOL(drm_gem_ttm_vmap);
>>   @@ -82,7 +87,9 @@ void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
>>   {
>>       struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
>>   +    dma_resv_lock(gem->resv, NULL);
>>       ttm_bo_vunmap(bo, map);
>> +    dma_resv_unlock(gem->resv);
>>   }
>>   EXPORT_SYMBOL(drm_gem_ttm_vunmap);
>

