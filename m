Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699D5690D36
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F32710EB23;
	Thu,  9 Feb 2023 15:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9EE10E22D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 15:41:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3AAE537621;
 Thu,  9 Feb 2023 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675957270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NrpJHETUkiFb7S+mFpD2+8NzM9ujgEMyhsE6oJKe+8=;
 b=M3hKtO7x8+e/UAR800rw4tXK75+QgO8hHsp7v12hbOjtKHeR4vrSk5EtJ8Cks4FQe0vA+J
 AXiL+C8hLr/j9qvRlQdYoM4t3W8zUSmBjjRkn+z0nozeypjgR8Mm/fTMtxyGP+FDLxYEMZ
 1aW9xNzJcNjcAVtS1FXmSjgb0B3KiWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675957270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NrpJHETUkiFb7S+mFpD2+8NzM9ujgEMyhsE6oJKe+8=;
 b=cKUsZhO7zEgNTlruoQrkNOcbieeOKzSQ/jBQoJYn1MbPTZAo7cwXvIIeOVOShUhWlr3LGw
 zU1kVLUmBbpn4sDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11FBB13915;
 Thu,  9 Feb 2023 15:41:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +LanAxYU5WM5PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 15:41:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, jyri.sarha@iki.fi,
 tomba@kernel.org
Subject: [PATCH 3/6] drm/mgag200: Remove disable handling from atomic_update
Date: Thu,  9 Feb 2023 16:41:04 +0100
Message-Id: <20230209154107.30680-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209154107.30680-1-tzimmermann@suse.de>
References: <20230209154107.30680-1-tzimmermann@suse.de>
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

The primary plane has the atomic_disable helper set, so atomic_update
won't be called if the plane gets disabled. Remove the respective branch
from the helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 0a5aaf78172a..47e86eadb239 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -503,9 +503,6 @@ void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_rect damage;
 	u8 seq1;
 
-	if (!fb)
-		return;
-
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		mgag200_handle_damage(mdev, shadow_plane_state->data, fb, &damage);
-- 
2.39.1

