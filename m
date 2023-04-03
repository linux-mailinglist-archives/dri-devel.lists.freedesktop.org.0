Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C7E6D51A7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 21:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBAA10E224;
	Mon,  3 Apr 2023 19:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2070.outbound.protection.outlook.com [40.107.102.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2EA10E095;
 Mon,  3 Apr 2023 19:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFPin2G66HwzSRPeCuVoXbo4gmnLn889E4FuhjjKg1NpzrjEKrAqVtWuHySDQSjUPbBVjcAdzDZmHgvgtJRM7v+I0CW1Ks/7fmvjTGUtkxuIl+7DggPwRYFvHrMyUXDHpwcPPWCI0Rgoo1dLQIPsoIYWNQXQJ3Q80LaZaC+HBqkqjfLptJvlMSH+JB8EkHLBVJjrTYKdHGY3GXDqRPbUfBApJBFjDRFKfdTPiqDiGhj64aR6LsHAVvvZRCf2s3CyT8ngx0WJRDLTx3xvH6Z9LQ9/hS5trjqytwz6Gf8newrP3iBzaHfQLRCJjeAciOtZT0UYD1LnkmBXi5aS0GirmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaFeps5l+reYYPZYwLGn+ZjOuKN6Gcb9A9sw/TukteY=;
 b=ZTasrAegedlmzr/6yVT03GCbe7nx339IO1Y3QCJAgtW77l31VbVUwBtuhVKHuALBw8pQscftvhSvw/dwDdR5bX+Gaqn3f7ssyd6uFNv2AVQgt0bWPh03q3ysTOEfNTpWm7HFwBICF0efExpOMC57PMl4TeH6B86LkwXa4ZvlAm5R6NyZXKo/wUGxGLchQbzswWezxSLyYWZtOcgZe62T1J5ofUGtqINKIdaCzZG2XTanxBdQnHSqu6iBx5eMHCKTKvv5Y17MyKy1/nq+pBcTcPmKz9lrZxduJG+t+SYt2sUdrGwpCu29JecFCjfQY6MbVuHzyNy9jw86zAvaiSDbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaFeps5l+reYYPZYwLGn+ZjOuKN6Gcb9A9sw/TukteY=;
 b=IgGIbJOoMNkx0wKdgk7Fic/gC5SFrh+56g7ijngdHqdpD0eqMN5lKpU/A+ekQjc0D/znpfDqef9e6jyJzwbQdfob3x1et3P2D/fn+yrvf1sJb7gclP/M4N3KpIPVGk0Nkedv9X2ssrIwyfmocU1AFduloo6VySkUo/fbzuzGnmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8980.namprd12.prod.outlook.com (2603:10b6:a03:542::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 19:54:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 19:54:59 +0000
Message-ID: <1567fb39-47a7-d1d5-0652-371f7ffcb71e@amd.com>
Date: Mon, 3 Apr 2023 21:54:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/4] uapi, drm: Add and implement RLIMIT_GPUPRIO
Content-Language: en-US
To: Joshua Ashton <joshua@froggi.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20230403194058.25958-1-joshua@froggi.es>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230403194058.25958-1-joshua@froggi.es>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: b3369f16-b3f0-444e-4d87-08db347d4df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X1nmBguF4XuQtt2BvO99T99z8i+0iNqcVQ1kpD9lxQqMaop447c+jNLLG616FlEvUx/kZUrnzP9FDEai5ilKPCRnlBEMnQnyv+yvxyX/WKSC9D51Uof/ceKPWdAM9l6eDJrGdhQcOkCNGLD+wSJC2i5UMxOoZdMfowDGRCOLUxnSmwNCn5SDjcoRYCGxx6eZEZk/IkkRentlbta7gF/2fd1XJkSWroFlGaIfUCRynWnjaNo4ZoIVTVyBfoa9gwvxQ0V8IcbFKwiTQ0I+VA4Uk982l57m9P7d/O/2jvG+pxEaGI9lAXAem4qWojvj3w0/sLzxBEg9/yVbLw/O+KN68bxNbOrqBFxcRAPHvpiacbXzMQA1vvhfgBaK93CXAmwekzWB4qrD/dtGnksPJkwiOkwU/sn16DnPvl2MghVNaHexqo7nUyELP/qoxm6p5IZSCUKNxEmAzUzT8/cYvYmCrbpAwk7hBpEfzog8pJoepa7dvXLnsQgmdaO12svbZhKQ8uhNIVgvubTYPktWrHyHEyz632Wau2FKztO37FegqFoyx26SZAtVE52aKgWp+U3n11bVY8Nk7l6N8qb3aOplnb3s0YfVabInlESfaDfJ+uxn1dCwSP2Zw73Z8wUIKpz+a/lEeuRviKmT6081XDoULA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199021)(8676002)(66476007)(66946007)(66556008)(478600001)(316002)(8936002)(5660300002)(38100700002)(41300700001)(186003)(83380400001)(6486002)(6666004)(6506007)(6512007)(31696002)(86362001)(36756003)(2906002)(2616005)(31686004)(66899021)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUhpMEo3UWlJK3llNmtKVXFDSmJBWmp4TFJCckFhYU1uU0JHcnErcTRJMitW?=
 =?utf-8?B?bUE2MG9HNzRLOG1mTnFtM0FYNk1JZ1BaTnliOVNaRjM0RlNFRE1kMmR1RWxI?=
 =?utf-8?B?eHZiL2V6aWwrYkJHRTNJUnFMelFoYXV0Q0RrMmNPVkYvTDZLSHU4YUIrdlZt?=
 =?utf-8?B?eVpweXhKM3Z1WmV2M3RnV040Y1hyNkx4MWhWR2lnNXFkTFJYaXlSaTFsd2pD?=
 =?utf-8?B?YnMzbGx2cm8rbTRQVk1jVnoyS1cvbEZ2aDdDeWpMTUFWKzJBQTI2M0ZRU1hR?=
 =?utf-8?B?N25LRzNjN3VjMTE2YytqWVlCVm8rR3Q3NEpzd0dwQjBrNGR6UzByKzkrVHh3?=
 =?utf-8?B?VmNIaWhOQlV2ZVJOcEFTZmxuQmlEenhzVnlBa0owd1NzMW9BRjF6NHlJeGZS?=
 =?utf-8?B?NEpzdnBwd3pyOHlqbUFYdHZWUjd6dllsb084dFUzc0ZTZGROdmFPNFRWMFFy?=
 =?utf-8?B?NnZPTThSUVNrM2NoU3NGRXNaTUNIRWpiM1N5RkptQnhwOE8yU2VaaWt6bTR1?=
 =?utf-8?B?TzdDZW9rUjVyQmYwOE02bURHWnB3dUJmVXFRL1o4aG9OQnViYXA3US9NTGQv?=
 =?utf-8?B?Tm9kOHRjQkpqNlRkMUZFczlqSFNpL013dXFRVndNZUdJdlFzOTRNQXcwRi94?=
 =?utf-8?B?L1oxYWI4ZG9VYU0rdm1sRGFIUDJML0E4L202YnIvQk1lb0llblZXZldVRmJ6?=
 =?utf-8?B?bEc3L0ZYZXpaeHpob0FFWHFkUmJLOWpSQTViVmNaWitXT2d3L0s3RisyY1l6?=
 =?utf-8?B?TE03ZG9wNEp2SUw0YTRwcFpyMk9xYlczNHUrRUxCa3pjbS9KNERHV1o2Nm9n?=
 =?utf-8?B?MFNwa2NNa0FyK3puR1B5QUV2d1lUeDRVYXFWdDdRY2VQUkE5MitUQWU4M0dD?=
 =?utf-8?B?WU9QVUJGdGZ6SHlGUDAwYnhrUFNFNGxTQkVmenlTV240RHFvam9LL2tWSU5j?=
 =?utf-8?B?b1NiNUFyc05ZY2dxVExZUnJLbFhrek8rNnQ2OHJ5ekhVR3lSdy9PRmt5bXNm?=
 =?utf-8?B?MFpVYmhiWUhNSFRwWFJTT2NEak9ueWFXRWV1TmNBUmVkWkJKUDlqaU1rR2F4?=
 =?utf-8?B?TEk2OHFML1FEQU5KaTQyVDlGVG5abkF6bmNvTCtJU3prKytqZWl4NDQ5dlpn?=
 =?utf-8?B?QXF6TG8rVjNTRlk5Mkg4OFB2aWRmSVlQQjRMTG5QZTV1emdxYitmS1RQSytV?=
 =?utf-8?B?REVlY0trdHFZNVAxVnRtcm9zR05aMnZFdnhBdDhIaldTaXdBZEVXblVkak9J?=
 =?utf-8?B?Uk9QZlZLbnFacDQzaXRuQnhDdlJUVWJOVVdSak52R2pSamlMRCtTM3JvOE5X?=
 =?utf-8?B?UEovNGtZZUhzVTlBQnVxa2E3RDd1cXB1UFJWWXVMQWRXa3hZbk5FdHM4Yndt?=
 =?utf-8?B?Tm1mQjBBNEJkemFveFpqUUF6aUpIUWhYZzJTazNLM1dtNkNNTTVsM0xLZDBm?=
 =?utf-8?B?aEVwZ2xaOWhkSWdId3BCN2hqanY0alp6bDZrTE9DYTQ4aHZBMWZxeHYyU1or?=
 =?utf-8?B?b21MNE5TN0V5ZlZRN2ZkZml5M0hPWXdPNklSVE1mbmZxYWc4OExralZ0ZUhD?=
 =?utf-8?B?MEMyWHhXb3ZCL2I4VkJFMFFuUElHSE9ncCthbzRqOW1zMDZsU2NCQlAzU3Vo?=
 =?utf-8?B?MkQzVWJmdUpXYXQ0azF2aC9BNStNdHQzRmMyZ3E4QVprM0VlRjk3WTBXWEVz?=
 =?utf-8?B?V1MxZ3JLZThvVkFUTXZubzkxa3BzeDZyVXFaWDMzalFpUDRVSndWMGllSDVi?=
 =?utf-8?B?MG9sUVp3NjlQODh5MXBEZnVzcUFacytPZFd0TXoySmhhT0w4MWRjNktNZHlF?=
 =?utf-8?B?VmlZdlpNdkI1aUNDV3J4WkJqQ2tYVUxwSlB1RENYQ0ZKZE9nSE4rU3Y1LzhH?=
 =?utf-8?B?cVU2YnZ5cExGMzBsemJwMzdtTXZ2dVBEeHNlbUtmTURKSHB3Y292cHB0T050?=
 =?utf-8?B?M1RTc254azZsTUtuc2RkOFdoZ1ZkenRYM3RxMjlJcU44YTdiNlhVWDZpeUh2?=
 =?utf-8?B?akZPS1RyTG83UFdybzdvWVNxZkVmaFBQaGRUNGZBSXpYVXhyVkhUYUZvUm81?=
 =?utf-8?B?TXBsQXBWdUNtdURCNkRFNER1ZGVhd24rby9ISHNXQWcyZFZvYW01MlVhNlJZ?=
 =?utf-8?B?OFZPSDE2VEQ3NWovRXNlcjYxa2l0alVvdTQrYzZNazJkUjhVYTltMCtEeGw3?=
 =?utf-8?Q?52OLAQ5PLZM768VceNFp9FHCNoQ1tvnWpJlNXOA0VzvB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3369f16-b3f0-444e-4d87-08db347d4df7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 19:54:59.3665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxRF+6j9hP0iIJkwFBK26xU6j8sYaKTiP8HFUvgimHwCmFZ/h4fjvImQUgEDgRLx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8980
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

