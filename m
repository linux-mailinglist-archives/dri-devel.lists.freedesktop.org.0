Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC4273A34E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 16:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8732D10E039;
	Thu, 22 Jun 2023 14:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1343C10E039;
 Thu, 22 Jun 2023 14:42:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9HKkzbFnp+JuN8iUji97I+0Uuhd+FeWhQ3nJ5QDKyq6Eg5EpaVhBqfwFMHgTIoGgkiPikQbzmNDB/dFD4h7MnwxV1Jl0EwyBJa2GKzilkBbSeDBJ2WdQrIqnt1Lx0LDLmO1G21CGY7zX29H605bdqwY6CTJjmX3wKK0Uwd35CMB46S9nvH+eT0qvrywRQU3B1ep6AoipLVrzFzCYV7ve4Gv6jei96u+ZjCXG4tDNiZiFQvtjCl9FKx2HJCmKo1R8lkvxxYn8UWLeYxa7rmCQ5kuDNWTGPW1QaOdIrqy6NYZmpxvty8U+9Oos4skkfY2Cffs8CKbBwwDDkRm941pEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=os7X98DgxIfN7ME8lo4DWq4txD8YTEQXFMigNgT3ZZY=;
 b=DUzoz5hXcbu+ygJHRgbfpyirC2mi8iS3zp4XrOIQrdjM4uFVMdriy2JUx25UslhPmquXK5fdaO6uK7wx4jM1DdrXvrpj7DYkh7zTa9ObbOLJMeUk8joFRuiJwNgYhIJSnBycnETwA/Lr9blvHRwbq2iWQmUciEKKMuBaomdH1IKzA/ELzuWRtjU1DJGyyJxenVa1A5jCazDG4bMDRxTroKUTuugaT6Vkrkkbjb57oGp+S7TQEvXfRfSxUQpYkMD3HfpPm8P+W3Dewc1FIBQjmeZMGDGwcn7YlRlfGqy8AzNc0/i/a4GXr959ar9rpFMyOWB7xddrCt24JpICLTa6Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=os7X98DgxIfN7ME8lo4DWq4txD8YTEQXFMigNgT3ZZY=;
 b=q9rm3gIUIoEjqV14aggf9lPV38vMQc/HDLMR3pC47iAx7vov3VAiSBMzfguqAUDhJ+VNeIGTuejW47Sk2AGsXT9Ukq4wSPtd+JJCtbSWNMmBDboiX5DfyoSnB/J2e41qNb0aIWJk1h1tfdUZa2T4TJ+5KQETxf2fwZIMiLYE890=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7261.namprd12.prod.outlook.com (2603:10b6:303:229::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 14:42:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 14:42:17 +0000
Message-ID: <86ef9898-c4b6-f4c0-7ad3-3ffe5358365a@amd.com>
Date: Thu, 22 Jun 2023 16:42:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
 <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
 <a8edf75b-e0f7-a6c7-7d29-f0d39923549b@redhat.com>
 <41aecd10-9956-0752-2838-34c97834f0c8@amd.com>
 <bcde7ea3-fbab-3a18-e810-64b6589ddb18@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <bcde7ea3-fbab-3a18-e810-64b6589ddb18@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: b75bbd98-d0da-4f47-a889-08db732ee071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sDNZqanPoogKWSH5WM7ANNWgcBCU/2pxDYUvsxUtri2Hh7a4/LAa/hyMD0MiGNY5I8jRmh2Jg5//HgbcZH15AHrQNo20zebrVU0UbcSD0msDp1wFfLKT8Hz2O9EgZCrJYk8t+z2Y8PGpuDQTXdDvVFNQbJJ2l9B4qwSMJvl8zGDblRcXMhx/+YaQAyF09MAFA5TMaYRA+KuHuLJ8QaG5I0Mw7pHjDJp6VX+puxk4TBzWzsAC5iWnUL0E0ugUZsBppDzL6jfFe6AlowFzX9estECkewwo1a1XdBBiFbHm5+frtaNhr2+cvfadd6qHMQ7AN5bUQrwqz8UT4fi0ixyS5VfXR8x2jfT0Sb9zXYtfDgLWCyHObc8VeiLrWBQIdYUkeESdY4Z+OWEyDgBzapq9/6pgizRHa629U7oMUgczneWxEYm99a5V9tPX0CtYL8Vl19d2CCzhmQWQR1z/8Y4jqBfzoQYwgTiDKSCJdOVOjRuRdJfqY1v4LuePGRiuAYUIE6w6arKRtky1+6l4VYV1tBhe36WB09G6JK+/niJRK566czuSEiDcxuydMYPzltWayyS07lPWUJemZeNyemT4lpUYq+FaZxr7uFpI4E6Kcx8qDiotei4bF6p//O2cLjSw+16Ly3Zi+dN5ns5rmomZiEvr/xVDLq9oD81trXV/YmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199021)(186003)(6506007)(53546011)(6512007)(8676002)(2616005)(66574015)(83380400001)(8936002)(5660300002)(41300700001)(66476007)(66946007)(66556008)(316002)(2906002)(7416002)(6666004)(478600001)(6486002)(4326008)(54906003)(86362001)(31696002)(36756003)(31686004)(921005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0s0YXVhWFRCcGVHRjl0S0tXZWVxMVBWeCthbnlLVldEQTR1cmYxM3NBQ1BE?=
 =?utf-8?B?bDFDeDBydE40S0VLMzR5MjA2MEI3dWZMWUJSVFN2VU1zWDh4dEZnQk8yQlJi?=
 =?utf-8?B?Zy9MQ2w4WEFsSk41UXRRWUttY3Z6ZFdpV1o5UUJHVW5ub3ZSSEQ4Z1NQRzBk?=
 =?utf-8?B?eVpta3RQd3YrWE5nN0lpNFZqTGlXYmlKSWJYWGVXcCtpRStaY0laaVlVUWVu?=
 =?utf-8?B?NjBROUcxWU9xUHh2eEp5QllGZ1ExdWxteEpsVGx6VWp2REJQQkk2M0JPd2hq?=
 =?utf-8?B?aGhVWUlqeDUwb1JOUlJwQnViN0p1NGtaK1lPRUNTZGUvcjJNYTZlK201MjFl?=
 =?utf-8?B?dloyUGdPMnM3T0R2U0lYeHl3bTd6c2JxaXpCQk9hNDlTdXJMVndISDJSUVgv?=
 =?utf-8?B?K2h0Wll0d0NqbnRQMmtFUEFVTkgvaVFzTVZOZkZXWWU2S3ZTb0VUWEZIL2k5?=
 =?utf-8?B?VkhhRCt0ZWlYWTJHQktmam9CRU5lNFJZOVU5Z0Q0Y2lrQ0R5TlJIaU1YdVNJ?=
 =?utf-8?B?QVVZMUFYcC9MRVlvU2tRcytFdDU0MHh0Szh1ZHJtTkRNUDlhUVNTZUVmVVov?=
 =?utf-8?B?UDJOcjYxb0J1MHI3RURUQ0xsandrbk1qZEFUSTlGQlZleE9EcUhBMUtIYkt1?=
 =?utf-8?B?OUZSeXVpU1dnS0ZZWksyUHNwRW9QUHNvTUdDUFl2aTZpb21DTnlSaDdZTzli?=
 =?utf-8?B?WVVyaCtHRHZmNGVqazhKaktiYStLMEp2OTlDNEx5ZmZ1TEpvWmxYR0liTW4v?=
 =?utf-8?B?bFMraGUrMGxqVFAwNDZSTjd4ZStYc1hET3A4MHN5eVZjU1NQZ3hqRDZuQVM3?=
 =?utf-8?B?azNvK3ROY3dVZ0dVb3JCQmxZc1grd0RFalhmbEprZ1NXNUlmK2l3QXJlVDdQ?=
 =?utf-8?B?Rk1jWVFyQ05md3BPNTVRV1ArV2RaaXRhY2c4cXVkNjhKYmxwbG5SeEVMQzhE?=
 =?utf-8?B?TE9oNHZ4RjdOY0U1NVVKZk95YzhjMU14V0JnWVQrTDYzbGxZRlgvSjJMd0F5?=
 =?utf-8?B?TDQ1UEk0czZyakhWMEtlTVlwd3c3cE5Oa0h2aHNtaStNUUtFNE9oT3M1VDAw?=
 =?utf-8?B?MGhuV3ZOS3UyL3lHWUdTaTFJREdaaEpONTcybDRPRnRyZVhMQkNZRWxrOWVB?=
 =?utf-8?B?akZCa09VWFo1dU84eDE4M29kdkdCWjVZVGsyUGdnbC83OGpYNm9yWWYzR0ZZ?=
 =?utf-8?B?VmR5MTFFekx3YTBkSzdRbnJOQ2l4SUhVUnREcTlhRUVEbUtZa0VFMTlEZXJ5?=
 =?utf-8?B?aWZpOURQenIzQ1k0czJHYzc1azJ0clZVbXBiS0Myb3l4SWZoTWpOaGZuVTkx?=
 =?utf-8?B?WE9DamcrUURvMEpkK29ueWVGMGQ0YUJvNlBzMUxZeVFoaFZvcWhvRisxNEwv?=
 =?utf-8?B?MlgrMW4xM1JwaG4wazdkUkxKdnBoRStVSXVBckF4bmFrMVRRTktmd0dLVG9U?=
 =?utf-8?B?c05jaFIyS1NDMWJqVmh0cmh0NzNTeGRtZ3MrSzFTSXQyWm90WTVXVE8wUXR4?=
 =?utf-8?B?QmFMRXdnV2FQS2g0ZlMvcW5YWHNyNmNqbkRiNmVlRzd4MXRoRWhtYWdVc2xR?=
 =?utf-8?B?K1hnQWdnSS9jV3l0dmhTTzVGYXg1cVpsU2FkMHRuY0QwM1QrbWxXN0Nrekcy?=
 =?utf-8?B?b0I0Nnd3bFRqSmdQZkI0NVYwT1Zzc2ZVcW1nR0dRQkI3NkQ2WXgvQXJmTWZH?=
 =?utf-8?B?R09FWDJsRmo3YmUwTVBydkhaOG96OWJReXI4UlJ2VHFGdm1XS29nTkRwLzho?=
 =?utf-8?B?K1RXWHdNdnZoU251ZEhYQUNmQzFoMkFkcW1MeEsvQTF6NG82TFk5a1oxYWdX?=
 =?utf-8?B?bWdnVGNldGl6QU8wRlBucURKRkljMCtpTFVPd3VJSzVxbWwyY0dpdGpick5z?=
 =?utf-8?B?cHllZmUralRJZ2J6TWxxT0c3VWdiSk5lM0U0NnFpTkFUbzFtQWtLSzZCL2pa?=
 =?utf-8?B?NWRMQWtNdWVVZ0ZLcVJJMlJuVDU0U1VtSWhpdEsxdWNsaGJUa3VFREs0VnFp?=
 =?utf-8?B?WEt6TkluQm5hU0tsREkxbWwzRjNNN25RbWRpTGFDZUgveW5rUnNINXUwRzFs?=
 =?utf-8?B?TFpSMk4zSzF2alRmeUxEZjZjdHVCSmQwa3IvM3dUWk1YWmdTTTYxc0w2eG5m?=
 =?utf-8?B?dXJ2VG5aQ05JWmpKdVRKek52UTc1UlVaaG1BWEtaTDNleU5FTmFoa0ZQMU9X?=
 =?utf-8?Q?MeFoJJg57EfL9c20StSzn/v5chJ6Aa/eYjC5C1neAClt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75bbd98-d0da-4f47-a889-08db732ee071
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 14:42:17.6391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NNqLsqUGIfubv8dwtBnroZM3ftqySZau77kbRzDMVBseFO/7q1ddNAnBxNeSSej
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7261
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Donald Robson <donald.robson@imgtec.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.23 um 16:22 schrieb Danilo Krummrich:
> On 6/22/23 15:54, Christian König wrote:
>> Am 20.06.23 um 14:23 schrieb Danilo Krummrich:
>>> Hi Christian,
>>>
>>> On 6/20/23 08:45, Christian König wrote:
>>>> Hi Danilo,
>>>>
>>>> sorry for the delayed reply. I've trying to dig myself out of a 
>>>> hole at the moment.
>>>
>>> No worries, thank you for taking a look anyway!
>>>
>>>>
>>>> Am 20.06.23 um 02:42 schrieb Danilo Krummrich:
>>>>> [SNIP]
>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>> index bbc721870c13..5ec8148a30ee 100644
>>>>> --- a/include/drm/drm_gem.h
>>>>> +++ b/include/drm/drm_gem.h
>>>>> @@ -36,6 +36,8 @@
>>>>>   #include <linux/kref.h>
>>>>>   #include <linux/dma-resv.h>
>>>>> +#include <linux/list.h>
>>>>> +#include <linux/mutex.h>
>>>>>   #include <drm/drm_vma_manager.h>
>>>>> @@ -379,6 +381,18 @@ struct drm_gem_object {
>>>>>        */
>>>>>       struct dma_resv _resv;
>>>>> +    /**
>>>>> +     * @gpuva:
>>>>> +     *
>>>>> +     * Provides the list of GPU VAs attached to this GEM object.
>>>>> +     *
>>>>> +     * Drivers should lock list accesses with the GEMs &dma_resv 
>>>>> lock
>>>>> +     * (&drm_gem_object.resv).
>>>>> +     */
>>>>> +    struct {
>>>>> +        struct list_head list;
>>>>> +    } gpuva;
>>>>> +
>>>>>       /**
>>>>>        * @funcs:
>>>>>        *
>>>>
>>>> I'm pretty sure that it's not a good idea to attach this directly 
>>>> to the GEM object.
>>>
>>> Why do you think so? IMHO having a common way to connect mappings to 
>>> their backing buffers is a good thing, since every driver needs this 
>>> connection anyway.
>>>
>>> E.g. when a BO gets evicted, drivers can just iterate the list of 
>>> mappings and, as the circumstances require, invalidate the 
>>> corresponding mappings or to unmap all existing mappings of a given 
>>> buffer.
>>>
>>> What would be the advantage to let every driver implement a driver 
>>> specific way of keeping this connection?
>>
>> Flexibility. For example on amdgpu the mappings of a BO are groups by 
>> VM address spaces.
>>
>> E.g. the BO points to multiple bo_vm structures which in turn have 
>> lists of their mappings.
>
> Isn't this (almost) the same relationship I introduce with the GPUVA 
> manager?
>
> If you would switch over to the GPUVA manager right now, it would be 
> that every GEM has a list of it's mappings (the gpuva list). The 
> mapping is represented by struct drm_gpuva (of course embedded in 
> driver specific structure(s)) which has a pointer to the VM address 
> space it is part of, namely the GPUVA manager instance. And the GPUVA 
> manager keeps a maple tree of it's mappings as well.
>
> If you still would like to *directly* (indirectly you already have 
> that relationship) keep a list of GPUVA managers (VM address spaces) 
> per GEM, you could still do that in a driver specific way.
>
> Do I miss something?

How do you efficiently find only the mappings of a BO in one VM?

Keep in mind that we have cases where one BO is shared with hundreds of 
different VMs as well as potentially the number of mappings can be >10k.

>
>>
>> Additional to that there is a state maschine associated with the 
>> mappings, e.g. if the page tables are up to date or need to be 
>> updated etc....
>>
>>> Do you see cases where this kind of connection between mappings and 
>>> backing buffers wouldn't be good enough? If so, which cases do you 
>>> have in mind? Maybe we can cover them in a common way as well?
>>
>> Yeah, we have tons of cases like that. But I have no idea how to 
>> generalize them.
>
> They could still remain to be driver specific then, right?

Well does the mapping has a back pointer to the BO? And can that be 
optional NULL if there is no BO?

Regards,
Christian.

>
>>
>>>
>>>>
>>>> As you wrote in the commit message it's highly driver specific what 
>>>> to map and where to map it.
>>>
>>> In the end the common case should be that in a VA space at least 
>>> every mapping being backed by a BO is represented by a struct 
>>> drm_gpuva.
>>
>> Oh, no! We also have mappings not backed by a BO at all! For example 
>> for partial resident textures or data routing to internal hw etc...
>>
>> You can't be sure that a mapping is backed by a BO at all.
>
> I fully agree, that's why I wrote "the common case should be that in a 
> VA space at least every mapping *being backed by a BO* is represented 
> by a struct drm_gpuva".
>
> Mappings not being backed by an actual BO would not be linked to a GEM 
> of course.
>
>>
>>>
>>>>
>>>> Instead I suggest to have a separate structure for mappings in a VA 
>>>> space which driver can then add to their GEM objects or whatever 
>>>> they want to map into their VMs.
>>>
>>> Which kind of separate structure for mappings? Another one analogous 
>>> to struct drm_gpuva?
>>
>> Well similar to what amdgpu uses BO -> one structure for each 
>> combination of BO and VM -> mappings inside that VM
>
> As explained above, I think that's exactly what the GPUVA manager 
> does, just in another order:
>
> BO has list of mappings, mappings have pointer to VM, VM has list (or 
> actually a maple tree) of mappings.
>
> You see any advantages or disadvantages of either order of 
> relationships? For me it looks like it doesn't really matter which one 
> to pick.
>
> - Danilo
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> - Danilo
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>
>>>
>>
>

