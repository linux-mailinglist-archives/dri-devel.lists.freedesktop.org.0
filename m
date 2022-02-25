Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A324C50F0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 22:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EECA10E9AC;
	Fri, 25 Feb 2022 21:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509B610E989
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645825846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpsyqJPq2MznxP2J5dghU5/XW2pfoZw6gIMFRiSICa4=;
 b=Hv3LylwUcEUHbeVIgGj02S/aMbBvyK3wzNFQMvr1gAPI5wxIIvzVAXHRHppQuI37JiPvrJ
 nkBLTCHfRHaoYdEFv7fsKy62RP+b49AvF1RF8P0n8xGvfpY/q09FrHRBcl4ZCNGto8bAWB
 lpB8OrTM0bapsEOKIQOX2nARquQleCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-N7PGusDaPruXf-YimEVX3Q-1; Fri, 25 Feb 2022 16:50:43 -0500
X-MC-Unique: N7PGusDaPruXf-YimEVX3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E742F51DC;
 Fri, 25 Feb 2022 21:50:41 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17DCC87BB5;
 Fri, 25 Feb 2022 21:50:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 5/5] drm/i915/vlv_dsi: Skip MIPI I2C sequences on Microsoft
 Surface 3
Date: Fri, 25 Feb 2022 22:49:34 +0100
Message-Id: <20220225214934.383168-5-hdegoede@redhat.com>
In-Reply-To: <20220225214934.383168-1-hdegoede@redhat.com>
References: <20220225214934.383168-1-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VBT DSI MIPI sequences of the panel on the Microsoft Surface 3
contain a couple of I2c writes to what seems to be a non existing
TI LP855x backlight controller, leading to the following errors:

i915 0000:00:02.0: [drm] mipi_exec_i2c bus 5 client-addr 0x2c reg 0x01 data 01
i2c_designware 808622C1:04: controller timed out
i915 0000:00:02.0: [drm] *ERROR* Failed to xfer payload of size (1) to reg (1)
i915 0000:00:02.0: [drm] mipi_exec_i2c bus 5 client-addr 0x2c reg 0x16 data 07
i2c_designware 808622C1:04: controller timed out
i915 0000:00:02.0: [drm] *ERROR* Failed to xfer payload of size (1) to reg (22)

Besides these errors this also causes the screen turning on to be delayed
by 2 seconds. At a DMI based quirk to ignore VBT DSI MIPI I2C writes on
the Microsoft Surface 3.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 0ddc0c8cd4f7..9ba45a928719 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1873,6 +1873,16 @@ static void vlv_dsi_lenovo_yoga_tab2_size_fixup(struct intel_dsi *intel_dsi,
 	}
 }
 
+/*
+ * The VBT DSI MIPI sequences on the MS Surface 3 contain I2C writes to
+ * a non existing TI LP855x backlight controller which time out.
+ */
+static void vlv_dsi_ms_surface3_disable_mipi_i2c(struct intel_dsi *intel_dsi,
+						 struct drm_display_mode *fixed_mode)
+{
+	intel_dsi->i2c_bus_num = INTEL_DSI_I2C_BUS_INVALID;
+}
+
 static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
 	{
 		/* Asus Transformer Pad TF103C */
@@ -1896,6 +1906,14 @@ static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
 		},
 		.driver_data = (void *)vlv_dsi_lenovo_yoga_tab2_size_fixup,
 	},
+	{
+		/* Microsoft Surface 3 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
+		},
+		.driver_data = (void *)vlv_dsi_ms_surface3_disable_mipi_i2c,
+	},
 	{ }
 };
 
-- 
2.35.1

