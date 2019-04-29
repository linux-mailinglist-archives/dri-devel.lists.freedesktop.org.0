Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0193DEA9C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 21:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C6489317;
	Mon, 29 Apr 2019 19:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F4C89330;
 Mon, 29 Apr 2019 19:03:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o25so618822wmf.5;
 Mon, 29 Apr 2019 12:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=p1tbm3p+0ft/rqDkomgGVR1GFyE3sADgNrEaE3eR3Fs=;
 b=HcNWnoc7X6iq5260YUJIAJtzxvYsyEzENrLTVFd/gRx7SI5Kuj+mLdsRJZ7Di0aDco
 aZH+YFVig2vQ3COEa4A3/6dNLPVGydomQ4MDubIPmwh1JqVdJdDA6Z2YxOLWZGrSbsd3
 pRhivF23DYwhSzlMVGBdw8OxWThtKOW6CTX4QLP2r20WV7pYyQ3uE/e2j8piH5MxwybW
 Lp7dPk1PtMeGjxT4sdNndyEA+iLaBQh9W4qBEaSuWV6H1SgqT8Uu6Fwg2gCW2QNIh1TG
 Zj7JmujzVeqOQVF39522g8GGvJuJrtaexTdOH9SlFy59lVUaH2OZsCg6Oje8KEpeeO6c
 5aEQ==
X-Gm-Message-State: APjAAAV63lrQQlodk6SzyrJ9M6aPNRQDxoIDbMdZ87RFCLcgiTCZQGYV
 TrXs4vnHtjyK7I66TVLYRA4=
X-Google-Smtp-Source: APXvYqwvOA4bDM39HsbvEvQnvSsN3Gphyz5Jh+avSpM94gVacHtK8ab4mlEQG3xgfJVpisOJdn3zpQ==
X-Received: by 2002:a05:600c:2208:: with SMTP id
 z8mr353506wml.89.1556564635903; 
 Mon, 29 Apr 2019 12:03:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q26sm236654wmq.25.2019.04.29.12.03.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 12:03:54 -0700 (PDT)
Subject: Re: [PATCH v5 6/6] drm/amdgpu: Avoid HW reset if guilty job already
 signaled.
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "eric@anholt.net" <eric@anholt.net>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>
References: <1555599624-12285-1-git-send-email-andrey.grodzovsky@amd.com>
 <1555599624-12285-6-git-send-email-andrey.grodzovsky@amd.com>
 <2f8cf80c-3c53-0ee2-968c-08338b9f154e@amd.com>
 <1b41c4f1-b406-8710-2a7a-e5c54a116fe9@amd.com>
 <-hyv5g0n8ru25qelb0v-8u6jdi1vp2c7z1m3f5-uygwc1o5ji6s-9zli9v-srreuk-3pvse1en6kx0-6se95l-6jsafd-a6sboi-j814xf-ijgwfc-qewgmm-vnafjgrn2fq0-jgir949hx4yo-i772hz-tn7ial.1556032736536@email.android.com>
 <571a119a-170a-d1ba-6870-31807e0f7016@amd.com>
 <MN2PR12MB2910C37264B8F30BAD26FA4CB43C0@MN2PR12MB2910.namprd12.prod.outlook.com>
 <e20d013e-df21-1300-27d1-7f9b829cc067@gmail.com>
 <0c02ed97-1f10-1d06-6a06-d1ec0af2dbf7@amd.com>
 <MN2PR12MB2910903F08BF48360A6D5EEFB4380@MN2PR12MB2910.namprd12.prod.outlook.com>
 <effe0c0d-ef8d-898b-6be9-e3728b14b0af@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <22c9bc90-1dbe-6c2d-43cb-f2bc0abfc9d9@gmail.com>
Date: Mon, 29 Apr 2019 21:03:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <effe0c0d-ef8d-898b-6be9-e3728b14b0af@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=p1tbm3p+0ft/rqDkomgGVR1GFyE3sADgNrEaE3eR3Fs=;
 b=QgeJ8F0tHEFxnY3dN62RqWK1WMxNlTXGHEN3/sIfjq7GpUvQbUeKXO55fkaLKD6TP3
 pkNrTIM6l8zVrSI1/p51PCvuShpaRX0kzhuKI63wIwwcEqJNiGrc/DkaWv9wkaeUGOMl
 qfOgYi0Wj6WYf4JvpWMdvWV4Qk6hcHPW1x9YqiSgV9H/K9bsvYWa2V2ifirvcPhJHaK2
 V+gbtcR5DFoNsCtFAs9ZkDi8/0FTxpLK7bDXHBeT92oyOYMBQBfHVyGnZYUf2ksKrExb
 87Kwu26Ijs1ErocxlFjuVeHKu3wl5wr1F3r+WzjSEEVnMWbF7qhzGtonJ8tk8Nq4EW1v
 f3Nw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Reply-To: christian.koenig@amd.com
Cc: "Deng, Emily" <Emily.Deng@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Content-Type: multipart/mixed; boundary="===============0581085446=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0581085446==
Content-Type: multipart/alternative;
 boundary="------------66BEF7142C124195686C94BC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------66BEF7142C124195686C94BC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I would clean them up further, but that's only moving code around so 
feel free to add my rb to those.

Christian.

