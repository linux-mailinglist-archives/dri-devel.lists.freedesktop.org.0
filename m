Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408309B4CA7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 15:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD0510E29F;
	Tue, 29 Oct 2024 14:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UutZRdPu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9720B10E29F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 14:54:30 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-84fd2310413so1542242241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 07:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730213669; x=1730818469;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mlbNRwRg0sLZdZxIUN5KxX0zSY8cjoST2m/ckhWngBg=;
 b=UutZRdPuzuuVGY/kdwL4ED/yLm+rLeqYhNMNyQwgiRwG7YIV6xK8VLDUyW/nNDmxrJ
 5Nrx5XRIDP/IBPhmLWwuPVbBqi/eZVsj/XXGrxctjo1PgMmugYQ1cC02EIAOdA1EGbTJ
 ctwIRTUob38P17dvGAo+LBHS+OFGJlYtkQYXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730213669; x=1730818469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mlbNRwRg0sLZdZxIUN5KxX0zSY8cjoST2m/ckhWngBg=;
 b=n2TyjbEvFXSP8yGwzTl+1AowZm2lDh+U94J19UeCZ4VdZ0+i+4ZdPhorXkSv1EG84O
 r1MGv65y2qjZSept0DrfL3PWPyroHkj0deIfYQioUCrZPtd+8l2+eTpEPcOlxej1ER0Z
 Ke4Tm1H29J9BoYzaEDElgPUQ3/KudBmF7FfbO4r7MAKHdirrSeSu+4AB8zoagC43kJhx
 oCiCo7KqwMXFJcLe0LZl5Q9RfB5Q8X8IpOuNOf0GYupMSikOlIBkK/OnslAaGdtUY2tw
 HmOgGtQNNRxcxDOaMb7mlFZ/z+Op0xfdShJQVCSEbvFmXuDntZLOn/8a+++zVvZaGLD7
 QNew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkY+1NCXdfEAeTmBwiQD+fVIb/fQYhRBfCVZMZCLXY5vI/raLHot+lJ1/a1aUq2stcrL6gb90DF6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRCo/JDLvUSdcWk05hWll98zR4ZQ/SXhevA9UowyB2IypCm8QT
 CamT/HozOdmLhtlu28mmkjDlzRLamkll5VLuir5WaCiRAaOP6m2n/0+HFC0eksN4ZS6wc2mY7jM
 =
X-Google-Smtp-Source: AGHT+IFJ+sgYrZvlSEX/PWkjPMT7UbhgkgUiEj1xzjvUOsyNBoJ8PHVwMRAZ1TdBktbt5HZocsYQyw==
X-Received: by 2002:a05:6122:65aa:b0:50d:85d7:d94b with SMTP id
 71dfb90a1353d-51015116a1dmr8801047e0c.11.1730213668769; 
 Tue, 29 Oct 2024 07:54:28 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-510043d1e2fsm1129000e0c.29.2024.10.29.07.54.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 07:54:27 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-50d58e5bfd2so1472972e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 07:54:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX5VfUSi9mpKG5co6QD4IIGKTAYAlZtx6WpIYJnkmKGTi9BMpHZ000LJdvBYAWDYenuIUGku+nZc4I=@lists.freedesktop.org
X-Received: by 2002:a05:6122:3d01:b0:50d:35d9:ad5f with SMTP id
 71dfb90a1353d-51015050c82mr8224746e0c.7.1730213667064; Tue, 29 Oct 2024
 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241009052402.411978-1-fshao@chromium.org>
 <20241024-stalwart-bandicoot-of-music-bc6b29@houat>
