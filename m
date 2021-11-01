Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1771441C72
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 15:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAD06E876;
	Mon,  1 Nov 2021 14:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FACD6E86F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 14:15:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B67B1FD79;
 Mon,  1 Nov 2021 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635776138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzJUJVX8BhIEyAhs3xoMjzVdJLIuiN+AkSIr+7kNW1A=;
 b=gWkGst/R1qP2qRkp9UPyRrxC+E9mgmbTMXL+rbs+Myn7GGGOvlJjp3oVMPAy8XFq3ckRPt
 R3X4DkBNHLewVbJI29rt53ePtGzDOTqfTpb9V79G8uz0LfihINXSJhusM5A2lLIsbNkDVs
 jO/NWOIvqlC2Nyomv2lfjmt3VdoKy+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635776138;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzJUJVX8BhIEyAhs3xoMjzVdJLIuiN+AkSIr+7kNW1A=;
 b=Pb3I8e/7p6oEDkFjDh7kekxJbnkTglU8H16VZMNuQ7FWbSf0N2NaMh9Ljq8R13YIXXiSDe
 4SonP46QGse4exAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 979D513A1F;
 Mon,  1 Nov 2021 14:15:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wPgdJIn2f2GlHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 14:15:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com,
 michael+lkml@stapelberg.ch, aros@gmx.com, joshua@stroblindustries.com,
 arnd@arndb.de
Subject: [PATCH v2 9/9] drm: Clarify semantics of struct drm_mode_config.{min,
 max}_{width, height}
Date: Mon,  1 Nov 2021 15:15:32 +0100
Message-Id: <20211101141532.26655-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101141532.26655-1-tzimmermann@suse.de>
References: <20211101141532.26655-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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
2.33.1

