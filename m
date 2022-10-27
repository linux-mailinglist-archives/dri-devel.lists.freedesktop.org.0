Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BF60F143
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 09:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F2310E534;
	Thu, 27 Oct 2022 07:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7219010E534
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 07:40:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhM+9+XQVstM7lV0t1L0j0xV3dyjxpc4Ej4s127iX0gOgocCWSjtLMGu/jRE1n7/hGQBaFDX4FpihkP2cVTde2AOq48qu+7x5rPYot/iN2qOADu2n+zfFaZi+1scFCtOUYf79dlo1H66s3RSMkBhBmm/aku67Yp6p1EstJFAQ3BE5oo5p58DgHR0LsyX3grK8JoAuUIOXs/XbkmvipqODcjKhG+epbicfCj+7sq+KE5sQ9u4bKa/F7zk86j01iLvbjZQVKSLi+t4Bw/mw7+W8xoFbWqMbfKeH2ge9uxJQFm/UwGcl+PVON0v1rem7zxqThJ8nuRi+kVP8+ijDOvsaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfb3ZoBSL6urnkeaJo0GGfXuKcz5TCc1fDze28RwvXg=;
 b=gNVTs7YY4qsR+w5BK5Z8VK8HBvKB/nNL4jlYwO5YeKaZ6Fit4FZGSPoKvkrzSDvUC//YwhXamU1vlMZsZE/Xty8RQOIO0UweZkPf2MbIhlC3maoq2PIQ1ANk0j1et+zNsgx9uOt/7m0tcKbUyGCIpoiYlE6YVWGlTk+8fMlG4Pf63Z/ZQBeYZcdba0nQBnrYXnaU30LB08Ryx5BNT0UIEfGQAP3qczYlgb8zcbnHwQ8L5dchw8v402h+O7fz9zH9G6ORVQtejotGcshkhtghbl79nWauOVBBSWD9rw7d+gtlyBNmIhO73+HF+hYoT/6N3mYwqDBJG6mfdl07K+foEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfb3ZoBSL6urnkeaJo0GGfXuKcz5TCc1fDze28RwvXg=;
 b=rM9/KKqadS1gHQ/tEfCyrzj6zuHbyyj3lhKxd8AxOmDHebQN7VS8QlV70FVx+a6NVWNpznRVHo4kUIBDg7j0hlvKzBsioMWV1h2Hxw7Qkxfts+MewV2J8AqSxqYbwJb5+5j6Djld392rQsDgGqBgyqW9PLEdWfFHWeEJ3XTNnFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6433.namprd12.prod.outlook.com (2603:10b6:208:3af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 07:40:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Thu, 27 Oct 2022
 07:40:33 +0000
Message-ID: <7fccb1d3-cd05-d1f6-fa68-6c1828925d4c@amd.com>
Date: Thu, 27 Oct 2022 09:40:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 2/2] drm/gem: Check whether object is NULL in
 drm_gem_vunmap()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20221026224640.7542-1-dmitry.osipenko@collabora.com>
 <20221026224640.7542-3-dmitry.osipenko@collabora.com>
 <6b37315d-74d0-713a-3544-b8d4c873488d@amd.com> <Y1ozCWTco6dzIA7J@kadam>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y1ozCWTco6dzIA7J@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6433:EE_
