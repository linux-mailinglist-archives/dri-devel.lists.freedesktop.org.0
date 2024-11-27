Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260FC9DAD54
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 19:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3273F10E1DD;
	Wed, 27 Nov 2024 18:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="dm16ea80";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2F210EBB8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 18:46:35 +0000 (UTC)
Message-ID: <58ee3fdd-ae38-4e6d-9280-cc419d0f28da@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1732733193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y30NAdp8Iit8oCWlZl9Z66C9GBmw4GgYnAhj15IS4oo=;
 b=dm16ea8077L+8mKxebkXO14Ny/02zy5dFEy1sm/JZmnAvAcJNlYi+EtVZBNC7O1ztO6u4I
 YzF60OkcTyExbdBnoUpLTiGDPeLZsqNLFgYwQUt2Qy84LCXTnQChvJHKzNg0piQjmDDswo
 GUX8hRSRzoYOGGm/w5Un07PHSfuPu1M=
Date: Thu, 28 Nov 2024 02:46:23 +0800
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/bridge: panel: Use devm_drm_bridge_add()
To: Chen-Yu Tsai <wenst@chromium.org>, Maxime Ripard <mripard@kernel.org>
Cc: Fei Shao <fshao@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241009052402.411978-1-fshao@chromium.org>
 <20241024-stalwart-bandicoot-of-music-bc6b29@houat>
 <CAC=S1niZuiJkWBvci+bmrU-BvahhXyWWAYAMOB200a3Ppu=rTg@mail.gmail.com>
 <20241114-gray-corgi-of-youth-f992ec@houat>
 <CAGXv+5EmVj6S2iioYgMKvY8NM3_jzCDS9-GC-GOMU44j0ikmKA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAGXv+5EmVj6S2iioYgMKvY8NM3_jzCDS9-GC-GOMU44j0ikmKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi,

