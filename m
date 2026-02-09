Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBvJAYeGiWkn+gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 08:02:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B1510C4A5
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 08:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8CE10E1F9;
	Mon,  9 Feb 2026 07:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OS8W6XHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com
 [74.125.82.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F7110E1F9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 07:02:26 +0000 (UTC)
Received: by mail-dy1-f194.google.com with SMTP id
 5a478bee46e88-2b86d3c909dso919641eec.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 23:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770620546; x=1771225346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QTQsukcOvGgA1IOwGu0V6U/4Hj9O7nggXaNLrVfcPCU=;
 b=OS8W6XHYEAzU5eQxj1lRdC3YW10uHDlfwwjFadqF4MT168/OXzWTKpsex/TmXDDp1C
 FUjlheJLLQz7mFX4cRrdNT0VQ/1PaRKuvmuWySsg5e39+vy43ALawrCiRvLAlZF151En
 pTonNgY1Xn40j7TCOtQiHfg4IFGRcDDvmSYqrnzRuF1BI1GJYD4V+0Obr75SDEuLkYZo
 VcW8MKG9sISXfz+++COiVNVQkf/Gy35Yb2kOXaJQQP5nvN7WH0/bEqIyQ7v0paHWamCU
 kOKJB4xfA9WcGSJAl2J8Y8TTTpd9QafqrzcrDP7Sfk7XmifdCWRgfCD227VCahI44bQo
 1mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770620546; x=1771225346;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QTQsukcOvGgA1IOwGu0V6U/4Hj9O7nggXaNLrVfcPCU=;
 b=sW8j1mVlPXrDE7GO4DRc9o3w/KAg6jQkKCxC2xDP/tpZHRYM4zYitva55jyxYgWY6c
 fHm8z9e8Fz1UHXNy/fCZl/urRVlgncAvti+g/q4ZpTTAc4bD/7bIbX/RbbbMGt75znn1
 KBAdJ43FtHKqTjWg96IqoriAsKRLeM8mQywqkhx3cBuiUNVeKxsR9xRUAEbYtaHeHR1t
 PGDnL8ItcGfVWlYrYNBX5tOLvFXiNp34wPEQOhStP6uHXbCD5JO5ZoAoaIR/0BfYr8dc
 N6xs69SJk2W0ud5pQR/THaFj3TVmQRoNUeTtOrBlW/w8/oUbrX6F4hZnw5cAMHls+l49
 qseA==
X-Gm-Message-State: AOJu0Yw1eEV3SMmo3lPHCZVvFT8N+wEDZiBYBzoiMTNoICMgkfvEYBpd
 7NoxMZZARix5WYue5V8QMammElyknWz6Z14kLiTDMOMFQpxQjYf3G/W0
X-Gm-Gg: AZuq6aKQhettx5SN99k8INacpak9L3XlBGi+/mIKKbHiSIF6oKF26ac8QhV1wvgmWN5
 G1/qvP9my2AEN6AHfVb8luhfbkI0gzHRK6Zk9Yi5vum+atWedGo2KTa6UwMZoAKFAYTqlG8HlKv
 rI/OmZm1PsFG4JwEpqSRv753chPiC7tTl99o+JS0LQiiZbLBTiXrG5yMx+0BnwdvYsLM5c+7NcG
 DCLfiUTx9UP6ZIHpT2q+tYTKXPNLfmDzoN62QuDwcDyM4m9JShwHsTte4ODrvzqfge9mAYfNwjQ
 CQN/NGxHo0CBTw86NJjY0cJDSMfqB4D57yQl17ieBJ30RXX8sC64byMVl4f0Es/0ENRXJ9pJxAq
 GsSMZY8t0O21Xa8Ytsn4/EyojRAHKhx481GI0yty8VgXla7PaCwBqpFNsGOGBGUlXJPRqAQ0Stn
 S0SrYfrh89WO4HPZRYOKW1wPj+VWAzvg==
X-Received: by 2002:a05:7301:38a6:b0:2b8:31e5:918 with SMTP id
 5a478bee46e88-2b856a4c311mr3244690eec.37.1770620545505; 
 Sun, 08 Feb 2026 23:02:25 -0800 (PST)
Received: from mhkubun.search.charter.net ([66.91.163.55])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12706faa047sm6966305c88.14.2026.02.08.23.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 23:02:25 -0800 (PST)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, longli@microsoft.com,
 ryasuoka@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 1/2] Drivers: hv: vmbus: Provide option to skip VMBus unload
 on panic
Date: Sun,  8 Feb 2026 23:02:00 -0800
Message-Id: <20260209070201.1492-1-mhklinux@outlook.com>
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.69 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM_DOM(3.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:drawat.floss@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ryasuoka@redhat.com,m:jfalempe@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:stable@vger.kernel.org,m:drawatfloss@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,microsoft.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mhkelley58@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.847];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhkelley58@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[mhklinux@outlook.com];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:replyto,outlook.com:email,outlook.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 65B1510C4A5
X-Rspamd-Action: no action

