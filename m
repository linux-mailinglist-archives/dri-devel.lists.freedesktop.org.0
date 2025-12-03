Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E7C9F1BE
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2492F10E7BD;
	Wed,  3 Dec 2025 13:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FClpNQ9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DC810E7BD;
 Wed,  3 Dec 2025 13:19:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3CE45438ED;
 Wed,  3 Dec 2025 13:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5461AC4CEFB;
 Wed,  3 Dec 2025 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1764767954;
 bh=S6gmzWnwTh6tOEneCcIVJqxgW0S11eCqJRiu7VZJt/w=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=FClpNQ9HTSREROUsvbX2+gBdwPChgw3Jl6w70/oJCfPuwPmZhDpN6kYSw+KKSANtj
 ZqWsdM68xpho2sZ4whc2kHXBD9q4bRvhcBDg/nb3vKY8ZZYwJsHpEivzuOjDVj9xPK
 e4y0z+iVYp9le5QIR+31S5uJlq9gWiZOUJs9d4Pk=
Subject: Patch "drm, fbcon,
 vga_switcheroo: Avoid race condition in fbcon setup" has been added
 to the 6.12-stable tree
To: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 javierm@redhat.com, nouveau@lists.freedesktop.org, sashal@kernel.org,
 tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 03 Dec 2025 14:19:11 +0100
In-Reply-To: <20251202202312.2505097-1-sashal@kernel.org>
Message-ID: <2025120310-trump-rancidity-eedb@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-fbcon-vga_switcheroo-avoid-race-condition-in-fbcon-setup.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-198144-greg=kroah.com@vger.kernel.org Tue Dec  2 21:23:22 2025
From: Sasha Levin <sashal@kernel.org>
Date: Tue,  2 Dec 2025 15:23:12 -0500
Subject: drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup
To: stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Message-ID: <20251202202312.2505097-1-sashal@kernel.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit eb76d0f5553575599561010f24c277cc5b31d003 ]

Protect vga_switcheroo_client_fb_set() with console lock. Avoids OOB
access in fbcon_remap_all(). Without holding the console lock the call
races with switching outputs.

VGA switcheroo calls fbcon_remap_all() when switching clients. The fbcon
function uses struct fb_info.node, which is set by register_framebuffer().
As the fb-helper code currently sets up VGA switcheroo before registering
the framebuffer, the value of node is -1 and therefore not a legal value.
For example, fbcon uses the value within set_con2fb_map() [1] as an index
into an array.

Moving vga_switcheroo_client_fb_set() after register_framebuffer() can
result in VGA switching that does not switch fbcon correctly.

Therefore move vga_switcheroo_client_fb_set() under fbcon_fb_registered(),
which already holds the console lock. Fbdev calls fbcon_fb_registered()
from within register_framebuffer(). Serializes the helper with VGA
switcheroo's call to fbcon_remap_all().

Although vga_switcheroo_client_fb_set() takes an instance of struct fb_info
as parameter, it really only needs the contained fbcon state. Moving the
call to fbcon initialization is therefore cleaner than before. Only amdgpu,
i915, nouveau and radeon support vga_switcheroo. For all other drivers,
this change does nothing.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://elixir.bootlin.com/linux/v6.17/source/drivers/video/fbdev/core/fbcon.c#L2942 # [1]
Fixes: 6a9ee8af344e ("vga_switcheroo: initial implementation (v15)")
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: <stable@vger.kernel.org> # v2.6.34+
Link: https://patch.msgid.link/20251105161549.98836-1-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_fb_helper.c            |    6 ------
 drivers/gpu/drm/i915/display/intel_fbdev.c |    6 ------
 drivers/gpu/drm/radeon/radeon_fbdev.c      |    5 -----
 drivers/video/fbdev/core/fbcon.c           |    9 +++++++++
 4 files changed, 9 insertions(+), 17 deletions(-)

--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -30,9 +30,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/console.h>
-#include <linux/pci.h>
 #include <linux/sysrq.h>
-#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
@@ -1637,10 +1635,6 @@ static int drm_fb_helper_single_fb_probe
 
 	strcpy(fb_helper->fb->comm, "[fbcon]");
 
