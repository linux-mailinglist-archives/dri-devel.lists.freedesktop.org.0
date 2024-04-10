Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E3789F1B9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 14:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B84112E90;
	Wed, 10 Apr 2024 12:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RlT5/ePS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Drvj+BK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RlT5/ePS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Drvj+BK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519BB112E90
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 12:09:33 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A13495CC74;
 Wed, 10 Apr 2024 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712750971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TChPugZxM1djlGhjAoDNAivwmpbCf38OUcIIsIP7iYA=;
 b=RlT5/ePSlQQ4A4/LoYFz2DyrfmKp1yJIesOh6AJN2U1akshNX2SczEAeClbg7rwNjxvj91
 +B4P788r9wYqIFcZaV2l7FbGgntSyGCEhxHRMtajvTTmq4+Z7BPkQfWMR/SkLoXPqXNYn5
 vwxb1Hgll4/DfffmkVDcB1rwaClr+1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712750971;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TChPugZxM1djlGhjAoDNAivwmpbCf38OUcIIsIP7iYA=;
 b=/Drvj+BKTS7Zz9ptFTrlgLFmSLCCp4JJjaAUjipjYXpPX5jIY3boT3K7mWHQY/v3sP304o
 gzuh/PfUhJ72bwAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712750971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TChPugZxM1djlGhjAoDNAivwmpbCf38OUcIIsIP7iYA=;
 b=RlT5/ePSlQQ4A4/LoYFz2DyrfmKp1yJIesOh6AJN2U1akshNX2SczEAeClbg7rwNjxvj91
 +B4P788r9wYqIFcZaV2l7FbGgntSyGCEhxHRMtajvTTmq4+Z7BPkQfWMR/SkLoXPqXNYn5
 vwxb1Hgll4/DfffmkVDcB1rwaClr+1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712750971;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TChPugZxM1djlGhjAoDNAivwmpbCf38OUcIIsIP7iYA=;
 b=/Drvj+BKTS7Zz9ptFTrlgLFmSLCCp4JJjaAUjipjYXpPX5jIY3boT3K7mWHQY/v3sP304o
 gzuh/PfUhJ72bwAg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 73E4513A94;
 Wed, 10 Apr 2024 12:09:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id uN4gG3uBFmY8BQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 12:09:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/5] drm/udl: Remove struct udl_connector
Date: Wed, 10 Apr 2024 14:07:54 +0200
Message-ID: <20240410120928.26487-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410120928.26487-1-tzimmermann@suse.de>
References: <20240410120928.26487-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
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

Udl's struct udl_connector is an empty wrapper around struct
drm_connector. Remove it. Allocate the connector as part of struct
udl_device and inline the init function into its only caller.

v2:
- fix return value in udl_modeset_init() (Dan)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.h     | 10 +------
 drivers/gpu/drm/udl/udl_modeset.c | 49 +++++++------------------------
 2 files changed, 11 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index f112cfb270f31..1eb716d9dad57 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -49,15 +49,6 @@ struct urb_list {
 	size_t size;
 };
 
-struct udl_connector {
-	struct drm_connector connector;
-};
-
-static inline struct udl_connector *to_udl_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct udl_connector, connector);
-}
-
 struct udl_device {
 	struct drm_device drm;
 	struct device *dev;
@@ -66,6 +57,7 @@ struct udl_device {
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
+	struct drm_connector connector;
 
 	struct mutex gem_lock;
 
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 4236ce57f5945..bbb04f98886a2 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -444,49 +444,14 @@ static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
 	.detect_ctx = udl_connector_helper_detect_ctx,
 };
 
-static void udl_connector_destroy(struct drm_connector *connector)
-{
-	struct udl_connector *udl_connector = to_udl_connector(connector);
-
-	drm_connector_cleanup(connector);
-	kfree(udl_connector);
-}
-
 static const struct drm_connector_funcs udl_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = udl_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-struct drm_connector *udl_connector_init(struct drm_device *dev)
-{
-	struct udl_connector *udl_connector;
-	struct drm_connector *connector;
-	int ret;
-
-	udl_connector = kzalloc(sizeof(*udl_connector), GFP_KERNEL);
-	if (!udl_connector)
-		return ERR_PTR(-ENOMEM);
-
-	connector = &udl_connector->connector;
-	ret = drm_connector_init(dev, connector, &udl_connector_funcs, DRM_MODE_CONNECTOR_VGA);
-	if (ret)
-		goto err_kfree;
-
-	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
-
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
-			    DRM_CONNECTOR_POLL_DISCONNECT;
-
-	return connector;
-
-err_kfree:
-	kfree(udl_connector);
-	return ERR_PTR(ret);
-}
-
 /*
  * Modesetting
  */
@@ -556,9 +521,15 @@ int udl_modeset_init(struct drm_device *dev)
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	connector = udl_connector_init(dev);
-	if (IS_ERR(connector))
-		return PTR_ERR(connector);
+	connector = &udl->connector;
+	ret = drm_connector_init(dev, connector, &udl_connector_funcs, DRM_MODE_CONNECTOR_VGA);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
+
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ret;
-- 
2.44.0

