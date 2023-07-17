Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 326DD7564DB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 15:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEB910E250;
	Mon, 17 Jul 2023 13:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3690610E24C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 13:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689600382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s9WO5hDGhuujHdWxv8p8vISy/h5zOWc2CGAYHFNAIuM=;
 b=KDSpodtF+tq5UHDrOUTT0Sn6MH+nBCOqy7p08kQB+LE6fTPCSmnE2LgCfzSBEneMP+GBND
 oWrQaf2uscH35vAF0neI41Xtm++q5/gB8KePDF3+UpuK4l83OybT95yP7T9yBQzXFq1P0a
 QNTor5f9AX1fKmwJzCMmjUvnO0S5CSs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-LP-V_ovXM4i0n4XwPC7H4Q-1; Mon, 17 Jul 2023 09:26:20 -0400
X-MC-Unique: LP-V_ovXM4i0n4XwPC7H4Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbcae05906so26376865e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689600379; x=1692192379;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9WO5hDGhuujHdWxv8p8vISy/h5zOWc2CGAYHFNAIuM=;
 b=DOKB1NiMrlYwo0Ux81eclKG9vdQswxIsIIAR37qpbBizUJUSyxuWBb1Oa5ICGpTm/x
 Mjf+XPRdEYgaJj2Axfj/CSEeK15V2QINGxoxIw79Eh9F1ZCJbdHJfiF1eCFXPHMb1TZ6
 odXr7+r8XxlDuB7RXiiHEeQi/Dl8y5ZLCnWQDenXSp5n3ug25l4Y1fTmZIg541K39PU5
 4Ivg7jGXxqD1sQyT5V5yctZaALvxLcgQ+0BACZJL2vuQM/bO8plgsQbNJkh93MAyiGKf
 tKDvWJsFg8xJ5uJme3E39qOVMkQ5+eT93wsAwmI7YASQeRIptCvGvrJT//YGxTIi9DH0
 W+Tg==
X-Gm-Message-State: ABy/qLazVOKf+e/LTY+gxLwq21GubOUkaTZEokWuc29SfR/nKdsf2y9B
 zg0qhowsPt6Z2D5McIeFAiobCaFGDB5EZAfr5kQrmE34UnfeGdfkqCPrIDcTBSjjwX2xJ9nf4n6
 8U6Jao3ug89nRbsSxHYFSJ0KWamln
X-Received: by 2002:a7b:c7cf:0:b0:3fb:fa61:a4ea with SMTP id
 z15-20020a7bc7cf000000b003fbfa61a4eamr11721999wmk.11.1689600379534; 
 Mon, 17 Jul 2023 06:26:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH0XkqpZNgWEkqT/sJv48RxWkauXQhZhkVAj4W0I9tpohJmucIMDv71V+xakvVP36zzMrUCbw==
X-Received: by 2002:a7b:c7cf:0:b0:3fb:fa61:a4ea with SMTP id
 z15-20020a7bc7cf000000b003fbfa61a4eamr11721986wmk.11.1689600379241; 
 Mon, 17 Jul 2023 06:26:19 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o10-20020a05600c510a00b003fbb1ce274fsm13470754wms.0.2023.07.17.06.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 06:26:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
In-Reply-To: <CAMuHMdVYdL0y2-tVfG3BZbCtR-0xOMz9tu4R4=CJqxqwgVVmcw@mail.gmail.com>
References: <20230713163213.1028952-1-javierm@redhat.com>
 <bbbb18e0-5de1-5155-c6b2-52a2b1d75898@suse.de>
 <CAMuHMdVuLBTBymfEXDgHsDVavH6Ggq53fPep0T=dEWbztBWkjw@mail.gmail.com>
 <87h6q2kh6s.fsf@minerva.mail-host-address-is-not-set>
 <87bkgaken1.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdVYdL0y2-tVfG3BZbCtR-0xOMz9tu4R4=CJqxqwgVVmcw@mail.gmail.com>
Date: Mon, 17 Jul 2023 15:26:17 +0200
Message-ID: <878rbek6ti.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

Thanks for your review!

