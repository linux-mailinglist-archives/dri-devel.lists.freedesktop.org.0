Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBC83E7CB3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 17:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6008889857;
	Tue, 10 Aug 2021 15:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E65789857
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 15:47:27 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id h17so7886314vsu.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6XjmLk6mWOnDrQJChBOtb9nT2UATia9v6R/MbDfH/4E=;
 b=JXjNjodJox4LttQjjq/zBQ5l7OAlXg1w4kuTjoUFiJZAVXy8DkFouwatlITtLqPMof
 dbR0UsRLPavPoPQMDIaMN+fe5R07NfFIlp+hHIoqtQMG7v2ifBgO+PiizvtiMi9lzL35
 YrcdhHXTgUAAlSQlnEni2aW0JoQmZTDlCQTiMrXNRmsvrr3GZR7sPhg0P+j6wefCzr/e
 H01yyvTcULZ6HutYkjEDVROX6S68cUyCCn9/+XuzeLM1mwzqbrJP8Xn817xMEY3BM5ca
 ykWWQf+drqQ2l65QlXSzT4dIASv3OlKfiB1pXWtT+H36GEdfhAIPy7fNMk6UfAUPPEst
 3DuA==
X-Gm-Message-State: AOAM533zcPSbaiEXVOMMjkTHrfrcRNtcZEOoyguZhyxCBYWQZGZoqIT8
 jwTBb8M4HNjPGN6MCv2z9ga/rkfKAM7mpb6SwiacGQl+GEyWBQ==
X-Google-Smtp-Source: ABdhPJz85S0D3vYuAnxqYxxyQzVXcSB2pzj4im/IFU5oWvW8d7+alU8aU7wRXPzGDmEmAHeE+/FCM62ekBYfh1qrSuE=
X-Received: by 2002:a67:e2c7:: with SMTP id i7mr21905760vsm.3.1628610445957;
 Tue, 10 Aug 2021 08:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210520065046.28978-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210520065046.28978-3-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Aug 2021 17:47:14 +0200
Message-ID: <CAMuHMdWdbS2tFh9LP8hqUT-3nRqKf_k_8N3ZeiUSiBEgYhjDxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm: rcar-du: lvds: Convert to DRM panel bridge
 helper
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Laurent,

