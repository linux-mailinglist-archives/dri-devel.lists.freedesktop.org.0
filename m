Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91176FF37
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 13:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD24B10E6DB;
	Fri,  4 Aug 2023 11:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDF110E6DA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 11:08:23 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RHNHV50VmzDqNf;
 Fri,  4 Aug 2023 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691147302; bh=mCrEwI3VbgKMFxuHKlg0Mrs1TXyLI6itQBMaxl5dGJI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PME4S0lcZmW6RzzJ6FFHj21y0Sfy3LF2BAoEfQxW/C4W7Pr4xiIYzuLJgfAEJeSgM
 VdzIxo8ffOQdlYBAtfHJhuk0/EgmOrxfM62rNGp7eks5AlsUPRLaHDe4pRaEu+uUhk
 hTamHCrxx93E8awkby4xw9h2W08m35sO9tWm8i8E=
X-Riseup-User-ID: 3B701ABD6ADA29F917ED620DA316F4FF55E1515BCDEE007AFFF9DEE6E39DDCAE
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RHNHS21t9zFs3V;
 Fri,  4 Aug 2023 11:08:20 +0000 (UTC)
Message-ID: <24864732-dd34-a391-f5c3-27783765794d@riseup.net>
Date: Fri, 4 Aug 2023 08:08:17 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/vkms: avoid race-condition between flushing and
 destroying
To: Sebastian Wick <sebastian.wick@redhat.com>
References: <20230729225008.30455-1-mairacanal@riseup.net>
 <CA+hFU4xQnFM+JPkjOd=H2yOV1hzCntLGBH2Bh15dXjF2X4axJQ@mail.gmail.com>
Content-Language: en-US
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <CA+hFU4xQnFM+JPkjOd=H2yOV1hzCntLGBH2Bh15dXjF2X4axJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/3/23 17:52, Sebastian Wick wrote:
> On Sun, Jul 30, 2023 at 12:51 AM Maíra Canal <mairacanal@riseup.net> wrote:
>>
>> After we flush the workqueue at the commit tale, we need to make sure
>> that no work is queued until we destroy the state. Currently, new work
>> can be queued in the workqueue, even after the commit tale, as the
>> vblank thread is still running.
>>
>> Therefore, to avoid a race-condition that will lead to the trigger of a
>> WARN_ON() at the function vkms_atomic_crtc_destroy_state(), add a mutex
>> to protect the sections where the queue is manipulated.
>>
>> This way we can make sure that no work will be added to the workqueue
>> between flushing the queue (at the commit tail) and destroying the
>> state.
>>
>> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
>> ---
>>   drivers/gpu/drm/vkms/vkms_crtc.c | 10 +++++++++-
>>   drivers/gpu/drm/vkms/vkms_drv.c  |  1 +
>>   drivers/gpu/drm/vkms/vkms_drv.h  |  8 ++++++++
>>   3 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
>> index 3c5ebf106b66..e5ec21a0da05 100644
>> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
>> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
>> @@ -49,7 +49,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>>                  state->crc_pending = true;
>>                  spin_unlock(&output->composer_lock);
>>
>> +               mutex_lock(&state->queue_lock);
>>                  ret = queue_work(output->composer_workq, &state->composer_work);
>> +               mutex_unlock(&state->queue_lock);
>>                  if (!ret)
>>                          DRM_DEBUG_DRIVER("Composer worker already queued\n");
>>          }
>> @@ -129,6 +131,7 @@ vkms_atomic_crtc_duplicate_state(struct drm_crtc *crtc)
>>
>>          __drm_atomic_helper_crtc_duplicate_state(crtc, &vkms_state->base);
>>
>> +       mutex_init(&vkms_state->queue_lock);
>>          INIT_WORK(&vkms_state->composer_work, vkms_composer_worker);
>>
>>          return &vkms_state->base;
>> @@ -142,6 +145,9 @@ static void vkms_atomic_crtc_destroy_state(struct drm_crtc *crtc,
>>          __drm_atomic_helper_crtc_destroy_state(state);
>>
>>          WARN_ON(work_pending(&vkms_state->composer_work));
>> +       mutex_unlock(&vkms_state->queue_lock);
>> +
>> +       mutex_destroy(&vkms_state->queue_lock);
>>          kfree(vkms_state->active_planes);
>>          kfree(vkms_state);
>>   }
>> @@ -155,8 +161,10 @@ static void vkms_atomic_crtc_reset(struct drm_crtc *crtc)
>>                  vkms_atomic_crtc_destroy_state(crtc, crtc->state);
>>
>>          __drm_atomic_helper_crtc_reset(crtc, &vkms_state->base);
>> -       if (vkms_state)
>> +       if (vkms_state) {
>> +               mutex_init(&vkms_state->queue_lock);
>>                  INIT_WORK(&vkms_state->composer_work, vkms_composer_worker);
>> +       }
>>   }
>>
>>   static const struct drm_crtc_funcs vkms_crtc_funcs = {
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
>> index dd0af086e7fa..9212686ca88a 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>> @@ -84,6 +84,7 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>>                  struct vkms_crtc_state *vkms_state =
>>                          to_vkms_crtc_state(old_crtc_state);
>>
>> +               mutex_lock(&vkms_state->queue_lock);
> 
> I haven't looked at the code in detail but doesn't this need to be
> unlocked after flush_work again?

The idea is to hold the lock until we have destroyed the CRTC state.
This way we can make sure that no job was queued between flushing
and destroying the state. So, this lock is unlocked at
vkms_atomic_crtc_destroy_state().

Best Regards,
- Maíra

> 
>>                  flush_work(&vkms_state->composer_work);
>>          }
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index c7ae6c2ba1df..83767692469a 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -89,6 +89,14 @@ struct vkms_crtc_state {
>>          struct vkms_writeback_job *active_writeback;
>>          struct vkms_color_lut gamma_lut;
>>
>> +       /* protects the access to the workqueue
>> +        *
>> +        * we need to hold this lock between flushing the workqueue and
>> +        * destroying the state to avoid work to be queued by the worker
>> +        * thread
>> +        */
>> +       struct mutex queue_lock;
>> +
>>          /* below four are protected by vkms_output.composer_lock */
>>          bool crc_pending;
>>          bool wb_pending;
>> --
>> 2.41.0
>>
> 