X-MS-Office365-Filtering-Correlation-Id: 8976db38-4729-4995-c755-08dab7ee8793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfSa0qSOnRR1N8YOvELiyJHSeAcKZEaFk1TtqLtxBzmxchVVNFXJsyep/VM8GBBxxf82K8fcP5NVxtO6LasOdPcUVa/igXtt7Lhowhs49k08C0IQ24wHiYm8icK8w3Z2lHA7bQWbG4vl6fkSZPLiWXJQu6e6Ggn2hcRIHJ8unR0qToEAiTrU9HtQboSW7HSFF3DYDWqOLZQhIOZzHjJvobZgN0l8uZ1MLkvGzc1FvV9ehrsLaJUIkoxwXk29R6Q/GVVha0HDg/JGUra3djfyfSGBjpe5lDQilHkvuOWaBc9tuBIHw/kdYqkJc6Cd5836lJrufif5PM5rubvLsa5fMkXM8+z2VE/mp4wXbdNqhaHxkmsBfPPqeZP8muhmX4yCnrwoTtYTeXtdI1vG+BiqbqOyP/Y1DKv3UiUQyHEUO700lsM5L0FGXZgGyVTr1p5I8UAkJSm1ojJ/+xdQvADUVjK8Jwg4oDwG2fbYjA1q7+Qt4Rcz/9nM9FrFODzFRVPyWGumLAf1VtfA77jTfEN6dbVLX9NtzHwuCGY9ZjN22YatP070B5fnWqTGIQPVs3CoNLKwo5qDBV5b3kylewDYkTKlCBlYlcBO41fwApIDRMfW9EMIwitWYpcdJnjMnc9UNGUImwBZXzIIIdUWKBx0tq4CpTXSoYr/J7N5oHlKqXDwe20zB+ZtSCTCnSGKYXCFAlzbGvnlJWgGiQ2aVwDp4XaLTBdt+qAF8imxglSt9ZjkxOP8TFahILfHYlFgi+kXnafsEf5Q5fuQgbrYELuZe3OvdgO182RlAHl/0DaHCPamfSC/xZ55avajgQ++Lw9zKPP3Qpoj6hRtbVt/gN1eUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199015)(66574015)(45080400002)(6916009)(8676002)(66556008)(54906003)(36756003)(2906002)(8936002)(38100700002)(6506007)(41300700001)(4326008)(316002)(66476007)(83380400001)(5660300002)(7416002)(31696002)(86362001)(66946007)(26005)(6666004)(6512007)(186003)(31686004)(2616005)(6486002)(478600001)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTJ2RHIySHBZTXRINXR3Qys4Sm51am54MURqMXZ3VXFwVWxmaHNQWVRBVEpn?=
 =?utf-8?B?WVUxY2tIMHVvYnpEZVFUZklQYmhjeEJBSTBxRW4wdm5JYVdBUDhTY3ZJTmMv?=
 =?utf-8?B?TXF2ZmJrMGR2T2JlbzhVV1g3eE5wSVJWSGN4K3k4VlR4TDA5T2NremdrbWJo?=
 =?utf-8?B?bVFFN01TVHc4V24wSm1Edm5FcTloVXdlS2cvbzhITUI2L0dSTUZHOHp0NHJE?=
 =?utf-8?B?YStZWjAyK0VmMnJyd1dMdEhlcExIS3dJMzRGdjZ6WUo4NUtYdFpqMXNpcGZa?=
 =?utf-8?B?UWZNQ0ZCMFQwNFV6SUVvbElpc1FHRnJLT3ErQTljTzc0dGNHRitKYnAwa0Ex?=
 =?utf-8?B?UE5MTSs1WkRkN3VzK1VYVHlCTjBCOW9pWGJIS1JhZkFVenVadHIyaGw5Q2l5?=
 =?utf-8?B?SDNmU0t2N3hGSC9DWVluVVMvWm5wYjY3anZtREROeW1kMXRRcHZxNENaNllk?=
 =?utf-8?B?N3V6QmVvbzNpZ0Q1M004aDl2RVhBZnMzNkt0ZlBncVpKN2ZMZWp3Q2lsOTIz?=
 =?utf-8?B?cTErTU9LeERVeDVZWDBIaXRnRVdDdzU5YStPSXM1Y3J3NmZveEdGVUY4OXNv?=
 =?utf-8?B?VUw5cWlYVXZBSTFRakNGZVNQQTJiWWFPOTVHZCtEUUJYVG5mU29wVWwxYzRq?=
 =?utf-8?B?NEVrOWQ2VEp1TTdVYXFKakcrNGhNVmxjSFBFTkNGQzl0RnJWNWVjU1pZZkpH?=
 =?utf-8?B?TnFoWTFjWlpPbk83NnZHdVo0S1poR0JvTU9iRUtvalp5d0FMMjFMYWFZL01Z?=
 =?utf-8?B?LzNSNGxhVXVxOSt3bXRPM0R2Tm1uYmN4dWt4MGJCMllsYkNlR1RzU2p0U0Ri?=
 =?utf-8?B?Z2xOU0RodUFiWGc1L2s1bnl6UmZtalE0V3pjSGErV2F2dENhbk84VWw3Zm1h?=
 =?utf-8?B?eitUQjJtNzBBZGJXYlhTanFLYlQ1NFFmVGpDYWRZVHJDU2p1THc0VVliWWIv?=
 =?utf-8?B?blhhS1ZVRVpKTHhZY1VWN08vdE4vdWFvNDkzTk9vTkF3OW1KUXZPLzFmNGJM?=
 =?utf-8?B?QjREWC9pUWlMbUtubFpobDdRYzMyR3RaU0J3UGtIWExPdkxpRWcrVmx1N2Rx?=
 =?utf-8?B?d3JkaWZuZEx6blN0M3FEMGV3dmV5Z0ZWRHpLUWZrRGJrQm14bVZJdTRIa2Za?=
 =?utf-8?B?RHZvQVlrMTBxczBqcGdnNWM3bkZvSUMxZFJiZk9wTlM3Q09KVTZXTEhFY3pn?=
 =?utf-8?B?VlBEb2hDL05sZW91Q0pRVFU3azlUWlRsdHMrQXBoU1BDRWtENkRVY2JmdFB2?=
 =?utf-8?B?bERRZkhEZ3hhaTQrWnFpZFo0TFQrb3ZYRVpZYVFRTFFKeDRMdVlZa1gxMkFM?=
 =?utf-8?B?VWRpQXl5MEZiLzh5aXpNWlY2d3d2NFM1L3FFNUkybElGVjRBdEhWcmVlbFpi?=
 =?utf-8?B?cU5CNis2SUNrRUU4eFpFZXFCRWNzUWEzQ1RDUVpMSGN2RVBNT2xOamt5OU5U?=
 =?utf-8?B?RXRNMXNoZlN4UldlU0NWZ1FBU0ppMlR4K1dIajNGSnExSmRRUUV2NnNuOXBD?=
 =?utf-8?B?d0c3ekIzQk5VT25abVVKeWlTVVVxTElTWVFYNlpjLzFSd2hCZ2V0cDgxdWJV?=
 =?utf-8?B?azJ5Y1oyS0hwTnZwTlI3em5PaVRYTndrMW9vbE1LeU05NWxLSmhiTFhRbXBx?=
 =?utf-8?B?dE5ac0tHem5XZFlmR0gxNDkzNVFwbFk1YUxyYjN6UHdscW1GbE1FNk5RZ0hh?=
 =?utf-8?B?MWIwTzQ2ZlNJRThGSjhraXNrQkhzZHJLK2lnWUI5TUc0NHdPVk5MYjdpaVUv?=
 =?utf-8?B?RnEvYXpDRVJQTTh5V0EwTEMwWUlqMHdBQmdGR2tYbUp0UHVDbUljb3EyU2Vz?=
 =?utf-8?B?NllQR2JRaWhObkxYNTIxa2dhTUdGSDVicklSMDdYTHNLeTBTZkpKRFB5bWN6?=
 =?utf-8?B?MDBkRkNyZSsyTTVmZldJbkVHQS93V1BxRGpad0ZZa3JzYXRoTko0bUtaNllr?=
 =?utf-8?B?enA2T2tKSmhKSDArYzFXTTNUOCtLK244S3dSK0M0NEtEb3NML29DWGhzb292?=
 =?utf-8?B?K2xsNHpyQkNEUGlDeGp1Z3AxSHlOR3ZCYjR3b2kwNFZEYXpqMlowa0xpQXNh?=
 =?utf-8?B?dGRoek9tTUhxNzgvZjlSZkxHZnBBQ3ZSZGgzS2k5ajhDVkc0ZDBIbnloc2ZZ?=
 =?utf-8?Q?aXKVqAlCNKFJy6xzYuVKYu+W5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8976db38-4729-4995-c755-08dab7ee8793
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 07:40:33.3398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSOJ7vNF2D6IYe4byWNRLkqVV3TXofJc8fNLqe131fA6gdl2fP4VR4AwVZHKwN/Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6433
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 linux-kernel@vger.kernel.org, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.10.22 um 09:28 schrieb Dan Carpenter:
> On Thu, Oct 27, 2022 at 08:17:31AM +0200, Christian König wrote:
>>
>> Am 27.10.22 um 00:46 schrieb Dmitry Osipenko:
>>> The drm_gem_vunmap() will crash with a NULL dereference if the passed
>>> object pointer is NULL. It wasn't a problem before we added the locking
>>> support to drm_gem_vunmap function because the mapping argument was always
>>> NULL together with the object. Make drm_gem_vunmap() functions to handle
>>> the NULL pointers better.
>>>
>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2FY1kFEGxT8MVlf32V%40kili%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C50d3b7e10eca4c7fb72108dab7ecd646%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638024525139985844%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ET0TRHscb1bQVVHgBkmYvTQyV2Q6WqcMC83LDlrY5ZM%3D&amp;reserved=0  Fixes:
>>> 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap
>>> operations")
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>> ---
>>>    drivers/gpu/drm/drm_gem.c | 9 ++++++---
>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index b8db675e7fb5..ee0a246ff4ac 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -1175,11 +1175,11 @@ EXPORT_SYMBOL(drm_gem_vmap);
>>>    void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>>>    {
>>> -	dma_resv_assert_held(obj->resv);
>>> -
>>> -	if (iosys_map_is_null(map))
>>> +	if (!obj || iosys_map_is_null(map))
>>>    		return;
>> I'm not very keen about that. Calling a function with all parameters NULL
>> doesn't make much sense and is clearly a coding error. Hiding that somehow
>> doesn't help but rather makes things worse.
>>
>> The only execption to that are things like kfree() or *_put() which work
>> with the lifetime of objects.
>>
>> Why is the static checker complaining about that in the first place?
>>
> drivers/gpu/drm/drm_client.c:240 drm_client_buffer_delete()
> warn: variable dereferenced before check 'buffer->gem' (see line 238)

Well than rather modify drm_client_buffer_delete() instead.

Calling drm_gem_vunmap() with obj NULL is certainly not a good idea if 
we even check that for drm_gem_object_put().

Interesting that the static checkers complain about that :)

Regards,
Christian.

>
> regards,
> dan carpenter
>

