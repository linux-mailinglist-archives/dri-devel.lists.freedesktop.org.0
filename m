Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20B7AF79A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 03:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE5C10E457;
	Wed, 27 Sep 2023 01:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE95A10E456;
 Wed, 27 Sep 2023 01:07:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8PEc3Pc2I5BlJDoOfOv0Bf9Zpm7JyMyguYO7Ss7E0ig5c8lq3O8DzBVVuWpMpFOWrFdsKcbZVRJy08RP3fNhR4wqkgQxHWyqmmPpYVFAQJdLFe17giWM6uMRvilnVUHRxyuh3VgpfDCdGjiNatBXRMvLVbiu0ZSylRqrzi91mUjKbeIVNozgwRnZuOo/G8thk+CTQ7R9q8c2fwum9nMXFQYWxmTooB7bmV6K1rzQ8zbkoVuJrcU8PE1Yw4KToz/iwEgo3RLT5OAJCntcTDR7QOyR4oUjmq0XBaB3f2f8PhxvD12u/sxF2RSKSC/s4UfZsMH0Da7Nz20sANN7qAxeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uM7nFiRGeT74WPa8CzeaKWVBnLH0JKiLayP5Jz8PfqA=;
 b=LLZf07tBWaG3MvU7CkQKlEHQsepatQKWhJY3JQprj+2GOL1LOqsbDRHrWETO8hQPnP8jrs616V8L9Gnp9NhzQGiN8ja44kdSOYa8vOeOYs4kmmXqXvCKEDObIq4GZqFeia3C+e1kNR/oIlPADur3evX+NFuyk1YI83qR92tk39qrinRQ1K7lzksZaV/9+AHCX/W59LOAFXTvLwMkiXWIvfTuHOEBnF6LMS4cT/ujeRvSqxxyNKuVPEFmLBC0+jNgnKh5gMwvOQKtwtME3+/J6vxSGSEaU3H47LYzWUOMY+LvJqon+7wmZhENpEZg+WSQMQQfD3RZDt2HbNIUd8c7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uM7nFiRGeT74WPa8CzeaKWVBnLH0JKiLayP5Jz8PfqA=;
 b=yB5utL8KfqJOVpBnj0eG9aAWe5UolRgHwZy2OiYZPKT7G8SLi7iD5v85eIrPCEYjfoG9XB8Me1P/HvABEt4QlizLIOdZScz/KBGNvZd0u3bxuzYp+AVUybThWtoffve7P5RsI3N6HihuON+LW5dFHeMzkDJKFJmyITR/QGUhUxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.32; Wed, 27 Sep
 2023 01:07:09 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Wed, 27 Sep 2023
 01:07:08 +0000
