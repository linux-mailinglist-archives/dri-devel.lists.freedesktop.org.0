Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9092B6A0499
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 10:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F27E10EAFE;
	Thu, 23 Feb 2023 09:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CAC10EAFD;
 Thu, 23 Feb 2023 09:18:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPOAYz1NMbfnj/cwnB6cfLkOlp9e3c6rSEErZiFHQHUEuRjd4HbV0hAK8mwPpTpTvpoM/0DYnE0S8XPTro5MAdHg8IQ6sWNiljDxt5+Hen3yY2f62Wgsc+uRxp4CbUC+6oUYRrMkSoDvGaRuvW1x2fePWDB7StNoqKCnEWbK1tzKHGAy+i8ZvsZhcsIQ29i2TrgcqZTHUG+yF8Law+M33PNXWD2gLdpJW/sCpBW6evt4DAtbaaNYfaoaiHLTw+s6uHWPAvesUwpU8wTzwhlxiq0OsqLMqSILnyuOJbnha7jdPIdXSvzs2Ka7FdomZkeFDtng/US53zknnmn19ifZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZeiRy//KVgDgdQyhytdibbGkBTqwbKL9fdyy4glC30=;
 b=ChkmMhS3T6gstMeJ+MjPCiWJjzsFxtME/mXCm8IdXZEaIcpfet8F+T7bduQu7u9IntpIn3Wvcc0g6luiKz4bbTK+pqycV4e15FzLK3hY+TlaQGamFtT1ZVapUkfTaC1pJWL0MRJ3KDoTpP8fbiwTLEnMJot++E02kVkcJAHGJmXcE/1VNGuJP6qjg392JZ7PlG0mef4b3kKNheRw6SGjOZuaUWUroz2USYOofkvupJQ3ozwleJf34ze1IXO3vC7JnofuMA2UiPf6ThnZn4/bBrt7T6HS8JQXg93pxgvW3yRS8ku/znC8fN+efAw38CnIXdq5z002rh9NnQxfjvMqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZeiRy//KVgDgdQyhytdibbGkBTqwbKL9fdyy4glC30=;
 b=jGd3P9uc1LKjm54q279YNn6j/n/GsA6KTh6lVE0q6gnVVhqFjwMlu8pZL+dWQBH7jZWvOr+Ykf+ZtB0BJ34/gKspkr72eD2zBKJgfw4ii5HfrF1ycbPP/jVcIDZPgyiW1W5QPWB1EdfoFMSSJyqJLf5hhKgGpQds47BiD3oZoJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 09:18:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 09:18:03 +0000