-	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
-	if (dev_is_pci(dev->dev))
-		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
-
 	return 0;
 }
 
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -589,11 +589,8 @@ static int intel_fbdev_restore_mode(stru
 static void intel_fbdev_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = fb_helper->dev;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	if (fb_helper->info) {
-		vga_switcheroo_client_fb_set(pdev, NULL);
 		drm_fb_helper_unregister_info(fb_helper);
 	} else {
 		drm_fb_helper_unprepare(fb_helper);
@@ -620,7 +617,6 @@ static int intel_fbdev_client_hotplug(st
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 	struct drm_device *dev = client->dev;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	int ret;
 
 	if (dev->fb_helper)
@@ -634,8 +630,6 @@ static int intel_fbdev_client_hotplug(st
 	if (ret)
 		goto err_drm_fb_helper_fini;
 
-	vga_switcheroo_client_fb_set(pdev, fb_helper->info);
-
 	return 0;
 
 err_drm_fb_helper_fini:
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -300,10 +300,8 @@ static void radeon_fbdev_client_unregist
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 	struct drm_device *dev = fb_helper->dev;
-	struct radeon_device *rdev = dev->dev_private;
 
 	if (fb_helper->info) {
-		vga_switcheroo_client_fb_set(rdev->pdev, NULL);
 		drm_helper_force_disable_all(dev);
 		drm_fb_helper_unregister_info(fb_helper);
 	} else {
@@ -325,7 +323,6 @@ static int radeon_fbdev_client_hotplug(s
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 	struct drm_device *dev = client->dev;
-	struct radeon_device *rdev = dev->dev_private;
 	int ret;
 
 	if (dev->fb_helper)
@@ -342,8 +339,6 @@ static int radeon_fbdev_client_hotplug(s
 	if (ret)
 		goto err_drm_fb_helper_fini;
 
-	vga_switcheroo_client_fb_set(rdev->pdev, fb_helper->info);
-
 	return 0;
 
 err_drm_fb_helper_fini:
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -65,6 +65,7 @@
 #include <linux/string.h>
 #include <linux/kd.h>
 #include <linux/panic.h>
+#include <linux/pci.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
 #include <linux/fb.h>
@@ -77,6 +78,7 @@
 #include <linux/interrupt.h>
 #include <linux/crc32.h> /* For counting font checksums */
 #include <linux/uaccess.h>
+#include <linux/vga_switcheroo.h>
 #include <asm/irq.h>
 
 #include "fbcon.h"
@@ -2894,6 +2896,9 @@ void fbcon_fb_unregistered(struct fb_inf
 
 	console_lock();
 
+	if (info->device && dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), NULL);
+
 	fbcon_registered_fb[info->node] = NULL;
 	fbcon_num_registered_fb--;
 
@@ -3027,6 +3032,10 @@ static int do_fb_registered(struct fb_in
 		}
 	}
 
+	/* Set the fb info for vga_switcheroo clients. Does nothing otherwise. */
+	if (info->device && dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
+
 	return ret;
 }
 


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-6.12/usb-typec-ucsi-psy-set-max-current-to-zero-when-disconnected.patch
queue-6.12/net-fec-do-not-update-perout-if-it-is-enabled.patch
queue-6.12/spi-nxp-fspi-propagate-fwnode-in-acpi-case-as-well.patch
queue-6.12/spi-amlogic-spifc-a1-handle-devm_pm_runtime_enable-e.patch
queue-6.12/can-gs_usb-gs_usb_receive_bulk_callback-check-actual.patch
queue-6.12/drm-xe-fix-conversion-from-clock-ticks-to-millisecon.patch
queue-6.12/mm-huge_memory-fix-null-pointer-deference-when-splitting-folio.patch
queue-6.12/usb-gadget-udc-fix-use-after-free-in-usb_gadget_state_work.patch
queue-6.12/spi-spi-nxp-fspi-remove-the-goto-in-probe.patch
queue-6.12/net-atlantic-fix-fragment-overflow-handling-in-rx-pa.patch
queue-6.12/bluetooth-btusb-mediatek-fix-kernel-crash-when-relea.patch
queue-6.12/mailbox-mtk-cmdq-refine-dma-address-handling-for-the.patch
queue-6.12/bluetooth-hci_core-fix-triggering-cmd_timer-for-hci_.patch
queue-6.12/platform-x86-intel-punit_ipc-fix-memory-corruption.patch
queue-6.12/veth-reduce-xdp-no_direct-return-section-to-fix-race.patch
queue-6.12/net-sched-generalize-check-for-no-queue-qdisc-on-tx-.patch
queue-6.12/iio-st_lsm6dsx-fixed-calibrated-timestamp-calculatio.patch
queue-6.12/net-lan966x-fix-the-initialization-of-taprio.patch
queue-6.12/net-phy-mxl-gpy-fix-bogus-error-on-usxgmii-and-integ.patch
queue-6.12/can-rcar_canfd-fix-can-fd-mode-as-default.patch
queue-6.12/net-dsa-sja1105-simplify-static-configuration-reload.patch
queue-6.12/veth-apply-qdisc-backpressure-on-full-ptr_ring-to-re.patch
queue-6.12/bluetooth-hci_sock-prevent-race-in-socket-write-iter.patch
queue-6.12/net-fec-do-not-allow-enabling-pps-and-perout-simulta.patch
queue-6.12/net-sxgbe-fix-potential-null-dereference-in-sxgbe_rx.patch
queue-6.12/net-dsa-microchip-do-not-execute-ptp-driver-code-for-unsupported-switches.patch
queue-6.12/spi-spi-mem-add-a-new-controller-capability.patch
queue-6.12/net-dsa-sja1105-fix-sgmii-linking-at-10m-or-100m-but.patch
queue-6.12/fs-namespace-fix-reference-leak-in-grab_requested_mn.patch
queue-6.12/usb-gadget-renesas_usbf-handle-devm_pm_runtime_enabl.patch
queue-6.12/veth-prevent-null-pointer-dereference-in-veth_xdp_rc.patch
queue-6.12/drm-amdgpu-fix-cyan_skillfish2-gpu-info-fw-handling.patch
queue-6.12/mailbox-pcc-refactor-error-handling-in-irq-handler-i.patch
queue-6.12/net-fec-cancel-perout_timer-when-perout-is-disabled.patch
queue-6.12/net-mlx5e-fix-validation-logic-in-rate-limiting.patch
queue-6.12/eth-fbnic-fix-counter-roll-over-issue.patch
queue-6.12/net-fec-do-not-register-pps-event-for-perout.patch
queue-6.12/spi-spi-mem-allow-specifying-the-byte-order-in-octal.patch
queue-6.12/net-wwan-mhi-keep-modem-name-match-with-foxconn-t99w.patch
queue-6.12/can-kvaser_usb-leaf-fix-potential-infinite-loop-in-c.patch
queue-6.12/mailbox-mailbox-test-fix-debugfs_create_dir-error-ch.patch
queue-6.12/veth-more-robust-handing-of-race-to-avoid-txq-gettin.patch
queue-6.12/usb-udc-add-trace-event-for-usb_gadget_set_state.patch
queue-6.12/spi-spi-mem-extend-spi-mem-operations-with-a-per-ope.patch
queue-6.12/net-dsa-microchip-free-previously-initialized-ports-on-init-failures.patch
queue-6.12/drm-fbcon-vga_switcheroo-avoid-race-condition-in-fbcon-setup.patch
queue-6.12/spi-bcm63xx-fix-premature-cs-deassertion-on-rx-only-.patch
queue-6.12/spi-nxp-fspi-support-per-spi-mem-operation-frequency.patch
queue-6.12/spi-spi-nxp-fspi-add-oct-dtr-mode-support.patch
queue-6.12/net-dsa-microchip-fix-symetry-in-ksz_ptp_msg_irq_-setup-free.patch
queue-6.12/spi-tegra114-remove-kconfig-dependency-on-tegra20_ap.patch
queue-6.12/can-gs_usb-gs_usb_xmit_callback-fix-handling-of-fail.patch
queue-6.12/team-move-team-device-type-change-at-the-end-of-team.patch
queue-6.12/net-aquantia-add-missing-descriptor-cache-invalidati.patch
queue-6.12/bluetooth-smp-fix-not-generating-mackey-and-ltk-when.patch
queue-6.12/mailbox-pcc-don-t-zero-error-register.patch
queue-6.12/can-gs_usb-gs_usb_receive_bulk_callback-check-actual.patch-29525
