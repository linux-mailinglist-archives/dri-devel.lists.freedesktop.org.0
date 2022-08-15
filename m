Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2E7593A8D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 22:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB9BD4023;
	Mon, 15 Aug 2022 20:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1BED4019
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 20:04:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2E1A6077B;
 Mon, 15 Aug 2022 20:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39EFC4314C;
 Mon, 15 Aug 2022 20:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660593862;
 bh=kAyO+nz/zUmhS98Qlahcj3U4y3xPvdN4M6aw9dZu9FM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EHkhlM4EBymbwUhrO6ZftZponsYfdUjs02q9U69llGuTdiDu3kfrQ61MNxQGMERcN
 aYe4ptMTYj6QOQU5EkoOwZKwkkb+0hf8622LbTRYRzK/YTq3Y9jT1IrqJyokTaHfoq
 BTylnmWYn/UjBa9r/GTrzfv4iMvGvuC0G1Ea+/U4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.19 0310/1157] drm/mgag200: Acquire I/O lock while reading
 EDID
Date: Mon, 15 Aug 2022 19:54:26 +0200
Message-Id: <20220815180452.062508070@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220815180439.416659447@linuxfoundation.org>
References: <20220815180439.416659447@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit 5913ab941d6ea782e841234c76958c6872ea752d ]

DDC operation conflicts with concurrent mode setting. Acquire the
driver's I/O lock in get_modes to prevent this. This change should
have been part of commit 931e3f3a0e99 ("drm/mgag200: Protect
concurrent access to I/O registers with lock"), but apparently got
lost somewhere.

v3:
	* fix commit message to say 'drm/mgag200' (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 931e3f3a0e99 ("drm/mgag200: Protect concurrent access to I/O registers with lock")
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Link: https://patchwork.freedesktop.org/patch/msgid/20220516134343.6085-2-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.35.1



