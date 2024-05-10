Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748748C2826
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BDF10ED80;
	Fri, 10 May 2024 15:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="e4TEWcYT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wzbIPKCh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e4TEWcYT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wzbIPKCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0667510EE01
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:48:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 371743F013;
 Fri, 10 May 2024 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715356124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QM0LYxHq/vG2N1y5Q69p+T1ksRwKT8ZVqhLmxMXFA9Q=;
 b=e4TEWcYTJbfDctQVST6WaD0FQYov1fRn6Oa6L/3wxXR1Ht/vr80qGA6dLWlYadSVbNshOP
 79/E3Ckz6/u8tHw93VccCc741HVzyE3O7m+Xrs8Hz5/VgIuTeeo3hB7R6WtpeqXqcpwWUn
 WOxmag3TjlgpS9WPeyDnxvnRNBywND4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715356124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QM0LYxHq/vG2N1y5Q69p+T1ksRwKT8ZVqhLmxMXFA9Q=;
 b=wzbIPKChaIRRxhlAqCLjAebNvrx+2uZyPMci1gpUXyVP4Q4EOyITLyUKXaDtitcvFvZuTe
 5uTLFJYNZwsTT/Aw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e4TEWcYT;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wzbIPKCh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715356124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QM0LYxHq/vG2N1y5Q69p+T1ksRwKT8ZVqhLmxMXFA9Q=;
 b=e4TEWcYTJbfDctQVST6WaD0FQYov1fRn6Oa6L/3wxXR1Ht/vr80qGA6dLWlYadSVbNshOP
 79/E3Ckz6/u8tHw93VccCc741HVzyE3O7m+Xrs8Hz5/VgIuTeeo3hB7R6WtpeqXqcpwWUn
 WOxmag3TjlgpS9WPeyDnxvnRNBywND4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715356124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QM0LYxHq/vG2N1y5Q69p+T1ksRwKT8ZVqhLmxMXFA9Q=;
 b=wzbIPKChaIRRxhlAqCLjAebNvrx+2uZyPMci1gpUXyVP4Q4EOyITLyUKXaDtitcvFvZuTe
 5uTLFJYNZwsTT/Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8D1F13A31;
 Fri, 10 May 2024 15:48:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oOabN9tBPma7MgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 May 2024 15:48:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>,
 Robert Tarasov <tutankhamen@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org
Subject: [PATCH v3 1/5] drm/udl: Remove DRM_CONNECTOR_POLL_HPD
Date: Fri, 10 May 2024 17:47:08 +0200
Message-ID: <20240510154841.11370-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510154841.11370-1-tzimmermann@suse.de>
References: <20240510154841.11370-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 371743F013
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[10];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim]; TO_DN_SOME(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
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

DisplayLink devices do not generate hotplug events. Remove the poll
flag DRM_CONNECTOR_POLL_HPD, as it may not be specified together with
DRM_CONNECTOR_POLL_CONNECT or DRM_CONNECTOR_POLL_DISCONNECT.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: afdfc4c6f55f ("drm/udl: Fixed problem with UDL adpater reconnection")
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Cc: Robert Tarasov <tutankhamen@chromium.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.15+
---
 drivers/gpu/drm/udl/udl_modeset.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 7702359c90c22..751da3a294c44 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -527,8 +527,7 @@ struct drm_connector *udl_connector_init(struct drm_device *dev)
 
 	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
 
-	connector->polled = DRM_CONNECTOR_POLL_HPD |
-			    DRM_CONNECTOR_POLL_CONNECT |
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
 			    DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return connector;
-- 
2.44.0