Am 29.04.19 um 16:14 schrieb Grodzovsky, Andrey:
>
> Thanks David, with that only patches 5 and 6 are left for the series 
> to be reviewed.
>
> Christian, any more comments on those patches ?
>
> Andrey
>
> On 4/27/19 10:56 PM, Zhou, David(ChunMing) wrote:
>>
>> Sorry, I only can put my Acked-by: Chunming Zhou 
>> <david1.zhou@amd.com> on patch#3.
>>
>> I cannot fully judge patch #4, #5, #6.
>>
>> -David
>>
>> *From:*amd-gfx <amd-gfx-bounces@lists.freedesktop.org> *On Behalf Of 
>> *Grodzovsky, Andrey
>> *Sent:* Friday, April 26, 2019 10:09 PM
>> *To:* Koenig, Christian <Christian.Koenig@amd.com>; Zhou, 
>> David(ChunMing) <David1.Zhou@amd.com>; 
>> dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; 
>> eric@anholt.net; etnaviv@lists.freedesktop.org
>> *Cc:* Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Liu, Monk 
>> <Monk.Liu@amd.com>
>> *Subject:* Re: [PATCH v5 6/6] drm/amdgpu: Avoid HW reset if guilty 
>> job already signaled.
>>
>> Ping (mostly David and Monk).
>>
>> Andrey
>>
>> On 4/24/19 3:09 AM, Christian König wrote:
>>
>>     Am 24.04.19 um 05:02 schrieb Zhou, David(ChunMing):
>>
>>         >> - drm_sched_stop(&ring->sched, &job->base);
>>         >> -
>>         >>               /* after all hw jobs are reset, hw fence is
>>         meaningless, so force_completion */
>>         >> amdgpu_fence_driver_force_completion(ring);
>>         >>       }
>>
>>         HW fence are already forced completion, then we can just
>>         disable irq fence process and ignore hw fence signal when we
>>         are trying to do GPU reset, I think. Otherwise which will
>>         make the logic much more complex.
>>
>>         If this situation happens because of long time execution, we
>>         can increase timeout of reset detection.
>>
>>
>>     You are not thinking widely enough, forcing the hw fence to
>>     complete can trigger other to start other activity in the system.
>>
>>     We first need to stop everything and make sure that we don't do
>>     any processing any more and then start with our reset procedure
>>     including forcing all hw fences to complete.
>>
>>     Christian.
>>
>>
>>         -David
>>
>>         *From:*amd-gfx <amd-gfx-bounces@lists.freedesktop.org>
>>         <mailto:amd-gfx-bounces@lists.freedesktop.org> *On Behalf Of
>>         *Grodzovsky, Andrey
>>         *Sent:* Wednesday, April 24, 2019 12:00 AM
>>         *To:* Zhou, David(ChunMing) <David1.Zhou@amd.com>
>>         <mailto:David1.Zhou@amd.com>; dri-devel@lists.freedesktop.org
>>         <mailto:dri-devel@lists.freedesktop.org>;
>>         amd-gfx@lists.freedesktop.org
>>         <mailto:amd-gfx@lists.freedesktop.org>; eric@anholt.net
>>         <mailto:eric@anholt.net>; etnaviv@lists.freedesktop.org
>>         <mailto:etnaviv@lists.freedesktop.org>;
>>         ckoenig.leichtzumerken@gmail.com
>>         <mailto:ckoenig.leichtzumerken@gmail.com>
>>         *Cc:* Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
>>         <mailto:Nicholas.Kazlauskas@amd.com>; Liu, Monk
>>         <Monk.Liu@amd.com> <mailto:Monk.Liu@amd.com>
>>         *Subject:* Re: [PATCH v5 6/6] drm/amdgpu: Avoid HW reset if
>>         guilty job already signaled.
>>
>>         No, i mean the actual HW fence which signals when the job
>>         finished execution on the HW.
>>
>>         Andrey
>>
>>         On 4/23/19 11:19 AM, Zhou, David(ChunMing) wrote:
>>
>>             do you mean fence timer? why not stop it as well when
>>             stopping sched for the reason of hw reset?
>>
>>             -------- Original Message --------
>>             Subject: Re: [PATCH v5 6/6] drm/amdgpu: Avoid HW reset if
>>             guilty job already signaled.
>>             From: "Grodzovsky, Andrey"
>>             To: "Zhou, David(ChunMing)"
>>             ,dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org,eric@anholt.net,etnaviv@lists.freedesktop.org,ckoenig.leichtzumerken@gmail.com
>>             <mailto:dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org,eric@anholt.net,etnaviv@lists.freedesktop.org,ckoenig.leichtzumerken@gmail.com>
>>             CC: "Kazlauskas, Nicholas" ,"Liu, Monk"
>>
>>
>>             On 4/22/19 9:09 AM, Zhou, David(ChunMing) wrote:
>>             > +Monk.
>>             >
>>             > GPU reset is used widely in SRIOV, so need
>>             virtulizatino guy take a look.
>>             >
>>             > But out of curious, why guilty job can signal more if
>>             the job is already
>>             > set to guilty? set it wrongly?
>>             >
>>             >
>>             > -David
>>
>>
>>             It's possible that the job does completes at a later time
>>             then it's
>>             timeout handler started processing so in this patch we
>>             try to protect
>>             against this by rechecking the HW fence after stopping
>>             all SW
>>             schedulers. We do it BEFORE marking guilty on the job's
>>             sched_entity so
>>             at the point we check the guilty flag is not set yet.
>>
>>             Andrey
>>
>>
>>             >
>>             > 在 2019/4/18 23:00, Andrey Grodzovsky 写道:
>>             >> Also reject TDRs if another one already running.
>>             >>
>>             >> v2:
>>             >> Stop all schedulers across device and entire XGMI hive
>>             before
>>             >> force signaling HW fences.
>>             >> Avoid passing job_signaled to helper fnctions to keep
>>             all the decision
>>             >> making about skipping HW reset in one place.
>>             >>
>>             >> v3:
>>             >> Fix SW sched. hang after non HW reset.
>>             sched.hw_rq_count has to be balanced
>>             >> against it's decrement in drm_sched_stop in non HW
>>             reset case.
>>             >> v4: rebase
>>             >> v5: Revert v3 as we do it now in sceduler code.
>>             >>
>>             >> Signed-off-by: Andrey Grodzovsky
>>             <andrey.grodzovsky@amd.com>
>>             <mailto:andrey.grodzovsky@amd.com>
>>             >> ---
>>             >> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 143
>>             +++++++++++++++++++----------
>>             >>    1 file changed, 95 insertions(+), 48 deletions(-)
>>             >>
>>             >> diff --git
>>             a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>             b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>             >> index a0e165c..85f8792 100644
>>             >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>             >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>             >> @@ -3334,8 +3334,6 @@ static int
>>             amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>>             >>               if (!ring || !ring->sched.thread)
>>             >>                       continue;
>>             >>
>>             >> - drm_sched_stop(&ring->sched, &job->base);
>>             >> -
>>             >>               /* after all hw jobs are reset, hw fence
>>             is meaningless, so force_completion */
>>             >> amdgpu_fence_driver_force_completion(ring);
>>             >>       }
>>             >> @@ -3343,6 +3341,7 @@ static int
>>             amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>>             >>       if(job)
>>             >> drm_sched_increase_karma(&job->base);
>>             >>
>>             >> +    /* Don't suspend on bare metal if we are not
>>             going to HW reset the ASIC */
>>             >>       if (!amdgpu_sriov_vf(adev)) {
>>             >>
>>             >>               if (!need_full_reset)
>>             >> @@ -3480,37 +3479,21 @@ static int
>>             amdgpu_do_asic_reset(struct amdgpu_hive_info *hive,
>>             >>       return r;
>>             >>    }
>>             >>
>>             >> -static void amdgpu_device_post_asic_reset(struct
>>             amdgpu_device *adev)
>>             >> +static bool amdgpu_device_lock_adev(struct
>>             amdgpu_device *adev, bool trylock)
>>             >>    {
>>             >> -    int i;
>>             >> -
>>             >> -    for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>             >> -            struct amdgpu_ring *ring = adev->rings[i];
>>             >> -
>>             >> -            if (!ring || !ring->sched.thread)
>>             >> -                    continue;
>>             >> -
>>             >> -            if (!adev->asic_reset_res)
>>             >> - drm_sched_resubmit_jobs(&ring->sched);
>>             >> +    if (trylock) {
>>             >> +            if (!mutex_trylock(&adev->lock_reset))
>>             >> +                    return false;
>>             >> +    } else
>>             >> + mutex_lock(&adev->lock_reset);
>>             >>
>>             >> - drm_sched_start(&ring->sched, !adev->asic_reset_res);
>>             >> -    }
>>             >> -
>>             >> -    if (!amdgpu_device_has_dc_support(adev)) {
>>             >> - drm_helper_resume_force_mode(adev->ddev);
>>             >> -    }
>>             >> -
>>             >> -    adev->asic_reset_res = 0;
>>             >> -}
>>             >> -
>>             >> -static void amdgpu_device_lock_adev(struct
>>             amdgpu_device *adev)
>>             >> -{
>>             >> - mutex_lock(&adev->lock_reset);
>>             >> atomic_inc(&adev->gpu_reset_counter);
>>             >>       adev->in_gpu_reset = 1;
>>             >>       /* Block kfd: SRIOV would do it separately */
>>             >>       if (!amdgpu_sriov_vf(adev))
>>             >> amdgpu_amdkfd_pre_reset(adev);
>>             >> +
>>             >> +    return true;
>>             >>    }
>>             >>
>>             >>    static void amdgpu_device_unlock_adev(struct
>>             amdgpu_device *adev)
>>             >> @@ -3538,40 +3521,42 @@ static void
>>             amdgpu_device_unlock_adev(struct amdgpu_device *adev)
>>             >>    int amdgpu_device_gpu_recover(struct amdgpu_device
>>             *adev,
>>             >>                             struct amdgpu_job *job)
>>             >>    {
>>             >> -    int r;
>>             >> +    struct list_head device_list, *device_list_handle
>>             =  NULL;
>>             >> +    bool need_full_reset, job_signaled;
>>             >>       struct amdgpu_hive_info *hive = NULL;
>>             >> -    bool need_full_reset = false;
>>             >>       struct amdgpu_device *tmp_adev = NULL;
>>             >> -    struct list_head device_list, *device_list_handle
>>             =  NULL;
>>             >> +    int i, r = 0;
>>             >>
>>             >> +    need_full_reset = job_signaled = false;
>>             >>       INIT_LIST_HEAD(&device_list);
>>             >>
>>             >>       dev_info(adev->dev, "GPU reset begin!\n");
>>             >>
>>             >> +    hive = amdgpu_get_xgmi_hive(adev, false);
>>             >> +
>>             >>       /*
>>             >> -     * In case of XGMI hive disallow concurrent
>>             resets to be triggered
>>             >> -     * by different nodes. No point also since the
>>             one node already executing
>>             >> -     * reset will also reset all the other nodes in
>>             the hive.
>>             >> +     * Here we trylock to avoid chain of resets
>>             executing from
>>             >> +     * either trigger by jobs on different adevs in
>>             XGMI hive or jobs on
>>             >> +     * different schedulers for same device while
>>             this TO handler is running.
>>             >> +     * We always reset all schedulers for device and
>>             all devices for XGMI
>>             >> +     * hive so that should take care of them too.
>>             >>        */
>>             >> -    hive = amdgpu_get_xgmi_hive(adev, 0);
>>             >> -    if (hive && adev->gmc.xgmi.num_physical_nodes > 1 &&
>>             >> - !mutex_trylock(&hive->reset_lock))
>>             >> +
>>             >> +    if (hive && !mutex_trylock(&hive->reset_lock)) {
>>             >> +            DRM_INFO("Bailing on TDR for s_job:%llx,
>>             hive: %llx as another already in progress",
>>             >> +                     job->base.id, hive->hive_id);
>>             >>               return 0;
>>             >> +    }
>>             >>
>>             >>       /* Start with adev pre asic reset first for soft
>>             reset check.*/
>>             >> -    amdgpu_device_lock_adev(adev);
>>             >> -    r = amdgpu_device_pre_asic_reset(adev,
>>             >> - job,
>>             >> - &need_full_reset);
>>             >> -    if (r) {
>>             >> -            /*TODO Should we stop ?*/
>>             >> -            DRM_ERROR("GPU pre asic reset failed with
>>             err, %d for drm dev, %s ",
>>             >> -                      r, adev->ddev->unique);
>>             >> -            adev->asic_reset_res = r;
>>             >> +    if (!amdgpu_device_lock_adev(adev, !hive)) {
>>             >> +            DRM_INFO("Bailing on TDR for s_job:%llx,
>>             as another already in progress",
>>             >> + job->base.id);
>>             >> +            return 0;
>>             >>       }
>>             >>
>>             >>       /* Build list of devices to reset */
>>             >> -    if  (need_full_reset &&
>>             adev->gmc.xgmi.num_physical_nodes > 1) {
>>             >> +    if (adev->gmc.xgmi.num_physical_nodes > 1) {
>>             >>               if (!hive) {
>>             >> amdgpu_device_unlock_adev(adev);
>>             >>                       return -ENODEV;
>>             >> @@ -3588,13 +3573,56 @@ int
>>             amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>             >>               device_list_handle = &device_list;
>>             >>       }
>>             >>
>>             >> +    /* block all schedulers and reset given job's ring */
>>             >> +    list_for_each_entry(tmp_adev, device_list_handle,
>>             gmc.xgmi.head) {
>>             >> +            for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>             >> +                    struct amdgpu_ring *ring =
>>             tmp_adev->rings[i];
>>             >> +
>>             >> +                    if (!ring || !ring->sched.thread)
>>             >> +                            continue;
>>             >> +
>>             >> + drm_sched_stop(&ring->sched, &job->base);
>>             >> +            }
>>             >> +    }
>>             >> +
>>             >> +
>>             >> +    /*
>>             >> +     * Must check guilty signal here since after this
>>             point all old
>>             >> +     * HW fences are force signaled.
>>             >> +     *
>>             >> +     * job->base holds a reference to parent fence
>>             >> +     */
>>             >> +    if (job && job->base.s_fence->parent &&
>>             >> + dma_fence_is_signaled(job->base.s_fence->parent))
>>             >> +            job_signaled = true;
>>             >> +
>>             >> +    if (!amdgpu_device_ip_need_full_reset(adev))
>>             >> +            device_list_handle = &device_list;
>>             >> +
>>             >> +    if (job_signaled) {
>>             >> +            dev_info(adev->dev, "Guilty job already
>>             signaled, skipping HW reset");
>>             >> +            goto skip_hw_reset;
>>             >> +    }
>>             >> +
>>             >> +
>>             >> +    /* Guilty job will be freed after this*/
>>             >> +    r = amdgpu_device_pre_asic_reset(adev,
>>             >> + job,
>>             >> + &need_full_reset);
>>             >> +    if (r) {
>>             >> +            /*TODO Should we stop ?*/
>>             >> +            DRM_ERROR("GPU pre asic reset failed with
>>             err, %d for drm dev, %s ",
>>             >> +                      r, adev->ddev->unique);
>>             >> +            adev->asic_reset_res = r;
>>             >> +    }
>>             >> +
>>             >>    retry:    /* Rest of adevs pre asic reset from XGMI
>>             hive. */
>>             >>       list_for_each_entry(tmp_adev,
>>             device_list_handle, gmc.xgmi.head) {
>>             >>
>>             >>               if (tmp_adev == adev)
>>             >>                       continue;
>>             >>
>>             >> - amdgpu_device_lock_adev(tmp_adev);
>>             >> + amdgpu_device_lock_adev(tmp_adev, false);
>>             >>               r = amdgpu_device_pre_asic_reset(tmp_adev,
>>             >>                                                NULL,
>>             >> &need_full_reset);
>>             >> @@ -3618,9 +3646,28 @@ int
>>             amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>             >>                       goto retry;
>>             >>       }
>>             >>
>>             >> +skip_hw_reset:
>>             >> +
>>             >>       /* Post ASIC reset for all devs .*/
>>             >>       list_for_each_entry(tmp_adev,
>>             device_list_handle, gmc.xgmi.head) {
>>             >> - amdgpu_device_post_asic_reset(tmp_adev);
>>             >> +            for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>             >> +                    struct amdgpu_ring *ring =
>>             tmp_adev->rings[i];
>>             >> +
>>             >> +                    if (!ring || !ring->sched.thread)
>>             >> +                            continue;
>>             >> +
>>             >> +                    /* No point to resubmit jobs if
>>             we didn't HW reset*/
>>             >> +                    if (!tmp_adev->asic_reset_res &&
>>             !job_signaled)
>>             >> + drm_sched_resubmit_jobs(&ring->sched);
>>             >> +
>>             >> + drm_sched_start(&ring->sched,
>>             !tmp_adev->asic_reset_res);
>>             >> +            }
>>             >> +
>>             >> +            if
>>             (!amdgpu_device_has_dc_support(tmp_adev) && !job_signaled) {
>>             >> + drm_helper_resume_force_mode(tmp_adev->ddev);
>>             >> +            }
>>             >> +
>>             >> +            tmp_adev->asic_reset_res = 0;
>>             >>
>>             >>               if (r) {
>>             >>                       /* bad news, how to tell it to
>>             userspace ? */
>>             >> @@ -3633,7 +3680,7 @@ int
>>             amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>             >> amdgpu_device_unlock_adev(tmp_adev);
>>             >>       }
>>             >>
>>             >> -    if (hive && adev->gmc.xgmi.num_physical_nodes > 1)
>>             >> +    if (hive)
>>             >> mutex_unlock(&hive->reset_lock);
>>             >>
>>             >>       if (r)
>>             _______________________________________________
>>             amd-gfx mailing list
>>             amd-gfx@lists.freedesktop.org
>>             <mailto:amd-gfx@lists.freedesktop.org>
>>             https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--------------66BEF7142C124195686C94BC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">I would clean them up further, but
      that's only moving code around so feel free to add my rb to those.<br>
      <br>
      Christian.<br>
      <br>
      Am 29.04.19 um 16:14 schrieb Grodzovsky, Andrey:<br>
    </div>
    <blockquote type="cite"
      cite="mid:effe0c0d-ef8d-898b-6be9-e3728b14b0af@amd.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Thanks David, with that only patches 5 and 6 are left for the
        series to be reviewed.
        <br>
      </p>
      <p>Christian, any more comments on those patches ?</p>
      <p>Andrey<br>
      </p>
      <div class="moz-cite-prefix">On 4/27/19 10:56 PM, Zhou,
        David(ChunMing) wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:MN2PR12MB2910903F08BF48360A6D5EEFB4380@MN2PR12MB2910.namprd12.prod.outlook.com">
        <meta name="Generator" content="Microsoft Word 15 (filtered
          medium)">
        <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Microsoft YaHei";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@Microsoft YaHei";}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
        <div class="WordSection1">
          <p class="MsoNormal"><span style="color:windowtext">Sorry, I
              only can put my Acked-by: Chunming Zhou
              <a class="moz-txt-link-rfc2396E"
                href="mailto:david1.zhou@amd.com" moz-do-not-send="true">&lt;david1.zhou@amd.com&gt;</a>
              on patch#3.<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext">I cannot
              fully judge patch #4, #5, #6.<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext">-David<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
          <div>
            <div style="border:none;border-top:solid #E1E1E1
              1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b><span style="color:windowtext">From:</span></b><span
                  style="color:windowtext"> amd-gfx
                  <a class="moz-txt-link-rfc2396E"
                    href="mailto:amd-gfx-bounces@lists.freedesktop.org"
                    moz-do-not-send="true">
                    &lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> <b>On
                    Behalf Of </b>Grodzovsky, Andrey<br>
                  <b>Sent:</b> Friday, April 26, 2019 10:09 PM<br>
                  <b>To:</b> Koenig, Christian <a
                    class="moz-txt-link-rfc2396E"
                    href="mailto:Christian.Koenig@amd.com"
                    moz-do-not-send="true">
                    &lt;Christian.Koenig@amd.com&gt;</a>; Zhou,
                  David(ChunMing) <a class="moz-txt-link-rfc2396E"
                    href="mailto:David1.Zhou@amd.com"
                    moz-do-not-send="true">
                    &lt;David1.Zhou@amd.com&gt;</a>; <a
                    class="moz-txt-link-abbreviated"
                    href="mailto:dri-devel@lists.freedesktop.org"
                    moz-do-not-send="true">
                    dri-devel@lists.freedesktop.org</a>; <a
                    class="moz-txt-link-abbreviated"
                    href="mailto:amd-gfx@lists.freedesktop.org"
                    moz-do-not-send="true">
                    amd-gfx@lists.freedesktop.org</a>; <a
                    class="moz-txt-link-abbreviated"
                    href="mailto:eric@anholt.net" moz-do-not-send="true">
                    eric@anholt.net</a>; <a
                    class="moz-txt-link-abbreviated"
                    href="mailto:etnaviv@lists.freedesktop.org"
                    moz-do-not-send="true">
                    etnaviv@lists.freedesktop.org</a><br>
                  <b>Cc:</b> Kazlauskas, Nicholas <a
                    class="moz-txt-link-rfc2396E"
                    href="mailto:Nicholas.Kazlauskas@amd.com"
                    moz-do-not-send="true">
                    &lt;Nicholas.Kazlauskas@amd.com&gt;</a>; Liu, Monk <a
                    class="moz-txt-link-rfc2396E"
                    href="mailto:Monk.Liu@amd.com"
                    moz-do-not-send="true">
                    &lt;Monk.Liu@amd.com&gt;</a><br>
                  <b>Subject:</b> Re: [PATCH v5 6/6] drm/amdgpu: Avoid
                  HW reset if guilty job already signaled.<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p> </o:p></p>
          <p>Ping (mostly David and Monk).<o:p></o:p></p>
          <p>Andrey<o:p></o:p></p>
          <div>
            <p class="MsoNormal">On 4/24/19 3:09 AM, Christian König
              wrote:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <div>
              <p class="MsoNormal">Am 24.04.19 um 05:02 schrieb Zhou,
                David(ChunMing):<o:p></o:p></p>
            </div>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <p class="MsoNormal">&gt;&gt; -           
                drm_sched_stop(&amp;ring-&gt;sched, &amp;job-&gt;base);<br>
                &gt;&gt; -<br>
                &gt;&gt;               /* after all hw jobs are reset,
                hw fence is meaningless, so force_completion */<br>
                &gt;&gt;              
                amdgpu_fence_driver_force_completion(ring);<br>
                &gt;&gt;       }<o:p></o:p></p>
              <p class="MsoNormal"> <o:p></o:p></p>
              <p class="MsoNormal">HW fence are already forced
                completion, then we can just disable irq fence process
                and ignore hw fence signal when we are trying to do GPU
                reset, I think. Otherwise which will make the logic much
                more complex.<o:p></o:p></p>
              <p class="MsoNormal"><span style="color:windowtext">If
                  this situation happens because of long time execution,
                  we can increase timeout of reset detection.</span><o:p></o:p></p>
            </blockquote>
            <p class="MsoNormal"><br>
              You are not thinking widely enough, forcing the hw fence
              to complete can trigger other to start other activity in
              the system.<br>
              <br>
              We first need to stop everything and make sure that we
              don't do any processing any more and then start with our
              reset procedure including forcing all hw fences to
              complete.<br>
              <br>
              Christian.<br>
              <br>
              <br>
              <o:p></o:p></p>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <p class="MsoNormal"><span style="color:windowtext"> </span><o:p></o:p></p>
              <p class="MsoNormal"><span style="color:windowtext">-David</span><o:p></o:p></p>
              <p class="MsoNormal"><span style="color:windowtext"> </span><o:p></o:p></p>
              <div style="border:none;border-left:solid blue
                1.5pt;padding:0in 0in 0in 4.0pt">
                <div>
                  <div style="border:none;border-top:solid #E1E1E1
                    1.0pt;padding:3.0pt 0in 0in 0in">
                    <p class="MsoNormal"><b><span
                          style="color:windowtext">From:</span></b><span
                        style="color:windowtext"> amd-gfx
                        <a
                          href="mailto:amd-gfx-bounces@lists.freedesktop.org"
                          moz-do-not-send="true">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a>
                        <b>On Behalf Of </b>Grodzovsky, Andrey<br>
                        <b>Sent:</b> Wednesday, April 24, 2019 12:00 AM<br>
                        <b>To:</b> Zhou, David(ChunMing) <a
                          href="mailto:David1.Zhou@amd.com"
                          moz-do-not-send="true">
                          &lt;David1.Zhou@amd.com&gt;</a>; <a
                          href="mailto:dri-devel@lists.freedesktop.org"
                          moz-do-not-send="true">
                          dri-devel@lists.freedesktop.org</a>; <a
                          href="mailto:amd-gfx@lists.freedesktop.org"
                          moz-do-not-send="true">
                          amd-gfx@lists.freedesktop.org</a>; <a
                          href="mailto:eric@anholt.net"
                          moz-do-not-send="true">
                          eric@anholt.net</a>; <a
                          href="mailto:etnaviv@lists.freedesktop.org"
                          moz-do-not-send="true">
                          etnaviv@lists.freedesktop.org</a>; <a
                          href="mailto:ckoenig.leichtzumerken@gmail.com"
                          moz-do-not-send="true">
                          ckoenig.leichtzumerken@gmail.com</a><br>
                        <b>Cc:</b> Kazlauskas, Nicholas <a
                          href="mailto:Nicholas.Kazlauskas@amd.com"
                          moz-do-not-send="true">
                          &lt;Nicholas.Kazlauskas@amd.com&gt;</a>; Liu,
                        Monk <a href="mailto:Monk.Liu@amd.com"
                          moz-do-not-send="true">
                          &lt;Monk.Liu@amd.com&gt;</a><br>
                        <b>Subject:</b> Re: [PATCH v5 6/6] drm/amdgpu:
                        Avoid HW reset if guilty job already signaled.</span><o:p></o:p></p>
                  </div>
                </div>
                <p class="MsoNormal"> <o:p></o:p></p>
                <p>No, i mean the actual HW fence which signals when the
                  job finished execution on the HW.<o:p></o:p></p>
                <p>Andrey<o:p></o:p></p>
                <div>
                  <p class="MsoNormal">On 4/23/19 11:19 AM, Zhou,
                    David(ChunMing) wrote:<o:p></o:p></p>
                </div>
                <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                  <div>
                    <p class="MsoNormal" style="margin-bottom:12.0pt">do
                      you mean fence timer? why not stop it as well when
                      stopping sched for the reason of hw reset?<br>
                      <br>
                      -------- Original Message --------<br>
                      Subject: Re: [PATCH v5 6/6] drm/amdgpu: Avoid HW
                      reset if guilty job already signaled.<br>
                      From: "Grodzovsky, Andrey" <br>
                      To: "Zhou, David(ChunMing)" ,<a
href="mailto:dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org,eric@anholt.net,etnaviv@lists.freedesktop.org,ckoenig.leichtzumerken@gmail.com"
                        moz-do-not-send="true">dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org,eric@anholt.net,etnaviv@lists.freedesktop.org,ckoenig.leichtzumerken@gmail.com</a><br>
                      CC: "Kazlauskas, Nicholas" ,"Liu, Monk" <o:p></o:p></p>
                  </div>
                  <div>
                    <p class="MsoNormal"><br>
                      On 4/22/19 9:09 AM, Zhou, David(ChunMing) wrote:<br>
                      &gt; +Monk.<br>
                      &gt;<br>
                      &gt; GPU reset is used widely in SRIOV, so need
                      virtulizatino guy take a look.<br>
                      &gt;<br>
                      &gt; But out of curious, why guilty job can signal
                      more if the job is already<br>
                      &gt; set to guilty? set it wrongly?<br>
                      &gt;<br>
                      &gt;<br>
                      &gt; -David<br>
                      <br>
                      <br>
                      It's possible that the job does completes at a
                      later time then it's <br>
                      timeout handler started processing so in this
                      patch we try to protect <br>
                      against this by rechecking the HW fence after
                      stopping all SW <br>
                      schedulers. We do it BEFORE marking guilty on the
                      job's sched_entity so <br>
                      at the point we check the guilty flag is not set
                      yet.<br>
                      <br>
                      Andrey<br>
                      <br>
                      <br>
                      &gt;<br>
                      &gt; <span style="font-family:&quot;Microsoft
                        YaHei&quot;,sans-serif" lang="ZH-CN">
                        在</span> 2019/4/18 23:00, Andrey Grodzovsky <span
                        style="font-family:&quot;Microsoft
                        YaHei&quot;,sans-serif" lang="ZH-CN">
                        写道</span>:<br>
                      &gt;&gt; Also reject TDRs if another one already
                      running.<br>
                      &gt;&gt;<br>
                      &gt;&gt; v2:<br>
                      &gt;&gt; Stop all schedulers across device and
                      entire XGMI hive before<br>
                      &gt;&gt; force signaling HW fences.<br>
                      &gt;&gt; Avoid passing job_signaled to helper
                      fnctions to keep all the decision<br>
                      &gt;&gt; making about skipping HW reset in one
                      place.<br>
                      &gt;&gt;<br>
                      &gt;&gt; v3:<br>
                      &gt;&gt; Fix SW sched. hang after non HW reset.
                      sched.hw_rq_count has to be balanced<br>
                      &gt;&gt; against it's decrement in drm_sched_stop
                      in non HW reset case.<br>
                      &gt;&gt; v4: rebase<br>
                      &gt;&gt; v5: Revert v3 as we do it now in sceduler
                      code.<br>
                      &gt;&gt;<br>
                      &gt;&gt; Signed-off-by: Andrey Grodzovsky <a
                        href="mailto:andrey.grodzovsky@amd.com"
                        moz-do-not-send="true">
                        &lt;andrey.grodzovsky@amd.com&gt;</a><br>
                      &gt;&gt; ---<br>
                      &gt;&gt;   
                      drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 143
                      +++++++++++++++++++----------<br>
                      &gt;&gt;    1 file changed, 95 insertions(+), 48
                      deletions(-)<br>
                      &gt;&gt;<br>
                      &gt;&gt; diff --git
                      a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
                      b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                      &gt;&gt; index a0e165c..85f8792 100644<br>
                      &gt;&gt; ---
                      a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                      &gt;&gt; +++
                      b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                      &gt;&gt; @@ -3334,8 +3334,6 @@ static int
                      amdgpu_device_pre_asic_reset(struct amdgpu_device
                      *adev,<br>
                      &gt;&gt;               if (!ring ||
                      !ring-&gt;sched.thread)<br>
                      &gt;&gt;                       continue;<br>
                      &gt;&gt;    <br>
                      &gt;&gt; -           
                      drm_sched_stop(&amp;ring-&gt;sched,
                      &amp;job-&gt;base);<br>
                      &gt;&gt; -<br>
                      &gt;&gt;               /* after all hw jobs are
                      reset, hw fence is meaningless, so
                      force_completion */<br>
                      &gt;&gt;              
                      amdgpu_fence_driver_force_completion(ring);<br>
                      &gt;&gt;       }<br>
                      &gt;&gt; @@ -3343,6 +3341,7 @@ static int
                      amdgpu_device_pre_asic_reset(struct amdgpu_device
                      *adev,<br>
                      &gt;&gt;       if(job)<br>
                      &gt;&gt;              
                      drm_sched_increase_karma(&amp;job-&gt;base);<br>
                      &gt;&gt;    <br>
                      &gt;&gt; +    /* Don't suspend on bare metal if we
                      are not going to HW reset the ASIC */<br>
                      &gt;&gt;       if (!amdgpu_sriov_vf(adev)) {<br>
                      &gt;&gt;    <br>
                      &gt;&gt;               if (!need_full_reset)<br>
                      &gt;&gt; @@ -3480,37 +3479,21 @@ static int
                      amdgpu_do_asic_reset(struct amdgpu_hive_info
                      *hive,<br>
                      &gt;&gt;       return r;<br>
                      &gt;&gt;    }<br>
                      &gt;&gt;    <br>
                      &gt;&gt; -static void
                      amdgpu_device_post_asic_reset(struct amdgpu_device
                      *adev)<br>
                      &gt;&gt; +static bool
                      amdgpu_device_lock_adev(struct amdgpu_device
                      *adev, bool trylock)<br>
                      &gt;&gt;    {<br>
                      &gt;&gt; -    int i;<br>
                      &gt;&gt; -<br>
                      &gt;&gt; -    for (i = 0; i &lt; AMDGPU_MAX_RINGS;
                      ++i) {<br>
                      &gt;&gt; -            struct amdgpu_ring *ring =
                      adev-&gt;rings[i];<br>
                      &gt;&gt; -<br>
                      &gt;&gt; -            if (!ring ||
                      !ring-&gt;sched.thread)<br>
                      &gt;&gt; -                    continue;<br>
                      &gt;&gt; -<br>
                      &gt;&gt; -            if
                      (!adev-&gt;asic_reset_res)<br>
                      &gt;&gt; -                   
                      drm_sched_resubmit_jobs(&amp;ring-&gt;sched);<br>
                      &gt;&gt; +    if (trylock) {<br>
                      &gt;&gt; +            if
                      (!mutex_trylock(&amp;adev-&gt;lock_reset))<br>
                      &gt;&gt; +                    return false;<br>
                      &gt;&gt; +    } else<br>
                      &gt;&gt; +           
                      mutex_lock(&amp;adev-&gt;lock_reset);<br>
                      &gt;&gt;    <br>
                      &gt;&gt; -           
                      drm_sched_start(&amp;ring-&gt;sched,
                      !adev-&gt;asic_reset_res);<br>
                      &gt;&gt; -    }<br>
                      &gt;&gt; -<br>
                      &gt;&gt; -    if
                      (!amdgpu_device_has_dc_support(adev)) {<br>
                      &gt;&gt; -           
                      drm_helper_resume_force_mode(adev-&gt;ddev);<br>
                      &gt;&gt; -    }<br>
                      &gt;&gt; -<br>
                      &gt;&gt; -    adev-&gt;asic_reset_res = 0;<br>
                      &gt;&gt; -}<br>
                      &gt;&gt; -<br>
                      &gt;&gt; -static void
                      amdgpu_device_lock_adev(struct amdgpu_device
                      *adev)<br>
                      &gt;&gt; -{<br>
                      &gt;&gt; -   
                      mutex_lock(&amp;adev-&gt;lock_reset);<br>
                      &gt;&gt;      
                      atomic_inc(&amp;adev-&gt;gpu_reset_counter);<br>
                      &gt;&gt;       adev-&gt;in_gpu_reset = 1;<br>
                      &gt;&gt;       /* Block kfd: SRIOV would do it
                      separately */<br>
                      &gt;&gt;       if (!amdgpu_sriov_vf(adev))<br>
                      &gt;&gt;                   
                      amdgpu_amdkfd_pre_reset(adev);<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +    return true;<br>
                      &gt;&gt;    }<br>
                      &gt;&gt;    <br>
                      &gt;&gt;    static void
                      amdgpu_device_unlock_adev(struct amdgpu_device
                      *adev)<br>
                      &gt;&gt; @@ -3538,40 +3521,42 @@ static void
                      amdgpu_device_unlock_adev(struct amdgpu_device
                      *adev)<br>
                      &gt;&gt;    int amdgpu_device_gpu_recover(struct
                      amdgpu_device *adev,<br>
                      &gt;&gt;                             struct
                      amdgpu_job *job)<br>
                      &gt;&gt;    {<br>
                      &gt;&gt; -    int r;<br>
                      &gt;&gt; +    struct list_head device_list,
                      *device_list_handle =  NULL;<br>
                      &gt;&gt; +    bool need_full_reset, job_signaled;<br>
                      &gt;&gt;       struct amdgpu_hive_info *hive =
                      NULL;<br>
                      &gt;&gt; -    bool need_full_reset = false;<br>
                      &gt;&gt;       struct amdgpu_device *tmp_adev =
                      NULL;<br>
                      &gt;&gt; -    struct list_head device_list,
                      *device_list_handle =  NULL;<br>
                      &gt;&gt; +    int i, r = 0;<br>
                      &gt;&gt;    <br>
                      &gt;&gt; +    need_full_reset = job_signaled =
                      false;<br>
                      &gt;&gt;       INIT_LIST_HEAD(&amp;device_list);<br>
                      &gt;&gt;    <br>
                      &gt;&gt;       dev_info(adev-&gt;dev, "GPU reset
                      begin!\n");<br>
                      &gt;&gt;    <br>
                      &gt;&gt; +    hive = amdgpu_get_xgmi_hive(adev,
                      false);<br>
                      &gt;&gt; +<br>
                      &gt;&gt;       /*<br>
                      &gt;&gt; -     * In case of XGMI hive disallow
                      concurrent resets to be triggered<br>
                      &gt;&gt; -     * by different nodes. No point also
                      since the one node already executing<br>
                      &gt;&gt; -     * reset will also reset all the
                      other nodes in the hive.<br>
                      &gt;&gt; +     * Here we trylock to avoid chain of
                      resets executing from<br>
                      &gt;&gt; +     * either trigger by jobs on
                      different adevs in XGMI hive or jobs on<br>
                      &gt;&gt; +     * different schedulers for same
                      device while this TO handler is running.<br>
                      &gt;&gt; +     * We always reset all schedulers
                      for device and all devices for XGMI<br>
                      &gt;&gt; +     * hive so that should take care of
                      them too.<br>
                      &gt;&gt;        */<br>
                      &gt;&gt; -    hive = amdgpu_get_xgmi_hive(adev,
                      0);<br>
                      &gt;&gt; -    if (hive &amp;&amp;
                      adev-&gt;gmc.xgmi.num_physical_nodes &gt; 1
                      &amp;&amp;<br>
                      &gt;&gt; -       
                      !mutex_trylock(&amp;hive-&gt;reset_lock))<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +    if (hive &amp;&amp;
                      !mutex_trylock(&amp;hive-&gt;reset_lock)) {<br>
                      &gt;&gt; +            DRM_INFO("Bailing on TDR for
                      s_job:%llx, hive: %llx as another already in
                      progress",<br>
                      &gt;&gt; +                     job-&gt;base.id,
                      hive-&gt;hive_id);<br>
                      &gt;&gt;               return 0;<br>
                      &gt;&gt; +    }<br>
                      &gt;&gt;    <br>
                      &gt;&gt;       /* Start with adev pre asic reset
                      first for soft reset check.*/<br>
                      &gt;&gt; -    amdgpu_device_lock_adev(adev);<br>
                      &gt;&gt; -    r =
                      amdgpu_device_pre_asic_reset(adev,<br>
                      &gt;&gt; -                                    
                      job,<br>
                      &gt;&gt; -                                    
                      &amp;need_full_reset);<br>
                      &gt;&gt; -    if (r) {<br>
                      &gt;&gt; -            /*TODO Should we stop ?*/<br>
                      &gt;&gt; -            DRM_ERROR("GPU pre asic
                      reset failed with err, %d for drm dev, %s ",<br>
                      &gt;&gt; -                      r,
                      adev-&gt;ddev-&gt;unique);<br>
                      &gt;&gt; -            adev-&gt;asic_reset_res = r;<br>
                      &gt;&gt; +    if (!amdgpu_device_lock_adev(adev,
                      !hive)) {<br>
                      &gt;&gt; +            DRM_INFO("Bailing on TDR for
                      s_job:%llx, as another already in progress",<br>
                      &gt;&gt; +                                    
                      job-&gt;base.id);<br>
                      &gt;&gt; +            return 0;<br>
                      &gt;&gt;       }<br>
                      &gt;&gt;    <br>
                      &gt;&gt;       /* Build list of devices to reset
                      */<br>
                      &gt;&gt; -    if  (need_full_reset &amp;&amp;
                      adev-&gt;gmc.xgmi.num_physical_nodes &gt; 1) {<br>
                      &gt;&gt; +    if 
                      (adev-&gt;gmc.xgmi.num_physical_nodes &gt; 1) {<br>
                      &gt;&gt;               if (!hive) {<br>
                      &gt;&gt;                      
                      amdgpu_device_unlock_adev(adev);<br>
                      &gt;&gt;                       return -ENODEV;<br>
                      &gt;&gt; @@ -3588,13 +3573,56 @@ int
                      amdgpu_device_gpu_recover(struct amdgpu_device
                      *adev,<br>
                      &gt;&gt;               device_list_handle =
                      &amp;device_list;<br>
                      &gt;&gt;       }<br>
                      &gt;&gt;    <br>
                      &gt;&gt; +    /* block all schedulers and reset
                      given job's ring */<br>
                      &gt;&gt; +    list_for_each_entry(tmp_adev,
                      device_list_handle, gmc.xgmi.head) {<br>
                      &gt;&gt; +            for (i = 0; i &lt;
                      AMDGPU_MAX_RINGS; ++i) {<br>
                      &gt;&gt; +                    struct amdgpu_ring
                      *ring = tmp_adev-&gt;rings[i];<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +                    if (!ring ||
                      !ring-&gt;sched.thread)<br>
                      &gt;&gt; +                            continue;<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +                   
                      drm_sched_stop(&amp;ring-&gt;sched,
                      &amp;job-&gt;base);<br>
                      &gt;&gt; +            }<br>
                      &gt;&gt; +    }<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +    /*<br>
                      &gt;&gt; +     * Must check guilty signal here
                      since after this point all old<br>
                      &gt;&gt; +     * HW fences are force signaled.<br>
                      &gt;&gt; +     *<br>
                      &gt;&gt; +     * job-&gt;base holds a reference to
                      parent fence<br>
                      &gt;&gt; +     */<br>
                      &gt;&gt; +    if (job &amp;&amp;
                      job-&gt;base.s_fence-&gt;parent &amp;&amp;<br>
                      &gt;&gt; +       
                      dma_fence_is_signaled(job-&gt;base.s_fence-&gt;parent))<br>
                      &gt;&gt; +            job_signaled = true;<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +    if
                      (!amdgpu_device_ip_need_full_reset(adev))<br>
                      &gt;&gt; +            device_list_handle =
                      &amp;device_list;<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +    if (job_signaled) {<br>
                      &gt;&gt; +            dev_info(adev-&gt;dev,
                      "Guilty job already signaled, skipping HW reset");<br>
                      &gt;&gt; +            goto skip_hw_reset;<br>
                      &gt;&gt; +    }<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +    /* Guilty job will be freed after
                      this*/<br>
                      &gt;&gt; +    r =
                      amdgpu_device_pre_asic_reset(adev,<br>
                      &gt;&gt; +                                    
                      job,<br>
                      &gt;&gt; +                                    
                      &amp;need_full_reset);<br>
                      &gt;&gt; +    if (r) {<br>
                      &gt;&gt; +            /*TODO Should we stop ?*/<br>
                      &gt;&gt; +            DRM_ERROR("GPU pre asic
                      reset failed with err, %d for drm dev, %s ",<br>
                      &gt;&gt; +                      r,
                      adev-&gt;ddev-&gt;unique);<br>
                      &gt;&gt; +            adev-&gt;asic_reset_res = r;<br>
                      &gt;&gt; +    }<br>
                      &gt;&gt; +<br>
                      &gt;&gt;    retry:    /* Rest of adevs pre asic
                      reset from XGMI hive. */<br>
                      &gt;&gt;       list_for_each_entry(tmp_adev,
                      device_list_handle, gmc.xgmi.head) {<br>
                      &gt;&gt;    <br>
                      &gt;&gt;               if (tmp_adev == adev)<br>
                      &gt;&gt;                       continue;<br>
                      &gt;&gt;    <br>
                      &gt;&gt; -           
                      amdgpu_device_lock_adev(tmp_adev);<br>
                      &gt;&gt; +           
                      amdgpu_device_lock_adev(tmp_adev, false);<br>
                      &gt;&gt;               r =
                      amdgpu_device_pre_asic_reset(tmp_adev,<br>
&gt;&gt;                                                NULL,<br>
&gt;&gt;                                               
                      &amp;need_full_reset);<br>
                      &gt;&gt; @@ -3618,9 +3646,28 @@ int
                      amdgpu_device_gpu_recover(struct amdgpu_device
                      *adev,<br>
                      &gt;&gt;                       goto retry;<br>
                      &gt;&gt;       }<br>
                      &gt;&gt;    <br>
                      &gt;&gt; +skip_hw_reset:<br>
                      &gt;&gt; +<br>
                      &gt;&gt;       /* Post ASIC reset for all devs .*/<br>
                      &gt;&gt;       list_for_each_entry(tmp_adev,
                      device_list_handle, gmc.xgmi.head) {<br>
                      &gt;&gt; -           
                      amdgpu_device_post_asic_reset(tmp_adev);<br>
                      &gt;&gt; +            for (i = 0; i &lt;
                      AMDGPU_MAX_RINGS; ++i) {<br>
                      &gt;&gt; +                    struct amdgpu_ring
                      *ring = tmp_adev-&gt;rings[i];<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +                    if (!ring ||
                      !ring-&gt;sched.thread)<br>
                      &gt;&gt; +                            continue;<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +                    /* No point to
                      resubmit jobs if we didn't HW reset*/<br>
                      &gt;&gt; +                    if
                      (!tmp_adev-&gt;asic_reset_res &amp;&amp;
                      !job_signaled)<br>
                      &gt;&gt; +                           
                      drm_sched_resubmit_jobs(&amp;ring-&gt;sched);<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +                   
                      drm_sched_start(&amp;ring-&gt;sched,
                      !tmp_adev-&gt;asic_reset_res);<br>
                      &gt;&gt; +            }<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +            if
                      (!amdgpu_device_has_dc_support(tmp_adev)
                      &amp;&amp; !job_signaled) {<br>
                      &gt;&gt; +                   
                      drm_helper_resume_force_mode(tmp_adev-&gt;ddev);<br>
                      &gt;&gt; +            }<br>
                      &gt;&gt; +<br>
                      &gt;&gt; +            tmp_adev-&gt;asic_reset_res
                      = 0;<br>
                      &gt;&gt;    <br>
                      &gt;&gt;               if (r) {<br>
                      &gt;&gt;                       /* bad news, how to
                      tell it to userspace ? */<br>
                      &gt;&gt; @@ -3633,7 +3680,7 @@ int
                      amdgpu_device_gpu_recover(struct amdgpu_device
                      *adev,<br>
                      &gt;&gt;              
                      amdgpu_device_unlock_adev(tmp_adev);<br>
                      &gt;&gt;       }<br>
                      &gt;&gt;    <br>
                      &gt;&gt; -    if (hive &amp;&amp;
                      adev-&gt;gmc.xgmi.num_physical_nodes &gt; 1)<br>
                      &gt;&gt; +    if (hive)<br>
                      &gt;&gt;              
                      mutex_unlock(&amp;hive-&gt;reset_lock);<br>
                      &gt;&gt;    <br>
                      &gt;&gt;       if (r)<br>
                      _______________________________________________<br>
                      amd-gfx mailing list<br>
                      <a href="mailto:amd-gfx@lists.freedesktop.org"
                        moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                      <a
                        href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx"
                        moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
                  </div>
                </blockquote>
              </div>
            </blockquote>
            <p class="MsoNormal"><o:p> </o:p></p>
          </blockquote>
        </div>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------66BEF7142C124195686C94BC--

--===============0581085446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0581085446==--