In-Reply-To: <20241024-stalwart-bandicoot-of-music-bc6b29@houat>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 29 Oct 2024 22:53:49 +0800
X-Gmail-Original-Message-ID: <CAC=S1niZuiJkWBvci+bmrU-BvahhXyWWAYAMOB200a3Ppu=rTg@mail.gmail.com>
Message-ID: <CAC=S1niZuiJkWBvci+bmrU-BvahhXyWWAYAMOB200a3Ppu=rTg@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/bridge: panel: Use devm_drm_bridge_add()
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Oct 24, 2024 at 8:36=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Wed, Oct 09, 2024 at 01:23:31PM +0800, Fei Shao wrote:
> > In the mtk_dsi driver, its DSI host attach callback calls
> > devm_drm_of_get_bridge() to get the next bridge. If that next bridge is
> > a panel bridge, a panel_bridge object is allocated and managed by the
> > panel device.
> >
> > Later, if the attach callback fails with -EPROBE_DEFER from subsequent
> > component_add(), the panel device invoking the callback at probe time
> > also fails, and all device-managed resources are freed accordingly.
> >
> > This exposes a drm_bridge bridge_list corruption due to the unbalanced
> > lifecycle between the DSI host and the panel devices: the panel_bridge
> > object managed by panel device is freed, while drm_bridge_remove() is
> > bound to DSI host device and never gets called.
> > The next drm_bridge_add() will trigger UAF against the freed bridge lis=
t
> > object and result in kernel panic.
> >
> > This bug is observed on a MediaTek MT8188-based Chromebook with MIPI DS=
I
> > outputting to a DSI panel (DT is WIP for upstream).
> >
> > As a fix, using devm_drm_bridge_add() with the panel device in the pane=
l
> > path seems reasonable. This also implies a chain of potential cleanup
> > actions:
> >
> > 1. Removing drm_bridge_remove() means devm_drm_panel_bridge_release()
> >    becomes hollow and can be removed.
> >
> > 2. devm_drm_panel_bridge_add_typed() is almost emptied except for the
> >    `bridge->pre_enable_prev_first` line. Itself can be also removed if
> >    we move the line into drm_panel_bridge_add_typed(). (maybe?)
> >
> > 3. drm_panel_bridge_add_typed() now calls all the needed devm_* calls,
> >    so it's essentially the new devm_drm_panel_bridge_add_typed().
> >
> > 4. drmm_panel_bridge_add() needs to be updated accordingly since it
> >    calls drm_panel_bridge_add_typed(). But now there's only one bridge
> >    object to be freed, and it's already being managed by panel device.
> >    I wonder if we still need both drmm_ and devm_ version in this case.
> >    (maybe yes from DRM PoV, I don't know much about the context)
> >
> > This is a RFC patch since I'm not sure if my understanding is correct
> > (for both the fix and the cleanup). It fixes the issue I encountered,
> > but I don't expect it to be picked up directly due to the redundant
> > commit message and the dangling devm_drm_panel_bridge_release().
> > I plan to resend the official patch(es) once I know what I supposed to
> > do next.
> >
> > For reference, here's the KASAN report from the device:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >  BUG: KASAN: slab-use-after-free in drm_bridge_add+0x98/0x230
> >  Read of size 8 at addr ffffff80c4e9e100 by task kworker/u32:1/69
> >
> >  CPU: 1 UID: 0 PID: 69 Comm: kworker/u32:1 Not tainted 6.12.0-rc1-next-=
20241004-kasan-00030-g062135fa4046 #1
> >  Hardware name: Google Ciri sku0/unprovisioned board (DT)
> >  Workqueue: events_unbound deferred_probe_work_func
> >  Call trace:
> >   dump_backtrace+0xfc/0x140
> >   show_stack+0x24/0x38
> >   dump_stack_lvl+0x40/0xc8
> >   print_report+0x140/0x700
> >   kasan_report+0xcc/0x130
> >   __asan_report_load8_noabort+0x20/0x30
> >   drm_bridge_add+0x98/0x230
> >   devm_drm_panel_bridge_add_typed+0x174/0x298
> >   devm_drm_of_get_bridge+0xe8/0x190
> >   mtk_dsi_host_attach+0x130/0x2b0
> >   mipi_dsi_attach+0x8c/0xe8
> >   hx83102_probe+0x1a8/0x368
> >   mipi_dsi_drv_probe+0x6c/0x88
> >   really_probe+0x1c4/0x698
> >   __driver_probe_device+0x160/0x298
> >   driver_probe_device+0x7c/0x2a8
> >   __device_attach_driver+0x2a0/0x398
> >   bus_for_each_drv+0x198/0x200
> >   __device_attach+0x1c0/0x308
> >   device_initial_probe+0x20/0x38
> >   bus_probe_device+0x11c/0x1f8
> >   deferred_probe_work_func+0x80/0x250
> >   worker_thread+0x9b4/0x2780
> >   kthread+0x274/0x350
> >   ret_from_fork+0x10/0x20
> >
> >  Allocated by task 69:
> >   kasan_save_track+0x40/0x78
> >   kasan_save_alloc_info+0x44/0x58
> >   __kasan_kmalloc+0x84/0xa0
> >   __kmalloc_node_track_caller_noprof+0x228/0x450
> >   devm_kmalloc+0x6c/0x288
> >   devm_drm_panel_bridge_add_typed+0xa0/0x298
> >   devm_drm_of_get_bridge+0xe8/0x190
> >   mtk_dsi_host_attach+0x130/0x2b0
> >   mipi_dsi_attach+0x8c/0xe8
> >   hx83102_probe+0x1a8/0x368
> >   mipi_dsi_drv_probe+0x6c/0x88
> >   really_probe+0x1c4/0x698
> >   __driver_probe_device+0x160/0x298
> >   driver_probe_device+0x7c/0x2a8
> >   __device_attach_driver+0x2a0/0x398
> >   bus_for_each_drv+0x198/0x200
> >   __device_attach+0x1c0/0x308
> >   device_initial_probe+0x20/0x38
> >   bus_probe_device+0x11c/0x1f8
> >   deferred_probe_work_func+0x80/0x250
> >   worker_thread+0x9b4/0x2780
> >   kthread+0x274/0x350
> >   ret_from_fork+0x10/0x20
> >
> >  Freed by task 69:
> >   kasan_save_track+0x40/0x78
> >   kasan_save_free_info+0x58/0x78
> >   __kasan_slab_free+0x48/0x68
> >   kfree+0xd4/0x750
> >   devres_release_all+0x144/0x1e8
> >   really_probe+0x48c/0x698
> >   __driver_probe_device+0x160/0x298
> >   driver_probe_device+0x7c/0x2a8
> >   __device_attach_driver+0x2a0/0x398
> >   bus_for_each_drv+0x198/0x200
> >   __device_attach+0x1c0/0x308
> >   device_initial_probe+0x20/0x38
> >   bus_probe_device+0x11c/0x1f8
> >   deferred_probe_work_func+0x80/0x250
> >   worker_thread+0x9b4/0x2780
> >   kthread+0x274/0x350
> >   ret_from_fork+0x10/0x20
> >
> >  The buggy address belongs to the object at ffffff80c4e9e000
> >   which belongs to the cache kmalloc-4k of size 4096
> >  The buggy address is located 256 bytes inside of
> >   freed 4096-byte region [ffffff80c4e9e000, ffffff80c4e9f000)
> >
> >  The buggy address belongs to the physical page:
> >  head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:=
0
> >  flags: 0x8000000000000040(head|zone=3D2)
> >  page_type: f5(slab)
> >  page: refcount:1 mapcount:0 mapping:0000000000000000
> >  index:0x0 pfn:0x104e98
> >  raw: 8000000000000040 ffffff80c0003040 dead000000000122 00000000000000=
00
> >  raw: 0000000000000000 0000000000040004 00000001f5000000 00000000000000=
00
> >  head: 8000000000000040 ffffff80c0003040 dead000000000122 0000000000000=
000
> >  head: 0000000000000000 0000000000040004 00000001f5000000 0000000000000=
000
> >  head: 8000000000000003 fffffffec313a601 ffffffffffffffff 0000000000000=
000
> >  head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000=
000
> >  page dumped because: kasan: bad access detected
> >
> >  Memory state around the buggy address:
> >   ffffff80c4e9e000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >   ffffff80c4e9e080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >  >ffffff80c4e9e100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >                     ^
> >   ffffff80c4e9e180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >   ffffff80c4e9e200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
>
> I was looking at the driver to try to follow your (awesome btw, thanks)
> commit log, and it does have a quite different structure compared to
> what we recommend.
>
> Would following
> https://docs.kernel.org/gpu/drm-kms-helpers.html#special-care-with-mipi-d=
si-bridges
> help?

Hi Maxime,

Thank you for the pointer.
I read the suggested pattern in the doc and compared it with the
drivers. If I understand correctly, both the MIPI-DSI host and panel
drivers follow the instructions:

1. The MIPI-DSI host driver must run mipi_dsi_host_register() in its probe =
hook.
   >> drm/mediatek/mtk_dsi.c runs mipi_dsi_host_register() in the probe hoo=
k.
2. In its probe hook, the bridge driver must try to find its MIPI-DSI
host, register as a MIPI-DSI device and attach the MIPI-DSI device to
its host.
   >> drm/panel/panel-himax-hx83102.c follows and runs
mipi_dsi_attach() at the end of probe hook.
3. In its struct mipi_dsi_host_ops.attach hook, the MIPI-DSI host can
now add its component.
   >> drm/mediatek/mtk_dsi.c calls component_add() in the attach callback.

Could you elaborate on the "different structures" you mentioned?

To clarify my point: the issue is that component_add() may return
-EPROBE_DEFER if the component (e.g. DSI encoder) is not ready,
causing the panel bridge to be removed. However, drm_bridge_remove()
is bound to MIPI-DSI host instead of panel bridge, which owns the
actual list_head object.

This might be reproducible with other MIPI-DSI host + panel
combinations by forcibly returning -EPROBE_DEFER in the host attach
hook (verification with another device is needed), so the fix may be
required in drm/bridge/panel.c.

And to Chen-Yu: Thanks for the suggestion. I'll incorporate that into
v2 pending confirmation that it is the correct fix.

Regards,
Fei

>
> Maxime
