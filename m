Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C873B6A3691
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9545C10E1C2;
	Mon, 27 Feb 2023 02:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A0010E1C2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 02:02:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9322ACE0F25;
 Mon, 27 Feb 2023 02:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B07C43322;
 Mon, 27 Feb 2023 02:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463362;
 bh=5UYEGbrQxFbgUy2+BNJoafF+CnynkBcqQ6dHdKEbBBg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uzVAZmGco6xW7flGNiVEmLty4xc8TlsrGLXd9pl9R7Z8WJMqYCYTVRRKkKAwJn6d9
 dDkLKJYcRBTBl9FeRW612O3orpKUcqs/lr4TyLQdTN9WmFPN0hIlf+mmvGVRg3lSzo
 5k7BMSCAcDRW/8NCLY2rDhcO4riJ3Y2B77E9XH6OzSvtv9eNQze7cwhiCgiNIiLdCo
 21qJKTqujNojivWaY+A5IbVN+wuqWixBdtUmx/1c3+QH1gVAlfk/MqSx86EZpC4I3/
 ASkAgz0tefuNeFAVRZXPup6TKNx3LXST7pPJEHp3eXvP98mPBwVvYVVuOWHVa4Ezjc
 uA56VnJFhIHGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 29/60] drm/client: Test for connectors before
 sending hotplug event
Date: Sun, 26 Feb 2023 21:00:14 -0500
Message-Id: <20230227020045.1045105-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit c2bb3be64eb7182285846123219230375af61abd ]

Test for connectors in the client code and remove a similar test
from the generic fbdev emulation. Do nothing if the test fails.
Not having connectors indicates a driver bug.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230125200415.14123-2-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_client.c        | 5 +++++
 drivers/gpu/drm/drm_fbdev_generic.c | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 056ab9d5f313b..313cbabb12b2d 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -198,6 +198,11 @@ void drm_client_dev_hotplug(struct drm_device *dev)
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return;
 
+	if (!dev->mode_config.num_connector) {
+		drm_dbg_kms(dev, "No connectors found, will not send hotplug events!\n");
+		return;
+	}
+
 	mutex_lock(&dev->clientlist_mutex);
 	list_for_each_entry(client, &dev->clientlist, list) {
 		if (!client->funcs || !client->funcs->hotplug)
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 593aa3283792b..215fe16ff1fb4 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -390,11 +390,6 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 	if (dev->fb_helper)
 		return drm_fb_helper_hotplug_event(dev->fb_helper);
 
-	if (!dev->mode_config.num_connector) {
-		drm_dbg_kms(dev, "No connectors found, will not create framebuffer!\n");
-		return 0;
-	}
-
 	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
 
 	ret = drm_fb_helper_init(dev, fb_helper);
-- 
2.39.0

