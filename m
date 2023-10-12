Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 686677C61E3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 02:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A255610E36F;
	Thu, 12 Oct 2023 00:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2050.outbound.protection.outlook.com [40.107.102.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90F210E169;
 Thu, 12 Oct 2023 00:40:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXkY1YU1OvOUVuD+sf73lxct+A3spWRgvvnsBG5/KpZqVbipZmUbO/0TqSz0JVlKbwUAD3FrknIXHmgDQtRCQ7HV23SRGXAvLEH9EXzpGnx+7FQnL5x4drUp0RBCDULnI71J0aOXEfcUVgouD87eluQ3xNj/6PwK45W7DHYxYAFTcd1+SSFOBqTnEjBqDq5wc9yKBQatcVaMgwNBxrajhsVJV4oGq1q3xqlrspwNgf9EPg5XTPhIfHuB2iCK5SHdbdgkCtIaHmTqw4lcnz5Kz5qPjyg1rua58/2hOzGfMYuVf/fNITIM3gbwvlBCOjfEjyErbpPtYVoJj1N1Q4ktmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ml0cENs0T6Gy2nch3XEWXYGe1UreWqVDTcyikLVqvgs=;
 b=H/8EQ+mpc9f7TTY3Lz5jhVFfX4EmSVh5zkfvGAPtCPHwJe6V5rCEaE1uUPi/AlJrpr16GFKuLyPgeda1GylmwrGxc3RLRsKxVJ7j/d+VuvlHoOJufcPQsfVbkxNF/P34o1klQXLRyQoMLVf4Tx6Zc7TNOUj7x8trFRxJNIUTIVFqy52sWzaWwJ26jbSZVNEygv9b9FEcKfAMfLd5R7I+QGCLF42k8KEZ0PO6eb4HrH0FRL5LdLZ2QCwUt/4ukwBGJlORjS9umZ/hah0WBH9nDDSzVJsfsCZq/cFwpQbjp094ILerZDf8BNKKv3rkL1A34T8sdX8IpBHX1nJQ4aaztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ml0cENs0T6Gy2nch3XEWXYGe1UreWqVDTcyikLVqvgs=;
 b=DVOpZFuM2CRhgpcaO75yz9F4pGWezm2fYlAqXa6gSw4rdnuIN/fvD4mop7TgqSYwnRCVF+GHL6J9CVVUBjEPP5v+JvpOvlyHpkpyMbkwqImTfGd8dZaQ/k6T9WGmhtituzt7MbpM3zxZ7BpUDXutps5kyJeiYBGGa7DV2ToLsd4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Thu, 12 Oct
 2023 00:40:00 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 00:39:59 +0000
Message-ID: <34a4a2f4-a907-4fa2-9705-878106155639@amd.com>
Date: Wed, 11 Oct 2023 20:39:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 3/7] drm/sched: Move schedule policy to scheduler
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-4-matthew.brost@intel.com>
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
In-Reply-To: <20231011235826.585624-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::30) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN0PR12MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: c80e91d9-d16a-4043-b20e-08dbcabbc2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7OZk6zK50sh/qNHEmB1TEzdih4l/GVWiiMlvaSg8J+qUocstPx4+Hl/Uoe3tozhL5yUxIBrebKJMGV4cju901FO3DdCCNlb/6QK2P3OI4CkQESXTnahkFEYSlFwanIxtB4+z0RNvYe7KN/rBt1B3XFWwhtDFlcqqpInS/UrgcJFIvJeqWajRu8BCDBJ/3UKhlihdzgviLzAoMXWfzhWXsSZFgyaVCncRdi3peKa47e5ynHQdfDKIwKrcKcICjOXbx29hK3dR01lg5ILwH7lP1lcVQ2h1+cUP5isjTohA6IpJ56De+6ztDGZj7gowT8MHImN6dalMJ2Wi2lmWGNtQOFysWfKU+R75WL8qeTQPjKuzeBwYkhHxo/1OgGgsN78yqVcSFZUDI/HF/5oiLLzcnn7d9OHXc/gKtq9r+QNemXM22823fFWzhhHcghJ3vlQXtF32BFg0WQXq9aFfl8z6w4SfXeQU+Ovq/6OK5kG5kJj+Zqx9jBt7/yh+UUnOecZThde1tJ9Z3YP7lzlSy4o2n5Zr05x29IleIURHBZah/Zo5ITcUAS6FwmPfEOsWaxbFI2IXBADhHt4fZ2AjMvyNPWQwa5cotRfmS11D9WqBQFFmKSiWnBinl3rBloMVBR3KunuOhVK4YbTTCN3ASNR7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(136003)(366004)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(8936002)(316002)(83380400001)(2616005)(66556008)(7416002)(66476007)(26005)(8676002)(66946007)(5660300002)(4326008)(478600001)(6486002)(30864003)(2906002)(6512007)(41300700001)(4001150100001)(6506007)(44832011)(53546011)(36756003)(31696002)(38100700002)(86362001)(6666004)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkZkS0tER0FGOFRzME5nQ09wLzFOeDk5V3lmRWJCMkkrK3BycktTc2dIZUxj?=
 =?utf-8?B?bUQrLzNXandTZUY1VFNtR0Nqc1lwZ2QzNHdsR1ppZGxxMnJiOHFWSGQvem1V?=
 =?utf-8?B?OGNTWGtqbXZkODFacWJSdjllSTBLaThUQXAzNVErMGlZV0JDQ2V5bkpia2tv?=
 =?utf-8?B?RVM3dzlDb05KNEhKZDNaTXMxVGQ3U25SRUdCRy9XVGpIamcxZ3Zlb1dvd2J6?=
 =?utf-8?B?ODVHK1BiOTRQWUl5SnpMSFVnTlY1QnQxYVB5MjNVWjk2WWRyUVVnWGo1U3hH?=
 =?utf-8?B?MUNLaTREek45czQrQ1N0WWJBdmgyZDJPWFYwZUFHclVpRWU0K3Q3aGFrYzhJ?=
 =?utf-8?B?SzFCSFd3YzZGMzJXbzlQdUVWSENRYU9PeWFFSit2a1hlTTRtSGFYaVZwNkpJ?=
 =?utf-8?B?Y2pPZDJsaXNsSXZNVDE2aHlzUHJBSU9ZM0htdFUxSmVCaEV2SnBhcjM0SzQ4?=
 =?utf-8?B?enAvaVNVY1VvR0U2azcvb1pBQjZpN2p2ZzdmcVY2VkZMUXp4V3E4WjQrVE5N?=
 =?utf-8?B?OGlQaUs0S2hhWWxJcWNraUN0bmNBbTlGVU54VC8razlPVjQzVUtVNnpuaE1j?=
 =?utf-8?B?QkZTbjY3RlJNdFY1eHNFcHNPbHZ1aGxEaGZnNTkzQ2wwRjY1WmlYWitRNWQw?=
 =?utf-8?B?aUlxaVJickg1VW5ZS3RDMkd2dGJBZVlyRVZhN2J3aDN1dXJPaUhMeU9jNmpX?=
 =?utf-8?B?NW5ZS2F0ejQ5aUE1OEVLcDVFOTFWd2lwUncvVVlobzE4aGZyYk1xTWREM3dy?=
 =?utf-8?B?aWdKMndNS2FXWGowNFA2SlhYSmxkeUpMQnhCRURrYVR5YUlEUks1bHYxMENu?=
 =?utf-8?B?SGZIYThlOUxGQUc2Nkh0UU4wK1J1TXVWQmxuWjFvZVBLTTE5bitEemlOUGh0?=
 =?utf-8?B?cFRBN3B2K3ZkOHdGZEl3WlM2MHpXNkVVZUQ3L3I2VVNOdVA4T3dRcW9vZnRJ?=
 =?utf-8?B?MXNzSEJaa0ZxWVdqSEVjZWlxakxrbVVEV1VCd2pPMnZsVHB4YjA3OGxteGJO?=
 =?utf-8?B?TVNqVGl3am9WMExXazJaRWRUS3VpRmkvOFl3d0wvM3BGRlV1QTRsdWxrc1lh?=
 =?utf-8?B?djdlaVpVUm0yUVRlb1U2MGR0SCtOOHNzS0p1c1I1R2MwUVl5V1dnM3pkOENr?=
 =?utf-8?B?VXhLNHN0b2F5WVlSRFZrTUFUdEp3SE5LUUtrOG56YlJBM0s2SERGTjZKWjFj?=
 =?utf-8?B?dTdQZzcxbXY2dFFFNlU1alc5MHpORi9CRnJsVEt3SHVrdFdUNGtZTmxseHVq?=
 =?utf-8?B?ay9XSjFYcFNnTnRwbFVyeFNkZ0x2VDIvdDkxczAwUFJhYlJmc0VYOS9TNTM2?=
 =?utf-8?B?OXRUZnZnUG1TYTIySVBmWTZxeEFOcWQ1TnpwK3RYNit1K3g0OGtxRWRTTVFj?=
 =?utf-8?B?enBZRTg0YUtyajhFKytnODQwRFhXMGp0dEQ0ellNUWQvWWw3WEVaS0VpZWY4?=
 =?utf-8?B?V3NQQkkvT0hxMGk3VGFlQ2xuN1NZTVV3TlJTZHBJOGE0K1NWQkIyVnlPbm9X?=
 =?utf-8?B?cFFvOXR6NVQ1NEVKdHVtbUFYVEJqcHhKYTJFNEJlMXNqTFVUZFRYblhtVS9r?=
 =?utf-8?B?UWxqK0diMUZ6VGVXSERla1p0N01ESVpzanJWcFo2TUNLMEhIQ1c5MlRXNG9H?=
 =?utf-8?B?TGVMdjZZMzYvRnBmN3c5OHg4R1lqdnFYeWQ4THNtOEJ0cUd5Z2JDc1hZZ2lE?=
 =?utf-8?B?bUhCN3Y1c0piUFlVUHplZ3hXVVZ1S2dNa2kyWlgyelNQVW90UXk3MDgyYmEz?=
 =?utf-8?B?WUE4R1NWaitRUDZubkVLeFdIQVgvdDQ1TzMxQXFGMCs3YzVQYlEydXJja05a?=
 =?utf-8?B?OGRQZ3RLWEFITERwcExkVWZSeEZGN3dpVnNsK2VHMGp4N2NwMFg2cUdRcnpt?=
 =?utf-8?B?aDVwM1UvK01pK0FGNSt5Si9qclRRVUdub2o4c1FLemh0cTViZ1hrS3I4dHVM?=
 =?utf-8?B?N0JmcVBXVG1sbTZxaVpscy9PUWtEM3R0SU5JblVHN3laN3lCZ0dhWjhCVnVx?=
 =?utf-8?B?L1Q5cDd2ZHJKZVdLU296bHA2ZHBTWFlXL3o2bDkzNWFzSFVyZFFTZzd1ZWRk?=
 =?utf-8?B?SEhyT1BUSWlWdUZSYWtqRnQrbEZTRHVXaC9RQk1WTjhLNzYrUlE5bTJHdTNB?=
 =?utf-8?Q?2SDExsNA/JbKZteMICPf6ioow?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80e91d9-d16a-4043-b20e-08dbcabbc2ea
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 00:39:58.2523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYDQDLsNB6l1xgW0pRJ6l0W/SABMBMOSgeXhwVP71YtMkgTPlarPD21+4oytHiQm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6101
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

