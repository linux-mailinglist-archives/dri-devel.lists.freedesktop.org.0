Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B536B9EF491
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F07110EE55;
	Thu, 12 Dec 2024 17:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ApkW9OzY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rzwdxaNG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ApkW9OzY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rzwdxaNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8A910E48A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 17:09:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9CD2021180;
 Thu, 12 Dec 2024 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HDCkeMMFwoUd4rwT66aBuRPxtChgkeDHfIPBiDOuAJk=;
 b=ApkW9OzYuR5BHzTS/5c1onPEOSFK8E363F4UXGxt0OS4jPSxSlj474bv1uW9sv0IFbLUEu
 C320gZe3oj7fzAQG+nXBG2uVPKIdD0tP75KQy1zPePo9seHREEl6lY9BAjXdLpTleS6tpm
 xR2P8oxaQEI0GFhuaGgdu5aEOY+2G94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023361;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HDCkeMMFwoUd4rwT66aBuRPxtChgkeDHfIPBiDOuAJk=;
 b=rzwdxaNGWtGJzUZZMXn6M01gzo+kltlb1f0pHwyO7j6MaOtozoXK5f4BmZJ3hEp2ZyBEmf
 5+Ei0lFp1yFGm1Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HDCkeMMFwoUd4rwT66aBuRPxtChgkeDHfIPBiDOuAJk=;
 b=ApkW9OzYuR5BHzTS/5c1onPEOSFK8E363F4UXGxt0OS4jPSxSlj474bv1uW9sv0IFbLUEu
 C320gZe3oj7fzAQG+nXBG2uVPKIdD0tP75KQy1zPePo9seHREEl6lY9BAjXdLpTleS6tpm
 xR2P8oxaQEI0GFhuaGgdu5aEOY+2G94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023361;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HDCkeMMFwoUd4rwT66aBuRPxtChgkeDHfIPBiDOuAJk=;
 b=rzwdxaNGWtGJzUZZMXn6M01gzo+kltlb1f0pHwyO7j6MaOtozoXK5f4BmZJ3hEp2ZyBEmf
 5+Ei0lFp1yFGm1Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38F7B13A3D;
 Thu, 12 Dec 2024 17:09:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kHevDMEYW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/12] drm/client: Send pending hotplug events after resume
Date: Thu, 12 Dec 2024 18:08:44 +0100
Message-ID: <20241212170913.185939-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
References: <20241212170913.185939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,ffwll.ch,gmail.com,kernel.org,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

If a hotplug event arrives while the client has been suspended,
DRM's client code will deliver the event after resuming. The
functionality has been taken form i915, where it can be removed
by a later commit.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client_event.c | 9 +++++++++
 include/drm/drm_client.h           | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
index 8514df4a2e65..bd93cd93d519 100644
--- a/drivers/gpu/drm/drm_client_event.c
+++ b/drivers/gpu/drm/drm_client_event.c
@@ -60,6 +60,12 @@ static void drm_client_hotplug(struct drm_client_dev *client)
 	if (client->hotplug_failed)
 		return;
 
+	if (client->suspended) {
+		client->hotplug_pending = true;
+		return;
+	}
+
+	client->hotplug_pending = false;
 	ret = client->funcs->hotplug(client);
 	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
 	if (ret)
@@ -159,6 +165,9 @@ static int drm_client_resume(struct drm_client_dev *client, bool holds_console_l
 
 	client->suspended = false;
 
+	if (client->hotplug_pending)
+		drm_client_hotplug(client);
+
 	return ret;
 }
 
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 3b13cf29ed55..146ca80e35db 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -142,6 +142,14 @@ struct drm_client_dev {
 	 */
 	bool suspended;
 
+	/**
+	 * @hotplug_pending:
+	 *
+	 * A hotplug event has been received while the client was suspended.
+	 * Try again on resume.
+	 */
+	bool hotplug_pending;
+
 	/**
 	 * @hotplug_failed:
 	 *
-- 
2.47.1

