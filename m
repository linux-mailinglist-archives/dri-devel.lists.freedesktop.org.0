Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D606365B20
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 16:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9606E504;
	Tue, 20 Apr 2021 14:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C6B6E504
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 14:27:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 347A1411;
 Tue, 20 Apr 2021 16:27:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1618928853;
 bh=FAaZltKSr1KCn+K+7V83ulqiVFN2D52i1dMFZhPJ8pU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JTy+MRbPV6/Kveye20qUlsrcSi9XjOr8o/o7Bp3AzWNc0v7Lo0/kikjdfGFEFoNYk
 C2LBPgY6mQFqOtY130rsPa1yqP4ESsSacDIHQruRp6IDNR2Jx1xWJwXQzp275jGafc
 YPgQcSBwwO8XTa6OxFOPn2e2VdvNyMOpGyTVWzqs=
Date: Tue, 20 Apr 2021 17:27:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 10/16] drm/exynos: implement a drm bridge
Message-ID: <YH7k0MMhWhtxDuYP@pendragon.ideasonboard.com>
References: <YBwbNeoMhTE7fIOb@phenom.ffwll.local>
 <e9a01089-8374-5b1a-0d80-17b83013ad44@samsung.com>
 <CAKMK7uHFVY7fGNv=nGik4u2WPrpHaXM1miGWvTSV7+EGOvnedg@mail.gmail.com>
 <YBwuPYZA5mIGMRWG@pendragon.ideasonboard.com>
 <CAKMK7uHnq20AJ-3KC7mrxT3ZmpQ24gnH+QS0V_b52380z+P12g@mail.gmail.com>
 <e227d43f-d727-f7f8-4424-8a79144ba77a@kontron.de>
 <20210218080418.GA21469@pengutronix.de>
 <d40bf461-ef25-a1c5-deab-72c5c3ffbdeb@samsung.com>
 <CAKMK7uF0B1TrtVX+9Whasz49quha_is+77z2wX3c06BsWRiPcQ@mail.gmail.com>
 <b3777fe9-2100-e230-552b-57b67866efb3@kontron.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3777fe9-2100-e230-552b-57b67866efb3@kontron.de>
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
Cc: ch@denx.de, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 sylvester.nawrocki@gmail.com, aford173@gmail.com, abel.vesa@nxp.com,
 aisheng.dong@nxp.com, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frieder,

