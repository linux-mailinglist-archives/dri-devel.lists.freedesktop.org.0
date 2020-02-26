Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC41D16FEF7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 13:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67E06E282;
	Wed, 26 Feb 2020 12:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DAB6E282
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 12:28:44 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QCSQq8060103;
 Wed, 26 Feb 2020 06:28:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582720106;
 bh=ZB43lBxpAO1BlMQoIQmjxXWWNV5QdKo0f5NtDlbQl1I=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FyUSR5Z/6eNDoUsuhv27AkwsTW0TdFZrft7uvESw3TI+GsCECIppXNCn2LA+Ga/0l
 wVfj/BBz7zvWqONOwpz+HZlgqvLcBzRqH6xpVeTIzbFZ8UGj0sLlVOO1uZXjUIV8D8
 yX7DPNetfR/7/OtacshoEYPxPTFW0dDJlqFlZ6tY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01QCSQV9098319
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Feb 2020 06:28:26 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 06:28:26 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 06:28:26 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QCSNGA005048;
 Wed, 26 Feb 2020 06:28:24 -0600
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Sebastian Reichel
 <sre@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <74217b2c-a6cf-4a85-c18a-62ca892b7a0d@ti.com>
Date: Wed, 26 Feb 2020 14:28:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>, "H.
 Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/02/2020 01:20, Sebastian Reichel wrote:
> This updates the existing omapdrm DSI code, so that it uses
> common drm_mipi_dsi API and drm_panel.
> 
> The patchset has been tested with Droid 4 using Linux console, X.org and
> Weston. The patchset is based on Laurent Pinchartl's patch series [0]
> and removes the last custom panel driver, so quite a few cleanups on the
> omapdrm codebase were possible.

I haven't done any reviews yet, but applied these (and the one v2.1 patch) on top of Laurent's. I booted up AM5 EVM and loaded the modules:

[   17.261560] WARNING: CPU: 0 PID: 419 at drivers/base/component.c:636 component_bind_all+0x1f4/0x258
[   17.270811] Modules linked in: omapdrm(+) omapdss omapdss_base panel_osd_osd101t2587_53ts panel_simple simple_bridge ti_tpd12s015 display_connec
tor tc358767 tc358768 sii902x ti_tfp410 drm_kms_helper drm drm_panel_orientation_quirks cfbfillrect cfbimgblt cfbcopyarea cec
[   17.295521] CPU: 0 PID: 419 Comm: insmod Not tainted 5.6.0-rc2-00375-g66c4203ed9d4 #2
[   17.303387] Hardware name: Generic DRA74X (Flattened Device Tree)
[   17.309520] [<c011431c>] (unwind_backtrace) from [<c010dc20>] (show_stack+0x10/0x14)
[   17.317306] [<c010dc20>] (show_stack) from [<c09acca4>] (dump_stack+0xb4/0xd0)
[   17.324567] [<c09acca4>] (dump_stack) from [<c013a33c>] (__warn+0xc0/0xf8)
[   17.331477] [<c013a33c>] (__warn) from [<c013a700>] (warn_slowpath_fmt+0x58/0xb8)
[   17.338998] [<c013a700>] (warn_slowpath_fmt) from [<c0630698>] (component_bind_all+0x1f4/0x258)
[   17.347768] [<c0630698>] (component_bind_all) from [<bf11b52c>] (pdev_probe+0xe0/0x7a0 [omapdrm])
[   17.356709] [<bf11b52c>] (pdev_probe [omapdrm]) from [<c063a198>] (platform_drv_probe+0x48/0x98)
[   17.365537] [<c063a198>] (platform_drv_probe) from [<c0637c1c>] (really_probe+0x200/0x478)
[   17.373841] [<c0637c1c>] (really_probe) from [<c0638060>] (driver_probe_device+0x6c/0x1b4)
[   17.382145] [<c0638060>] (driver_probe_device) from [<c06383f0>] (device_driver_attach+0x58/0x60)
[   17.391060] [<c06383f0>] (device_driver_attach) from [<c063849c>] (__driver_attach+0xa4/0x148)
[   17.399713] [<c063849c>] (__driver_attach) from [<c0635af8>] (bus_for_each_dev+0x70/0xb4)
[   17.407930] [<c0635af8>] (bus_for_each_dev) from [<c0636d60>] (bus_add_driver+0x100/0x204)
[   17.416233] [<c0636d60>] (bus_add_driver) from [<c0639078>] (driver_register+0x74/0x108)
[   17.424361] [<c0639078>] (driver_register) from [<c063a2a8>] (__platform_register_drivers+0x58/0x150)
[   17.433628] [<c063a2a8>] (__platform_register_drivers) from [<c0102ff8>] (do_one_initcall+0x48/0x2a0)
[   17.442893] [<c0102ff8>] (do_one_initcall) from [<c01e2efc>] (do_init_module+0x5c/0x234)
[   17.451022] [<c01e2efc>] (do_init_module) from [<c01e5668>] (load_module+0x250c/0x28a4)
[   17.459064] [<c01e5668>] (load_module) from [<c01e5cb8>] (sys_finit_module+0xcc/0x110)
[   17.467020] [<c01e5cb8>] (sys_finit_module) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
[   17.475233] Exception stack(0xea84bfa8 to 0xea84bff0)
[   17.480307] bfa0:                   00000002 00000000 00000003 0002a894 00000000 bebd2d74
[   17.488524] bfc0: 00000002 00000000 00028424 0000017b 0003eeb0 00000002 b6ffe000 00000000
[   17.496738] bfe0: bebd2bb8 bebd2ba8 00020d7c b6edb0b0
[   17.502365] ---[ end trace c20802296d6b2775 ]---
[   17.508567] omapdss_dss 58000000.dss: bound 58001000.dispc (ops dsi_framedone_timeout_work_callback [omapdss])
[   17.520358] omapdss_dss 58000000.dss: bound 58040000.encoder (ops dsi_framedone_timeout_work_callback [omapdss])
[   17.559728] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   17.574544] [drm] Enabling DMM ywrap scrolling
[   17.580606] omapdrm omapdrm.0: fb0: omapdrmdrmfb frame buffer device
[   17.625099] [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on minor 0

Similar warning on module unload. The display works, though.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
