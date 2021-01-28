Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20762307C2E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 18:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EA26E1EC;
	Thu, 28 Jan 2021 17:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770075.outbound.protection.outlook.com [40.107.77.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8682A6E1EC;
 Thu, 28 Jan 2021 17:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxpVF7Cd6AoHUuZrr6oqwS6rFcNV50+Ki9mO9OgmmepJuziCqCcptgLCcmTU1NnIxH5MJyPAq9dWm1whPpWGaTGiuxTdu3QW/oFNYPIuKchviUV5SV6BI5PMk3D9F9FNWh7vkUK2OPO++Uwou9FOtpyvsiqTJ+8gERlcUHigUK9BZSSKCv8G/q5szCymfOEgqKy6jlsTD3m5yz6Kw5BhzPr1IZbPfSa+ElKs5Y8692WeVku9doXyFIF9G4RmlIT2DnP88sm9Kbsyxzh5Rguc+IkyOJnFtFkRRbuyncpa3jxLAhipxHq77yvSU6SmNF8LMRVQhXeTclQ8Y6X2oc9TUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qERScbI7aS1zgxnICj3gk5qW6uEaN/qRO4F1QMZfwP4=;
 b=SUx9SUtngEoG487dymoGKdaFSk3ZPy9WGUMsUEq5fdfX63vb4zucD/ipFrHsGPMeB/axlPR0JwnOQr3Lo6q9HokrtJq6Bs7u7P6qbaZlnSWKpZdwyzPk0L2kIpqWPLJQjKCOsh419BO29t4MpMEMf44Fk1ToyVHIYj3/RG/aqJtBODnspQV5aPIc8X3ZYFm8LvaJIAEXvXYeZ/xIx4DDdTZbmjcIpzNQHtAqaSIXRSlGr/rIA1/ffK4KRMH+8zVDkOnkCAR7zdvmLEpZOvgqsC/kkRZp+Lk/rLROHymMGIbCpuPSR3KlfABw44dvYZxtnHU6vKik6LyT6vWkMNsvVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qERScbI7aS1zgxnICj3gk5qW6uEaN/qRO4F1QMZfwP4=;
 b=jI/anYc6h7DSwBJEn9ArbcTOJBsbHkjlugkt/3JCp1rN+hV0rSAhoTAjnLoCwYRpAlkPmVFi+ZlzbHk/eTmr5V4MDcQIMKNXywfpxBkv1JdhC2XrHtq33ed7N84S5VufPAQ0ca0ZT+Xej31gctkLdRAvk4DekbfZbxRCDMDo+8k=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Thu, 28 Jan
 2021 17:23:58 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3784.017; Thu, 28 Jan 2021
 17:23:58 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: christian.koenig@amd.com, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-12-git-send-email-andrey.grodzovsky@amd.com>
 <35ecd67f-620f-df50-3e03-d24dc12452d6@gmail.com>
 <8925db97-bf81-7e5e-527d-f654713b400d@amd.com>
 <CAKMK7uHCzBpaC2YypKeQwbJiT0JG2Hq7V0BC5yC88f9nqgxUiw@mail.gmail.com>
 <8ed4a153-d503-e704-0a0d-3422877e50fa@amd.com>
 <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
Date: Thu, 28 Jan 2021 12:23:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
Content-Type: multipart/mixed; boundary="------------A75547600663D07071CF0503"
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:d8e2:6a98:222f:fe30]
X-ClientProxiedBy: YT1PR01CA0115.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::24) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d8e2:6a98:222f:fe30]
 (2607:fea8:3edf:49b0:d8e2:6a98:222f:fe30) by
 YT1PR01CA0115.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 17:23:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c7eb64c-aea3-4394-b63f-08d8c3b17edf
