Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F905EDA7E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 12:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F1710E41E;
	Wed, 28 Sep 2022 10:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5756010E408
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 10:50:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C97DC1F8A6;
 Wed, 28 Sep 2022 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664362212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KvQUnoBsokfmHLiz+N8DTo/Xf7RtApmgDFfcTdjEzD4=;
 b=dbydHlbMC1BgPwRNzOR2k+W7EMP0+xwdAkva9hvPEIbwF46ndFRpP+hQD4SFgDwNttc8uk
 2NzE8q9Jkbpp7nigZmDq67PStLYFGC8Q91YN2hBEit9yDOWJCBVxVGBxpuycYbXoEz2vjP
 PgsXScIA4/QZ84dJ2akPESUehOGvsNo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664362212;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KvQUnoBsokfmHLiz+N8DTo/Xf7RtApmgDFfcTdjEzD4=;
 b=hax/IOoqQMEu1Ku+jVk29pEs+EQ45uYwOpGRQhzfqU0IpcL+slyJMfsIlgFdrz7updUehR
 nBTi4PY9diKpAlAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 83D3213A84;
 Wed, 28 Sep 2022 10:50:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KMhjH+QmNGMUEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 28 Sep 2022 10:50:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 maxime@cerno.tech, sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, geert@linux-m68k.org,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH v4 2/5] drm/ofdrm: Add CRTC state
Date: Wed, 28 Sep 2022 12:50:07 +0200
Message-Id: <20220928105010.18880-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928105010.18880-1-tzimmermann@suse.de>
References: <20220928105010.18880-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a dedicated CRTC state to ofdrm to later store information for
palette updates.

v3:
	* rework CRTC state helpers (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/ofdrm.c | 59 ++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 98bd99ab7e46..d53ca70934b5 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -278,6 +278,21 @@ static struct resource *ofdrm_find_fb_resource(struct ofdrm_device *odev,
  * Modesetting
  */
 
+struct ofdrm_crtc_state {
+	struct drm_crtc_state base;
+};
+
+static struct ofdrm_crtc_state *to_ofdrm_crtc_state(struct drm_crtc_state *base)
+{
+	return container_of(base, struct ofdrm_crtc_state, base);
+}
+
+static void ofdrm_crtc_state_destroy(struct ofdrm_crtc_state *ofdrm_crtc_state)
+{
+	__drm_atomic_helper_crtc_destroy_state(&ofdrm_crtc_state->base);
+	kfree(ofdrm_crtc_state);
+}
+
 /*
  * Support all formats of OF display and maybe more; in order
  * of preference. The display's update function will do any
@@ -428,13 +443,51 @@ static const struct drm_crtc_helper_funcs ofdrm_crtc_helper_funcs = {
 	.atomic_check = ofdrm_crtc_helper_atomic_check,
 };
 
+static void ofdrm_crtc_reset(struct drm_crtc *crtc)
+{
+	struct ofdrm_crtc_state *ofdrm_crtc_state =
+		kzalloc(sizeof(*ofdrm_crtc_state), GFP_KERNEL);
+
+	if (crtc->state)
+		ofdrm_crtc_state_destroy(to_ofdrm_crtc_state(crtc->state));
+
+	if (ofdrm_crtc_state)
+		__drm_atomic_helper_crtc_reset(crtc, &ofdrm_crtc_state->base);
+	else
+		__drm_atomic_helper_crtc_reset(crtc, NULL);
+}
+
+static struct drm_crtc_state *ofdrm_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct ofdrm_crtc_state *new_ofdrm_crtc_state;
+
+	if (drm_WARN_ON(dev, !crtc_state))
+		return NULL;
+
+	new_ofdrm_crtc_state = kzalloc(sizeof(*new_ofdrm_crtc_state), GFP_KERNEL);
+	if (!new_ofdrm_crtc_state)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_ofdrm_crtc_state->base);
+
+	return &new_ofdrm_crtc_state->base;
+}
+
+static void ofdrm_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					    struct drm_crtc_state *crtc_state)
+{
+	ofdrm_crtc_state_destroy(to_ofdrm_crtc_state(crtc_state));
+}
+
 static const struct drm_crtc_funcs ofdrm_crtc_funcs = {
-	.reset = drm_atomic_helper_crtc_reset,
+	.reset = ofdrm_crtc_reset,
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.atomic_duplicate_state = ofdrm_crtc_atomic_duplicate_state,
+	.atomic_destroy_state = ofdrm_crtc_atomic_destroy_state,
 };
 
 static int ofdrm_connector_helper_get_modes(struct drm_connector *connector)
-- 
2.37.3

