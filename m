Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841CC595F60
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 17:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAE5AE119;
	Tue, 16 Aug 2022 15:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6059670B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 15:37:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 494121FE9D;
 Tue, 16 Aug 2022 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660664223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5V5Vy14t6jdiTGaKqlIcvrv64izEzAevML5/nEKPwug=;
 b=c7ttlbP9rj/J6LQWG8oBHVatxuxxLAeXMWL6JQU80+Z66a1gEeq/zh4ilaCCIwNUJ/X8hP
 G8lizUGENB8qLtoWYBLIqpo8d+uSHO53bMQEvz9+Qv63RUJVhWjMx5xxZpsAqA/SDWjVG2
 3gr5hg+uQfeqblPII4rge0fJLUSEIv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660664223;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5V5Vy14t6jdiTGaKqlIcvrv64izEzAevML5/nEKPwug=;
 b=sCAWcOUkr0to58YSxSVvEhhlhHOGQq1UfTwXu5UMtmB/gIDxUwVzYjhvljptfRSWcIPvXD
 H50ONnaOWuFTNvCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 249FC139B7;
 Tue, 16 Aug 2022 15:37:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cL/YAZ+5+2LKJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 16 Aug 2022 15:37:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/12] drm/udl: Add parameter to set number of URBs
Date: Tue, 16 Aug 2022 17:36:50 +0200
Message-Id: <20220816153655.27526-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220816153655.27526-1-tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

For further debugging and optimization purpose, allow users to adjust
the number of URBs via a new module parameter, numurbs.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 2b7eafd48ec2..3c97f647883f 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -8,6 +8,8 @@
  * Copyright (C) 2009 Bernie Thompson <bernie@plugable.com>
  */
 
+#include <linux/moduleparam.h>
+
 #include <drm/drm.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -23,6 +25,9 @@
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
 
+static uint udl_num_urbs = WRITES_IN_FLIGHT;
+module_param_named(numurbs, udl_num_urbs, uint, 0600);
+
 static int udl_parse_vendor_descriptor(struct udl_device *udl)
 {
 	struct usb_device *udev = udl_to_usb_device(udl);
@@ -294,6 +299,8 @@ int udl_init(struct udl_device *udl)
 	struct drm_device *dev = &udl->drm;
 	int ret = -ENOMEM;
 
+	drm_info(dev, "pre-allocating %d URBs\n", udl_num_urbs);
+
 	DRM_DEBUG("\n");
 
 	udl->dmadev = usb_intf_get_dma_device(to_usb_interface(dev->dev));
@@ -311,7 +318,7 @@ int udl_init(struct udl_device *udl)
 	if (udl_select_std_channel(udl))
 		DRM_ERROR("Selecting channel failed\n");
 
-	if (!udl_alloc_urb_list(dev, WRITES_IN_FLIGHT, MAX_TRANSFER)) {
+	if (!udl_alloc_urb_list(dev, udl_num_urbs, MAX_TRANSFER)) {
 		DRM_ERROR("udl_alloc_urb_list failed\n");
 		goto err;
 	}
-- 
2.35.3

