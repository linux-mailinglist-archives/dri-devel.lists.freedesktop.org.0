Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA5C7D4606
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 05:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609C310E2D3;
	Tue, 24 Oct 2023 03:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2084.outbound.protection.outlook.com [40.107.212.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BF210E2D1;
 Tue, 24 Oct 2023 03:34:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNTmJ3FCvPRTELntyauMK5WCqG3WRpvGztsJKlY8Kq78wW/42i7c3WSonx6j9oCA4sL3AFTf0m7dUxXNyT+2FiD99nbSWmAyPo/xRbBWX6VTe9LHyr4VTZy8Mne3sMFSblnM1l2ry6OHcBuuB3Bqu1bWFiwQdCDMpGjL8VGTNdZYrRsYoHCmYgNefmE2vxBgqv8LXq3Pw8R6Gi14fRHE7OJaMj0QEB+T2Q+5At6PZQPCME9+7dGLgQxlOGMllRx2ynBdg9L7fiofnHO2NW5p8/nFYzDQCng6/7c7FERf6IwwbbLxCIzS3pCKxmm/+lFil/2vxY6bonaJ8I1qepOX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sp3+AmSxBDsfbMrsFeP7nuMIReqWVMMudQuzuhTTtIY=;
 b=MChnzX0mASxoiBWkqXBqFAXPinnfRrj5LvmaBDo+grfZS4pfRdSxdS7H9ShSna8BNUy4zhMApe4ut2pOwPWAO/geN/ZtpjgZxsnybFLHXfsdMetHbOQks+XZ7Xr6xQ8eG6h8OreDz06YKYTe4us9JieIQGVlfTaJBUxV9M3CBrtKV8Is9ZctJGquEisWHGe/7LE+gz89IL2CPMaqstWMKCEGprESikGIvC+IwL/1/DPwzoNC7MQIBIy1QAZR9oOCCAuvUfoXO5NmUlYu9agBuSoGCMgMquW9TNKZ1m9ffJiNB40RcTcTDyhcWwmN3fnkq8I20p8o+IItbP1nuewiqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sp3+AmSxBDsfbMrsFeP7nuMIReqWVMMudQuzuhTTtIY=;
 b=GLystzLJwDt3vPAK/Ch5SFeHLSuQGJUWUYKIBGUkjPJUYbK6+cEAgWIdoQxZrp6+WKGSLCgyZ0uBCoH51a0Y+EGiO707wRzl0F5srUsSKO22bskH+LQr2J9wAKUQVriGmbkojyTYow35xHlxSEkIUNp+c3g7stOkk/tAsb1am/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH0PR12MB5385.namprd12.prod.outlook.com (2603:10b6:610:d4::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Tue, 24 Oct 2023 03:34:47 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Tue, 24 Oct 2023
 03:34:47 +0000
Message-ID: <077e97e8-2d37-46c6-a770-c42912e13270@amd.com>
Date: Mon, 23 Oct 2023 23:34:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH v6 3/7] drm/sched: Move schedule policy to scheduler
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-4-matthew.brost@intel.com>
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
In-Reply-To: <20231017150958.838613-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0299.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::19) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH0PR12MB5385:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c323148-16e0-41eb-f1e7-08dbd4422b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XU9z5SAFUCSZM3tsCpcPuQExQYij6jM99dWfSznXpdMWHNTtKTJEKyUI/53RMpaPHPmudx2HmxuO7vcExzFc1y9HBdzeONf4YzuesBgu8w4uTSp9yk8kJDoiO1nVDrybI/4luj7PhlDby/rvPYX4p57PhqVjekoW64x+RJTkUwHLElGSCLNl7Oby9a1gLOEpTab6eMPcx03ARbOWB+BW2EBsUNt1ewtzGcnQSppkd3Q+pzQ7b4u2cyIWIEfI6hX6AaYwGpjeMRcCoA4dxaQ8FOl6TMO+EnZ3COIjsz9TgURtiRYWBU+9zxwqV/5mAl8a037wm0HAS5+04bY+h2rgR8OagYqMtL2sKDhpNPZiDeTX5Suzeu+r1OA+K3M2euHgY98cDR9g8FJyls6o+c/FQxhU4tuT6/BARLhX4oI9qCOrXN2RoQuCV66Zk4BpgNEvYrDQ+qe6B5IgdqK+jNpSHitj8SmEeiq9OQh8MtYb4k8ee8VcCfUn2Wd3m9cOrFtjMwI3pCpeOE9jW0JMYCn22OxXTsG8y5BosCTV+A0NvGekOdM1uFR2711Tth0q7FD8loRssHJr8+nmV/0yHS0CVGj6xRIqiWG2wyzm0dB1+2NNW2d5TnlFieFpavnZ2iWTf23Y65SP5owppYyNlE/OHWZJ+mpoOX011XkcR8eTv7iZoitIF6YVMP5MFOh7FNHP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(5660300002)(4001150100001)(66946007)(7416002)(41300700001)(44832011)(30864003)(2906002)(316002)(4326008)(8676002)(66476007)(66556008)(53546011)(6486002)(478600001)(8936002)(31686004)(6506007)(6666004)(2616005)(26005)(6512007)(83380400001)(38100700002)(31696002)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEZWcTdCV1VZd3dFU0l3OHdDNzREeWRLOXZkUGdRNk8xV3c3RitISFBQK1Nh?=
 =?utf-8?B?NDVucGY3dHN0N3pJaUZKcW5hMGZwdnd5Y01zUzdsOFFCU3B6ZFpDRllUWXdK?=
 =?utf-8?B?V3NER2dNcG8zcUJRckVEM1dqS1pLKytyMEVZeFhTU2ZVMStJTEZuQUIwYVZU?=
 =?utf-8?B?N0pOTktmLzNZeFdRRnF0VXE3d2dabG5xS1dRT2hha0VubFhMWWNwK29XYUxS?=
 =?utf-8?B?UUluaXNqcmVyMU5YT2hhOG12OEczSFRQOTJHcUlZeW8yNmxjZG5VNWFjUzZk?=
 =?utf-8?B?eCtxY1czak9FTjh2d0xiMkhGWEJKNDNpVnRvNWFFa05uOFQyb3BCa1dvWGJ2?=
 =?utf-8?B?cXZMeVJlQXkzcnc4L0VrWFJhbkZQQlhGa3UycVlCWk9UU3REMjg0NFpVeEtW?=
 =?utf-8?B?djVjUVJldDFsT3hNY1owRjczQ0FMNmhkY0Q4STkrSEpFejFEV2g4WG5KKzM5?=
 =?utf-8?B?eVgyTVI2NnhYUmk0L1pyRGRubnpPS0xsN0FYQ3RZaWJRWExROTVDdVVmM0JW?=
 =?utf-8?B?U0NPdzlLelFaTEZpYjhuRlZxOG1ISmV6OHpJMW1hZ29ubHZ3aGNlTTNmc3BB?=
 =?utf-8?B?NERDNGpKeDVvS3kxTDVTVVZhSmVMWDdUM3RTd1BNdUNyMlRSOGdicy9SQUc3?=
 =?utf-8?B?bkg2ZVpHU3hNRkV0YkhJQVVIaVd3ek1CcU8wdis1clpoeHVZaGMrZEZINzAv?=
 =?utf-8?B?UGJNZDRzY09uQzJPYXBBdDJNYkxFWGJPc2EvelgwdFNuZnZGTm91d3ZjZnM5?=
 =?utf-8?B?QkRwVURhSys4SjEyTGQ1UjBXcm5jVllYdmNJK08xdzFXejVycTFmc21aUlRw?=
 =?utf-8?B?bURraVZaSm04Z0ZEdFN3MCtJbzVscWJBYkYwRGtXV1IweDBoc0NJMEVBRVZI?=
 =?utf-8?B?ODE0a0R3T3pWQ041Zm1ZRk12MDlIUWw3OWZtZUFkMHRDZ3F5c0FFQ1FNTFpr?=
 =?utf-8?B?ZXJGNGtxNFBkcllqQTArUW9uaHA4VGM3UGE1ZkVPVldGK2VOaE44WjZPcW5J?=
 =?utf-8?B?bitLeUswWTd1SVNtbjBYc1JXbWc3Y1F0WEN1ZnVzS05TQ29KZWhJZmVRYzNH?=
 =?utf-8?B?NjVicVRybXJnWnBnaVRqak4va1p2MEsybFB0cU1STGRpVHJ0cUx3ZjZvKzRl?=
 =?utf-8?B?OGR6alk3SjlBdWhGdW5LMFV6eVZPTVpzeVRBRjhuRHRSMjNkck5QVEh0WXRC?=
 =?utf-8?B?ZTlQaUR6cGFsc0kxSUhQamFYUUwrcXVZeDFlK3dpOWh6dEFXRHFqRW1HSFVD?=
 =?utf-8?B?a0VWcmpnYUU2VjZHank1aTQ4UmhrV2Y0SEdFRnBjSTcvUXdXTmhUMGwrUytU?=
 =?utf-8?B?OVlWUnBEbUttQ1lQVkFQTnZVRzdRL1pRa216TmhzZVE4UmNhOHhLd3ZsTkFI?=
 =?utf-8?B?cWUyQjAvWVhwOEhNMDdJRGg1cy9CQ2xVUUtZUXd1eUtMekg3MytheGxWcXF0?=
 =?utf-8?B?SmRmNEtrOS9HcWVQajRrclpiMzBoaEo4T3h6dHRRNDNTRklDSUJxMlVzdlFD?=
 =?utf-8?B?NDh2VnBMdElCSkdJOU9ISHEzTHRsQlhZcmpRekxNZ2ROVUUxT3ZHRXU0bEJY?=
 =?utf-8?B?cVJVd2gxODFEQUNYSEFFV0RUN3Y3cHFSajJOMDl2dFZPb0QrRHYvYXB1SnhJ?=
 =?utf-8?B?V2VkZXo0OHA5WVVEUnFqZVNOemMxVXg1aUhkcnJrMlpXamhLb1BhYVJhK1JP?=
 =?utf-8?B?SzUrWktUdVlEZFNVM0MrYTZXemJwT1B4MG1VSEtkcWUwZk0rTVhpWWtsY3dr?=
 =?utf-8?B?QkFsalJiZUdTV1dDckZRa3o1UWs5YUF6bUQxNTRubGlwQml5b2ZUT1QyMlgy?=
 =?utf-8?B?RkJsNWR2Kzh3dFBmYXl4OUpoWWJqdFF5ZXI4dUpmRW1xbDRsM1Z3QzZMRVM2?=
 =?utf-8?B?R0YrVTA3VElBNDBpcVljUFBiYjdwU3ZzSzA2eHJWWW0reFNEWWY4amVuZzBF?=
 =?utf-8?B?Z2EyQXplTmRmQkZITU83cEFGdG43aVlsOTVqeTBhWUc2NG5aQk56SEhRaEFX?=
 =?utf-8?B?dUdwWSt6YzBzQkJLbWQzL250VXhOQkVsZXM0OVhENEtHWUs4bmRjK1NqNjB1?=
 =?utf-8?B?V3dBbkVNNzhvVEppZzJjc3cwSDREODM0V1Q0OE52QmlIdzVNaWJqL1dWSDlm?=
 =?utf-8?Q?6Uxger9w/EYIilvLGjg8JcIs3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c323148-16e0-41eb-f1e7-08dbd4422b95
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 03:34:46.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wUiMSwcIJ1TTmASyUTrW/jkxFzv0xjGfsQTTegi939rMWTPijquWQgyZRSXixDA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5385
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

