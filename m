Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E8266BDCD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DDF10E3F5;
	Mon, 16 Jan 2023 12:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AF310E3F5;
 Mon, 16 Jan 2023 12:27:05 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 11F0E6008768;
 Mon, 16 Jan 2023 12:27:03 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id 7cdRpeg_D0dx; Mon, 16 Jan 2023 12:27:00 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id DB48C6008767;
 Mon, 16 Jan 2023 12:26:59 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1673872020;
 bh=XkE1A2YnrbrU2WIxkcPZ+PORJqR8hAkePFOr8rxfZuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=a8Xo4bkmsvTuqonsY4ekcnc5dvWH3mlZRjabBlWJkbOAWhp3rdDaUNODmHarhe2TH
 H7Go9Ii3nCMaTd4Sd+q5JKYVxcOiaBrFMkQ2Lf5zBefVAuViUjOY0seSUGsOYEmhfx
 7qpXOISRmKIcZZ9Ro8jMZa1ERBnEr5r0BQs6JiUo=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 4A87C360078;
 Mon, 16 Jan 2023 12:26:59 +0000 (WET)
Date: Mon, 16 Jan 2023 12:24:37 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: David Airlie <airlied@redhat.com>
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
Message-ID: <20230116122403.upk5ci4mbebw23m7@wslaptop>
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
 <CAMwc25rY4xpn0yvCScMr6Hk9pFSdvt=9QOypSQDfj1d5tWmtvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMwc25rY4xpn0yvCScMr6Hk9pFSdvt=9QOypSQDfj1d5tWmtvA@mail.gmail.com>
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
Cc: nouveau@lists.freedesktop.org, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 07:45:05AM +1000, David Airlie wrote:
> On Thu, Dec 29, 2022 at 12:58 AM Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> As a quick check can you try changing
> 
> drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_mem_target
> from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?

Hello!

Applying this change breaks probing in a different way, with a
bad PC=0x0. From a quick look at nvkm_falcon_load_dmem it looks like this
could happen due to the .load_dmem() callback not being properly
initialized. This is the kernel log I got:

[    2.010601] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    2.019436] Mem abort info:
[    2.022273]   ESR = 0x0000000086000005
[    2.026066]   EC = 0x21: IABT (current EL), IL = 32 bits
[    2.031429]   SET = 0, FnV = 0
[    2.034528]   EA = 0, S1PTW = 0
[    2.037694]   FSC = 0x05: level 1 translation fault
[    2.042572] [0000000000000000] user address but active_mm is swapper
[    2.048961] Internal error: Oops: 0000000086000005 [#1] SMP
[    2.054529] Modules linked in:
[    2.057582] CPU: 0 PID: 36 Comm: kworker/u8:1 Not tainted 6.2.0-rc3+ #2
[    2.064190] Hardware name: Google Pixel C (DT)
[    2.068628] Workqueue: events_unbound deferred_probe_work_func
[    2.074463] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.081417] pc : 0x0
[    2.083600] lr : nvkm_falcon_load_dmem+0x58/0x80
[    2.088218] sp : ffffffc009ddb6f0
[    2.091526] x29: ffffffc009ddb6f0 x28: ffffff808028a008 x27: ffffff8081e43c38
[    2.098658] x26: 00000000000000ff x25: ffffff808028a0a0 x24: 0000000000000000
[    2.105788] x23: ffffff8080c328f8 x22: 000000000000002c x21: 0000000000005fd4
[    2.112917] x20: ffffffc009ddb76c x19: ffffff8080c328b8 x18: 0000000000000000
[    2.120047] x17: 2e74696e695f646f x16: 6874656d5f77732f x15: 0000000000000000
[    2.127176] x14: 0000000002f546c2 x13: 0000000000000000 x12: 00000000000001ce
[    2.134306] x11: 0000000000000001 x10: 0000000000000a90 x9 : ffffffc009ddb600
[    2.141436] x8 : ffffff80803d19f0 x7 : ffffff80bf971180 x6 : 00000000000001b9
[    2.148565] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 000000000000002c
[    2.155693] x2 : 0000000000005fd4 x1 : ffffffc009ddb76c x0 : ffffff8080c328b8
[    2.162822] Call trace:
[    2.165264]  0x0
[    2.167099]  gm20b_pmu_init+0x78/0xb4
[    2.170762]  nvkm_pmu_init+0x20/0x34
[    2.174334]  nvkm_subdev_init_+0x60/0x12c
[    2.178339]  nvkm_subdev_init+0x60/0xa0
[    2.182171]  nvkm_device_init+0x14c/0x2a0
[    2.186178]  nvkm_udevice_init+0x60/0x9c
[    2.190097]  nvkm_object_init+0x48/0x1b0
[    2.194013]  nvkm_ioctl_new+0x168/0x254
[    2.197843]  nvkm_ioctl+0xd0/0x220
[    2.201239]  nvkm_client_ioctl+0x10/0x1c
[    2.205160]  nvif_object_ctor+0xf4/0x22c
[    2.209079]  nvif_device_ctor+0x28/0x70
[    2.212910]  nouveau_cli_init+0x150/0x590
[    2.216916]  nouveau_drm_device_init+0x60/0x2a0
[    2.221442]  nouveau_platform_device_create+0x90/0xd0
[    2.226489]  nouveau_platform_probe+0x3c/0x9c
[    2.230841]  platform_probe+0x68/0xc0
[    2.234500]  really_probe+0xbc/0x2dc
[    2.238070]  __driver_probe_device+0x78/0xe0
[    2.242334]  driver_probe_device+0xd8/0x160
[    2.246511]  __device_attach_driver+0xb8/0x134
[    2.250948]  bus_for_each_drv+0x78/0xd0
[    2.254782]  __device_attach+0x9c/0x1a0
[    2.258612]  device_initial_probe+0x14/0x20
[    2.262789]  bus_probe_device+0x98/0xa0
[    2.266619]  deferred_probe_work_func+0x88/0xc0
[    2.271142]  process_one_work+0x204/0x40c
[    2.275150]  worker_thread+0x230/0x450
[    2.278894]  kthread+0xc8/0xcc
[    2.281946]  ret_from_fork+0x10/0x20
[    2.285525] Code: bad PC value
[    2.288576] ---[ end trace 0000000000000000 ]---

Diogo
