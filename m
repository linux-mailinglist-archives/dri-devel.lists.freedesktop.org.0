Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34F72E4BB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 15:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D45510E0A9;
	Tue, 13 Jun 2023 13:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E15C10E0A9;
 Tue, 13 Jun 2023 13:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gABo7S1A7M9E9l6b3S/NO9GgLFrsjrpNIn6OfuHbvrkLruS9RfnfRtuN6ALeOsUHCZ10EmE1KKvcDPdY0c36x54U1einkaRKtdkEzZl3XO6ntWrsZLpWyZsejcU8AoAmnTjIjYDHbRnM03IyQVP6a9R0DFxVQzhTPaXTPSRIlA5atS173hjbxIrj8jmefSLaltuiifChOS7ll/YzDm97TwwEYgaTQpkmdzCj3bCsJtYQMhzOjzqGVWWVtUIfZCDvhmWaPDg4wCuXEGmdQykud7wYvVY4WwDeaicjowXQpE+esnSimTTISBUPyZ7JQqfuOpQn+TRGtKmEXGTLTEG8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDre/9TiywK7l34Vwhasp7fOBaktIUZXaFBNSzEFlLc=;
 b=D1d1v8HCobFtzb9B4XnmHkEKKsSvGB/KgeLNLupGOfQQagjSI+cUpcbiMeaOCecypJtGqia7kelhTG7wFzmtt34R/I+qmsEs15c9uUAqcUF/QJBA8VkHqDspj8brctqK1MQWUt8dGArXG+FW1USfMhc9Akb9UlNIhU7yHkt/D3PWen876ugdmQuwF88fSh1txgFAjYdWtDT5TKPnsuKGjiu++f1kWix4q/rU3tY3HNrmPUi4uYIgZJSlHJQ8+Jh/DTIhn+uWf/J42Gv2jWbLr6AYsD+pEkny9TBCoW7NBRa0cdL2MuPlxSDmpnX2iZYZ4UwYg3r726OH2aCQIBOMdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDre/9TiywK7l34Vwhasp7fOBaktIUZXaFBNSzEFlLc=;
 b=jhnPiPSLBnSxNH3x+RsPcGvO7jysW06lYqi0T6xB6rcAgxay4Cbj197kaZkwhz1pnJEEqfQPKzc0UUTdRRKqeXjCuic/BE1VVHyFN1a+uKxFY+YShnXURhqQkHELkvzQZv/F/LTQGKghRJskjhqjeGL1tF9j6+XKtx9DWVAk3a0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by CH2PR12MB4040.namprd12.prod.outlook.com (2603:10b6:610:ac::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 13:59:44 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff%4]) with mapi id 15.20.6455.024; Tue, 13 Jun 2023
 13:59:44 +0000
