Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D020635CF9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 13:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5592E10E1EB;
	Wed, 23 Nov 2022 12:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB38510E1EB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 12:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BKYldkiylypCa5Fn1wsheOlYbLGYk9NNInEZehCHXFE=; b=NYi94UUchGnmsUVCxSZSo8SMvW
 dhfgrCJCBfIXdQKbCzCjYasVxnRAt9kQsTtd/b69dSCLynNCTZBQgn69NVlcT053XUmYmRQ7ahBcc
 fCpVpbMCtSyxoS72V65nAb13RZADQNYixU8GE8IeRPGfWbL4QwM3DPtAMxjzlp88OZNZ9pUe4wRg5
 4W9RJqD7533KDb16I9O6M/JaIdlA/SoYSucde9mQWYm8fsvQtJgdTx6kVm2bS+nLtn79tS4pZsYkB
 zv8oyJUI4fNiOwklcHCgx6gb1NLrvyad05TsWjMdAaVihqvvpBCBBv9u1HTuH2iX+cs/nMieUauBy
 YBrn+pjA==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=57881)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oxp0W-0007s0-Fr; Wed, 23 Nov 2022 13:37:40 +0100
Message-ID: <dc65c45b-93ee-9c2a-ba5e-5b347ae4acdd@tronnes.org>
Date: Wed, 23 Nov 2022 13:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 6/6] drm/gud: Use the shadow plane helper
To: Thomas Zimmermann <tzimmermann@suse.de>, stable@kernel.org,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-6-9de3afa3383e@tronnes.org>
 <77a90e8c-4ee9-dc63-02db-de8fc3ab8939@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <77a90e8c-4ee9-dc63-02db-de8fc3ab8939@suse.de>
Content-Type: text/plain; charset=UTF-8
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



