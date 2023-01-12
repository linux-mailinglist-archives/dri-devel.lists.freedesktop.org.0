Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EDC666B83
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 08:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C57010E885;
	Thu, 12 Jan 2023 07:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D09410E885;
 Thu, 12 Jan 2023 07:18:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hkty9Fo7MYfDCbBoyHUUL4EswefPp6svUTCLhrEjNYdmn5ULUJJZp87C5Pdpn+oMgzy9BtlR1ptRfxXV1LFdXYqW1cfTyeNEZygJ4g2UCOtTsGcOQ+5UQjAHzkn7Gz4O+qkpPH04WHb8Tby46oEykDrcPOAFEOvNFAXGVD0lcWURgctwffYaelJ7FS2Sf+6Y/Dg4YAtYEEDYYiWLkW5P8zIyxA7SDLDn/IoKD1MwgWdaJEZUf9a9NONDE3MUDVtYeuyFpULYzAn3Hlm+cZVRGop9nMtvsG2BlqPwDEXCG69sdGLlTfJfb744f00kxBbVvumwxEg4s7vRm2d2aEw5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooujp3kb+8nwZoZIqVMBKQgd6eu7GdCm2s++vE+euYI=;
 b=ZF94T32MAOx7rsNb5ubWh73bJXSJdMn6yH3wrW3pTyepC5JxBMQi2v6vNrsoS5CXIpKSROMJ4NaZp7pmwLKlLI8BEHH/UIVq4DxSsAbpbauUb/2Sk5N3/TwPKOfTOewg3xgopmtdJCC5IJT6ch7I+gZO/rcHwEONhyGLADSMUN+gdPQznv8nWbv6VXRY4sFmmUKhL6mZkDtS4eSB3I5HiNIMSPsTRHQxW3k/NAV7mP2VuTOKuPG7JMCDUjZpkcscim7OdSwv7cayFFifXcGOYx3hzlNtPC80dGIJj1U8PmvDvijCMBjGuD16l0diumewvozMLgfvxN5ItRA1ErMhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooujp3kb+8nwZoZIqVMBKQgd6eu7GdCm2s++vE+euYI=;
 b=VNJZb1c6vr2F28+vQzqMyOarTeuf4PEDtDDvJOJSAkLhVpWLHj2UMrwnXTYcTFbF0H7cx5A73nEnoCcWM+asctu0Dc3EumTK2vdBR5MwYD2KH7R0y9mwP/Xl3Js+sw8QVhHBt57AyWq8qTX0eBLXgm+H9plPdRfScYb5lmptCRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7450.namprd12.prod.outlook.com (2603:10b6:806:29a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 07:18:12 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 07:18:12 +0000
Message-ID: <0732729f-f027-acb6-d58d-dac88f1333e7@amd.com>
Date: Thu, 12 Jan 2023 08:18:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/6] Enable KFD to use render node BO mappings
Content-Language: en-US
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230112013157.750568-1-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 3562a472-4ac7-4366-abd6-08daf46d2a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F7m59P1etn5CNj0cBHNR3mCqde5ZmHEft/JjKUy39QJeJgUNXlIVog7Yf9CmL0iL70Gq/R7eBLWa8tL+eX53SI6kWbAhIRN60gxWU09CtkjXUaT4jRgxiqDFgkWxeXfedLQNLnlsJR7EGTuaErx9poZpkbnVe/lL7gWDMmkICJjhjvCAi6Bt95I9RPBythvA3iA57k5k4dTf0pERK7FbfL/b/myPoektNWSl8yme1aX0UK6WITNptjou/ZhhwizRksMqzRdNZ+y98041NTtljf1cNedbTupnfGSE8RbbKNLxxtAIGHL0waPRqicLu6NuXFqLInVKuqwrAioAmh3eMtnc2RyKrSgo2ielgdrC04mpPU/bqRIm742mwl7pIdxOvzc9S8IaqqQhBGTwXwO5w4P1hUagafQpLpU/e6B0wWOJMkM5UOj62PkJPg8Mgabt91+SOGaiCwFPBWdq6uQX44zFFZiz9VBf55HLQh+wmr0yqpu39TOfHTQUt41P53vwVariThYYo1OWNRttVnKvLC2hyX0AbVWzoh3k0qiAWHodkESM/hwE747Tj/CARMeUWWM1ELtZu8m0U1ueirQRmKKDHJEagv1Wll8Dz30d0NHr4rM0uVqa+LzY3lyNRwJgWPrkmXNSIq9S35SCZVbP44Y40YOXAXA69Zw33LpOk25CLepd7Ss2U3xem2+u+u661mxSoT5KbKBNBl3f26e6bF97a6K4LFXYp3wFq/hUYcq0lfhX1OA2cBcALXanAv3eHCoLziX49U4WjUf2bfoRXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199015)(6506007)(186003)(2616005)(6666004)(6512007)(4326008)(86362001)(38100700002)(31696002)(450100002)(66476007)(5660300002)(66556008)(36756003)(478600001)(66574015)(8676002)(66946007)(31686004)(2906002)(26005)(66899015)(316002)(8936002)(41300700001)(6486002)(83380400001)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG4zMVFRMDdjb0FzRGRLZlBMaHRRYlp5TDBzV2NuaTg2MTJNZjA4dzVEWWFZ?=
 =?utf-8?B?NHBDSG1hQnFkREpocTcvQTlFQXM3K1F1S2RIQmJRcWs1U1pLWlFCZlVpYlBH?=
 =?utf-8?B?aUFLSjY2UWdjNlhnQ0MxRzlzMUpmU3FyM2lQdkNuaHlmOGF1b2xPeCszZlJl?=
 =?utf-8?B?R2NpdkF0VE9BSkZJN1RCSEFHbzQ4bTVwaG9jSVNMam0rYnVwRzJJaGw0V3dy?=
 =?utf-8?B?SXZPUEpUQUtoM3prL20xTmxEZHAwUWl5eGFzVEdPYU9QVHNjOE1KeXdWenBv?=
 =?utf-8?B?bUQwVm9MMzk0dU81MW8xbDhsclNGZ2FDMzRVTjd6NUh3ejgzQkNOT0ZsZ1ZG?=
 =?utf-8?B?NFZSVWlxcTlRbzlzajJMMmMzb25pVXFsb21XNjU0UGZvUlhObFE1ODRqVWF3?=
 =?utf-8?B?anRRczJhbnp4cWgrT0d0Tkd3WGYrOWJwS3c0QzkvdXUxQUZNUStiM0FXY2tu?=
 =?utf-8?B?SmdONW5NMVFoM2VNK2JhOGlBWko5UzEyMjBidWVNdElyNy8rOHBaUDJnOUls?=
 =?utf-8?B?L01QdjdQckQwbkJmVlRRTk9QcFp3ZEdLOFI4QXFqeCtTUmlWQnp6a3YzRUV5?=
 =?utf-8?B?Rm9FbEdSWXBJMUU1a1ZXZ1pwMTNmdWE1NVpMN2d0eGxuUHNUb0NTSWtOODNi?=
 =?utf-8?B?U1V2T0ZXdUg2Z1AxL1IvWW5IczY0TWxWbnpwKy8yemhSTVlWa3Nqb1YwbTVo?=
 =?utf-8?B?VXlJZ1QrRmw1THB3MjZNb2JiWjJGSlhJOWlGMFdwOERMT01kRnFCcmk2cTdn?=
 =?utf-8?B?elQ4RTFZL0NXYi9IVmt3aHVxREpyMXVjd2dLY3Q1cGxBRzJrK2RiQ0p1Unlx?=
 =?utf-8?B?eVRXTU5pSHYyUVVZenk0RUNZWDJ3OGg0aDBnak05Y1BNTVJMcTNqWlJ3L2RF?=
 =?utf-8?B?N1FwdTJFcEdJQmRwdjg5RWdrN1lDaWdYZVY3R0c2S1Fia3JoK2FMR1BDaWlT?=
 =?utf-8?B?cVVVS1praTRrTkNNWjUxb1hPK3RvenBhdHNXYnZrbDlGZlhBaU8wUTNDbGhu?=
 =?utf-8?B?SGtDeW1wSVZaZkJjeDZRTFgySTF1eWdWbmdSMUN1ZUFXbzJ4NVpwK3ROQmEv?=
 =?utf-8?B?RjNsS0tPUlJFcS9ET3piSDBHNk0yMEljMlhMSHlxSGRsbGZ4UkxEcHBubHdz?=
 =?utf-8?B?QU96T1BETXgvYmVEMnREd2FMQUgvVHVNYVRSN3hPN1A2b2VURDU0VjVTRUxy?=
 =?utf-8?B?cC9SS0U1VTlsY0VOaTRqRkhqYVNGL1kwVHR6bStOK3F5TndCZ3ZVbll0YXZT?=
 =?utf-8?B?Wk50VUIxN3Z0cy9EYWgxanNRRVM0RVFBVnlNNGhta2ZsaDV2dzZXZUtOb28y?=
 =?utf-8?B?MUhYN21uS3dsZVJaTisrUDZwdkUrNHI1T01NSS9USSsxMEs5WFc4bDhNbG1C?=
 =?utf-8?B?QUI2YTRYeWlTblBvR1NaTHJHOFptL0NheTdLVUZFU1EyWU9vSTNXL3RxWnhy?=
 =?utf-8?B?TUNqUmVQSW90NUxUNG1hODA1TXBwK2c3a25uM1dqWDc4b3prR0ZGdEZVR21x?=
 =?utf-8?B?M1ZJZEVQbnphbEVQRnVkd0hHdWlJZ3MwTVg0MmJFaU1HUmlMR3ptNUNJazlu?=
 =?utf-8?B?S21hcnNBdC9IN0ZKbDlGeUpLUysrK29hY1hGc3Z3ZWdHdG1iZFM0WEZTVStB?=
 =?utf-8?B?UDJFWllKcTl1K0lTVnlKcWtCVFFEeFhpSVJaT2JrUmFmcG5WYXFEdUdGZ0ZI?=
 =?utf-8?B?bXozZUc1T3dPbEdzYWVDaDV0NmlNbHE1c0FSK3ZMUWNualUxTGVBbVVRRDJ6?=
 =?utf-8?B?ZUx6dWFrblA1N1JXRW5HWjVDSlYramtLb29rRnJwMG5IK05QZFlITU9hY0xa?=
 =?utf-8?B?UmhkTGJZMXNlSEh2L0lPdEFkckU2RWxkYWc0VEtyVHRUdVg2ZlZMMXp3ZzdH?=
 =?utf-8?B?Y01GOEMxd1pLRTlpV3EwZHd6U0srbFUrTVZnckVjQjJnNWQvNkNGYnJjeE00?=
 =?utf-8?B?VEl3SWhla09sQ1dYeWZGNGJSRmN1Q0RvUTBCOFpOb1FZaUVhZnk3OERRWnFQ?=
 =?utf-8?B?NUwrOG5RVmduNkYyYitMOEZHa3dULytQRGVyUTREUHZUK3NwNWZjaGNBdmZE?=
 =?utf-8?B?SnZGK2ZxWnBQRElpUHpDelRaWlIxYXBZcUFpWlRIWnBpTU9oZVpIOTBoeDl1?=
 =?utf-8?Q?d9GMhmfvXEc5ysW2NLtdzykW8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3562a472-4ac7-4366-abd6-08daf46d2a37
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 07:18:12.5281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +L/7cFNQPYpQIyqRwxkx3oE4+YjM51RG0dpC0X/tJvSb5hRERbiPAxXg3rPcnJqj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7450
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
Cc: xiaogang.chen@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.01.23 um 02:31 schrieb Felix Kuehling:
> Rebased on latest amd-staging-drm-next. This is meant to be the final
> review of this series, assuming no more issues are found.
>
> This patch series enables KFD to interoperate more closely with DRM render
> nodes. ROCm user mode already uses DRM render nodes to create its GPU VM
> contexts and to CPU-map its GEM buffer objects. This patch series adds an
> API to let KFD export its BOs as DMABufs, so they can be imported into
> the DRM render nodes. This enables more flexible virtual memory mappings
> using DRM_IOCTL_AMDGPU_GEM_VA.
>
> Patches 1 and 2 deal with the exporting and importing of DMABufs.
>
> The remaining patches let KFD validate and update GPUVM mappings managed
> through render nodes.
>
> The user mode side of this patch series can be seen in libhsakmt and
> KFDTest where we improve integration with libdrm (initializing
> amdgpu_device instances) to enable DMABuf imports into the render nodes
> representing KFD GPU VM contexts. KFDTest is modified to test evictions
> and validations of BOs mapped through amdgpu_bo_va_op:
> https://github.com/fxkamd/ROCT-Thunk-Interface/commits/fxkamd/dmabuf
>
> As a consequence, applications using Mesa and ROCm in the same process on
> the same GPU will now share a single render node FD and GPUVM address
> space.
>
> The DMABuf export API will also be used later for upstream IPC and RDMA
> implementations.

Nice, I don't have time to check everything in detail but at least from 
a high level skimming over this I can't see anything obvious wrong.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to the series.

Christian.

>
> Felix Kuehling (6):
>    drm/amdgpu: Generalize KFD dmabuf import
>    drm/amdkfd: Implement DMA buf fd export from KFD
>    drm/amdkfd: Improve amdgpu_vm_handle_moved
>    drm/amdgpu: Attach eviction fence on alloc
>    drm/amdgpu: update mappings not managed by KFD
>    drm/amdgpu: Do bo_va ref counting for KFD BOs
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   2 +
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 196 ++++++++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  18 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   3 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  55 +++++
>   include/uapi/linux/kfd_ioctl.h                |  14 +-
>   8 files changed, 219 insertions(+), 77 deletions(-)
>