On Thu, May 20, 2021 at 8:51 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Replace the manual panel handling with usage of the DRM panel bridge
> helper. This simplifies the driver, and brings support for
> DRM_BRIDGE_ATTACH_NO_CONNECTOR as an added bonus.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch, which is now commit e9e056949c927e5b ("drm:
rcar-du: lvds: Convert to DRM panel bridge helper") in drm-next.

This causes the following scary messages in the kernel log on Ebisu-4D:

[drm:drm_bridge_attach] *ERROR* failed to attach bridge
/soc/lvds-encoder@feb90100 to encoder None-66: -22
renesas_sdhi_internal_dmac ee100000.mmc: mmc1 base at
0x00000000ee100000, max clock rate 200 MHz
rcar-du feb00000.display: failed to initialize encoder
/soc/lvds-encoder@feb90100 on output 3 (-22), skipping
renesas_sdhi_internal_dmac ee120000.mmc: mmc2 base at
0x00000000ee120000, max clock rate 200 MHz
------------[ cut here ]------------
renesas_sdhi_internal_dmac ee160000.mmc: mmc0 base at
0x00000000ee160000, max clock rate 200 MHz
possible_clones mismatch: [ENCODER:62:None-62] mask=0x1
possible_clones=0x3 vs. [ENCODER:66:None-66] mask=0x4
possible_clones=0x3
WARNING: CPU: 1 PID: 68 at drivers/gpu/drm/drm_mode_config.c:583
drm_mode_config_validate+0x3cc/0x4c8
CPU: 1 PID: 68 Comm: kworker/u4:2 Not tainted
5.14.0-rc3-arm64-renesas-00324-ge9e056949c92 #1277
Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
pc : drm_mode_config_validate+0x3cc/0x4c8
lr : drm_mode_config_validate+0x3cc/0x4c8
sp : ffff80001239ba80
x29: ffff80001239ba90 x28: ffff00000801c005 x27: 0000000000000001
x26: ffff000009de8868 x25: 000000000000001f x24: ffff00000a490f80
mmc0: new HS400 MMC card at address 0001
x23: ffff000009de8868 x22: ffff800011029ea0 x21: ffff800011029e20
x20: ffff000009de8018 x19: ffff00000a490b80 x18: 0000000000000020
x17: 7364766c2f636f73 x16: 0000000000004a12 x15: ffff00000892df38
x14: 0000000000000000 x13: 0000000000000003 x12: ffff8000113e3a80
x11: 0000000000000001 x10: 0000000000000078
mmcblk0: mmc0:0001 BGSD3R 29.1 GiB
 x9 : ffff800011172994
x8 : 0000000000000000 x7 : 0000000000000001 x6 : 0000000000000001
x5 : 0000000000000000 x4 : 0000000000000003 x3 : 0000000000000000
x2 : ffff8000113e38d8 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 drm_mode_config_validate+0x3cc/0x4c8
 drm_dev_register+0x174/0x208
 rcar_du_probe+0xc4/0x110
 platform_probe+0x64/0xd0
 really_probe+0x134/0x2e8
 __driver_probe_device+0x74/0xd8
 driver_probe_device+0x3c/0xe0
 __device_attach_driver+0xa8/0xf0
 bus_for_each_drv+0x74/0xc8
 __device_attach+0xec/0x148
 device_initial_probe+0x10/0x18
 bus_probe_device+0x98/0xa0
mmcblk0boot0: mmc0:0001 BGSD3R 16.0 MiB
 deferred_probe_work_func+0x88/0xc0
 process_one_work+0x284/0x6d0
 worker_thread+0x48/0x418
 kthread+0x14c/0x158
 ret_from_fork+0x10/0x18
irq event stamp: 27688
hardirqs last  enabled at (27687): [<ffff800010104424>] vprintk_emit+0x2f4/0x2f8
hardirqs last disabled at (27688): [<ffff800010ca4eb4>] el1_dbg+0x24/0x88
mmcblk0boot1: mmc0:0001 BGSD3R 16.0 MiB
softirqs last  enabled at (27616): [<ffff8000100104ac>] _stext+0x4ac/0x620
softirqs last disabled at (27607): [<ffff80001008ffdc>] irq_exit+0x1b4/0x1c0
---[ end trace 6e42cb0428a6481b ]---
------------[ cut here ]------------
mmcblk0rpmb: mmc0:0001 BGSD3R 4.00 MiB, chardev (243:0)
possible_clones mismatch: [ENCODER:64:None-64] mask=0x2
possible_clones=0x3 vs. [ENCODER:66:None-66] mask=0x4
possible_clones=0x3
WARNING: CPU: 1 PID: 68 at drivers/gpu/drm/drm_mode_config.c:583
drm_mode_config_validate+0x3cc/0x4c8
CPU: 1 PID: 68 Comm: kworker/u4:2 Tainted: G        W
5.14.0-rc3-arm64-renesas-00324-ge9e056949c92 #1277
Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
pc : drm_mode_config_validate+0x3cc/0x4c8
lr : drm_mode_config_validate+0x3cc/0x4c8
sp : ffff80001239ba80
x29: ffff80001239ba90 x28: ffff00000801c005 x27: 0000000000000001
x26: ffff000009de8868 x25: 000000000000001f x24: ffff00000a490f80
x23: ffff000009de8868 x22: ffff800011029ea0 x21: ffff800011029e20
x20: ffff000009de8018 x19: ffff00000a490d80 x18: 0000000000000010
x17: 746978655f717269 x16: 205d3e6364666638 x15: 076c0763075f0765
x14: 000000000000014d x13: ffff00000892df38 x12: 00000000ffffffea
x11: ffff800011453b70 x10: ffff80001143bb30 x9 : ffff80001143bb88
x8 : 0000000000000000 x7 : 0000000000000001 x6 : 0000000000000001
x5 : 0000000000000000 x4 : 0000000000000003 x3 : 0000000000000000
x2 : ffff8000113e38d8 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 drm_mode_config_validate+0x3cc/0x4c8
 drm_dev_register+0x174/0x208
 rcar_du_probe+0xc4/0x110
 platform_probe+0x64/0xd0
 really_probe+0x134/0x2e8
 __driver_probe_device+0x74/0xd8
 driver_probe_device+0x3c/0xe0
 __device_attach_driver+0xa8/0xf0
 bus_for_each_drv+0x74/0xc8
 __device_attach+0xec/0x148
 device_initial_probe+0x10/0x18
 bus_probe_device+0x98/0xa0
 deferred_probe_work_func+0x88/0xc0
 process_one_work+0x284/0x6d0
 worker_thread+0x48/0x418
 kthread+0x14c/0x158
 ret_from_fork+0x10/0x18
irq event stamp: 27858
hardirqs last  enabled at (27857): [<ffff800010103e84>]
console_unlock+0x4d4/0x638
hardirqs last disabled at (27858): [<ffff800010ca4eb4>] el1_dbg+0x24/0x88
softirqs last  enabled at (27822): [<ffff8000100104ac>] _stext+0x4ac/0x620
softirqs last disabled at (27817): [<ffff80001008ffdc>] irq_exit+0x1b4/0x1c0
---[ end trace 6e42cb0428a6481c ]---
------------[ cut here ]------------
possible_clones mismatch: [ENCODER:66:None-66] mask=0x4
possible_clones=0x3 vs. [ENCODER:62:None-62] mask=0x1
possible_clones=0x3
WARNING: CPU: 1 PID: 68 at drivers/gpu/drm/drm_mode_config.c:583
drm_mode_config_validate+0x3cc/0x4c8
CPU: 1 PID: 68 Comm: kworker/u4:2 Tainted: G        W
5.14.0-rc3-arm64-renesas-00324-ge9e056949c92 #1277
Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
pc : drm_mode_config_validate+0x3cc/0x4c8
lr : drm_mode_config_validate+0x3cc/0x4c8
sp : ffff80001239ba80
x29: ffff80001239ba90 x28: ffff00000801c005 x27: 0000000000000001
x26: ffff000009de8868 x25: 000000000000001f x24: ffff00000a490b80
x23: ffff000009de8868 x22: ffff800011029ea0 x21: ffff800011029e20
x20: ffff000009de8018 x19: ffff00000a490f80 x18: 0000000000000010
x17: 746978655f717269 x16: 205d3e6364666638 x15: 076c0763075f0765
x14: 0000000000000179 x13: ffff00000892df38 x12: 00000000ffffffea
x11: ffff800011453b70 x10: ffff80001143bb30 x9 : ffff80001143bb88
x8 : 0000000000000000 x7 : 0000000000000001 x6 : 0000000000000001
x5 : 0000000000000000 x4 : 0000000000000003 x3 : 0000000000000000
x2 : ffff8000113e38d8 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 drm_mode_config_validate+0x3cc/0x4c8
 drm_dev_register+0x174/0x208
 rcar_du_probe+0xc4/0x110
 platform_probe+0x64/0xd0
 really_probe+0x134/0x2e8
 __driver_probe_device+0x74/0xd8
 driver_probe_device+0x3c/0xe0
 __device_attach_driver+0xa8/0xf0
 bus_for_each_drv+0x74/0xc8
 __device_attach+0xec/0x148
 device_initial_probe+0x10/0x18
 bus_probe_device+0x98/0xa0
 deferred_probe_work_func+0x88/0xc0
 process_one_work+0x284/0x6d0
 worker_thread+0x48/0x418
 kthread+0x14c/0x158
 ret_from_fork+0x10/0x18
irq event stamp: 27888
hardirqs last  enabled at (27887): [<ffff800010103e84>]
console_unlock+0x4d4/0x638
hardirqs last disabled at (27888): [<ffff800010ca4eb4>] el1_dbg+0x24/0x88
softirqs last  enabled at (27866): [<ffff8000100104ac>] _stext+0x4ac/0x620
softirqs last disabled at (27861): [<ffff80001008ffdc>] irq_exit+0x1b4/0x1c0
---[ end trace 6e42cb0428a6481d ]---
------------[ cut here ]------------
possible_clones mismatch: [ENCODER:66:None-66] mask=0x4
possible_clones=0x3 vs. [ENCODER:64:None-64] mask=0x2
possible_clones=0x3
WARNING: CPU: 1 PID: 68 at drivers/gpu/drm/drm_mode_config.c:583
drm_mode_config_validate+0x3cc/0x4c8
CPU: 1 PID: 68 Comm: kworker/u4:2 Tainted: G        W
5.14.0-rc3-arm64-renesas-00324-ge9e056949c92 #1277
Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
pc : drm_mode_config_validate+0x3cc/0x4c8
lr : drm_mode_config_validate+0x3cc/0x4c8
sp : ffff80001239ba80
x29: ffff80001239ba90 x28: ffff00000801c005 x27: 0000000000000001
x26: ffff000009de8868 x25: 000000000000001f x24: ffff00000a490d80
x23: ffff000009de8868 x22: ffff800011029ea0 x21: ffff800011029e20
x20: ffff000009de8018 x19: ffff00000a490f80 x18: 0000000000000010
x17: 746978655f717269 x16: 205d3e6364666638 x15: 076c0763075f0765
x14: 00000000000001a5 x13: ffff00000892df38 x12: 00000000ffffffea
x11: ffff800011453b70 x10: ffff80001143bb30 x9 : ffff80001143bb88
x8 : 0000000000000000 x7 : 0000000000000001 x6 : 0000000000000001
x5 : 0000000000000000 x4 : 0000000000000003 x3 : 0000000000000000
x2 : ffff8000113e38d8 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 drm_mode_config_validate+0x3cc/0x4c8
 drm_dev_register+0x174/0x208
 rcar_du_probe+0xc4/0x110
 platform_probe+0x64/0xd0
 really_probe+0x134/0x2e8
 __driver_probe_device+0x74/0xd8
 driver_probe_device+0x3c/0xe0
 __device_attach_driver+0xa8/0xf0
 bus_for_each_drv+0x74/0xc8
 __device_attach+0xec/0x148
 device_initial_probe+0x10/0x18
 bus_probe_device+0x98/0xa0
 deferred_probe_work_func+0x88/0xc0
 process_one_work+0x284/0x6d0
 worker_thread+0x48/0x418
 kthread+0x14c/0x158
 ret_from_fork+0x10/0x18
irq event stamp: 27924
hardirqs last  enabled at (27923): [<ffff800010103e84>]
console_unlock+0x4d4/0x638
hardirqs last disabled at (27924): [<ffff800010ca4eb4>] el1_dbg+0x24/0x88
softirqs last  enabled at (27902): [<ffff8000100104ac>] _stext+0x4ac/0x620
softirqs last disabled at (27891): [<ffff80001008ffdc>] irq_exit+0x1b4/0x1c0
---[ end trace 6e42cb0428a6481e ]---
------------[ cut here ]------------
Bogus possible_clones: [ENCODER:66:None-66] possible_clones=0x3 (full
encoder mask=0x1f)
WARNING: CPU: 1 PID: 68 at drivers/gpu/drm/drm_mode_config.c:594
drm_mode_config_validate+0x150/0x4c8
CPU: 1 PID: 68 Comm: kworker/u4:2 Tainted: G        W
5.14.0-rc3-arm64-renesas-00324-ge9e056949c92 #1277
Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
pc : drm_mode_config_validate+0x150/0x4c8
lr : drm_mode_config_validate+0x150/0x4c8
sp : ffff80001239ba80
x29: ffff80001239ba90 x28: ffff00000801c005 x27: 0000000000000001
x26: ffff000009de8868 x25: 000000000000001f x24: ffff000009de8860
x23: ffff000009de8868 x22: ffff800011029ea0 x21: ffff800011029e20
x20: ffff000009de8018 x19: ffff00000a490f80 x18: 0000000000000010
x17: 203378303d73656e x16: 6f6c635f656c6269 x15: 0720072007200720
x14: 00000000000001d1 x13: ffff00000892df38 x12: 00000000ffffffea
x11: ffff800011453b70 x10: ffff80001143bb30 x9 : ffff80001143bb88
x8 : 0000000000000000 x7 : 0000000000000001 x6 : 0000000000000001
x5 : 0000000000000000 x4 : 0000000000000003 x3 : 0000000000000000
x2 : ffff8000113e38d8 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 drm_mode_config_validate+0x150/0x4c8
 drm_dev_register+0x174/0x208
 rcar_du_probe+0xc4/0x110
 platform_probe+0x64/0xd0
 really_probe+0x134/0x2e8
 __driver_probe_device+0x74/0xd8
 driver_probe_device+0x3c/0xe0
 __device_attach_driver+0xa8/0xf0
 bus_for_each_drv+0x74/0xc8
 __device_attach+0xec/0x148
 device_initial_probe+0x10/0x18
 bus_probe_device+0x98/0xa0
 deferred_probe_work_func+0x88/0xc0
 process_one_work+0x284/0x6d0
 worker_thread+0x48/0x418
 kthread+0x14c/0x158
 ret_from_fork+0x10/0x18
irq event stamp: 27966
hardirqs last  enabled at (27965): [<ffff800010103e84>]
console_unlock+0x4d4/0x638
hardirqs last disabled at (27966): [<ffff800010ca4eb4>] el1_dbg+0x24/0x88
softirqs last  enabled at (27940): [<ffff8000100104ac>] _stext+0x4ac/0x620
softirqs last disabled at (27927): [<ffff80001008ffdc>] irq_exit+0x1b4/0x1c0
---[ end trace 6e42cb0428a6481f ]---
[drm] Initialized rcar-du 1.0.0 20130110 for feb00000.display on minor 0
drm] Device feb00000.display probed
Console: switching to colour frame buffer device 128x48
rcar-du feb00000.display: [drm] fb0: rcar-du frame buffer device

Reverting this commit fixes the issue.
Note that I have no actual display device attached, so I do not know
if display out really works.
Salvator-X(S) seems to be fine, with the same disclaimer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
