Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A97948FB5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256D510E357;
	Tue,  6 Aug 2024 12:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NR4S01EV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dOZ51uE2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NR4S01EV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dOZ51uE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F121910E18D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:56:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6A1421A0A;
 Tue,  6 Aug 2024 12:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722948966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39WAGvvJrKMqczs6oo5vxJSNvm2u6afgf/d6xiDt+mU=;
 b=NR4S01EVpv2kqLO31j18vY8Hx9lvtS5tOIG2uIVEK3Oe9pUPBoPKHDOBZw/lLBc/8DDccs
 bzwMbM3MaIME4kxbCVKLTc1CEiXtgboZFRDdzKKVF491rlg5nQNLNRGLy7zq8HGYqVGOD6
 EFjEubDAxydDSKKY0yvVX2wYKJlntnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722948966;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39WAGvvJrKMqczs6oo5vxJSNvm2u6afgf/d6xiDt+mU=;
 b=dOZ51uE2JVzYD7U6zOZEQQUiBk0HCIDjMwJ/mUPWsGs3Q5Lxtr/aB55VS5tJkBSP2MDEAS
 qvzWwwDkRyWDnAAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722948966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39WAGvvJrKMqczs6oo5vxJSNvm2u6afgf/d6xiDt+mU=;
 b=NR4S01EVpv2kqLO31j18vY8Hx9lvtS5tOIG2uIVEK3Oe9pUPBoPKHDOBZw/lLBc/8DDccs
 bzwMbM3MaIME4kxbCVKLTc1CEiXtgboZFRDdzKKVF491rlg5nQNLNRGLy7zq8HGYqVGOD6
 EFjEubDAxydDSKKY0yvVX2wYKJlntnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722948966;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39WAGvvJrKMqczs6oo5vxJSNvm2u6afgf/d6xiDt+mU=;
 b=dOZ51uE2JVzYD7U6zOZEQQUiBk0HCIDjMwJ/mUPWsGs3Q5Lxtr/aB55VS5tJkBSP2MDEAS
 qvzWwwDkRyWDnAAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F9B813AF4;
 Tue,  6 Aug 2024 12:56:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qH7ZHWYdsmb9PQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Aug 2024 12:56:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/9] drm/ast: astdp: Transparently handle BMC support
Date: Tue,  6 Aug 2024 14:51:59 +0200
Message-ID: <20240806125601.78650-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806125601.78650-1-tzimmermann@suse.de>
References: <20240806125601.78650-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.79 / 50.00]; REPLY(-4.00)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.19)[-0.973];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -3.79
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

Permanently set the connector status to 'connected'. Return BMC modes
for connector if no display is attached to the physical DP connector.
Otherwise use EDID modes as before.

If the status of the physical connector changes, the driver still
generates a hotplug event. DRM clients will then reconfigure their
output to a mode appropriate for either physical display or BMC.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 1eed1cc55280..213266556b08 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -355,6 +355,17 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 	count = drm_edid_connector_add_modes(connector);
 	drm_edid_free(drm_edid);
 
+	if (!count) {
+		/*
+		 * There's no EDID data without a connected monitor. Set BMC-
+		 * compatible modes in this case. The XGA default resolution
+		 * should work well for all BMCs.
+		 */
+		count = drm_add_modes_noedid(connector, 4096, 4096);
+		if (count)
+			drm_set_preferred_mode(connector, 1024, 768);
+	}
+
 	return count;
 }
 
@@ -364,10 +375,14 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
 {
 	struct drm_device *dev = connector->dev;
 	struct ast_device *ast = to_ast_device(connector->dev);
+	enum drm_connector_status old_status = connector_status_disconnected;
 	enum drm_connector_status status = connector_status_disconnected;
 	struct drm_connector_state *connector_state = connector->state;
 	bool is_active = false;
 
+	if (connector->edid_blob_ptr)
+		old_status = connector_status_connected;
+
 	mutex_lock(&ast->modeset_lock);
 
 	if (connector_state && connector_state->crtc) {
@@ -390,7 +405,9 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
 
 	mutex_unlock(&ast->modeset_lock);
 
-	return status;
+	if (status != old_status)
+		++connector->epoch_counter;
+	return connector_status_connected;
 }
 
 static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
-- 
2.46.0

