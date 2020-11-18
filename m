Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24F2B7D2A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 13:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C106E3DB;
	Wed, 18 Nov 2020 12:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723376E3DB;
 Wed, 18 Nov 2020 12:01:20 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id ay21so1722493edb.2;
 Wed, 18 Nov 2020 04:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1kY678/TlSt+JHbm0PDgPhjC5j2m6T9yJ6fohIj8IJQ=;
 b=WeOdbs4w1nVZxM9UVgpzapBut+MVvPL3n9IoZdEU54RB78zYfMc5rfcI8xSgnCK54H
 SFMPP9GokpMGZCsq1DoFLf3bn+zgZrV9KrVnI4YuXDg83KRpelDZ4oQszT1owx8M5PMW
 7/7HcG/XMv8du4uGHhY4gXPBB90HvTr0eFwaxkxAwdcSuEhxXzNXJ36GZ7uaoBHY4y1r
 q+qShaeZ5WHki/EPTPWx0CazRq/rv8u9WnntRRc3Op5JCMbC9Rbe3k6vwEsVWqyIGi3A
 ZGxU7b2hLRYHwCllKl2K7a1eSLqL2Y022bxLwa+FYh/gvflGcBgKUIPNyvjrPFdzNK0b
 pLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=1kY678/TlSt+JHbm0PDgPhjC5j2m6T9yJ6fohIj8IJQ=;
 b=Z7H724If7p1dcnqytqQENI2gSwsYwyJODR70zOLxflzWJoHxTqyzX5FxwHtuE7M6/H
 iUGcrRTILjwbcMgTRFPVN0ivLZ4Fa+q78T9BCyd5xcROgneS6FUcrGIISUDynE0J1mZd
 ZtcK/2SE0V3gLpxArUyISkdhuswmfCzwTGiAA5V2UxEff8BTXA0NGDCpHh9HKmx5L/o+
 ygxySyCv8zQph7snC/+/ubTXBhgaK2/VzSUzGyqm1DwvedlRB0+rEmyXZlONIjuzK8VZ
 kEzebjE04arRNryyM/YgXvMs3LTnU2ok943MesKhXyxTloWw4dP53txFQ4zoV1eyo+vg
 7IVw==
X-Gm-Message-State: AOAM53103sBQM78IFmevT7S/35sbsCHesZr86z9J7ZsZl5xbNck19VtT
 hcKdmKriQjaCBgmZKju2ua4=
X-Google-Smtp-Source: ABdhPJyYLVPZFn913p3nMyQz3blndzxsqE7mTRawQ4pw9fQv+u5pkfMC9Xlxn4l02N/YSXY9FM06GA==
X-Received: by 2002:a05:6402:21a:: with SMTP id
 t26mr8210370edv.173.1605700879084; 
 Wed, 18 Nov 2020 04:01:19 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c8sm13445667edr.29.2020.11.18.04.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 04:01:18 -0800 (PST)
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
To: Daniel Vetter <daniel@ffwll.ch>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095345.GF20149@phenom.ffwll.local>
 <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
 <20201117185255.GP401619@phenom.ffwll.local>
 <b827fa7a-d89e-d138-d275-60a9f15c128a@amd.com>
 <20201117194922.GW401619@phenom.ffwll.local>
 <064ef461-8f59-2eb8-7777-6ff5b8d28cdd@amd.com>
 <CAKMK7uF9uvT09zDb6fS0j68fWrq2qV7h_JQAt8vpaGPJ1d64cQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d0a3ee49-64f3-a223-7e84-0c8eb3481f61@gmail.com>
