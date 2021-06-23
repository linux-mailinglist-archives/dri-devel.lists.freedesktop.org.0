Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F5A3B1611
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986C76E884;
	Wed, 23 Jun 2021 08:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2051.outbound.protection.outlook.com [40.107.101.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0806E884;
 Wed, 23 Jun 2021 08:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYbnYTJFO+T6KA7blgMgo25w7Fgv/An7d64xEbDgbyJ/iBuFerucmaCVGp7i17igccAf0GapvgsbsAJk4kJLxkWE8fiHZoDm6OOqZOEAjBLZ9ctDkUQdKFMa9ZKnhvdd4AjOtG1LHA4SUZ92m05J6bYuQsQa48ihlnwbQCkjiAlt/llsbTTctOpRjFwTMx+YmjbsOJMZzgocRSKevoTn3VLWUny9SkBdeO2RggmGaq6lb+cxR8ULqHuqUb5VGgNI/o1ZYQYdPAc95NrMEr8c2mrX+acxvpWEyh+ABTyP9HiyvE47Wz0sjFCm9/DtXozl1xlASPkE0LBk5xVh/ecBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRWxGvUUg8QU8zipaNP5hsOJMZE9GtX7yzzg69y+RzE=;
 b=n4eYlKZGJQVfbmV6koHrvLmLJMHC+PQt0gXICugA8w8IkjJq7ssx+/kz5sIyDdsm4zEv/sAPXbpYEcRd+aL0GCRoiaf0bj4327+mPksIbwsYJ9GMsRjxd1v5X1Htv8M/bFkB+EvRKJguKEcoRBOuEZHwHtnFGw4lmvq9eTxwjHDaJsmEmRgQBT0JlhBqO61cjztgk9vpIcgq0SyaHoZIXTmpTZEVKKvBB0J0daw39IF4A2ZL1zdVcHFg5mVHf9agy4TkuAOkFR8y2/WcC4ixA7s1cH/rDF/EU9dfMZFJMaOi2THjrUgpdg1Uk1YTikFJqLBiX8kmx6zVdjJ7hI63/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRWxGvUUg8QU8zipaNP5hsOJMZE9GtX7yzzg69y+RzE=;
 b=11wjgAXv2LGNb/YFFgV3myrR6a3wFRWjl0cvCEj0guiNTFMGzLylRvHVX9izx+JePdCN3zuZdYxd6QXn5oRytwGI57FtyvlvRTy8mjaGjNmHbeI78r/MkFhrAOifVS8PzYno3KsH6aJkMkX5Gu934BtjqdF5hwsqdU1boROflGk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (10.255.86.19) by
 MN2PR12MB4239.namprd12.prod.outlook.com (52.135.48.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18; Wed, 23 Jun 2021 08:41:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 08:41:41 +0000
Subject: Re: [PATCH 03/15] dma-buf: Document dma-buf implicit fencing/resv
 fencing rules
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-4-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ec1a0d01-f425-12b7-1a37-4b411064a677@amd.com>
Date: Wed, 23 Jun 2021 10:41:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622165511.3169559-4-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:69e4:a619:aa86:4e9c]
X-ClientProxiedBy: FR3P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::8) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:69e4:a619:aa86:4e9c]
 (2a02:908:1252:fb60:69e4:a619:aa86:4e9c) by
 FR3P281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Wed, 23 Jun 2021 08:41:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a051efd1-3e09-41ba-fd67-08d93622b89f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB423952A7B1AADC2E8B06EADE83089@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8GXNFTqpDbzvFQHi+Djcw2G2tGPWhKiWEXjVWMiLzfTSBH8s4oDPsF1M971fPQRDuB5wshsIqrflOQtvCxxP2jE9F+vPxuaXJPR0Nl7CTVrwnUhhOulnwtwVWSxiFvz+V7HCSkf+iOHoDa+OQBPF5SNhJwuLoG6rjih3cWp5Ayc467TQHwLlSgBzcRhWY8kCrfZCf6rtUF1ylTtusuKScSJxUDzkowVvCuZHVWqBVcaCKjWKHJaXLXIicw/fe3SRKjl5asw68A8qEXWva0DhJIzmQVZpI/DDeXoUeK0bJkBfczsky2/X9nVX02+sfErAhN3CISBkS+MwkYYZj2EjBT7J+n7+uQE+bV3UDTL5JIge5Pnux5JBkf3GAZU5ki56N7oJByYhTfZJkmiKuo56WZQQLnMyXxsm6iAMc63nkh+lkKRl1r8gRL+pyTHoBsHwpqqrKZAs4tGiIPR6z3ihThtKjVgRbbRFSETRIUMZ0Qt7VdB6sPntZiG3DR59KuoVXMok9DeruqiCbVDvgRfjeOrNXuWrQnCVkEiRMULky2SftfeIkCQR9l4dk7VSVUE9ErMO0gUT9NqfDovfGRY/p8aOQg0r/tckp+12AvgzED9d6axC5eJq66ZQWROhrIHAnijb1SSnMhrINJOivwpx5zi9dFDzrHsxSvJSXMVkjPiIDEqy6rII0+eD5c+Z1agCvgi3hsqwT/64C8cm6cfjv9omFAxTVjtdJdQmPLj/26WQm07nUKWKp+psqK/CrQpDqoyuNZqsn2bVsgaljiSmqof7OZUIaLHM2S+165uRZfcojf+7AOFDqDQmpm1K5KnHYR5oP/JGBzLMTrb+f+qwJsw6Qfq9qfv3iLlXN7yU+6v4MtaB59LAsoUuQfj4yiKG0LhmTLY3yeiLuq0dW1GOVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(8676002)(66556008)(6486002)(66476007)(2616005)(36756003)(8936002)(66946007)(45080400002)(316002)(186003)(16526019)(86362001)(478600001)(966005)(31696002)(66574015)(6666004)(30864003)(110136005)(83380400001)(31686004)(4326008)(7416002)(54906003)(38100700002)(5660300002)(2906002)(21314003)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkR1M3NhamlIYVdsY01rb2daUDdKeUtZaUJUK3V2WG14UTk4ZEdaRXNTbGc2?=
 =?utf-8?B?SHVMdGw2NzRPOG1VS1g3U3hvWEtaM2xocU9zUXhXQU1BN3VwblRkSTdyWGJB?=
 =?utf-8?B?dGxqV0RRaEVqanZDdlZWMG1XYjVZazc1RUhzS1NjWVBGZWxTbVUxcEw0M2Fn?=
 =?utf-8?B?N1E2SWQrK2JDemNIcjkrWDF1Rmtid3NKOStuZ2NGVDBQbDA5cStZVWlIczFP?=
 =?utf-8?B?clFsazNtaEpaT3VIVnNXNnQ3cTBvMGNmbENjUWNBTURwMUk0VEpncHBWOFE0?=
 =?utf-8?B?dHNpRnhXbkZhdGpucHBOM1hmRVRCcTB0cnVDSEJoZFBTRkEyRjBLSEo3TmNl?=
 =?utf-8?B?TnFxYVh5elhpK2RzdnFKOUc1aFA5VmZtSklWeTJlYjk2akorODFhcGY1MVYv?=
 =?utf-8?B?dStGSHhjMlcwdjdxSmRqd1pXdlNmZXVkWENIcnNvUjRYdFk3b2M2b21CL29z?=
 =?utf-8?B?eFVCeXpaeGRFaGJXbm0zL1ZHQ3Bzd2hJWEZPTzRpc20vWS8yN0lGaFF4NGZM?=
 =?utf-8?B?dTZpODZmc3NpRXRQWms0Y3AvckhHV3JneU42eTkvZ3p5Mmo1WGpHY3hWbW1O?=
 =?utf-8?B?bVlUVFFjbjNaaHpvbzUzT2VEVDdwVFgzQ0p3Rm0yKytXTisvZlRyRlZEclpo?=
 =?utf-8?B?clRSWm9XYjZSL0tzL1ZCUkpsY0NUYWR2TFk4cTU3bUsyajZ2UG0zU1pmalpP?=
 =?utf-8?B?cGhodVhDbUN5bUlMSFhoMHFNUnIzVUR5M2ZqVURmSTRNckVTa1NMUzg5bHFJ?=
 =?utf-8?B?bEFHbC9GQS9sanlYTlZIS3Fsd1VTeHBCWG94TTNLRVpYMCtGQjNWUTdCalQy?=
 =?utf-8?B?N0NBdFl2YUk1Y0FaenRBczNwdEZoeFRWSE1BY2FJZUdxN1pPQ2pHYjdUYlZS?=
 =?utf-8?B?N2dNbFdZaHduQm02U0JybldPQzAxZFhNUXRTUTQxcm11NTFrQTYxV3BFNGgv?=
 =?utf-8?B?a1dHMTdPTS9NTnBGYXFiNzdLODJFZTIyTXUvcUNrRjBLQjBFc2d3SXdGMVU4?=
 =?utf-8?B?ZUhJNkhVcWF1MG9GYjgvSVFuWXN0OUZ4aHBueWtzcVFBdHEyOVFiTEJVbEFL?=
 =?utf-8?B?dmxidGQ5dDZVbjJsOThqQVh6akJnU3d4WHFvVUtCSDQweDBKOHdoUm1WdWRE?=
 =?utf-8?B?VUZ1K0hSeEYvRXhZaWpWcnBBMFpjQmY2WElveGEzWVFMdy9WSEpRQkZWQ2xG?=
 =?utf-8?B?d1VQaDlBRFJuTVh5VHZJMnd0WHQ4cmgxamVwb3lreDVNcUxHUHRhMC9iaG5U?=
 =?utf-8?B?ZWU3VVNqZWJHcHJURnVOdUljRm1LcjQzN3h2U2l0bG5Uc252RzFDZ2MrSmpu?=
 =?utf-8?B?KzBERkhSeTZUSjB4NFErTDRDbFJLYVEweWJJOVltQzQvcXdKRlBaNWhuSmJa?=
 =?utf-8?B?QXgwb2lvS1AxRS84VmZhMHhYQjN6MzV3YTgrRTNRSVFCUWVUSHBCMjEwQThu?=
 =?utf-8?B?SFFzZjJ1bkYrR1BrSk5XYUp5QUVreVpCTWw4NEZ1YkJoMEc3UExVZVdQeUVx?=
 =?utf-8?B?ZG5vZDhBa3JIckZYdW15N1FVQkxYZ3lNcXJiNFNzaGVyaldzTFVabzJGcWpP?=
 =?utf-8?B?U2hwaW9HMjBNMDR6T3luM3NsdEZRSHRENm1TVGQvcXJIRnVLWXdPQ2FZVk14?=
 =?utf-8?B?Um1QY1h3MjdPS2VrQnRNTER1b1RrdjBIZGFGclBpSm9PWk4renNjSXk2U0RD?=
 =?utf-8?B?VGNUMTM2bTZqOWMwbG10KzUxeVhPbjRYdkhacjZ5U2xkZS96a0Y3eE5DMTF0?=
 =?utf-8?B?RDkySHI0YzZPVUlDMjlaRmdUd0tMc1JWb1VIVDNCOXhVWVZJM3RzcjdVSXBC?=
 =?utf-8?B?UlF2TFQ3REVKeDQyYnJlRVJ4c20vK1AvdEg2UWZzdlRmUTFmREpob1NkemYx?=
 =?utf-8?Q?a5ymKO3tt2Kg6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a051efd1-3e09-41ba-fd67-08d93622b89f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 08:41:40.9353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkOIee4zUf4mM/LcN7UGNGZUV1cb3otk9kLStUGHIavFCtBO0OdoYQtuZM+QvxC8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>, linaro-mm-sig@lists.linaro.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.21 um 18:54 schrieb Daniel Vetter:
