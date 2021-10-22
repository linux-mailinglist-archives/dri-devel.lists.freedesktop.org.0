Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4AC4377F3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 15:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8F36ED95;
	Fri, 22 Oct 2021 13:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614946ED8A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 13:28:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC2C521990;
 Fri, 22 Oct 2021 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634909314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AnqzhGT0uv+LTZRPyyPSUgnVBDbveGG6+0StxQzTfpo=;
 b=Xx0gEuvNxXWPSh54tHYaynORHIDZOjYsdzLSm4Jtv6Q5Ux2purRHu7bNabi7AB+uLcUk7X
 ceLy2ETmN6Dcf2o7HBznqjguw9it6+5dMIVhmLfA4/tRZKSEaviasrMcA8V9utkoqPghxY
 JbOUOliPKBtcNr5mJsQpPONH/3p/vQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634909314;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AnqzhGT0uv+LTZRPyyPSUgnVBDbveGG6+0StxQzTfpo=;
 b=JHYjhlndi6DDIxc6dCkc5CMM+ybAOtJObL2FTl1vz/Yvvc47vlLN5mjNOIgnZFWHo6OAro
 ik6Vf3bdhDNYyDAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8258213CDA;
 Fri, 22 Oct 2021 13:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wMjGHoK8cmEwXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Oct 2021 13:28:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com,
 michael+lkml@stapelberg.ch, aros@gmx.com, joshua@stroblindustries.com,
 arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 9/9] drm: Clarify semantics of struct drm_mode_config.{min,
 max}_{width, height}
Date: Fri, 22 Oct 2021 15:28:29 +0200
Message-Id: <20211022132829.7697-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211022132829.7697-1-tzimmermann@suse.de>
References: <20211022132829.7697-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add additional information on the semantics of the size fields in
struct drm_mode_config. Also add a TODO to review all driver for
correct usage of these fields.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/todo.rst    | 15 +++++++++++++++
 include/drm/drm_mode_config.h | 13 +++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 60d1d7ee0719..f4e1d72149f7 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -463,6 +463,21 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian König, Daniel Vette
 
 Level: Intermediate
 
+Review all drivers for setting struct drm_mode_config.{max_width,max_height} correctly
+--------------------------------------------------------------------------------------
+
+The values in struct drm_mode_config.{max_width,max_height} describe the
+maximum supported framebuffer size. It's the virtual screen size, but many
+drivers treat it like limitations of the physical resolution.
+
+The maximum width depends on the hardware's maximum scanline pitch. The
+maximum height depends on the amount of addressable video memory. Review all
+drivers to initialize the fields to the correct values.
+
+Contact: Thomas Zimmermann <tzimmermann@suse.de>
+
+Level: Intermediate
+
 
 Core refactorings
 =================
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 48b7de80daf5..91ca575a78de 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -359,6 +359,19 @@ struct drm_mode_config_funcs {
  * Core mode resource tracking structure.  All CRTC, encoders, and connectors
  * enumerated by the driver are added here, as are global properties.  Some
  * global restrictions are also here, e.g. dimension restrictions.
+ *
+ * Framebuffer sizes refer to the virtual screen that can be displayed by
+ * the CRTC. This can be different from the physical resolution programmed.
+ * The minimum width and height, stored in @min_width and @min_height,
+ * describe the smallest size of the framebuffer. It correlates to the
+ * minimum programmable resolution.
+ * The maximum width, stored in @max_width, is typically limited by the
+ * maximum pitch between two adjacent scanlines. The maximum height, stored
+ * in @max_height, is usually only limited by the amount of addressable video
+ * memory. For hardware that has no real maximum, drivers should pick a
+ * reasonable default.
+ *
+ * See also @DRM_SHADOW_PLANE_MAX_WIDTH and @DRM_SHADOW_PLANE_MAX_HEIGHT.
  */
 struct drm_mode_config {
 	/**
-- 
2.33.0