Date: Wed, 18 Nov 2020 13:01:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uF9uvT09zDb6fS0j68fWrq2qV7h_JQAt8vpaGPJ1d64cQ@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.11.20 um 08:39 schrieb Daniel Vetter:
> On Tue, Nov 17, 2020 at 9:07 PM Andrey Grodzovsky
> <Andrey.Grodzovsky@amd.com> wrote:
>>
>> On 11/17/20 2:49 PM, Daniel Vetter wrote:
>>> On Tue, Nov 17, 2020 at 02:18:49PM -0500, Andrey Grodzovsky wrote:
>>>> On 11/17/20 1:52 PM, Daniel Vetter wrote:
>>>>> On Tue, Nov 17, 2020 at 01:38:14PM -0500, Andrey Grodzovsky wrote:
>>>>>> On 6/22/20 5:53 AM, Daniel Vetter wrote:
>>>>>>> On Sun, Jun 21, 2020 at 02:03:08AM -0400, Andrey Grodzovsky wrote:
>>>>>>>> No point to try recovery if device is gone, just messes up things.
>>>>>>>>
>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 16 ++++++++++++++++
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  8 ++++++++
>>>>>>>>      2 files changed, 24 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>> index 6932d75..5d6d3d9 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>> @@ -1129,12 +1129,28 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>>>>>>>           return ret;
>>>>>>>>      }
>>>>>>>> +static void amdgpu_cancel_all_tdr(struct amdgpu_device *adev)
>>>>>>>> +{
>>>>>>>> +        int i;
>>>>>>>> +
>>>>>>>> +        for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>>>>>>> +                struct amdgpu_ring *ring = adev->rings[i];
>>>>>>>> +
>>>>>>>> +                if (!ring || !ring->sched.thread)
>>>>>>>> +                        continue;
>>>>>>>> +
>>>>>>>> +                cancel_delayed_work_sync(&ring->sched.work_tdr);
>>>>>>>> +        }
>>>>>>>> +}
>>>>>>> I think this is a function that's supposed to be in drm/scheduler, not
>>>>>>> here. Might also just be your cleanup code being ordered wrongly, or your
>>>>>>> split in one of the earlier patches not done quite right.
>>>>>>> -Daniel
>>>>>> This function iterates across all the schedulers  per amdgpu device and accesses
>>>>>> amdgpu specific structures , drm/scheduler deals with single scheduler at most
>>>>>> so looks to me like this is the right place for this function
>>>>> I guess we could keep track of all schedulers somewhere in a list in
>>>>> struct drm_device and wrap this up. That was kinda the idea.
>>>>>
>>>>> Minimally I think a tiny wrapper with docs for the
>>>>> cancel_delayed_work_sync(&sched->work_tdr); which explains what you must
>>>>> observe to make sure there's no race.
>>>> Will do
>>>>
>>>>
>>>>> I'm not exactly sure there's no
>>>>> guarantee here we won't get a new tdr work launched right afterwards at
>>>>> least, so this looks a bit like a hack.
>>>> Note that for any TDR work happening post amdgpu_cancel_all_tdr
>>>> amdgpu_job_timedout->drm_dev_is_unplugged
>>>> will return true and so it will return early. To make it water proof tight
>>>> against race
>>>> i can switch from drm_dev_is_unplugged to drm_dev_enter/exit
>>> Hm that's confusing. You do a work_cancel_sync, so that at least looks
>>> like "tdr work must not run after this point"
>>>
>>> If you only rely on drm_dev_enter/exit check with the tdr work, then
>>> there's no need to cancel anything.
>>
>> Agree, synchronize_srcu from drm_dev_unplug should play the role
>> of 'flushing' any earlier (in progress) tdr work which is
>> using drm_dev_enter/exit pair. Any later arising tdr will terminate early when
>> drm_dev_enter
>> returns false.
> Nope, anything you put into the work itself cannot close this race.
> It's the schedule_work that matters here. Or I'm missing something ...
> I thought that the tdr work you're cancelling here is launched by
> drm/scheduler code, not by the amd callback?

Yes that is correct. Canceling the work item is not the right approach 
at all, nor is adding dev_enter/exit pair in the recovery handler.

What we need to do here is to stop the scheduler thread and then wait 
for any timeout handling to have finished.

Otherwise it can scheduler a new timeout just after we have canceled 
this one.

Regards,
Christian.

> -Daniel
>
>> Will update.
>>
>> Andrey
>>
>>
>>> For race free cancel_work_sync you need:
>>> 1. make sure whatever is calling schedule_work is guaranteed to no longer
>>> call schedule_work.
>>> 2. call cancel_work_sync
>>>
>>> Anything else is cargo-culted work cleanup:
>>>
>>> - 1. without 2. means if a work got scheduled right before it'll still be
>>>     a problem.
>>> - 2. without 1. means a schedule_work right after makes you calling
>>>     cancel_work_sync pointless.
>>>
>>> So either both or nothing.
>>> -Daniel
>>>
>>>> Andrey
>>>>
>>>>
>>>>> -Daniel
>>>>>
>>>>>> Andrey
>>>>>>
>>>>>>
>>>>>>>> +
>>>>>>>>      static void
>>>>>>>>      amdgpu_pci_remove(struct pci_dev *pdev)
>>>>>>>>      {
>>>>>>>>           struct drm_device *dev = pci_get_drvdata(pdev);
>>>>>>>> +        struct amdgpu_device *adev = dev->dev_private;
>>>>>>>>           drm_dev_unplug(dev);
>>>>>>>> +        amdgpu_cancel_all_tdr(adev);
>>>>>>>>           ttm_bo_unmap_virtual_address_space(&adev->mman.bdev);
>>>>>>>>           amdgpu_driver_unload_kms(dev);
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>> index 4720718..87ff0c0 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>>> @@ -28,6 +28,8 @@
>>>>>>>>      #include "amdgpu.h"
>>>>>>>>      #include "amdgpu_trace.h"
>>>>>>>> +#include <drm/drm_drv.h>
>>>>>>>> +
>>>>>>>>      static void amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>>>>>>      {
>>>>>>>>           struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>>>>>>>> @@ -37,6 +39,12 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>>>>>>           memset(&ti, 0, sizeof(struct amdgpu_task_info));
>>>>>>>> +        if (drm_dev_is_unplugged(adev->ddev)) {
>>>>>>>> +                DRM_INFO("ring %s timeout, but device unplugged, skipping.\n",
>>>>>>>> +                                          s_job->sched->name);
>>>>>>>> +                return;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>>           if (amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
>>>>>>>>                   DRM_ERROR("ring %s timeout, but soft recovered\n",
>>>>>>>>                             s_job->sched->name);
>>>>>>>> --
>>>>>>>> 2.7.4
>>>>>>>>
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
