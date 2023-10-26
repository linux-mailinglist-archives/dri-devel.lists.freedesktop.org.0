Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77EC7D7B75
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 06:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360A010E752;
	Thu, 26 Oct 2023 04:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E94210E751;
 Thu, 26 Oct 2023 04:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5ZUTLKZ+l5kgBlOHO7EWZbjOWoVqVDN0jx23YeEFBypN4kOqcCn6QADkBLzSFYmlp3XgREjPWehxF+e0Sqql9+I4y/DyyU7htLjyBMNyKCl3BzMogNEOOwXg8ugbA9GbPj0jkJdn83uDpQgBMiMBNm8P9HyDylzAkWAslrcHbkQ/7jW+Wi+wRHUzBeqFpQB8YNG6EBd8WF4VGDEa6SR0Hmi1A9NpE5krW+abvzvNgsFWzork2/m39NOjfN9u3DmroTkPO0iPQO79xx6OXXSKS9u7jrNyo248pC4nOmqUnazxK9De5KCVLhkhLiG7nE5tJ1K1hvFpVcv5ZyQJ9cMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkBOe2ZhYFMZacq7pdzpzTjdU//koXWXJdkhvx0Wiq8=;
 b=OevG8SNybCDLI1FHWiRcNYJOkIcTh5GzSiNuqgDsbIw3jzGKgN3arHNFPNRbYzTEn4a2cj4jdH9Bv4XEyR24GUbfkFO9rh2kpU5IkyHPaAmt88FCEZzJrYKUuhFP7PEhcTeaWOvwFKpaTDdYZWEFJ8aOdUpTO0McYmCnmb1OFm37SITtXsSzT+qiLkA4es+M5wRSbt2lEuMthM2x0RCcHT2VGU21mN1zdx1s7fsgGHtynKYFkFZ51HY8p3RjufcHqssWgC7PFamFbaj2DcZ+pedfuZnUlkYf5tkDxQT087fw1miOMna2uN7Mn+h9xwyTRuuc6Gy41/uEvDoCn3UcSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkBOe2ZhYFMZacq7pdzpzTjdU//koXWXJdkhvx0Wiq8=;
 b=Bl0AOTFaEO8r8s0SvipXPnuWmFUg1piAyIdudxx6HFBHVWhO34h+YLV6q9hvgBh94wDWyz+faX2GC5VNvyo9ey7aBa+zAOu0YCies5kAXuhNFWwkETTaZKcUPgMeyGA/6fdSrURyR5ztEyIPfNMYCn/o0LU4O497v0lxsp+onK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CY8PR12MB7268.namprd12.prod.outlook.com (2603:10b6:930:54::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.31; Thu, 26 Oct 2023 04:23:41 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Thu, 26 Oct 2023
 04:23:41 +0000
Message-ID: <4fe554a7-9fb8-45e1-85fd-7613abe78730@amd.com>
Date: Thu, 26 Oct 2023 00:23:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH v7 0/6] DRM scheduler changes for Xe
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231026041236.1273694-1-matthew.brost@intel.com>
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
In-Reply-To: <20231026041236.1273694-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::36) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CY8PR12MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 197bc770-6e9b-47e1-0f37-08dbd5db5542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g01RiAAAP4r7N/lrMpyJMBdqLPt3Q6q9V8dbG6ujsfZwjDb6JDNQe582jRS60XSF7mJTxtdH4s54O04AmGHA2VnNqX4KygZrUP4anKYTtHojfOGjp/dSEgMq2bNOb0cbDGmeRN1uZ0AK7FAstcX45UjsUbBYSfFbhNqnAhXGMudnCt51CZ7ggHle74tc4LAcIouBa41/CkRAzGGGOmSeuwsuvjqwkSQh5pSYh7rmZfzSjwLb8CvdCLx3FEY2Otyskf7Taq43+ZRaoaKDutO0CkZTaMuYgHGfXI6o5VghenrQmvumJKhBJvPEcmNIblOPUkEXZTIuTjfaI4dfLiADhunYLWN8Soo9+yUvXdGOiDQfv0ZfdrJDM/FQZu5IY90ycl/x2/d7ERuK7YWWpoYPhUVaYiy8/YZAOZ5qsBK6Lq7sjzK7qC9pxyIYK7rzASRPdbErBC24NgWN72lcd+1EyatHB5phAs4T1slyLKnkuLdStFAoTIVCXAXYyKtIng70+5rXdC65YZXW+nImJ1k79UiJgOj31sZTlUm9/zUH7FEqSsmFsCr6tARn2gckaQWJYANC5iCiTWk9/g8E19K9DDb6SiO56xgjs6KolBFrb8dT52tH3YtdqowmaAE5tIJoIrGPqUEQ1V1FhZ9D1nq9z7oNt/2OONCemUOqPGFmOLs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2906002)(41300700001)(38100700002)(478600001)(66556008)(66946007)(2616005)(316002)(6506007)(53546011)(6512007)(6486002)(966005)(66476007)(83380400001)(6666004)(86362001)(4326008)(31696002)(7416002)(5660300002)(36756003)(8676002)(44832011)(8936002)(26005)(31686004)(4001150100001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWZKRFA0OW9LaDBiVVZITmY4TGlIT2tYZlJZNitkSkI2bEpCaUpXOGxaSWY4?=
 =?utf-8?B?V0x0Nzg0YUIwZTBHeEh2V0lMSHVLaCtZK0R1UkxUejl0MnJSSGxHVkpCVjIy?=
 =?utf-8?B?d3RKZi9VVVdzOTJWSVNyU3owT2o2STNDaC9CVHcrUlVTbE9ab0lheVRQb25p?=
 =?utf-8?B?R0hQa0FFa3ZpRUhkRWtpVERLUzdCK0NsOGxkSjM1TmdRNUgvL2xjc2RtdWVq?=
 =?utf-8?B?TXpYblpiY2hielJ3MmJOUFRFbmRNdDRVUG9FZ1d6Z0tVYkx5eERVQkZkN3Qv?=
 =?utf-8?B?cTBMcUZmZituSGx0M3BNTzBlZ2g3NzY0bEpYcDFzcEkzMFZUeWpBL3JVR3k4?=
 =?utf-8?B?dUovblQxRE0ybXNqSm04NU1PcGlVRHN6NE8xMEltdVluTHhYckc2QUpmVisz?=
 =?utf-8?B?MGN2dHpOM0RDRVBTMkppT0RDRGtxZ0VPcldjQXVYNm1CQ0VPVktMNkcyVXFF?=
 =?utf-8?B?SGFCa0p5dzFkdkkwZ0VMbHU5K0QrVWZUYkhRYzEyUmttUXBhaTJWWVcrRWhr?=
 =?utf-8?B?Q3FPQlAxVTVSL2pscStNY0pCZUtjT2NVd2YwUDRCKzZzcmY2N3dVYitocUlw?=
 =?utf-8?B?U2xDOEtRV0pJZHZhSmFnalFnWEVtcU5PNmxPSUZ4bTFPeHpvOXl0WnpVbFh4?=
 =?utf-8?B?QnIrMlhRaUl0N1p5S3pYT2JxR1FQSGFveG51WWY0d2JRTnAvN0ZhVFdjRWtT?=
 =?utf-8?B?amtCRlNOeDRQa3BXcVNpaUtGTFdJZjhoRFQ1NjRJUWlYZk9wdVVQeUovKy9y?=
 =?utf-8?B?L2V5MStKRWV0TDRvbkg4TGc1WTRiY0RBNXMyVldpem9NVGVjejU0RG9MK3oz?=
 =?utf-8?B?UzZDQ2xSM2NWSWRSVG9iZnd0VU5mWFBSbW1XQ1k0cWFaQ0Q1SFV5SUVsd0hu?=
 =?utf-8?B?c01wOHZRbWNQc0IyellqNHBIeEZ1dEU4UFIwQ3FROE43Wit0UTZLbDNRZUYr?=
 =?utf-8?B?aFd5V2F4R1l2NFRZanFjWFNPWFovdHBrZ21zTGRvek1sSFZkbEl3Qm5KUTZm?=
 =?utf-8?B?RjlQU1YyK2kreldmdW1WUjhPV2RubDFXUnR6cSsyV29pVXZYNmdPUkhkMy9k?=
 =?utf-8?B?bVFrTVNlcjVBem9rQ0FsaHhuWjdCTzBvKzFJUWc2U1J3Q3hleEFBRzQza2Mr?=
 =?utf-8?B?Nmh5MUo5akNOdjhtc0pVZVFFcnBJS1M2bjlQTG1xT3ppb0FHSEREZTNDU1Zy?=
 =?utf-8?B?djZDM2tCeGNLMGlHMlRRcGVjc3VoSTdDTUF5WnJ5RUdaVWhHWngvQ1BMTjFo?=
 =?utf-8?B?T0tIQzdPVmpLMmg4cE1kYTY0aEc0T2kyNFMzV1N5Ym9vSk5DemN0WEEreTFT?=
 =?utf-8?B?NHB1Vnp1aXR0OXRnMEV0ZVhrRUc0Snl0ZCtmTFdrWE9vdXZBdWk0dTQzTnhF?=
 =?utf-8?B?Wm93NU1JYlpGMWtXUHBnNEtabG9Ua0xnSGNnWUdhRVcvRWdPaWJHNEV6MDVU?=
 =?utf-8?B?V0tTUjRpSEpqQ3RmUXQ3NVNiTTYvVVl1Vy9oS3o2Y0U3WWtnSkxocC9WemY4?=
 =?utf-8?B?aithZkZRVXFVTWdzMlRjN1hCekpzUnNzT0ZGRjNkS1VDL3ZxSVprNXdUMURR?=
 =?utf-8?B?dGRFam5leWc2RXA3TjFJYlFWSGl5T3g5OURSR0xXQTZGRWs2UDZGem9GMGZs?=
 =?utf-8?B?NkQ5U2pobkRvR2kyQlBkWTR0RVd2NDdjQ0ZGMzRWcXdSbDB4VXdpYnBoRUlF?=
 =?utf-8?B?NnduaEFZTDZXdU14RUVZS2U5Wk5RUjRVSHliZE4rRlllME5kNEUvYnV2SVN1?=
 =?utf-8?B?UzJGWi9DRHAreHNua3NSWDdHTTFFSU42MHFYVzQ4WUVkTHdxdVlFN0Y4U2hw?=
 =?utf-8?B?ekRlc0hoL1VGWWxzaEw3V3RYZDZ5WGFPRGxtUzJoUTk0NHlGZzFQc0pRWDFQ?=
 =?utf-8?B?MmgzS1RRclY1aFJSSWtYMkN6alBHUmg0QW9lZTVIMnNqTFZJOFR2QjdXenAx?=
 =?utf-8?B?YnczSUxoR2hiRW1DcTk4V0ppQzJmTzBDcjgreDFGeGRWWFVxS0RnRkcyWGJD?=
 =?utf-8?B?enZKVEJqNnhBdDd5MU1PZnErUjNVNUxWZ3A4b1Frek9PNThoT2EyK1R5MnA4?=
 =?utf-8?B?WTJXdEFiMTAxZGlqVGpLNEs4eWZEMWY5L04rMHlNeGtsNzZTbFcrdzVlODhU?=
 =?utf-8?Q?SjE+PYuqjiCaQG5d7K1udpUrg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197bc770-6e9b-47e1-0f37-08dbd5db5542
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 04:23:41.0780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7hH1pBkTtCWjtJPYrBd4tz63epSudKTEpYgqvOhLLgbMDh+hkRgnScGNrtTbxnw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7268
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023-10-26 00:12, Matthew Brost wrote:
> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> have been asked to merge our common DRM scheduler patches first.
> 
> This a continuation of a RFC [3] with all comments addressed, ready for
> a full review, and hopefully in state which can merged in the near
> future. More details of this series can found in the cover letter of the
> RFC [3].
> 
> These changes have been tested with the Xe driver. Based on drm-tip branch.
> 
> A follow up series will be posted to address some of dakr requets for
> kernel doc changes.
> 
> v2:
>  - Break run job, free job, and process message in own work items
>  - This might break other drivers as run job and free job now can run in
>    parallel, can fix up if needed
> 
> v3:
>  - Include missing patch 'drm/sched: Add drm_sched_submit_* helpers'
>  - Fix issue with setting timestamp to early
>  - Don't dequeue jobs for single entity after calling entity fini
>  - Flush pending jobs on entity fini
>  - Add documentation for entity teardown
>  - Add Matthew Brost to maintainers of DRM scheduler
> 
> v4:
>  - Drop message interface
>  - Drop 'Flush pending jobs on entity fini'
>  - Drop 'Add documentation for entity teardown'
>  - Address all feedback
> 
> v5:
>  - Address Luben's feedback
>  - Drop starting TDR after calling run_job()
>  - Drop adding Matthew Brost to maintainers of DRM scheduler
> 
> v6:
>  - Address Luben's feedback
>  - Include base commit
> 
> v7:
>  - Drop SINGLE_ENTITY mode rather pull in Luben's patch for dynamic run queues
>  - Address Luben's feedback for free_job work item patch
> 
> Matt
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel
> [2] https://patchwork.freedesktop.org/series/112188/
> [3] https://patchwork.freedesktop.org/series/116055/
> 
> Luben Tuikov (1):
>   drm/sched: Convert the GPU scheduler to variable number of run-queues
> 
> Matthew Brost (5):
>   drm/sched: Add drm_sched_wqueue_* helpers
>   drm/sched: Convert drm scheduler to use a work queue rather than
>     kthread
>   drm/sched: Split free_job into own work item
>   drm/sched: Add drm_sched_start_timeout_unlocked helper
>   drm/sched: Add a helper to queue TDR immediately
> 
>  .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   4 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   1 +
>  drivers/gpu/drm/lima/lima_sched.c             |   3 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c          |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |   3 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |   1 +
>  drivers/gpu/drm/scheduler/sched_entity.c      |  18 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 444 ++++++++++++------
>  drivers/gpu/drm/v3d/v3d_sched.c               |  10 +-
>  include/drm/gpu_scheduler.h                   |  29 +-
>  14 files changed, 373 insertions(+), 184 deletions(-)
> 
> 
> base-commit: 201c8a7bd1f3f415920a2df4b8a8817e973f42fe

I get a "bad object" doing a lookup for this object. drm-tip isn't very
"stable".
-- 
Regards,
Luben