On 2023-10-17 11:09, Matthew Brost wrote:
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
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
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

I think we should drop this patch.

Drivers shouldn't be able to select their own policy, when there's a kernel parameter,
which says what the scheduling policy should be. Imagine you're a user setting
the policy at kernel command line, only to learn that some driver has decided
to ignore (programmed, mind you) your choice and set whatever it decides. Plus,
this opens the Pandora box for other drivers to do this, and it's not a good
software engineering direction.

For the 1-1-1 case in S-R-E (sched-rq-entity) which Xe is using, DRM scheduling policy is
irrelevant. We can show this by showing that,
  a) In the case of RR, we always sample the only entity there, namely the single
     entity in the single run-queue.
  b) In the case of FIFO, we always pick the only node in the RB tree, namely the single
     entity in the single run-queue.

So whether it is RR or FIFO, for the 1-1-1 case, it always works as expected, and
the actual selection policy (scheduling policy) is irrelevant. This is a good design.

However, what prevents the Xe driver from doing this cleanly, is this ghastly
array of "priorities" in the scheduler struct,

struct drm_gpu_scheduler {
	...
        struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT];
	...

which is very speculative and ambitious... Why should the scheduler have
a set, constant, number of "priorities" and no more or less? Who said that
those are _the_only_ options, and why? It makes for a very rigid design
which doesn't yield well to novel and varied implementations, and that's
not a sign of a good design.

With the "[PATCH] drm/sched: Convert the GPU scheduler to variable number
of run-queues" (https://lore.kernel.org/r/20231023032251.164775-1-luben.tuikov@amd.com)
drivers can specify the number of run-queues in the S-R-E relationship.

Note, that in the S-R-E relationship, the driver already controls
the number of E's. With the patch above, drivers will also control the number of R's,
and I think that will have much more flexible implications for drivers to play with
rather than keeping the R constant.

The idea is that the Xe driver would specify that they're using a scheduler
with a single R, at drm_sched_init() and then attach a single E to that,
leaving much of the rest of the code alone. This generalizes (leaves alone) the rest of
the code, which is a good design.

There's a bug in the amdgpu code which when using dynamic rq, it oopses, because
it was using the scheduler without ever calling drm_sched_init()--the only reason
amdgpu was getting away with it was because the array was statically defined. I've posted
a patch for that. (https://lore.kernel.org/r/20231023032344.164925-1-luben.tuikov@amd.com)

(There was also another bug where amdgpu did sched_rq[-2], and the fix is already in,
fa8391ad68c167.)

Regards,
Luben

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