Message-ID: <684016b7-4380-8e8c-0823-da1ef60052e6@amd.com>
Date: Thu, 23 Feb 2023 10:17:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/gem: Expose the buffer object handle to userspace last
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230214125050.1205394-1-tvrtko.ursulin@linux.intel.com>
 <f1256a51-5c4d-ab44-3867-931f7d2c0695@amd.com>
 <767620c4-385f-c0e8-dcb1-513ef4402ad0@linux.intel.com>
 <b7bb9888-b1d3-0d89-1e4f-bc25475b0071@gmail.com>
 <6e05c985-327f-7d6a-af4f-82b97378d0b5@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6e05c985-327f-7d6a-af4f-82b97378d0b5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf27106-6e09-4f8f-96be-08db157edd84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cx8XPTVH4owG5d67uO7NK5CXQQxXWnvJC5exAqamK2U6jIpOMg23lM6yNqWn8k5rFYayULqFzDEFcR5AcATuBlG7Igo7oS4upd9CirdkXOnKQPeutSAUdXZLXR4Sgk+YtbSjwLA6jKI5slw3tGQ0Y15KkBrai5pXDr+UsurIMb7vKt1WMWIUwQHBaOCsgEA3WRO2QU6K53Qll/qSc1y6j3nJGFlVOvNuOKsvWL1sbiPUxAXsMuWviy3Esr2Jc4wE9uv1dwtL039KGuMMGSKf+RuM0JvZg55CjyNy+wITa1sFEAAwOG6mQkqQCfN/jaMT1W0MeySG3hAz2pEnolNP4MM5K0Zf3oR0gfBhI9T+Zcl/tFzcCQeRtuuJJrODHevETIYeLcETUgrjzUcCMVrmkfOQqLX7XisCibzXiOOPZJ7EXVYmqkEzMREutUWgIZsvPrKA/9+KDn281cMZWnif8mqFAfVt7esdMjbtrMFEMEa4qJKZD6VYVS+I0OF7QB4UlfTjrGouPM+ihqUufOjL+R40/1HXpbmDb0kS0w6l6RDdd0fzJjbT2qveolr9tnlumKAYxPwqMnhLaljM/5I3CIyrTMxqWrcJIORyaIu8Wdqi6vQEXOoy7sC2cPK8U3p/FDQ4l6n1TzX8GUevi8qN42O/NQCXaSe0jIKUqscRazeI5UL+TlrTdHDFUaKkmvgif1ovm65VykF/dGhRemhELHAhHAUCv6pI6gY6HP+ATSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(66946007)(4326008)(66476007)(66556008)(8676002)(83380400001)(86362001)(31696002)(66574015)(2616005)(38100700002)(6512007)(54906003)(110136005)(36756003)(316002)(6666004)(53546011)(186003)(26005)(6506007)(478600001)(6486002)(8936002)(7416002)(5660300002)(2906002)(31686004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkI1WXQ0dVhMRWphSWZpbHloQmdNbFU4bFp4a0xxZWlLbnBLaTFhaVlPbmNS?=
 =?utf-8?B?Y296eVJZTWMydlAxQXdhRzZWUU02TUZYcmVqT0JHdGtEV2RkMTlXK1hJTU9o?=
 =?utf-8?B?c3BvWm9ORXoxeW5zNjZ6ZG9mQ2lUNVIzRlNST0hSSFBoSWVHSXVqL25yUjIr?=
 =?utf-8?B?Q2lCMFV5L0E1K1YvbHNoQ21RYXFJd2FyZ2RJOWZaQjhDTEtjVitJZHlhaUZi?=
 =?utf-8?B?Q1BGbzRIZzJNU1FoYWl0L3hSZ01EKytpQmxvZG1FTEd3RVplTmZKbUdTMHBK?=
 =?utf-8?B?VVRxclV0c0VSVTJJc0wwNDdDSGZiam56YUYzOTFjL2x6L2Q0VXVxNFRkb0RP?=
 =?utf-8?B?dnlMcit4bHhuamgwNFlraURVQXg0SmZadzRFVUxrVmFrQVpiMG1POXNEZGJm?=
 =?utf-8?B?WUlNRlI2UGZhdzNOR0VQdURVWFRLVG1QWWNLSytOTWh3OGw3blJYdEU0RlZp?=
 =?utf-8?B?cnRNWjBBQUhVc21PNDNQbGE0aGxncmtHeDdJM1A2UXo5Si80VTNFenhxWlFr?=
 =?utf-8?B?azBpV1hLdXJPYWIzTjhOeXp0V0hEQzh3RUhrMlowVGJsaWFReXEvSkE3ZDJN?=
 =?utf-8?B?MjJEL3ZCd29XdDFrTGJ6a1FiZGZ1dlVLRjM5N0FBWkxZWnRpRDVEUDNTVDBU?=
 =?utf-8?B?WGhkMHUxcU91RG91UlNDTUFLMk1RZE1FRzZaNndhcG1ockp6d1JDTzFCb2pP?=
 =?utf-8?B?RUlzaktaTW9vK1pSemtjdGUyT1k3N0hYdFRjNGlKbm9iWHJ4cmlUbVNyWmpr?=
 =?utf-8?B?bUdzUVU3dmRSMXROZFhnTkgwRzlnY2lIZFkwN08yNDNXYkJtZlNBQ0RUcGJB?=
 =?utf-8?B?enhSdHJtaGhqK3U3M2tmUFVmRnFMNGNmbWF6Wit6anByL3ZybDl1blBJdDVR?=
 =?utf-8?B?VHpLR3EwVUN3SjRwZWF0YUNLVGc2MFE0dHFtS1ZUVU5sa0w0bkVlSmFuNlV6?=
 =?utf-8?B?aWROeFQ1aTBHV3ZSTUF2SmZtZmNzZm9RaXBRWTVLZjN3ZjRDN0Y5RkhSZDNK?=
 =?utf-8?B?WHpLbGptQ1VScHRKK1JIT21oUVY4ZHRaeENlZnh6cW1OUkZSTW9QS3JiSWZS?=
 =?utf-8?B?MHJKVFlXaXZiL3BHYzd2bXRva1dtQWtJNHBZZndBeFVLZFErdUZtVnYra1pO?=
 =?utf-8?B?dnBGNFlralZ3VVhyb1IzNjVydnl1d2FZSHVjbHhrQUMyN055cXRaM282Ulh0?=
 =?utf-8?B?MnJ2bWFqZFplRXJzTHZoMFAwK2ZsQzczb1VBSlR5clZURUpZRm41ejdrLy94?=
 =?utf-8?B?WXFnbERZTlV6YkZKSGJPUElNbGY3MmFmT3BVOTA4SktIK3RCb3JCZ1o4RGNR?=
 =?utf-8?B?cDNma3BLVHRuOWdZUy8zNlV6WEF0aWxuQ29qR1Qyc2w5NWsrUWdrTjlERytl?=
 =?utf-8?B?d3lDVlkrZEtGUWVRUjNRSHZtUW8za1J6cEdzTlBpWGF6QlI3dDhCREFjbHEx?=
 =?utf-8?B?N205K1JjTHFMZ2J0QlozczRNeVFnZEg2RVVRand0VFMzQkp5UWt2TXZ6RWVV?=
 =?utf-8?B?UFo3QU9zSnIwY0dyRlA0M0VUQ0pOYUs2Q21yMW5SME1ndjRXV3VUc0Rwandq?=
 =?utf-8?B?TXJKak8yWjV3UXQwcVRVUnVjbnFONXdiZ3ozekVuWExlVFU0Yy9wUXplQldS?=
 =?utf-8?B?bGZ1NGN2ZENLN3lYUjFsUGxQd0NYUk5wUHhhUkhITkpuVElDaVl5ZXhHRWNo?=
 =?utf-8?B?cndtK25NdTh2cVRIZ1RrekhKZWRCRTRQYWIyOGFVdkVvMWhzblNuUVp3Qy9j?=
 =?utf-8?B?cThrc2RtQk9Rbks1SUxGd3JDRk5KUkgrUkVGNEpJV2hpWStqWTJQdUNjT0pZ?=
 =?utf-8?B?VnY2clczeVFUbW1KUEJNMm4vdkFYeG43RU1WTk9idFdLaHVQbWRUT0xhMDBh?=
 =?utf-8?B?WHlHVk10K0N6cjVIWjB2cFViaExISmRIc0ZnQ1lrNkI3NTRNMHdyUmovU0N4?=
 =?utf-8?B?aldsbUdqQXBIZDEwcmVjc3JrcHY4cmUrTjUvNkxTM3A2NFVlUDM5RkFZaDRN?=
 =?utf-8?B?N1dvcnZBVmx0MmZacUo4aVN6VTIrcmttVDFnWHdyOWc4K2toK2ZTSktET2dk?=
 =?utf-8?B?SFFyYUV3NUt1aEZ6Sm45ZVM2YWJjdDBQVXhGQm9HZVZOaGxvYkc1MXdWYTMz?=
 =?utf-8?Q?g7q59xcQttjXiYwCGleDr2Q9S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf27106-6e09-4f8f-96be-08db157edd84
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 09:18:03.0511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exvlhhGantyzncCjLwk38StyDV96Tduy9W6tTHZifEykFmJ/cJ9syietjWgOaXFm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469
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
Cc: Rob Clark <robdclark@chromium.org>, lima@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Herrmann <dh.herrmann@gmail.com>,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.02.23 um 11:23 schrieb Tvrtko Ursulin:
>
> On 20/02/2023 10:01, Christian König wrote:
>> Am 20.02.23 um 10:55 schrieb Tvrtko Ursulin:
>>>
>>> Hi,
>>>
>>> On 14/02/2023 13:59, Christian König wrote:
>>>> Am 14.02.23 um 13:50 schrieb Tvrtko Ursulin:
>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>
>>>>> Currently drm_gem_handle_create_tail exposes the handle to userspace
>>>>> before the buffer object constructions is complete. This allowing
>>>>> of working against a partially constructed object, which may also 
>>>>> be in
>>>>> the process of having its creation fail, can have a range of negative
>>>>> outcomes.
>>>>>
>>>>> A lot of those will depend on what the individual drivers are 
>>>>> doing in
>>>>> their obj->funcs->open() callbacks, and also with a common failure 
>>>>> mode
>>>>> being -ENOMEM from drm_vma_node_allow.
>>>>>
>>>>> We can make sure none of this can happen by allocating a handle last,
>>>>> although with a downside that more of the function now runs under the
>>>>> dev->object_name_lock.
>>>>>
>>>>> Looking into the individual drivers open() hooks, we have
>>>>> amdgpu_gem_object_open which seems like it could have a potential 
>>>>> security
>>>>> issue without this change.
>>>>>
>>>>> A couple drivers like qxl_gem_object_open and vmw_gem_object_open
>>>>> implement no-op hooks so no impact for them.
>>>>>
>>>>> A bunch of other require a deeper look by individual owners to 
>>>>> asses for
>>>>> impact. Those are lima_gem_object_open, nouveau_gem_object_open,
>>>>> panfrost_gem_open, radeon_gem_object_open and 
>>>>> virtio_gpu_gem_object_open.
>>>>>
>>>>> Putting aside the risk assesment of the above, some common 
>>>>> scenarios to
>>>>> think about are along these lines:
>>>>>
>>>>> 1)
>>>>> Userspace closes a handle by speculatively "guessing" it from a 
>>>>> second
>>>>> thread.
>>>>>
>>>>> This results in an unreachable buffer object so, a memory leak.
>>>>>
>>>>> 2)
>>>>> Same as 1), but object is in the process of getting closed (failed
>>>>> creation).
>>>>>
>>>>> The second thread is then able to re-cycle the handle and 
>>>>> idr_remove would
>>>>> in the first thread would then remove the handle it does not own 
>>>>> from the
>>>>> idr.
>>>>>
>>>>> 3)
>>>>> Going back to the earlier per driver problem space - individual 
>>>>> impact
>>>>> assesment of allowing a second thread to access and operate on a 
>>>>> partially
>>>>> constructed handle / object. (Can something crash? Leak information?)
>>>>>
>>>>> In terms of identifying when the problem started I will tag some 
>>>>> patches
>>>>> as references, but not all, if even any, of them actually point to a
>>>>> broken state. I am just identifying points at which more 
>>>>> opportunity for
>>>>> issues to arise was added.
>>>>
>>>> Yes I've looked into this once as well, but couldn't completely 
>>>> solve it for some reason.
>>>>
>>>> Give me a day or two to get this tested and all the logic swapped 
>>>> back into my head again.
>>>
>>> Managed to recollect what the problem with earlier attempts was?
>>
>> Nope, that's way to long ago. I can only assume that I ran into 
>> problems with the object_name_lock.
>>
>> Probably best to double check if that doesn't result in a lock 
>> inversion when somebody grabs the reservation lock in their ->load() 
>> callback.
>
> Hmm I don't immediately follow the connection. But I have only found 
> radeon_driver_load_kms as using the load callback. Is there any 
> lockdep enabled CI for that driver which could tell us if there is a 
> problem there?