From: Michael Kelley <mhklinux@outlook.com>

Currently, VMBus code initiates a VMBus unload in the panic path so
that if a kdump kernel is loaded, it can start fresh in setting up its
own VMBus connection. However, a driver for the VMBus virtual frame
buffer may need to flush dirty portions of the frame buffer back to
the Hyper-V host so that panic information is visible in the graphics
console. To support such flushing, provide exported functions for the
frame buffer driver to specify that the VMBus unload should not be
done by the VMBus driver, and to initiate the VMBus unload itself.
Together these allow a frame buffer driver to delay the VMBus unload
until after it has completed the flush.

Ideally, the VMBus driver could use its own panic-path callback to do
the unload after all frame buffer drivers have finished. But DRM frame
buffer drivers use the kmsg dump callback, and there are no callbacks
after that in the panic path. Hence this somewhat messy approach to
properly sequencing the frame buffer flush and the VMBus unload.

Fixes: 3671f3777758 ("drm/hyperv: Add support for drm_panic")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/hv/channel_mgmt.c |  1 +
 drivers/hv/hyperv_vmbus.h |  1 -
 drivers/hv/vmbus_drv.c    | 25 ++++++++++++++++++-------
 include/linux/hyperv.h    |  3 +++
 4 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
index 74fed2c073d4..5de83676dbad 100644
--- a/drivers/hv/channel_mgmt.c
+++ b/drivers/hv/channel_mgmt.c
@@ -944,6 +944,7 @@ void vmbus_initiate_unload(bool crash)
 	else
 		vmbus_wait_for_unload();
 }
+EXPORT_SYMBOL_GPL(vmbus_initiate_unload);
 
 static void vmbus_setup_channel_state(struct vmbus_channel *channel,
 				      struct vmbus_channel_offer_channel *offer)
diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index cdbc5f5c3215..5d3944fc93ae 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -440,7 +440,6 @@ void hv_vss_deinit(void);
 int hv_vss_pre_suspend(void);
 int hv_vss_pre_resume(void);
 void hv_vss_onchannelcallback(void *context);
-void vmbus_initiate_unload(bool crash);
 
 static inline void hv_poll_channel(struct vmbus_channel *channel,
 				   void (*cb)(void *))
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 6785ad63a9cb..97dfa529d250 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -69,19 +69,29 @@ bool vmbus_is_confidential(void)
 }
 EXPORT_SYMBOL_GPL(vmbus_is_confidential);
 
+static bool skip_vmbus_unload;
+
+/*
+ * Allow a VMBus framebuffer driver to specify that in the case of a panic,
+ * it will do the VMbus unload operation once it has flushed any dirty
+ * portions of the framebuffer to the Hyper-V host.
+ */
+void vmbus_set_skip_unload(bool skip)
+{
+	skip_vmbus_unload = skip;
+}
+EXPORT_SYMBOL_GPL(vmbus_set_skip_unload);
+
 /*
  * The panic notifier below is responsible solely for unloading the
  * vmbus connection, which is necessary in a panic event.
- *
- * Notice an intrincate relation of this notifier with Hyper-V
- * framebuffer panic notifier exists - we need vmbus connection alive
- * there in order to succeed, so we need to order both with each other
- * [see hvfb_on_panic()] - this is done using notifiers' priorities.
  */
 static int hv_panic_vmbus_unload(struct notifier_block *nb, unsigned long val,
 			      void *args)
 {
-	vmbus_initiate_unload(true);
+	if (!skip_vmbus_unload)
+		vmbus_initiate_unload(true);
+
 	return NOTIFY_DONE;
 }
 static struct notifier_block hyperv_panic_vmbus_unload_block = {
@@ -2848,7 +2858,8 @@ static void hv_crash_handler(struct pt_regs *regs)
 {
 	int cpu;
 
-	vmbus_initiate_unload(true);
+	if (!skip_vmbus_unload)
+		vmbus_initiate_unload(true);
 	/*
 	 * In crash handler we can't schedule synic cleanup for all CPUs,
 	 * doing the cleanup for current CPU only. This should be sufficient
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index dfc516c1c719..b0502a336eb3 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1334,6 +1334,9 @@ int vmbus_allocate_mmio(struct resource **new, struct hv_device *device_obj,
 			bool fb_overlap_ok);
 void vmbus_free_mmio(resource_size_t start, resource_size_t size);
 
+void vmbus_initiate_unload(bool crash);
+void vmbus_set_skip_unload(bool skip);
+
 /*
  * GUID definitions of various offer types - services offered to the guest.
  */
-- 
2.25.1

