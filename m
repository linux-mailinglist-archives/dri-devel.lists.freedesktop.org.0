Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F6A8B1E63
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 11:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DA910FE37;
	Thu, 25 Apr 2024 09:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Xlh4hZ+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A9710FE37
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:49:10 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240425094907euoutp01266f0c5b003ced3f679b77df24546c86~JfPpTvifw1557815578euoutp01a
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:49:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240425094907euoutp01266f0c5b003ced3f679b77df24546c86~JfPpTvifw1557815578euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1714038547;
 bh=BIh9e4A3BxOdZUZQJEOnjNv53sOGxKsIKHDvcODQsnE=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Xlh4hZ+kUDlYZsUheMsGVTgd1NDWyB92zpJZ+hI5zoxGY5/A5xHuuwRYrCcFVNbem
 hpgJsGUAQVduCim1QXN3o9Y5BubQc+qD+ChSH3Fk59qD89cwfMjtRdOPyxG9GHsmLn
 sSgho07VG5qlgoJ2+mIhehsrSPpq5AyqxCMPPpRo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240425094907eucas1p2abc745f137dcc6ee9ea6856d54445402~JfPo4b-Lf2350923509eucas1p2D;
 Thu, 25 Apr 2024 09:49:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 1E.C1.09624.3172A266; Thu, 25
 Apr 2024 10:49:07 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240425094907eucas1p10a82102ccb08868dda93d6860b9177ec~JfPomQWea1165911659eucas1p10;
 Thu, 25 Apr 2024 09:49:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240425094907eusmtrp2a66c5c54ef206cf9612d1a6baccdd628~JfPolkqFc1755417554eusmtrp2M;
 Thu, 25 Apr 2024 09:49:07 +0000 (GMT)
X-AuditID: cbfec7f2-c11ff70000002598-ed-662a27139c80
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 05.82.08810.2172A266; Thu, 25
 Apr 2024 10:49:06 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240425094906eusmtip20d1978d605325c8eabbb3b7a0131d51c~JfPoGNFFg0072600726eusmtip2i;
 Thu, 25 Apr 2024 09:49:06 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] drm/exynos: hdmi: report safe 640x480 mode as a fallback
 when no EDID found
Date: Thu, 25 Apr 2024 11:48:51 +0200
Message-Id: <20240425094851.994055-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djPc7rC6lppBtOv81lc+fqezWLS/Qks
 FufPb2C32PT4GqvFjPP7mCzWHrnLbrFg4yNGixmTX7I5cHhsWtXJ5nG/+ziTx+Yl9R59W1Yx
 enzeJBfAGsVlk5Kak1mWWqRvl8CVcX1CM3PBb/2KH1tTGxiXanUxcnJICJhIXJjSztTFyMUh
 JLCCUWJ61xo2COcLo8Sxgz+YQaqEBD4zSrw7awrTcezHVWaIouWMEi9mPEPoONT9DKyDTcBQ
 outtFxuILSKQJ3F1WjsrSBGzwG5GiW3z5rOAJIQF4iRmHv8LVsQioCpx7PFtdhCbV8BO4sOM
 p4wQ6+Ql9h88ywwRF5Q4OfMJWC8zULx562ywMyQElnJIfP8BUSQh4CKxZMJFJghbWOLV8S3s
 ELaMxP+d85kgGtoZJRb8vg/lTGCUaHh+C2qdtcSdc7+ATuIAWqEpsX6XPkTYUaLn4BZGkLCE
 AJ/EjbeCEEfwSUzaNp0ZIswr0dEmBFGtJjHr+Dq4tQcvXII6zUPi2NtZ0CCNlbjbO5dtAqPC
 LCSvzULy2iyEGxYwMq9iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITDqn/x3/tINx7quP
 eocYmTgYDzFKcDArifDe/KiRJsSbklhZlVqUH19UmpNafIhRmoNFSZxXNUU+VUggPbEkNTs1
 tSC1CCbLxMEp1cA04/Y/r7YVbM/Zyx81b356/KlkQ9uSFda7GBnXKSx48LZQJcK2QaLd4cwi
 k9hn/hWGwhfZNjd2OBeounge8nyvZ3G76m1j3QYXnT0Lavti2eNdFyv/3rjGaFfQ3NdLHdZV
 iKiobrDaeffZfeZ1+cv3Te4zDJlrxC33SCbitsKFJT8X3XgptrVn/6xVYh+ET/ZaqjKwSwqG
 Lq1bffuV2qXw/TOaKz9ePzS/Ks4sJHSlnZOw+f3jj3SU+WN1N3+U3qdbGH1xz/EdbhezAk8l
 29578DBiZtLihxcfVTN+lru+8nNQ5ta6rvNJMhqTn/T/0pHbunD28heaje2zDb6qPjr86qPs
 naMRk01UeVyb5rc7KbEUZyQaajEXFScCACc8KUCpAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsVy+t/xe7pC6lppBpseWVhc+fqezWLS/Qks
 FufPb2C32PT4GqvFjPP7mCzWHrnLbrFg4yNGixmTX7I5cHhsWtXJ5nG/+ziTx+Yl9R59W1Yx
 enzeJBfAGqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRv
 l6CXcX1CM3PBb/2KH1tTGxiXanUxcnJICJhIHPtxlbmLkYtDSGApo8TKHaeYIRIyEienNbBC
 2MISf651sUEUfWKU+PVqB1gRm4ChRNdbkAQnh4hAgcTfpUeYQIqYBfYzSvy+dhOsW1ggRmJP
 1wZ2EJtFQFXi2OPbYDavgJ3EhxlPGSE2yEvsP3iWGSIuKHFy5hMWEJsZKN68dTbzBEa+WUhS
 s5CkFjAyrWIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAgM9m3Hfm7ewTjv1Ue9Q4xMHIyHGCU4
 mJVEeG9+1EgT4k1JrKxKLcqPLyrNSS0+xGgKdN9EZinR5HxgvOWVxBuaGZgamphZGphamhkr
 ifN6FnQkCgmkJ5akZqemFqQWwfQxcXBKNTB1c69j0T/1KSPJRvPipTnLmv02Gwrt6z1Vzui+
 wLYh3V4lRXdhc/ESLUW7gsenD6UGt99btsxQovQx16stgvNEwx7M6JNazXS4W/GHQEeG6eVp
 y1g4C7r0HwvzNy57u6/y899jcZxnzuu/f6a+j3nWQv6fGZ+6E6Sml9VK3t12uPl9mJqgw7sv
 B1RWP000OnLh0Jfeikc3dp/Rf7sj6d9OGzWhq0tWJq1z3P/k1NJ7nq2sRy93vjv8WOcSzwOf
 IF9FWfmjV/a68fC6nBJe/v/w5Qfs9R9d1k1YIdyrEF6w/53ogeUfRdY+K2UyOMMdztd1LCVN
 Jjl0z7KNnDVxVmwhv3fqvvvoufGFqnr/e8V0JZbijERDLeai4kQAQAtdXv8CAAA=