On 2024/11/27 17:58, Chen-Yu Tsai wrote:
> Revisiting this thread since I just stepped on the same problem on a
> different device.
>
> On Thu, Nov 14, 2024 at 9:12 PM Maxime Ripard <mripard@kernel.org> wrote:
>> On Tue, Oct 29, 2024 at 10:53:49PM +0800, Fei Shao wrote:
>>> On Thu, Oct 24, 2024 at 8:36 PM Maxime Ripard <mripard@kernel.org> wrote:
>>>> On Wed, Oct 09, 2024 at 01:23:31PM +0800, Fei Shao wrote:
>>>>> In the mtk_dsi driver, its DSI host attach callback calls
>>>>> devm_drm_of_get_bridge() to get the next bridge. If that next bridge is
>>>>> a panel bridge, a panel_bridge object is allocated and managed by the
>>>>> panel device.
>>>>>
>>>>> Later, if the attach callback fails with -EPROBE_DEFER from subsequent
>>>>> component_add(), the panel device invoking the callback at probe time
>>>>> also fails, and all device-managed resources are freed accordingly.
>>>>>
>>>>> This exposes a drm_bridge bridge_list corruption due to the unbalanced
>>>>> lifecycle between the DSI host and the panel devices: the panel_bridge
>>>>> object managed by panel device is freed, while drm_bridge_remove() is
>>>>> bound to DSI host device and never gets called.
>>>>> The next drm_bridge_add() will trigger UAF against the freed bridge list
>>>>> object and result in kernel panic.
>>>>>
>>>>> This bug is observed on a MediaTek MT8188-based Chromebook with MIPI DSI
>>>>> outputting to a DSI panel (DT is WIP for upstream).
>>>>>
>>>>> As a fix, using devm_drm_bridge_add() with the panel device in the panel
>>>>> path seems reasonable. This also implies a chain of potential cleanup
>>>>> actions:
>>>>>
>>>>> 1. Removing drm_bridge_remove() means devm_drm_panel_bridge_release()
>>>>>     becomes hollow and can be removed.
>>>>>
>>>>> 2. devm_drm_panel_bridge_add_typed() is almost emptied except for the
>>>>>     `bridge->pre_enable_prev_first` line. Itself can be also removed if
>>>>>     we move the line into drm_panel_bridge_add_typed(). (maybe?)
>>>>>
>>>>> 3. drm_panel_bridge_add_typed() now calls all the needed devm_* calls,
>>>>>     so it's essentially the new devm_drm_panel_bridge_add_typed().
>>>>>
>>>>> 4. drmm_panel_bridge_add() needs to be updated accordingly since it
>>>>>     calls drm_panel_bridge_add_typed(). But now there's only one bridge
>>>>>     object to be freed, and it's already being managed by panel device.
>>>>>     I wonder if we still need both drmm_ and devm_ version in this case.
>>>>>     (maybe yes from DRM PoV, I don't know much about the context)
>>>>>
>>>>> This is a RFC patch since I'm not sure if my understanding is correct
>>>>> (for both the fix and the cleanup). It fixes the issue I encountered,
>>>>> but I don't expect it to be picked up directly due to the redundant
>>>>> commit message and the dangling devm_drm_panel_bridge_release().
>>>>> I plan to resend the official patch(es) once I know what I supposed to
>>>>> do next.
>>>>>
>>>>> For reference, here's the KASAN report from the device:
>>>>> ==================================================================
>>>>>   BUG: KASAN: slab-use-after-free in drm_bridge_add+0x98/0x230
>>>>>   Read of size 8 at addr ffffff80c4e9e100 by task kworker/u32:1/69
>>>>>
>>>>>   CPU: 1 UID: 0 PID: 69 Comm: kworker/u32:1 Not tainted 6.12.0-rc1-next-20241004-kasan-00030-g062135fa4046 #1
>>>>>   Hardware name: Google Ciri sku0/unprovisioned board (DT)
>>>>>   Workqueue: events_unbound deferred_probe_work_func
>>>>>   Call trace:
>>>>>    dump_backtrace+0xfc/0x140
>>>>>    show_stack+0x24/0x38
>>>>>    dump_stack_lvl+0x40/0xc8
>>>>>    print_report+0x140/0x700
>>>>>    kasan_report+0xcc/0x130
>>>>>    __asan_report_load8_noabort+0x20/0x30
>>>>>    drm_bridge_add+0x98/0x230
>>>>>    devm_drm_panel_bridge_add_typed+0x174/0x298
>>>>>    devm_drm_of_get_bridge+0xe8/0x190
>>>>>    mtk_dsi_host_attach+0x130/0x2b0
>>>>>    mipi_dsi_attach+0x8c/0xe8
>>>>>    hx83102_probe+0x1a8/0x368
>>>>>    mipi_dsi_drv_probe+0x6c/0x88
>>>>>    really_probe+0x1c4/0x698
>>>>>    __driver_probe_device+0x160/0x298
>>>>>    driver_probe_device+0x7c/0x2a8
>>>>>    __device_attach_driver+0x2a0/0x398
>>>>>    bus_for_each_drv+0x198/0x200
>>>>>    __device_attach+0x1c0/0x308
>>>>>    device_initial_probe+0x20/0x38
>>>>>    bus_probe_device+0x11c/0x1f8
>>>>>    deferred_probe_work_func+0x80/0x250
>>>>>    worker_thread+0x9b4/0x2780
>>>>>    kthread+0x274/0x350
>>>>>    ret_from_fork+0x10/0x20
>>>>>
>>>>>   Allocated by task 69:
>>>>>    kasan_save_track+0x40/0x78
>>>>>    kasan_save_alloc_info+0x44/0x58
>>>>>    __kasan_kmalloc+0x84/0xa0
>>>>>    __kmalloc_node_track_caller_noprof+0x228/0x450
>>>>>    devm_kmalloc+0x6c/0x288
>>>>>    devm_drm_panel_bridge_add_typed+0xa0/0x298
>>>>>    devm_drm_of_get_bridge+0xe8/0x190
>>>>>    mtk_dsi_host_attach+0x130/0x2b0
>>>>>    mipi_dsi_attach+0x8c/0xe8
>>>>>    hx83102_probe+0x1a8/0x368
>>>>>    mipi_dsi_drv_probe+0x6c/0x88
>>>>>    really_probe+0x1c4/0x698
>>>>>    __driver_probe_device+0x160/0x298
>>>>>    driver_probe_device+0x7c/0x2a8
>>>>>    __device_attach_driver+0x2a0/0x398
>>>>>    bus_for_each_drv+0x198/0x200
>>>>>    __device_attach+0x1c0/0x308
>>>>>    device_initial_probe+0x20/0x38
>>>>>    bus_probe_device+0x11c/0x1f8
>>>>>    deferred_probe_work_func+0x80/0x250
>>>>>    worker_thread+0x9b4/0x2780
>>>>>    kthread+0x274/0x350
>>>>>    ret_from_fork+0x10/0x20
>>>>>
>>>>>   Freed by task 69:
>>>>>    kasan_save_track+0x40/0x78
>>>>>    kasan_save_free_info+0x58/0x78
>>>>>    __kasan_slab_free+0x48/0x68
>>>>>    kfree+0xd4/0x750
>>>>>    devres_release_all+0x144/0x1e8
>>>>>    really_probe+0x48c/0x698
>>>>>    __driver_probe_device+0x160/0x298
>>>>>    driver_probe_device+0x7c/0x2a8
>>>>>    __device_attach_driver+0x2a0/0x398
>>>>>    bus_for_each_drv+0x198/0x200
>>>>>    __device_attach+0x1c0/0x308
>>>>>    device_initial_probe+0x20/0x38
>>>>>    bus_probe_device+0x11c/0x1f8
>>>>>    deferred_probe_work_func+0x80/0x250
>>>>>    worker_thread+0x9b4/0x2780
>>>>>    kthread+0x274/0x350
>>>>>    ret_from_fork+0x10/0x20
>>>>>
>>>>>   The buggy address belongs to the object at ffffff80c4e9e000
>>>>>    which belongs to the cache kmalloc-4k of size 4096
>>>>>   The buggy address is located 256 bytes inside of
>>>>>    freed 4096-byte region [ffffff80c4e9e000, ffffff80c4e9f000)
>>>>>
>>>>>   The buggy address belongs to the physical page:
>>>>>   head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
>>>>>   flags: 0x8000000000000040(head|zone=2)
>>>>>   page_type: f5(slab)
>>>>>   page: refcount:1 mapcount:0 mapping:0000000000000000
>>>>>   index:0x0 pfn:0x104e98
>>>>>   raw: 8000000000000040 ffffff80c0003040 dead000000000122 0000000000000000
>>>>>   raw: 0000000000000000 0000000000040004 00000001f5000000 0000000000000000
>>>>>   head: 8000000000000040 ffffff80c0003040 dead000000000122 0000000000000000
>>>>>   head: 0000000000000000 0000000000040004 00000001f5000000 0000000000000000
>>>>>   head: 8000000000000003 fffffffec313a601 ffffffffffffffff 0000000000000000
>>>>>   head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
>>>>>   page dumped because: kasan: bad access detected
>>>>>
>>>>>   Memory state around the buggy address:
>>>>>    ffffff80c4e9e000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>>>>    ffffff80c4e9e080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>>>>   >ffffff80c4e9e100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>>>>                      ^
>>>>>    ffffff80c4e9e180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>>>>    ffffff80c4e9e200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>>>> ===================================================================
>>>>>
>>>>> Signed-off-by: Fei Shao <fshao@chromium.org>
>>>> I was looking at the driver to try to follow your (awesome btw, thanks)
>>>> commit log, and it does have a quite different structure compared to
>>>> what we recommend.
>>>>
>>>> Would following
>>>> https://docs.kernel.org/gpu/drm-kms-helpers.html#special-care-with-mipi-dsi-bridges
>>>> help?
>>> Hi Maxime,
>>>
>>> Thank you for the pointer.
>>> I read the suggested pattern in the doc and compared it with the
>>> drivers. If I understand correctly, both the MIPI-DSI host and panel
>>> drivers follow the instructions:
>>>
>>> 1. The MIPI-DSI host driver must run mipi_dsi_host_register() in its probe hook.
>>>     >> drm/mediatek/mtk_dsi.c runs mipi_dsi_host_register() in the probe hook.
>>> 2. In its probe hook, the bridge driver must try to find its MIPI-DSI
>>> host, register as a MIPI-DSI device and attach the MIPI-DSI device to
>>> its host.
>>>     >> drm/panel/panel-himax-hx83102.c follows and runs
>>> mipi_dsi_attach() at the end of probe hook.
>>> 3. In its struct mipi_dsi_host_ops.attach hook, the MIPI-DSI host can
>>> now add its component.
>>>     >> drm/mediatek/mtk_dsi.c calls component_add() in the attach callback.
>>>
>>> Could you elaborate on the "different structures" you mentioned?
>> Yeah, you're right, sorry.
>>
>>> To clarify my point: the issue is that component_add() may return
>>> -EPROBE_DEFER if the component (e.g. DSI encoder) is not ready,
>>> causing the panel bridge to be removed. However, drm_bridge_remove()
>>> is bound to MIPI-DSI host instead of panel bridge, which owns the
>>> actual list_head object.
>>>
>>> This might be reproducible with other MIPI-DSI host + panel
>>> combinations by forcibly returning -EPROBE_DEFER in the host attach
>>> hook (verification with another device is needed), so the fix may be
>>> required in drm/bridge/panel.c.
>> Yeah, I think you're just hitting another bridge lifetime issue, and
>> it's not the only one unfortunately. Tying the bridge structure lifetime
>> itself to the device is wrong, it should be tied to the DRM device
>> lifetime instead.
> I think the more immediate issue is that the bridge object's lifetime
> and drm_bridge_add/remove are inconsistent when devm_drm_of_get_bridge()
> or drmm_of_get_bridge() are used.

Well, I think this is more of probe issue of multiple kernel modules.

The root issue is that the global bridge list still stores the
pointer to *old* the bridge instance which has been freed after
the first '-EPROBE_DEFER' happened. The next time the
'drm_bridge_add(&panel_bridge->bridge);' is called, we will deference
the *old* NULL pointer. Because it will touch the 'struct drm_bridge::list'
field, which's backing memory has been freed.


> These helpers tie the bridge add/removal to the device or drm_device
> passed in, but internally they call down to drm_panel_bridge_add_typed()
> which allocates the bridge object tied to the panel device.

When the devm_drm_panel_bridge_add_typed() is passed a pointer of
DSI host device, we essentially tie the lifetime of the freshly
created drm bridge instance to the DSI host device. But, the
'struct panel_bridge' clearly hint that the bridge instance has
the same lifetime with the backing panel, after all, it's the
underlying panel baking the bridge.

>> But then, the discussion becomes that bridges typically probe outside of
>> the "main" DRM device probe path, so you don't have access to the DRM
>> device structure until attach at best.
>>
>> That's why I'm a bit skeptical about your patch. It might workaround
>> your issue, but it doesn't actually solve the problem. I guess the best
>> way about it would be to convert bridges to reference counting, with the
>> device taking a reference at probe time when it allocates the structure
>> (and giving it back at remove time), and the DRM device taking one when
>> it's attached and one when it's detached.
> Without going as far, it's probably better to align the lifecycle of
> the two parts. Most other bridge drivers in the kernel have |drm_bridge|
> lifecycle tied to their underlying |device|, either with explicit
> drm_bridge_{add,remove}() calls in their probe/bind and remove/unbind
> callbacks respectively, or with devm_drm_bridge_add in the probe/bind
> path. The only ones with a narrower lifecycle are the DSI hosts, which
> add the bridge in during host attach and remove it during host detach.
>
> I'm thinking about fixing the panel_bridge lifecycle such that it is
> tied to the panel itself. Maybe that would involve making
> devm_drm_of_get_bridge() correctly return bridges even if a panel was
> found, and then making the panels create and add panel bridges directly,
> possibly within drm_panel_add(). Would that make sense?

I think, align the lifetime of the bridge with 'panel->dev' probably helps.
Modifying the devm_drm_of_get_bridge() function like the following pattern:


```

struct drm_bridge *devm_drm_of_get_bridge(struct device_node *np, u32 
port, u32 endpoint)
{
     struct drm_bridge *bridge;
     struct drm_panel *panel;
     int ret;

     ret = drm_of_find_panel_or_bridge(np, port, endpoint, &panel, &bridge);
     if (ret)
         return ERR_PTR(ret);

     if (panel)
         bridge = devm_drm_panel_bridge_add(panel->dev, panel);

     return bridge;
}

```


Or alternatively, inline this to drm/mediatek,
rename it as mtk_drm_of_get_bridge().

Or alternatively, manage the bridge's lifetime manually.
Remove it from the global bridge list if errors happen.


>
> Thanks
> ChenYu
>
>> It's much more involved than just another helper though :/
>>
>> Maxime

-- 
Best regards,
Sui

