Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9064BA2EDA7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7F710E52D;
	Mon, 10 Feb 2025 13:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VnNJKkS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A6510E52D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:25:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 185EAA4142C;
 Mon, 10 Feb 2025 13:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BA2C4CEDF;
 Mon, 10 Feb 2025 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739193932;
 bh=jnjZonpT7qi8X2dC34i7YsDs72OBFJbfNvodus+VhUs=;
 h=Subject:To:Cc:From:Date:From;
 b=VnNJKkS6DA3hAl8ed2F0FOnbvVag3dCZutcWTFKQ60J7VrOs5Lx6iaK0IaFFBCzVv
 7cgrH0TaVMjoQMYS3Erfp9grUrgLqm+k5BJ1Zqy2c7t9k+PQHKoS3F387Xfltc3ZtS
 qyN0C5npSCBK9667k8qlFrno7Si2MdDM570Wy1dM=
Subject: Patch "drm/rockchip: cdn-dp: Use
 drm_connector_helper_hpd_irq_event()" has been added to the 6.1-stable tree
To: andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, groeck@chromium.org, heiko@sntech.de,
 hjc@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, tzimmermann@suse.de, zyw@rock-chips.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 10 Feb 2025 14:23:32 +0100
Message-ID: <2025021032-canister-stained-b1fd@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

    drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-rockchip-cdn-dp-use-drm_connector_helper_hpd_irq_event.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 666e1960464140cc4bc9203c203097e70b54c95a Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 5 Nov 2024 14:38:16 +0100
Subject: drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 666e1960464140cc4bc9203c203097e70b54c95a upstream.

The code for detecting and updating the connector status in
cdn_dp_pd_event_work() has a number of problems.

- It does not aquire the locks to call the detect helper and update
the connector status. These are struct drm_mode_config.connection_mutex
and struct drm_mode_config.mutex.

- It does not use drm_helper_probe_detect(), which helps with the
details of locking and detection.

- It uses the connector's status field to determine a change to
the connector status. The epoch_counter field is the correct one. The
field signals a change even if the connector status' value did not
change.

Replace the code with a call to drm_connector_helper_hpd_irq_event(),
which fixes all these problems.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 81632df69772 ("drm/rockchip: cdn-dp: do not use drm_helper_hpd_irq_event")
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: <stable@vger.kernel.org> # v4.11+
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20241105133848.480407-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -948,9 +948,6 @@ static void cdn_dp_pd_event_work(struct
 {
 	struct cdn_dp_device *dp = container_of(work, struct cdn_dp_device,
 						event_work);
-	struct drm_connector *connector = &dp->connector;
-	enum drm_connector_status old_status;
-
 	int ret;
 
 	mutex_lock(&dp->lock);
@@ -1012,11 +1009,7 @@ static void cdn_dp_pd_event_work(struct
 
 out:
 	mutex_unlock(&dp->lock);
-
-	old_status = connector->status;
-	connector->status = connector->funcs->detect(connector, false);
-	if (old_status != connector->status)
-		drm_kms_helper_hotplug_event(dp->drm_dev);
+	drm_connector_helper_hpd_irq_event(&dp->connector);
 }
 
 static int cdn_dp_pd_event(struct notifier_block *nb,


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.1/drm-rockchip-cdn-dp-use-drm_connector_helper_hpd_irq_event.patch
queue-6.1/efi-sysfb_efi-fix-w-1-warnings-when-efi-is-not-set.patch
queue-6.1/drm-modeset-handle-tiled-displays-in-pan_display_atomic.patch
queue-6.1/m68k-vga-fix-i-o-defines.patch
