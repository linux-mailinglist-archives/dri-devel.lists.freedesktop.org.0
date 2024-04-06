Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8989AC96
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 19:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3210510F317;
	Sat,  6 Apr 2024 17:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 466 seconds by postgrey-1.36 at gabe;
 Sat, 06 Apr 2024 17:53:05 UTC
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EAD10E929;
 Sat,  6 Apr 2024 17:53:04 +0000 (UTC)
Message-ID: <6ea5a8c3-e4f1-4df7-ac23-d04f3599b516@lankhorst.se>
Date: Sat, 6 Apr 2024 19:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [rebase 1/3] drm: Add drm_vblank_work_flush_all().
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240404104813.150030-1-maarten.lankhorst@linux.intel.com>
 <smeojxujor4l3bfq4leozrbqvqufbe7elznkrbhwtvduqzqu2p@op4kymwaxudz>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <smeojxujor4l3bfq4leozrbqvqufbe7elznkrbhwtvduqzqu2p@op4kymwaxudz>
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

Hey,

On 2024-04-05 15:36, Lucas De Marchi wrote:
> what does "rebase" instead of "PATCH" is supposed to mean here?
> And then we have a "PATCH v2" as reply to this one.
> 
> Shouldn't this go to dri-devel (too)?
> 
> Lucas De Marchi
I was rebasing so no changes were originally made.

Afterwards I found out why the patch series failed,
and sent a v2 patch for that specifically.

I think this should go to dri-devel, forgot this patch required it. :)

Can send a full v2 patch series in the beginning of next week. It looks 
like I still missed a uaf even with this fix. :(

Cheers,
~Maarten

> 
> On Thu, Apr 04, 2024 at 12:48:11PM +0200, Maarten Lankhorst wrote:
>> From: Maarten Lankhorst <dev@lankhorst.se>
>>
>> In some cases we want to flush all vblank work, right before vblank_off
>> for example. Add a simple function to make this possible.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>> drivers/gpu/drm/drm_vblank_work.c | 22 ++++++++++++++++++++++
>> include/drm/drm_vblank_work.h     |  2 ++
>> 2 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank_work.c 
>> b/drivers/gpu/drm/drm_vblank_work.c
>> index 43cd5c0f4f6f..ff86f2b2e052 100644
>> --- a/drivers/gpu/drm/drm_vblank_work.c
>> +++ b/drivers/gpu/drm/drm_vblank_work.c
>> @@ -232,6 +232,28 @@ void drm_vblank_work_flush(struct drm_vblank_work 
>> *work)
>> }
>> EXPORT_SYMBOL(drm_vblank_work_flush);
>>
>> +/**
>> + * drm_vblank_work_flush_all - flush all currently pending vblank 
>> work on crtc.
>> + * @crtc: crtc for which vblank work to flush
>> + *
>> + * Wait until all currently queued vblank work on @crtc
>> + * has finished executing once.
>> + */
>> +void drm_vblank_work_flush_all(struct drm_crtc *crtc)
>> +{
>> +    struct drm_device *dev = crtc->dev;
>> +    struct drm_vblank_crtc *vblank = &dev->vblank[drm_crtc_index(crtc)];
>> +
>> +    spin_lock_irq(&dev->event_lock);
>> +    wait_event_lock_irq(vblank->work_wait_queue,
>> +                waitqueue_active(&vblank->work_wait_queue),
>> +                dev->event_lock);
>> +    spin_unlock_irq(&dev->event_lock);
>> +
>> +    kthread_flush_worker(vblank->worker);
>> +}
>> +EXPORT_SYMBOL(drm_vblank_work_flush_all);
>> +
>> /**
>>  * drm_vblank_work_init - initialize a vblank work item
>>  * @work: vblank work item
>> diff --git a/include/drm/drm_vblank_work.h 
>> b/include/drm/drm_vblank_work.h
>> index eb41d0810c4f..e04d436b7297 100644
>> --- a/include/drm/drm_vblank_work.h
>> +++ b/include/drm/drm_vblank_work.h
>> @@ -17,6 +17,7 @@ struct drm_crtc;
>>  * drm_vblank_work_init()
>>  * drm_vblank_work_cancel_sync()
>>  * drm_vblank_work_flush()
>> + * drm_vblank_work_flush_all()
>>  */
>> struct drm_vblank_work {
>>     /**
>> @@ -67,5 +68,6 @@ void drm_vblank_work_init(struct drm_vblank_work 
>> *work, struct drm_crtc *crtc,
>>               void (*func)(struct kthread_work *work));
>> bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work);
>> void drm_vblank_work_flush(struct drm_vblank_work *work);
>> +void drm_vblank_work_flush_all(struct drm_crtc *crtc);
>>
>> #endif /* !_DRM_VBLANK_WORK_H_ */
>> -- 
>> 2.43.0
>>
