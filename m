Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282BE7AF8AD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 05:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F026A10E193;
	Wed, 27 Sep 2023 03:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC2110E193;
 Wed, 27 Sep 2023 03:32:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ru8L/2Oxm1sTwvF9+qBu64EjhiR8u/jFeRSKs79Azvb2np3jI2+CT+ho4TL+lvLiNlvLVkR40Tu7RxazdQulq/387wYJ9XBfV/6RmEgGuyCZQryxXn9BqVu9inB47HnwwECL8fqw616DV8MYWupcQxPWoskOTmPYXe0JukU17HH6pttwuo1QwvgaAqsAggsEFlogGnD3y1omHf2VyU2psq9n1cb05C1ojf0RrJaBZvtxzLOcHpRhhkzEERWacORN+Gxvp48ME5g7SqA5JsNzH7s1u6i/FsGmv1xoRl9BHeGWvPwGONHLjXHvmkGiJD1Tl9pO6sR8c2qCmS/8kJf7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwGZqT//NEDXlZ7neW1ibNqJA4d+1Q6dDQQ7SK2CwGo=;
 b=X3MoGLnZmDP8q2jUYGDOqSDnyf1L7l/opzFyjdOj3GR1yU3I+YXMngm1gFPPIea7So+T5TS7pVdvb6Omcn4ngRxppV1SDMP9zLz/KLdlQJ2Kqh0Bye3Oa+S5gSSKY3KpcJT4+XGtjVspDN5e5alspmxAIc95qXOEEGyC07fp131nrvIggPnoOAUCcCzUDNUI3qsiGYri9Lv1mUWqzZ456jRHDLfat5RPE1O6iXa1W6iVp9+vzwxgvzFGww7YrWQD680wepLyJ2MM7400G/10jgTGQ2l4a8BhuEW/iiVd0dB5rB0EThCW7VeM9c3fHCkaY4HXcc5RonlCWWL3iwanaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwGZqT//NEDXlZ7neW1ibNqJA4d+1Q6dDQQ7SK2CwGo=;
 b=fpgX0+zdrTLIKTpDtUifzNkQVDb8TRMm2cixQgC96oZOi7WLTRlUBhPbxAk1a78emc2ltVpFQ/RfCvCR3K/akqUVYca9dXR9AxMbdKXtKpoOyAeeC1XPhLqQBvmxRZchGq823xKFLO6rcHRd1dVDxtcz9gbJxs5WkAEqidkBPvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SJ0PR12MB7458.namprd12.prod.outlook.com (2603:10b6:a03:48d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Wed, 27 Sep
 2023 03:32:19 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Wed, 27 Sep 2023
 03:32:19 +0000
Message-ID: <bb9ab46d-326f-4ba9-b0a0-fcede8946a6b@amd.com>
Date: Tue, 26 Sep 2023 23:32:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH v4 02/10] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-3-matthew.brost@intel.com>
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
In-Reply-To: <20230919050155.2647172-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::19) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SJ0PR12MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd345dc-3dcd-4833-421a-08dbbf0a59f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: drggE7FQ9o/qrDLl52E51YsK/ZGEEIb+vAAOWpNqpz3rqcIPUXqxfBn/vnspn0uuscFhL/BEPR9Obhur0wB4S3UURiKXv6aADWg+fnZREjjNDugUozmvxyQVIDhlUn+b5zFGLCEUlk+1XrzH21rL9F7tqdF1JoKfjIEpzr/V+Fjk3YCdkhGz9z0UFsHT6bXgmqccLou27jj6oVBtXuHBo9nPb9S6EnHCvQ+o1EtS230o4w0L6U1QftJ62X0GTa2gAwAPfEuF59RZKPZtKNMAoC7jBKJR8Y9OAnFXMiacvGnf3RZnYy3YmdeXdaJlw1yi6GmKB2dd23zgjnbk/xctSNq+Cz3Q332OOM8Gvx0kS+wd3CMaLR61lCw4LA1s5zFJLkcK4qJRQHmnVo8ucX2Jz9QjJTqCrSX94ExnbY9qul0/4IlY3WePSnPlmcMWy1u/uDu4bKP06kiYWTXsgPWhx40duOEKgGeQIM8mjslL36FSMpv/HPkm87ikxz4Z0olWmNN+uK7cvEpMlJwPbNcPCOj43Mp+zIfkbV6nfe+IgRKaz6+vaJWLjC3CCQfZPX3jndig+eWtz3j+SDlYi+YOCItIYrq1Q09ITe45NNVTJ+cOxHJSPPMysEtaqINoZq4Itg5W7JQitrYRoA1lfrbcC+PifODCsDcBkhQqsrRh2V4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(1800799009)(186009)(451199024)(53546011)(8676002)(83380400001)(8936002)(6512007)(2616005)(2906002)(6506007)(6486002)(6666004)(26005)(36756003)(44832011)(4326008)(5660300002)(66476007)(478600001)(66946007)(38100700002)(86362001)(7416002)(41300700001)(31696002)(66556008)(316002)(30864003)(31686004)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW1FYVRZNTYzUnZrSFNxODdPKzVmTkM2WWV6NmlsTnhQOElBdHRGTXlCUDBS?=
 =?utf-8?B?dmhDb2o4YS9TWWgyWlo2ZUdRWXVSd09yUGF2a0VGZ2RKc2t4RThiekpQQ25n?=
 =?utf-8?B?WW5HWEJpOVFETHlGU2pyU3c5NDFyU21XVnJPR0FYaXZ3ZWkyK2hJcU95eW1E?=
 =?utf-8?B?bGkxZGtKUEtxeEsweklQWDlqWjdnc2F1bWVGelNWeEhQNWJmRlQyUkp3TTV1?=
 =?utf-8?B?MjBVVFZwcXVhV2gxVWVNc2RKTE5JK0hKWlBEeFZwQjd5Nm5NL0lVT0FnMSth?=
 =?utf-8?B?ZXVIblBRbHVob2ZyREN6N2pOd2R3U0lBd2syVHE0K3hLa2lyek1yQzJpRTVC?=
 =?utf-8?B?MTVJMCtlRlprbzBnOElpazc0b3RGWmd3cUV1WUJaakduWVJGOXYyQ2ZrdmFz?=
 =?utf-8?B?ZVVDS1QzdDNpMkhLL1pLMUR3d2p3OWNaYVpRWTczMWhPeHVzRGdvUXcyNHZW?=
 =?utf-8?B?eHF6RlpSWjBXQzNDQ2dObDVkaFJmWmY0eWxHa2xCSTZRMEVsV2NLN3VIZkVr?=
 =?utf-8?B?T3dHRVpqbTZkUStlL2xRelo1VGliai9aNDdGdmZneGVUcTQ1MkkvQXFPVXFo?=
 =?utf-8?B?Nmk4MGZGZFQzVndJcE1GNjBidm1NQ29BQTJJS2JTWkduZzBPSzFKdDBnTmFD?=
 =?utf-8?B?SlFPa25Nc09oc2FheGFZM2d6VW1tVGQ0TDdmc1dLWE5OTG1tT2dySCt0dEUy?=
 =?utf-8?B?T1hSV2haRTBicXdkWXZyRmJacllIb1F1azNUZUxXMVArMWFpTDR4KzNkWURW?=
 =?utf-8?B?dnpTWGRKT0RkTTZJVldQWlRVTmVFcFpUZko5eGdPa3BkWjFBNWtTQkVSMmZt?=
 =?utf-8?B?V29SUzBPdm4xMHdYelhhSVRCcTJDbG9hRzNoYU1XandLbTl4NCtiOU5WUlc1?=
 =?utf-8?B?bjlmMXkrTytlcXZQZjVtVzZKRTVaS0RQYTJWZkQ2UDJaa0NCOHZYR0hoNUJa?=
 =?utf-8?B?RGNqcE5RQVBvWFp3enIrQkJSY2tXSURaU3hRQWcvWXdDalpSMUlIcjB0dDNE?=
 =?utf-8?B?SnhSa3Z5N3BPdHYxQkFBVS9rczV1aXJEUDd4MytOVHUrZVBkQmNudlp1OC9E?=
 =?utf-8?B?RW1XUEk4Zlg3VmptYmVBdnI3dFhMeGJtVVE2R1BzL0REdS9qb2dINzhWN1pq?=
 =?utf-8?B?dk5HdXkzMjVES1YxeDRpWGJlK3J6bFR4ZkhleXhjSUpKVUFvcUZFV1lCalpJ?=
 =?utf-8?B?em5tcDlUbFQ3cDN4WFpkTUhOb081SFlYdEdha2pMMDVMWEFDYitVUFRCellX?=
 =?utf-8?B?Q1FOakN5ZkFHeDFUYTBtdkpGdnJTeENGc21raEMxK1NpelpnVEkyV0o4QVdh?=
 =?utf-8?B?djQrd1d1TWlrUXRoRWhzS09KYUxKQTJCM05tb0hVS2MyNUpiUjBna1lGRFpw?=
 =?utf-8?B?ME5jWGR4QTNYK2lCMmVVWkcwT3FOajFYU1RybXkxSDFRK0tkU1ZBU1Nkb0Vu?=
 =?utf-8?B?aVVmOWJSVUlsMC9mOEFrSTF3NmJvTTB1c29vandvdnlRSlpCeTdmMWJKL0pH?=
 =?utf-8?B?cUJlYTNad0Eyb1VFTUFMZXQ2blNqUnVpU0xoWW1RSU9ZRnh4OEx6ZG9SMVJo?=
 =?utf-8?B?SFEvZXlXRlVQTTlNK1NheXNNaENlY3dnYWc3R3labGNJQkg5ekN4bkFFV0Y2?=
 =?utf-8?B?TEsyTnUvc2xJYXRneVNSSlh1dk9md1hPc3l3MnlKVVczL0pUT29XNEMyT09s?=
 =?utf-8?B?OVM1K2svS29yMjJDY3RNVzhScHZGclNyS3RqbENLYk1rYzM2TkhERUE0YklV?=
 =?utf-8?B?ZU1oN0VWUm43TjlNeisydHhKWElJNjdvN2w2b2dzY3JhbkRUQXoyY3A3RUxr?=
 =?utf-8?B?K0FVWTVrb0xLK3BTN0NrbVdvNXlCcG1OS2FhaTMvMTdRRmExZmgxRGFqY1ps?=
 =?utf-8?B?cFlSWjhqMzBjckUybk4wTDl3Z05vNzd4cFJ2ZmRpS29yMXRIZlZCanNvTmNX?=
 =?utf-8?B?UG81eHRqcXExVTZpZ20zRXh0MTc0YXdqQzZrdWl1a0MxNktJTTJqL3puaEhp?=
 =?utf-8?B?aU9DYURia3puTzZOOGEzSVlxRnVvVml1bktRUFBFdWN5em1aNkVrSGFkdldp?=
 =?utf-8?B?N1l3MzhGQmEwL1ZaYk1jZE9sbFVxQWFlOUVRQzU0TUVMNGwySWVpSWVzcWRw?=
 =?utf-8?Q?oEbMzpUabO52jINC/zgh6V0NO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd345dc-3dcd-4833-421a-08dbbf0a59f7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 03:32:18.4825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DoIs4WT/bVjsbGfApCejTNrOgmSotSKzFd6YtPEW62T/b0tsmp/UrEn3Nx7lgTw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7458
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

