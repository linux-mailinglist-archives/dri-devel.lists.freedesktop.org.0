Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F70E5B5FBF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 20:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFE510E071;
	Mon, 12 Sep 2022 18:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8905C10E071
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 18:02:49 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso6402305otb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 11:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Om0zExF9defs+3c/l8Gbpzf7vdznVTwaUi6pocGhziE=;
 b=HFO2F9awHFBJgVDdUUTDygL1QnpLGMVngibTvXXDnqpX33FcL7v1m0AqNbh217uYPY
 gXmhEmpCxeECF9rIlbtOyP/kh8YU22LFkPGdZ+DMZnINMPm8g7YVXgGpbaFO6cf54Esf
 Og44e05ZiDjeHppv0RAjS0a6SgtMKba9JlTlz1vDivX48CEg/CWqyiNymIqitPq9qT+5
 rq0eZqbu97wCSF9qgiSQvitZgJWkd2mEYuZMqKnVtm5T/nvKYWtjT27s7W/Rph1iXT36
 iJKvdBDbMNONjsC27m0rdFF9qBT4IvYTcxeq4QcUwJFZ0pHB5tsw4pqSLvmMtHoZNusf
 F4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Om0zExF9defs+3c/l8Gbpzf7vdznVTwaUi6pocGhziE=;
 b=dfXUH4LFcFuvuv8L2XuZK+mWVsT5p0mgjsr2gL9z/0KW91FSr6chajGE5ebhW4gswB
 9BQ+ygytrARGJ5Xfx0vUhxvEJNyeKlIt+6wywHOG1l7eBvY+ACZz40vRY+A5K46JkSO+
 ZDecdu1bkm2/YyNTLCPIHDNkq2E9xNsQR/0Wt5gv+vAgCn0K6rd+cXyB6bOYQJXejjVg
 4hxxk49TMMYN4iK/mwlipDq5DUDZ7FhVkLqe/vxlk/j2UDle9h5ffehg2RlWHuFysPFs
 93MW2O/X17O72uQPBJFfIW48eB3JbBBjlSkvIX3twzkD3EbamFGEb/JUbqS1VWCaYvMd
 Owzw==
X-Gm-Message-State: ACgBeo3YSqHheuH/q/cnIMCFfp9NWbX/NynpYyR0+AnCMzfzbJMyUab+
 5OdAwkexB5Te2IoWzcwdJRHwmt5tkbE=
X-Google-Smtp-Source: AA6agR5ZriRYgV7HUobmLJeHUpbhvFbTDfbGGKmIrSuh27luBFBwuYdE+H/LlEFJK10KN5bRoZp5nQ==
X-Received: by 2002:a9d:4f0d:0:b0:655:e3ba:9ed0 with SMTP id
 d13-20020a9d4f0d000000b00655e3ba9ed0mr2617344otl.127.1663005767296; 
 Mon, 12 Sep 2022 11:02:47 -0700 (PDT)
Received: from wintermute.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a056830114e00b0063a82e6f3f9sm4882536otq.14.2022.09.12.11.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:02:46 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: vop2: Fix Null Pointer Dereference on Multiple
 VPs
Date: Mon, 12 Sep 2022 13:02:42 -0500
Message-Id: <20220912180242.499-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: airlied@linux.ie, hjc@rock-chips.com, linux-rockchip@lists.infradead.org,
 Chris Morgan <macromorgan@hotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

If I use more than one VP to output on an RK3566 based device I
receive the following error (and then everything freezes):

