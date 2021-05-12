Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146E037BE21
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 15:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072186E7DD;
	Wed, 12 May 2021 13:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C656EBA1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620825735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRuqDSMQPZSrwx13deEbTbq3XmN6547PEEZTyoaPzAE=;
 b=GkHMLUBDPLzTbbsOc2zIdxWPFxZndNNZODuCj1iPnlH2yjtNmR80ZGecc85MyRfcQTmrWO
 F/7Un1rlX2VNJtd/MuxTp62hPEXJ3mLh/qHTC0vkOPzgn5KOBWWb4gyQ8kRqAZVu0eU1HN
 CY2DLXCDf5g7FmUmCjeJg7uO6vYx2ZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-Snn26GlJPreXVprvtQ5FQQ-1; Wed, 12 May 2021 09:22:10 -0400
X-MC-Unique: Snn26GlJPreXVprvtQ5FQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45AFF1922962;
 Wed, 12 May 2021 13:22:09 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-30.ams2.redhat.com [10.36.112.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A02D75D6AC;
 Wed, 12 May 2021 13:22:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 1/2] drm: panel-orientation-quirks: Update the Lenovo Ideapad
 D330 quirk (v2)
Date: Wed, 12 May 2021 15:22:03 +0200
Message-Id: <20210512132204.61250-2-hdegoede@redhat.com>
In-Reply-To: <20210512132204.61250-1-hdegoede@redhat.com>
References: <20210512132204.61250-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

2 improvements to the Lenovo Ideapad D330 panel-orientation quirks:

1. Some versions of the Lenovo Ideapad D330 have a DMI_PRODUCT_NAME of
"81H3" and others have "81MD". Testing has shown that the "81MD" also has
a 90 degree mounted panel. Drop the DMI_PRODUCT_NAME from the existing
quirk so that the existing quirk matches both variants.

2. Some of the Lenovo Ideapad D330 models have a HD (800x1280) screen
instead of a FHD (1200x1920) screen (both are mounted right-side-up) add
a second Lenovo Ideapad D330 quirk for the HD version.

Changes in v2:
- Add a new quirk for Lenovo Ideapad D330 models with a HD screen instead
  of a FHD screen

Link: https://github.com/systemd/systemd/pull/18884
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index f6bdec7fa925..604535b1c3a9 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -211,10 +211,15 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo MIIX 320-10ICR"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
-	}, {	/* Lenovo Ideapad D330 */
+	}, {	/* Lenovo Ideapad D330-10IGM (HD) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Lenovo Ideapad D330-10IGM (FHD) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "81H3"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
-- 
2.31.1

