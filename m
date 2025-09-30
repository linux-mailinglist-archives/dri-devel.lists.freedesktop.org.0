Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFEDBAE688
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 21:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3121C10E10E;
	Tue, 30 Sep 2025 19:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="KXgXqvF4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1DE10E10E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 19:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1759259546; x=1759864346; i=deller@gmx.de;
 bh=z0Rc5m2qmr19Zmeh0Nk0sXYjk+idgdE1XckZnK1Q7pE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KXgXqvF4cLQQZ58Qu1SpsWpTEIpZN854rTtfahSToCLfQBoJx0fBIJ6YxmJHe7ga
 XsoEx34HuiluTAqQTndwJWhsp1UGERCD5sq1y+cMGS7++bfMPaiS4qwrPDDTAVqsU
 VO+5su4yPNB4vTy09PLvSWWcBI4ELctPHZwvJO1xDJmeKmtBsgpKfZW/yqYez5dWc
 FsSduaAE6CuOZaKcjenLbng5Z9QxPR0Ofjm9oqYUvvXXZ4WLFiRWSXaqRI4sdHI5N
 t8nFvg1uesULb+ADo7/9xIEQ+Xc9D5gZ4jQqEBLv1mZ+YxPuNFbpmUgKN4OcAcjQa
 VjUIsre3IMbVv2RYVw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.4]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42jK-1v3flx27zk-004tEx; Tue, 30
 Sep 2025 21:12:26 +0200
Message-ID: <e0b113e6-8b3d-4d2d-b1b8-cd6609b8bca7@gmx.de>
Date: Tue, 30 Sep 2025 21:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fbdev/simplefb: Fix use after free in
 simplefb_detach_genpds()
To: Janne Grunau <j@jannau.net>, Hans de Goede <hansg@kernel.org>,
 Thierry Reding <treding@nvidia.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Huhardeaux <tech@tootai.net>,
 stable@vger.kernel.org
References: <20250915-simplefb-genpd-uaf-v3-1-5bb51506a5b9@jannau.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250915-simplefb-genpd-uaf-v3-1-5bb51506a5b9@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/egFcRtoPyYjNL5Mhd2avdQFEcyvdrZrc8j4K0JU61+f/qyc04N
 aJnRXIv22QkncvlbOPsndJXhCROViu+tBEmfvKmG4krIq1BtALnuPc3+OFXUafodMXBQWvP
 i1laZItaWWMlwJ5tKMCv/1O3vrkrBaaRnHFLo66aZTDYjOmhpah6dxuadvmAlh0tjyCdW83
 DqbOa7kGvPUBw0bByu16g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5kUEHptrL7s=;ujF//ywLIZip52pXnFORqleoTTc
 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
 Jqivw==
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

On 9/15/25 08:36, Janne Grunau wrote:
> The pm_domain cleanup can not be devres managed as it uses struct
> simplefb_par which is allocated within struct fb_info by
> framebuffer_alloc(). This allocation is explicitly freed by
> unregister_framebuffer() in simplefb_remove().
> Devres managed cleanup runs after the device remove call and thus can no
> longer access struct simplefb_par.
> Call simplefb_detach_genpds() explicitly from simplefb_destroy() like
> the cleanup functions for clocks and regulators.
>=20
> Fixes an use after free on M2 Mac mini during
> aperture_remove_conflicting_devices() using the downstream asahi kernel
> with Debian's kernel config. For unknown reasons this started to
> consistently dereference an invalid pointer in v6.16.3 based kernels.
>=20
> [    6.736134] BUG: KASAN: slab-use-after-free in simplefb_detach_genpds=
+0x58/0x220
> [    6.743545] Read of size 4 at addr ffff8000304743f0 by task (udev-wor=
ker)/227
> [    6.750697]
> [    6.752182] CPU: 6 UID: 0 PID: 227 Comm: (udev-worker) Tainted: G S  =
                6.16.3-asahi+ #16 PREEMPTLAZY
