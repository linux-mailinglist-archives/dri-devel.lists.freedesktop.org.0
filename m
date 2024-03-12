Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3762879249
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 11:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA7210EFEE;
	Tue, 12 Mar 2024 10:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pz3G1f/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C865410EFEE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:37:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2oEQh6rp/c5EozOijyP/b3k58Lf5+4FxV0FTQeY3n05RYJLiea9/C1bBHNoXG6XmjBZJt2aKRN+SUkOdyBaYVjICcktL3TyoQYaKuBHdy8i5fcmqJR+YPCJpf0g1DPIldE+90MWjVdSEEu4tATBPZSdrJQmdWnB2pHtguK7ujZB+23W7fNpUqa/pN66RRBdCgrs1ZLQvEPsWorLE7THp/OArd7wFIlaVFyZArVaL9ks6R//y+mlAGW6v90mL6zBimIxCqhxXOQYBlt9FqWMid/15hsDCu141sPCqng5fnOdCC+QMhF6f8SKJ/uNMC6eOJII5XlA0DNNRlckUKoPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2z4a4QZSSrLhLtwBQXOtpnm7jrtonzlJx0OCbjS4os=;
 b=AdH5jqxNvY+9iI61ZDMMM/uTdz5zr4TxdDCOPfU+DdY75rznpkWvVdXEzwxU507NVF6V/y4LZY4As/rsFEubpINjtC1EGS++n8uoBuGYpuueIcEaFnX3HOZOcFMuXx0kJmtGuSkGIr96bZ/BYDSXk/XJ/W8qbEzORNDCmabzhsEXwMQXrDNJdlJ0SlgsC8Sjpx+KJj5/gXTzT5PyM/t1jMAp5aekLcWTIGX27RagtUe17BfbnJq+vpbiFXsCT36lTjLOnpgA8M2rvzZMzqQzgyc7N1ZkH+IR/OhcIzjQhC6BYNQZG/1ON6a0RhBmH4kZ7gst99ByURQrTJ6vK8dHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2z4a4QZSSrLhLtwBQXOtpnm7jrtonzlJx0OCbjS4os=;
 b=pz3G1f/R0hDgTKgxXuWA2yrzUcIxItICOf0VbylIRfxsZvkIYJ6n/RTEY3qE/CFhDYMxSxPq6wCr/O/U2Wdw1qjMk6rN12WExBa2h8eSqRw5nluaeZT2RYj3YanmbsVOPnj3GjTPbf5uCnbtBGVcwI73ucwzIKJtgUbIOw+lrV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9249.namprd12.prod.outlook.com (2603:10b6:610:1bc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 10:37:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.031; Tue, 12 Mar 2024
 10:37:42 +0000
Message-ID: <69576e6d-9704-42b9-905f-289f9f9017b9@amd.com>
Date: Tue, 12 Mar 2024 11:37:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/gem: Add a mountpoint parameter to
 drm_gem_object_init()
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Russell King <linux@armlinux.org.uk>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-3-mcanal@igalia.com>
 <30a7f20b-1f2c-41cb-b193-03429c160b63@igalia.com>
 <3a5d07c0-120f-47f9-a35a-31f3bfcc9330@amd.com>
 <07885e3b-ee7b-456b-9fad-17d9009a4cb7@igalia.com>
 <a0ac2e10-f5f5-4fbb-b591-bd188967ce53@amd.com>
 <e8165baa-9ded-4149-aaa6-6713d112b621@igalia.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e8165baa-9ded-4149-aaa6-6713d112b621@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0269.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c80bc6-3586-4e12-0a0c-08dc42807262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KLchal3ql24UB2rwt8sc06xMP4tMZORkniA5XxQnhm+tZwpYHmQCxf/jDjzvHjMuvQdQvCB1FvxRX7Uj2CU+927DZqGhw5efvPuc/upQqSkjcdz1eSRX3rQiDTeYIYMFrdiaLh6BmnH/r2RBKswve26dLqFvHplMTvPEFOHmvEcXWaU10wMldH5W4cmyXbv8FWoLfPRXDFI2TXIO8dy6/CjzPex0rT9eN/+iMUBCJkifJX2I9yzWb7cwDg6w7iREJJmvuCRNDQIiDAyu+qNbdjTaWw4bBNPT/Qeem8UszLOQo9OX6pd2GXIXW0vImKHYoBgZo/LX6OtSJTI5duXSNCU8eX4kxFwV/qMc66BqLFz/DCUhpwHNeKXEB40weOoRpbTSMTz4Dr7PVVCjwJyuTOIn6uEIQ8gKHUsT8Qeqr/HPbhiGIBFKzDa1tukE2bXl+9Vxp4atsX8BTeoAQBu36yZZF8Nipr9gpz86FekjEEQ/Rs4xb3BYyScpGxT1MeLOC/LpXt+uv7TcDL1aF8nFT65NOvBdm3gSsQDIhxKLZMGmq5vucUyFgc0hY+WwAiNf+uy9u1IF9EI+m2dXbaPxCG2LjI+Xx3G/s68FjzFp8cor1sidqor6kEdOh/4ap+IwFpKp9OO2x96E7FrFbgF2QjcAaz7I7HEPF4i5WbHkBZc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkViNnhkZnpoRGIvbzM3ZXZSMmR3NHF6UzBvckcxZkxUQ2pLTWdGZ0p1VjE3?=
 =?utf-8?B?RFN5RlZ4YWZZbnB2TE5SVy96aVkzL2EvMzA4ZHpnelE1NVJZNEhVWldHbkM5?=
 =?utf-8?B?eFJEZWl5Qk1KZGZLcDBPS1NsTHV6NWdxRXNtN202OHBDWWIraEJWamFoeTFq?=
 =?utf-8?B?WGlTc1o0aURzZHVkZURwNXl4STk3OHdGZEV6cTcwaFAvSXcwUS9Bb2JxRU9y?=
 =?utf-8?B?K1BXdDFsdmJpNVR3T3gxd1U5dVdWOGFpU2ZBN055R3FOL3FKL2RPR1BhMVB5?=
 =?utf-8?B?T0JoU0JBT0hRZWxwdFJPcXNvc3RkYUx1OXFpaXNBTjJ6ZnJLVHlqOWQxRWQw?=
 =?utf-8?B?MXl0WFhRWEtYdk1mc2l0Tmd0UDdpd1BIZ1VZSk54SXpjTkdGVUwvQVQ3WUVC?=
 =?utf-8?B?U3VWT0haYnQ1RTRrYTRqL1dWNU5lMVk1ZVpySVpGdmNta0R6MHlrU3djM1dT?=
 =?utf-8?B?eEVJWTBJaHd5aWhEbUxzOUxsMjBleVRkUGR6c0JsaVhVTFZWYXM1aXBVNjVC?=
 =?utf-8?B?cDVJLzRDVWJZYlRmSDB4TlBKRlRpWmFFUUN5dURTOVExaUY5OHJtVm03M2Zt?=
 =?utf-8?B?S3NzUUM4QUZxQzZGQXduNTJWbHVtUW1abXFCNHlQbzhpb29qVDJ1aEJUdDdl?=
 =?utf-8?B?UjJrNG8xdHhvWGRFY3RRdklxSkpiUnhzYkhtcG1DTStsWWNUZWZ4dTRiWVZ4?=
 =?utf-8?B?Ui9xeXM1Z3FkVU9TeXNWbnBpYnFpSEdRSk5ydTFVb0d4VWpBVjhlS0pFYm5V?=
 =?utf-8?B?UlFBSkd6MVdPSVNvNERoQlV5cmM1M2tQVEtNZFRycEVVSzV1ZUlxWFpyZi9W?=
 =?utf-8?B?MkxhK0w1TTFsQ042NW1ZNjRLeW41NS96NitkLzdQalBrM0ZyemY1bGhnOVIr?=
 =?utf-8?B?VU9YZXZKWE5ZWXVMa0NJWFVCVHlEMXVRdThWQ052UG1HT29pWUZ3cnhRVmJz?=
 =?utf-8?B?R3dFQVp5bTNqVUVza21ZNGpwVmdaODlHR2xnWncwYWhTUkVNcnZCcFE0dUVD?=
 =?utf-8?B?VTVXa1d0WTNCdFluVkMvUnJNQnlFS0hSUGNLY2Jnem85NjFPUkxrRk4wRWY3?=
 =?utf-8?B?N0tTczlqbExPZ0Rsb0VLUmhkbTFuaWZ4K0phaVl5SDFXbUllSStsM2s4U2Fr?=
 =?utf-8?B?Ky9Yd2FHdThKQWpyRWw4dkFqaFdsVFZpUEZxbUdGZWozMnFFb1UwdmJoUU5z?=
 =?utf-8?B?QW1OUUJKVDFHY2owRzBWMGZscDFLc1hJREdZbGtPd0llNnowbmlrUWVwcUJh?=
 =?utf-8?B?SGxRbklOb2dvMmVQRXlKOFJCKy9YZkcyeTlXSzNaY0cvTzdDSzNvbTBRT2RV?=
 =?utf-8?B?alJPQW4rV1VtVlpBSUFtdUhoWE1XVm55ZnB5MVhiRHc4LzRRL3BCWk4yTFdx?=
 =?utf-8?B?dTFDd2piQkdOM1JUN2JCZVp3bG9XV0YzYlM5QmJCTjQvSmhEQVlFNDN0UUZ1?=
 =?utf-8?B?REdOb1h0bkptMVJzaVpodGlra2QxbGIvQ1V2dUdLaWZDQmRjSE96bnQ1Z0xm?=
 =?utf-8?B?YW9xWHB4OWFOcmhhSXc2cHM1NHFQY2FKVnpwZlhCSzdUUzg1ZVVaNXdHdEhK?=
 =?utf-8?B?MUtOWExhL0M1eWRtNVhGM1A3L2JpSjlId0NMLzZmY0lINW1tVkk3dGJ1OEFE?=
 =?utf-8?B?eHkzQ2tac1pOaklvNngwVDJTMlZtb2wybDQ3SU4yamV2b2FPQlNCSEIrS0h1?=
 =?utf-8?B?cWxOTGFhd1ZIQStuOWhjbnMvTWdqT1JqNVlueWoxc3ZxeThhNUVxdnZkeDNi?=
 =?utf-8?B?bWFIUUg1VS8ySmFJQXM1azVqWFhpdTU0MVBKeXpaQWRlR3JMbVlOOHVhKzRU?=
 =?utf-8?B?amJCV29hTTVXQUl5b0lWRTdzZU1rWnRmc215TTVyZGhXSFduNko5bVdrZ20z?=
 =?utf-8?B?S1l0U2JveDhHaE12eUFzTldUdTBySk9KcmFhblh6V2VUZkxaVTJrcHRlL3Er?=
 =?utf-8?B?aVhQRlNXYTM1UVlseVpaY0Y2Sk5pc2JJUDBpY3BkQWpGOCttU2szRUYxVnBU?=
 =?utf-8?B?YjJjaDIyY3FRaXBhUTJCcGg0OXRBYkFTWjNHaUJrTHdJQ2Fxa2NqM0o5S0pY?=
 =?utf-8?B?V1U0c2wxWm9vN2NpM3RZa0NwZzAzaE9FNUwxM0txNmdhY1ZTZmQrZDBTK2JI?=
 =?utf-8?Q?4adpuvJFCvidqcNxLqn3hbqrL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c80bc6-3586-4e12-0a0c-08dc42807262
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 10:37:42.3366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCjNf9wS3/3n1Jd8HXkwStMS9U3fkBkKCixsjr8gekU53yYllhCZ+tqeAs+SYvb4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9249
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

Am 12.03.24 um 11:31 schrieb Tvrtko Ursulin:
>
> On 12/03/2024 10:23, Christian König wrote:
>> Am 12.03.24 um 10:30 schrieb Tvrtko Ursulin:
>>>
>>> On 12/03/2024 08:59, Christian König wrote:
>>>> Am 12.03.24 um 09:51 schrieb Tvrtko Ursulin:
>>>>>
>>>>> Hi Maira,
>>>>>
>>>>> On 11/03/2024 10:05, Maíra Canal wrote:
>>>>>> For some applications, such as using huge pages, we might want to 
>>>>>> have a
>>>>>> different mountpoint, for which we pass in mount flags that 
>>>>>> better match
>>>>>> our usecase.
>>>>>>
>>>>>> Therefore, add a new parameter to drm_gem_object_init() that 
>>>>>> allow us to
>>>>>> define the tmpfs mountpoint where the GEM object will be created. If
>>>>>> this parameter is NULL, then we fallback to shmem_file_setup().
>>>>>
>>>>> One strategy for reducing churn, and so the number of drivers this 
>>>>> patch touches, could be to add a lower level drm_gem_object_init() 
>>>>> (which takes vfsmount, call it __drm_gem_object_init(), or 
>>>>> drm__gem_object_init_mnt(), and make drm_gem_object_init() call 
>>>>> that one with a NULL argument.
>>>>
>>>> I would even go a step further into the other direction. The shmem 
>>>> backed GEM object is just some special handling as far as I can see.
>>>>
>>>> So I would rather suggest to rename all drm_gem_* function which 
>>>> only deal with the shmem backed GEM object into drm_gem_shmem_*.
>>>
>>> That makes sense although it would be very churny. I at least would 
>>> be on the fence regarding the cost vs benefit.
>>
>> Yeah, it should clearly not be part of this patch here.
>>
>>>
>>>> Also the explanation why a different mount point helps with 
>>>> something isn't very satisfying.
>>>
>>> Not satisfying as you think it is not detailed enough to say driver 
>>> wants to use huge pages for performance? Or not satisying as you 
>>> question why huge pages would help?
>>
>> That huge pages are beneficial is clear to me, but I'm missing the 
>> connection why a different mount point helps with using huge pages.
>
> Ah right, same as in i915, one needs to mount a tmpfs instance passing 
> huge=within_size or huge=always option. Default is 'never', see man 5 
> tmpfs.

Thanks for the explanation, I wasn't aware of that.

Mhm, shouldn't we always use huge pages? Is there a reason for a DRM 
device to not use huge pages with the shmem backend?

I mean it would make this patch here even smaller.

Regards,
Christian.

>
>
> Regards,
>
> Tvrtko

