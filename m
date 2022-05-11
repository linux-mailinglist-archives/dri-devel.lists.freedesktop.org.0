Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE82523C7A
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 20:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD1E112942;
	Wed, 11 May 2022 18:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC174112942
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 18:31:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8CF501FA88;
 Wed, 11 May 2022 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652293887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFTnD998znqdbx6vRegpdmG8s5mxucXLyQQbxo69On4=;
 b=xcsbFc9h2LgwPtSHst91fJJUaV4ybUdwmfaS/qJXhP4BCgi0yFnofBs8kNG7nFWpa1LZ0S
 knm4lUUCylgSqpFMSS44wUM06+XVn5Civ2jC2WvZAHe0+n3nS6m4LW/7XDwAoTJ9FXU88j
 gVT/ezbrHrxqiLgyEGmxxREgtUt03Oo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652293887;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFTnD998znqdbx6vRegpdmG8s5mxucXLyQQbxo69On4=;
 b=lndRfjNiyyNeXmEjqPftIubRTRNUjT8QZOtQcUgIWmhWQSSeC2MP5WsrClrGdMWXPqx520
 vTO2ZzQ812w7hHAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63E6513A76;
 Wed, 11 May 2022 18:31:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sBh1F/8AfGIbeQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 May 2022 18:31:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 2/3] drm/client: Look for command-line modes first
Date: Wed, 11 May 2022 20:31:24 +0200
Message-Id: <20220511183125.14294-3-tzimmermann@suse.de>
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

When picking a mode, first look for modes that have been specified
by the user on the kernel's command line. Only if that fails, use
the existing heuristic of picking a nearby mode from it's various
parameters.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client_modeset.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index e6346a67cd98..b777faa87f04 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -165,6 +165,17 @@ drm_connector_pick_cmdline_mode(struct drm_connector *connector)
 	struct drm_display_mode *mode;
 	bool prefer_non_interlace;
 
+	/*
+	 * Find a user-defined mode. If the user gave us a valid
+	 * mode on the kernel command line, it will show up in this
+	 * list.
+	 */
+
+	list_for_each_entry(mode, &connector->modes, head) {
+		if (mode->type & DRM_MODE_TYPE_USERDEF)
+			return mode;
+	}
+
 	cmdline_mode = &connector->cmdline_mode;
 	if (cmdline_mode->specified == false)
 		return NULL;
-- 
2.36.0

