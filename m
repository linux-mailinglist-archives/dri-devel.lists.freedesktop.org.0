Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C2374F089
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9232810E3A1;
	Tue, 11 Jul 2023 13:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-31.mta0.migadu.com (out-31.mta0.migadu.com [91.218.175.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDB810E3A3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:44:29 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689083067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mioxRfgCnMktqf+NQsUyfBt/j0+e6Die7hiL78vySM4=;
 b=o50Rhqn/rI6mD29wSKbzPZJYmt9e6fp/hpIvp/HD4IVCvtN3fDmCkP2BEa/TaEKZSqKiLH
 Ns1uoYMqYX+YwdgBtMJaUCNA/lUnk3WpAkQSycCOcVW30Ck/VGjsC+FlQbTcWdU7w1Rnjc
 wbexMQwyMoKXcI49fEi/HGLnzEuzIP0=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sui@freedesktop.org, Jingfeng@loongson.cn
Subject: [PATCH 5/6] PCI/VGA: Tidy up the code and comment format
Date: Tue, 11 Jul 2023 21:43:53 +0800
Message-Id: <20230711134354.755966-6-sui.jingfeng@linux.dev>
In-Reply-To: <20230711134354.755966-1-sui.jingfeng@linux.dev>
References: <20230711134354.755966-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

This patch replaces the leading space with a tab and removes the double
blank line and fix various typos, no functional change.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c   | 101 ++++++++++++++++++++++++-----------------
 include/linux/vgaarb.h |   4 +-
 2 files changed, 61 insertions(+), 44 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 4c448c758bab..bf96e085751d 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -32,10 +32,10 @@
 #include <linux/acpi.h>
 
 #include <linux/uaccess.h>
-
 #include <linux/vgaarb.h>
 
 static void vga_arbiter_notify_clients(void);
+
 /*
  * We keep a list of all vga devices in the system to speed
  * up the various operations of the arbiter
@@ -61,7 +61,6 @@ static bool vga_arbiter_used;
 static DEFINE_SPINLOCK(vga_lock);
 static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
 
-
 static const char *vga_iostate_to_str(unsigned int iostate)
 {
 	/* Ignore VGA_RSRC_IO and VGA_RSRC_MEM */
@@ -79,8 +78,10 @@ static const char *vga_iostate_to_str(unsigned int iostate)
 
 static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
 {
-	/* we could in theory hand out locks on IO and mem
-	 * separately to userspace but it can cause deadlocks */
+	/*
+	 * We could in theory hand out locks on IO and mem
+	 * separately to userspace but it can cause deadlocks
+	 */
 	if (strncmp(buf, "none", 4) == 0) {
 		*io_state = VGA_RSRC_NONE;
 		return 1;
@@ -99,7 +100,7 @@ static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
 	return 1;
 }
 
-/* this is only used a cookie - it should not be dereferenced */
+/* This is only used as cookie, it should not be dereferenced */
 static struct pci_dev *vga_default;
 
 /* Find somebody in our list */
@@ -193,14 +194,17 @@ int vga_remove_vgacon(struct pci_dev *pdev)
 #endif
 EXPORT_SYMBOL(vga_remove_vgacon);
 
-/* If we don't ever use VGA arb we should avoid
-   turning off anything anywhere due to old X servers getting
-   confused about the boot device not being VGA */
+/*
+ * If we don't ever use VGA arb we should avoid
+ * turning off anything anywhere due to old X servers getting
+ * confused about the boot device not being VGA
+ */
 static void vga_check_first_use(void)
 {
-	/* we should inform all GPUs in the system that
-	 * VGA arb has occurred and to try and disable resources
-	 * if they can */
+	/*
+	 * We should inform all GPUs in the system that
+	 * vgaarb has occurred and to try and disable resources if they can
+	 */
 	if (!vga_arbiter_used) {
 		vga_arbiter_used = true;
 		vga_arbiter_notify_clients();
@@ -216,7 +220,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 	unsigned int pci_bits;
 	u32 flags = 0;
 
-	/* Account for "normal" resources to lock. If we decode the legacy,
+	/*
+	 * Account for "normal" resources to lock. If we decode the legacy,
 	 * counterpart, we need to request it as well
 	 */
 	if ((rsrc & VGA_RSRC_NORMAL_IO) &&
@@ -236,7 +241,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 	if (wants == 0)
 		goto lock_them;
 
-	/* We don't need to request a legacy resource, we just enable
+	/*
+	 * We don't need to request a legacy resource, we just enable
 	 * appropriate decoding and go
 	 */
 	legacy_wants = wants & VGA_RSRC_LEGACY_MASK;
@@ -252,7 +258,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 		if (vgadev == conflict)
 			continue;
 
-		/* We have a possible conflict. before we go further, we must
+		/*
+		 * We have a possible conflict. before we go further, we must
 		 * check if we sit on the same bus as the conflicting device.
 		 * if we don't, then we must tie both IO and MEM resources
 		 * together since there is only a single bit controlling
@@ -263,13 +270,15 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 			lwants = VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM;
 		}
 
-		/* Check if the guy has a lock on the resource. If he does,
+		/*
+		 * Check if the guy has a lock on the resource. If he does,
 		 * return the conflicting entry
 		 */
 		if (conflict->locks & lwants)
 			return conflict;
 
-		/* Ok, now check if it owns the resource we want.  We can
+		/*
+		 * Ok, now check if it owns the resource we want.  We can
 		 * lock resources that are not decoded, therefore a device
 		 * can own resources it doesn't decode.
 		 */
@@ -277,14 +286,16 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 		if (!match)
 			continue;
 
-		/* looks like he doesn't have a lock, we can steal
+		/*
+		 * Looks like he doesn't have a lock, we can steal
 		 * them from him
 		 */
 
 		flags = 0;
 		pci_bits = 0;
 
-		/* If we can't control legacy resources via the bridge, we
+		/*
+		 * If we can't control legacy resources via the bridge, we
 		 * also need to disable normal decoding.
 		 */
 		if (!conflict->bridge_has_one_vga) {
@@ -311,7 +322,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 	}
 
 enable_them:
-	/* ok dude, we got it, everybody conflicting has been disabled, let's
+	/*
+	 * Ok dude, we got it, everybody conflicting has been disabled, let's
 	 * enable us.  Mark any bits in "owns" regardless of whether we
 	 * decoded them.  We can lock resources we don't decode, therefore
 	 * we must track them via "owns".
@@ -353,7 +365,8 @@ static void __vga_put(struct vga_device *vgadev, unsigned int rsrc)
 
 	vgaarb_dbg(dev, "%s\n", __func__);
 
-	/* Update our counters, and account for equivalent legacy resources
+	/*
+	 * Update our counters, and account for equivalent legacy resources
 	 * if we decode them
 	 */
 	if ((rsrc & VGA_RSRC_NORMAL_IO) && vgadev->io_norm_cnt > 0) {
@@ -371,7 +384,8 @@ static void __vga_put(struct vga_device *vgadev, unsigned int rsrc)
 	if ((rsrc & VGA_RSRC_LEGACY_MEM) && vgadev->mem_lock_cnt > 0)
 		vgadev->mem_lock_cnt--;
 
-	/* Just clear lock bits, we do lazy operations so we don't really
+	/*
+	 * Just clear lock bits, we do lazy operations so we don't really
 	 * have to bother about anything else at this point
 	 */
 	if (vgadev->io_lock_cnt == 0)
@@ -379,7 +393,8 @@ static void __vga_put(struct vga_device *vgadev, unsigned int rsrc)
 	if (vgadev->mem_lock_cnt == 0)
 		vgadev->locks &= ~VGA_RSRC_LEGACY_MEM;
 
-	/* Kick the wait queue in case somebody was waiting if we actually
+	/*
+	 * Kick the wait queue in case somebody was waiting if we actually
 	 * released something
 	 */
 	if (old_locks != vgadev->locks)
@@ -447,8 +462,8 @@ int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible)
 		if (conflict == NULL)
 			break;
 
-
-		/* We have a conflict, we wait until somebody kicks the
+		/*
+		 * We have a conflict, we wait until somebody kicks the
 		 * work queue. Currently we have one work queue that we
 		 * kick each time some resources are released, but it would
 		 * be fairly easy to have a per device one so that we only
@@ -665,7 +680,7 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
 	}
 
 	/*
-	 * vgadev has neither IO nor MEM enabled.  If we haven't found any
+	 * Vgadev has neither IO nor MEM enabled.  If we haven't found any
 	 * other VGA devices, it is the best candidate so far.
 	 */
 	if (!boot_vga)
@@ -706,7 +721,7 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
 			bus = same_bridge_vgadev->pdev->bus;
 			bridge = bus->self;
 
-			/* see if the share a bridge with this device */
+			/* See if the share a bridge with this device */
 			if (new_bridge == bridge) {
 				/*
 				 * If their direct parent bridge is the same
@@ -777,9 +792,10 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 	vgadev->decodes = VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM |
 			  VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
 
-	/* by default mark it as decoding */
+	/* By default, mark it as decoding */
 	vga_decode_count++;
-	/* Mark that we "own" resources based on our enables, we will
+	/*
+	 * Mark that we "own" resources based on our enables, we will
 	 * clear that below if the bridge isn't forwarding
 	 */
 	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
@@ -886,7 +902,7 @@ static void vga_update_device_decodes(struct vga_device *vgadev,
 		__vga_put(vgadev, decodes_unlocked);
 	}
 
-	/* change decodes counter */
+	/* Change decodes counter */
 	if (old_decodes & VGA_RSRC_LEGACY_MASK &&
 	    !(new_decodes & VGA_RSRC_LEGACY_MASK))
 		vga_decode_count--;
@@ -910,14 +926,15 @@ static void __vga_set_legacy_decoding(struct pci_dev *pdev,
 	if (vgadev == NULL)
 		goto bail;
 
-	/* don't let userspace futz with kernel driver decodes */
+	/* Don't let userspace futz with kernel driver decodes */
 	if (userspace && vgadev->set_decode)
 		goto bail;
 
-	/* update the device decodes + counter */
+	/* Update the device decodes + counter */
 	vga_update_device_decodes(vgadev, decodes);
 
-	/* XXX if somebody is going from "doesn't decode" to "decodes" state
+	/*
+	 * XXX if somebody is going from "doesn't decode" to "decodes" state
 	 * here, additional care must be taken as we may have pending owner
 	 * ship of non-legacy region ...
 	 */
@@ -952,9 +969,9 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
  * @set_decode callback: If a client can disable its GPU VGA resource, it
  * will get a callback from this to set the encode/decode state.
  *
- * Rationale: we cannot disable VGA decode resources unconditionally some single
- * GPU laptops seem to require ACPI or BIOS access to the VGA registers to
- * control things like backlights etc.  Hopefully newer multi-GPU laptops do
+ * Rationale: we cannot disable VGA decode resources unconditionally, some
+ * single GPU laptops seem to require ACPI or BIOS access to the VGA registers
+ * to control things like backlights etc. Hopefully newer multi-GPU laptops do
  * something saner, and desktops won't have any special ACPI for this. The
  * driver will get a callback when VGA arbitration is first used by userspace
  * since some older X servers have issues.
@@ -984,7 +1001,6 @@ int vga_client_register(struct pci_dev *pdev,
 bail:
 	spin_unlock_irqrestore(&vga_lock, flags);
 	return ret;
-
 }
 EXPORT_SYMBOL(vga_client_register);
 
@@ -1075,7 +1091,6 @@ static int vga_pci_str_to_vars(char *buf, int count, unsigned int *domain,
 	int n;
 	unsigned int slot, func;
 
-
 	n = sscanf(buf, "PCI:%x:%x:%x.%x", domain, bus, &slot, &func);
 	if (n != 4)
 		return 0;
@@ -1310,7 +1325,7 @@ static ssize_t vga_arb_write(struct file *file, const char __user *buf,
 		curr_pos += 7;
 		remaining -= 7;
 		pr_debug("client 0x%p called 'target'\n", priv);
-		/* if target is default */
+		/* If target is default */
 		if (!strncmp(curr_pos, "default", 7))
 			pdev = pci_dev_get(vga_default_device());
 		else {
@@ -1427,7 +1442,6 @@ static int vga_arb_open(struct inode *inode, struct file *file)
 	priv->cards[0].io_cnt = 0;
 	priv->cards[0].mem_cnt = 0;
 
-
 	return 0;
 }
 
@@ -1461,7 +1475,7 @@ static int vga_arb_release(struct inode *inode, struct file *file)
 }
 
 /*
- * callback any registered clients to let them know we have a
+ * Callback any registered clients to let them know we have a
  * change in VGA cards
  */
 static void vga_arbiter_notify_clients(void)
@@ -1500,9 +1514,12 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
 		return 0;
 
-	/* For now we're only intereted in devices added and removed. I didn't
+	/*
+	 * For now we're only interested in devices added and removed. I didn't
 	 * test this thing here, so someone needs to double check for the
-	 * cases of hotplugable vga cards. */
+	 * cases of hotplugable vga cards.
+	 */
+
 	if (action == BUS_NOTIFY_ADD_DEVICE)
 		notify = vga_arbiter_add_pci_device(pdev);
 	else if (action == BUS_NOTIFY_DEL_DEVICE)
diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index b4b9137f9792..6d5465f8c3f2 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -96,7 +96,7 @@ static inline int vga_client_register(struct pci_dev *pdev,
 static inline int vga_get_interruptible(struct pci_dev *pdev,
 					unsigned int rsrc)
 {
-       return vga_get(pdev, rsrc, 1);
+	return vga_get(pdev, rsrc, 1);
 }
 
 /**
@@ -111,7 +111,7 @@ static inline int vga_get_interruptible(struct pci_dev *pdev,
 static inline int vga_get_uninterruptible(struct pci_dev *pdev,
 					  unsigned int rsrc)
 {
-       return vga_get(pdev, rsrc, 0);
+	return vga_get(pdev, rsrc, 0);
 }
 
 static inline void vga_client_unregister(struct pci_dev *pdev)
-- 
2.25.1

