Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ED366BD4E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF38210E3EE;
	Mon, 16 Jan 2023 11:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9596E10E3DC;
 Mon, 16 Jan 2023 11:54:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 49B9233B43;
 Mon, 16 Jan 2023 11:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673870069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUggysgncP9uMhVH+dhNfBvNG/A+cX9Zl3Vz7+cHkwc=;
 b=yxk3skraO/Mtj5vW9U468+SdCqUo76uvOOBqxcntqYHfu8yby99nvJCGJzs5PMG8fjHkBj
 mEiOR8kxkfox2YIiVgZ9sDTHU+8Lwsr4UqojgdhCJCz2zmYNyU1vV/TM0rXzxVRwokCn4H
 v1yhwCoLg2pvV6eD89eO2yFdoFelesE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673870069;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUggysgncP9uMhVH+dhNfBvNG/A+cX9Zl3Vz7+cHkwc=;
 b=S4GS866Ou0/y6g8PuMrZ9fXlBegOCcv3edlcCNcfMSttSyBU7pgZ46BBXsXpY79aawt7qM
 qX4LmkHG7Zi9BJDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86905139C2;
 Mon, 16 Jan 2023 11:54:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MMoXIPQ6xWPLBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Jan 2023 11:54:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, evan.quan@amd.com, jose.souza@intel.com
Subject: [PATCH v3 2/3] drm/fb-helper: Set framebuffer for vga-switcheroo
 clients
Date: Mon, 16 Jan 2023 12:54:24 +0100
Message-Id: <20230116115425.13484-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116115425.13484-1-tzimmermann@suse.de>
References: <20230116115425.13484-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 YiPeng Chai <YiPeng.Chai@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Guchun Chen <guchun.chen@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 intel-gfx@lists.freedesktop.org, "Tianci.Yin" <tianci.yin@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, stable@vger.kernel.org,
 Solomon Chiu <solomon.chiu@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the framebuffer info for drivers that support VGA switcheroo. Only
affects the amdgpu and nouveau drivers, which use VGA switcheroo and
generic fbdev emulation. For other drivers, this does nothing.

This fixes a potential regression in the console code. Both, amdgpu and
nouveau, invoked vga_switcheroo_client_fb_set() from their internal fbdev
code. But the call got lost when the drivers switched to the generic
emulation.

Fixes: 087451f372bf ("drm/amdgpu: use generic fb helpers instead of setting up AMD own's.")
Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Evan Quan <evan.quan@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Likun Gao <Likun.Gao@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Stanley Yang <Stanley.Yang@amd.com>
Cc: "Tianci.Yin" <tianci.yin@amd.com>
Cc: Xiaojian Du <Xiaojian.Du@amd.com>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Bokun Zhang <Bokun.Zhang@amd.com>
Cc: Guchun Chen <guchun.chen@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Solomon Chiu <solomon.chiu@amd.com>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Marek Olšák" <marek.olsak@amd.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.17+
---
 drivers/gpu/drm/drm_fb_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 367fb8b2d5fa..c5c13e192b64 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -30,7 +30,9 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/console.h>
+#include <linux/pci.h>
 #include <linux/sysrq.h>
+#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
@@ -1924,6 +1926,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 					 int preferred_bpp)
 {
 	struct drm_client_dev *client = &fb_helper->client;
+	struct drm_device *dev = fb_helper->dev;
 	struct drm_fb_helper_surface_size sizes;
 	int ret;
 
@@ -1945,6 +1948,11 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 		return ret;
 
 	strcpy(fb_helper->fb->comm, "[fbcon]");
+
+	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
+	if (dev_is_pci(dev->dev))
+		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
+
 	return 0;
 }
 
-- 
2.39.0