> Hi Javier,

[...]

>> -       ssd130x->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
>> -       if (!ssd130x->buffer)
>> -               return -ENOMEM;
>> +               ssd130x->buffer = devm_kcalloc(ssd130x->dev, pitch, ssd130x->height,
>> +                                              GFP_KERNEL);
>
> This should check if the buffer was allocated before.
> Else an application creating two or more frame buffers will keep
> on allocating new buffers.  The same is true for fbdev emulation vs.
> a userspace application.
>

Yes, you are correct.

>> +               if (!ssd130x->buffer)
>> +                       return -ENOMEM;
>> +       }
>>
>> -       ssd130x->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
>> -       if (!ssd130x->data_array) {
>> -               kfree(ssd130x->buffer);
>> +       ssd130x->data_array = devm_kcalloc(ssd130x->dev, ssd130x->width, pages,
>> +                                          GFP_KERNEL);
>
> Same here.
>
>> +       if (!ssd130x->data_array)
>>                 return -ENOMEM;
>> -       }
>
> And you still need the data_array buffer for clearing the screen,
> which is not tied to the creation of a frame buffer, I think?
>

It is indeed. I forgot about that. So what I would do for now is just to
allocate the two unconditionally and then we can optimize as a follow-up.

But also, this v2 is not correct because as I mentioned the device and
drm_device lifecycles are not the same and the kernel crashes on poweroff:

[  568.351783]  ssd130x_update_rect.isra.0+0xe0/0x308
[  568.356881]  ssd130x_primary_plane_helper_atomic_disable+0x54/0x78
[  568.363475]  drm_atomic_helper_commit_planes+0x1ec/0x288
[  568.369128]  drm_atomic_helper_commit_tail+0x5c/0xb0
[  568.374422]  commit_tail+0x168/0x1a0
[  568.378240]  drm_atomic_helper_commit+0x1c8/0x1e8
[  568.383265]  drm_atomic_commit+0xa0/0xc8
[  568.387439]  drm_atomic_helper_disable_all+0x204/0x220
[  568.392914]  drm_atomic_helper_shutdown+0x98/0x138
[  568.398033]  ssd130x_shutdown+0x18/0x30
[  568.402117]  ssd130x_i2c_shutdown+0x1c/0x30
[  568.406558]  i2c_device_shutdown+0x48/0x78
[  568.410913]  device_shutdown+0x130/0x238
[  568.415087]  kernel_restart+0x48/0xd0
[  568.418996]  __do_sys_reboot+0x14c/0x230
[  568.423167]  __arm64_sys_reboot+0x2c/0x40
[  568.427426]  invoke_syscall+0x78/0x100
[  568.431420]  el0_svc_common.constprop.0+0x68/0x130
[  568.436531]  do_el0_svc+0x34/0x50
[  568.440080]  el0_svc+0x48/0x150
[  568.443455]  el0t_64_sync_handler+0x114/0x120
[  568.448072]  el0t_64_sync+0x194/0x198
[  568.451985] Code: 12000949 52800001 52800002 0b830f63 (38634b20) 
[  568.458502] ---[ end trace 0000000000000000 ]---

Sima also suggested to make the allocation in the plane .prepare_fb, I
think that the better place is .begin_fb_access for allocation and the
.end_fb_access for free.

Updated patch below and this is the one that I'm more comfortable now
as a solution:

From b4d078dd65a04ab61dd9264e982b37321f7a75d9 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Mon, 17 Jul 2023 12:30:35 +0200
Subject: [PATCH v3] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane

