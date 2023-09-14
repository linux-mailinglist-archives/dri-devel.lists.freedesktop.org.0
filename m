Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D84E779F67A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 03:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3846310E140;
	Thu, 14 Sep 2023 01:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8794A10E140;
 Thu, 14 Sep 2023 01:45:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwsBEizSpKEnS3xcKMwCN79X1czbZGIvuUkr0m7d0DBco2KjLCicSz+8to4OsAWSXzmCMv5mLmoVJ5OiOz5yVIu9nurMByuARu5vOHaDSamM4p+Ip+GLNLBfPYamwxb3RdvhH9J29G/Qty5tw6g2erMblQhNQigImIFj+B5zkmDF2NhmqcBlazNs1AAoPvGWC4L20Z9BC/g6eLqZgGIYTedUZf4fuPb34JZiMUHP2Io+woi6HenlsonYojVNgtgdzWr8RuzlP5FrKR5FOdk/qwhgi3C6gU8fpay3nJUvjBZDTbVyVtEk6o5nf9nPevB1PkN58EPWN/HxHzvR7Swlag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6x7TiD9P9K7JJUMmIQ3CkvEQ737psBYMZWYLvTg274=;
 b=LPEm7poLc0kCHXRq7xT+ID2AbH0D1hUF+X93MaUEpvH0h7k25PfWwPqOqv1J/rXCt/O0fnGNr2gqR0rA+kgoSpCaJ2Cby/tdpiZ6X9G4iH6pm+O9quP2eWzyPT6s9uN/9KKH7fq1tlSS+qlwHAR9mrhHP0QlmHHMhy0iVvEMvPUnnDYB3kcX5cMVRBNddcFN6bGARfzokhmNYr3gmEGcR3OCba2clNxi5rFnPmbzQNoMujsodBW0zI/OJ8Zj4h3zbHQhlS5bXvjbYDb9Cp1I2ccZTAZpJll8zgKNsYVNy5fcwPbQ5gsKRID/qJR95eVBiDuslAl930a2N8+MMUWirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6x7TiD9P9K7JJUMmIQ3CkvEQ737psBYMZWYLvTg274=;
 b=HyfdExBNUYoa4/4gXi0By4HP3W3wJGhl98ntIA/fTCeqjzUzBxb0PkiSpJ5M560MrYdzXKdxxoaxgxgMHiYHFH03Vpyi51RpMKcpW2r0vvBixc/PCFNZeFWuK/drjEhIlmBeLjQuzMrCxFKdCMoIgMhuOieWfb3yjkMLRXHMRyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH0PR12MB8824.namprd12.prod.outlook.com (2603:10b6:510:26f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.32; Thu, 14 Sep
 2023 01:45:08 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 01:45:08 +0000
Message-ID: <76f34c75-2268-421b-bf6f-df3c8c427785@amd.com>
Date: Wed, 13 Sep 2023 21:45:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.2
Subject: Re: [PATCH v3 00/13] DRM scheduler changes for Xe
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230912021615.2086698-1-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20230912021615.2086698-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0276.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::13) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH0PR12MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 475117f2-6577-42b8-9773-08dbb4c43a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82BmQuc/XW6zZU37Wci+4ULha1xK61HWbJpCDkFi8mVNUjt/TcL1249hf7GZ53si1tfx/ZLqA/5QyF9fBqZvmg/M1SnKoT7EDHq/cRKASY6yqmL/978t8ralVkL8DoSh+mIMALuUFCSAlEVQFVscXRZE13pxBpfKXlcHhHCkZDyHp7sd7ysoMl8IfpIU0kVIVSBAVPWykEWALAEHMn9iXmerY5fykn6FGlqjWoN1cUzDtxVbRnuT6M7UTOZ3jbl4IFFPiwFnWHlgTqwjqyAQEzNMZkjRc6h8tZEOQBgEgWw1jhMecD0RjZygO5kGv6858Eu7BZQifpHyqDLih3k1RVg5WK5GeZxufHj9gYhVQdDkWGWjVBqzEFiUnyNAlWjDDD6Zfrt0JMSTVe03vsFgXwnvPSk7WODrg+Akf3bNdHLx8q2ZN2uJhTnX68vfpOpln8y0kIgz8g8vQQiP4GFcV+a4iRQ8GNP3868ogqX8c4tUmES5ylREgv4/i8BK1cqzrpQt9bfehhd6IBNihTwqK16sGUDBrDqGSBDjZxxDIfZtGYCupchjB5pDaJ23uMPANlsX7uEg7iElMhXY7kUHg9b4u83kwOr1KRki9JWHAPucCpUHAwD3bzGDHKrFsockcQa48BYpyss8VM++5tL8KO5f1fhHWztramZ1nf9yk2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199024)(1800799009)(186009)(41300700001)(31686004)(6506007)(6486002)(53546011)(6666004)(36756003)(86362001)(31696002)(38100700002)(26005)(316002)(2616005)(2906002)(966005)(44832011)(83380400001)(6512007)(66556008)(8936002)(5660300002)(4326008)(7416002)(478600001)(66946007)(66476007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elhUdlkybUwwckd4UlZBZzFsWEdNSkIvTTYvaGVuTVErYXAyOEQvVTBRb3FX?=
 =?utf-8?B?M1FKUnJCVHpPSjJzUUhzNEtvRTBWTG5nT0FzeE5zNWNiNkZpK1IwWXhROVE5?=
 =?utf-8?B?dWs5QkdPRklTNS9ubVdwVTZ0L09jNGlTMUFPbm1kMk1vc2VxeHI4YWNBOUUw?=
 =?utf-8?B?S0JLUXlZcHBjVCtLS2RZRDE4TXNTbWFDbGNTdXRZbWRoTXE1ME92OFV5cURC?=
 =?utf-8?B?Z284TVowcEkyWmFraDhsMHJwTm1Oc000SXNhTlorSDM3OXU3cHhWQklrVTFx?=
 =?utf-8?B?WktUQ1FSd2VRY1Nhb3ZadG1WZ25Kclg4UUw3QnRSN1kwNU9XaHB6c09MeitS?=
 =?utf-8?B?YXFIWUFkTmV2MWxYaDYvSzA2Y2lJNlUrWXdRdWdDUzR0ZEo1SjVuM1VseW5q?=
 =?utf-8?B?VFhUYjJJdWRWdW1NZ0htcWZnS2pRdS85Q3l4WUVMbGFhaE1Dbk82cFkyMm5U?=
 =?utf-8?B?bXlGMlNjZmV6NzZPTE90clA4SnNtOEJYaHdFTjR5Qzh0R2JPcTJmdmYxekRL?=
 =?utf-8?B?RHZFRTA4cHBKemNETUJlM3o0cnRCWW4vZWc1Ylo2RHNJNzR5VnF1U1dlNTNs?=
 =?utf-8?B?Nk9hL2VaSXRtTGxHdlJPWUxOTElaQzRNM1NIWVgvUTRDaHdNanhYWm51Mzls?=
 =?utf-8?B?OTdUMHBOWm1DQU1qcmlGOC9ENzVsR0Fua1NsUUdDelNMRFpwcy9IalFsN0Zk?=
 =?utf-8?B?cncvRGlBY1lyczVYM2hST3p2c0N2d1pIY05zMk1GbExmT3dUeUVUdkg2NXhj?=
 =?utf-8?B?SjZnUXhwZ1lqZG5idHN2THV0SW90ZUlOdWdvQ0hqeHNWRzVLTHBNYjBlam0v?=
 =?utf-8?B?K2RyU3ZTWXp5eHRGS2RWQXJlV2owZ2FmUUVVWmh5b1RxbjlFL2xsVk1LdXNq?=
 =?utf-8?B?VHlRVlFyVy9NQ0NqcjZHN21WcWFycmJiQjdXdTJxM0RZN2NqdTNnbnRwWXZ4?=
 =?utf-8?B?eUxwYmpDVXFmSkpRb20xY3FZdnIyT0Z5K0puangwUmY5Vlc0Smg1dG5pTktW?=
 =?utf-8?B?ejBCbUdUZjJ3NlpKMmV0Z1pCcnZlUlVZTDNNVTdxdXFoVlkvdHNSWXVjQnNq?=
 =?utf-8?B?eXVrTEUraHdPVEdSbTg5U252Q3k5bHJCTDZocGc0V21tK3dFaksxdmN1QnBR?=
 =?utf-8?B?VEJrQjVXM1dHbkh5M1dhcnBKUE96Y3VVUXg3M2Q1Q1lEUVdSa3lyMDdSdFhK?=
 =?utf-8?B?eTZpUXRDOHlLOUN1Q0xadEhRa24rTjBadmhpU0M1YUpVQm5pbEJwWHlUbWZ5?=
 =?utf-8?B?LzBiQm5SSXJVRkdXOVhlMk1XMnJ5SzU4dCtGSFdZQXNvem5FSjUyaTZwK2Er?=
 =?utf-8?B?dzQ5L0d6NzM2VVpxUkhvZXdtdlhyQXRDTXNRbWxjOTFYVFVHampteTltRExD?=
 =?utf-8?B?ak5IdE9iRk1oaEs3NHlDVWYxNHZnbkVKbUdJNENPV3lhM0lnNG1NU2RodWpW?=
 =?utf-8?B?TERYRWdjMm1kZ1p0cmpzVVZLdGJ1YnlkemRQQkQ4dkhxZ1J6amdDSFRUQXow?=
 =?utf-8?B?TDNhYk1IN09NZm1WbHNKRmRhT1JwRHhHaXRRMnJjNjRaMTJFWVJRMi9aWUNz?=
 =?utf-8?B?d2NWYXJDWlhHRTJ3MDduQjVrbUdUc0d5RWh2Z3Y2ZzZCaDhtVmgyNkZRemJB?=
 =?utf-8?B?aGozNERxUXlKQy93UDByZjBUVmg2QkxzdVg2WDQ2eWx6YlR2YnArTlpkS0lJ?=
 =?utf-8?B?QTlNR2E1S05XcmE1VFl5WUlTUXlWN0YrN3V6Qkg3eHNNNm40REkrSUtqcGxE?=
 =?utf-8?B?NVMvQUVqODZmd1ZGNHA1bEJvYlhPeWJoSEJicU8yNEFMMmxaWDM3Y1FNNU9s?=
 =?utf-8?B?OFZqZ1ROMmxWYUYzVGxxRmp2cHIwQm5sU21YNW5oU2tHOHVCUUtnK0I0SWRQ?=
 =?utf-8?B?YjFFTi92cU9xdXdBRWJMRUk2UDM4N2hlUnpEM1grNmRTSkJwbTlMallRNlMr?=
 =?utf-8?B?T2lYSG04b3ZKY2FEcXdSRFVaM2tJRWxrMVVXZ2g3bzdUQXZ5Q0tYWUE2TTJB?=
 =?utf-8?B?a1Vhdjh4TGZjMVlTbi96VVVpaGJDMllMY0x5dkVhdno3dDhzZlZlYkE4cWZ2?=
 =?utf-8?B?YklGdHZSQkl0Y2dURTJTYnVkMGF5Skg0Qjg5S1l3cnN6SXlUVytXTFlqcWFU?=
 =?utf-8?Q?xavM6f32AVzspEe8jugCR3yCI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475117f2-6577-42b8-9773-08dbb4c43a30
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 01:45:08.7188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/A2cSeTPDG+WAACqBRohdbF1vHSrZ46k1tFd/VeDs3tuHsfiXdJKVWWvYLf7NSA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8824
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, mcanal@igalia.com,
 Liviu.Dudau@arm.com, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 lina@asahilina.net, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-11 22:16, Matthew Brost wrote:
> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> have been asked to merge our common DRM scheduler patches first.
> 
> This a continuation of a RFC [3] with all comments addressed, ready for
> a full review, and hopefully in state which can merged in the near
> future. More details of this series can found in the cover letter of the
> RFC [3].
> 
> These changes have been tested with the Xe driver.
> 
> v2:
>  - Break run job, free job, and process message in own work items
>  - This might break other drivers as run job and free job now can run in
>    parallel, can fix up if needed

Hi Matthew,

Do you mean "run job B and free job A" ... "in parallel"?

I don't see why this cannot be done. One can have a work-item/thread
push jobs to hardware, while another post-processes them on a wakeup from
a driver interrupt, and frees them, and both of those run in parallel,
albeit any dependencies.

Regards,
Luben

> 
> v3:
>  - Include missing patch 'drm/sched: Add drm_sched_submit_* helpers'
>  - Fix issue with setting timestamp to early
>  - Don't dequeue jobs for single entity after calling entity fini
>  - Flush pending jobs on entity fini
>  - Add documentation for entity teardown
>  - Add Matthew Brost to maintainers of DRM scheduler
> 
> Matt
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel
> [2] https://patchwork.freedesktop.org/series/112188/
> [3] https://patchwork.freedesktop.org/series/116055/
> 
> Matthew Brost (13):
>   drm/sched: Add drm_sched_submit_* helpers
>   drm/sched: Convert drm scheduler to use a work queue rather than
>     kthread
>   drm/sched: Move schedule policy to scheduler / entity
>   drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>   drm/sched: Split free_job into own work item
>   drm/sched: Add generic scheduler message interface
>   drm/sched: Add drm_sched_start_timeout_unlocked helper
>   drm/sched: Start run wq before TDR in drm_sched_start
>   drm/sched: Submit job before starting TDR
>   drm/sched: Add helper to set TDR timeout
>   drm/sched: Waiting for pending jobs to complete in scheduler kill
>   drm/sched/doc: Add Entity teardown documentaion
>   drm/sched: Update maintainers of GPU scheduler
> 
>  Documentation/gpu/drm-mm.rst                  |   6 +
>  MAINTAINERS                                   |   1 +
>  .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  17 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   5 +-
>  drivers/gpu/drm/lima/lima_sched.c             |   5 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c          |   5 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |   5 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |   5 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      | 111 +++-
>  drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 497 ++++++++++++++----
>  drivers/gpu/drm/v3d/v3d_sched.c               |  25 +-
>  include/drm/gpu_scheduler.h                   |  96 +++-
>  16 files changed, 644 insertions(+), 159 deletions(-)
> 

-- 
Regards,
Luben