X-MS-TrafficTypeDiagnostic: SA0PR12MB4400:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB440039D8BAA307480D5E50E3EABA9@SA0PR12MB4400.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fUR7ci+hfNSNI1qOvfV/7S+VrfXm1ezkWB3EcCxiUGU/wuObEiZYbB9GyYoen4HJE3nkC4nVKQ8F52lZ4TiqA9566MN41EiEbx9aLm6q7jP9jkrB1CpjOigDi13yVKYhKSQjqnx5hmuJIK/tLUYXXZZip+GiENXqu2QB/U7Vp/0orzIpArrVPr+kljbew8ZCrUDUZw6CCsHTZqlnG54aqleui8MuqcczAjVeuj3u62+7HNBTRSTB/XY76N83JRdSEgz4iDNcPz2YOLahfefBdn+25GP8jyh6lWI2wbcxSa3WBdzHdttuJlKCr9ojHGQYOpl/yLLQineP+j7oJSCZeBK43t22LHEdnZTWotafByUfuY3eNLZECqizcns0U0tSRRVxj2Jo+qpXDq3vhJCIusqp94S8Ff0/x7UuYee4TgRVujQQzygBi9OWn2yuUiHrHOmEVSYtIWzdGYiOZU2vmB1q17jhY/NYk0zEl341VukfSqeGDWp81OaeW1QaziKtHsPZE/7Jt7HVLeAxjbrtM787u6FqwLwk1z0JeaaClUggSj/x/2CTtln+cEyD4ji2lREKzbE7WXFu5FTSWJiCmM5k7HZHWFohDyeuwuZCIz+81kYMHvy0sSjt1q9J/i575eucpvLzEbwjm7aqNT7WJmeQ1VZJJc95V5d5G8QdRNiuRGrViZQkkzC2A5u4jpJT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(66946007)(66476007)(478600001)(2616005)(66616009)(31686004)(31696002)(235185007)(6916009)(45080400002)(21480400003)(316002)(6486002)(33964004)(86362001)(52116002)(83380400001)(966005)(66574015)(8676002)(36756003)(4326008)(5660300002)(66556008)(186003)(2906002)(8936002)(53546011)(30864003)(54906003)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aER4ZjhwTzNVL0pHQy9wMGRqV09ZaDZGOTBSb0pVUlFCUHdnaUVIeFRuT0FN?=
 =?utf-8?B?bzhSNEREVE9wQWZ5V3lIaU1MOWNPTkJmeXhIbkhSTEVmZFFJN2FadEVnVS9J?=
 =?utf-8?B?RitnbXYvMFZlN0wyRm1tY1BXL0dGbklUWEdTZFgrZkpYeGtiQ0dsRjJaby9a?=
 =?utf-8?B?RmdDcWY2NGNSUFdkZkVjck55M1ZNdncwMHBFVTVYWUlYd01SNW1VN0l4TXBS?=
 =?utf-8?B?SzdZQ3ZSRUZzNWliZnhUVDh5cm9JS1RINWdOSUlidzhSR0QvZThhYWRZd1BV?=
 =?utf-8?B?eG05OXU3M00zaWRJMDdEYzBIVmNhUTM5VnVTWWFGSmdoQ2hPbnMzT3YyZjR2?=
 =?utf-8?B?NGkxZU9ad1YrRFZlRWJJRWpGQW5pVDc0ZS8rbFk0UTFQVERSckllbEVKMzFO?=
 =?utf-8?B?bTl1ZWdBemVnNGdKeSszQWc1MjIvTVBSR29nYnNwR1kwQjhTRHpNUldvb3NY?=
 =?utf-8?B?Wkl5enI1L0pOeG5RaG5ma2pLNXUveHk4SmUvdlo5Z1R2dXIvcUtOZ3FMOU1a?=
 =?utf-8?B?M2h5ZlB0Yk5HbWZEV05pSGIvZ1lBQ1Q5UG4waU9uVXFJSEZHd3hzdDNhSWcz?=
 =?utf-8?B?d281UWFRT00yTnFYbFJzbnhkWFJtWXJxbDNMTVluR1I5a1dQekUxM1p2VFVm?=
 =?utf-8?B?TkYzL1d5dHFvVHl5aWpFOGdubUJrWitCQnlIZXNrSFVpMUpDRDdLUmV0aU1K?=
 =?utf-8?B?WVFBTGthYi9LMHJnZzVaY0hpVSs2YS9zS0FHTERpb0poQ3ZvdXl1NkhCdmtv?=
 =?utf-8?B?K09BRi9FMFo4NzhMaGtNSWpGTytVbHYwZHB5alRtQjJ2OGF3MWVjMDFMTkFX?=
 =?utf-8?B?ZGI5KzhmN2VpclRyWFZMN1FWaEN5ekVDWlA2bjcxV0lldW1NTnE0cEpCZUJY?=
 =?utf-8?B?bGV3UUtUSktaNU95cmw0SklQbFA0NnQ1dXAxV2dNbHZ5NHpBY2YzUDdBa2pX?=
 =?utf-8?B?OXFkLzl0R1poekJIcUJtZjI1OG1wWTBiOGRDc0I2Y3VYRWRaQy9zU0RzQ2xp?=
 =?utf-8?B?RXJqYWVobzRBZUxnVndVZXhwUTRrOUQybU5uY2YybXRhUUdibmswL1dmQ2g0?=
 =?utf-8?B?V3lpVFNGelUyQmUwUFA0YnExRnoyODZYeGFYYjRZNU0yTmFXODhaTDlxVFBJ?=
 =?utf-8?B?TVpyVEVvRUg1WjRoU3FsN0lZbmxDQ2xuMHlYNk9oSEFyNWJNVXl1cURxVmhr?=
 =?utf-8?B?d01WWEQ0Qkp2UWJhdTNaeW5JcE4yZzlxMlBaZ1V2ZC9veVE0bWJ0TWxFcDVX?=
 =?utf-8?B?N1IybjlLMEI5cE0wSjBLZFZyZmdwU3VSVFJiQ1JzVG95QmNCWmI4b0dyYktk?=
 =?utf-8?B?M3JjTldTczdEbHQrdDVUenp3alg5dmh0U09FWEx5SjI3YXZBQURBY0FrUWll?=
 =?utf-8?B?cHB6T3pqY2kwbHJtd1VrbzU0cHh4amhIK0llZnRlMlNiaVlLYzhjU3MwQ0Vt?=
 =?utf-8?B?MFlnaDlqb0d6Z3JiUVlhKzlMalFnTzg1SnBSeWI2R0pjN2Y3bWxxd1ZlWVkr?=
 =?utf-8?B?VTVDTmU1cVAzZE0yV1dhdTZDZE1Jdkw5NnR4OHZVVHFQR2FqUVJCa29jWSsr?=
 =?utf-8?B?bU4rZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7eb64c-aea3-4394-b63f-08d8c3b17edf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 17:23:58.1631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehz77jwbSjlN1YWtkRDMqQz+sEL3ZoF/owpdyXumJxVPZBw8VPuZYyNzqx4KDcVDopFUYT6ayo4sWWayjeB4mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------A75547600663D07071CF0503
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/19/21 1:59 PM, Christian König wrote:
> Am 19.01.21 um 19:22 schrieb Andrey Grodzovsky:
>>
>> On 1/19/21 1:05 PM, Daniel Vetter wrote:
>>> On Tue, Jan 19, 2021 at 4:35 PM Andrey Grodzovsky
>>> <Andrey.Grodzovsky@amd.com> wrote:
>>>> There is really no other way according to this article
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F767885%2F&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cee61fb937d2d4baedf6f08d8bcac5b02%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466795752297305%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=a9Y4ZMEVYaMP7IeMVxQgXGpAkDXSkedMAiWkyqwzEe8%3D&amp;reserved=0 
>>>>
>>>>
>>>> "A perfect solution seems nearly impossible though; we cannot acquire a 
>>>> mutex on
>>>> the user
>>>> to prevent them from yanking a device and we cannot check for a presence 
>>>> change
>>>> after every
>>>> device access for performance reasons. "
>>>>
>>>> But I assumed srcu_read_lock should be pretty seamless performance wise, no ?
>>> The read side is supposed to be dirt cheap, the write side is were we
>>> just stall for all readers to eventually complete on their own.
>>> Definitely should be much cheaper than mmio read, on the mmio write
>>> side it might actually hurt a bit. Otoh I think those don't stall the
>>> cpu by default when they're timing out, so maybe if the overhead is
>>> too much for those, we could omit them?
>>>
>>> Maybe just do a small microbenchmark for these for testing, with a
>>> register that doesn't change hw state. So with and without
>>> drm_dev_enter/exit, and also one with the hw plugged out so that we
>>> have actual timeouts in the transactions.
>>> -Daniel
>>
>>
>> So say writing in a loop to some harmless scratch register for many times 
>> both for plugged
>> and unplugged case and measure total time delta ?
>
> I think we should at least measure the following:
>
> 1. Writing X times to a scratch reg without your patch.
> 2. Writing X times to a scratch reg with your patch.
> 3. Writing X times to a scratch reg with the hardware physically disconnected.
>
> I suggest to repeat that once for Polaris (or older) and once for Vega or Navi.
>
> The SRBM on Polaris is meant to introduce some delay in each access, so it 
> might react differently then the newer hardware.
>
> Christian.


