Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BE539508C
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 13:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D8B6E30C;
	Sun, 30 May 2021 11:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B356E30C
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 11:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622372678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0EJaSPS1wpnHNmfvWgUbMOghjMXyzjKIrixSYpnd2hk=;
 b=Y3FbcryIDRp4L4SscngkPTKDkucDJtm9XJEvAIAJKg8lcSZpN1oPu/yZA7/UCzFRBdOk6J
 zV/xRa10jKHY/hUIfAL1qIWT52CxNWyRsjTpruwW98JGi2rAWEzTxzYTtspOE5DN75aJbq
 oY6atEKHoZancBFrGGL54kilJDSeKBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-1jZL0hVnPROeUaWwgFGReg-1; Sun, 30 May 2021 07:04:35 -0400
X-MC-Unique: 1jZL0hVnPROeUaWwgFGReg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77C5880ED8D;
 Sun, 30 May 2021 11:04:34 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-76.ams2.redhat.com [10.36.112.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B35C100164A;
 Sun, 30 May 2021 11:04:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/4] drm: panel-orientation-quirks: Add quirk for the Samsung
 Galaxy Book 10.6
Date: Sun, 30 May 2021 13:04:27 +0200
Message-Id: <20210530110428.12994-4-hdegoede@redhat.com>
In-Reply-To: <20210530110428.12994-1-hdegoede@redhat.com>
References: <20210530110428.12994-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Samsung Galaxy Book 10.6 uses a panel which has been mounted
90 degrees rotated. Add a quirk for this

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index d662292560c7..b2a650674cd3 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -109,6 +109,12 @@ static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside_up = {
+	.width = 1280,
+	.height = 1920,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
 static const struct dmi_system_id orientation_data[] = {
 	{	/* Acer One 10 (S1003) */
 		.matches = {
@@ -237,6 +243,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
 		},
 		.driver_data = (void *)&onegx1_pro,
+	}, {	/* Samsung GalaxyBook 10.6 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
+		},
+		.driver_data = (void *)&lcd1280x1920_rightside_up,
 	}, {	/* VIOS LTH17 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
-- 
2.31.1

