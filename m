Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ADD7A758F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 10:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70C110E44C;
	Wed, 20 Sep 2023 08:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629F410E44C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 08:14:31 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D089E66028F5;
 Wed, 20 Sep 2023 09:14:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695197670;
 bh=1e8q+d/6RPKNpDnVx3tWXFTrcuU/h2HMkgY3Nszj55U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DH7xuXMftB1IpSUVgXPoyrOWUSpRySN78E7Th1wZgJBx2TcepMQXdz599XJqb6OiV
 nGLsDYigSnCRG//XR2UH0VYAvHVzo9oliqsdinZyt6TC6/XpivMSNrhiu/+azB6w2l
 rRNRYmnG5GhuUDFylOJAoaapeRLFuSgwHok4RfygPJEYe43BXejB6/6o695egj0MPc
 irsB90RNtdjHqSjXvgTYhUI0t1T01pyziT5Mu5dyKpEmpWabQVjDgecPggapNv0hvA
 w+Jbwi20S/EsJZE2cti5Q2GpcTMUYw0jWy6uWH8XkC5bQpHvOsTgXz52CNLsi33XuG
 +FKi+5BVRxfdw==
Message-ID: <6dd87d1b-255f-aeea-0445-37d34d242282@collabora.com>
Date: Wed, 20 Sep 2023 10:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: PROBLEM: MT8192 panel_edp_probe trace despite recent eDP and
 aux-bus support patches