See attached results and the testing code. Ran on Polaris (gfx8) and Vega10(gfx9)

In summary, over 1 million WWREG32 in loop with and without this patch you get 
around 10ms of accumulated overhead ( so 0.00001 millisecond penalty for each 
WWREG32) for using drm_dev_enter check when writing registers.

P.S Bullet 3 I cannot test as I need eGPU and currently I don't have one.

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c 
b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 3763921..1650549 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -873,6 +873,11 @@ static int gfx_v8_0_ring_test_ring(struct amdgpu_ring *ring)
         if (i >= adev->usec_timeout)
                 r = -ETIMEDOUT;

+       DRM_ERROR("Before write 1M times to scratch register");
+       for (i = 0; i < 1000000; i++)
+               WREG32(scratch, 0xDEADBEEF);
+       DRM_ERROR("After write 1M times to scratch register");
+
  error_free_scratch:
         amdgpu_gfx_scratch_free(adev, scratch);
         return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c 
b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 5f4805e..7ecbfef 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1063,6 +1063,11 @@ static int gfx_v9_0_ring_test_ring(struct amdgpu_ring *ring)
         if (i >= adev->usec_timeout)
                 r = -ETIMEDOUT;

+       DRM_ERROR("Before write 1M times to scratch register");
+       for (i = 0; i < 1000000; i++)
+               WREG32(scratch, 0xDEADBEEF);
+       DRM_ERROR("After write 1M times to scratch register");
+
  error_free_scratch:
         amdgpu_gfx_scratch_free(adev, scratch);
         return r;


Andrey


Andrey