> [    6.752186] Tainted: [S]=3DCPU_OUT_OF_SPEC
> [    6.752187] Hardware name: Apple Mac mini (M2, 2023) (DT)
> [    6.752189] Call trace:
> [    6.752190]  show_stack+0x34/0x98 (C)
> [    6.752194]  dump_stack_lvl+0x60/0x80
> [    6.752197]  print_report+0x17c/0x4d8
> [    6.752201]  kasan_report+0xb4/0x100
> [    6.752206]  __asan_report_load4_noabort+0x20/0x30
> [    6.752209]  simplefb_detach_genpds+0x58/0x220
> [    6.752213]  devm_action_release+0x50/0x98
> [    6.752216]  release_nodes+0xd0/0x2c8
> [    6.752219]  devres_release_all+0xfc/0x178
> [    6.752221]  device_unbind_cleanup+0x28/0x168
> [    6.752224]  device_release_driver_internal+0x34c/0x470
> [    6.752228]  device_release_driver+0x20/0x38
> [    6.752231]  bus_remove_device+0x1b0/0x380
> [    6.752234]  device_del+0x314/0x820
> [    6.752238]  platform_device_del+0x3c/0x1e8
> [    6.752242]  platform_device_unregister+0x20/0x50
> [    6.752246]  aperture_detach_platform_device+0x1c/0x30
> [    6.752250]  aperture_detach_devices+0x16c/0x290
> [    6.752253]  aperture_remove_conflicting_devices+0x34/0x50
> ...
> [    6.752343]
> [    6.967409] Allocated by task 62:
> [    6.970724]  kasan_save_stack+0x3c/0x70
> [    6.974560]  kasan_save_track+0x20/0x40
> [    6.978397]  kasan_save_alloc_info+0x40/0x58
> [    6.982670]  __kasan_kmalloc+0xd4/0xd8
> [    6.986420]  __kmalloc_noprof+0x194/0x540
> [    6.990432]  framebuffer_alloc+0xc8/0x130
> [    6.994444]  simplefb_probe+0x258/0x2378
> ...
> [    7.054356]
> [    7.055838] Freed by task 227:
> [    7.058891]  kasan_save_stack+0x3c/0x70
> [    7.062727]  kasan_save_track+0x20/0x40
> [    7.066565]  kasan_save_free_info+0x4c/0x80
> [    7.070751]  __kasan_slab_free+0x6c/0xa0
> [    7.074675]  kfree+0x10c/0x380
> [    7.077727]  framebuffer_release+0x5c/0x90
> [    7.081826]  simplefb_destroy+0x1b4/0x2c0
> [    7.085837]  put_fb_info+0x98/0x100
> [    7.089326]  unregister_framebuffer+0x178/0x320
> [    7.093861]  simplefb_remove+0x3c/0x60
> [    7.097611]  platform_remove+0x60/0x98
> [    7.101361]  device_remove+0xb8/0x160
> [    7.105024]  device_release_driver_internal+0x2fc/0x470
> [    7.110256]  device_release_driver+0x20/0x38
> [    7.114529]  bus_remove_device+0x1b0/0x380
> [    7.118628]  device_del+0x314/0x820
> [    7.122116]  platform_device_del+0x3c/0x1e8
> [    7.126302]  platform_device_unregister+0x20/0x50
> [    7.131012]  aperture_detach_platform_device+0x1c/0x30
> [    7.136157]  aperture_detach_devices+0x16c/0x290
> [    7.140779]  aperture_remove_conflicting_devices+0x34/0x50
> ...
>=20
> Reported-by: Daniel Huhardeaux <tech@tootai.net>
> Cc: stable@vger.kernel.org
> Fixes: 92a511a568e44 ("fbdev/simplefb: Add support for generic power-dom=
ains")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v3:
> - release power-domains on probe errors
> - set par->num_genpds when it's <=3D 1
> - set par->num_genpds to 0 after detaching
> - Link to v2: https://lore.kernel.org/r/20250908-simplefb-genpd-uaf-v2-1=
-f88a0d9d880f@jannau.net
>=20
> Changes in v2:
> - reworked change due to missed use of `par->num_genpds` before setting
>    it. Missed in testing due to mixing up FB_SIMPLE and SYSFB_SIMPLEFB.
> - Link to v1: https://lore.kernel.org/r/20250901-simplefb-genpd-uaf-v1-1=
-0d9f3a34c4dc@jannau.net
> ---
>   drivers/video/fbdev/simplefb.c | 31 +++++++++++++++++++++++--------
>   1 file changed, 23 insertions(+), 8 deletions(-)

applied to fbdev git tree.
Thanks!
Helge

PS: Janne, if you want to push yourself via drm-misc, just let me know and=
 I drop it...
