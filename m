Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3514B51FA0A
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 12:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318F410E939;
	Mon,  9 May 2022 10:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5ABA10E939
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 10:35:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8377321C0E;
 Mon,  9 May 2022 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652092558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4iY3ne0c9D8de/vdCP6n3wQc9s2uKpelhZvsaMeqgU=;
 b=1aBOIno0sDORdfM6H0tsqqZ0oSgZohjBWr1VzMN62qJ/iXfonxCfhP9jTnTRXLGg8vhLgn
 LToMdk7+XiUqFrA9e6dq5SxwP4fUBNnZaGcw4xpXh+MVpGXno3DWgK5hBjfEUcpIsVgcFe
 VdyTrRw0UtIc4KKn2XcjqLv0I6czGzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652092558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4iY3ne0c9D8de/vdCP6n3wQc9s2uKpelhZvsaMeqgU=;
 b=Xv0s6WgFEB46aATrs2x5ttK+8R3C0fMQNVHu6QZFrRCVrjFqM/57/mZMgUWjY3z4l5z+qI
 2le2eynXPiJLdTAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5892513B12;
 Mon,  9 May 2022 10:35:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WDTmFI7ueGJ9AgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 10:35:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 1/7] drm:/mgag200: Acquire I/O lock while reading EDID
Date: Mon,  9 May 2022 12:35:48 +0200
Message-Id: <20220509103554.11996-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220509103554.11996-1-tzimmermann@suse.de>
References: <20220509103554.11996-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DDC operation conflicts with concurrent mode setting. Acquire the
driver's I/O lock in get_modes to prevent this. This change should
have been part of commit 931e3f3a0e99 ("drm/mgag200: Protect
concurrent access to I/O registers with lock"), but apparently got
lost somewhere.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 931e3f3a0e99 ("drm/mgag200: Protect concurrent access to I/O registers with lock")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index abde7655477d..4ad8d62c5631 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -667,16 +667,26 @@ static void mgag200_disable_display(struct mga_device *mdev)
 
 static int mga_vga_get_modes(struct drm_connector *connector)
 {
+	struct mga_device *mdev = to_mga_device(connector->dev);
 	struct mga_connector *mga_connector = to_mga_connector(connector);
 	struct edid *edid;
 	int ret = 0;
 
+	/*
+	 * Protect access to I/O registers from concurrent modesetting
+	 * by acquiring the I/O-register lock.
+	 */
+	mutex_lock(&mdev->rmmio_lock);
+
 	edid = drm_get_edid(connector, &mga_connector->i2c->adapter);
 	if (edid) {
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
 		kfree(edid);
 	}
+
+	mutex_unlock(&mdev->rmmio_lock);
+
 	return ret;
 }
 
-- 
2.36.0