>
>>
>> Andrey
>>
>>
>>>
>>>> The other solution would be as I suggested to keep all the device IO ranges
>>>> reserved and system
>>>> memory pages unfreed until the device is finalized in the driver but Daniel 
>>>> said
>>>> this would upset the PCI layer (the MMIO ranges reservation part).
>>>>
>>>> Andrey
>>>>
>>>>
>>>>
>>>>
>>>> On 1/19/21 3:55 AM, Christian König wrote:
>>>>> Am 18.01.21 um 22:01 schrieb Andrey Grodzovsky:
>>>>>> This should prevent writing to memory or IO ranges possibly
>>>>>> already allocated for other uses after our device is removed.
>>>>> Wow, that adds quite some overhead to every register access. I'm not sure we
>>>>> can do this.
>>>>>
>>>>> Christian.
>>>>>
>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 57 ++++++++++++++++++++++++
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c    |  9 ++++
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c    | 53 +++++++++++++---------
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h    |  3 ++
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c   | 70 
>>>>>> ++++++++++++++++++++++++++++++
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   | 49 ++-------------------
>>>>>>    drivers/gpu/drm/amd/amdgpu/psp_v11_0.c     | 16 ++-----
>>>>>>    drivers/gpu/drm/amd/amdgpu/psp_v12_0.c     |  8 +---
>>>>>>    drivers/gpu/drm/amd/amdgpu/psp_v3_1.c      |  8 +---
>>>>>>    9 files changed, 184 insertions(+), 89 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> index e99f4f1..0a9d73c 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> @@ -72,6 +72,8 @@
>>>>>>      #include <linux/iommu.h>
>>>>>>    +#include <drm/drm_drv.h>
>>>>>> +
>>>>>>    MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>>>>>>    MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>>>>>>    MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
>>>>>> @@ -404,13 +406,21 @@ uint8_t amdgpu_mm_rreg8(struct amdgpu_device *adev,
>>>>>> uint32_t offset)
>>>>>>     */
>>>>>>    void amdgpu_mm_wreg8(struct amdgpu_device *adev, uint32_t offset, uint8_t
>>>>>> value)
>>>>>>    {
>>>>>> +    int idx;
>>>>>> +
>>>>>>        if (adev->in_pci_err_recovery)
>>>>>>            return;
>>>>>>    +
>>>>>> +    if (!drm_dev_enter(&adev->ddev, &idx))
>>>>>> +        return;
>>>>>> +
>>>>>>        if (offset < adev->rmmio_size)
>>>>>>            writeb(value, adev->rmmio + offset);
>>>>>>        else
>>>>>>            BUG();
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>>    }
>>>>>>      /**
>>>>>> @@ -427,9 +437,14 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
>>>>>>                uint32_t reg, uint32_t v,
>>>>>>                uint32_t acc_flags)
>>>>>>    {
>>>>>> +    int idx;
>>>>>> +
>>>>>>        if (adev->in_pci_err_recovery)
>>>>>>            return;
>>>>>>    +    if (!drm_dev_enter(&adev->ddev, &idx))
>>>>>> +        return;
>>>>>> +
>>>>>>        if ((reg * 4) < adev->rmmio_size) {
>>>>>>            if (!(acc_flags & AMDGPU_REGS_NO_KIQ) &&
>>>>>>                amdgpu_sriov_runtime(adev) &&
>>>>>> @@ -444,6 +459,8 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
>>>>>>        }
>>>>>> trace_amdgpu_device_wreg(adev->pdev->device, reg, v);
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>>    }
>>>>>>      /*
>>>>>> @@ -454,9 +471,14 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
>>>>>>    void amdgpu_mm_wreg_mmio_rlc(struct amdgpu_device *adev,
>>>>>>                     uint32_t reg, uint32_t v)
>>>>>>    {
>>>>>> +    int idx;
>>>>>> +
>>>>>>        if (adev->in_pci_err_recovery)
>>>>>>            return;
>>>>>>    +    if (!drm_dev_enter(&adev->ddev, &idx))
>>>>>> +        return;
>>>>>> +
>>>>>>        if (amdgpu_sriov_fullaccess(adev) &&
>>>>>>            adev->gfx.rlc.funcs &&
>>>>>> adev->gfx.rlc.funcs->is_rlcg_access_range) {
>>>>>> @@ -465,6 +487,8 @@ void amdgpu_mm_wreg_mmio_rlc(struct amdgpu_device *adev,
>>>>>>        } else {
>>>>>>            writel(v, ((void __iomem *)adev->rmmio) + (reg * 4));
>>>>>>        }
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>>    }
>>>>>>      /**
>>>>>> @@ -499,15 +523,22 @@ u32 amdgpu_io_rreg(struct amdgpu_device *adev, u32 
>>>>>> reg)
>>>>>>     */
>>>>>>    void amdgpu_io_wreg(struct amdgpu_device *adev, u32 reg, u32 v)
>>>>>>    {
>>>>>> +    int idx;
>>>>>> +
>>>>>>        if (adev->in_pci_err_recovery)
>>>>>>            return;
>>>>>>    +    if (!drm_dev_enter(&adev->ddev, &idx))
>>>>>> +        return;
>>>>>> +
>>>>>>        if ((reg * 4) < adev->rio_mem_size)
>>>>>>            iowrite32(v, adev->rio_mem + (reg * 4));
>>>>>>        else {
>>>>>>            iowrite32((reg * 4), adev->rio_mem + (mmMM_INDEX * 4));
>>>>>>            iowrite32(v, adev->rio_mem + (mmMM_DATA * 4));
>>>>>>        }
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>>    }
>>>>>>      /**
>>>>>> @@ -544,14 +575,21 @@ u32 amdgpu_mm_rdoorbell(struct amdgpu_device *adev, 
>>>>>> u32
>>>>>> index)
>>>>>>     */
>>>>>>    void amdgpu_mm_wdoorbell(struct amdgpu_device *adev, u32 index, u32 v)
>>>>>>    {
>>>>>> +    int idx;
>>>>>> +
>>>>>>        if (adev->in_pci_err_recovery)
>>>>>>            return;
>>>>>>    +    if (!drm_dev_enter(&adev->ddev, &idx))
>>>>>> +        return;
>>>>>> +
>>>>>>        if (index < adev->doorbell.num_doorbells) {
>>>>>>            writel(v, adev->doorbell.ptr + index);
>>>>>>        } else {
>>>>>>            DRM_ERROR("writing beyond doorbell aperture: 0x%08x!\n", index);
>>>>>>        }
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>>    }
>>>>>>      /**
>>>>>> @@ -588,14 +626,21 @@ u64 amdgpu_mm_rdoorbell64(struct amdgpu_device *adev,
>>>>>> u32 index)
>>>>>>     */
>>>>>>    void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev, u32 index, u64 v)
>>>>>>    {
>>>>>> +    int idx;
>>>>>> +
>>>>>>        if (adev->in_pci_err_recovery)
>>>>>>            return;
>>>>>>    +    if (!drm_dev_enter(&adev->ddev, &idx))
>>>>>> +        return;
>>>>>> +
>>>>>>        if (index < adev->doorbell.num_doorbells) {
>>>>>>            atomic64_set((atomic64_t *)(adev->doorbell.ptr + index), v);
>>>>>>        } else {
>>>>>>            DRM_ERROR("writing beyond doorbell aperture: 0x%08x!\n", index);
>>>>>>        }
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>>    }
>>>>>>      /**
>>>>>> @@ -682,6 +727,10 @@ void amdgpu_device_indirect_wreg(struct amdgpu_device
>>>>>> *adev,
>>>>>>        unsigned long flags;
>>>>>>        void __iomem *pcie_index_offset;
>>>>>>        void __iomem *pcie_data_offset;
>>>>>> +    int idx;
>>>>>> +
>>>>>> +    if (!drm_dev_enter(&adev->ddev, &idx))
>>>>>> +        return;
>>>>>>          spin_lock_irqsave(&adev->pcie_idx_lock, flags);
>>>>>>        pcie_index_offset = (void __iomem *)adev->rmmio + pcie_index * 4;
>>>>>> @@ -692,6 +741,8 @@ void amdgpu_device_indirect_wreg(struct amdgpu_device 
>>>>>> *adev,
>>>>>>        writel(reg_data, pcie_data_offset);
>>>>>>        readl(pcie_data_offset);
>>>>>> spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>>    }
>>>>>>      /**
>>>>>> @@ -711,6 +762,10 @@ void amdgpu_device_indirect_wreg64(struct amdgpu_device
>>>>>> *adev,
>>>>>>        unsigned long flags;
>>>>>>        void __iomem *pcie_index_offset;
>>>>>>        void __iomem *pcie_data_offset;
>>>>>> +    int idx;
>>>>>> +
>>>>>> +    if (!drm_dev_enter(&adev->ddev, &idx))
>>>>>> +        return;
>>>>>>          spin_lock_irqsave(&adev->pcie_idx_lock, flags);
>>>>>>        pcie_index_offset = (void __iomem *)adev->rmmio + pcie_index * 4;
>>>>>> @@ -727,6 +782,8 @@ void amdgpu_device_indirect_wreg64(struct amdgpu_device
>>>>>> *adev,
>>>>>>        writel((u32)(reg_data >> 32), pcie_data_offset);
>>>>>>        readl(pcie_data_offset);
>>>>>> spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>>    }
>>>>>>      /**
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>>>>> index fe1a39f..1beb4e6 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>>>>> @@ -31,6 +31,8 @@
>>>>>>    #include "amdgpu_ras.h"
>>>>>>    #include "amdgpu_xgmi.h"
>>>>>>    +#include <drm/drm_drv.h>
>>>>>> +
>>>>>>    /**
>>>>>>     * amdgpu_gmc_get_pde_for_bo - get the PDE for a BO
>>>>>>     *
>>>>>> @@ -98,6 +100,10 @@ int amdgpu_gmc_set_pte_pde(struct amdgpu_device *adev,
>>>>>> void *cpu_pt_addr,
>>>>>>    {
>>>>>>        void __iomem *ptr = (void *)cpu_pt_addr;
>>>>>>        uint64_t value;
>>>>>> +    int idx;
>>>>>> +
>>>>>> +    if (!drm_dev_enter(&adev->ddev, &idx))
>>>>>> +        return 0;
>>>>>>          /*
>>>>>>         * The following is for PTE only. GART does not have PDEs.
>>>>>> @@ -105,6 +111,9 @@ int amdgpu_gmc_set_pte_pde(struct amdgpu_device *adev,
>>>>>> void *cpu_pt_addr,
>>>>>>        value = addr & 0x0000FFFFFFFFF000ULL;
>>>>>>        value |= flags;
>>>>>>        writeq(value, ptr + (gpu_page_idx * 8));
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>> +
>>>>>>        return 0;
>>>>>>    }
>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>>>>>> index 523d22d..89e2bfe 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>>>>>> @@ -37,6 +37,8 @@
>>>>>>      #include "amdgpu_ras.h"
>>>>>>    +#include <drm/drm_drv.h>
>>>>>> +
>>>>>>    static int psp_sysfs_init(struct amdgpu_device *adev);
>>>>>>    static void psp_sysfs_fini(struct amdgpu_device *adev);
>>>>>>    @@ -248,7 +250,7 @@ psp_cmd_submit_buf(struct psp_context *psp,
>>>>>>               struct psp_gfx_cmd_resp *cmd, uint64_t fence_mc_addr)
>>>>>>    {
>>>>>>        int ret;
>>>>>> -    int index;
>>>>>> +    int index, idx;
>>>>>>        int timeout = 2000;
>>>>>>        bool ras_intr = false;
>>>>>>        bool skip_unsupport = false;
>>>>>> @@ -256,6 +258,9 @@ psp_cmd_submit_buf(struct psp_context *psp,
>>>>>>        if (psp->adev->in_pci_err_recovery)
>>>>>>            return 0;
>>>>>>    +    if (!drm_dev_enter(&psp->adev->ddev, &idx))
>>>>>> +        return 0;
>>>>>> +
>>>>>>        mutex_lock(&psp->mutex);
>>>>>>          memset(psp->cmd_buf_mem, 0, PSP_CMD_BUFFER_SIZE);
>>>>>> @@ -266,8 +271,7 @@ psp_cmd_submit_buf(struct psp_context *psp,
>>>>>>        ret = psp_ring_cmd_submit(psp, psp->cmd_buf_mc_addr, fence_mc_addr,
>>>>>> index);
>>>>>>        if (ret) {
>>>>>>            atomic_dec(&psp->fence_value);
>>>>>> -        mutex_unlock(&psp->mutex);
>>>>>> -        return ret;
>>>>>> +        goto exit;
>>>>>>        }
>>>>>>          amdgpu_asic_invalidate_hdp(psp->adev, NULL);
>>>>>> @@ -307,8 +311,8 @@ psp_cmd_submit_buf(struct psp_context *psp,
>>>>>>                 psp->cmd_buf_mem->cmd_id,
>>>>>>                 psp->cmd_buf_mem->resp.status);
>>>>>>            if (!timeout) {
>>>>>> -            mutex_unlock(&psp->mutex);
>>>>>> -            return -EINVAL;
>>>>>> +            ret = -EINVAL;
>>>>>> +            goto exit;
>>>>>>            }
>>>>>>        }
>>>>>>    @@ -316,8 +320,10 @@ psp_cmd_submit_buf(struct psp_context *psp,
>>>>>>            ucode->tmr_mc_addr_lo = psp->cmd_buf_mem->resp.fw_addr_lo;
>>>>>>            ucode->tmr_mc_addr_hi = psp->cmd_buf_mem->resp.fw_addr_hi;
>>>>>>        }
>>>>>> -    mutex_unlock(&psp->mutex);
>>>>>>    +exit:
>>>>>> +    mutex_unlock(&psp->mutex);
>>>>>> +    drm_dev_exit(idx);
>>>>>>        return ret;
>>>>>>    }
>>>>>>    @@ -354,8 +360,7 @@ static int psp_load_toc(struct psp_context *psp,
>>>>>>        if (!cmd)
>>>>>>            return -ENOMEM;
>>>>>>        /* Copy toc to psp firmware private buffer */
>>>>>> -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -    memcpy(psp->fw_pri_buf, psp->toc_start_addr, psp->toc_bin_size);
>>>>>> +    psp_copy_fw(psp, psp->toc_start_addr, psp->toc_bin_size);
>>>>>>          psp_prep_load_toc_cmd_buf(cmd, psp->fw_pri_mc_addr, 
>>>>>> psp->toc_bin_size);
>>>>>>    @@ -570,8 +575,7 @@ static int psp_asd_load(struct psp_context *psp)
>>>>>>        if (!cmd)
>>>>>>            return -ENOMEM;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -    memcpy(psp->fw_pri_buf, psp->asd_start_addr, psp->asd_ucode_size);
>>>>>> +    psp_copy_fw(psp, psp->asd_start_addr, psp->asd_ucode_size);
>>>>>>          psp_prep_asd_load_cmd_buf(cmd, psp->fw_pri_mc_addr,
>>>>>>                      psp->asd_ucode_size);
>>>>>> @@ -726,8 +730,7 @@ static int psp_xgmi_load(struct psp_context *psp)
>>>>>>        if (!cmd)
>>>>>>            return -ENOMEM;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -    memcpy(psp->fw_pri_buf, psp->ta_xgmi_start_addr, 
>>>>>> psp->ta_xgmi_ucode_size);
>>>>>> +    psp_copy_fw(psp, psp->ta_xgmi_start_addr, psp->ta_xgmi_ucode_size);
>>>>>>          psp_prep_ta_load_cmd_buf(cmd,
>>>>>>                     psp->fw_pri_mc_addr,
>>>>>> @@ -982,8 +985,7 @@ static int psp_ras_load(struct psp_context *psp)
>>>>>>        if (!cmd)
>>>>>>            return -ENOMEM;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -    memcpy(psp->fw_pri_buf, psp->ta_ras_start_addr, 
>>>>>> psp->ta_ras_ucode_size);
>>>>>> +    psp_copy_fw(psp, psp->ta_ras_start_addr, psp->ta_ras_ucode_size);
>>>>>>          psp_prep_ta_load_cmd_buf(cmd,
>>>>>>                     psp->fw_pri_mc_addr,
>>>>>> @@ -1219,8 +1221,7 @@ static int psp_hdcp_load(struct psp_context *psp)
>>>>>>        if (!cmd)
>>>>>>            return -ENOMEM;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -    memcpy(psp->fw_pri_buf, psp->ta_hdcp_start_addr,
>>>>>> +    psp_copy_fw(psp, psp->ta_hdcp_start_addr,
>>>>>>               psp->ta_hdcp_ucode_size);
>>>>>>          psp_prep_ta_load_cmd_buf(cmd,
>>>>>> @@ -1366,8 +1367,7 @@ static int psp_dtm_load(struct psp_context *psp)
>>>>>>        if (!cmd)
>>>>>>            return -ENOMEM;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -    memcpy(psp->fw_pri_buf, psp->ta_dtm_start_addr, 
>>>>>> psp->ta_dtm_ucode_size);
>>>>>> +    psp_copy_fw(psp, psp->ta_dtm_start_addr, psp->ta_dtm_ucode_size);
>>>>>>          psp_prep_ta_load_cmd_buf(cmd,
>>>>>>                     psp->fw_pri_mc_addr,
>>>>>> @@ -1507,8 +1507,7 @@ static int psp_rap_load(struct psp_context *psp)
>>>>>>        if (!cmd)
>>>>>>            return -ENOMEM;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -    memcpy(psp->fw_pri_buf, psp->ta_rap_start_addr, 
>>>>>> psp->ta_rap_ucode_size);
>>>>>> +    psp_copy_fw(psp, psp->ta_rap_start_addr, psp->ta_rap_ucode_size);
>>>>>>          psp_prep_ta_load_cmd_buf(cmd,
>>>>>>                     psp->fw_pri_mc_addr,
>>>>>> @@ -2778,6 +2777,20 @@ static ssize_t psp_usbc_pd_fw_sysfs_write(struct
>>>>>> device *dev,
>>>>>>        return count;
>>>>>>    }
>>>>>>    +void psp_copy_fw(struct psp_context *psp, uint8_t *start_addr, uint32_t
>>>>>> bin_size)
>>>>>> +{
>>>>>> +    int idx;
>>>>>> +
>>>>>> +    if (!drm_dev_enter(&psp->adev->ddev, &idx))
>>>>>> +        return;
>>>>>> +
>>>>>> +    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> +    memcpy(psp->fw_pri_buf, start_addr, bin_size);
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>> +}
>>>>>> +
>>>>>> +
>>>>>>    static DEVICE_ATTR(usbc_pd_fw, S_IRUGO | S_IWUSR,
>>>>>>               psp_usbc_pd_fw_sysfs_read,
>>>>>>               psp_usbc_pd_fw_sysfs_write);
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
>>>>>> index da250bc..ac69314 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
>>>>>> @@ -400,4 +400,7 @@ int psp_init_ta_microcode(struct psp_context *psp,
>>>>>>                  const char *chip_name);
>>>>>>    int psp_get_fw_attestation_records_addr(struct psp_context *psp,
>>>>>>                        uint64_t *output_ptr);
>>>>>> +
>>>>>> +void psp_copy_fw(struct psp_context *psp, uint8_t *start_addr, uint32_t
>>>>>> bin_size);
>>>>>> +
>>>>>>    #endif
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
>>>>>> index 1a612f5..d656494 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
>>>>>> @@ -35,6 +35,8 @@
>>>>>>    #include "amdgpu.h"
>>>>>>    #include "atom.h"
>>>>>>    +#include <drm/drm_drv.h>
>>>>>> +
>>>>>>    /*
>>>>>>     * Rings
>>>>>>     * Most engines on the GPU are fed via ring buffers. Ring
>>>>>> @@ -463,3 +465,71 @@ int amdgpu_ring_test_helper(struct amdgpu_ring *ring)
>>>>>>        ring->sched.ready = !r;
>>>>>>        return r;
>>>>>>    }
>>>>>> +
>>>>>> +void amdgpu_ring_clear_ring(struct amdgpu_ring *ring)
>>>>>> +{
>>>>>> +    int idx;
>>>>>> +    int i = 0;
>>>>>> +
>>>>>> +    if (!drm_dev_enter(&ring->adev->ddev, &idx))
>>>>>> +        return;
>>>>>> +
>>>>>> +    while (i <= ring->buf_mask)
>>>>>> +        ring->ring[i++] = ring->funcs->nop;
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>> +
>>>>>> +}
>>>>>> +
>>>>>> +void amdgpu_ring_write(struct amdgpu_ring *ring, uint32_t v)
>>>>>> +{
>>>>>> +    int idx;
>>>>>> +
>>>>>> +    if (!drm_dev_enter(&ring->adev->ddev, &idx))
>>>>>> +        return;
>>>>>> +
>>>>>> +    if (ring->count_dw <= 0)
>>>>>> +        DRM_ERROR("amdgpu: writing more dwords to the ring than 
>>>>>> expected!\n");
>>>>>> +    ring->ring[ring->wptr++ & ring->buf_mask] = v;
>>>>>> +    ring->wptr &= ring->ptr_mask;
>>>>>> +    ring->count_dw--;
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>> +}
>>>>>> +
>>>>>> +void amdgpu_ring_write_multiple(struct amdgpu_ring *ring,
>>>>>> +                          void *src, int count_dw)
>>>>>> +{
>>>>>> +    unsigned occupied, chunk1, chunk2;
>>>>>> +    void *dst;
>>>>>> +    int idx;
>>>>>> +
>>>>>> +    if (!drm_dev_enter(&ring->adev->ddev, &idx))
>>>>>> +        return;
>>>>>> +
>>>>>> +    if (unlikely(ring->count_dw < count_dw))
>>>>>> +        DRM_ERROR("amdgpu: writing more dwords to the ring than 
>>>>>> expected!\n");
>>>>>> +
>>>>>> +    occupied = ring->wptr & ring->buf_mask;
>>>>>> +    dst = (void *)&ring->ring[occupied];
>>>>>> +    chunk1 = ring->buf_mask + 1 - occupied;
>>>>>> +    chunk1 = (chunk1 >= count_dw) ? count_dw: chunk1;
>>>>>> +    chunk2 = count_dw - chunk1;
>>>>>> +    chunk1 <<= 2;
>>>>>> +    chunk2 <<= 2;
>>>>>> +
>>>>>> +    if (chunk1)
>>>>>> +        memcpy(dst, src, chunk1);
>>>>>> +
>>>>>> +    if (chunk2) {
>>>>>> +        src += chunk1;
>>>>>> +        dst = (void *)ring->ring;
>>>>>> +        memcpy(dst, src, chunk2);
>>>>>> +    }
>>>>>> +
>>>>>> +    ring->wptr += count_dw;
>>>>>> +    ring->wptr &= ring->ptr_mask;
>>>>>> +    ring->count_dw -= count_dw;
>>>>>> +
>>>>>> +    drm_dev_exit(idx);
>>>>>> +}
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>>>> index accb243..f90b81f 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>>>> @@ -300,53 +300,12 @@ static inline void
>>>>>> amdgpu_ring_set_preempt_cond_exec(struct amdgpu_ring *ring,
>>>>>>        *ring->cond_exe_cpu_addr = cond_exec;
>>>>>>    }
>>>>>>    -static inline void amdgpu_ring_clear_ring(struct amdgpu_ring *ring)
>>>>>> -{
>>>>>> -    int i = 0;
>>>>>> -    while (i <= ring->buf_mask)
>>>>>> -        ring->ring[i++] = ring->funcs->nop;
>>>>>> -
>>>>>> -}
>>>>>> -
>>>>>> -static inline void amdgpu_ring_write(struct amdgpu_ring *ring, uint32_t v)
>>>>>> -{
>>>>>> -    if (ring->count_dw <= 0)
>>>>>> -        DRM_ERROR("amdgpu: writing more dwords to the ring than 
>>>>>> expected!\n");
>>>>>> -    ring->ring[ring->wptr++ & ring->buf_mask] = v;
>>>>>> -    ring->wptr &= ring->ptr_mask;
>>>>>> -    ring->count_dw--;
>>>>>> -}
>>>>>> +void amdgpu_ring_clear_ring(struct amdgpu_ring *ring);
>>>>>>    -static inline void amdgpu_ring_write_multiple(struct amdgpu_ring *ring,
>>>>>> -                          void *src, int count_dw)
>>>>>> -{
>>>>>> -    unsigned occupied, chunk1, chunk2;
>>>>>> -    void *dst;
>>>>>> -
>>>>>> -    if (unlikely(ring->count_dw < count_dw))
>>>>>> -        DRM_ERROR("amdgpu: writing more dwords to the ring than 
>>>>>> expected!\n");
>>>>>> -
>>>>>> -    occupied = ring->wptr & ring->buf_mask;
>>>>>> -    dst = (void *)&ring->ring[occupied];
>>>>>> -    chunk1 = ring->buf_mask + 1 - occupied;
>>>>>> -    chunk1 = (chunk1 >= count_dw) ? count_dw: chunk1;
>>>>>> -    chunk2 = count_dw - chunk1;
>>>>>> -    chunk1 <<= 2;
>>>>>> -    chunk2 <<= 2;
>>>>>> +void amdgpu_ring_write(struct amdgpu_ring *ring, uint32_t v);
>>>>>>    -    if (chunk1)
>>>>>> -        memcpy(dst, src, chunk1);
>>>>>> -
>>>>>> -    if (chunk2) {
>>>>>> -        src += chunk1;
>>>>>> -        dst = (void *)ring->ring;
>>>>>> -        memcpy(dst, src, chunk2);
>>>>>> -    }
>>>>>> -
>>>>>> -    ring->wptr += count_dw;
>>>>>> -    ring->wptr &= ring->ptr_mask;
>>>>>> -    ring->count_dw -= count_dw;
>>>>>> -}
>>>>>> +void amdgpu_ring_write_multiple(struct amdgpu_ring *ring,
>>>>>> +                          void *src, int count_dw);
>>>>>>      int amdgpu_ring_test_helper(struct amdgpu_ring *ring);
>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>>>>>> index bd4248c..b3ce5be 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
>>>>>> @@ -269,10 +269,8 @@ static int psp_v11_0_bootloader_load_kdb(struct
>>>>>> psp_context *psp)
>>>>>>        if (ret)
>>>>>>            return ret;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -
>>>>>>        /* Copy PSP KDB binary to memory */
>>>>>> -    memcpy(psp->fw_pri_buf, psp->kdb_start_addr, psp->kdb_bin_size);
>>>>>> +    psp_copy_fw(psp, psp->kdb_start_addr, psp->kdb_bin_size);
>>>>>>          /* Provide the PSP KDB to bootloader */
>>>>>>        WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>>>>>> @@ -302,10 +300,8 @@ static int psp_v11_0_bootloader_load_spl(struct
>>>>>> psp_context *psp)
>>>>>>        if (ret)
>>>>>>            return ret;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -
>>>>>>        /* Copy PSP SPL binary to memory */
>>>>>> -    memcpy(psp->fw_pri_buf, psp->spl_start_addr, psp->spl_bin_size);
>>>>>> +    psp_copy_fw(psp, psp->spl_start_addr, psp->spl_bin_size);
>>>>>>          /* Provide the PSP SPL to bootloader */
>>>>>>        WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>>>>>> @@ -335,10 +331,8 @@ static int psp_v11_0_bootloader_load_sysdrv(struct
>>>>>> psp_context *psp)
>>>>>>        if (ret)
>>>>>>            return ret;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -
>>>>>>        /* Copy PSP System Driver binary to memory */
>>>>>> -    memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
>>>>>> +    psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
>>>>>>          /* Provide the sys driver to bootloader */
>>>>>>        WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>>>>>> @@ -371,10 +365,8 @@ static int psp_v11_0_bootloader_load_sos(struct
>>>>>> psp_context *psp)
>>>>>>        if (ret)
>>>>>>            return ret;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -
>>>>>>        /* Copy Secure OS binary to PSP memory */
>>>>>> -    memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
>>>>>> +    psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
>>>>>>          /* Provide the PSP secure OS to bootloader */
>>>>>>        WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
>>>>>> index c4828bd..618e5b6 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
>>>>>> @@ -138,10 +138,8 @@ static int psp_v12_0_bootloader_load_sysdrv(struct
>>>>>> psp_context *psp)
>>>>>>        if (ret)
>>>>>>            return ret;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -
>>>>>>        /* Copy PSP System Driver binary to memory */
>>>>>> -    memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
>>>>>> +    psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
>>>>>>          /* Provide the sys driver to bootloader */
>>>>>>        WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>>>>>> @@ -179,10 +177,8 @@ static int psp_v12_0_bootloader_load_sos(struct
>>>>>> psp_context *psp)
>>>>>>        if (ret)
>>>>>>            return ret;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -
>>>>>>        /* Copy Secure OS binary to PSP memory */
>>>>>> -    memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
>>>>>> +    psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
>>>>>>          /* Provide the PSP secure OS to bootloader */
>>>>>>        WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
>>>>>> index f2e725f..d0a6cccd 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
>>>>>> @@ -102,10 +102,8 @@ static int psp_v3_1_bootloader_load_sysdrv(struct
>>>>>> psp_context *psp)
>>>>>>        if (ret)
>>>>>>            return ret;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -
>>>>>>        /* Copy PSP System Driver binary to memory */
>>>>>> -    memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
>>>>>> +    psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
>>>>>>          /* Provide the sys driver to bootloader */
>>>>>>        WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>>>>>> @@ -143,10 +141,8 @@ static int psp_v3_1_bootloader_load_sos(struct
>>>>>> psp_context *psp)
>>>>>>        if (ret)
>>>>>>            return ret;
>>>>>>    -    memset(psp->fw_pri_buf, 0, PSP_1_MEG);
>>>>>> -
>>>>>>        /* Copy Secure OS binary to PSP memory */
>>>>>> -    memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
>>>>>> +    psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
>>>>>>          /* Provide the PSP secure OS to bootloader */
>>>>>>        WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
>>>
>>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Cee61fb937d2d4baedf6f08d8bcac5b02%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466795752297305%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=a5MkPkwHh7WkR24K9EoCWSKPdCpiXCJH6RwGbGyhHyA%3D&amp;reserved=0 
>>
>

--------------A75547600663D07071CF0503
Content-Type: text/x-log; charset=UTF-8;
 name="results.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="results.log"

with drm_dev_enter


[   20.606168 <    0.053014>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   20.914669 <    0.308501>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   20.914857 <    0.000188>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   21.224795 <    0.309938>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   21.224986 <    0.000191>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   21.533422 <    0.308436>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   21.843633 <    0.000164>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   22.152756 <    0.309123>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   22.152934 <    0.000178>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   22.462544 <    0.309610>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   22.462721 <    0.000177>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   22.771921 <    0.309200>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   22.772128 <    0.000207>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   23.081148 <    0.309020>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   23.081331 <    0.000183>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   23.391600 <    0.310269>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   23.391783 <    0.000183>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   23.702026 <    0.310243>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register




[   25.330532 <    0.000112>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   25.642806 <    0.312274>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   25.643123 <    0.000317>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   25.954685 <    0.311562>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   25.954906 <    0.000221>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   26.266457 <    0.311551>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   26.266675 <    0.000218>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   26.579848 <    0.313173>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   26.580066 <    0.000218>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   26.891740 <    0.311674>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   26.891958 <    0.000218>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   27.203947 <    0.311989>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   27.204166 <    0.000219>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   27.516040 <    0.311874>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   27.516265 <    0.000225>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   27.828137 <    0.311872>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   27.828356 <    0.000219>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   28.140182 <    0.311826>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   28.140395 <    0.000213>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   28.452405 <    0.312010>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register

without drm_dev_enter


[   28.519096 <    0.049775>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   28.728785 <    0.209689>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   28.728946 <    0.000161>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   28.938814 <    0.209868>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   28.938979 <    0.000165>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   29.148659 <    0.209680>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   29.148809 <    0.000150>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   29.358514 <    0.209705>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   29.358664 <    0.000150>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   29.568358 <    0.209694>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   29.568508 <    0.000150>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   29.778389 <    0.209881>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   29.778539 <    0.000150>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   29.988240 <    0.209701>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   29.988391 <    0.000151>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   30.198077 <    0.209686>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   30.198228 <    0.000151>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   30.407928 <    0.209700>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   30.408079 <    0.000151>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   30.617796 <    0.209717>] [drm:gfx_v8_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register





[   32.222242 <    0.000086>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   32.431423 <    0.209181>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   32.431834 <    0.000411>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   32.641075 <    0.209241>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   32.641268 <    0.000193>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   32.850482 <    0.209214>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   32.850671 <    0.000189>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   33.059900 <    0.209229>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   33.060092 <    0.000192>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   33.269336 <    0.209244>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   33.269526 <    0.000190>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   33.478741 <    0.209215>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   33.478931 <    0.000190>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   33.688259 <    0.209328>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   33.688449 <    0.000190>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   33.897756 <    0.209307>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   33.897946 <    0.000190>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   34.107256 <    0.209310>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register
[   34.107445 <    0.000189>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* Before write 1M times to scratch register
[   34.316758 <    0.209313>] [drm:gfx_v9_0_ring_test_ring [amdgpu]] *ERROR* After write 1M times to scratch register


--------------A75547600663D07071CF0503
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------A75547600663D07071CF0503--
