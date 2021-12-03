Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB079467995
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 15:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D3A737CB;
	Fri,  3 Dec 2021 14:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2D9737CB;
 Fri,  3 Dec 2021 14:42:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvDZpTyvm5fzm7ySgM6yhxAlS/xwR3jshEgQT91idP0N1msgyPPBkscaqZWvr66oZhSfegSTX142iFBNX0oR4zJn/ah3vM1NiJpuK80/e+RN4JT1v+YNxfslwT/ESsuo7i4tsintgLhdVPTJBIl/YBLNtFF1JB68xUXZFcqMAWYQtiFvbrnuN4ojsLJhfQlMGcD39iBcl8znAaKvFsT3hWr9NBuPgVpxv6v6fr3zZMx2jtHjBkLuHTJJiPRZFL1XF9JueaHp5GkgjVDFmION2F8QH5I8L60ZXKfUddJM6+yKhZMNoH95u06x/NvkIHbZceKU1q6Xpy29zLShO4/3LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKPUOb7RyRnPWQKjUX6ByzRJPZVHKryh8zHC9WhoVmU=;
 b=O71FRd55zD0kOrFU6ZXPTd3D1m+YGlAvyF+i1zgzjXaYqDD6A/BiDvlHvzt3ZRApPwYZui8anaUg9QkJo5egSrtSL2xKwh8987dwXmyQ/NeE7XRPs3dnSL+Pcq4bcOGDgM4E3E5pgBj0pWGtywxeheNge1BU1meUiHQ80ItaJuqaw+IA7YIJHUJK0zwOosaLgZlV4bis+LlRPNhGofs6kxI1w6/gAjqE7o+maTgq1ySDyVnGhK08XPhFZDuYHcz66No+PcZDs2JlRMWqM77AizkPVxqpY3en87/yKZFznkFO946N4dTVbbi74PvlkrCqBNFQZN1lOaQzOJODGJF0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKPUOb7RyRnPWQKjUX6ByzRJPZVHKryh8zHC9WhoVmU=;
 b=yy0CqB4K3DHJnO3kTKoKdszJ26OCicrhslWZRrdcVT1wCsREIk9yn1Bhp7YXiGmMCgaPQ9+SfNKYAxQ01fOKJadoyQdY4LIdD92HbLxR6kJnxJoKkRdgyjjP4UvhVY0ySyK8DlSsSmQbBZgcF8nLP+lbEGhijNV2jlCkRk3Iqmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2556.namprd12.prod.outlook.com
 (2603:10b6:907:a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 3 Dec
 2021 14:26:42 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 14:26:42 +0000
Subject: Re: [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid establishing a
 locking order between fence classes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <52a7cf8c-59c7-fec0-2274-d19bdc505314@amd.com>
 <57df8b0b-1d65-155f-a9a6-8073bbd4f28f@linux.intel.com>
 <2551da4d-2e51-cc24-7d4a-84ae00a1547c@amd.com>
 <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
 <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
 <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
 <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
 <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
 <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
 <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
 <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
 <4805074d-7039-3eaf-eb5d-5797278b7f31@amd.com>
 <94435e0e-01db-5ae4-e424-64f73a09199f@shipmail.org>
 <a4df4d5f-ea74-8725-aca9-d0edae986e5c@amd.com>
 <fb9f50e2-aeba-6138-0cc0-aed252dc876d@shipmail.org>
 <8a7dbf22-727d-c1ec-1d3f-75e23394fee8@amd.com>
 <d4a9cb5a554ffc3af3d30ecacad6e57533eb7f3b.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f8f1500c-170d-ccf9-ac2d-1484bbdc587e@amd.com>
Date: Fri, 3 Dec 2021 15:26:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d4a9cb5a554ffc3af3d30ecacad6e57533eb7f3b.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM7PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::21) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:4e4f:2719:8872:ca0c]
 (2a02:908:1252:fb60:4e4f:2719:8872:ca0c) by
 AM7PR03CA0011.eurprd03.prod.outlook.com (2603:10a6:20b:130::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 14:26:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f6bd2f6-1bab-4f0e-7eca-08d9b668ed15
X-MS-TrafficTypeDiagnostic: MW2PR12MB2556:
X-Microsoft-Antispam-PRVS: <MW2PR12MB25567D89053A41056B05FE1C836A9@MW2PR12MB2556.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PhNzSYhaAJ+1jBmUwXyaHKmx2FBOPZXijl808+j1GcREqfVhccG5aFNp8kSAqnvTLFhYpDqm0dnFtrnXZdToj5hOQ+4Pa39c76GHlONfgkdagEVs4I1xts2a+yz88EycLswRqhxDSjhyuP30/oUZXp2jELg5zA527cNlxbGiM91cWhqA7GUXVbWVKjiauD67ZSHVV/xyGNLGqf6X8R7Bi+gbb5aYtoLiC4lmkzCukfd585FSYDxXaVd8lBNplOhDnaArH0AiIWF/uEHOTOCzN/ESFQ89IuLdj9yFOQpCyxZRLmBXHzaAKy4fYkbhgfbdBO1lWSwHyiUHrD37mKjLR8hqC4H28VKIco01IE1mMcWlvEimFQuJPAyRa53f9ouAUh+F2wNJdzhnIt1THF6XbXuB5gWJByqFU0oi597oqbo5kBI8XbKRz2Y+G3vRAM44gEtPjpSZdJSdg+7a3v4lwx2a3WJ3IWFtUnl71UXTYoM3wNkrenYFfLy/YINBmR5Qfy0jnFB955y287bYRsVKN0qYIdILsd4KtV4aAKEuKoSExMTwhy0ariipc/+ODLiLcSwuJqs79Rcr6DF1Dt144s2QxwY1kIErxr1bzFj0AJFq5g76tfJlkQz0Bu35Vxx982OxS0aNwRqFKibUo+tNvy61FHAWs3+58mIfK6tLM7FCSfyE+swiqPksgno566C//2B7R/nv72DOf8aQ+CHtiSy2vSghqIsqO9t+5OmD7nknWeTSbwm4s7/GekBQmIr7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6486002)(66574015)(8936002)(6666004)(2616005)(83380400001)(38100700002)(66476007)(66556008)(31686004)(5660300002)(36756003)(2906002)(316002)(508600001)(110136005)(31696002)(86362001)(4326008)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1dVWEk5ZnBwVzBZbElZYzFKcmpTYSt3eW9RRDFzUm9GTkYycmRTcS9TdVY1?=
 =?utf-8?B?eEVUTUtkQS9Bd1hjVVora1dTQmExUjNZSmg2elA2MW9wQ3M1TW5JeXM4NlVp?=
 =?utf-8?B?YzVmeXhOQ1NpQ2g1YkJHM0xGQUc0clRUWTlkb0dWQ1ZlM3ZzVXZaQ2RwanB0?=
 =?utf-8?B?dmFYUDdPd3pZaUJPZm1leGhBVDdRTWVnVVJ1YjRXc2dwSjBBandGRGV2U1pv?=
 =?utf-8?B?ckUxUVQrclE3T0pFTU9rYkFKbWVDUlNyeHRKMkMrekxQSExxZmdtU1h2TFND?=
 =?utf-8?B?WnVIL3dPMUVWdXFEYWQ0WlRhMjA4Tmh5OGU4TmZRK0RiNDM5WGJGUUtibi9S?=
 =?utf-8?B?NXBCZjNENU1YN3ZvMVFIWlIweEs3VHl1Wk41Y3p3MWxXMXEyTEx3R1BNaFFB?=
 =?utf-8?B?aE5PZTluVU5tazlPOE9WRDFyeURjUEhoZ2ZNQkZGVmlScWluRUpCVnJXUE5Y?=
 =?utf-8?B?enNPSG95WnZOcDM2UE1hTTN3R2Y3TXY3cUUvTmlZSkNCYWNKZG5IL1FaamV1?=
 =?utf-8?B?bWhSd1FNQmFUR3A5TTFSL0JXUGFJa3l0aHdiZWpxRDF4VFhyV3czQTlucGw3?=
 =?utf-8?B?QTNHb2NxWVJib28xN2VEWUtCWThsTGIxYlFQOHFjcDZSMWhFMDFtWXlPYVYr?=
 =?utf-8?B?LzJ5b2JmaWVBOVNwV2I2dVptTDlydW50SGVCOUVyOW5RUDRCYkViWGQ4VW90?=
 =?utf-8?B?cnNYZE1aS0hOWTF6Q1NyeU1KRlFRb3grYWU1RmMvS3VoZEI3NXJDTFdUYWJn?=
 =?utf-8?B?ejNlZ0NxTzJFUzlsdUNvbDhRRWRkSFZZMXRvcVdURnNVdkpNUjB2RnhPV2Y1?=
 =?utf-8?B?czd4Z0EwUjNaT21IMTFsV29FeEJpSks2a0pIQnRNWFNIbmNjYTVNblp3TkhU?=
 =?utf-8?B?aEE1d2w2VTVvVHVjY3dEMVl2ZVJuV1NCUXh1SVk5MGxvbmRaSW9lSWRDM2xv?=
 =?utf-8?B?WWRwdlJzMzBudnZIdmVzR01qTlU1TWhIRVRiMWxrMDBjbVhYaUhWNlFjMmM0?=
 =?utf-8?B?OHpYYlpyQk1IWW9MQzZrVEVvUG9nUkJrRXdTb2dVNkRGRXd6cnVWbXh1c1lh?=
 =?utf-8?B?L1dnSldZdWhSb2I4ai9VdTNzekFaZWRneTZEa0hibnNNamFtSEFGOE1wZStT?=
 =?utf-8?B?dUloaGZwV0tWNHlnUnA3T2dtdnFCSGhuMjBDYUYzR1dMZ25uR21yQ0dLVXNU?=
 =?utf-8?B?aHFUc1pDZHVobW5mV05PUWtiWlNxYXBzeVJCV24zUG1TL1J6RHhWQjJhSmJK?=
 =?utf-8?B?NEpNcXNPS2lGTjN3aWhPWWZVMEpOa0VNdHhJQ1lqekU5RGtVNVdDUjEvN1Yx?=
 =?utf-8?B?bGRwSGdTQkltWDQ5cUNTMDB2MHVSQ0JYSE9zSnVaMFQwNjNWUUl2N1gxVjZr?=
 =?utf-8?B?QW5YL3JPRi9qaDNJV3BuZkxRNG5VMFI3VDhVMEJ1eFk4ZmVVaXkwdm5ZYnNE?=
 =?utf-8?B?NFFYbThVcW1QQjZKUkZKOC9RVGVBbklJYjJ4Y2E2ajU1ckg1MWEycjB4RS8x?=
 =?utf-8?B?TWhnWWt4a1p0dW5DNmpCK0RYSDFZMDE5WHU4TUVDd2JwdzBhSzVtWXZFWWlW?=
 =?utf-8?B?TWl4OXJxNW5LeUlSUlBVeDVNV25hQVpQVGJlY3l4Q0tMM3ZiSTFIL3JWTmN6?=
 =?utf-8?B?dXIxUTBBWlMvaTR2RDlHbm4rUm9ONmdTc2JlVUlicnVTWWE5UGVyTUdnUUJo?=
 =?utf-8?B?enoyTFNDRm5VdmlyOE83Z2hEbkpOcmJUYXhOOWhKTFZ6bUp6a2kyN1pEN0I0?=
 =?utf-8?B?bndmSFBsdGZsK3pxUGdwU3l5ZlVBKzNwYmlsdmxjVnMxeDlTbmhFTm1yaFhZ?=
 =?utf-8?B?Nm1Dd2ZFa1FNUVYzOXpDaU5HRm1qcUJYa3VWKzA5cW5GVzZwNFRTQTFWMElM?=
 =?utf-8?B?SmJGWXhIay8xNU1RcVk1eElsYlp5MndxUTYxc2xobStyZEJxWW94S3hhRjR1?=
 =?utf-8?B?clZmODArMHYrLzIrNmtSN3ZHMklsdjJjTENuV2Q1R2dvY1pLUjZDQlp1RkdT?=
 =?utf-8?B?aGx0NFNudm5ZTDd0dTZZQ2NOUGVXOTJ0MkhxbVdzZGJOaUFaU2wyanhwb0lu?=
 =?utf-8?B?ZUFqendNL050TlRmVk9pQ2Y5cEJtWEY5Uk1LQklwNFFHSkZBRklWd1djdndy?=
 =?utf-8?B?N3B4UUFPd2hEaDlWcmFZY2RUVzVPUzB3WENFME53OVFjYURhRGtEajIvVjA0?=
 =?utf-8?Q?07/ubWq7NvtXRq5/9uMLihE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6bd2f6-1bab-4f0e-7eca-08d9b668ed15
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 14:26:42.3827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oW7YdINHyUGQGXltmDLIrtxssZYYUMK6oskIBZdwtrLktCUSf1oqSjCyjYEfcGsE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2556
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Adding Daniel here as well]

