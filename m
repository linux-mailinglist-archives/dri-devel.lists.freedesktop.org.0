Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F087EA89
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 15:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C9910F79C;
	Mon, 18 Mar 2024 14:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JNk9FT5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C784D10F79C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 14:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtwddgOnzMSTiNZxCUAXpy9NLr3JerhulCmMExxg17z0T6jBP+9qMFrpD56+iDXuFveZGrpFcrz55ZVVHPF4XF9YIv8+WfEHOGznv3De9b7/Zf5FtI3c8xQVDezYpG69FNZPP/pxciaohPyVzFAEs1KkDmF4j6RznNj5UKcEpmupGlJ0N8DOy/6oq4S2hyf3M7q+SD/6wzR0l/WFO8sFqv1vqckr9l6FQaP80CkziIaWjtnNycJKb2g2ajDv7ypGf3clBPXwjYSKgghQ12iFfy/BGZi6GCU86zrGAeTEuMip9yMTg24iL/9r09gxDrFlCdxqm5koEC7aoOC+5elQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjYl7EYmMavhO3Rptsl+p3pNeGQFBT8QT0jBM93UVKI=;
 b=Fk0W6rPHSFvkKxoeyGilQ1aRDDulrOksMRmFNaVtAntj8kyvWIFr+2wLDnVeNZiMTK4nvc0IeFgsf6vvCryW3NqI5joQ6Tzft46ia/i9cDm328wUy55/jFwK5aBtLeX1EZj71kwKv6/vAkiAIowTDiazOhc2okNelQEKC3XeIN77WclSHfQ1y0lmEDZAZRZ9JVoehZDpzRS50NE43dbh1Q9FAwKTBSid4eOwNB41Dez+2xzodKotCJq9AEZfbBNyRiGNaXtg0ix/YbFtVqzVoQQaaR2L9+73lGZEhAJFgJh8lPEORBKnr22rmjqm7xjnmjju79trFFh8OF8XNH6Ivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjYl7EYmMavhO3Rptsl+p3pNeGQFBT8QT0jBM93UVKI=;
 b=JNk9FT5qtt4lKsjnmltNDVv7MEI70dzvqfBVD5JiW5AeThxXsl8NjlNwhLR4YNQ6I8fjU9ul8WZYjMEqFg5ngP/kgrRfbBVkFm46IHLsU2fiTU+eL/Caxuv/OqPbqpQpWMNHPkfszYqD+SEfvYCjAgqdqTdeP6aDyPZzD4MriNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4182.namprd12.prod.outlook.com (2603:10b6:610:ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Mon, 18 Mar
 2024 14:05:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7386.023; Mon, 18 Mar 2024
 14:05:09 +0000
Message-ID: <5f1a758b-b4f6-4fc3-b16b-29d731415636@amd.com>
Date: Mon, 18 Mar 2024 15:04:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/gem: Add a mountpoint parameter to
 drm_gem_object_init()
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>,
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
 <69576e6d-9704-42b9-905f-289f9f9017b9@amd.com>
 <ed7ecd56-0b5e-4543-80f6-7d28ddf8e2ec@igalia.com>
 <9cfb7f83-2d76-4e8d-9052-5975da71e0dc@amd.com>
 <2118492c-f223-41e9-8c1e-3c03d976301e@igalia.com>
 <68452c6c-12d7-4e60-9598-369acc9fc360@amd.com>
 <a07e4bc2-04af-4e98-8a9c-ccab31bca854@igalia.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a07e4bc2-04af-4e98-8a9c-ccab31bca854@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4182:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cd4d35-2a69-4959-a6a2-08dc47546b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HWxODLT7Q1oQs2Y9jyLPxL9/ZRfm40sy1UmI5oWqDzsdAT+QjZjj24vwG6HBBY7LxOGahKePWoKvHC3SNVllYYyly4pPCZjTMdakSer8tT9P0RXQA2yuLm52UGemRHwtWyM+TLTjw9nPnqKrH3WdXHLJZ1KeWpOIVBjHLYjxBM4dGSKFHEE7ffWjXCh7Cgh9zwPcGpx+DInz/8KXH4g0k5ehy1d264WQd3oGn8s0Aheg1fAvrOwhWs37fLMl8eFo64EHbxQXBuRrWvQ2MLNQPk8yXUQop6PUfVmzpJaIXUJ45JOA+14jcF01y+FQriZj66EdhVOfMTCgGeyeMIdVjQfKwoVEyqUo9mGz6wl7R8lCDQvRsPJXtTbBPDDUGJraCYAkf0SKxJsOf/5APZZKZLTkc1azsVT7sEnNiJ065qHyMOUDGnRP4d8vxA0y3hjnTOmJREX99T/Z6zd+tx5cDPg/2d+7GL5qh3IkX2hCY+vvZZHtqKiCXkRYZHA57f4QwAyTCYIcAveyyAU7UvOoR/aFIPP8I7jzcyA3/g2Qtl/8E5QWAedJeymNTtg9cKspcKI/x5BdIN8ATY0DJDjy72nXSPexs91SFOHwQ0VmSb6LDV43IQQRGpQZmzl8vuaqLuugUQeUkM0CEMuPxzKPceKFq3VQwnteNPH2aLN3F7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlNSV1IzN0t0QWp0VnBWRlhSTXgxTWloSndhaFpsemNyL0JDcWtmVXdsM05j?=
 =?utf-8?B?dWZ3eGhlNVo3Y0d3d0xzM09kNjlDaDRKMlJBSHIyMTBiQ0VDdTZObENDU0RU?=
 =?utf-8?B?cXliRkVuOUxHV1M0WEpyQTZuVkcvNGhkYkxoNVZxZTRuZkgvbmdhcnZOS2di?=
 =?utf-8?B?YllqQzRYOFJadkszdk1CL2RHN00xcW83Wk5ySXpjNnpIbVo4ZTl4RTg4WVR1?=
 =?utf-8?B?ZkdGekJuZzdGMXRrazNhV20zLzJxVVVDa1d0bld0OUlFUHJyTjlDMXdaMS9u?=
 =?utf-8?B?Z3ZQNzFkR2lqaVhHQ1B0U3hxQWdXOU9FaCtrUzlWUXkzSXJ3TS9hOG5PbmJR?=
 =?utf-8?B?eDhqQXBFMUo2TU9sWCtuM2dmUmRHbjFiTFB0N2FlNzJnVTRQbG1sUTlHQWVP?=
 =?utf-8?B?b2ZUeWVRcUVodi9zNHVYbU1MNDdkUzdHNEQyaEZRRnNRYlRhc0ZPZXlObjA3?=
 =?utf-8?B?N1BZWlAySDRzT1pHYlhLckdnWEVDbUhyTE5pdDZPQU03WFZsSTVJbTEyalB4?=
 =?utf-8?B?TnJZZkxrS3JYTk1ES3JNU3JreEhxNXlHWkFUV2hBb3FyS3IrVmw4dXN3Ni9l?=
 =?utf-8?B?R05TcmF6VnFEbEZqMzhBcnIxWFAzei9XZHpSeGVXMmVMb0I1RWVONmFTcm1O?=
 =?utf-8?B?dms0cWNpNlpUTERRTWdzendFeE1uU2RocU9PSUtnUmljWms1VzVpL0hZdWJT?=
 =?utf-8?B?Mk5jWUd3SS9WWDJzNGxRbFdPNkE5ZGRKTFNLcmRRVk1IczJNaFFtZmowV1RV?=
 =?utf-8?B?QkZiY0w4ekJxR29NY1oxQ1dnaC9GYklFdGM0WXhaMWUzay9oWGwydlVzSmR6?=
 =?utf-8?B?SU96b1VQYlZYbWtIaDZyN2ROQWRER3NubmZJdzk2R2VlakFYOE9EL04yWmJ2?=
 =?utf-8?B?Q2NQSTNDWTdaOWJuMmM1SDJkVC9VYzUraDRxbUt0VnB5Tk5HRlFQMHYxQzc0?=
 =?utf-8?B?TE1QdDZBMzBCS1FMRzFETXB5ZENpSjdON3RrUE1NWHEvNnRXUDU4cjZRclZk?=
 =?utf-8?B?b29sc3dXeGtFVERIWThzMmxpWkRVOUZpN0oxVVZwVldmRVlYY25NSkxLRGtm?=
 =?utf-8?B?RDVjd3o4MDRSM1l1TzBsVUMxem85Y2pHMzJkaHE5NWtybUsxcVhzdTErTVV0?=
 =?utf-8?B?ZjdWSXdLa2d0dVJ3b1hBM2g0eDJ3VEZtcmxXNEI3TVJvRjJ1T0pnMU84TzZ4?=
 =?utf-8?B?OWNkOHI3aTlYblVET1RwM1hBb0YzTFdqV3Z3YU01SXRNa3ViUFB1OHo1VzFr?=
 =?utf-8?B?K3NUWm03Zy9kaUppT2lkVXYrQklZdXRyaUNpRG5sZ0drQWVEUUVhdEV4dkQv?=
 =?utf-8?B?SlJNT2pnTitQQ25qUE9aQXJKS0lpSUhwYzF4cmgrTWdLNTR6N0tPQWpNZERs?=
 =?utf-8?B?MndJN2JBOC9MeThBMytBUDhCRU15ZC9hSUFHK1RvZVNHbXp1SWI1YXNnVmt1?=
 =?utf-8?B?bVZCMTFRc1ZYZFNNLy92eVhnQzZWRmRITFZqZXZXRGVSU00raWUwUmU5bHZj?=
 =?utf-8?B?c3BnZzA1d3c1RURXY3NwWDhtcm5KNEsvOHYrUXlsa0M1VjVzcGJ5MndmSUtH?=
 =?utf-8?B?K2NPaGkybEQ5b3RuZTdZOHEzU29yN1BtczVleHd6YjdZbU0vbDc0UTYvbmNq?=
 =?utf-8?B?bUE4UGFqd0VCMGRiZ2hxQWNJZk1wNWRsMkdTU3hOWXhjUmxFMzFqamtpOEJF?=
 =?utf-8?B?NVZiT0luZWY0OCtidnZWTk5EUThPZk9xZFNkc29QaEUySjh5U1diZXRSMGs1?=
 =?utf-8?B?WWtOaUIzUUxVYkVJL1NuQVNXWDIzbnliZFQ0ZnJzQUdQYlR5L0JiK0oyNm43?=
 =?utf-8?B?QmlQNkxCd0txdE9xd2thSGhOWS8xWnd1Y2tHYzg2K0ljV3pCdkg4Q0ZzVEVj?=
 =?utf-8?B?ZS9rV0oycGR1b2Q3WWI2NG9vMFJ4RURPZEJyWENlNUN3cUVVVnIvdXFLSE1j?=
 =?utf-8?B?SC83ZC9odzlqUjJzeUozMW92MU83eVp1Yi9Qcld0aWRXQWlXMmRkU05UOUhy?=
 =?utf-8?B?cTA4Z1Z2Y1lQU0tzQzB2UHhvU3J0MXFqSjRORXljYUNmcU1TTFBWSEU0UkJy?=
 =?utf-8?B?S1hMZFMxa3dtODUyNmMzUkRSa05YamluRFA0YjYvMUxWUi9jcEt3eDFtM1N1?=
 =?utf-8?Q?N9hfN35/XZryiK3l40rhZv0D8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cd4d35-2a69-4959-a6a2-08dc47546b31
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 14:05:08.2874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCYc9hGgTiKJBv0vvjCaqs1+3e5b+m50p/vRNeGY1URcNjEq/iFrRO6yMNK6j+uD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4182
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

Am 18.03.24 um 14:28 schrieb Maíra Canal:
> Hi Christian,
>
> On 3/18/24 10:10, Christian König wrote:
>> Am 18.03.24 um 13:42 schrieb Maíra Canal:
>>> Hi Christian,
>>>
>>> On 3/12/24 10:48, Christian König wrote:
>>>> Am 12.03.24 um 14:09 schrieb Tvrtko Ursulin:
>>>>>
>>>>> On 12/03/2024 10:37, Christian König wrote:
>>>>>> Am 12.03.24 um 11:31 schrieb Tvrtko Ursulin:
>>>>>>>
>>>>>>> On 12/03/2024 10:23, Christian König wrote:
>>>>>>>> Am 12.03.24 um 10:30 schrieb Tvrtko Ursulin:
>>>>>>>>>
>>>>>>>>> On 12/03/2024 08:59, Christian König wrote:
>>>>>>>>>> Am 12.03.24 um 09:51 schrieb Tvrtko Ursulin:
>>>>>>>>>>>
>>>>>>>>>>> Hi Maira,
>>>>>>>>>>>
>>>>>>>>>>> On 11/03/2024 10:05, Maíra Canal wrote:
>>>>>>>>>>>> For some applications, such as using huge pages, we might 
>>>>>>>>>>>> want to have a
>>>>>>>>>>>> different mountpoint, for which we pass in mount flags that 
>>>>>>>>>>>> better match
>>>>>>>>>>>> our usecase.
>>>>>>>>>>>>
>>>>>>>>>>>> Therefore, add a new parameter to drm_gem_object_init() 
>>>>>>>>>>>> that allow us to
>>>>>>>>>>>> define the tmpfs mountpoint where the GEM object will be 
>>>>>>>>>>>> created. If
>>>>>>>>>>>> this parameter is NULL, then we fallback to 
>>>>>>>>>>>> shmem_file_setup().
>>>>>>>>>>>
>>>>>>>>>>> One strategy for reducing churn, and so the number of 
>>>>>>>>>>> drivers this patch touches, could be to add a lower level 
>>>>>>>>>>> drm_gem_object_init() (which takes vfsmount, call it 
>>>>>>>>>>> __drm_gem_object_init(), or drm__gem_object_init_mnt(), and 
>>>>>>>>>>> make drm_gem_object_init() call that one with a NULL argument.
>>>>>>>>>>
>>>>>>>>>> I would even go a step further into the other direction. The 
>>>>>>>>>> shmem backed GEM object is just some special handling as far 
>>>>>>>>>> as I can see.
>>>>>>>>>>
>>>>>>>>>> So I would rather suggest to rename all drm_gem_* function 
>>>>>>>>>> which only deal with the shmem backed GEM object into 
>>>>>>>>>> drm_gem_shmem_*.
>>>>>>>>>
>>>>>>>>> That makes sense although it would be very churny. I at least 
>>>>>>>>> would be on the fence regarding the cost vs benefit.
>>>>>>>>
>>>>>>>> Yeah, it should clearly not be part of this patch here.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> Also the explanation why a different mount point helps with 
>>>>>>>>>> something isn't very satisfying.
>>>>>>>>>
>>>>>>>>> Not satisfying as you think it is not detailed enough to say 
>>>>>>>>> driver wants to use huge pages for performance? Or not 
>>>>>>>>> satisying as you question why huge pages would help?
>>>>>>>>
>>>>>>>> That huge pages are beneficial is clear to me, but I'm missing 
>>>>>>>> the connection why a different mount point helps with using 
>>>>>>>> huge pages.
>>>>>>>
>>>>>>> Ah right, same as in i915, one needs to mount a tmpfs instance 
>>>>>>> passing huge=within_size or huge=always option. Default is 
>>>>>>> 'never', see man 5 tmpfs.
>>>>>>
>>>>>> Thanks for the explanation, I wasn't aware of that.
>>>>>>
>>>>>> Mhm, shouldn't we always use huge pages? Is there a reason for a 
>>>>>> DRM device to not use huge pages with the shmem backend?
>>>>>
>>>>> AFAIU, according to b901bb89324a ("drm/i915/gemfs: enable THP"), 
>>>>> back then the understanding was within_size may overallocate, 
>>>>> meaning there would be some space wastage, until the memory 
>>>>> pressure makes the thp code split the trailing huge page. I 
>>>>> haven't checked if that still applies.
>>>>>
>>>>> Other than that I don't know if some drivers/platforms could have 
>>>>> problems if they have some limitations or hardcoded assumptions 
>>>>> when they iterate the sg list.
>>>>
>>>> Yeah, that was the whole point behind my question. As far as I can 
>>>> see this isn't driver specific, but platform specific.
>>>>
>>>> I might be wrong here, but I think we should then probably not have 
>>>> that handling in each individual driver, but rather centralized in 
>>>> the DRM code.
>>>
>>> I don't see a point in enabling THP for all shmem drivers. A huge page
>>> is only useful if the driver is going to use it. On V3D, for example,
>>> I only need huge pages because I need the memory contiguously allocated
>>> to implement Super Pages. Otherwise, if we don't have the Super Pages
>>> support implemented in the driver, I would be creating memory pressure
>>> without any performance gain.
>>
>> Well that's the point I'm disagreeing with. THP doesn't seem to 
>> create much extra memory pressure for this use case.
>>
>> As far as I can see background for the option is that files in tmpfs 
>> usually have a varying size, so it usually isn't beneficial to 
>> allocate a huge page just to find that the shmem file is much smaller 
>> than what's needed.
>>
>> But GEM objects have a fixed size. So we of hand knew if we need 4KiB 
>> or 1GiB and can therefore directly allocate huge pages if they are 
>> available and object large enough to back them with.
>>
>> If the memory pressure is so high that we don't have huge pages 
>> available the shmem code falls back to standard pages anyway.
>
> The matter is: how do we define the point where the memory pressure is 
> high?

Well as driver developers/maintainers we simply don't do that. This is 
the job of the shmem code.

> For example, notice that in this implementation of Super Pages
> for the V3D driver, I only use a Super Page if the BO is bigger than 
> 2MB. I'm doing that because the Raspberry Pi only has 4GB of RAM 
> available for the GPU. If I created huge pages for every BO allocation 
> (and initially, I tried that), I would end up with hangs in some 
> applications.

Yeah, that is what I meant with the trivial optimisation to the shmem 
code. Essentially when you have 2MiB+4KiB as BO size then the shmem code 
should use a 2MiB and a 4KiB page to back them, but what it currently 
does is to use two 2MiB pages and then split up the second page when it 
find that it isn't needed.

That is wasteful and leads to fragmentation, but as soon as we stop 
doing that we should be fine to enable it unconditionally for all drivers.

TTM does essentially the same thing for years.

Regards,
Christian.

>
>
> At least, for V3D, I wouldn't like to see THP being used for all the 
> allocations. But, we have maintainers of other drivers in the CC.
>
> Best Regards,
> - Maíra
>
>>
>> So THP is almost always beneficial for GEM even if the driver doesn't 
>> actually need it. The only potential case I can think of which might 
>> not be handled gracefully is the tail pages, e.g. huge + 4kib.
>>
>> But that is trivial to optimize in the shmem code when the final size 
>> of the file is known beforehand.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Best Regards,
>>> - Maíra
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>
>>>>>
>>>>> Te Cc is plenty large so perhaps someone else will have additional 
>>>>> information. :)
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>>
>>>>>> I mean it would make this patch here even smaller.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> Tvrtko
>>>>>>
>>>>
>>

