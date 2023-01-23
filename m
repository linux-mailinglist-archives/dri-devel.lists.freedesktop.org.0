Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15ED677863
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 11:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708BE10E33B;
	Mon, 23 Jan 2023 10:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A2189089;
 Mon, 23 Jan 2023 10:06:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A00C61F88C;
 Mon, 23 Jan 2023 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674468363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eo0f0ziBdtPN9cBdDtmQB+JADnGJzSFyqXzDLQUPm/A=;
 b=zn1EzsA4Vvl2Rh9l9KA6K26MQLR4gRVmSr2zawZzgSAbaL5uxxA7fLd0HHFXOEvJcvRIvW
 h0WM8NusZ0mgvwXX/wONGr9flFvPc7DxumevX7kV9qNmyCoQsAoBVQaiutx79kma+JsPxa
 sGmnUgyofmUrPx+RyTDCEcdVF2qBGnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674468363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eo0f0ziBdtPN9cBdDtmQB+JADnGJzSFyqXzDLQUPm/A=;
 b=5OVL8DNr970iC4orZjkgJlH2phFiM3gBS1DZ8B8HZrsfuN6X2/dq1+Hq4roHhNp+vapzwG
 kPTAd36Zj8cpsEDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58BF6134F5;
 Mon, 23 Jan 2023 10:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SIXSFAtczmO+DwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 23 Jan 2023 10:06:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: [PATCH 02/10] drm/client: Add hotplug_failed flag
Date: Mon, 23 Jan 2023 11:05:51 +0100
Message-Id: <20230123100559.12351-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123100559.12351-1-tzimmermann@suse.de>
References: <20230123100559.12351-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signal failed hotplugging with a flag in struct drm_client_dev. If set,
the client helpers will not further try to set up the fbdev display.

This used to be signalled with a combination of cleared pointers in
struct drm_fb_helper, which prevents us from initializing these pointers
early after allocation.

The change also harmonizes behavior among DRM clients. Additional DRM
clients will now handle failed hotplugging like fbdev does.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c        | 5 +++++
 drivers/gpu/drm/drm_fbdev_generic.c | 4 ----
 include/drm/drm_client.h            | 8 ++++++++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 09ac191c202d..009e7b10455c 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -208,8 +208,13 @@ void drm_client_dev_hotplug(struct drm_device *dev)
 		if (!client->funcs || !client->funcs->hotplug)
 			continue;
 
+		if (client->hotplug_failed)
+			continue;
+
 		ret = client->funcs->hotplug(client);
 		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
+		if (ret)
+			client->hotplug_failed = true;
 	}
 	mutex_unlock(&dev->clientlist_mutex);
 }
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 3d455a2e3fb5..135d58b8007b 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -382,10 +382,6 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 	struct drm_device *dev = client->dev;
 	int ret;
 
-	/* Setup is not retried if it has failed */
-	if (!fb_helper->dev && fb_helper->funcs)
-		return 0;
-
 	if (dev->fb_helper)
 		return drm_fb_helper_hotplug_event(dev->fb_helper);
 
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 4fc8018eddda..39482527a775 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -106,6 +106,14 @@ struct drm_client_dev {
 	 * @modesets: CRTC configurations
 	 */
 	struct drm_mode_set *modesets;
+
+	/**
+	 * @hotplug failed:
+	 *
+	 * Set by client hotplug helpers if the hotplugging failed
+	 * before. It is usually not tried again.
+	 */
+	bool hotplug_failed;
 };
 
 int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
-- 
2.39.0

