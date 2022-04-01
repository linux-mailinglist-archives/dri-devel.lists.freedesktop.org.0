Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C8B4EEFF4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4047810E3BA;
	Fri,  1 Apr 2022 14:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B48310E3BA
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:30:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16E4D61CE1;
 Fri,  1 Apr 2022 14:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EBAC36AE3;
 Fri,  1 Apr 2022 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823449;
 bh=BZlOSiKpq1szZjlZR/JstAdi032Er3alcUWB8YT1Ch8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OK3CWJekz+4hOGxeGNAEnLF7z7sVXUzprIWiTMaDfyVCgIYUnKfYLPmiubS8j4SLG
 CO8wpy+2rcHrbGuxvHvD2XJ1CIqwzYLCbl9czeFTRKRy55+FJy0xgsPmcl82jxrz5S
 5fBjxjT6qFONsaXu5Y+4ZlUomiNunhe/MGXAkZ6g5m2ABXcgsEfb+26knP4GR2EhsS
 KV6PMCyZk8cuO8nnchipAPApwGACcDVZDpIQXqCt/XtzXRDbjlTaOebyycB7RFYOWN
 47x90sm5z4bR2XxqIep4FK2GTvyAnKrvmFJe60j6OZVqxkwX71pbNgvSRmvlYi6+jo
 oScjH9yBbEhiA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 100/149] drm/simpledrm: Add "panel orientation"
 property on non-upright mounted LCD panels
Date: Fri,  1 Apr 2022 10:24:47 -0400
Message-Id: <20220401142536.1948161-100-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
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
index 04146da2d1d8..11576e0297e4 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -798,6 +798,9 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
 	if (ret)
 		return ret;
 	drm_connector_helper_add(connector, &simpledrm_connector_helper_funcs);
+	drm_connector_set_panel_orientation_with_quirk(connector,
+						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
+						       mode->hdisplay, mode->vdisplay);
 
 	formats = simpledrm_device_formats(sdev, &nformats);
 
-- 
2.34.1