On 2023-10-11 19:58, Matthew Brost wrote:
> Rather than a global modparam for scheduling policy, move the scheduling
> policy to scheduler so user can control each scheduler policy.
> 
> v2:
>   - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
>   - Only include policy in scheduler (Luben)
> v3:
>   - use a ternary operator as opposed to an if-control (Luben)
>   - s/DRM_SCHED_POLICY_DEFAULT/DRM_SCHED_POLICY_UNSET/ (Luben)
>   - s/default_drm_sched_policy/drm_sched_policy_default/ (Luben)
>   - Update commit message (Boris)
>   - Fix v3d build (CI)
>   - s/bad_policies/drm_sched_policy_mismatch/ (Luben)
>   - Don't update modparam doc (Luben)
> v4:
>   - Fix alignment in msm_ringbuffer_new (Luben / checkpatch)
> 
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Was the R-V added by hand? (As in editing the commit message manually?)

I use automated tools for this which do not re-order the tags.
IOW, the S-O-B is first as this is how it appears in the patch,
then the R-V most probably added by automated tools, and then
any other as are tacked on by other automated tools.

This also shows the timeline of the tags and I believe this is
another one of the important facts tags show us.
-- 
Regards,
Luben


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
>  drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
>  drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 ++-
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
>  drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
>  drivers/gpu/drm/scheduler/sched_main.c     | 19 ++++++++++++-----
>  drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
>  include/drm/gpu_scheduler.h                | 20 ++++++++++++------
>  10 files changed, 68 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b54c4d771104..e4e6f91450a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2283,6 +2283,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>  				   ring->num_hw_submission, 0,
>  				   timeout, adev->reset_domain->wq,
>  				   ring->sched_score, ring->name,
> +				   DRM_SCHED_POLICY_UNSET,
>  				   adev->dev);
>  		if (r) {
>  			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 618a804ddc34..15b0e2f1abe5 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -137,7 +137,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>  	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>  			     msecs_to_jiffies(500), NULL, NULL,
> -			     dev_name(gpu->dev), gpu->dev);
> +			     dev_name(gpu->dev), DRM_SCHED_POLICY_UNSET,
> +			     gpu->dev);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index 8d858aed0e56..50c2075228aa 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>  	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>  			      lima_job_hang_limit,
>  			      msecs_to_jiffies(timeout), NULL,
> -			      NULL, name, pipe->ldev->dev);
> +			      NULL, name, DRM_SCHED_POLICY_UNSET,
> +			      pipe->ldev->dev);
>  }
>  
>  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 1097f8e93d6b..173ad2f17c50 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -97,7 +97,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>  			     num_hw_submissions, 0, sched_timeout,
>  			     NULL, NULL, to_msm_bo(ring->bo)->name,
> -			     gpu->dev->dev);
> +			     DRM_SCHED_POLICY_UNSET, gpu->dev->dev);
>  	if (ret) {
>  		goto fail;
>  	}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 4c959dec42b3..c4e09d2e77f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -437,7 +437,8 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>  
>  	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> -			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> +			      NULL, NULL, "nouveau_sched",
> +			      DRM_SCHED_POLICY_UNSET, drm->dev->dev);
>  }
>  
>  void nouveau_sched_fini(struct nouveau_drm *drm)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 934b7b930c76..95330ff402ba 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -856,7 +856,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  				     nentries, 0,
>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>  				     pfdev->reset.wq,
> -				     NULL, "pan_js", pfdev->dev);
> +				     NULL, "pan_js", DRM_SCHED_POLICY_UNSET,
> +				     pfdev->dev);
>  		if (ret) {
>  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
>  			goto err_sched;
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index a42763e1429d..cf42e2265d64 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -33,6 +33,20 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> +static bool drm_sched_policy_mismatch(struct drm_gpu_scheduler **sched_list,
> +				      unsigned int num_sched_list)
> +{
> +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
> +	unsigned int i;
> +
> +	/* All schedule policies must match */
> +	for (i = 1; i < num_sched_list; ++i)
> +		if (sched_policy != sched_list[i]->sched_policy)
> +			return true;
> +
> +	return false;
> +}
> +
>  /**
>   * drm_sched_entity_init - Init a context entity used by scheduler when
>   * submit to HW ring.
> @@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  unsigned int num_sched_list,
>  			  atomic_t *guilty)
>  {
> -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> +	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
> +	    drm_sched_policy_mismatch(sched_list, num_sched_list))
>  		return -EINVAL;
>  
>  	memset(entity, 0, sizeof(struct drm_sched_entity));
> @@ -486,7 +501,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	 * Update the entity's location in the min heap according to
>  	 * the timestamp of the next job, if any.
>  	 */
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> +	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
>  		struct drm_sched_job *next;
>  
>  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> @@ -558,7 +573,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  {
>  	struct drm_sched_entity *entity = sched_job->entity;
> -	bool first;
> +	bool first, fifo = entity->rq->sched->sched_policy ==
> +		DRM_SCHED_POLICY_FIFO;
>  	ktime_t submit_ts;
>  
>  	trace_drm_sched_job(sched_job, entity);
> @@ -587,7 +603,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  		drm_sched_rq_add_entity(entity->rq, entity);
>  		spin_unlock(&entity->rq_lock);
>  
> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +		if (fifo)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
>  
>  		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 8b1d52cff1e9..150e5330f0fa 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -66,14 +66,14 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> +int drm_sched_policy_default = DRM_SCHED_POLICY_FIFO;
>  
>  /**
>   * DOC: sched_policy (int)
>   * Used to override default entities scheduling policy in a run queue.
>   */
>  MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> +module_param_named(sched_policy, drm_sched_policy_default, int, 0444);
>  
>  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>  							    const struct rb_node *b)
> @@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  	if (rq->current_entity == entity)
>  		rq->current_entity = NULL;
>  
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
>  		drm_sched_rq_remove_fifo_locked(entity);
>  
>  	spin_unlock(&rq->lock);
> @@ -898,7 +898,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>  			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>  			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>  		if (entity)
> @@ -1072,6 +1072,7 @@ static void drm_sched_main(struct work_struct *w)
>   *		used
>   * @score: optional score atomic shared with other schedulers
>   * @name: name used for debugging
> + * @sched_policy: schedule policy
>   * @dev: target &struct device
>   *
>   * Return 0 on success, otherwise error code.
> @@ -1081,9 +1082,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   struct workqueue_struct *submit_wq,
>  		   unsigned hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev)
> +		   atomic_t *score, const char *name,
> +		   enum drm_sched_policy sched_policy,
> +		   struct device *dev)
>  {
>  	int i;
> +
> +	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
> +		return -EINVAL;
> +
>  	sched->ops = ops;
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
> @@ -1102,6 +1109,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->hang_limit = hang_limit;
>  	sched->score = score ? score : &sched->_score;
>  	sched->dev = dev;
> +	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
> +		drm_sched_policy_default : sched_policy;
>  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>  
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 38e092ea41e6..dec89c5b8cb1 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_bin_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_bin", v3d->drm.dev);
> +			     NULL, "v3d_bin", DRM_SCHED_POLICY_UNSET,
> +			     v3d->drm.dev);
>  	if (ret)
>  		return ret;
>  
> @@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_render_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_render", v3d->drm.dev);
> +			     NULL, "v3d_render", DRM_SCHED_POLICY_UNSET,
> +			     v3d->drm.dev);
>  	if (ret)
>  		goto fail;
>  
> @@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_tfu_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_tfu", v3d->drm.dev);
> +			     NULL, "v3d_tfu", DRM_SCHED_POLICY_UNSET,
> +			     v3d->drm.dev);
>  	if (ret)
>  		goto fail;
>  
> @@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  				     &v3d_csd_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_csd", v3d->drm.dev);
> +				     NULL, "v3d_csd", DRM_SCHED_POLICY_UNSET,
> +				     v3d->drm.dev);
>  		if (ret)
>  			goto fail;
>  
> @@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  				     &v3d_cache_clean_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> +				     NULL, "v3d_cache_clean",
> +				     DRM_SCHED_POLICY_UNSET, v3d->drm.dev);
>  		if (ret)
>  			goto fail;
>  	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 211bd3cdabdc..320f0a720486 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -72,11 +72,15 @@ enum drm_sched_priority {
>  	DRM_SCHED_PRIORITY_UNSET = -2
>  };
>  
> -/* Used to chose between FIFO and RR jobs scheduling */
> -extern int drm_sched_policy;
> -
> -#define DRM_SCHED_POLICY_RR    0
> -#define DRM_SCHED_POLICY_FIFO  1
> +/* Used to chose default scheduling policy*/
> +extern int default_drm_sched_policy;
> +
> +enum drm_sched_policy {
> +	DRM_SCHED_POLICY_UNSET,
> +	DRM_SCHED_POLICY_RR,
> +	DRM_SCHED_POLICY_FIFO,
> +	DRM_SCHED_POLICY_COUNT,
> +};
>  
>  /**
>   * struct drm_sched_entity - A wrapper around a job queue (typically
> @@ -489,6 +493,7 @@ struct drm_sched_backend_ops {
>   *              guilty and it will no longer be considered for scheduling.
>   * @score: score to help loadbalancer pick a idle sched
>   * @_score: score used when the driver doesn't provide one
> + * @sched_policy: Schedule policy for scheduler
>   * @ready: marks if the underlying HW is ready to work
>   * @free_guilty: A hit to time out handler to free the guilty job.
>   * @pause_submit: pause queuing of @work_submit on @submit_wq
> @@ -515,6 +520,7 @@ struct drm_gpu_scheduler {
>  	int				hang_limit;
>  	atomic_t                        *score;
>  	atomic_t                        _score;
> +	enum drm_sched_policy		sched_policy;
>  	bool				ready;
>  	bool				free_guilty;
>  	bool				pause_submit;
> @@ -527,7 +533,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   struct workqueue_struct *submit_wq,
>  		   uint32_t hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev);
> +		   atomic_t *score, const char *name,
> +		   enum drm_sched_policy sched_policy,
> +		   struct device *dev);
>  
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>  int drm_sched_job_init(struct drm_sched_job *job,