On 2023-09-19 01:01, Matthew Brost wrote:
> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> seems a bit odd but let us explain the reasoning below.
> 
> 1. In XE the submission order from multiple drm_sched_entity is not
> guaranteed to be the same completion even if targeting the same hardware
> engine. This is because in XE we have a firmware scheduler, the GuC,
> which allowed to reorder, timeslice, and preempt submissions. If a using
> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> apart as the TDR expects submission order == completion order. Using a
> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> 
> 2. In XE submissions are done via programming a ring buffer (circular
> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
> control on the ring for free.
> 
> A problem with this design is currently a drm_gpu_scheduler uses a
> kthread for submission / job cleanup. This doesn't scale if a large
> number of drm_gpu_scheduler are used. To work around the scaling issue,
> use a worker rather than kthread for submission / job cleanup.
> 
> v2:
>   - (Rob Clark) Fix msm build
>   - Pass in run work queue
> v3:
>   - (Boris) don't have loop in worker
> v4:
>   - (Tvrtko) break out submit ready, stop, start helpers into own patch
> v5:
>   - (Boris) default to ordered work queue
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
>  drivers/gpu/drm/lima/lima_sched.c          |   2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c     | 118 ++++++++++-----------
>  drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
>  include/drm/gpu_scheduler.h                |  14 ++-
>  9 files changed, 79 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e366f61c3aed..16f3cfe1574a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>  			break;
>  		}
>  
> -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
>  				   ring->num_hw_submission, 0,
>  				   timeout, adev->reset_domain->wq,
>  				   ring->sched_score, ring->name,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 345fec6cb1a4..618a804ddc34 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>  {
>  	int ret;
>  
> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>  			     msecs_to_jiffies(500), NULL, NULL,
>  			     dev_name(gpu->dev), gpu->dev);
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index ffd91a5ee299..8d858aed0e56 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>  
>  	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>  
> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>  			      lima_job_hang_limit,
>  			      msecs_to_jiffies(timeout), NULL,
>  			      NULL, name, pipe->ldev->dev);
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 40c0bc35a44c..b8865e61b40f 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  	 /* currently managing hangcheck ourselves: */
>  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>  
> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>  			num_hw_submissions, 0, sched_timeout,
>  			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);