Geert reports that the following NULL pointer dereference happens for him
after commit 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each
plane update"):

    [drm] Initialized ssd130x 1.0.0 20220131 for 0-003c on minor 0
    ssd130x-i2c 0-003c: [drm] surface width(128), height(32), bpp(1)
    and format(R1   little-endian (0x20203152))
    Unable to handle kernel NULL pointer dereference at virtual address 00000000
    Oops [#1]
    CPU: 0 PID: 1 Comm: swapper Not tainted
    6.5.0-rc1-orangecrab-02219-g0a529a1e4bf4 #565
    epc : ssd130x_update_rect.isra.0+0x13c/0x340
     ra : ssd130x_update_rect.isra.0+0x2bc/0x340
    ...
    status: 00000120 badaddr: 00000000 cause: 0000000f
    [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
    [<c0304200>] ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
    [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
    [<c02f9314>] drm_atomic_helper_commit_tail+0x5c/0xb4
    [<c02f94fc>] commit_tail+0x190/0x1b8
    [<c02f99fc>] drm_atomic_helper_commit+0x194/0x1c0
    [<c02c5d00>] drm_atomic_commit+0xa4/0xe4
    [<c02cce40>] drm_client_modeset_commit_atomic+0x244/0x278
    [<c02ccef0>] drm_client_modeset_commit_locked+0x7c/0x1bc
    [<c02cd064>] drm_client_modeset_commit+0x34/0x64
    [<c0301a78>] __drm_fb_helper_restore_fbdev_mode_unlocked+0xc4/0xe8
    [<c0303424>] drm_fb_helper_set_par+0x38/0x58
    [<c027c410>] fbcon_init+0x294/0x534
    ...

The problem is that fbcon calls fbcon_init() which triggers a DRM modeset
and this leads to drm_atomic_helper_commit_planes() attempting to commit
the atomic state for all planes, even the ones whose CRTC is not enabled.

Since the primary plane buffer is allocated in the encoder .atomic_enable
callback, this happens after that initial modeset commit and leads to the
mentioned NULL pointer dereference.

Fix this by allocating the buffers in the struct drm_plane_helper_funcs
.begin_fb_access callback and free them in to .end_fb_access callback,
instead of doing it when the encoder is enabled.

Fixes: commit 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each plane update")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v3:
- Move the buffers allocation to the plane helper funcs .begin_fb_access
  and the free to .end_fb_access callbacks.
- Always allocate intermediate buffer because is use in ssd130x_clear_screen().
- Don't allocate the buffers as device managed resources.

Changes in v2:
- Move the buffers allocation to .fb_create instead of preventing atomic
  updates for disable planes.
- Don't allocate the intermediate buffer when using the native R1 format.
- Allocate buffers as device managed resources.

 drivers/gpu/drm/solomon/ssd130x.c | 33 ++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index b8c90d507a35..549d78e9985d 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -634,6 +634,30 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	return ret;
 }
 
+static int ssd130x_primary_plane_helper_begin_fb_access(struct drm_plane *plane,
+							struct drm_plane_state *state)
+{
+	struct drm_device *drm = plane->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	int ret = ssd130x_buf_alloc(ssd130x);
+
+	if (ret)
+		return ret;
+
+	return drm_gem_begin_shadow_fb_access(plane, state);
+}
+
+static void ssd130x_primary_plane_helper_end_fb_access(struct drm_plane *plane,
+						       struct drm_plane_state *state)
+{
+	struct drm_device *drm = plane->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+
+	ssd130x_buf_free(ssd130x);
+
+	return drm_gem_end_shadow_fb_access(plane, state);
+}
+
 static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						       struct drm_atomic_state *state)
 {
@@ -678,7 +702,8 @@ static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.begin_fb_access = ssd130x_primary_plane_helper_begin_fb_access,
+	.end_fb_access = ssd130x_primary_plane_helper_end_fb_access,
 	.atomic_check = drm_plane_helper_atomic_check,
 	.atomic_update = ssd130x_primary_plane_helper_atomic_update,
 	.atomic_disable = ssd130x_primary_plane_helper_atomic_disable,
@@ -741,10 +766,6 @@ static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 	if (ret)
 		goto power_off;
 
-	ret = ssd130x_buf_alloc(ssd130x);
-	if (ret)
-		goto power_off;
-
 	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
 
 	backlight_enable(ssd130x->bl_dev);
@@ -766,8 +787,6 @@ static void ssd130x_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 
 	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
 
-	ssd130x_buf_free(ssd130x);
-
 	ssd130x_power_off(ssd130x);
 }
 
-- 
2.41.0

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