Am 03.12.21 um 15:18 schrieb Thomas Hellström:
> [SNIP]
>> Well that's ok as well. My question is why does this single dma_fence
>> then shows up in the dma_fence_chain representing the whole
>> migration?
> What we'd like to happen during eviction is that we
>
> 1) await any exclusive- or moving fences, then schedule the migration
> blit. The blit manages its own GPU ptes. Results in a single fence.
> 2) Schedule unbind of any gpu vmas, resulting possibly in multiple
> fences.
> 3) Most but not all of the remaining resv shared fences will have been
> finished in 2) We can't easily tell which so we have a couple of shared
> fences left.

Stop, wait a second here. We are going a bit in circles.

Before you migrate a buffer, you *MUST* wait for all shared fences to 
complete. This is documented mandatory DMA-buf behavior.

Daniel and I have discussed that quite extensively in the last few month.

So how does it come that you do the blit before all shared fences are 
completed?

> 4) Add all fences resulting from 1) 2) and 3) into the per-memory-type
> dma-fence-chain.
> 5) hand the resulting dma-fence-chain representing the end of migration
> over to ttm's resource manager.
>
> Now this means we have a dma-fence-chain disguised as a dma-fence out
> in the wild, and it could in theory reappear as a 3) fence for another
> migration unless a very careful audit is done, or as an input to the
> dma-fence-array used for that single dependency.
>
>> That somehow doesn't seem to make sense because each individual step
>> of
>> the migration needs to wait for those dependencies as well even when
>> it
>> runs in parallel.
>>
>>> But that's not really the point, the point was that an (at least to
>>> me) seemingly harmless usage pattern, be it real or fictious, ends
>>> up
>>> giving you severe internal- or cross-driver headaches.
>> Yeah, we probably should document that better. But in general I don't
>> see much reason to allow mixing containers. The dma_fence_array and
>> dma_fence_chain objects have some distinct use cases and and using
>> them
>> to build up larger dependency structures sounds really questionable.
> Yes, I tend to agree to some extent here. Perhaps add warnings when
> adding a chain or array as an input to array and when accidently
> joining chains, and provide helpers for flattening if needed.

Yeah, that's probably a really good idea. Going to put it on my todo list.

Thanks,
Christian.

>
> /Thomas
>
>
>> Christian.
>>
>>> /Thomas
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>
>