Content-Language: en-US
To: Leonard Lausen <leonard@lausen.nl>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <ca32347a879c794577f272a1473e44ee39f2acdc@lausen.nl>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ca32347a879c794577f272a1473e44ee39f2acdc@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 20/09/23 02:58, Leonard Lausen ha scritto:
> Dear AngeloGioacchino, Dear Maintainers,
> 
> on MT8192 Asurada Spherion (Acer 514), I observe the following trace related to
> eDP and aux-bus during bootup with tags/mediatek-drm-next-6.6 merged to v6.5.4
> as well as on plain v6.5.4. Despite the trace, the laptop display works. Given
> your recent eDP and aux-bus support patches are included in
> tags/mediatek-drm-next-6.6, I thought reporting this may be helpful. (I'm
> unable to validate v6.6-rc2 currently, as there's a regression breaking boot.)
> 

Hello Leonard,
thanks for sending me this snippet.

This is not in any way connected to my eDP/aux-bus patch series, infact this
warning happens because your machine has got a new/different panel, read below:

	if (WARN_ON(!panel->detected_panel)) {
		dev_warn(dev,
			 "Unknown panel %s %#06x, using conservative timings\n",
			 vend, product_id);

[    4.089721] panel-simple-dp-aux aux-3-0058: Unknown panel CMN 0x142b, using 
conservative timings

I'll try to retrieve informations about this new panel and add it to panel-edp
as soon as possible.

Thanks!
Angelo

> [    3.808189] ------------[ cut here ]------------
> [    3.812840] WARNING: CPU: 7 PID: 10 at drivers/gpu/drm/panel/panel-edp.c:758 panel_edp_probe+0x488/0x4f0
> [    3.822370] Modules linked in:
> [    3.825428] CPU: 7 PID: 10 Comm: kworker/u16:0 Not tainted 6.5.4-cos-mt9+ #1
> [    3.832476] Hardware name: Google Spherion (rev0 - 3) (DT)
> [    3.837959] Workqueue: events_unbound deferred_probe_work_func
> [    3.843797] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    3.850757] pc : panel_edp_probe+0x488/0x4f0
> [    3.855025] lr : panel_edp_probe+0x29c/0x4f0
> [    3.859291] sp : ffff8000800d3710
> [    3.862600] x29: ffff8000800d3710 x28: 0000000000000000 x27: 0000000000000000
> [    3.869737] x26: ffff60b44002d005 x25: ffffa4a68e990418 x24: 0000000000000000
> [    3.875193] usb 1-1: new high-speed USB device number 2 using xhci-mtk
> [    3.876862] x23: ffff60b446542680 x22: ffffa4a68db8d5b0 x21: ffff60b4452d0000
> [    3.876869] x20: 0000000000000000 x19: ffff60b441052480 x18: 00000000000a8360
> [    3.876873] x17: 001fffffffffffff x16: 0000000000000000 x15: 0000000000000001
> [    3.904812] x14: 000000000060f827 x13: 9b00200a4341452d x12: 0000000000000000
> [    3.911948] x11: 0000000000000001 x10: 0000000000000000 x9 : ffff60b446523900
> [    3.919084] x8 : ffff60b446523900 x7 : 00000000435e6d06 x6 : 40395246b460ffff
> [    3.926220] x5 : 0000000000000043 x4 : 000000000000142b x3 : 000000000000004e
> [    3.933356] x2 : 0000000000000000 x1 : ffffa4a68db8d9a0 x0 : 000000000dae142b
> [    3.940492] Call trace:
> [    3.942933]  panel_edp_probe+0x488/0x4f0
> [    3.946851]  panel_edp_dp_aux_ep_probe+0x38/0x50
> [    3.951466]  dp_aux_ep_probe+0x34/0xf4
> [    3.955211]  really_probe+0x148/0x2ac
> [    3.958868]  __driver_probe_device+0x78/0x12c
> [    3.963221]  driver_probe_device+0x3c/0x160
> [    3.967400]  __device_attach_driver+0xb8/0x138
> [    3.971841]  bus_for_each_drv+0x80/0xdc
> [    3.975672]  __device_attach+0x9c/0x188
> [    3.979503]  device_initial_probe+0x14/0x20
> [    3.983683]  bus_probe_device+0xac/0xb0
> [    3.987515]  device_add+0x5bc/0x778
> [    3.990999]  device_register+0x20/0x30
> [    3.994742]  of_dp_aux_populate_bus+0xc8/0x19c
> [    3.999181]  devm_of_dp_aux_populate_bus+0x18/0x80
> [    4.003968]  anx7625_i2c_probe+0x7bc/0x9b4
> [    4.008062]  i2c_device_probe+0x148/0x290
> [    4.011724] usb 1-1: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=65.01
> [    4.012062]  really_probe+0x148/0x2ac
> [    4.012064]  __driver_probe_device+0x78/0x12c
> [    4.020243] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    4.023879]  driver_probe_device+0x3c/0x160
> [    4.023882]  __device_attach_driver+0xb8/0x138
> [    4.023884]  bus_for_each_drv+0x80/0xdc
> [    4.028232] usb 1-1: Product: USB2.1 Hub
> [    4.035347]  __device_attach+0x9c/0x188
> [    4.035350]  device_initial_probe+0x14/0x20
> [    4.035353]  bus_probe_device+0xac/0xb0
> [    4.035355]  deferred_probe_work_func+0x8c/0xc8
> [    4.039530] usb 1-1: Manufacturer: GenesysLogic
> [    4.043955]  process_one_work+0x2d0/0x598
> [    4.048830] hub 1-1:1.0: USB hub found
> [    4.051689]  worker_thread+0x70/0x434
> [    4.051691]  kthread+0xfc/0x100
> [    4.051693]  ret_from_fork+0x10/0x20
> [    4.051699] irq event stamp: 136828
> [    4.051701] hardirqs last  enabled at (136827): [<ffffa4a68d991ba4>] _raw_spin_unlock_irqrestore+0x6c/0x98
> [    4.055841] hub 1-1:1.0: 4 ports detected
> [    4.059699] hardirqs last disabled at (136828): [<ffffa4a68d9811e8>] el1_dbg+0x24/0x8c
> [    4.059704] softirqs last  enabled at (134796): [<ffffa4a68c810794>] __do_softirq+0x424/0x51c
> [    4.059706] softirqs last disabled at (134787): [<ffffa4a68c816af0>] ____do_softirq+0x10/0x1c
> [    4.059709] ---[ end trace 0000000000000000 ]---
> 
> Without your patches, on 6.5.4, the trace looks as follows
> 
> [    3.834478] ------------[ cut here ]------------
> [    3.839126] WARNING: CPU: 5 PID: 10 at drivers/gpu/drm/panel/panel-edp.c:758 panel_edp_probe+0x488/0x4f0
> [    3.848629] Modules linked in:
> [    3.851684] CPU: 5 PID: 10 Comm: kworker/u16:0 Not tainted 6.5.4-cos-mt9 #1
> [    3.858646] Hardware name: Google Spherion (rev0 - 3) (DT)
> [    3.864129] Workqueue: events_unbound deferred_probe_work_func
> [    3.869966] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    3.876927] pc : panel_edp_probe+0x488/0x4f0
> [    3.881195] lr : panel_edp_probe+0x29c/0x4f0
> [    3.885461] sp : ffff8000800d3710
> [    3.888770] x29: ffff8000800d3710 x28: 0000000000000000 x27: 0000000000000000
> [    3.895907] x26: ffff31fec002c005 x25: ffffa839d1b90418 x24: 0000000000000000
> [    3.899112] usb 1-1: new high-speed USB device number 2 using xhci-mtk
> [    3.903031] x23: ffff31fec13fc500 x22: ffffa839d0d8d5b0 x21: ffff31fec51ec000
> [    3.903038] x20: 0000000000000000 x19: ffff31fec536fe80 x18: 0000000000078570
> [    3.903041] x17: 001fffffffffffff x16: 0000000000000000 x15: 0000000000000001
> [    3.930981] x14: 0000000000350cdf x13: 9b00200a4341452d x12: 0000000000000000
> [    3.938117] x11: 0000000000000001 x10: 0000000000000000 x9 : ffff31fec10b2300
> [    3.945253] x8 : ffff31fec10b2300 x7 : 0000000037343f4b x6 : 40230bc1fe31ffff
> [    3.952388] x5 : 0000000000000043 x4 : 000000000000142b x3 : 000000000000004e
> [    3.959524] x2 : 0000000000000000 x1 : ffffa839d0d8d9a0 x0 : 000000000dae142b
> [    3.966660] Call trace:
> [    3.969099]  panel_edp_probe+0x488/0x4f0
> [    3.973018]  panel_edp_dp_aux_ep_probe+0x38/0x50
> [    3.977633]  dp_aux_ep_probe+0x34/0xf4
> [    3.981378]  really_probe+0x148/0x2ac
> [    3.985036]  __driver_probe_device+0x78/0x12c
> [    3.989390]  driver_probe_device+0x3c/0x160
> [    3.993569]  __device_attach_driver+0xb8/0x138
> [    3.998009]  bus_for_each_drv+0x80/0xdc
> [    4.001840]  __device_attach+0x9c/0x188
> [    4.005672]  device_initial_probe+0x14/0x20
> [    4.009851]  bus_probe_device+0xac/0xb0
> [    4.013682]  device_add+0x5bc/0x778
> [    4.017166]  device_register+0x20/0x30
> [    4.020911]  of_dp_aux_populate_bus+0xc8/0x19c
> [    4.025349]  devm_of_dp_aux_populate_bus+0x18/0x80
> [    4.030136]  anx7625_i2c_probe+0x7bc/0x9b4
> [    4.034229]  i2c_device_probe+0x148/0x290
> [    4.038237]  really_probe+0x148/0x2ac
> [    4.038692] usb 1-1: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=65.01
> [    4.041887]  __driver_probe_device+0x78/0x12c
> [    4.041890]  driver_probe_device+0x3c/0x160
> [    4.041892]  __device_attach_driver+0xb8/0x138
> [    4.041895]  bus_for_each_drv+0x80/0xdc
> [    4.041897]  __device_attach+0x9c/0x188
> [    4.050077] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    4.054409]  device_initial_probe+0x14/0x20
> [    4.054412]  bus_probe_device+0xac/0xb0
> [    4.058588] usb 1-1: Product: USB2.1 Hub
> [    4.063012]  deferred_probe_work_func+0x8c/0xc8
> [    4.063014]  process_one_work+0x2d0/0x598
> [    4.066841] usb 1-1: Manufacturer: GenesysLogic
> [    4.070658]  worker_thread+0x70/0x434
> [    4.070660]  kthread+0xfc/0x100
> [    4.070663]  ret_from_fork+0x10/0x20
> [    4.078915] hub 1-1:1.0: USB hub found
> [    4.081952] irq event stamp: 141216
> [    4.081953] hardirqs last  enabled at (141215): [<ffffa839d0b936a4>] _raw_spin_unlock_irqrestore+0x6c/0x98
> [    4.081960] hardirqs last disabled at (141216): [<ffffa839d0b82ce8>] el1_dbg+0x24/0x8c
> [    4.081965] softirqs last  enabled at (140754): [<ffffa839cfa10794>] __do_softirq+0x424/0x51c
> [    4.086058] hub 1-1:1.0: 4 ports detected
> [    4.089700] softirqs last disabled at (140749): [<ffffa839cfa16af0>] ____do_softirq+0x10/0x1c
> [    4.089702] ---[ end trace 0000000000000000 ]---
> [    4.089721] panel-simple-dp-aux aux-3-0058: Unknown panel CMN 0x142b, using conservative timings



