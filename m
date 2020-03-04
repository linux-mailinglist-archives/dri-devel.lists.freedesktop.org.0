Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC4B1792C3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 15:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6EC6E17E;
	Wed,  4 Mar 2020 14:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2FC6E17E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 14:53:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89873B0E6;
 Wed,  4 Mar 2020 14:53:14 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org
Subject: [PATCH v2] drm/simple-kms: Fix documentation for
 drm_simple_encoder_init()
Date: Wed,  4 Mar 2020 15:53:12 +0100
Message-Id: <20200304145312.26458-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Brings the documentation of drm_simple_encoder_init() in sync with the
function's signature. Also add a paragraph clarifying the management of
the encoder's memory.

v2:
	* document memory management

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Fixes: 63170ac6f2e8 ("drm/simple-kms: Add drm_simple_encoder_{init,create}()")
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 5a2abe2dea3e..74946690aba4 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -38,9 +38,10 @@ static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
 };

 /**
- * drm_simple_encoder_init - Initialize a preallocated encoder
+ * drm_simple_encoder_init - Initialize a preallocated encoder with
+ *                           basic functionality.
  * @dev: drm device
- * @funcs: callbacks for this encoder
+ * @encoder: the encoder to initialize
  * @encoder_type: user visible type of the encoder
  *
  * Initialises a preallocated encoder that has no further functionality.
@@ -48,6 +49,15 @@ static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
  * The encoder will be cleaned up automatically as part of the mode-setting
  * cleanup.
  *
+ * The caller of drm_simple_encoder_init() is responsible for freeing
+ * the encoder's memory after the encoder has been cleaned up. At the
+ * moment this only works reliably if the encoder data structure is
+ * stored in the device structure. Free the encoder's memory as part of
+ * the device release function.
+ *
+ * FIXME: Later improvements to DRM's resource management may allow for
+ *        an automated kfree() of the encoder's memory.
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
--
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
