Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568329BD56D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C470610E422;
	Tue,  5 Nov 2024 18:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="FMc3lHWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA9F10E422
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:53:34 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4XjctQ07rNz9tdc;
 Tue,  5 Nov 2024 18:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1730832814; bh=6ljX9U/oCIrj6sN6rt3396uJD5R9MIyLGfVfs4qKv8s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FMc3lHWZ+VHOAe7dgv2EffQg4T8Bb2t7xatE+57r7GAPEPMst0RUCzPmHq5hZcZFi
 AUco+FNn1NSm+2BdO9Ossw7vTKI9rCMshHLSd3KcjXYb5qIbfVkjoJedS6KuBD7MTC
 mHpvEeL0DObDCNROGUiLlq7/E5MiNYb2n+cozoEg=
X-Riseup-User-ID: 953CBDCB8C950B9BB1BC602DE866E04B27B7D58F7349F4488D9CF49322AFFFDC
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XjctM5mjLzFtkM;
 Tue,  5 Nov 2024 18:53:31 +0000 (UTC)
Message-ID: <b71c0324-ece6-4bee-9e64-561185fb1e21@riseup.net>
Date: Tue, 5 Nov 2024 15:53:29 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/vkms: avoid race-condition between flushing and
 destroying
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230729225008.30455-1-mairacanal@riseup.net>
 <Zyok0NQpido1Wqya@louis-chauvet-laptop>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <Zyok0NQpido1Wqya@louis-chauvet-laptop>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Louis,

On 05/11/24 10:59, Louis Chauvet wrote:
> On 29/07/23 - 19:49, Maíra Canal wrote:
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
> 
> Hi Maìra,
> 
> Thanks for pointing to this patch, it does not apply on drm-misc-next, but
> it was simple to manually rebase (see [0]).
> 
> I think it should solve the issue, and the CI seems to agree.
> 
> But it seems to be imperfect, as it introduce a warning on mutex unlock
> imbalance [1] (not always reproducable). It is better than a kernel crash
> already.
> 

Yeah, I think it needs improvement indeed. Usually, unbalanced mutexes
aren't a good idea.

> Do you want/have time to continue this fix?

I don't plan to keep working in the patch. Feel free to pick the idea
and implement a proper fix.

Best Regards,
- Maíra

> 
> [0]:https://gitlab.freedesktop.org/louischauvet/kernel/-/commit/017210f48c809730296d1f562e615b666fdbcfdc
> [1]:https://gitlab.freedesktop.org/louischauvet/kernel/-/jobs/66118565/viewer#L803
> 
> Thanks,
> Louis Chauvet
> 
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
>>   		state->crc_pending = true;
>>   		spin_unlock(&output->composer_lock);
>>
>> +		mutex_lock(&state->queue_lock);
>>   		ret = queue_work(output->composer_workq, &state->composer_work);
>> +		mutex_unlock(&state->queue_lock);
>>   		if (!ret)
>>   			DRM_DEBUG_DRIVER("Composer worker already queued\n");
>>   	}
>> @@ -129,6 +131,7 @@ vkms_atomic_crtc_duplicate_state(struct drm_crtc *crtc)
>>
>>   	__drm_atomic_helper_crtc_duplicate_state(crtc, &vkms_state->base);
>>
>> +	mutex_init(&vkms_state->queue_lock);
>>   	INIT_WORK(&vkms_state->composer_work, vkms_composer_worker);
>>
>>   	return &vkms_state->base;
>> @@ -142,6 +145,9 @@ static void vkms_atomic_crtc_destroy_state(struct drm_crtc *crtc,
>>   	__drm_atomic_helper_crtc_destroy_state(state);
>>
>>   	WARN_ON(work_pending(&vkms_state->composer_work));
>> +	mutex_unlock(&vkms_state->queue_lock);
>> +
>> +	mutex_destroy(&vkms_state->queue_lock);
>>   	kfree(vkms_state->active_planes);
>>   	kfree(vkms_state);
>>   }
>> @@ -155,8 +161,10 @@ static void vkms_atomic_crtc_reset(struct drm_crtc *crtc)
>>   		vkms_atomic_crtc_destroy_state(crtc, crtc->state);
>>
>>   	__drm_atomic_helper_crtc_reset(crtc, &vkms_state->base);
>> -	if (vkms_state)
>> +	if (vkms_state) {
>> +		mutex_init(&vkms_state->queue_lock);
>>   		INIT_WORK(&vkms_state->composer_work, vkms_composer_worker);
>> +	}
>>   }
>>
>>   static const struct drm_crtc_funcs vkms_crtc_funcs = {
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
>> index dd0af086e7fa..9212686ca88a 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>> @@ -84,6 +84,7 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>>   		struct vkms_crtc_state *vkms_state =
>>   			to_vkms_crtc_state(old_crtc_state);
>>
>> +		mutex_lock(&vkms_state->queue_lock);
>>   		flush_work(&vkms_state->composer_work);
>>   	}
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index c7ae6c2ba1df..83767692469a 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -89,6 +89,14 @@ struct vkms_crtc_state {
>>   	struct vkms_writeback_job *active_writeback;
>>   	struct vkms_color_lut gamma_lut;
>>
>> +	/* protects the access to the workqueue
>> +	 *
>> +	 * we need to hold this lock between flushing the workqueue and
>> +	 * destroying the state to avoid work to be queued by the worker
>> +	 * thread
>> +	 */
>> +	struct mutex queue_lock;
>> +
>>   	/* below four are protected by vkms_output.composer_lock */
>>   	bool crc_pending;
>>   	bool wb_pending;
>> --
>> 2.41.0
>>

