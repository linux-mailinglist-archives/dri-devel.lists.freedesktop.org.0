Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBE7377162
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 13:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4036488E56;
	Sat,  8 May 2021 11:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54E488E56
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 11:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620472642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pX2N24mVXDCnJnH4D/cawj5wVRY2fh2AATW6ZV0DRVo=;
 b=dGTQb5ovi98jpBRNnx0ZQ4qfh5qo6hpy+3cXOvvc4IXqhj6syx7xZcxBIPLOWsGYQywMmG
 jtoJ4nvAwREA4VWneAdgxHBhDPoQuLFH+ILviqpoiJyJCpYo2dDQZCbuSW679Mmy2Ma+36
 AKFortdIFJb6dniHzipsWJsqKZ06RLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-oYAw7f32MfKD4HD8IvQGug-1; Sat, 08 May 2021 07:17:18 -0400
X-MC-Unique: oYAw7f32MfKD4HD8IvQGug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AFD61006C80;
 Sat,  8 May 2021 11:17:17 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A832836DE;
 Sat,  8 May 2021 11:17:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH] drm: panel-orientation-quirks: Make the Lenovo Ideapad D330
 quirk also match the 81MD version
Date: Sat,  8 May 2021 13:17:14 +0200
Message-Id: <20210508111714.11697-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

The Lenovo Ideapad D330 has 2 versions, one with a DMI_PRODUCT_NAME of
"81H3" and one with "81MD". Testing has shown that the "81MD" also has
a 90 degree mounted panel with a resolution of 1200x1920.

Drop the DMI_PRODUCT_NAME from the existing quirk so that the existing
quirk matches both versions.

Link: https://github.com/systemd/systemd/pull/18884
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 58f5dc2f6dd5..3fadf4aade3a 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -207,7 +207,6 @@ static const struct dmi_system_id orientation_data[] = {
 	}, {	/* Lenovo Ideapad D330 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "81H3"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
-- 
2.31.1

