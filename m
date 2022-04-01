Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E634EF08B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641EF10F32A;
	Fri,  1 Apr 2022 14:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394FA10EFEB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:36:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D8F09B8251E;
 Fri,  1 Apr 2022 14:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3178C340F2;
 Fri,  1 Apr 2022 14:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823767;
 bh=aTDvfyBb6ZFwQUDdatUy1W5KmV+kCGUwHFAYnOu3iOA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t/DJqzU3J8GMTr+9Fissfr3gsnc0/vOp+a9Uk7h0h/EJ0ftU2Bb3dkISjjoIl8hOv
 6t5/UvvG6MIFcu/L7ejBercTn4TCL5K1oON/5ngCDDI2Aj0NctEkh84VSvjhY1cl55
 xWk0d0QvGK/ASyiCFnebjyZDpPC6ufkEIcBPzGyMUlJZUYk0MlYSIG7cJD3/FaKGrq
 eKmIwDiJFiQjKHhCSlGSPTZs+g5mBb4Ua8Wug72apKBoLAQkXhymEFnFEw/jvwjnTH
 0v13aKaT03uiQ2ABxXMCgzlr4C5P636LzDkkD+SsRB7hjA5LRoto8sy47gVDNXiij8
 64A//kJS80jFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 070/109] drm/simpledrm: Add "panel orientation"
 property on non-upright mounted LCD panels
Date: Fri,  1 Apr 2022 10:32:17 -0400
Message-Id: <20220401143256.1950537-70-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143256.1950537-1-sashal@kernel.org>
References: <20220401143256.1950537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 94fa115f7b28a3f02611499175e134f0a823b686 ]

Some devices use e.g. a portrait panel in a standard laptop casing made
for landscape panels. efifb calls drm_get_panel_orientation_quirk() and
sets fb_info.fbcon_rotate_hint to make fbcon rotate the console so that
it shows up-right instead of on its side.

When switching to simpledrm the fbcon renders on its side. Call the
drm_connector_set_panel_orientation_with_quirk() helper to add
a "panel orientation" property on devices listed in the quirk table,
to make the fbcon (and aware userspace apps) rotate the image to
display properly.

Cc: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220221220045.11958-1-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tiny/simpledrm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 5a6e89825bc2..3e3f9ba1e885 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -779,6 +779,9 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
 	if (ret)
 		return ret;
 	drm_connector_helper_add(connector, &simpledrm_connector_helper_funcs);
+	drm_connector_set_panel_orientation_with_quirk(connector,
+						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
+						       mode->hdisplay, mode->vdisplay);
 
 	formats = simpledrm_device_formats(sdev, &nformats);
 
-- 
2.34.1