On Tue, Apr 20, 2021 at 01:42:05PM +0200, Frieder Schrempf wrote:
> On 23.02.21 13:07, Daniel Vetter wrote:
> > On Thu, Feb 18, 2021 at 5:02 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >> W dniu 18.02.2021 o 09:04, Michael Tretter pisze:
> >>> On Wed, 10 Feb 2021 10:10:37 +0100, Frieder Schrempf wrote:
> >>>> On 04.02.21 18:46, Daniel Vetter wrote:
> >>>>> On Thu, Feb 4, 2021 at 6:26 PM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> >>>>>> On Thu, Feb 04, 2021 at 06:19:22PM +0100, Daniel Vetter wrote:
> >>>>>>> On Thu, Feb 4, 2021 at 5:28 PM Andrzej Hajda wrote:
> >>>>>>>> W dniu 04.02.2021 o 17:05, Daniel Vetter pisze:
> >>>>>>>>> On Thu, Feb 04, 2021 at 11:56:32AM +0100, Michael Tretter wrote:
> >>>>>>>>>> On Thu, 04 Feb 2021 11:17:49 +0100, Daniel Vetter wrote:
> >>>>>>>>>>> On Wed, Feb 3, 2021 at 9:32 PM Michael Tretter wrote:
> >>>>>>>>>>>> On Mon, 01 Feb 2021 17:33:14 +0100, Michael Tretter wrote:
> >>>>>>>>>>>>> On Tue, 15 Sep 2020 21:40:40 +0200, Andrzej Hajda wrote:
> >>>>>>>>>>>>>> W dniu 14.09.2020 o 23:19, Andrzej Hajda pisze:
> >>>>>>>>>>>>>>> On 14.09.2020 22:01, Michael Tretter wrote:
> >>>>>>>>>>>>>>>> On Mon, 14 Sep 2020 14:31:19 +0200, Marek Szyprowski wrote:
> >>>>>>>>>>>>>>>>> On 14.09.2020 10:29, Marek Szyprowski wrote:
> >>>>>>>>>>>>>>>>>> On 11.09.2020 15:54, Michael Tretter wrote:
> >>>>>>>>>>>>>>>>>>> Make the exynos_dsi driver a full drm bridge that can be found and
> >>>>>>>>>>>>>>>>>>> used
> >>>>>>>>>>>>>>>>>>> from other drivers.
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> Other drivers can only attach to the bridge, if a mipi dsi device
> >>>>>>>>>>>>>>>>>>> already attached to the bridge. This allows to defer the probe of the
> >>>>>>>>>>>>>>>>>>> display pipe until the downstream bridges are available, too.
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> >>>>>>>>>>>>>>>>>> This one (and the whole series applied) still fails on Exynos boards:
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping
> >>>>>>>>>>>>>>>>>> operations
> >>>>>>>>>>>>>>>>>> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
> >>>>>>>>>>>>>>>>>> OF: graph: no port node found in /soc/dsi@11c80000
> >>>>>>>>>>>>>>>>>> 8<--- cut here ---
> >>>>>>>>>>>>>>>>>> Unable to handle kernel NULL pointer dereference at virtual address
> >>>>>>>>>>>>>>>>>> 00000084
> >>>>>>>>>>>>>>>>>> pgd = (ptrval)
> >>>>>>>>>>>>>>>>>> [00000084] *pgd=00000000
> >>>>>>>>>>>>>>>>>> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> >>>>>>>>>>>>>>>>>> Modules linked in:
> >>>>>>>>>>>>>>>>>> CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> >>>>>>>>>>>>>>>>>> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec #1608
> >>>>>>>>>>>>>>>>>> Hardware name: Samsung Exynos (Flattened Device Tree)
> >>>>>>>>>>>>>>>>>> PC is at drm_bridge_attach+0x18/0x164
> >>>>>>>>>>>>>>>>>> LR is at exynos_dsi_bind+0x88/0xa8
> >>>>>>>>>>>>>>>>>> pc : [<c0628c08>]    lr : [<c064d560>]    psr: 20000013
> >>>>>>>>>>>>>>>>>> sp : ef0dfca8  ip : 00000002  fp : c13190e0
> >>>>>>>>>>>>>>>>>> r10: 00000000  r9 : ee46d580  r8 : c13190e0
> >>>>>>>>>>>>>>>>>> r7 : ee438800  r6 : 00000018  r5 : ef253810  r4 : ef39e840
> >>>>>>>>>>>>>>>>>> r3 : 00000000  r2 : 00000018  r1 : ef39e888  r0 : ef39e840
> >>>>>>>>>>>>>>>>>> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> >>>>>>>>>>>>>>>>>> Control: 10c5387d  Table: 4000404a  DAC: 00000051
> >>>>>>>>>>>>>>>>>> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> >>>>>>>>>>>>>>>>>> Stack: (0xef0dfca8 to 0xef0e0000)
> >>>>>>>>>>>>>>>>>> ...
> >>>>>>>>>>>>>>>>>> [<c0628c08>] (drm_bridge_attach) from [<c064d560>]
> >>>>>>>>>>>>>>>>>> (exynos_dsi_bind+0x88/0xa8)
> >>>>>>>>>>>>>>>>>> [<c064d560>] (exynos_dsi_bind) from [<c066a800>]
> >>>>>>>>>>>>>>>>>> (component_bind_all+0xfc/0x290)
> >>>>>>>>>>>>>>>>>> [<c066a800>] (component_bind_all) from [<c0649dc0>]
> >>>>>>>>>>>>>>>>>> (exynos_drm_bind+0xe4/0x19c)
> >>>>>>>>>>>>>>>>>> [<c0649dc0>] (exynos_drm_bind) from [<c066ad74>]
> >>>>>>>>>>>>>>>>>> (try_to_bring_up_master+0x1e4/0x2c4)
> >>>>>>>>>>>>>>>>>> [<c066ad74>] (try_to_bring_up_master) from [<c066b2b4>]
> >>>>>>>>>>>>>>>>>> (component_master_add_with_match+0xd4/0x108)
> >>>>>>>>>>>>>>>>>> [<c066b2b4>] (component_master_add_with_match) from [<c0649ae8>]
> >>>>>>>>>>>>>>>>>> (exynos_drm_platform_probe+0xe4/0x110)
> >>>>>>>>>>>>>>>>>> [<c0649ae8>] (exynos_drm_platform_probe) from [<c0674e6c>]
> >>>>>>>>>>>>>>>>>> (platform_drv_probe+0x6c/0xa4)
> >>>>>>>>>>>>>>>>>> [<c0674e6c>] (platform_drv_probe) from [<c067242c>]
> >>>>>>>>>>>>>>>>>> (really_probe+0x200/0x4fc)
> >>>>>>>>>>>>>>>>>> [<c067242c>] (really_probe) from [<c06728f0>]
> >>>>>>>>>>>>>>>>>> (driver_probe_device+0x78/0x1fc)
> >>>>>>>>>>>>>>>>>> [<c06728f0>] (driver_probe_device) from [<c0672cd8>]
> >>>>>>>>>>>>>>>>>> (device_driver_attach+0x58/0x60)
> >>>>>>>>>>>>>>>>>> [<c0672cd8>] (device_driver_attach) from [<c0672dbc>]
> >>>>>>>>>>>>>>>>>> (__driver_attach+0xdc/0x174)
> >>>>>>>>>>>>>>>>>> [<c0672dbc>] (__driver_attach) from [<c06701b4>]
> >>>>>>>>>>>>>>>>>> (bus_for_each_dev+0x68/0xb4)
> >>>>>>>>>>>>>>>>>> [<c06701b4>] (bus_for_each_dev) from [<c06714e8>]
> >>>>>>>>>>>>>>>>>> (bus_add_driver+0x158/0x214)
> >>>>>>>>>>>>>>>>>> [<c06714e8>] (bus_add_driver) from [<c0673c1c>]
> >>>>>>>>>>>>>>>>>> (driver_register+0x78/0x110)
> >>>>>>>>>>>>>>>>>> [<c0673c1c>] (driver_register) from [<c0649ca8>]
> >>>>>>>>>>>>>>>>>> (exynos_drm_init+0xe4/0x118)
> >>>>>>>>>>>>>>>>>> [<c0649ca8>] (exynos_drm_init) from [<c0102484>]
> >>>>>>>>>>>>>>>>>> (do_one_initcall+0x8c/0x42c)
> >>>>>>>>>>>>>>>>>> [<c0102484>] (do_one_initcall) from [<c11011c0>]
> >>>>>>>>>>>>>>>>>> (kernel_init_freeable+0x190/0x1dc)
> >>>>>>>>>>>>>>>>>> [<c11011c0>] (kernel_init_freeable) from [<c0af7880>]
> >>>>>>>>>>>>>>>>>> (kernel_init+0x8/0x118)
> >>>>>>>>>>>>>>>>>> [<c0af7880>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
> >>>>>>>>>>>>>>>>>> Exception stack(0xef0dffb0 to 0xef0dfff8)
> >>>>>>>>>>>>>>>>>> ...
> >>>>>>>>>>>>>>>>>> ---[ end trace ee27f313f9ed9da1 ]---
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> # arm-linux-gnueabi-addr2line -e vmlinux c0628c08
> >>>>>>>>>>>>>>>>>> drivers/gpu/drm/drm_bridge.c:184 (discriminator 1)
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> I will try to debug it a bit more today.
> >>>>>>>>>>>>>>>>> The above crash has been caused by lack of in_bridge initialization to
> >>>>>>>>>>>>>>>>> NULL in exynos_dsi_bind() in this patch. However, fixing it reveals
> >>>>>>>>>>>>>>>>> another issue:
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
> >>>>>>>>>>>>>>>>> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
> >>>>>>>>>>>>>>>>> OF: graph: no port node found in /soc/dsi@11c80000
> >>>>>>>>>>>>>>>>> 8<--- cut here ---
> >>>>>>>>>>>>>>>>> Unable to handle kernel NULL pointer dereference at virtual address
> >>>>>>>>>>>>>>>>> 00000280
> >>>>>>>>>>>>>>>>> pgd = (ptrval)
> >>>>>>>>>>>>>>>>> [00000280] *pgd=00000000
> >>>>>>>>>>>>>>>>> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> >>>>>>>>>>>>>>>>> Modules linked in:
> >>>>>>>>>>>>>>>>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> >>>>>>>>>>>>>>>>> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec-dirty #1613
> >>>>>>>>>>>>>>>>> Hardware name: Samsung Exynos (Flattened Device Tree)
> >>>>>>>>>>>>>>>>> PC is at __mutex_lock+0x54/0xb18
> >>>>>>>>>>>>>>>>> LR is at lock_is_held_type+0x80/0x138
> >>>>>>>>>>>>>>>>> pc : [<c0afc920>]    lr : [<c0af63e8>]    psr: 60000013
> >>>>>>>>>>>>>>>>> sp : ef0dfd30  ip : 33937b74  fp : c13193c8
> >>>>>>>>>>>>>>>>> r10: c1208eec  r9 : 00000000  r8 : ee45f808
> >>>>>>>>>>>>>>>>> r7 : c19561a4  r6 : 00000000  r5 : 00000000  r4 : 0000024c
> >>>>>>>>>>>>>>>>> r3 : 00000000  r2 : 00204140  r1 : c124f13c  r0 : 00000000
> >>>>>>>>>>>>>>>>> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> >>>>>>>>>>>>>>>>> Control: 10c5387d  Table: 4000404a  DAC: 00000051
> >>>>>>>>>>>>>>>>> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> >>>>>>>>>>>>>>>>> Stack: (0xef0dfd30 to 0xef0e0000)
> >>>>>>>>>>>>>>>>> ...
> >>>>>>>>>>>>>>>>> [<c0afc920>] (__mutex_lock) from [<c0afd400>]
> >>>>>>>>>>>>>>>>> (mutex_lock_nested+0x1c/0x24)
> >>>>>>>>>>>>>>>>> [<c0afd400>] (mutex_lock_nested) from [<c064d4b8>]
> >>>>>>>>>>>>>>>>> (__exynos_dsi_host_attach+0x20/0x6c)
> >>>>>>>>>>>>>>>>> [<c064d4b8>] (__exynos_dsi_host_attach) from [<c064d914>]
> >>>>>>>>>>>>>>>>> (exynos_dsi_host_attach+0x70/0x194)
> >>>>>>>>>>>>>>>>> [<c064d914>] (exynos_dsi_host_attach) from [<c0656b64>]
> >>>>>>>>>>>>>>>>> (s6e8aa0_probe+0x1b0/0x218)
> >>>>>>>>>>>>>>>>> [<c0656b64>] (s6e8aa0_probe) from [<c0672530>]
> >>>>>>>>>>>>>>>>> (really_probe+0x200/0x4fc)
> >>>>>>>>>>>>>>>>> [<c0672530>] (really_probe) from [<c06729f4>]
> >>>>>>>>>>>>>>>>> (driver_probe_device+0x78/0x1fc)
> >>>>>>>>>>>>>>>>> [<c06729f4>] (driver_probe_device) from [<c0672ddc>]
> >>>>>>>>>>>>>>>>> (device_driver_attach+0x58/0x60)
> >>>>>>>>>>>>>>>>> [<c0672ddc>] (device_driver_attach) from [<c0672ec0>]
> >>>>>>>>>>>>>>>>> (__driver_attach+0xdc/0x174)
> >>>>>>>>>>>>>>>>> [<c0672ec0>] (__driver_attach) from [<c06702b8>]
> >>>>>>>>>>>>>>>>> (bus_for_each_dev+0x68/0xb4)
> >>>>>>>>>>>>>>>>> [<c06702b8>] (bus_for_each_dev) from [<c06715ec>]
> >>>>>>>>>>>>>>>>> (bus_add_driver+0x158/0x214)
> >>>>>>>>>>>>>>>>> [<c06715ec>] (bus_add_driver) from [<c0673d20>]
> >>>>>>>>>>>>>>>>> (driver_register+0x78/0x110)
> >>>>>>>>>>>>>>>>> [<c0673d20>] (driver_register) from [<c0102484>]
> >>>>>>>>>>>>>>>>> (do_one_initcall+0x8c/0x42c)
> >>>>>>>>>>>>>>>>> [<c0102484>] (do_one_initcall) from [<c11011c0>]
> >>>>>>>>>>>>>>>>> (kernel_init_freeable+0x190/0x1dc)
> >>>>>>>>>>>>>>>>> [<c11011c0>] (kernel_init_freeable) from [<c0af7988>]
> >>>>>>>>>>>>>>>>> (kernel_init+0x8/0x118)
> >>>>>>>>>>>>>>>>> [<c0af7988>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
> >>>>>>>>>>>>>>>>> Exception stack(0xef0dffb0 to 0xef0dfff8)
> >>>>>>>>>>>>>>>>> ...
> >>>>>>>>>>>>>>>>> ---[ end trace c06e996ec2e8234d ]---
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> This means that dsi->encoder.dev is not initialized in
> >>>>>>>>>>>>>>>>> __exynos_dsi_host_attach().
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> This happens, because drm_bridge_attach() in exynos_dsi_bind() returned
> >>>>>>>>>>>>>>>>> earlier -517 (deferred probe), what causes cleanup of encoder and
> >>>>>>>>>>>>>>>>> release of all drm resources.
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> Then however, the panel tries to register itself and
> >>>>>>>>>>>>>>>>> exynos_dsi_host_attach() tries to access the released encoder (which is
> >>>>>>>>>>>>>>>>> zeroed in drm_encoder_release) and rest of resources, what causes
> >>>>>>>>>>>>>>>>> failure.
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> It looks that something is missing. Maybe mipi host has to be
> >>>>>>>>>>>>>>>>> registered
> >>>>>>>>>>>>>>>>> later, when bridge is ready? I have no idea how it is handled before
> >>>>>>>>>>>>>>>>> this patch. Andrzej, could you comment it a bit?
> >>>>>>>>>>>>>>>> I intentionally changed the order, because if another bridge follows
> >>>>>>>>>>>>>>>> in the
> >>>>>>>>>>>>>>>> pipeline, the probe of the drm driver has to be deferred until some
> >>>>>>>>>>>>>>>> bridge
> >>>>>>>>>>>>>>>> provides a connector. The next bridge registers itself via the
> >>>>>>>>>>>>>>>> host_attach
> >>>>>>>>>>>>>>>> function and the deferral is ensured via the bind for the bind/unbind
> >>>>>>>>>>>>>>>> API or
> >>>>>>>>>>>>>>>> the bridge_attach function otherwise.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> On the other hand, the bridge does not have an encoder until the mipi
> >>>>>>>>>>>>>>>> device
> >>>>>>>>>>>>>>>> has been attached.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> As a solution, the exynos dsi driver must initialize the encoder in
> >>>>>>>>>>>>>>>> exynos_dsi_probe instead of in exynos_dsi_bind and access the encoder
> >>>>>>>>>>>>>>>> via
> >>>>>>>>>>>>>>>> exynos_dsi instead of the bridge.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Can you try to move everything except samsung_dsim_bind from
> >>>>>>>>>>>>>>>> exynos_dsi_bind
> >>>>>>>>>>>>>>>> to exynos_dsi_probe (respectively for unbind) and report if it fixes the
> >>>>>>>>>>>>>>>> crash.
> >>>>>>>>>>>>>>> The original behaviour is that encoder (exynos_dsi) is registered
> >>>>>>>>>>>>>>> regardless of sink presence (initially panel, later also bridge) - it
> >>>>>>>>>>>>>>> avoids multiple issues with deferred probe, device driver bind/unbind
> >>>>>>>>>>>>>>> and module load/unload. Appearance or disappearance of sink is
> >>>>>>>>>>>>>>> reported to host nicely via DSI attach/detach callbacks - and it is
> >>>>>>>>>>>>>>> reflected in drm world as change state of the connector.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Registering DSI host in bind and unregistering in unbind assures that
> >>>>>>>>>>>>>>> if mipi_dsi device is attached/detached the drm device is always
> >>>>>>>>>>>>>>> present - it makes device/driver binding race free and allows to avoid
> >>>>>>>>>>>>>>> additional locking.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Moving DSI host registration to probe changes everything, for sure it
> >>>>>>>>>>>>>>> breaks the nice feature of DSI attach/detach callbacks and apparently
> >>>>>>>>>>>>>>> can cause different issues depending on device bind order.
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> I will try to look at the patches tomorrow and maybe I can find more
> >>>>>>>>>>>>>>> constructive comments :)
> >>>>>>>>>>>>>> As I said yesterday, exynos_dsi driver uses dsi host attach/detach
> >>>>>>>>>>>>>> callbacks to control appearance/disappearance of downstream device. It
> >>>>>>>>>>>>>> allows to:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> 1. Safely bind/unbind different device drivers at any time and at any
> >>>>>>>>>>>>>> order, without killing exynos_drm and/or crashing system.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> 2. Avoid issues with late drm init - on some platforms exynos_drm device
> >>>>>>>>>>>>>> appeared too late, due to deferred probe, and resulted in black screen
> >>>>>>>>>>>>>> in userspace.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Now if we want to convert exynos_dsi to drm_bridge I see following options:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> A. Forgot about callbacks and make the exynos_drm to defer probing until
> >>>>>>>>>>>>>> exynos_dsi bridge is available, probably it will cause later exynos_drm
> >>>>>>>>>>>>>> appearance, thus probably black screen on some targets. So for sure it
> >>>>>>>>>>>>>> will be suboptimal. Making it bridge unbind safe would be another
> >>>>>>>>>>>>>> problem, but most developers do not care about it so why should we? :)
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> B. Try to mimic current behaviour - exynos_dsi register bridge ASAP,
> >>>>>>>>>>>>>> even if downstream devices are not yet attached, on attach/detach notify
> >>>>>>>>>>>>>> drm about it via connector status change, for this dsi_host registration
> >>>>>>>>>>>>>> should be performed from drm_bridge attach, I guess.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Option A is more standard, but is unsafe and causes other issues.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Option B keeps current behaviour.
> >>>>>>>>>>>>> Maybe we can have both, but I am not sure, if I am missing something:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I still prefer option A for the samsung-dsim driver, because it is more
> >>>>>>>>>>>>> standard, simpler and avoids issues with encoders, connectors or handling
> >>>>>>>>>>>>> hotplug.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> The idea is to use two bridges in the exynos-dsi driver: One bridge in the
> >>>>>>>>>>>>> samsung-dsim driver which implements option A and defers probing of the drm
> >>>>>>>>>>>>> driver until the next bridge is attached. And a second bridge in the
> >>>>>>>>>>>>> exynos_dsi that attaches to the first bridge (thus, allowing the exynos_drm
> >>>>>>>>>>>>> device to appear) and implements the hotplug handling for notifying drm via
> >>>>>>>>>>>>> connector status change.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> The driver for the i.MX8M would use the samsung-dsim bridge without an
> >>>>>>>>>>>>> additional bridge.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> This allows the samsung-dsim driver to expose the standard behavior while the
> >>>>>>>>>>>>> exynos_dsi may stick to the existing behavior for the exynos_drm driver.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I hope this makes sense and does not sound too crazy. It might be difficult to
> >>>>>>>>>>>>> get the probing and mipi host/device registration correct, but I will try, if
> >>>>>>>>>>>>> this can work.
> >>>>>>>>>>>> Adding two bridges for being able to support hotplugging adds many special
> >>>>>>>>>>>> cases to the bridge driver and still requires more custom API to correctly add
> >>>>>>>>>>>> the second bridge. I don't think that this a viable path to go.
> >>>>>>>>>>> Just jumping in here: You cannot hotplug/hotremove anything from a
> >>>>>>>>>>> drm_device after drm_dev_register has been called, except
> >>>>>>>>>>> drm_connector. I didn't dig into details here so not sure whether you
> >>>>>>>>>>> want to late-bind your bridge after drm_dev_register is called or not,
> >>>>>>>>>>> so might just be fyi and not relevant to the discussion.
> >>>>>>>>>> Thanks. AFAIC that is exactly what is currently implemented in the exynos_drm
> >>>>>>>>>> driver (i.e. Option B)
> >>>>>>>>>>
> >>>>>>>>>> exynos_dsi_bind configures the encoder and registers a DSI host. Afterwards,
> >>>>>>>>>> exynos_drm_bind (as component_master_ops) calls drm_dev_register. Later, a DSI
> >>>>>>>>>> device might attach to the DSI host and call exynos_dsi_host_attach. In
> >>>>>>>>>> exynos_dsi_host_attach, the driver finds the drm_bridge for the DSI device and
> >>>>>>>>>> attaches this bridge to the encoder _after_ drm_dev_register has been called.
> >>>>>>>>>> This is invalid behavior, right?
> >>>>>>>>> Definitely not supported, I don't think we have the right locks in place
> >>>>>>>>> to make sure this works.
> >>>>>>>>>
> >>>>>>>>> Now if your _only_ adding a drm_bridge (and not an encoder or anything
> >>>>>>>>> like that), and you are adding the drm_connector correctly (like a
> >>>>>>>>> hotplugged DP MST sink), then that would at least work from a uapi pov.
> >>>>>>>>> Because drm_bridge isn't exposed as an uapi object.
> >>>>>>>>>
> >>>>>>>>> But yeah, as-is, don't :-)
> >>>>>>>>>
> >>>>>>>>> The solution here is a bunch of EPROBE_DEFER handling until all your
> >>>>>>>>> bridges are loaded, with or without the assistance of component.c
> >>>>>>>>> framework. Only then call drm_dev_register.
> >>>>>>>> I have impression we have similar conversation already.
> >>>>>>>>
> >>>>>>>> As you stated drm_bridge and drm_panel are not exposed to userspace so
> >>>>>>>> there shouldn't be problem with them from uapi PoV.
> >>>>>>>>
> >>>>>>>> On the other side drm_panel or drm_bridge are not used until pipeline
> >>>>>>>> enters connected state (at least they were not some time ago :) ). The
> >>>>>>>> issue is that bridge exposes drm_connector, but as you stated (again :)
> >>>>>>>> ) connectors can be hotplugged, so in theory it should work. Practical
> >>>>>>>> tests shows that it also works, but bugs can be still there.
> >>>>>>>>
> >>>>>>>> Bunch of EPROBE_DEFER was very slow (as a result userspace timeouted and
> >>>>>>>> decided there is no display), and does not handle unbinding/re-binding
> >>>>>>>> drivers.
> >>>>>>> Rebinding drivers should be fixed now, with a bunch of fixes in driver
> >>>>>>> core. If not, we need to fix this more.
> >>>>>>>
> >>>>>>> Also, EPROBE_DEFER is how this is supposed to work. If it's too slow,
> >>>>>>> we need to fix EPROBE_DEFER (there's ideas for pre-sorting that never
> >>>>>>> seem to go anywhere), not paper over it with bad architecture in
> >>>>>>> drivers.
> >>>>>> I've heard this argument multiple times, but it sounds more like an
> >>>>>> attempt to ignore the problem and hope it will fall on someone else's
> >>>>>> plate :-) Improvement in the probe deferral mechanism are certainly an
> >>>>>> option to explore, but as far as I can tell nobody has proven that this
> >>>>>> mechanism is or will be able to solve all problems related to probe
> >>>>>> ordering dependencies. I wouldn't rule out the need for different
> >>>>>> solutions for some of the issues.
> >>>>> Then build another one. But adding hotplug for stuff that is there,
> >>>>> and shouldn't be hotplugged, just because it's easier on driver
> >>>>> writers and harder on userspace isn't really a good approach.
> >>>>> -Daniel
> >>>> I think it is quite clear that replacing or reworking the deferral mechanism
> >>>> is out of scope for this discussion, which is why I would like to come back
> >>>> to the original issue and sum this up as far as I understand it (which is
> >>>> not really far when it comes to the details):
> >>>>
> >>>> We have the existing exynos driver that avoids the standard deferral
> >>>> mechanism in favor of something that works but Daniel describes as
> >>>> "definitely not supported".
> >>>>
> >>>> We have a proposal from Michael for converting the driver to the standard
> >>>> drm_bridge behavior and more work from Michael and Marek based on this to
> >>>> implement the platform specific parts for i.MX8MM.
> >>>>
> >>>>   From the i.MX8MM POV this approach already received some testing and looks
> >>>> good as far as I can judge. Upstreaming this solution is blocked because of
> >>>> objections from the Samsung maintainers.
> >>>>
> >>>> Sorry if I'm being blunt or naive, but where to go from here?
> >>>>
> >>> Maybe some more information by the Samsung maintainers would help:
> >>>
> >>> If I understand correctly, the main reason for the non-standard behavior is a
> >>> userspace application that runs into a timeout if the drm-device does not
> >>> appear in time. Correct? Is there something we can do about that?
> >>>
> >>> The other reason is the convenience of binding and unbinding a bridge driver,
> >>> while the drm device is kept available. Correct? Is this used in development,
> >>> testing, or production?
> >>>
> >>> Is there anything else that prevents the exynos drm from switching to the
> >>> standard behavior?
> >>>
> >>> Would a exynos drm specific wrapper, which uses a standard bridge driver but
> >>> exposes the non-standard behavior, be acceptable? (Unfortunately, my first try
> >>> on something like that felt really awkward and didn't really work.)
> >>
> >> Even if we drop this 'non-standard' behaviour, your task will be still
> >> quite difficult to fulfil - you are trying to completely rewrite core
> >> component of Exynos display pipeline without hardware to test.
> >>
> >> ExynosDSI is used in almost all Exynos platforms supported mainline (ls
> >> -1 arch/arm*/boot/dts/exynos*.dts | wc shows 35). It has different hw
> >> versions (4 compatibles) and is used in different configurations (video
> >> mode, command mode, with hw/sw trigger, connected to panels/bridges) and
> >> for sure with big heritage, since it was one of the 1st DSI drivers.
> >>
> >> Rewriting such driver is challenging, even with access to hw.
> >>
> >> So maybe it would be better to move common parts in your and exynos
> >> driver to 'shared library' and use it in both drivers - this way you
> >> have bigger chances to avoid traps.
> > 
> > If exynos really can't be fixed up in a reasonable way, then I think
> > sharing code doesn't make much sense - you drag the new driver down
> > with the old one that's just hanging in there the wrong way round. For
> > that case just copypaste the exynos code into a new clean drm_bridge
> > driver, and done.
> > 
> > That would also mean that new exynos support in drm/exynos would need
> > to be stalled until this is sorted out (at least for new platforms),
> > since continuing the old way really doesn't sound so great. Wouldn't
> > be the first time we just end up with a driver fork because the old
> > one has too much heritage and is too hard to change.
> > 
> > Note that this can also be done within one driver codebase, e.g.
> > nouveau has still legacy modeset code for nv04-nv4x, and atomic from
> > nv50+ going forward.
> > 
> > Should be possible to find a pragmatic solution here going forward,
> > despite tons of hw and heritage. If we use existing hard to retest hw
> > support to stop new driver submissions from doing the right thing,
> > that's a clear failure, we need a better approach here.
> > -Daniel
> 
> Right, and I just wanted to add that there seems to be a similar (maybe 
> less complex?) situation for the CSIS CSI controller. In that case we 
> already have two separate drivers for pretty much the same hardware in 
> the media subsystem, media/platform/exynos4-is/mipi-csis.c for the 
> exynos and staging/media/imx/imx7-mipi-csis.c for the imx.

And we would have at least a third on in
staging/media/imx/imx8-mipi-csi2-sam.c if we followed the NXP BSP :-)
I've added support for i.MX8 to the imx7-mipi-csis driver recently, and
I'm half-tempted to merge it with the
media/platform/exynos4-is/mipi-csis.c driver at some point. Lack of
Exynos test hardware and documentation, as well as of time, will likely
prevent that from happening, but if someone wanted to give it a go, it
would be nice.

> I don't know the history for this, but it just came to my mind that this 
> case is related and it might be interesting for the scope of this 
> discussion.

I think staging/media/imx/imx7-mipi-csis.c was developed in the NXP BSP,
and we merged it upstream without realizing it was the same IP core as
media/platform/exynos4-is/mipi-csis.c.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
