Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CCF690D34
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4790710EB20;
	Thu,  9 Feb 2023 15:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A64110E20D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 15:41:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C9FF037640;
 Thu,  9 Feb 2023 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675957270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2X7dpruDs0ub9vP/O0YuGgFrV+hzhdqetYn8fZWJSk=;
 b=GYElgAVwjOU1WICt96C+PqqrGnyaK1DaVrX3k2BmpXT8fPjOQosuanbWtyoicaHQ8S8kNO
 BlImcIpS+sRazJEYBGKfOjS/4BVVkWy+IaVjvFNoQcDtA/UCr9uQ+l7hrz0b3Q2BsGNrXi
 Eres6wIh1zFOCgox+7CE83OloojnLd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675957270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2X7dpruDs0ub9vP/O0YuGgFrV+hzhdqetYn8fZWJSk=;
 b=exXn2a5yxebFnPeeA31mWI+/R/7q1v80YT69lEqEetJKluz3VtDQeL9GzO7f6k96nWxxFW
 UYoFIIeUhjBAH3Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D2251339E;
 Thu,  9 Feb 2023 15:41:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aD5wJRYU5WM5PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 15:41:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, jyri.sarha@iki.fi,
 tomba@kernel.org
Subject: [PATCH 6/6] drm/tidss: Implement struct
 drm_plane_helper_funcs.atomic_enable
Date: Thu,  9 Feb 2023 16:41:07 +0100
Message-Id: <20230209154107.30680-7-tzimmermann@suse.de>
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

Enable the primary plane for tidss hardware via atomic_enable.
Atomic helpers invoke this callback only when the plane becomes
active.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tidss/tidss_plane.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 0b12405edb47..6bdd6e4a955a 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -124,6 +124,16 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
 	hw_videoport = to_tidss_crtc(new_state->crtc)->hw_videoport;
 
 	dispc_plane_setup(tidss->dispc, tplane->hw_plane_id, new_state, hw_videoport);
+}
+
+static void tidss_plane_atomic_enable(struct drm_plane *plane,
+				      struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane->dev;
+	struct tidss_device *tidss = to_tidss(ddev);
+	struct tidss_plane *tplane = to_tidss_plane(plane);
+
+	dev_dbg(ddev->dev, "%s\n", __func__);
 
 	dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, true);
 }
@@ -151,6 +161,7 @@ static void drm_plane_destroy(struct drm_plane *plane)
 static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
 	.atomic_check = tidss_plane_atomic_check,
 	.atomic_update = tidss_plane_atomic_update,
+	.atomic_enable = tidss_plane_atomic_enable,
 	.atomic_disable = tidss_plane_atomic_disable,
 };
 
-- 
2.39.1

