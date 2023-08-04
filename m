Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D00876FED6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F060E10E6D8;
	Fri,  4 Aug 2023 10:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC8910E6C9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:48:32 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F8E5188E;
 Fri,  4 Aug 2023 12:47:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691146046;
 bh=sSHNiN7SCW+dnAbLNBvXVtT0IFfFTc4U7kIWW6bzkcc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vqtielVZGZwDmNlYBA7mcOvKFUJXxaKDwV9ENxPhnF7RkoKUj+iyBdL5epoZglLE5
 +VNMHB42QVM9YKyJhhogRZUWv63tw6wPo7fco2C2XFQ3G4Jn40mEUIz+J2IjEWB99Y
 H54EXzNb9GqIoivaraSX9uuHRfe0V6QhusyJ5mNM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Aug 2023 13:48:11 +0300
Subject: [PATCH 2/4] drm/bridge: lt8912b: Fix crash on bridge detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-lt8912b-v1-2-c542692c6a2f@ideasonboard.com>
References: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
In-Reply-To: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
To: Adrien Grassein <adrien.grassein@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4076;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=sSHNiN7SCW+dnAbLNBvXVtT0IFfFTc4U7kIWW6bzkcc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNd6zGvgxDYCLtrRiFJnpm3hEXSfsh2F+jd0H
 xfGLVuAJTOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzXegAKCRD6PaqMvJYe
 9SAnD/42zhCeSiHSaQ04HYuQVR134RabhRuzmMjSbljYZOMS0jIIWPwPNPHxxU3+zAyYYaGj4Mn
 yhWybHz/BkupsiT4/o9+2zEtmN+bNf6dULlsP82Vdv3jX+2XBl2HWcecUVlpnI+3e4xIWmK1Tbp
 +2oMqm3Lxui0ryU6rpjnBbm3SxbmLMeE4/kPv13kZjO9SUpoU6afzUirve+LHO8O9Y/1rfsDqvs
 0atCeMQAVmB/vcZMHmM8zQZQy3YILkB03M8PpWqEcNN2F24uM5GAmsyMqmQkFOaWtK3QgxMBFSK
 r1PYEUj8HMFBQfqA6MxDCns/QPvjT8K+yn7mlaLRC4oZVhRVBZZFRe61GTiCu2nAUk7SrK8WR9T
 8HLR1koGTidrYoFH+tzvkZZ1Sk3bLhMhc8ucRE60/SnrIhxLfVcYubrrENMzX4cHhSn3NWoxHr0
 +7ar3UgmiJYBohwYEgKMPoVMlIrkdDllu/Aos7rKyJwQvbz7hvaR4W9U8tUldn0kjm5ZX5+FK+U
 ZQwFxMnIiQM4mijTpP94lTYnBg7OsUbz6p1kRmox0qHxX1rsAsVLSsOwbLwe1KSYrNxHEpkKjY5
 I4+7dvcTqIQYSCQTzuQdx+jrGausSMLDE/e5bsXRKvJzrjxw4OCa8axVKXpNy14memcm/1I6QI6
 aYnhriViYhLissg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The lt8912b driver, in its bridge detach function, calls
drm_connector_unregister() and drm_connector_cleanup().

drm_connector_unregister() should be called only for connectors
explicitly registered with drm_connector_register(), which is not the
case in lt8912b.

The driver's drm_connector_funcs.destroy hook is set to
drm_connector_cleanup().

Thus the driver should not call either drm_connector_unregister() nor
drm_connector_cleanup() in its lt8912_bridge_detach(), as they cause a
crash on bridge detach:

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=00000000858f3000
[0000000000000000] pgd=0800000085918003, p4d=0800000085918003, pud=0800000085431003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Modules linked in: tidss(-) display_connector lontium_lt8912b tc358768 panel_lvds panel_simple drm_dma_helper drm_kms_helper drm drm_panel_orientation_quirks
CPU: 3 PID: 462 Comm: rmmod Tainted: G        W          6.5.0-rc2+ #2
Hardware name: Toradex Verdin AM62 on Verdin Development Board (DT)
pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : drm_connector_cleanup+0x78/0x2d4 [drm]
lr : lt8912_bridge_detach+0x54/0x6c [lontium_lt8912b]
sp : ffff800082ed3a90
x29: ffff800082ed3a90 x28: ffff0000040c1940 x27: 0000000000000000
x26: 0000000000000000 x25: dead000000000122 x24: dead000000000122
x23: dead000000000100 x22: ffff000003fb6388 x21: 0000000000000000
x20: 0000000000000000 x19: ffff000003fb6260 x18: fffffffffffe56e8
x17: 0000000000000000 x16: 0010000000000000 x15: 0000000000000038
x14: 0000000000000000 x13: ffff800081914b48 x12: 000000000000040e
x11: 000000000000015a x10: ffff80008196ebb8 x9 : ffff800081914b48
x8 : 00000000ffffefff x7 : ffff0000040c1940 x6 : ffff80007aa649d0
x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff80008159e008
x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 drm_connector_cleanup+0x78/0x2d4 [drm]
 lt8912_bridge_detach+0x54/0x6c [lontium_lt8912b]
 drm_bridge_detach+0x44/0x84 [drm]
 drm_encoder_cleanup+0x40/0xb8 [drm]
 drmm_encoder_alloc_release+0x1c/0x30 [drm]
 drm_managed_release+0xac/0x148 [drm]
 drm_dev_put.part.0+0x88/0xb8 [drm]
 devm_drm_dev_init_release+0x14/0x24 [drm]
 devm_action_release+0x14/0x20
 release_nodes+0x5c/0x90
 devres_release_all+0x8c/0xe0
 device_unbind_cleanup+0x18/0x68
 device_release_driver_internal+0x208/0x23c
 driver_detach+0x4c/0x94
 bus_remove_driver+0x70/0xf4
 driver_unregister+0x30/0x60
 platform_driver_unregister+0x14/0x20
 tidss_platform_driver_exit+0x18/0xb2c [tidss]
 __arm64_sys_delete_module+0x1a0/0x2b4
 invoke_syscall+0x48/0x110
 el0_svc_common.constprop.0+0x60/0x10c
 do_el0_svc_compat+0x1c/0x40
 el0_svc_compat+0x40/0xac
 el0t_32_sync_handler+0xb0/0x138
 el0t_32_sync+0x194/0x198
Code: 9104a276 f2fbd5b7 aa0203e1 91008af8 (f85c0420)

Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 0e581f6e3c88..2d752e083433 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -589,9 +589,6 @@ static void lt8912_bridge_detach(struct drm_bridge *bridge)
 
 	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
 		drm_bridge_hpd_disable(lt->hdmi_port);
-
-	drm_connector_unregister(&lt->connector);
-	drm_connector_cleanup(&lt->connector);
 }
 
 static enum drm_connector_status

-- 
2.34.1

