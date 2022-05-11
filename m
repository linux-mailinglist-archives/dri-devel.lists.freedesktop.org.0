Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2998B523C7C
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 20:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA195112946;
	Wed, 11 May 2022 18:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D005112940
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 18:31:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B82011FA89;
 Wed, 11 May 2022 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652293887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1YTWQXd9oiXc2P7alAQC4DG7eP2a6gWNe6Ta8vtNvY=;
 b=YQMmlreDg1fZpHdwvzdD1pBjDnJFWUkwE5ckF8sECLVZ8hZazslEfXIU9UOr4CZ8FFg/AE
 MpQSRau1BXOtfsTUubOE0vZIvZq4QEwJv1XVDOOg7A2xJIxRYdDMRrBJrn8RH8PKL7k1RK
 fVsv/afv+UAs8gkwpbvbq/K5A7LxVlU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652293887;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1YTWQXd9oiXc2P7alAQC4DG7eP2a6gWNe6Ta8vtNvY=;
 b=5lxmfR/okbmfZP0h4dNIxcXDs1JGwcvwUYLG1b19/E7/PZBdwrK+gLU6lo9NCb/iQFKn1y
 BDXKpOWkiFcHntAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 905F313AF6;
 Wed, 11 May 2022 18:31:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wKlLIv8AfGIbeQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 May 2022 18:31:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 3/3] drm/client: Don't add new command-line mode
Date: Wed, 11 May 2022 20:31:25 +0200
Message-Id: <20220511183125.14294-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220511183125.14294-1-tzimmermann@suse.de>
References: <20220511183125.14294-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't add a mode for the kernel's command-line parameters from
within the DRM client code. Doing so can result in an unusable
display. If there's no compatible command-line mode, the client
will use one of the connector's preferred modes.

All mode creation and validation has to be performed by the
connector. When clients run, the connector's fill_modes callback
has already processes the kernel parameters and validates each
mode before adding it. The connector's mode list does not contain
invalid modes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client_modeset.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index b777faa87f04..48e6ce16439f 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -158,8 +158,7 @@ drm_connector_has_preferred_mode(struct drm_connector *connector, int width, int
 	return NULL;
 }
 
-static struct drm_display_mode *
-drm_connector_pick_cmdline_mode(struct drm_connector *connector)
+static struct drm_display_mode *drm_connector_pick_cmdline_mode(struct drm_connector *connector)
 {
 	struct drm_cmdline_mode *cmdline_mode;
 	struct drm_display_mode *mode;
@@ -180,11 +179,10 @@ drm_connector_pick_cmdline_mode(struct drm_connector *connector)
 	if (cmdline_mode->specified == false)
 		return NULL;
 
-	/* attempt to find a matching mode in the list of modes
-	 *  we have gotten so far, if not add a CVT mode that conforms
+	/*
+	 * Attempt to find a matching mode in the list of modes we
+	 * have gotten so far.
 	 */
-	if (cmdline_mode->rb || cmdline_mode->margins)
-		goto create_mode;
 
 	prefer_non_interlace = !cmdline_mode->interlace;
 again:
@@ -218,12 +216,7 @@ drm_connector_pick_cmdline_mode(struct drm_connector *connector)
 		goto again;
 	}
 
-create_mode:
-	mode = drm_mode_create_from_cmdline_mode(connector->dev, cmdline_mode);
-	if (mode)
-		list_add(&mode->head, &connector->modes);
-
-	return mode;
+	return NULL;
 }
 
 static bool drm_connector_enabled(struct drm_connector *connector, bool strict)
-- 
2.36.0