Am 03.04.23 um 21:40 schrieb Joshua Ashton:
> Hello all!
>
> I would like to propose a new API for allowing processes to control
> the priority of GPU queues similar to RLIMIT_NICE/RLIMIT_RTPRIO.
>
> The main reason for this is for compositors such as Gamescope and
> SteamVR vrcompositor to be able to create realtime async compute
> queues on AMD without the need of CAP_SYS_NICE.
>
> The current situation is bad for a few reasons, one being that in order
> to setcap the executable, typically one must run as root which involves
> a pretty high privelage escalation in order to achieve one
> small feat, a realtime async compute queue queue for VR or a compositor.
> The executable cannot be setcap'ed inside a
> container nor can the setcap'ed executable be run in a container with
> NO_NEW_PRIVS.
>
> I go into more detail in the description in
> `uapi: Add RLIMIT_GPUPRIO`.
>
> My initial proposal here is to add a new RLIMIT, `RLIMIT_GPUPRIO`,
> which seems to make most initial sense to me to solve the problem.
>
> I am definitely not set that this is the best formulation however
> or if this should be linked to DRM (in terms of it's scheduler
> priority enum/definitions) in any way and and would really like other
> people's opinions across the stack on this.
>
> Once initial concern is that potentially this RLIMIT could out-live
> the lifespan of DRM. It sounds crazy saying it right now, something
> that definitely popped into my mind when touching `resource.h`. :-)
>
> Anyway, please let me know what you think!
> Definitely open to any feedback and advice you may have. :D

Well the basic problem is that higher priority queues can be used to 
starve low priority queues.

This starvation in turn is very very bad for memory management since the 
dma_fence's the GPU scheduler deals with have very strong restrictions.

Even exposing this under CAP_SYS_NICE is questionable, so we will most 
likely have to NAK this.

Regards,
Christian.

>
> Thanks!
>   - Joshie
>
> Joshua Ashton (4):
>    drm/scheduler: Add DRM_SCHED_PRIORITY_VERY_HIGH
>    drm/scheduler: Split out drm_sched_priority to own file
>    uapi: Add RLIMIT_GPUPRIO
>    drm/amd/amdgpu: Check RLIMIT_GPUPRIO in priority permissions
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 13 ++++++--
>   drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
>   fs/proc/base.c                          |  1 +
>   include/asm-generic/resource.h          |  3 +-
>   include/drm/drm_sched_priority.h        | 41 +++++++++++++++++++++++++
>   include/drm/gpu_scheduler.h             | 14 +--------
>   include/uapi/asm-generic/resource.h     |  3 +-
>   7 files changed, 58 insertions(+), 19 deletions(-)
>   create mode 100644 include/drm/drm_sched_priority.h
>