Den 23.11.2022 11.38, skrev Thomas Zimmermann:
> Hi
> 
> Am 22.11.22 um 21:58 schrieb Noralf Trønnes via B4 Submission Endpoint:
>> From: Noralf Trønnes <noralf@tronnes.org>
>>
>> Use the shadow plane helper to take care of preparing the framebuffer for
>> CPU access. The synchronous flushing is now done inline without the
>> use of
>> a worker. The async path now uses a shadow buffer to hold framebuffer
>> changes and it doesn't read the framebuffer behind userspace's back
>> anymore.
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> ---
>>   drivers/gpu/drm/gud/gud_drv.c      |  1 +
>>   drivers/gpu/drm/gud/gud_internal.h |  1 +
>>   drivers/gpu/drm/gud/gud_pipe.c     | 69
>> ++++++++++++++++++++++++--------------
>>   3 files changed, 46 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/gud/gud_drv.c
>> b/drivers/gpu/drm/gud/gud_drv.c
>> index d57dab104358..5aac7cda0505 100644
>> --- a/drivers/gpu/drm/gud/gud_drv.c
>> +++ b/drivers/gpu/drm/gud/gud_drv.c
>> @@ -365,6 +365,7 @@ static void gud_debugfs_init(struct drm_minor *minor)
>>   static const struct drm_simple_display_pipe_funcs gud_pipe_funcs = {
>>       .check      = gud_pipe_check,
>>       .update        = gud_pipe_update,
>> +    DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS
>>   };
>>     static const struct drm_mode_config_funcs gud_mode_config_funcs = {
>> diff --git a/drivers/gpu/drm/gud/gud_internal.h
>> b/drivers/gpu/drm/gud/gud_internal.h
>> index e351a1f1420d..0d148a6f27aa 100644
>> --- a/drivers/gpu/drm/gud/gud_internal.h
>> +++ b/drivers/gpu/drm/gud/gud_internal.h
>> @@ -43,6 +43,7 @@ struct gud_device {
>>       struct drm_framebuffer *fb;
>>       struct drm_rect damage;
>>       bool prev_flush_failed;
>> +    void *shadow_buf;
>>   };
>>     static inline struct gud_device *to_gud_device(struct drm_device
>> *drm)
>> diff --git a/drivers/gpu/drm/gud/gud_pipe.c
>> b/drivers/gpu/drm/gud/gud_pipe.c
>> index dfada6eedc58..7686325f7ee7 100644
>> --- a/drivers/gpu/drm/gud/gud_pipe.c
>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
>> @@ -358,10 +358,10 @@ static void gud_flush_damage(struct gud_device
>> *gdrm, struct drm_framebuffer *fb
>>   void gud_flush_work(struct work_struct *work)
>>   {
>>       struct gud_device *gdrm = container_of(work, struct gud_device,
>> work);
>> -    struct iosys_map gem_map = { }, fb_map = { };
>> +    struct iosys_map shadow_map;
>>       struct drm_framebuffer *fb;
>>       struct drm_rect damage;
>> -    int idx, ret;
>> +    int idx;
>>         if (!drm_dev_enter(&gdrm->drm, &idx))
>>           return;
>> @@ -369,6 +369,7 @@ void gud_flush_work(struct work_struct *work)
>>       mutex_lock(&gdrm->damage_lock);
>>       fb = gdrm->fb;
>>       gdrm->fb = NULL;
>> +    iosys_map_set_vaddr(&shadow_map, gdrm->shadow_buf);
>>       damage = gdrm->damage;
>>       gud_clear_damage(gdrm);
>>       mutex_unlock(&gdrm->damage_lock);
>> @@ -376,33 +377,33 @@ void gud_flush_work(struct work_struct *work)
>>       if (!fb)
>>           goto out;
>>   -    ret = drm_gem_fb_vmap(fb, &gem_map, &fb_map);
>> -    if (ret)
>> -        goto fb_put;
>> +    gud_flush_damage(gdrm, fb, &shadow_map, true, &damage);
>>   -    ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>> -    if (ret)
>> -        goto vunmap;
>> -
>> -    /* Imported buffers are assumed to be WriteCombined with uncached
>> reads */
>> -    gud_flush_damage(gdrm, fb, &fb_map, !fb->obj[0]->import_attach,
>> &damage);
>> -
>> -    drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>> -vunmap:
>> -    drm_gem_fb_vunmap(fb, &gem_map);
>> -fb_put:
>>       drm_framebuffer_put(fb);
>>   out:
>>       drm_dev_exit(idx);
>>   }
>>   -static void gud_fb_queue_damage(struct gud_device *gdrm, struct
>> drm_framebuffer *fb,
>> -                struct drm_rect *damage)
>> +static int gud_fb_queue_damage(struct gud_device *gdrm, struct
>> drm_framebuffer *fb,
>> +                   const struct iosys_map *map, struct drm_rect *damage)
>>   {
>>       struct drm_framebuffer *old_fb = NULL;
>> +    struct iosys_map shadow_map;
>>         mutex_lock(&gdrm->damage_lock);
>>   +    if (!gdrm->shadow_buf) {
>> +        gdrm->shadow_buf = vzalloc(fb->pitches[0] * fb->height);
>> +        if (!gdrm->shadow_buf) {
>> +            mutex_unlock(&gdrm->damage_lock);
>> +            return -ENOMEM;
>> +        }
>> +    }
>> +
>> +    iosys_map_set_vaddr(&shadow_map, gdrm->shadow_buf);
>> +    iosys_map_incr(&shadow_map, drm_fb_clip_offset(fb->pitches[0],
>> fb->format, damage));
>> +    drm_fb_memcpy(&shadow_map, fb->pitches, map, fb, damage);
>> +
> 
> It's all good (sans the begin_cpu_access issue) in terms of code, but
> the memcpy here can have quite an impact on performace.
> 

Yes if the gud display is the only one in the rendering loop it's not
good. This is on an old HP laptop running the async path (RGB565 over USB):

$ modetest -M gud -s 36:1920x1080 -v
setting mode 1920x1080-60.00Hz on connectors 36, crtc 33
freq: 414.56Hz
freq: 439.71Hz

This is the normal path:

$ modetest -M gud -s 36:1920x1080 -v
setting mode 1920x1080-60.00Hz on connectors 36, crtc 33
freq: 18.11Hz
freq: 17.98Hz

> So why not just nuke the async code entirely? It's a userspace problem
> and we don't have many(/any?) other drivers with such a workaround. Udl,
> our other usb-based driver, works well enough without.
> 

I want to do it gradually so I did consider switching the default to
synchronous flushing in this patchset. I think maybe I should just do
that since you say it "works well enough".

I took the async idea from tiny/gm12u320 and Hans explained the need for
the async worker. He's well versed with userspace so I did the same. But
that is 3 years ago and things change. My long term plan is to drop the
async path, but I want to keep it until I know there are no problems.

I've seen some reports about the udl driver having horrible performance,
but I haven't seen any explanations as to why. It could be because GNOME
until recently[1] didn't provide damage info to the kernel.

The GNOME rendering loop issue was solved in 3.38[2]

Noralf.

[1] https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1879
[2]
https://blogs.gnome.org/shell-dev/2020/07/02/splitting-up-the-frame-clock/

> Best regards
> Thomas
> 
>>       if (fb != gdrm->fb) {
>>           old_fb = gdrm->fb;
>>           drm_framebuffer_get(fb);
>> @@ -420,6 +421,26 @@ static void gud_fb_queue_damage(struct gud_device
>> *gdrm, struct drm_framebuffer
>>         if (old_fb)
>>           drm_framebuffer_put(old_fb);
>> +
>> +    return 0;
>> +}
>> +
>> +static void gud_fb_handle_damage(struct gud_device *gdrm, struct
>> drm_framebuffer *fb,
>> +                 const struct iosys_map *map, struct drm_rect *damage)
>> +{
>> +    int ret;
>> +
>> +    if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE)
>> +        drm_rect_init(damage, 0, 0, fb->width, fb->height);
>> +
>> +    if (gud_async_flush) {
>> +        ret = gud_fb_queue_damage(gdrm, fb, map, damage);
>> +        if (ret != -ENOMEM)
>> +            return;
>> +    }
>> +
>> +    /* Imported buffers are assumed to be WriteCombined with uncached
>> reads */
>> +    gud_flush_damage(gdrm, fb, map, !fb->obj[0]->import_attach, damage);
>>   }
>>     int gud_pipe_check(struct drm_simple_display_pipe *pipe,
>> @@ -544,6 +565,7 @@ void gud_pipe_update(struct
>> drm_simple_display_pipe *pipe,
>>       struct drm_device *drm = pipe->crtc.dev;
>>       struct gud_device *gdrm = to_gud_device(drm);
>>       struct drm_plane_state *state = pipe->plane.state;
>> +    struct drm_shadow_plane_state *shadow_plane_state =
>> to_drm_shadow_plane_state(state);
>>       struct drm_framebuffer *fb = state->fb;
>>       struct drm_crtc *crtc = &pipe->crtc;
>>       struct drm_rect damage;
>> @@ -557,6 +579,8 @@ void gud_pipe_update(struct
>> drm_simple_display_pipe *pipe,
>>               gdrm->fb = NULL;
>>           }
>>           gud_clear_damage(gdrm);
>> +        vfree(gdrm->shadow_buf);
>> +        gdrm->shadow_buf = NULL;
>>           mutex_unlock(&gdrm->damage_lock);
>>       }
>>   @@ -572,13 +596,8 @@ void gud_pipe_update(struct
>> drm_simple_display_pipe *pipe,
>>       if (crtc->state->active_changed)
>>           gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE,
>> crtc->state->active);
>>   -    if (drm_atomic_helper_damage_merged(old_state, state, &damage)) {
>> -        if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE)
>> -            drm_rect_init(&damage, 0, 0, fb->width, fb->height);
>> -        gud_fb_queue_damage(gdrm, fb, &damage);
>> -        if (!gud_async_flush)
>> -            flush_work(&gdrm->work);
>> -    }
>> +    if (drm_atomic_helper_damage_merged(old_state, state, &damage))
>> +        gud_fb_handle_damage(gdrm, fb, &shadow_plane_state->data[0],
>> &damage);
>>         if (!crtc->state->enable)
>>           gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
>>
> 