X-CMS-MailID: 20240425094907eucas1p10a82102ccb08868dda93d6860b9177ec
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240425094907eucas1p10a82102ccb08868dda93d6860b9177ec
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240425094907eucas1p10a82102ccb08868dda93d6860b9177ec
References: <CGME20240425094907eucas1p10a82102ccb08868dda93d6860b9177ec@eucas1p1.samsung.com>
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

When reading EDID fails and driver reports no modes available, the DRM
core adds an artificial 1024x786 mode to the connector. Unfortunately
some variants of the Exynos HDMI (like the one in Exynos4 SoCs) are not
able to drive such mode, so report a safe 640x480 mode instead of nothing
in case of the EDID reading failure.

This fixes the following issue observed on Trats2 board since commit
13d5b040363c ("drm/exynos: do not return negative values from .get_modes()"):

[drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
exynos-drm exynos-drm: bound 12c10000.mixer (ops mixer_component_ops)
exynos-dsi 11c80000.dsi: [drm:samsung_dsim_host_attach] Attached s6e8aa0 device (lanes:4 bpp:24 mode-flags:0x10b)
exynos-drm exynos-drm: bound 11c80000.dsi (ops exynos_dsi_component_ops)
exynos-drm exynos-drm: bound 12d00000.hdmi (ops hdmi_component_ops)
[drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 1
exynos-hdmi 12d00000.hdmi: [drm:hdmiphy_enable.part.0] *ERROR* PLL could not reach steady state
panel-samsung-s6e8aa0 11c80000.dsi.0: ID: 0xa2, 0x20, 0x8c
exynos-mixer 12c10000.mixer: timeout waiting for VSYNC
------------[ cut here ]------------
WARNING: CPU: 1 PID: 11 at drivers/gpu/drm/drm_atomic_helper.c:1682 drm_atomic_helper_wait_for_vblanks.part.0+0x2b0/0x2b8
[CRTC:70:crtc-1] vblank wait timed out
Modules linked in:
CPU: 1 PID: 11 Comm: kworker/u16:0 Not tainted 6.9.0-rc5-next-20240424 #14913
Hardware name: Samsung Exynos (Flattened Device Tree)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
 unwind_backtrace from show_stack+0x10/0x14
 show_stack from dump_stack_lvl+0x68/0x88
 dump_stack_lvl from __warn+0x7c/0x1c4
 __warn from warn_slowpath_fmt+0x11c/0x1a8
 warn_slowpath_fmt from drm_atomic_helper_wait_for_vblanks.part.0+0x2b0/0x2b8
 drm_atomic_helper_wait_for_vblanks.part.0 from drm_atomic_helper_commit_tail_rpm+0x7c/0x8c
 drm_atomic_helper_commit_tail_rpm from commit_tail+0x9c/0x184
 commit_tail from drm_atomic_helper_commit+0x168/0x190
 drm_atomic_helper_commit from drm_atomic_commit+0xb4/0xe0
 drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x27c
 drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0x60/0x1cc
 drm_client_modeset_commit_locked from drm_client_modeset_commit+0x24/0x40
 drm_client_modeset_commit from __drm_fb_helper_restore_fbdev_mode_unlocked+0x9c/0xc4
 __drm_fb_helper_restore_fbdev_mode_unlocked from drm_fb_helper_set_par+0x2c/0x3c
 drm_fb_helper_set_par from fbcon_init+0x3d8/0x550
 fbcon_init from visual_init+0xc0/0x108
 visual_init from do_bind_con_driver+0x1b8/0x3a4
 do_bind_con_driver from do_take_over_console+0x140/0x1ec
 do_take_over_console from do_fbcon_takeover+0x70/0xd0
 do_fbcon_takeover from fbcon_fb_registered+0x19c/0x1ac
 fbcon_fb_registered from register_framebuffer+0x190/0x21c
 register_framebuffer from __drm_fb_helper_initial_config_and_unlock+0x350/0x574
 __drm_fb_helper_initial_config_and_unlock from exynos_drm_fbdev_client_hotplug+0x6c/0xb0
 exynos_drm_fbdev_client_hotplug from drm_client_register+0x58/0x94
 drm_client_register from exynos_drm_bind+0x160/0x190
 exynos_drm_bind from try_to_bring_up_aggregate_device+0x200/0x2d8
 try_to_bring_up_aggregate_device from __component_add+0xb0/0x170
 __component_add from mixer_probe+0x74/0xcc
 mixer_probe from platform_probe+0x5c/0xb8
 platform_probe from really_probe+0xe0/0x3d8
 really_probe from __driver_probe_device+0x9c/0x1e4
 __driver_probe_device from driver_probe_device+0x30/0xc0
 driver_probe_device from __device_attach_driver+0xa8/0x120
 __device_attach_driver from bus_for_each_drv+0x80/0xcc
 bus_for_each_drv from __device_attach+0xac/0x1fc
 __device_attach from bus_probe_device+0x8c/0x90
 bus_probe_device from deferred_probe_work_func+0x98/0xe0
 deferred_probe_work_func from process_one_work+0x240/0x6d0
 process_one_work from worker_thread+0x1a0/0x3f4
 worker_thread from kthread+0x104/0x138
 kthread from ret_from_fork+0x14/0x28
Exception stack(0xf0895fb0 to 0xf0895ff8)
...
irq event stamp: 82357
hardirqs last  enabled at (82363): [<c01a96e8>] vprintk_emit+0x308/0x33c
hardirqs last disabled at (82368): [<c01a969c>] vprintk_emit+0x2bc/0x33c
softirqs last  enabled at (81614): [<c0101644>] __do_softirq+0x320/0x500
softirqs last disabled at (81609): [<c012dfe0>] __irq_exit_rcu+0x130/0x184
---[ end trace 0000000000000000 ]---
exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
exynos-drm exynos-drm: [drm] *ERROR* [CRTC:70:crtc-1] commit wait timed out
exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
exynos-drm exynos-drm: [drm] *ERROR* [CONNECTOR:74:HDMI-A-1] commit wait timed out
exynos-drm exynos-drm: [drm] *ERROR* flip_done timed out
exynos-drm exynos-drm: [drm] *ERROR* [PLANE:56:plane-5] commit wait timed out
exynos-mixer 12c10000.mixer: timeout waiting for VSYNC

Cc: stable@vger.kernel.org
Fixes: 13d5b040363c ("drm/exynos: do not return negative values from .get_modes()")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 5fdeec8a3875..9d246db6ef2b 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -887,11 +887,11 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	int ret;
 
 	if (!hdata->ddc_adpt)
-		return 0;
+		goto no_edid;
 
 	edid = drm_get_edid(connector, hdata->ddc_adpt);
 	if (!edid)
-		return 0;
+		goto no_edid;
 
 	hdata->dvi_mode = !connector->display_info.is_hdmi;
 	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
@@ -906,6 +906,9 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	kfree(edid);
 
 	return ret;
+
+no_edid:
+	return drm_add_modes_noedid(connector, 640, 480);
 }
 
 static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
-- 
2.34.1

