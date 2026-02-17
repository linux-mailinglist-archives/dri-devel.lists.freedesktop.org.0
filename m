Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHZ9HxFylWkWRgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:02:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AA5153D6C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AC210E57A;
	Wed, 18 Feb 2026 08:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=mhklkml@zohomail.com header.b="BDkZPA5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com
 [136.143.188.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C6788DA9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 18:24:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771352626; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=elYPn0Vr4RsE0bGjcitHsOdQN16Q+v3K63PxWAitrUR9vjmro/DjYCWRX/gB4z+NPBLHHiV9jp09oPT4VyA78HsblZQi9nfEt3qmajM8F05WnSNpq2QhL8LWYZrUNE5/3JwrY4eTwXCmJ+/NWwqnki+Wh4JxJi+5ZB3o2ZUFLKI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771352626;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Reply-To:References:Subject:Subject:To:To:Message-Id;
 bh=bCbocMqgUYFnJ+oYDgGHoTYrgPMBZlnF95h5ckvogTc=; 
 b=Xzwl2HRyIlgivVwG9d5uR7Zln+XtbHKKYYgCthhSZ1Z4ltHiglA6acM7mP9i44yLV8vMROYf0MwESSL4KiCIg0A8L/Yqb1Wj/ewdBmq4TRcAltPZ4dCY6FxxkFm59JEtwnIuXVClKEUV7aF8wtkiB3L5vpcZfrgFkw4dUA/rPxg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=mhklkml@zohomail.com;
 dmarc=pass header.from=<mhklkml@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771352626; 
 s=zm2022; d=zohomail.com; i=mhklkml@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:Reply-To:Reply-To:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=bCbocMqgUYFnJ+oYDgGHoTYrgPMBZlnF95h5ckvogTc=;
 b=BDkZPA5eqeBJQZ9hfSejXzc4Ssff0BgcpM4EteApGsJ49atosvnHoFi6HQUqDj2m
 mN/mFVQRUzGRo7befhRhY3VzjdqiGVMwU+ZaGyUunlmbnQrQWKN81IhWPFnV/bm7MbW
 aMVX1BhP2CepPOaizmY8Z5J19MubOg1aNy+ZwfEI=
Received: by mx.zohomail.com with SMTPS id 1771352623819939.9981858150902;
 Tue, 17 Feb 2026 10:23:43 -0800 (PST)
From: Michael Kelley <mhklkml@zohomail.com>
To: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, longli@microsoft.com,
 ryasuoka@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 2/2] drm/hyperv: During panic do VMBus unload after frame
 buffer is flushed
Date: Tue, 17 Feb 2026 10:23:35 -0800
Message-Id: <20260217182335.265585-2-mhklkml@zohomail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260217182335.265585-1-mhklkml@zohomail.com>
References: <20260217182335.265585-1-mhklkml@zohomail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227b2401215a7bf2b8306f9898d000025434cf800c0383b4465d5f9756fcc758ae3994a376c0510ac:zu08011227b23318a12f7d079f4eda8acf000022701c04a2c86e6073d06bac3e2f27ba60d6a0fac42dd94141:rf08011226056746b3e97faaae845a475700004e492f8612d1d2d6af5354727a3ac0c9b7a183b60a6beecc:ZohoMail
X-ZohoMailClient: External
X-Mailman-Approved-At: Wed, 18 Feb 2026 08:02:15 +0000
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
X-Spamd-Result: default: False [2.69 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zohomail.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[zohomail.com:s=zm2022];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	FROM_NEQ_ENVFROM(0.00)[mhklkml@zohomail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:drawat.floss@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ryasuoka@redhat.com,m:jfalempe@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:stable@vger.kernel.org,m:drawatfloss@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,microsoft.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mhklkml@zohomail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[zohomail.com:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_NONE(0.00)[];
	HAS_REPLYTO(0.00)[mhklinux@outlook.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 31AA5153D6C
X-Rspamd-Action: no action

From: Michael Kelley <mhklinux@outlook.com>

In a VM, Linux panic information (reason for the panic, stack trace,
etc.) may be written to a serial console and/or a virtual frame buffer
for a graphics console. The latter may need to be flushed back to the
host hypervisor for display.

The current Hyper-V DRM driver for the frame buffer does the flushing
*after* the VMBus connection has been unloaded, such that panic messages
are not displayed on the graphics console. A user with a Hyper-V graphics
console is left with just a hung empty screen after a panic. The enhanced
control that DRM provides over the panic display in the graphics console
is similarly non-functional.

Commit 3671f3777758 ("drm/hyperv: Add support for drm_panic") added
the Hyper-V DRM driver support to flush the virtual frame buffer. It
provided necessary functionality but did not handle the sequencing
problem with VMBus unload.

Fix the full problem by using VMBus functions to suppress the VMBus
unload that is normally done by the VMBus driver in the panic path. Then
after the frame buffer has been flushed, do the VMBus unload so that a
kdump kernel can start cleanly. As expected, CONFIG_DRM_PANIC must be
selected for these changes to have effect. As a side benefit, the
enhanced features of the DRM panic path are also functional.

Fixes: 3671f3777758 ("drm/hyperv: Add support for drm_panic")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
Changes in v2: Removed test of CONFIG_PRINTK in deciding whether
   to have VMBus skip the unload. A separate patch by Jocelyn Falempe
   incorporates the CONFIG_PRINTK dependency into CONFIG_DRM_PANIC.

 drivers/gpu/drm/hyperv/hyperv_drm_drv.c     |  5 +++++
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 15 ++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 06b5d96e6eaf..b6bf6412ae34 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -150,6 +150,10 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 		goto err_free_mmio;
 	}
 
+	/* If DRM panic path is stubbed out VMBus code must do the unload */
+	if (IS_ENABLED(CONFIG_DRM_PANIC))
+		vmbus_set_skip_unload(true);
+
 	drm_client_setup(dev, NULL);
 
 	return 0;
@@ -169,6 +173,7 @@ static void hyperv_vmbus_remove(struct hv_device *hdev)
 	struct drm_device *dev = hv_get_drvdata(hdev);
 	struct hyperv_drm_device *hv = to_hv(dev);
 
+	vmbus_set_skip_unload(false);
 	drm_dev_unplug(dev);
 	drm_atomic_helper_shutdown(dev);
 	vmbus_close(hdev->channel);
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 7978f8c8108c..d48ca6c23b7c 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -212,15 +212,16 @@ static void hyperv_plane_panic_flush(struct drm_plane *plane)
 	struct hyperv_drm_device *hv = to_hv(plane->dev);
 	struct drm_rect rect;
 
-	if (!plane->state || !plane->state->fb)
-		return;
+	if (plane->state && plane->state->fb) {
+		rect.x1 = 0;
+		rect.y1 = 0;
+		rect.x2 = plane->state->fb->width;
+		rect.y2 = plane->state->fb->height;
 
-	rect.x1 = 0;
-	rect.y1 = 0;
-	rect.x2 = plane->state->fb->width;
-	rect.y2 = plane->state->fb->height;
+		hyperv_update_dirt(hv->hdev, &rect);
+	}
 
-	hyperv_update_dirt(hv->hdev, &rect);
+	vmbus_initiate_unload(true);
 }
 
 static const struct drm_plane_helper_funcs hyperv_plane_helper_funcs = {
-- 
2.25.1

