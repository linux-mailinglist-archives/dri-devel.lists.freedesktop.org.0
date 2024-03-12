Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA118791DD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 11:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8282E10EF5E;
	Tue, 12 Mar 2024 10:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M04+kQ32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A7110EF5E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:24:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEZZ6+tufHy5ay9gARPKOXbfRLYTvB1/2lMgGybePmDn7T1ZX2RQGvKE4+cdFEWfRFp2Kk8QdmbK0GQkEpQCJWD2p9TC3vRx7lXCd9nYJIT9gR9liABnNzXMlIVrcl5P6gYLWLZ74JHhEFcKaDeXqO32+gfmcxHVOsZzvoQQMumEEpocDnu2ADQz23gTSll8RakRca8XWVxlFjj9ofu8LAe5hEXBoo3G1/ut+bPONxwQykw/3EsidwYq9+C3c/QxXrM87kxXy14L11p1jRIe5EB+IlyD0PcjZOEoEDoF2sMVN9q37xn8lF51Ji0yAr85TbAu/XkBn5y9ctTWexxDWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K5/mP+f047mVqNGHR9NAl4lA4dpY+ldfR6KTiQzP+Y=;
 b=nw9bJuNeNHKXpn3sGmwKzXYoLPNCGB/bL0N8o32xJ6NBlltb3DKqJbGqET8Mn+BfoX8++SXMOHWhzrRpA8n9kvaYMP7+zHIEtPeU2LZQ2q+3UhTicI8YoDXaULGkWIAiWgJedHJ0bBKTf/RKdplxty8j/s3jdTkazbiv/Tmn3CSkGplhm2hAxjqGrSmcLokE9nSstuBKu2aEjr4djldPWW7y8+B2VsvU4gPOzUZOAluecUDEXkpp+cpzvVD9n2TgjL0c5vprYCW24RXCzqs52k7s67hNM/hkqgqPNgUzM9pScwevXqpMT7htKUbHy3Aax2eCvfutjMaNspuNu6urLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K5/mP+f047mVqNGHR9NAl4lA4dpY+ldfR6KTiQzP+Y=;
 b=M04+kQ322P3rQsg5/kjBt7YUH0hHljxYiUTBbOfOgxCMlKVNkPXhDh2bo5z6ZNPqYYVarsj8rdBq3r5pOq63cTZHzPU3VX0DJ9j5GNf6fzVpdc4beFORtTeulv3ANvSXiFOvTFhStCXmuydxfLvg6VnbJkgo2nAajKR/WvnJDVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6797.namprd12.prod.outlook.com (2603:10b6:806:259::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 10:24:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.031; Tue, 12 Mar 2024
 10:24:12 +0000
Message-ID: <a0ac2e10-f5f5-4fbb-b591-bd188967ce53@amd.com>
Date: Tue, 12 Mar 2024 11:23:59 +0100
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
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <07885e3b-ee7b-456b-9fad-17d9009a4cb7@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0363.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: b10615fe-d95a-41a2-5388-08dc427e8f89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 72aBxvCXaRP2lAi1+GBPFm/3UeqDcOiULSE8h5NUJdQG1/IwxhR3kDNVZhdPB9CHvhIo/WaE/u9/Y9u4J8EtgVNtnt9n1HHM2QrUAURlBqm+cLDZl52e1q3EOOekzhgBCokys/2+TmQYtxtGMvl1JCCVp/dN1lK9C2UYBYNKQ7p4PRB5lMHxmy0Csr6YkfeFbdh7dsMKgY3Cp4xEZvR/M21pw+a+NXEXQGHSOvSTNjBJ4/denjSxvToQU8Fp07q1u3Q1YCbQJFO0xeOFEqFy5j80xN+cF0rF1s2aYem6dRWvXmCGO+A/0j5ZXUKlyEpApocBIoJyYZXMhoG30yZmLuqoeO7lG3f08gFYJaCHWm0QK5xwosUd0tpGW2lodt+tAQwa15Cw7UH0pEq77pw9SIV6wjL+UC4NPXJTZDHzIwoPRYDL7DFMFFPU27bm0W+3h+W1XiuDXVQ6AQ/2856cr8cVPMPrmcHAxCWNlofmmc8fM1ALRFmQVtsUKF6jbT1xn67p3f0vqyButzNC0cWmif4OSN7yqG9iOxOkZI13OC/K8Sz+4bHlrIn/c5ceI0VJo2pk7Yz3r7EpcTirFiNuESp0gv9X0goAikIvx6rCBxZYUWjHOCinY2x+ua0DNti1DGQdjMXRODCgq60yNAboFh5kU6GT258UD4ijO1ypmrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cElCNVNYSDNQQWZyV2lRRDRRalBEckdja0xGeFlkM3pwWExPTytyNnZDaWc5?=
 =?utf-8?B?RTdDdHpEOTVnYWlKN2l5WlhyOXk3WUlQWmRlOVdwYk1BUDlFc2tqdjZtT2FX?=
 =?utf-8?B?QzIzMFdJcmRXT3Q1SmQ3ZW50aVQ1MCtJSWNGa0NoTEl2cGY0MWZET08rY0ZZ?=
 =?utf-8?B?NjNHUTZBQjBQV3QxdTNTUXZoTWhNQitZTUIzSTJSMmFTblZ6TWhEbUhHWFpu?=
 =?utf-8?B?eDJaZllUUFlOZnorcWpEMEZhc2RwckZTTHZTNExYQk94TnVIY2F2VFU1azBW?=
 =?utf-8?B?eHF4SmU2QWlzSHpFZlVEV0x3VndmNExuK01jbyttaVZTS0gzbU9oTjNSeHdB?=
 =?utf-8?B?Q24xK0l1TWgrVnRsem1VeWdRcGcrS3Z5SlRzQ1FpdzN5TFQ4S2ZyL2hlWCs5?=
 =?utf-8?B?UFNPbHFoa25sTFlkeTd4Y2J6NFNSMmo4UXUzb1lLZGNDNkcxV3JuR3g3NFlp?=
 =?utf-8?B?dGtWbDE5bUVUYitLQmFCVDZKV3hjQTBPNVhrV0FCd2hKc1VxY1dBdWRLTkc4?=
 =?utf-8?B?VDhwWmhRc29TVlh3VURiSS9vRlFDazQzbjMvNVNIYjFUd2hFQ3hqVEtPUXV0?=
 =?utf-8?B?UUxqYU5Ccm9TemNVYm44ZzRaVlhrVUZPVWdoaStRZWo3WWxNR01SZmVpTkV1?=
 =?utf-8?B?UktqUG5nOVhpb2Nja3F0NkdqeS9wV0xRajVJVHdsSi9vQW5aa3dJU3lmbzRu?=
 =?utf-8?B?ckdPZHQ4OUNwSHVSQ3JwY0hia3VwSnAvTE1PekM3ZEUzMmhkNFV1MTE0cTl4?=
 =?utf-8?B?aHYxQUNGSkV2YTdtWU1idURzMGVTaXpqSHAzVlJyYUdvdGQ0Zll0U1VoRk8w?=
 =?utf-8?B?VUxIdnViNU9FWXliRHZ5aElNbWQ3VDZFZWoyTFZmQzc3T2ZUdm1oRmtEYm5i?=
 =?utf-8?B?Zmg0THpVL0c5clVoazF5aEs1UVFwVnh6S3V1eFF2c2luVnBmeGpxV2JOeUM1?=
 =?utf-8?B?SWxEL0h2OUxiSWY3OWxBS1B2a0pGMDNCQ2o1cUZZdjdQYnUxZWZIL3dINHZT?=
 =?utf-8?B?SWNJM0xlTHhxOGgzWFR2WTVHcUZpUUN1bVNtclZaVEdYVUNOR2FNakRkdFFp?=
 =?utf-8?B?MU9WVHFNVjJINUE2b3hYSW4xQ1pWV3oxanF3ck9xdGF6Z2Z2b2xKMW1nWUV2?=
 =?utf-8?B?ajFQVWl2SUZZb3ZoWTlIbW9KenlJcTlEVHluUnFRelEweVpqQmhCMURQY3JH?=
 =?utf-8?B?UmY5YW8zc1VTSVRzeC9uMkl5Y3JDSHZ0M1JoRHJ3RnlZTXdsZkNwUUxpVGgr?=
 =?utf-8?B?bkY5YW1JbGI5YVpqUzVianVGcmF1bEYrREdUMEFKNEhGckt4SG1rSXRFUGVX?=
 =?utf-8?B?R05ZYUNyb21YSzlTanM4YUZEc2ZTKzJwcWc4cE1XOUJ1MS9teUR4OG9KdHBo?=
 =?utf-8?B?dUFvYldtd3pLSWlUeTZiQ05NMVE5YzJXellwaFdlWEJPNXhEUU05YWRINURs?=
 =?utf-8?B?VDhncEtXQ0ZJUzh5cElKZUVuaHh5Q3ErTTB1eEs4a2duUnRoLzVXbHZzT2lq?=
 =?utf-8?B?cm5lN0h6MzZuSFRlUmN1bE5xUWlNV0RMam9iVTFNQWFhNXpKS21RNWw2K2pR?=
 =?utf-8?B?UGlSMExQRjZJcko5ZXllYjZ4VWFORkV1VEEwNGYzQmZleFVmcnVpcUk3RDR5?=
 =?utf-8?B?TTZqeHhHNG9aMitzNGdQeXp2VzlkbHFaUk9yMWJ6aFU4VFRWUDRoTDQycXE0?=
 =?utf-8?B?SG50R0J6RkhSb1hQNXhMSUFWczZqMVhrL2d1NzhiOWM1WXRETWRWbXk2Z3hF?=
 =?utf-8?B?TU1qb1MvT2ZmMzdhNUpybmd6b0JQWVp5cTM1UXVqUDAvbVVLRndSd1BYemVN?=
 =?utf-8?B?OVNsRTNRS3Y3UStsWjNZUXkzYnVHejgyODhXb3RrRE1Dcktsam4wdVVBd0Nt?=
 =?utf-8?B?dTczV0h1SVY1Sy9YUjNkNlJXOHpmVUtyRG1YcW1oSFlqYm1WditDUmo1UStP?=
 =?utf-8?B?ajhDclhsa01NbTdtUDQ5NFkvWEVnRGZnbklQaVMwNDFOV0FQUTB0dHQ2OE8w?=
 =?utf-8?B?SVd3TjdRemtMcCtnN1hXTjhyT3lvenAwWit3Z0VnVUFlcjRibkJBUEE3bDRN?=
 =?utf-8?B?b29hYWZQck1mUDNFSDZrTXlOOVdJaGx4VE4vRXhSTHdTaGVKdUJnajBiZXF1?=
 =?utf-8?Q?52cI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10615fe-d95a-41a2-5388-08dc427e8f89
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 10:24:12.2558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmqszt7cvaC11O8wASjxcAQLi+hzTbEVsKkq4QMco9cz3iJtQ2EYLOYAuyF7SOP+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6797
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

Am 12.03.24 um 10:30 schrieb Tvrtko Ursulin:
>
> On 12/03/2024 08:59, Christian König wrote:
>> Am 12.03.24 um 09:51 schrieb Tvrtko Ursulin:
>>>
>>> Hi Maira,
>>>
>>> On 11/03/2024 10:05, Maíra Canal wrote:
>>>> For some applications, such as using huge pages, we might want to 
>>>> have a
>>>> different mountpoint, for which we pass in mount flags that better 
>>>> match
>>>> our usecase.
>>>>
>>>> Therefore, add a new parameter to drm_gem_object_init() that allow 
>>>> us to
>>>> define the tmpfs mountpoint where the GEM object will be created. If
>>>> this parameter is NULL, then we fallback to shmem_file_setup().
>>>
>>> One strategy for reducing churn, and so the number of drivers this 
>>> patch touches, could be to add a lower level drm_gem_object_init() 
>>> (which takes vfsmount, call it __drm_gem_object_init(), or 
>>> drm__gem_object_init_mnt(), and make drm_gem_object_init() call that 
>>> one with a NULL argument.
>>
>> I would even go a step further into the other direction. The shmem 
>> backed GEM object is just some special handling as far as I can see.
>>
>> So I would rather suggest to rename all drm_gem_* function which only 
>> deal with the shmem backed GEM object into drm_gem_shmem_*.
>
> That makes sense although it would be very churny. I at least would be 
> on the fence regarding the cost vs benefit.

Yeah, it should clearly not be part of this patch here.

>
>> Also the explanation why a different mount point helps with something 
>> isn't very satisfying.
>
> Not satisfying as you think it is not detailed enough to say driver 
> wants to use huge pages for performance? Or not satisying as you 
> question why huge pages would help?

That huge pages are beneficial is clear to me, but I'm missing the 
connection why a different mount point helps with using huge pages.

Regards,
Christian.

>
> Regards,
>
> Tvrtko