Message-ID: <8cb02812-1bc5-c1ff-13b0-eeec87c26859@amd.com>
Date: Tue, 13 Jun 2023 15:59:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/9] drm/ttm: use per BO cleanup workers
Content-Language: en-US
To: Karol Herbst <kherbst@redhat.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-3-christian.koenig@amd.com>
 <8ff841e3-8eef-9ec2-2ba5-4907f18873c0@amd.com>
 <a7c5f157-ff42-4e87-cc79-33ba6a15a138@amd.com>
 <CACO55tuNk16S2LgtuiSt9fwNHDXEdT3J+Rr_tuuGbrDXu-w45Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CACO55tuNk16S2LgtuiSt9fwNHDXEdT3J+Rr_tuuGbrDXu-w45Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::14) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|CH2PR12MB4040:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1f26ca-e274-44a1-07a5-08db6c16707e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CXHXnK41388fvlcm2stVruEyz5R1Wv2MNRfmGBN7qiYmQFtCZVPaD7Glm/ogHDec2id+wvxE2KWqIUsCJ06DL5Pr86pLSk5x3BJ3M4MD8PCSH30xxVMM39Dp8T+/kND16wDO0qMv6yJZRo7p4dc54C8hq729eLnmfH9IuFPZ7IAJBmf9kjiaGLdnegURP6VxOmVWjwJAzBwJYM14SdoeRsRL0Y5M7xcy6hFHEwC2d0AbsoyW1aFcG6pmPeA02vCqLBCcV3QmJA0mwugWEYYrNn4trKDnxTLZgSrgFjj+0VihneQH5pmXnqXZ/SJPa4vktwAQDXK+ixeRUk6HX/EDxGQA60sDHVVdN1Yb/RU1Dm5BC/hTTWoFifkwHHq0EZcyfmZ4kGMMfiwcRYV4jRSkGiiIO9vL4ho5frUchuOyeYOjeDO8J1DH1xxlk2msGwGF99qyHHl7oxEJEqqnuhCeaA8M97lM9u2+892A+wkLa/tucjZ+uTiXWvEMpJJ37xQuNSyjOuKy6Pu74OrIcevmZeCBnA3DJMahwgiAQLODTcc2nVvxZDedxQvU0FU8lk+YJQoIuIs7vuzsS3rsglJC7aANw5Va6XsFWeZX2HRmhYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199021)(31686004)(6916009)(66946007)(66574015)(4326008)(66556008)(36756003)(186003)(54906003)(478600001)(2616005)(4001150100001)(30864003)(2906002)(66476007)(45080400002)(8676002)(316002)(966005)(41300700001)(31696002)(86362001)(6486002)(6666004)(6506007)(53546011)(8936002)(83380400001)(5660300002)(38100700002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmR3Q2FqOWlWVmIrbW4vTlk0Z2VDY1F0Y1N5WkNhMm5UdEhnV1RCQUpZbURH?=
 =?utf-8?B?WnUzbVdiOVBnWEUwNEdQN05VNzMvMnZ3ejd4aEhnVEtOWWQ3RUxwb3NXK01x?=
 =?utf-8?B?d2huUE5SUDhCS01RTW15aGdKVGY3a3JGWDlCUnQzVk5hQnZINytPTnRkYTNO?=
 =?utf-8?B?Z1p5cmlxdjRjUWhuU1E5MUVvT0VhckJWaGNUVUpkcVFlYnk2VUQrT1NJN1FF?=
 =?utf-8?B?Ri9KcTY2U0FsT2tlTmM0d0FyRGRPNjlNQmdjNEZtNjNvNUx2YXJzMEVZK0py?=
 =?utf-8?B?Vk51UXI4akNYK0NEN2IvRGFqYitEMWFGUEZ0N2F1QlpCV0IwUkZLc1ZUNFlO?=
 =?utf-8?B?VHh0YVhCU3FmbXN5dFphT0sxVDFqWUhrY2dXRDdDOVlYaHpvV0dTWHc3YnYx?=
 =?utf-8?B?SGg1WXpCTVUzSHlkTHd5VDVtd0FRN1NSUU5Vc2t0UnZuUVVva2FWTlNMUGhj?=
 =?utf-8?B?dXlwRjFINXZ4c2tnL0Y3VXNMdHJSeVE3ODgxTklmRVJIQVhFYmc2QTJNSXVK?=
 =?utf-8?B?ZWRRQW5CMFhkc2ZiMzBlMmkxem95aEpuZ0sxS0dYdFdvRjgzdmhKYm5saXJ2?=
 =?utf-8?B?ekt3bGRjRGF0RERjeVpIaVlYa2ZyZVlWVUZBTGZybG95NEtGMi9GWS9zeEY3?=
 =?utf-8?B?cXdYNEdWbUdjWHlZbmNxamVlWjhkSFowcEphcXRDcGRYdDBDTlBJY3ZRMjMr?=
 =?utf-8?B?M21HdlB2ZXlLbVh6VHVKQ3d0VXNOQ1M0NVQzN0JlbDhucGVoY1V3SW9KaS9V?=
 =?utf-8?B?cnAxRFVyc1AvQ00vc25ud1haakYzVlJnbTBzd21mNncweGFPOGprWUxyL1Z0?=
 =?utf-8?B?RnZTdSt6Mm1OQXhQTHM3cURnRlQyZitTSWdkeVF5NDc1R3l4UFgreEZGd2Nh?=
 =?utf-8?B?bCsrNzFWL0d4bEdVaVhVZVBYVkcvSzFJT2tWeUVEZUhZQnhYd0Y2Y1EwOTg3?=
 =?utf-8?B?ZHBBK3VUaDVtWDY0cWxNbWRvTHdpcE9rN21QN0t5OE82SjR0WDgvRDJoOFNN?=
 =?utf-8?B?N0hFMlUvTjJDd3M3R05JclUvZTZJRk9JQlIrUWt6WDVhRjlBYVFMdElGaVg0?=
 =?utf-8?B?N0s0aGEwdXB1cG1iNFFzK3pVUDF4MWtSOWt0TU9WNnJUY1hkN0FTa1l5ZTZj?=
 =?utf-8?B?QitSdXhQZWJHaXFWRk8rSXZhQVBOVU5nTXpkWlpMVGtMSkJVR0JmL0g5dE80?=
 =?utf-8?B?MHBtNFNZZDRiTFZvK0IzSyszelZsc0dCVlBXS0NiUVIrRllDMEpxREFoTkFQ?=
 =?utf-8?B?alA5Y1FMa1pPaWdyUERVNFpEa1U2WlBkcXU2VkhQRU9EaHFTbHlnSUpkWU5M?=
 =?utf-8?B?TFZoWi9yWGNIeGdQMW5Od0NXNk5ZUDNvZnp4LzdhMldJR090dHU0aWtRR01u?=
 =?utf-8?B?VHlrMjdodG84eE16Z0hxSGx1dmxmdFFVdlhRZ0UwVjJnRXFRRCsxbkczNENH?=
 =?utf-8?B?MWk4b211bXZOZkJlWDR2dExOV1FYczlaejNPU2hGa2x0RXBhWFozYlowaUFZ?=
 =?utf-8?B?OHNZOXBVZXBnTHYwQlE4dlZKZkhFZVo0ZXArRWxmcmw0UEUyb3pRajVTaXhR?=
 =?utf-8?B?c0V1T0lja3EyNEl5WnpYTDBUT0NqNStzU1VzQWpDY3VVZVE1OWI4Y3ZVTVVD?=
 =?utf-8?B?TXpjb0pETS9UUzhZMTJHNUVzNDdycUVyWU50alZMUlEwN2dFN2wrOGRXbVZp?=
 =?utf-8?B?RHFxS082TXh0SFJVamJBVVkybjdwV0k3Q1ZKaTg4UUFIa00vaFFGais1bStk?=
 =?utf-8?B?b2N3a1JDdC9vM0QvaENXZTNvbkgxdU40MG5PWmh6YklmSjgyN3pNMmR1bWlQ?=
 =?utf-8?B?ZHI2K1BVNXpoRkRyZTBrV3ZnQnlIaUdrUFlnSHkveVFYUTRHVVRXUmZISDNP?=
 =?utf-8?B?bjdaaS9SR3lnZUdWWDhWUWhKYnl6YVZkd1phWEtvdmNxNFcyL2M3aDRnWW5C?=
 =?utf-8?B?UVZtNzZTc3RYazEyazgxQkZSTFR1YUFuS2F6WDZuUEpreEhzYXd0ZFUrT3dZ?=
 =?utf-8?B?MytEcFcvVXpsK3NNb1pNM3JMclYyUFRvYUlwRWV2VWVkU0pOMUZlMWJTYTBG?=
 =?utf-8?B?T1R4c2kycGphMm1PLzVicCtVUnYxeUNBOFI3cUkzZ3lDSHVXYnArbGV3d0NK?=
 =?utf-8?B?UTZLZUZWcWNRc1NRMlp0cjAyTC9NRHMwM1lMenJoZU4zbFhtTEZnaXBnMzdX?=
 =?utf-8?Q?J2y6w0IJA8vKY9CizgUQeeEGhrrmXCE3nzWonFCy8AjK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1f26ca-e274-44a1-07a5-08db6c16707e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 13:59:44.3674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzTBlWgoSKiGMhZJjp/WoiD4GbMj5yNON4EC9vQ+1G/ummaRj3uYgoa2nXvQNvqQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4040
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
Cc: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.06.23 um 15:05 schrieb Karol Herbst:
> On Mon, Dec 5, 2022 at 2:40 PM Christian König <christian.koenig@amd.com> wrote:
>> Am 29.11.22 um 22:14 schrieb Felix Kuehling:
>>> On 2022-11-25 05:21, Christian König wrote:
>>>> Instead of a single worker going over the list of delete BOs in regular
>>>> intervals use a per BO worker which blocks for the resv object and
>>>> locking of the BO.
>>>>
>>>> This not only simplifies the handling massively, but also results in
>>>> much better response time when cleaning up buffers.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Just thinking out loud: If I understand it correctly, this can cause a
>>> lot of sleeping worker threads when
>>> AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE is used and many BOs are freed
>>> at the same time. This happens e.g. when a KFD process terminates or
>>> crashes. I guess with a concurrency-managed workqueue this isn't going
>>> to be excessive. And since it's on a per device workqueue, it doesn't
>>> stall work items on the system work queue or from other devices.
>> Yes, exactly that. The last parameter to alloc_workqueue() limits how
>> many work items can be sleeping.
>>
>>> I'm trying to understand why you set WQ_MEM_RECLAIM. This work queue
>>> is not about freeing ttm_resources but about freeing the BOs. But it
>>> affects freeing of ghost_objs that are holding the ttm_resources being
>>> freed.
>> Well if the BO is idle, but not immediately lockable we delegate freeing
>> the backing pages in the TT object to those workers as well. It might
>> even be a good idea to use a separate wq for this case.
>>
>>> If those assumptions all make sense, patches 1-3 are
>>>
>>> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Thanks,
>> Christian.
>>
> This patch causes a heap use-after-free when using nouveau with the
> potential of trashing filesystems, is there a way to revert it until
> we figure out a proper solution to the problem?

Uff I don't think so, we have quite some work based on top of this. But 
let me double check.

On the other hand have you tried running this with KASAN to catch use 
after free errors?

Since we now block for work to finish and not check every few 
milliseconds to garbage collect memory will now be reclaimed much faster 
after freeing it.

Regards,
Christian.

>
> Bug: https://gitlab.freedesktop.org/drm/nouveau/-/issues/213
>
> example trace on affected systems:
>
> [ 4102.946946] general protection fault, probably for non-canonical
> address 0x5f775ce3bd949b45: 0000 [#3] PREEMPT SMP NOPTI
> [ 4102.957794] CPU: 12 PID: 89561 Comm: glcts Tainted: G      D
>      6.3.5-200.fc38.x86_64 #1
> [ 4102.966556] Hardware name: ASUS System Product Name/PRIME B660-PLUS
> D4, BIOS 0418 10/13/2021
> [ 4102.974972] RIP: 0010:__kmem_cache_alloc_node+0x1ba/0x320
> [ 4102.980362] Code: 2b 14 25 28 00 00 00 0f 85 74 01 00 00 48 83 c4
> 18 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 41 8b 47 28 4d 8b 07
> 48 01 f8 <48> 8b 18 48 89 c1 49 33 9f b8 00 00 00 48 0f c9 48 31 cb 41
> f6 c0
> [ 4102.999073] RSP: 0018:ffff9764e0057b40 EFLAGS: 00010202
> [ 4103.004291] RAX: 5f775ce3bd949b45 RBX: 0000000000000dc0 RCX: 0000000000000046
> [ 4103.011408] RDX: 00000002cf87600c RSI: 0000000000000dc0 RDI: 5f775ce3bd949b15
> [ 4103.018528] RBP: 0000000000000dc0 R08: 00000000000390c0 R09: 0000000030302d6d
> [ 4103.025649] R10: 00000000756c7473 R11: 0000000020090298 R12: 0000000000000000
> [ 4103.032767] R13: 00000000ffffffff R14: 0000000000000046 R15: ffff8bda80042600
> [ 4103.039887] FS:  00007f386a85ef00(0000) GS:ffff8be1df700000(0000)
> knlGS:0000000000000000
> [ 4103.047958] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 4103.053692] CR2: 000000000493b868 CR3: 000000014c3ba000 CR4: 0000000000f50ee0
> [ 4103.060812] PKRU: 55555554
> [ 4103.063520] Call Trace:
> [ 4103.065970]  <TASK>
> [ 4103.068071]  ? die_addr+0x36/0x90
> [ 4103.071384]  ? exc_general_protection+0x1be/0x420
> [ 4103.076081]  ? asm_exc_general_protection+0x26/0x30
> [ 4103.080952]  ? __kmem_cache_alloc_node+0x1ba/0x320
> [ 4103.085734]  ? ext4_htree_store_dirent+0x42/0x180
> [ 4103.090431]  ? ext4_htree_store_dirent+0x42/0x180
> [ 4103.095132]  __kmalloc+0x4d/0x150
> [ 4103.098444]  ext4_htree_store_dirent+0x42/0x180
> [ 4103.102970]  htree_dirblock_to_tree+0x1ed/0x370
> [ 4103.107494]  ext4_htree_fill_tree+0x109/0x3d0
> [ 4103.111846]  ext4_readdir+0x6d4/0xa80
> [ 4103.115505]  iterate_dir+0x178/0x1c0
> [ 4103.119076]  __x64_sys_getdents64+0x88/0x130
> [ 4103.123341]  ? __pfx_filldir64+0x10/0x10
> [ 4103.127260]  do_syscall_64+0x5d/0x90
> [ 4103.130835]  ? handle_mm_fault+0x11e/0x310
> [ 4103.134927]  ? do_user_addr_fault+0x1e0/0x720
> [ 4103.139278]  ? exc_page_fault+0x7c/0x180
> [ 4103.143195]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [ 4103.148240] RIP: 0033:0x7f386a418047
> [ 4103.151828] Code: 24 fb ff 4c 89 e0 5b 41 5c 5d c3 0f 1f 84 00 00
> 00 00 00 f3 0f 1e fa b8 ff ff ff 7f 48 39 c2 48 0f 47 d0 b8 d9 00 00
> 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 91 cd 0f 00 f7 d8 64 89
> 02 48
> [ 4103.170543] RSP: 002b:00007ffd4793ff38 EFLAGS: 00000293 ORIG_RAX:
> 00000000000000d9
> [ 4103.178095] RAX: ffffffffffffffda RBX: 0000000004933830 RCX: 00007f386a418047
> [ 4103.185214] RDX: 0000000000008000 RSI: 0000000004933860 RDI: 0000000000000006
> [ 4103.192335] RBP: 00007ffd4793ff70 R08: 0000000000000000 R09: 0000000000000001
> [ 4103.199454] R10: 0000000000000004 R11: 0000000000000293 R12: 0000000004933834
> [ 4103.206573] R13: 0000000004933860 R14: ffffffffffffff60 R15: 0000000000000000
> [ 4103.213695]  </TASK>
> [ 4103.215883] Modules linked in: snd_seq_dummy snd_hrtimer
> nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet
> nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
> nf_reject_ipv6 nft_reject nft_ct nft_chain_nat ip6table_nat
> ip6table_mangle ip6table_raw ip6table
> [ 4103.215911]  kvm_intel snd_hwdep snd_seq eeepc_wmi kvm
> snd_seq_device asus_wmi iTCO_wdt mei_pxp mei_hdcp ledtrig_audio
> irqbypass snd_pcm ee1004 intel_pmc_bxt sparse_keymap rapl snd_timer
> pmt_telemetry mei_me iTCO_vendor_support platform_profile joydev
> intel_cstate pmt_class snde
> [ 4103.366194] ---[ end trace 0000000000000000 ]---
>
>>>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
>>>>    drivers/gpu/drm/i915/i915_gem.c            |   2 +-
>>>>    drivers/gpu/drm/i915/intel_region_ttm.c    |   2 +-
>>>>    drivers/gpu/drm/ttm/ttm_bo.c               | 112 ++++++++-------------
>>>>    drivers/gpu/drm/ttm/ttm_bo_util.c          |   1 -
>>>>    drivers/gpu/drm/ttm/ttm_device.c           |  24 ++---
>>>>    include/drm/ttm/ttm_bo_api.h               |  18 +---
>>>>    include/drm/ttm/ttm_device.h               |   7 +-
>>>>    8 files changed, 57 insertions(+), 111 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 2b1db37e25c1..74ccbd566777 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -3984,7 +3984,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device
>>>> *adev)
>>>>        amdgpu_fence_driver_hw_fini(adev);
>>>>          if (adev->mman.initialized)
>>>> -        flush_delayed_work(&adev->mman.bdev.wq);
>>>> +        drain_workqueue(adev->mman.bdev.wq);
>>>>          if (adev->pm_sysfs_en)
>>>>            amdgpu_pm_sysfs_fini(adev);
>>>> diff --git a/drivers/gpu/drm/i915/i915_gem.c
>>>> b/drivers/gpu/drm/i915/i915_gem.c
>>>> index 8468ca9885fd..c38306f156d6 100644
>>>> --- a/drivers/gpu/drm/i915/i915_gem.c
>>>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>>>> @@ -1099,7 +1099,7 @@ void i915_gem_drain_freed_objects(struct
>>>> drm_i915_private *i915)
>>>>    {
>>>>        while (atomic_read(&i915->mm.free_count)) {
>>>>            flush_work(&i915->mm.free_work);
>>>> -        flush_delayed_work(&i915->bdev.wq);
>>>> +        drain_workqueue(i915->bdev.wq);
>>>>            rcu_barrier();
>>>>        }
>>>>    }
>>>> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c
>>>> b/drivers/gpu/drm/i915/intel_region_ttm.c
>>>> index cf89d0c2a2d9..657bbc16a48a 100644
>>>> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
>>>> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
>>>> @@ -132,7 +132,7 @@ int intel_region_ttm_fini(struct
>>>> intel_memory_region *mem)
>>>>                break;
>>>>              msleep(20);
>>>> -        flush_delayed_work(&mem->i915->bdev.wq);
>>>> +        drain_workqueue(mem->i915->bdev.wq);
>>>>        }
>>>>          /* If we leaked objects, Don't free the region causing use
>>>> after free */
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index b77262a623e0..4749b65bedc4 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -280,14 +280,13 @@ static int ttm_bo_cleanup_refs(struct
>>>> ttm_buffer_object *bo,
>>>>            ret = 0;
>>>>        }
>>>>    -    if (ret || unlikely(list_empty(&bo->ddestroy))) {
>>>> +    if (ret) {
>>>>            if (unlock_resv)
>>>>                dma_resv_unlock(bo->base.resv);
>>>>            spin_unlock(&bo->bdev->lru_lock);
>>>>            return ret;
>>>>        }
>>>>    -    list_del_init(&bo->ddestroy);
>>>>        spin_unlock(&bo->bdev->lru_lock);
>>>>        ttm_bo_cleanup_memtype_use(bo);
>>>>    @@ -300,47 +299,21 @@ static int ttm_bo_cleanup_refs(struct
>>>> ttm_buffer_object *bo,
>>>>    }
>>>>      /*
>>>> - * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
>>>> - * encountered buffers.
>>>> + * Block for the dma_resv object to become idle, lock the buffer and
>>>> clean up
>>>> + * the resource and tt object.
>>>>     */
>>>> -bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all)
>>>> +static void ttm_bo_delayed_delete(struct work_struct *work)
>>>>    {
>>>> -    struct list_head removed;
>>>> -    bool empty;
>>>> -
>>>> -    INIT_LIST_HEAD(&removed);
>>>> -
>>>> -    spin_lock(&bdev->lru_lock);
>>>> -    while (!list_empty(&bdev->ddestroy)) {
>>>> -        struct ttm_buffer_object *bo;
>>>> -
>>>> -        bo = list_first_entry(&bdev->ddestroy, struct
>>>> ttm_buffer_object,
>>>> -                      ddestroy);
>>>> -        list_move_tail(&bo->ddestroy, &removed);
>>>> -        if (!ttm_bo_get_unless_zero(bo))
>>>> -            continue;
>>>> -
>>>> -        if (remove_all || bo->base.resv != &bo->base._resv) {
>>>> -            spin_unlock(&bdev->lru_lock);
>>>> -            dma_resv_lock(bo->base.resv, NULL);
>>>> -
>>>> -            spin_lock(&bdev->lru_lock);
>>>> -            ttm_bo_cleanup_refs(bo, false, !remove_all, true);
>>>> -
>>>> -        } else if (dma_resv_trylock(bo->base.resv)) {
>>>> -            ttm_bo_cleanup_refs(bo, false, !remove_all, true);
>>>> -        } else {
>>>> -            spin_unlock(&bdev->lru_lock);
>>>> -        }
>>>> +    struct ttm_buffer_object *bo;
>>>>    -        ttm_bo_put(bo);
>>>> -        spin_lock(&bdev->lru_lock);
>>>> -    }
>>>> -    list_splice_tail(&removed, &bdev->ddestroy);
>>>> -    empty = list_empty(&bdev->ddestroy);
>>>> -    spin_unlock(&bdev->lru_lock);
>>>> +    bo = container_of(work, typeof(*bo), delayed_delete);
>>>>    -    return empty;
>>>> +    dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
>>>> false,
>>>> +                  MAX_SCHEDULE_TIMEOUT);
>>>> +    dma_resv_lock(bo->base.resv, NULL);
>>>> +    ttm_bo_cleanup_memtype_use(bo);
>>>> +    dma_resv_unlock(bo->base.resv);
>>>> +    ttm_bo_put(bo);
>>>>    }
>>>>      static void ttm_bo_release(struct kref *kref)
>>>> @@ -369,44 +342,40 @@ static void ttm_bo_release(struct kref *kref)
>>>>              drm_vma_offset_remove(bdev->vma_manager,
>>>> &bo->base.vma_node);
>>>>            ttm_mem_io_free(bdev, bo->resource);
>>>> -    }
>>>> -
>>>> -    if (!dma_resv_test_signaled(bo->base.resv,
>>>> DMA_RESV_USAGE_BOOKKEEP) ||
>>>> -        !dma_resv_trylock(bo->base.resv)) {
>>>> -        /* The BO is not idle, resurrect it for delayed destroy */
>>>> -        ttm_bo_flush_all_fences(bo);
>>>> -        bo->deleted = true;
>>>>    -        spin_lock(&bo->bdev->lru_lock);
>>>> +        if (!dma_resv_test_signaled(bo->base.resv,
>>>> +                        DMA_RESV_USAGE_BOOKKEEP) ||
>>>> +            !dma_resv_trylock(bo->base.resv)) {
>>>> +            /* The BO is not idle, resurrect it for delayed destroy */
>>>> +            ttm_bo_flush_all_fences(bo);
>>>> +            bo->deleted = true;
>>>>    -        /*
>>>> -         * Make pinned bos immediately available to
>>>> -         * shrinkers, now that they are queued for
>>>> -         * destruction.
>>>> -         *
>>>> -         * FIXME: QXL is triggering this. Can be removed when the
>>>> -         * driver is fixed.
>>>> -         */
>>>> -        if (bo->pin_count) {
>>>> -            bo->pin_count = 0;
>>>> -            ttm_resource_move_to_lru_tail(bo->resource);
>>>> -        }
>>>> +            spin_lock(&bo->bdev->lru_lock);
>>>>    -        kref_init(&bo->kref);
>>>> -        list_add_tail(&bo->ddestroy, &bdev->ddestroy);
>>>> -        spin_unlock(&bo->bdev->lru_lock);
>>>> +            /*
>>>> +             * Make pinned bos immediately available to
>>>> +             * shrinkers, now that they are queued for
>>>> +             * destruction.
>>>> +             *
>>>> +             * FIXME: QXL is triggering this. Can be removed when the
>>>> +             * driver is fixed.
>>>> +             */
>>>> +            if (bo->pin_count) {
>>>> +                bo->pin_count = 0;
>>>> +                ttm_resource_move_to_lru_tail(bo->resource);
>>>> +            }
>>>>    -        schedule_delayed_work(&bdev->wq,
>>>> -                      ((HZ / 100) < 1) ? 1 : HZ / 100);
>>>> -        return;
>>>> -    }
>>>> +            kref_init(&bo->kref);
>>>> +            spin_unlock(&bo->bdev->lru_lock);
>>>>    -    spin_lock(&bo->bdev->lru_lock);
>>>> -    list_del(&bo->ddestroy);
>>>> -    spin_unlock(&bo->bdev->lru_lock);
>>>> +            INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
>>>> +            queue_work(bdev->wq, &bo->delayed_delete);
>>>> +            return;
>>>> +        }
>>>>    -    ttm_bo_cleanup_memtype_use(bo);
>>>> -    dma_resv_unlock(bo->base.resv);
>>>> +        ttm_bo_cleanup_memtype_use(bo);
>>>> +        dma_resv_unlock(bo->base.resv);
>>>> +    }
>>>>          atomic_dec(&ttm_glob.bo_count);
>>>>        bo->destroy(bo);
>>>> @@ -946,7 +915,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>>>> struct ttm_buffer_object *bo,
>>>>        int ret;
>>>>          kref_init(&bo->kref);
>>>> -    INIT_LIST_HEAD(&bo->ddestroy);
>>>>        bo->bdev = bdev;
>>>>        bo->type = type;
>>>>        bo->page_alignment = alignment;
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> index ba3aa0a0fc43..ae4b7922ee1a 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> @@ -230,7 +230,6 @@ static int ttm_buffer_object_transfer(struct
>>>> ttm_buffer_object *bo,
>>>>         */
>>>>          atomic_inc(&ttm_glob.bo_count);
>>>> -    INIT_LIST_HEAD(&fbo->base.ddestroy);
>>>>        drm_vma_node_reset(&fbo->base.base.vma_node);
>>>>          kref_init(&fbo->base.kref);
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
>>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>>> index e7147e304637..e9bedca4dfdc 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>>> @@ -175,16 +175,6 @@ int ttm_device_swapout(struct ttm_device *bdev,
>>>> struct ttm_operation_ctx *ctx,
>>>>    }
>>>>    EXPORT_SYMBOL(ttm_device_swapout);
>>>>    -static void ttm_device_delayed_workqueue(struct work_struct *work)
>>>> -{
>>>> -    struct ttm_device *bdev =
>>>> -        container_of(work, struct ttm_device, wq.work);
>>>> -
>>>> -    if (!ttm_bo_delayed_delete(bdev, false))
>>>> -        schedule_delayed_work(&bdev->wq,
>>>> -                      ((HZ / 100) < 1) ? 1 : HZ / 100);
>>>> -}
>>>> -
>>>>    /**
>>>>     * ttm_device_init
>>>>     *
>>>> @@ -215,15 +205,19 @@ int ttm_device_init(struct ttm_device *bdev,
>>>> struct ttm_device_funcs *funcs,
>>>>        if (ret)
>>>>            return ret;
>>>>    +    bdev->wq = alloc_workqueue("ttm", WQ_MEM_RECLAIM | WQ_HIGHPRI,
>>>> 16);
>>>> +    if (!bdev->wq) {
>>>> +        ttm_global_release();
>>>> +        return -ENOMEM;
>>>> +    }
>>>> +
>>>>        bdev->funcs = funcs;
>>>>          ttm_sys_man_init(bdev);
>>>>        ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
>>>>          bdev->vma_manager = vma_manager;
>>>> -    INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
>>>>        spin_lock_init(&bdev->lru_lock);
>>>> -    INIT_LIST_HEAD(&bdev->ddestroy);
>>>>        INIT_LIST_HEAD(&bdev->pinned);
>>>>        bdev->dev_mapping = mapping;
>>>>        mutex_lock(&ttm_global_mutex);
>>>> @@ -247,10 +241,8 @@ void ttm_device_fini(struct ttm_device *bdev)
>>>>        list_del(&bdev->device_list);
>>>>        mutex_unlock(&ttm_global_mutex);
>>>>    -    cancel_delayed_work_sync(&bdev->wq);
>>>> -
>>>> -    if (ttm_bo_delayed_delete(bdev, true))
>>>> -        pr_debug("Delayed destroy list was clean\n");
>>>> +    drain_workqueue(bdev->wq);
>>>> +    destroy_workqueue(bdev->wq);
>>>>          spin_lock(&bdev->lru_lock);
>>>>        for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>>>> index 7758347c461c..69e62bbb01e3 100644
>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>> @@ -92,7 +92,6 @@ struct ttm_tt;
>>>>     * @ttm: TTM structure holding system pages.
>>>>     * @evicted: Whether the object was evicted without user-space
>>>> knowing.
>>>>     * @deleted: True if the object is only a zombie and already deleted.
>>>> - * @ddestroy: List head for the delayed destroy list.
>>>>     * @swap: List head for swap LRU list.
>>>>     * @offset: The current GPU offset, which can have different meanings
>>>>     * depending on the memory type. For SYSTEM type memory, it should
>>>> be 0.
>>>> @@ -135,19 +134,14 @@ struct ttm_buffer_object {
>>>>        struct ttm_tt *ttm;
>>>>        bool deleted;
>>>>        struct ttm_lru_bulk_move *bulk_move;
>>>> +    unsigned priority;
>>>> +    unsigned pin_count;
>>>>          /**
>>>> -     * Members protected by the bdev::lru_lock.
>>>> -     */
>>>> -
>>>> -    struct list_head ddestroy;
>>>> -
>>>> -    /**
>>>> -     * Members protected by a bo reservation.
>>>> +     * @delayed_delete: Work item used when we can't delete the BO
>>>> +     * immediately
>>>>         */
>>>> -
>>>> -    unsigned priority;
>>>> -    unsigned pin_count;
>>>> +    struct work_struct delayed_delete;
>>>>          /**
>>>>         * Special members that are protected by the reserve lock
>>>> @@ -448,8 +442,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>>>>      int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>                 void *buf, int len, int write);
>>>> -bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>>>> -
>>>>    vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
>>>>      #endif
>>>> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
>>>> index 95b3c04b1ab9..4f3e81eac6f3 100644
>>>> --- a/include/drm/ttm/ttm_device.h
>>>> +++ b/include/drm/ttm/ttm_device.h
>>>> @@ -251,11 +251,6 @@ struct ttm_device {
>>>>         */
>>>>        spinlock_t lru_lock;
>>>>    -    /**
>>>> -     * @ddestroy: Destroyed but not yet cleaned up buffer objects.
>>>> -     */
>>>> -    struct list_head ddestroy;
>>>> -
>>>>        /**
>>>>         * @pinned: Buffer objects which are pinned and so not on any
>>>> LRU list.
>>>>         */
>>>> @@ -270,7 +265,7 @@ struct ttm_device {
>>>>        /**
>>>>         * @wq: Work queue structure for the delayed delete workqueue.
>>>>         */
>>>> -    struct delayed_work wq;
>>>> +    struct workqueue_struct *wq;
>>>>    };
>>>>      int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t
>>>> gfp_flags);