checkpatch.pl complains here about unmatched open parens.

>  	if (ret) {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 88217185e0f3..d458c2227d4f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -429,7 +429,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>  	if (!drm->sched_wq)
>  		return -ENOMEM;
>  
> -	return drm_sched_init(sched, &nouveau_sched_ops,
> +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>  			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 033f5e684707..326ca1ddf1d7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  		js->queue[j].fence_context = dma_fence_context_alloc(1);
>  
>  		ret = drm_sched_init(&js->queue[j].sched,
> -				     &panfrost_sched_ops,
> +				     &panfrost_sched_ops, NULL,
>  				     nentries, 0,
>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>  				     pfdev->reset.wq,
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e4fa62abca41..ee6281942e36 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -48,7 +48,6 @@
>   * through the jobs entity pointer.
>   */
>  
> -#include <linux/kthread.h>
>  #include <linux/wait.h>
>  #include <linux/sched.h>
>  #include <linux/completion.h>
> @@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
>  }
>  
> +/**
> + * drm_sched_submit_queue - scheduler queue submission

There is no verb in the description, and is not clear what
this function does unless one reads the code. Given that this
is DOC, this should be clearer here. Something like "queue
scheduler work to be executed" or something to that effect.

Coming back to this from reading the patch below, it was somewhat
unclear what "drm_sched_submit_queue()" does, since when reading
below, "submit" was being read by my mind as an adjective, as opposed
to a verb. Perhaps something like:

drm_sched_queue_submit(), or
drm_sched_queue_exec(), or
drm_sched_queue_push(), or something to that effect. You pick. :-)

Note that it doesn't have to be 100% reflective of the fact that
we're putting this on a workqueue and it would be executed sooner
or later, so long as it conveys the fact that we're executing this
scheduler queue.

> + * @sched: scheduler instance
> + */
> +static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> +{
> +	if (!READ_ONCE(sched->pause_submit))
> +		queue_work(sched->submit_wq, &sched->work_submit);
> +}
> +
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> @@ -275,7 +284,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>  	dma_fence_get(&s_fence->finished);
>  	drm_sched_fence_finished(s_fence, result);
>  	dma_fence_put(&s_fence->finished);
> -	wake_up_interruptible(&sched->wake_up_worker);
> +	drm_sched_submit_queue(sched);
>  }
>  
>  /**
> @@ -868,7 +877,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (drm_sched_can_queue(sched))
> -		wake_up_interruptible(&sched->wake_up_worker);
> +		drm_sched_submit_queue(sched);
>  }
>  
>  /**
> @@ -978,61 +987,42 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>  }
>  EXPORT_SYMBOL(drm_sched_pick_best);
>  
> -/**
> - * drm_sched_blocked - check if the scheduler is blocked
> - *
> - * @sched: scheduler instance
> - *
> - * Returns true if blocked, otherwise false.
> - */
> -static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
> -{
> -	if (kthread_should_park()) {
> -		kthread_parkme();
> -		return true;
> -	}
> -
> -	return false;
> -}
> -
>  /**
>   * drm_sched_main - main scheduler thread
>   *
>   * @param: scheduler instance
> - *
> - * Returns 0.
>   */
> -static int drm_sched_main(void *param)
> +static void drm_sched_main(struct work_struct *w)
>  {
> -	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
> +	struct drm_gpu_scheduler *sched =
> +		container_of(w, struct drm_gpu_scheduler, work_submit);
> +	struct drm_sched_entity *entity;
> +	struct drm_sched_job *cleanup_job;
>  	int r;
>  
> -	sched_set_fifo_low(current);
> +	if (READ_ONCE(sched->pause_submit))
> +		return;
>  
> -	while (!kthread_should_stop()) {
> -		struct drm_sched_entity *entity = NULL;
> -		struct drm_sched_fence *s_fence;
> -		struct drm_sched_job *sched_job;
> -		struct dma_fence *fence;
> -		struct drm_sched_job *cleanup_job = NULL;
> +	cleanup_job = drm_sched_get_cleanup_job(sched);
> +	entity = drm_sched_select_entity(sched);
>  
> -		wait_event_interruptible(sched->wake_up_worker,
> -					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
> -					 (!drm_sched_blocked(sched) &&
> -					  (entity = drm_sched_select_entity(sched))) ||
> -					 kthread_should_stop());
> +	if (!entity && !cleanup_job)
> +		return;	/* No more work */
>  
> -		if (cleanup_job)
> -			sched->ops->free_job(cleanup_job);
> +	if (cleanup_job)
> +		sched->ops->free_job(cleanup_job);
>  
> -		if (!entity)
> -			continue;
> +	if (entity) {
> +		struct dma_fence *fence;
> +		struct drm_sched_fence *s_fence;
> +		struct drm_sched_job *sched_job;
>  
>  		sched_job = drm_sched_entity_pop_job(entity);
> -
>  		if (!sched_job) {
>  			complete_all(&entity->entity_idle);
> -			continue;
> +			if (!cleanup_job)
> +				return;	/* No more work */
> +			goto again;
>  		}
>  
>  		s_fence = sched_job->s_fence;
> @@ -1063,7 +1053,9 @@ static int drm_sched_main(void *param)
>  
>  		wake_up(&sched->job_scheduled);
>  	}
> -	return 0;
> +
> +again:
> +	drm_sched_submit_queue(sched);
>  }
>  
>  /**
> @@ -1071,6 +1063,8 @@ static int drm_sched_main(void *param)
>   *
>   * @sched: scheduler instance
>   * @ops: backend operations for this scheduler
> + * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> + *	       allocated and used
>   * @hw_submission: number of hw submissions that can be in flight
>   * @hang_limit: number of times to allow a job to hang before dropping it
>   * @timeout: timeout value in jiffies for the scheduler
> @@ -1084,14 +1078,25 @@ static int drm_sched_main(void *param)
>   */
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
> +		   struct workqueue_struct *submit_wq,
>  		   unsigned hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev)
>  {
> -	int i, ret;
> +	int i;
>  	sched->ops = ops;
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
> +	if (!submit_wq) {
> +		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> +		if (!sched->submit_wq)
> +			return -ENOMEM;
> +
> +		sched->alloc_submit_wq = true;
> +	} else {
> +		sched->submit_wq = submit_wq;
> +		sched->alloc_submit_wq = false;
> +	}

This if-conditional, I would've written:

	if (submit_wq) {
		sched->submit_wq = submit_wq;
		sched->alloc_submit_wq = false;
	} else {
		sched->submit_wq = alloc_ordered_workqueue(name, 0);
		if (!sched->submit_wq)
			return -ENOMEM;

		sched->alloc_submit_wq = true;
	}

It's easier to understand testing for positivity, than negativity.


>  	sched->timeout = timeout;
>  	sched->timeout_wq = timeout_wq ? : system_wq;
>  	sched->hang_limit = hang_limit;
> @@ -1100,23 +1105,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>  
> -	init_waitqueue_head(&sched->wake_up_worker);
>  	init_waitqueue_head(&sched->job_scheduled);
>  	INIT_LIST_HEAD(&sched->pending_list);
>  	spin_lock_init(&sched->job_list_lock);
>  	atomic_set(&sched->hw_rq_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> +	INIT_WORK(&sched->work_submit, drm_sched_main);
>  	atomic_set(&sched->_score, 0);
>  	atomic64_set(&sched->job_id_count, 0);
> -
> -	/* Each scheduler will run on a seperate kernel thread */
> -	sched->thread = kthread_run(drm_sched_main, sched, sched->name);
> -	if (IS_ERR(sched->thread)) {
> -		ret = PTR_ERR(sched->thread);
> -		sched->thread = NULL;
> -		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
> -		return ret;
> -	}
> +	sched->pause_submit = false;
>  
>  	sched->ready = true;
>  	return 0;
> @@ -1135,8 +1132,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  	struct drm_sched_entity *s_entity;
>  	int i;
>  
> -	if (sched->thread)
> -		kthread_stop(sched->thread);
> +	drm_sched_submit_stop(sched);
>  
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		struct drm_sched_rq *rq = &sched->sched_rq[i];
> @@ -1159,6 +1155,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  	/* Confirm no work left behind accessing device structures */
>  	cancel_delayed_work_sync(&sched->work_tdr);
>  
> +	if (sched->alloc_submit_wq)
> +		destroy_workqueue(sched->submit_wq);
>  	sched->ready = false;
>  }
>  EXPORT_SYMBOL(drm_sched_fini);
> @@ -1216,7 +1214,7 @@ EXPORT_SYMBOL(drm_sched_increase_karma);
>   */
>  bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched)
>  {
> -	return !!sched->thread;
> +	return sched->ready;
>  
>  }
>  EXPORT_SYMBOL(drm_sched_submit_ready);
> @@ -1228,7 +1226,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>   */
>  void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>  {
> -	kthread_park(sched->thread);
> +	WRITE_ONCE(sched->pause_submit, true);
> +	cancel_work_sync(&sched->work_submit);
>  }
>  EXPORT_SYMBOL(drm_sched_submit_stop);
>  
> @@ -1239,6 +1238,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>   */
>  void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>  {
> -	kthread_unpark(sched->thread);
> +	WRITE_ONCE(sched->pause_submit, false);
> +	queue_work(sched->submit_wq, &sched->work_submit);
>  }
>  EXPORT_SYMBOL(drm_sched_submit_start);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 06238e6d7f5c..38e092ea41e6 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -388,7 +388,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  	int ret;
>  
>  	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> -			     &v3d_bin_sched_ops,
> +			     &v3d_bin_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_bin", v3d->drm.dev);
> @@ -396,7 +396,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  		return ret;
>  
>  	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> -			     &v3d_render_sched_ops,
> +			     &v3d_render_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_render", v3d->drm.dev);
> @@ -404,7 +404,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  		goto fail;
>  
>  	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> -			     &v3d_tfu_sched_ops,
> +			     &v3d_tfu_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
>  			     NULL, "v3d_tfu", v3d->drm.dev);
> @@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  
>  	if (v3d_has_csd(v3d)) {
>  		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> -				     &v3d_csd_sched_ops,
> +				     &v3d_csd_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
>  				     NULL, "v3d_csd", v3d->drm.dev);
> @@ -421,7 +421,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			goto fail;
>  
>  		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> -				     &v3d_cache_clean_sched_ops,
> +				     &v3d_cache_clean_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
>  				     NULL, "v3d_cache_clean", v3d->drm.dev);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index f12c5aea5294..95927c52383c 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -473,17 +473,16 @@ struct drm_sched_backend_ops {
>   * @timeout: the time after which a job is removed from the scheduler.
>   * @name: name of the ring for which this scheduler is being used.
>   * @sched_rq: priority wise array of run queues.
> - * @wake_up_worker: the wait queue on which the scheduler sleeps until a job
> - *                  is ready to be scheduled.
>   * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>   *                 waits on this wait queue until all the scheduled jobs are
>   *                 finished.
>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
> + * @submit_wq: workqueue used to queue @work_submit
>   * @timeout_wq: workqueue used to queue @work_tdr
> + * @work_submit: schedules jobs and cleans up entities
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>   *            timeout interval is over.
> - * @thread: the kthread on which the scheduler which run.
>   * @pending_list: the list of jobs which are currently in the job queue.
>   * @job_list_lock: lock to protect the pending_list.
>   * @hang_limit: once the hangs by a job crosses this limit then it is marked
> @@ -492,6 +491,8 @@ struct drm_sched_backend_ops {
>   * @_score: score used when the driver doesn't provide one
>   * @ready: marks if the underlying HW is ready to work
>   * @free_guilty: A hit to time out handler to free the guilty job.
> + * @pause_submit: pause queuing of @work_submit on @submit_wq
> + * @alloc_submit_wq: scheduler own allocation of @submit_wq
>   * @dev: system &struct device
>   *
>   * One scheduler is implemented for each hardware ring.
> @@ -502,13 +503,13 @@ struct drm_gpu_scheduler {
>  	long				timeout;
>  	const char			*name;
>  	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
> -	wait_queue_head_t		wake_up_worker;
>  	wait_queue_head_t		job_scheduled;
>  	atomic_t			hw_rq_count;
>  	atomic64_t			job_id_count;
> +	struct workqueue_struct		*submit_wq;
>  	struct workqueue_struct		*timeout_wq;
> +	struct work_struct		work_submit;
>  	struct delayed_work		work_tdr;
> -	struct task_struct		*thread;
>  	struct list_head		pending_list;
>  	spinlock_t			job_list_lock;
>  	int				hang_limit;
> @@ -516,11 +517,14 @@ struct drm_gpu_scheduler {
>  	atomic_t                        _score;
>  	bool				ready;
>  	bool				free_guilty;
> +	bool				pause_submit;
> +	bool				alloc_submit_wq;

Please rename it to what it actually describes:

alloc_submit_wq --> own_submit_wq

to mean "do we own the submit wq". Then the check becomes
the intuitive,
	if (sched->own_submit_wq)
		destroy_workqueue(sched->submit_wq);

>  	struct device			*dev;
>  };
>  
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
> +		   struct workqueue_struct *submit_wq,
>  		   uint32_t hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev);

This is a good patch.
-- 
Regards,
Luben

