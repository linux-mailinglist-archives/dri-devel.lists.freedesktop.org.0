Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO7WOUsMhWlm7wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:31:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738CBF7B2C
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 22:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BCB10E10C;
	Thu,  5 Feb 2026 21:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OhmmVp5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C354510E10C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 21:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Be/mSZZ+NwiAK2hCJQPAGc5jfEFQumKM5u6o074cCS4=; b=OhmmVp5qpa5Q4Xj04tE0MLZ2pU
 cKV6+gKmPluukojoUHzdgMSwnjNailr0OUvm3h5O7+XBbcsu55zc0S4XzoTevLswuQZpAYSG2tYev
 2VNEqzean5IG2u1AFuXqldzVeaf8DMaSUk9yMox5JkgiiAD+ponxv6AeV7XlwRMk6SWufHOmu0WNX
 ZVimtRZTlH9MXyRWUcCDfQe+fx+ip3tucoZTh6uu1YsjFtdFC5Z0Hy1H4+JildE5ts+PyUOnBf9Oc
 PDAb5H+PuQbCUh2EIkkezCGRaVEENXT4P8oOj/F5spRlRqIyNN3fxlO/9ihBoFcxvhzi1zbUl5qsf
 LNDgWSqA==;
Received: from [187.36.210.68]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vo6wz-00EZx4-Ar; Thu, 05 Feb 2026 22:31:45 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 05 Feb 2026 18:31:10 -0300
Subject: [PATCH 11/11] drm/vc4: Use devm_request_irq() for automatic
 cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-vc4-drm-scheduler-v1-11-c6174fd7bbc1@igalia.com>
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
In-Reply-To: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=nxwXUqF1NesNCQ6lqHCcWqL1WUvIpeW/6+qYDhj8ZtU=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBphQweNOTGtTd/pYwxJNGhJM7uUOBw2KWP8J0O4
 zpvP7Fl0MmJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaYUMHgAKCRA/8w6Kdoj6
 qjg2B/9YfwAdl6wAaPA/PusSIeg1wdaXQ+i57mB/Spxc2qWkpJJT8X/LdCLAGNb/lMU5QZsbMNA
 LCCC7y00GAXygHDBxP1TI6Eb3OydrlHtIrOK/OUpNXPeyCucjS0wZTh6UjnGrr5vRMiDVF35wzL
 8mIZEhDWwHdi/aMgWGtLyvTuFdDzzosJrzAAq2IY/1e+Z1Qr3ONYkcc7mTgxefNuJYnNEoqCyv1
 zo3r+3GiecHphYfzpN+AxrDqxghn2Q0e1Nz4N1tdwpddRRd+SulGYlZ9BTj6rS0Xk9WhscSWoUg
 cD/wAT/THcDTBySmOsSCngN8tCTOyCKMbMZHC4XeODSVT51e
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,m:mcanal@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,raspberrypi.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 738CBF7B2C
X-Rspamd-Action: no action

Switch from request_irq()/free_irq() to the device-managed alternative
devm_request_irq(), letting device-managed resource cleanup handle IRQ
teardown automatically.

While here, inline vc4_irq_prepare() into vc4_irq_install() since it's
the only caller.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_irq.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index aa6cccf58917a51549099ede4b3272e9627ff39c..36d061e6ab8f3f4b9e199cd6810a0c39e00be573 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -47,7 +47,6 @@
 
 #include <linux/platform_device.h>
 
-#include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 
 #include "vc4_drv.h"
@@ -163,22 +162,6 @@ vc4_irq(int irq, void *arg)
 	return status;
 }
 
-static void
-vc4_irq_prepare(struct drm_device *dev)
-{
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-
-	if (!vc4->v3d)
-		return;
-
-	INIT_WORK(&vc4->overflow_mem_work, vc4_overflow_mem_work);
-
-	/* Clear any pending interrupts someone might have left around
-	 * for us.
-	 */
-	V3D_WRITE(V3D_INTCTL, V3D_DRIVER_IRQS);
-}
-
 void
 vc4_irq_enable(struct drm_device *dev)
 {
@@ -227,12 +210,21 @@ int vc4_irq_install(struct drm_device *dev, int irq)
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
 
+	if (!vc4->v3d)
+		return -ENODEV;
+
 	if (irq == IRQ_NOTCONNECTED)
 		return -ENOTCONN;
 
-	vc4_irq_prepare(dev);
+	INIT_WORK(&vc4->overflow_mem_work, vc4_overflow_mem_work);
 
-	ret = request_irq(irq, vc4_irq, 0, dev->driver->name, dev);
+	/* Clear any pending interrupts someone might have left around
+	 * for us.
+	 */
+	V3D_WRITE(V3D_INTCTL, V3D_DRIVER_IRQS);
+
+	ret = devm_request_irq(dev->dev, irq, vc4_irq, 0,
+			       dev_name(dev->dev), dev);
 	if (ret)
 		return ret;
 
@@ -249,7 +241,6 @@ void vc4_irq_uninstall(struct drm_device *dev)
 		return;
 
 	vc4_irq_disable(dev);
-	free_irq(vc4->irq, dev);
 }
 
 /** Reinitializes interrupt registers when a GPU reset is performed. */

-- 
2.52.0

