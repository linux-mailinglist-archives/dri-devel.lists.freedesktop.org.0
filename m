Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED1E94ED13
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 14:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ED610E1E2;
	Mon, 12 Aug 2024 12:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k/7U16R+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D9210E1E1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 12:32:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 50432CE0E10;
 Mon, 12 Aug 2024 12:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9BDC32782;
 Mon, 12 Aug 2024 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1723465944;
 bh=5t0sd09TSNJUgGXtbbDFZPbleNyzzc7H7jCd7EUKTvk=;
 h=Subject:To:Cc:From:Date:From;
 b=k/7U16R+f7uMqJUEo9ktxbgi4sotQztmwFYLkTXtjX3ad1zkAIE+BSoktj37D8TGn
 jv3g31lFyLKi317msHPWmTMxm3BOgQ9CJKIcyrBqon35vdaOYDEhSK/67otd8Rry4V
 dgXko0VkH5EhjEk9X5MwJjtz9K8tswgoBKVqdraQ=
Subject: Patch "drm/mgag200: Bind I2C lifetime to DRM device" has been added
 to the 6.6-stable tree
To: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jfalempe@redhat.com, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 12 Aug 2024 14:32:09 +0200
Message-ID: <2024081208-giveaway-imitate-0c62@gregkh>
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

    drm/mgag200: Bind I2C lifetime to DRM device

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-mgag200-bind-i2c-lifetime-to-drm-device.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From eb1ae34e48a09b7a1179c579aed042b032e408f4 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 13 May 2024 14:51:07 +0200
Subject: drm/mgag200: Bind I2C lifetime to DRM device

From: Thomas Zimmermann <tzimmermann@suse.de>

commit eb1ae34e48a09b7a1179c579aed042b032e408f4 upstream.

Managed cleanup with devm_add_action_or_reset() will release the I2C
adapter when the underlying Linux device goes away. But the connector
still refers to it, so this cleanup leaves behind a stale pointer
in struct drm_connector.ddc.

Bind the lifetime of the I2C adapter to the connector's lifetime by
using DRM's managed release. When the DRM device goes away (after
the Linux device) DRM will first clean up the connector and then
clean up the I2C adapter.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Fixes: b279df242972 ("drm/mgag200: Switch I2C code to managed cleanup")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.0+
Link: https://patchwork.freedesktop.org/patch/msgid/20240513125620.6337-3-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/mgag200/mgag200_i2c.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -31,6 +31,8 @@
 #include <linux/i2c.h>
 #include <linux/pci.h>
 
+#include <drm/drm_managed.h>
+
 #include "mgag200_drv.h"
 
 static int mga_i2c_read_gpio(struct mga_device *mdev)
@@ -86,7 +88,7 @@ static int mga_gpio_getscl(void *data)
 	return (mga_i2c_read_gpio(mdev) & i2c->clock) ? 1 : 0;
 }
 
-static void mgag200_i2c_release(void *res)
+static void mgag200_i2c_release(struct drm_device *dev, void *res)
 {
 	struct mga_i2c_chan *i2c = res;
 
@@ -126,5 +128,5 @@ int mgag200_i2c_init(struct mga_device *
 	if (ret)
 		return ret;
 
-	return devm_add_action_or_reset(dev->dev, mgag200_i2c_release, i2c);
+	return drmm_add_action_or_reset(dev, mgag200_i2c_release, i2c);
 }


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.6/drm-client-fix-null-pointer-dereference-in-drm_client_modeset_probe.patch
queue-6.6/drm-mgag200-bind-i2c-lifetime-to-drm-device.patch
queue-6.6/drm-mgag200-set-ddc-timeout-in-milliseconds.patch
