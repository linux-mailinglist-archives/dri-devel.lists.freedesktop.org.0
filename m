Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C44EF19C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CFD10E3E4;
	Fri,  1 Apr 2022 14:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5801D10E3E4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:40:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 498D5CE258E;
 Fri,  1 Apr 2022 14:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5556C34111;
 Fri,  1 Apr 2022 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824030;
 bh=aTDvfyBb6ZFwQUDdatUy1W5KmV+kCGUwHFAYnOu3iOA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tdD5WveRzUtwHO1q6jGSryp/MSMJ6n/dqUjK/17V9JZTKCsc5X9VGIC6Q2CtIK6cP
 ZfKMDhDqoS9OQ1e+WyeTCOvfxR14RnVCgG5ZiXrDK1+kiAVXGCNn2X4QbMzdk2LmER
 0eqlPst3YF3UtsjhRKD8RA+g+Jb4jBpgszg/Ew7LMuSYue+XXM1TLG18h6iYH1Uao4
 n7XmwOEjEqgsuPN2Kd1UNq7AWFXzOn647g1b/OTHY4GBeL6tVozYZXyzocnpqk1wYt
 trsqw92+U1ezB5w/FsAE5p1D5GuyzuwUzIlrguCB7T4i5g+QqZt+woFQ7YaNwqhFPg
 9RMsKlCkIiDcg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 59/98] drm/simpledrm: Add "panel orientation"
 property on non-upright mounted LCD panels
Date: Fri,  1 Apr 2022 10:37:03 -0400
Message-Id: <20220401143742.1952163-59-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143742.1952163-1-sashal@kernel.org>
References: <20220401143742.1952163-1-sashal@kernel.org>
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