[    0.838375] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000250
[    0.839191] Mem abort info:
[    0.839442]   ESR = 0x0000000096000005
[    0.839785]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.840256]   SET = 0, FnV = 0
[    0.840530]   EA = 0, S1PTW = 0
[    0.840821]   FSC = 0x05: level 1 translation fault
[    0.841254] Data abort info:
[    0.841512]   ISV = 0, ISS = 0x00000005
[    0.841864]   CM = 0, WnR = 0
[    0.842130] [0000000000000250] user address but active_mm is swapper
[    0.842704] Internal error: Oops: 96000005 [#1] SMP
[    0.843139] Modules linked in:
[    0.843420] CPU: 0 PID: 37 Comm: kworker/u8:1 Not tainted 6.0.0-rc5+ #40
[    0.844013] Hardware name: RG503 (DT)
[    0.844343] Workqueue: events_unbound deferred_probe_work_func
[    0.844871] pstate: 80000009 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.845487] pc : __drm_crtc_init_with_planes+0x48/0x2e4
[    0.845956] lr : drm_crtc_init_with_planes+0x68/0x94
[    0.846399] sp : ffffffc00a7a3710
[    0.846695] x29: ffffffc00a7a3710 x28: ffffff8000fb4080 x27: ffffffc00a7a37a0
[    0.847332] x26: ffffffc0097d01c7 x25: ffffff8000fb44d8 x24: ffffffc0097d01c7
[    0.847967] x23: ffffffc009311870 x22: 0000000000000000 x21: 0000000000000008
[    0.848603] x20: ffffff80010d0800 x19: ffffff8000fb44e8 x18: 0000000000000000
[    0.849237] x17: 08000000000000d1 x16: 0800000000000091 x15: 08000000000000c1
[    0.849874] x14: 0000000000000000 x13: 3432564e3631564e x12: 3231564e36314742
[    0.850509] x11: 3631475234324742 x10: 000000000000002d x9 : ffffffc008682004
[    0.851144] x8 : 00000000006f7475 x7 : 00000000fffffff0 x6 : ffffffc00a7a37a0
[    0.851778] x5 : ffffffc0097d01c7 x4 : ffffffc009311870 x3 : 0000000000000000
[    0.852412] x2 : 0000000000000008 x1 : ffffff8000fb44e8 x0 : ffffff80010d0800
[    0.853048] Call trace:
[    0.853270]  __drm_crtc_init_with_planes+0x48/0x2e4
[    0.853706]  drm_crtc_init_with_planes+0x68/0x94
[    0.854118]  vop2_bind+0x89c/0x920
[    0.854429]  component_bind_all+0x18c/0x290
[    0.854805]  rockchip_drm_bind+0xe4/0x1f0
[    0.855166]  try_to_bring_up_aggregate_device+0x9c/0x290
[    0.855639]  __component_add+0x110/0x168
[    0.855991]  component_add+0x1c/0x28
[    0.856312]  dw_mipi_dsi_rockchip_host_attach+0x98/0x10c
[    0.856785]  dw_mipi_dsi_host_attach+0xbc/0xd0
[    0.857184]  mipi_dsi_attach+0x30/0x44
[    0.857521]  devm_mipi_dsi_attach+0x2c/0x70
[    0.857896]  ams495qa01_probe+0x2d4/0x33c
[    0.858257]  spi_probe+0x8c/0xb8
[    0.858550]  really_probe+0x1e0/0x3b8
[    0.858881]  __driver_probe_device+0x16c/0x184
[    0.859278]  driver_probe_device+0x4c/0xfc
[    0.859646]  __device_attach_driver+0xf0/0x170
[    0.860043]  bus_for_each_drv+0xa4/0xcc
[    0.860389]  __device_attach+0xfc/0x1a8
[    0.860733]  device_initial_probe+0x1c/0x28
[    0.861108]  bus_probe_device+0x38/0x9c
[    0.861452]  deferred_probe_work_func+0xdc/0xf0
[    0.861855]  process_one_work+0x1b0/0x260
[    0.862217]  process_scheduled_works+0x4c/0x50
[    0.862614]  worker_thread+0x1f0/0x26c
[    0.862949]  kthread+0xc4/0xd4
[    0.863227]  ret_from_fork+0x10/0x20
[    0.863553] Code: aa0503fa f9002bfb aa0603fb b40000a2 (b9424840)
[    0.864095] ---[ end trace 0000000000000000 ]---

A cursory reading of the datasheet suggests it's possible to have
simultaneous output to 2 distinct outputs. On page 13 it states:

Support two simultaneous displays(same source) in the following interfaces:
- MIPI_DSI_TX
- LVDS
- HDMI
- eDP

In order to achieve this though, I need to output to VP0 and VP1 (or
any 2 distinct VPs really). This is so I can have the ref clock set
to 24MHz for the HDMI and the pixel clock of the DSI panel (for the
example above it's 33.5MHz).  Currently, only by removing this code
block is such a thing possible, though I'm not sure if long-term
there should only be 1 CRTC for the rk3566 (and 2 CRTCs for 3568)
along with a max of 2 encoders for rk3566 (and 3 encoders for 3568).

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e4631f515ba4..f18d7f6f9f86 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2289,20 +2289,6 @@ static int vop2_create_crtc(struct vop2 *vop2)
 		struct vop2_win *win = &vop2->win[i];
 		u32 possible_crtcs;
 
-		if (vop2->data->soc_id == 3566) {
-			/*
-			 * On RK3566 these windows don't have an independent
-			 * framebuffer. They share the framebuffer with smart0,
-			 * esmart0 and cluster0 respectively.
-			 */
-			switch (win->data->phys_id) {
-			case ROCKCHIP_VOP2_SMART1:
-			case ROCKCHIP_VOP2_ESMART1:
-			case ROCKCHIP_VOP2_CLUSTER1:
-				continue;
-			}
-		}
-
 		if (win->type == DRM_PLANE_TYPE_PRIMARY) {
 			vp = find_vp_without_primary(vop2);
 			if (vp) {
-- 
2.25.1