> Docs for struct dma_resv are fairly clear:
>
> "A reservation object can have attached one exclusive fence (normally
> associated with write operations) or N shared fences (read
> operations)."
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdri.freedesktop.org%2Fdocs%2Fdrm%2Fdriver-api%2Fdma-buf.html%23reservation-objects&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C42d8c70b62084a846e9508d9359e8629%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637599777264104449%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=rcd4i0VpK3BhwFLzsxd66OhshdJJh3yhRo2MOqlCEBo%3D&amp;reserved=0
>
> Furthermore a review across all of upstream.
>
> First of render drivers and how they set implicit fences:
>
> - nouveau follows this contract, see in validate_fini_no_ticket()
>
> 			nouveau_bo_fence(nvbo, fence, !!b->write_domains);
>
>    and that last boolean controls whether the exclusive or shared fence
>    slot is used.
>
> - radeon follows this contract by setting
>
> 		p->relocs[i].tv.num_shared = !r->write_domain;
>
>    in radeon_cs_parser_relocs(), which ensures that the call to
>    ttm_eu_fence_buffer_objects() in radeon_cs_parser_fini() will do the
>    right thing.
>
> - vmwgfx seems to follow this contract with the shotgun approach of
>    always setting ttm_val_buf->num_shared = 0, which means
>    ttm_eu_fence_buffer_objects() will only use the exclusive slot.
>
> - etnaviv follows this contract, as can be trivially seen by looking
>    at submit_attach_object_fences()
>
> - i915 is a bit a convoluted maze with multiple paths leading to
>    i915_vma_move_to_active(). Which sets the exclusive flag if
>    EXEC_OBJECT_WRITE is set. This can either come as a buffer flag for
>    softpin mode, or through the write_domain when using relocations. It
>    follows this contract.
>
> - lima follows this contract, see lima_gem_submit() which sets the
>    exclusive fence when the LIMA_SUBMIT_BO_WRITE flag is set for that
>    bo
>
> - msm follows this contract, see msm_gpu_submit() which sets the
>    exclusive flag when the MSM_SUBMIT_BO_WRITE is set for that buffer
>
> - panfrost follows this contract with the shotgun approach of just
>    always setting the exclusive fence, see
>    panfrost_attach_object_fences(). Benefits of a single engine I guess
>
> - v3d follows this contract with the same shotgun approach in
>    v3d_attach_fences_and_unlock_reservation(), but it has at least an
>    XXX comment that maybe this should be improved
>
> - v4c uses the same shotgun approach of always setting an exclusive
>    fence, see vc4_update_bo_seqnos()
>
> - vgem also follows this contract, see vgem_fence_attach_ioctl() and
>    the VGEM_FENCE_WRITE. This is used in some igts to validate prime
>    sharing with i915.ko without the need of a 2nd gpu
>
> - vritio follows this contract again with the shotgun approach of
>    always setting an exclusive fence, see virtio_gpu_array_add_fence()
>
> This covers the setting of the exclusive fences when writing.
>
> Synchronizing against the exclusive fence is a lot more tricky, and I
> only spot checked a few:
>
> - i915 does it, with the optional EXEC_OBJECT_ASYNC to skip all
>    implicit dependencies (which is used by vulkan)
>
> - etnaviv does this. Implicit dependencies are collected in
>    submit_fence_sync(), again with an opt-out flag
>    ETNA_SUBMIT_NO_IMPLICIT. These are then picked up in
>    etnaviv_sched_dependency which is the
>    drm_sched_backend_ops->dependency callback.
>
> - v4c seems to not do much here, maybe gets away with it by not having
>    a scheduler and only a single engine. Since all newer broadcom chips than
>    the OG vc4 use v3d for rendering, which follows this contract, the
>    impact of this issue is fairly small.
>
> - v3d does this using the drm_gem_fence_array_add_implicit() helper,
>    which then it's drm_sched_backend_ops->dependency callback
>    v3d_job_dependency() picks up.
>
> - panfrost is nice here and tracks the implicit fences in
>    panfrost_job->implicit_fences, which again the
>    drm_sched_backend_ops->dependency callback panfrost_job_dependency()
>    picks up. It is mildly questionable though since it only picks up
>    exclusive fences in panfrost_acquire_object_fences(), but not buggy
>    in practice because it also always sets the exclusive fence. It
>    should pick up both sets of fences, just in case there's ever going
>    to be a 2nd gpu in a SoC with a mali gpu. Or maybe a mali SoC with a
>    pcie port and a real gpu, which might actually happen eventually. A
>    bug, but easy to fix. Should probably use the
>    drm_gem_fence_array_add_implicit() helper.
>
> - lima is nice an easy, uses drm_gem_fence_array_add_implicit() and
>    the same schema as v3d.
>
> - msm is mildly entertaining. It also supports MSM_SUBMIT_NO_IMPLICIT,
>    but because it doesn't use the drm/scheduler it handles fences from
>    the wrong context with a synchronous dma_fence_wait. See
>    submit_fence_sync() leading to msm_gem_sync_object(). Investing into
>    a scheduler might be a good idea.
>
> - all the remaining drivers are ttm based, where I hope they do
>    appropriately obey implicit fences already. I didn't do the full
>    audit there because a) not follow the contract would confuse ttm
>    quite well and b) reading non-standard scheduler and submit code
>    which isn't based on drm/scheduler is a pain.
>
> Onwards to the display side.
>
> - Any driver using the drm_gem_plane_helper_prepare_fb() helper will
>    correctly. Overwhelmingly most drivers get this right, except a few
>    totally dont. I'll follow up with a patch to make this the default
>    and avoid a bunch of bugs.
>
> - I didn't audit the ttm drivers, but given that dma_resv started
>    there I hope they get this right.
>
> In conclusion this IS the contract, both as documented and
> overwhelmingly implemented, specically as implemented by all render
> drivers except amdgpu.
>
> Amdgpu tried to fix this already in
>
> commit 049aca4363d8af87cab8d53de5401602db3b9999
> Author: Christian König <christian.koenig@amd.com>
> Date:   Wed Sep 19 16:54:35 2018 +0200
>
>      drm/amdgpu: fix using shared fence for exported BOs v2
>
> but this fix falls short on a number of areas:
>
> - It's racy, by the time the buffer is shared it might be too late. To
>    make sure there's definitely never a problem we need to set the
>    fences correctly for any buffer that's potentially exportable.
>
> - It's breaking uapi, dma-buf fds support poll() and differentitiate
>    between, which was introduced in
>
> 	commit 9b495a5887994a6d74d5c261d012083a92b94738
> 	Author: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> 	Date:   Tue Jul 1 12:57:43 2014 +0200
>
> 	    dma-buf: add poll support, v3
>
> - Christian König wants to nack new uapi building further on this
>    dma_resv contract because it breaks amdgpu, quoting
>
>    "Yeah, and that is exactly the reason why I will NAK this uAPI change.
>
>    "This doesn't works for amdgpu at all for the reasons outlined above."
>
>    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2Ff2eb6751-2f82-9b23-f57e-548de5b729de%40gmail.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C42d8c70b62084a846e9508d9359e8629%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637599777264114436%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=CboicEqZau1%2FlEgEM3w4Ye2Nq6wULjePIehxaMqW3Fg%3D&amp;reserved=0
>
>    Rejecting new development because your own driver is broken and
>    violates established cross driver contracts and uapi is really not
>    how upstream works.
>
> Now this patch will have a severe performance impact on anything that
> runs on multiple engines. So we can't just merge it outright, but need
> a bit a plan:
>
> - amdgpu needs a proper uapi for handling implicit fencing. The funny
>    thing is that to do it correctly, implicit fencing must be treated
>    as a very strange IPC mechanism for transporting fences, where both
>    setting the fence and dependency intercepts must be handled
>    explicitly. Current best practices is a per-bo flag to indicate
>    writes, and a per-bo flag to to skip implicit fencing in the CS
>    ioctl as a new chunk.
>
> - Since amdgpu has been shipping with broken behaviour we need an
>    opt-out flag from the butchered implicit fencing model to enable the
>    proper explicit implicit fencing model.
>
> - for kernel memory fences due to bo moves at least the i915 idea is
>    to use ttm_bo->moving. amdgpu probably needs the same.
>
> - since the current p2p dma-buf interface assumes the kernel memory
>    fence is in the exclusive dma_resv fence slot we need to add a new
>    fence slot for kernel fences, which must never be ignored. Since
>    currently only amdgpu supports this there's no real problem here
>    yet, until amdgpu gains a NO_IMPLICIT CS flag.
>
> - New userspace needs to ship in enough desktop distros so that users
>    wont notice the perf impact. I think we can ignore LTS distros who
>    upgrade their kernels but not their mesa3d snapshot.
>
> - Then when this is all in place we can merge this patch here.
>
> What is not a solution to this problem here is trying to make the
> dma_resv rules in the kernel more clever. The fundamental issue here
> is that the amdgpu CS uapi is the least expressive one across all
> drivers (only equalled by panfrost, which has an actual excuse) by not
> allowing any userspace control over how implicit sync is conducted.
>
> Until this is fixed it's completely pointless to make the kernel more
> clever to improve amdgpu, because all we're doing is papering over
> this uapi design issue. amdgpu needs to attain the status quo
> established by other drivers first, once that's achieved we can tackle
> the remaining issues in a consistent way across drivers.
>
> v2: Bas pointed me at AMDGPU_GEM_CREATE_EXPLICIT_SYNC, which I
> entirely missed.
>
> This is great because it means the amdgpu specific piece for proper
> implicit fence handling exists already, and that since a while. The
> only thing that's now missing is
> - fishing the implicit fences out of a shared object at the right time
> - setting the exclusive implicit fence slot at the right time.
>
> Jason has a patch series to fill that gap with a bunch of generic
> ioctl on the dma-buf fd:
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-1-jason%40jlekstrand.net%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C42d8c70b62084a846e9508d9359e8629%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637599777264114436%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2FXL98%2F2%2F1GZOICxCTPTzfIvcSm144vPBjUDM29aeyF8%3D&amp;reserved=0
>
> v3: Since Christian has fixed amdgpu now in
>
> commit 8c505bdc9c8b955223b054e34a0be9c3d841cd20 (drm-misc/drm-misc-next)
> Author: Christian König <christian.koenig@amd.com>
> Date:   Wed Jun 9 13:51:36 2021 +0200
>
>      drm/amdgpu: rework dma_resv handling v3
>
> Use the audit covered in this commit message as the excuse to update
> the dma-buf docs around dma_buf.resv usage across drivers.
>
> Since dynamic importers have different rules also hammer these in
> again while we're at it.
>
> Cc: mesa-dev@lists.freedesktop.org
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Kristian H. Kristensen <hoegsberg@google.com>
> Cc: Michel Dänzer <michel@daenzer.net>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: Dennis Li <Dennis.Li@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   include/linux/dma-buf.h | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 6d18b9e448b9..4807cefe81f5 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -388,6 +388,45 @@ struct dma_buf {
>   	 * @resv:
>   	 *
>   	 * Reservation object linked to this dma-buf.
> +	 *
> +	 * IMPLICIT SYNCHRONIZATION RULES:
> +	 *
> +	 * Drivers which support implicit synchronization of buffer access as
> +	 * e.g. exposed in `Implicit Fence Poll Support`_ should follow the
> +	 * below rules.
> +	 *
> +	 * - Drivers should add a shared fence through
> +	 *   dma_resv_add_shared_fence() for anything the userspace API
> +	 *   considers a read access. This highly depends upon the API and
> +	 *   window system: E.g. OpenGL is generally implicitly synchronized on
> +	 *   Linux, but explicitly synchronized on Android. Whereas Vulkan is
> +	 *   generally explicitly synchronized for everything, and window system
> +	 *   buffers have explicit API calls (which then need to make sure the
> +	 *   implicit fences store here in @resv are updated correctly).
> +	 *
> +	 * - Similarly drivers should set the exclusive fence through
> +	 *   dma_resv_add_excl_fence() for anything the userspace API considers
> +	 *   write access.
> +	 *
> +	 * - Drivers may just always set the exclusive fence, since that only
> +	 *   causes unecessarily synchronization, but no correctness issues.
> +	 *
> +	 * - Some drivers only expose a synchronous userspace API with no
> +	 *   pipelining across drivers. These do not set any fences for their
> +	 *   access. An example here is v4l.
> +	 *
> +	 * DYNAMIC IMPORTER RULES:
> +	 *
> +	 * Dynamic importers, see dma_buf_attachment_is_dynamic(), have
> +	 * additional constraints on how they set up fences:
> +	 *
> +	 * - Dynamic importers must obey the exclusive fence and wait for it to
> +	 *   signal before allowing access to the buffer's underlying storage
> +	 *   through.
> +	 *
> +	 * - Dynamic importers should set fences for any access that they can't
> +	 *   disable immediately from their @dma_buf_attach_ops.move_notify
> +	 *   callback.
>   	 */
>   	struct dma_resv *resv;
>   