Message-ID: <076891e9-b2ce-4c7f-833d-157aca5cd44b@amd.com>
Date: Tue, 26 Sep 2023 21:07:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH v4 01/10] drm/sched: Add drm_sched_submit_* helpers
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-2-matthew.brost@intel.com>
Content-Language: en-CA, en-US
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
In-Reply-To: <20230919050155.2647172-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0192.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::13) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: f31e8592-2099-418b-7015-08dbbef61218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u0DSPuPlkMTZtGQVTpWw5rLOfyEDOfyi0T9py7GLCtJG617ZAc+MlMdbMQsJBgTzEHAJxfaWi2g5NEYTJhAHiBzZHmT/YGEyqVS7J0a4OhPbsG8BA/oWQhZkUf5x8UHNViSR13Yr3YyVqQdAdIQefZNVDvhfM7jWqJ1uaWIUbwnfnOnsdclfbCKXNaO1+LoD87BD4zm5Y6kN7v67PkJz8JFbaNBtrntmBGp4f8DFjSMAc3DafL4MuIc4DC949UegYdK6v+I2Ze68BJ4+nD0/PbRsS0uzsZSphgfx3WUkpaWvMGU6eg65mAN5VCR0wXSMmdWYyITcLsXaTyb1GOlXCSBYbQulaekLyDD/ySWkzlQ71wmH61l1e4aPHC/xgBVPBUoRgvkvTsXi7VdZtuiOcf2LNsOzSxHO9gksaHxfJx4pFWKRiFmOX25OHROxFVP26Kyyj4rpuUAJYhdrNauL/tOSZQm/CofoucNF+uiLCrIYOVHLrXjvQO7hqGpY4QWZ8/WLl6w2NsAWHQmayJayfjXG5fIABM5wy2pQBbzc1H5zva1Mb8rOkhuxMh4i0JsnuY/t0Oe/f/Bk/9VdGlLvDiIOD6KPID1ncomfoZBBlOzaVr423YN4o7p4b2J1Veu3RSMTrPw3zVFmPgHtvqAz7QxGIO9wv930Vy61erin9jLvcsqytlLxmaeUdAxh9Dov
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(31686004)(36756003)(83380400001)(26005)(6666004)(2616005)(53546011)(6506007)(316002)(6486002)(41300700001)(478600001)(86362001)(6512007)(38100700002)(66946007)(66556008)(66476007)(8676002)(8936002)(2906002)(4326008)(31696002)(7416002)(44832011)(5660300002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzg2NVBUSmVpalVPcSt3SUNYUThmNkR6UHVzcXI2MEZKWDkzdXNlejVVSjhU?=
 =?utf-8?B?WWZBOW5yYzdBV1hCZmUzSnJzU3JnTzlTeDBrWWl0OGdjSHN6akVsQnRxQnor?=
 =?utf-8?B?czdrWXJ1ZXlxM1NUSS9OMlpaeHFXOEV2MW5FblQ0STM2QTRWWjdoTGlLeEhX?=
 =?utf-8?B?V0NXekgzRWlEcGNVcW1vVXJUOXJOcmVkazBoZm90MXVCK05CaDVFbG8vQ2F0?=
 =?utf-8?B?RkFBQXpMYTBZY1RraStHcCtrMkY0Vy9zcDVPMTlucEU1TjMvWC83bHdrbC9u?=
 =?utf-8?B?MEdrWXdvYS9jdjk1MUtlZXBqcThwM1h6ZG1mNE1raE4vSGtPK3FUZXpRZFNB?=
 =?utf-8?B?ZzVpVDFiV21yekZ1QTBnSUFsZk0zQi9ZclJucUxsdHdmSUg3RWRqRjBXVWFm?=
 =?utf-8?B?R3FWQVJ0cm5zM1VMR1oxUXY2cFhnWlZob2FJYW5EYUJWZ3MvVHRkdTd3U2xZ?=
 =?utf-8?B?aVVIOFFYVnZsNnZOaTlEWEFJNzVMU2R1MXVnY0YxdmtRYTN2VTR0UUlSNWw2?=
 =?utf-8?B?cFdjdE5YWFJLTUYvT1FIR0ZLK2RmL3RuNnRxQ2xXQlF3QXdNRVFoRm4wTjBM?=
 =?utf-8?B?UHJ4dE1xaGtpalMvWktnV2IyM0FpLzB4bEIrWmFwcXBzYU5QRzd5Sndnamda?=
 =?utf-8?B?R1oxTjFRWVVVZ0t4bFBqaU1nM3dFMjBleFRGV0IxdTgxOWJTQ3ZxUmdhQ1NY?=
 =?utf-8?B?ai9CdXJvVXdjdGl0R0ZWRGc1YXR0enh3UjFVOVF3Tnk0Vnd3ZFJRamlpN1pQ?=
 =?utf-8?B?bmxndUxITnoxTFBRMVdQRWZVbFV0aitzYzVsQWw5Z1VCN0NiQ3dzbzJtV2Fk?=
 =?utf-8?B?ckZCWi9nbFoxU0VFVURmTVd0d1orMUcwQWxnWUZYZUpqUUN6cnQrYnlwNDhT?=
 =?utf-8?B?L0hJMU12amd1emYzZ3VPc3NRMnRSODFLZFNYNFBDYlBCNFIrcTYwVkZGNm9v?=
 =?utf-8?B?VHlmUHcrSElvQzZqb1J3OUhtdU8zczR1czVodjN1YWpET1ZscGNvNy9uazM4?=
 =?utf-8?B?eklVSHh5WllxUzd0YXUySW9vWUZnN1dxSndZMFlIMUVaWmZOeE9Tak9zVTQ2?=
 =?utf-8?B?UWttckRJelZJOEprWlFicHlIRWc5VVhzYlA4dVhRRFNRbnZ1clM1ZkpvNmsx?=
 =?utf-8?B?ZFp4R09TaCtxNXBJdUdhNlBiZ2psVjF1Zm4wWDVNZGdDUTgxMm5ySTRpdm5y?=
 =?utf-8?B?eSthZldPTEgrY3ZpUFFlNVNlbzVjdVlkNEVOUUdtdDcyYVp1OFAzRzl1dk9D?=
 =?utf-8?B?OG9YdU9hYVRZV2tXdzh4bGkyREMzTFBlcjh1MFJyMEx4NS9HZkZFQW1NMitQ?=
 =?utf-8?B?VUM3eFRDUXpHdGRxTzVmQWRENkNrZTV0b2o3UERGYUpKSFJYaUFlUVFneklI?=
 =?utf-8?B?U0JtcHFZcEVibjdRTmFQWnpmNjhpZ21JcWRuUEFabG9ZdEJzVngrb3d5VTdU?=
 =?utf-8?B?SDVmaHZuS3VodzRRa29LeVQyME9uU2pMN2F0TVFaeHg2L2hycm5naG5qMks5?=
 =?utf-8?B?bml6aUd1TEsxSmY5bUljYktLMU5wQUVqcnRHNjJncWpLdFJ2ZGVieTJHMnNx?=
 =?utf-8?B?QTd1SlJyWG5vUVlmcDVZdExlSE5jcGxHWGxjU3JBajkrNjAwMFhSM3dtTi9X?=
 =?utf-8?B?OXRqa2hqZXZxS09xVDBpbUszekNGWms3TE9uTzZOMXQrbkdKT0x6djZFQnFa?=
 =?utf-8?B?cWhLOXVHSkNoczI5TSt2TXVOUUtoS0dmaUgrTzcvUWM4QkVqTEp3ZmNRb3RN?=
 =?utf-8?B?NXBpUDdLOTdHUHh0YjA0Y0t2Y0xYb2s2aml5QUFuamlWYk1mV05CRXFFSnNQ?=
 =?utf-8?B?L0lHQnZERjJnSHNDNDlFU05FVDBNRWgrazdUWnhPZVRwWFIrTERWM3VjV1pZ?=
 =?utf-8?B?TjIwR1lKUGlaclNFS3BEOFY3TStmelRnRjNrUFZaN3l2Yi96MW82L2ZWYmtk?=
 =?utf-8?B?bXE3SUcrdW9hU3MyQkZ0d0JNdURsNEczaW5lcEQ4eW1IbFU1dE5EbnJuZ2Vy?=
 =?utf-8?B?bGNGOEovejRNQ3A4aUEyYWY0eE9xR0wrQ0VtVFlTbDZWcHZNVWFNZWkveTZy?=
 =?utf-8?B?anRwSUZNZ3JUSmE4VEE1cHJHcUg0aWhibDlnUGg5dWhoVlZlZjZqM3dSN21N?=
 =?utf-8?Q?rVMsDarhjPJXlTP9aey+Hw+54?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31e8592-2099-418b-7015-08dbbef61218
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 01:07:08.3224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYdazPAopVY3iBdbyGhTrmo1UlwZUbAUz5j8jMt9sdnxUDdcjrwMZHpylfWGi1bs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617
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

On 2023-09-19 01:01, Matthew Brost wrote:
> Add scheduler submit ready, stop, and start helpers to hide the
> implementation details of the scheduler from the drivers.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 15 +++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 12 +++---
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |  6 ++-
>  drivers/gpu/drm/scheduler/sched_main.c        | 40 ++++++++++++++++++-
>  include/drm/gpu_scheduler.h                   |  3 ++
>  6 files changed, 60 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 625db444df1c..36a1accbc846 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -290,7 +290,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
>  	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
>  		struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
>  
> -		if (!(ring && ring->sched.thread))
> +		if (!(ring && drm_sched_submit_ready(&ring->sched)))
>  			continue;
>  
>  		/* stop secheduler and drain ring. */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index a4faea4fa0b5..fb5dad687168 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1659,9 +1659,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>  	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>  		struct amdgpu_ring *ring = adev->rings[i];
>  
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>  			continue;
> -		kthread_park(ring->sched.thread);
> +		drm_sched_submit_stop(&ring->sched);
>  	}
>  
>  	seq_puts(m, "run ib test:\n");
> @@ -1675,9 +1675,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>  	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>  		struct amdgpu_ring *ring = adev->rings[i];
>  
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>  			continue;
> -		kthread_unpark(ring->sched.thread);
> +		drm_sched_submit_start(&ring->sched);
>  	}
>  
>  	up_write(&adev->reset_domain->sem);
> @@ -1897,7 +1897,8 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>  
>  	ring = adev->rings[val];
>  
> -	if (!ring || !ring->funcs->preempt_ib || !ring->sched.thread)
> +	if (!ring || !ring->funcs->preempt_ib ||
> +	    !drm_sched_submit_ready(&ring->sched))
>  		return -EINVAL;
>  
>  	/* the last preemption failed */
> @@ -1915,7 +1916,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>  		goto pro_end;
>  
>  	/* stop the scheduler */
> -	kthread_park(ring->sched.thread);
> +	drm_sched_submit_stop(&ring->sched);
>  
>  	/* preempt the IB */
>  	r = amdgpu_ring_preempt_ib(ring);
> @@ -1949,7 +1950,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>  
>  failure:
>  	/* restart the scheduler */
> -	kthread_unpark(ring->sched.thread);
> +	drm_sched_submit_start(&ring->sched);
>  
>  	up_read(&adev->reset_domain->sem);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 30c4f5cca02c..e366f61c3aed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4588,7 +4588,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
>  	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  		struct amdgpu_ring *ring = adev->rings[i];
>  
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>  			continue;
>  
>  		spin_lock(&ring->sched.job_list_lock);
> @@ -4727,7 +4727,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>  	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  		struct amdgpu_ring *ring = adev->rings[i];
>  
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>  			continue;
>  
>  		/* Clear job fence from fence drv to avoid force_completion
> @@ -5266,7 +5266,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  			struct amdgpu_ring *ring = tmp_adev->rings[i];
>  
> -			if (!ring || !ring->sched.thread)
> +			if (!ring || !drm_sched_submit_ready(&ring->sched))
>  				continue;
>  
>  			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
> @@ -5341,7 +5341,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  			struct amdgpu_ring *ring = tmp_adev->rings[i];
>  
> -			if (!ring || !ring->sched.thread)
> +			if (!ring || !drm_sched_submit_ready(&ring->sched))
>  				continue;
>  
>  			drm_sched_start(&ring->sched, true);
> @@ -5667,7 +5667,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
>  		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  			struct amdgpu_ring *ring = adev->rings[i];
>  
> -			if (!ring || !ring->sched.thread)
> +			if (!ring || !drm_sched_submit_ready(&ring->sched))
>  				continue;
>  
>  			drm_sched_stop(&ring->sched, NULL);
> @@ -5795,7 +5795,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
>  	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  		struct amdgpu_ring *ring = adev->rings[i];
>  
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>  			continue;
>  
>  		drm_sched_start(&ring->sched, true);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index fa527935ffd4..e046dc5ff72a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -809,7 +809,8 @@ static void suspend_scheduler(struct msm_gpu *gpu)
>  	 */
>  	for (i = 0; i < gpu->nr_rings; i++) {
>  		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> -		kthread_park(sched->thread);
> +
> +		drm_sched_submit_stop(sched);
>  	}
>  }
>  
> @@ -819,7 +820,8 @@ static void resume_scheduler(struct msm_gpu *gpu)
>  
>  	for (i = 0; i < gpu->nr_rings; i++) {
>  		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> -		kthread_unpark(sched->thread);
> +
> +		drm_sched_submit_start(sched);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 506371c42745..e4fa62abca41 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -439,7 +439,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>  {
>  	struct drm_sched_job *s_job, *tmp;
>  
> -	kthread_park(sched->thread);
> +	drm_sched_submit_stop(sched);
>  
>  	/*
>  	 * Reinsert back the bad job here - now it's safe as
> @@ -552,7 +552,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  		spin_unlock(&sched->job_list_lock);
>  	}
>  
> -	kthread_unpark(sched->thread);
> +	drm_sched_submit_start(sched);
>  }
>  EXPORT_SYMBOL(drm_sched_start);
>  
> @@ -1206,3 +1206,39 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>  	}
>  }
>  EXPORT_SYMBOL(drm_sched_increase_karma);
> +
> +/**
> + * drm_sched_submit_ready - scheduler ready for submission

"Is the scheduler ready for submission" is so much more clear
and approachable. Let's have that go in the kernel, yes?

> + *
> + * @sched: scheduler instance
> + *
> + * Returns true if submission is ready
> + */
> +bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched)
> +{
> +	return !!sched->thread;
> +
> +}

Remove the extra white line after the return-statement.
(Please run your patches through checkpatch.pl to catch those.)

With these two changes this patch is:
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

> +EXPORT_SYMBOL(drm_sched_submit_ready);
> +
> +/**
> + * drm_sched_submit_stop - stop scheduler submission
> + *
> + * @sched: scheduler instance
> + */
> +void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> +{
> +	kthread_park(sched->thread);
> +}
> +EXPORT_SYMBOL(drm_sched_submit_stop);
> +
> +/**
> + * drm_sched_submit_start - start scheduler submission
> + *
> + * @sched: scheduler instance
> + */
> +void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
> +{
> +	kthread_unpark(sched->thread);
> +}
> +EXPORT_SYMBOL(drm_sched_submit_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index f9544d9b670d..f12c5aea5294 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -550,6 +550,9 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> +bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
> +void drm_sched_submit_stop(struct drm_gpu_scheduler *sched);
> +void drm_sched_submit_start(struct drm_gpu_scheduler *sched);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);

-- 
Regards,
Luben