We don't have CI for radeon and most likely never will, that hw is just 
to old. But we also have amdgpu_gem_object_open() and that looks 
suspiciously like trouble.

The function makes sure that every BO is registered in the VM house 
keeping functions of the drm_file and while doing so grabs a few locks. 
I'm not sure what the locking order of those are.

Could be that this will work, could be that it breaks. I will ping 
internally today if somebody from my team can take a look at this patch.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Christian.
>>>>
>>>>>
>>>>> References: 304eda32920b ("drm/gem: add hooks to notify driver 
>>>>> when object handle is created/destroyed")
>>>>> References: ca481c9b2a3a ("drm/gem: implement vma access management")
>>>>> References: b39b5394fabc ("drm/gem: Add drm_gem_object_funcs")
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Cc: Rob Clark <robdclark@chromium.org>
>>>>> Cc: Ben Skeggs <bskeggs@redhat.com>
>>>>> Cc: David Herrmann <dh.herrmann@gmail.com>
>>>>> Cc: Noralf Trønnes <noralf@tronnes.org>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>> Cc: amd-gfx@lists.freedesktop.org
>>>>> Cc: lima@lists.freedesktop.org
>>>>> Cc: nouveau@lists.freedesktop.org
>>>>> Cc: Steven Price <steven.price@arm.com>
>>>>> Cc: virtualization@lists.linux-foundation.org
>>>>> Cc: spice-devel@lists.freedesktop.org
>>>>> Cc: Zack Rusin <zackr@vmware.com>
>>>>> ---
>>>>>   drivers/gpu/drm/drm_gem.c | 48 
>>>>> +++++++++++++++++++--------------------
>>>>>   1 file changed, 24 insertions(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>> index aa15c52ae182..e3d897bca0f2 100644
>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>> @@ -356,52 +356,52 @@ drm_gem_handle_create_tail(struct drm_file 
>>>>> *file_priv,
>>>>>                  u32 *handlep)
>>>>>   {
>>>>>       struct drm_device *dev = obj->dev;
>>>>> -    u32 handle;
>>>>>       int ret;
>>>>> WARN_ON(!mutex_is_locked(&dev->object_name_lock));
>>>>>       if (obj->handle_count++ == 0)
>>>>>           drm_gem_object_get(obj);
>>>>> +    ret = drm_vma_node_allow(&obj->vma_node, file_priv);
>>>>> +    if (ret)
>>>>> +        goto err_put;
>>>>> +
>>>>> +    if (obj->funcs->open) {
>>>>> +        ret = obj->funcs->open(obj, file_priv);
>>>>> +        if (ret)
>>>>> +            goto err_revoke;
>>>>> +    }
>>>>> +
>>>>>       /*
>>>>> -     * Get the user-visible handle using idr.  Preload and perform
>>>>> -     * allocation under our spinlock.
>>>>> +     * Get the user-visible handle using idr as the _last_ step.
>>>>> +     * Preload and perform allocation under our spinlock.
>>>>>        */
>>>>>       idr_preload(GFP_KERNEL);
>>>>>       spin_lock(&file_priv->table_lock);
>>>>> -
>>>>>       ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
>>>>> -
>>>>>       spin_unlock(&file_priv->table_lock);
>>>>>       idr_preload_end();
>>>>> -    mutex_unlock(&dev->object_name_lock);
>>>>>       if (ret < 0)
>>>>> -        goto err_unref;
>>>>> -
>>>>> -    handle = ret;
>>>>> +        goto err_close;
>>>>> -    ret = drm_vma_node_allow(&obj->vma_node, file_priv);
>>>>> -    if (ret)
>>>>> -        goto err_remove;
>>>>> +    mutex_unlock(&dev->object_name_lock);
>>>>> -    if (obj->funcs->open) {
>>>>> -        ret = obj->funcs->open(obj, file_priv);
>>>>> -        if (ret)
>>>>> -            goto err_revoke;
>>>>> -    }
>>>>> +    *handlep = ret;
>>>>> -    *handlep = handle;
>>>>>       return 0;
>>>>> +err_close:
>>>>> +    if (obj->funcs->close)
>>>>> +        obj->funcs->close(obj, file_priv);
>>>>>   err_revoke:
>>>>>       drm_vma_node_revoke(&obj->vma_node, file_priv);
>>>>> -err_remove:
>>>>> -    spin_lock(&file_priv->table_lock);
>>>>> -    idr_remove(&file_priv->object_idr, handle);
>>>>> -    spin_unlock(&file_priv->table_lock);
>>>>> -err_unref:
>>>>> -    drm_gem_object_handle_put_unlocked(obj);
>>>>> +err_put:
>>>>> +    if (--obj->handle_count == 0)
>>>>> +        drm_gem_object_put(obj);
>>>>> +
>>>>> +    mutex_unlock(&dev->object_name_lock);
>>>>> +
>>>>>       return ret;
>>>>>   }
>>>>
>>

