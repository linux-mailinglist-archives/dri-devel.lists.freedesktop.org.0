Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0A94C50EC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 22:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D96410E975;
	Fri, 25 Feb 2022 21:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C7110E9AC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 21:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645825836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3295UBye6Oldy4KAgQHlEN6++tFFxU1UQIOAxjhTq4=;
 b=KD/11n14E/XFCPCLf6ezV5cjgEp/iq53lqwoPtBBv1dRBfoneunpJXIySSZ4O4YcdK98ZG
 EaO8nMiGbGmY5eeMMlF1RS4tofPrI6RLKSARHwFh2KGPnjcvlL6Dx6uCtk6x+r5jGKQ1dy
 PC/T+vRLIgTpzqa4JnyGGokajwVmxao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-_cgAMBrSMrKQuYxlMGemBw-1; Fri, 25 Feb 2022 16:50:33 -0500
X-MC-Unique: _cgAMBrSMrKQuYxlMGemBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC337801DDB;
 Fri, 25 Feb 2022 21:50:31 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6909F87BB5;
 Fri, 25 Feb 2022 21:50:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 4/5] drm/i915/dsi: Skip MIPI I2C sequences if not listed as a
 I2cSerialBus resource
Date: Fri, 25 Feb 2022 22:49:33 +0100
Message-Id: <20220225214934.383168-4-hdegoede@redhat.com>
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

The current mipi_exec_i2c code uses 2 methods to find the I2C bus / adapter
to use:

1) Search for an ACPI I2cSerialBus resource matching the client address
from the MIPI sequence

2) Fall back to searching the adapter by the I2C bus number from the MIPI
sequence if 1) fails.

1 is fine, 2 however is problematic Linux does not have a fixed enumeration
order for I2C busses, so Linux numbers don't necessary line up with the
VBT numbers. On the Lenovo Yoga Tablet 2 830/1050 this causes these errors:

i2c_designware 80860F41:03: controller timed out
i915 0000:00:02.0: [drm] *ERROR* Failed to xfer payload of size (1) to reg (169)
i2c_designware 80860F41:03: controller timed out
i915 0000:00:02.0: [drm] *ERROR* Failed to xfer payload of size (1) to reg (165)
i2c_designware 80860F41:03: controller timed out
i915 0000:00:02.0: [drm] *ERROR* Failed to xfer payload of size (1) to reg (167)

Fix these errors by turning mipi_exec_i2c calls into no-ops if there is
no matching ACPI I2cSerialBus resource, restoring the behavior from before
the current mipi_exec_i2c implementation. This change should not cause any
issues because:

1) Most DSDT correctly list an I2cSerialBus resource matching the client
VBT MIPI sequence address, so we never hit scenario 2.

2) The current mipi_exec_i2c implementation was added to fix a backlight
issue on an Aava Mobile's Inari 10 tablet, which is Bay Trail based. Most
BYT based devices have worked fine with a no-op implementation of
mipi_exec_i2c since 2014.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dsi.h     |  3 +++
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
index a3a906cb097e..69e3f7b6fdaf 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi.h
+++ b/drivers/gpu/drm/i915/display/intel_dsi.h
@@ -32,6 +32,9 @@
 #define INTEL_DSI_VIDEO_MODE	0
 #define INTEL_DSI_COMMAND_MODE	1
 
+#define INTEL_DSI_I2C_BUS_UNINITIALIZED		-1
+#define INTEL_DSI_I2C_BUS_INVALID		-2
+
 /* Dual Link support */
 #define DSI_DUAL_LINK_NONE		0
 #define DSI_DUAL_LINK_FRONT_BACK	1
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 215dbfc0af0f..f7273c0cae90 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -468,11 +468,17 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
 		    __func__, vbt_i2c_bus_num, slave_addr, reg_offset,
 		    payload_size, data + 7);
 
-	if (intel_dsi->i2c_bus_num < 0) {
-		intel_dsi->i2c_bus_num = vbt_i2c_bus_num;
+	if (intel_dsi->i2c_bus_num == INTEL_DSI_I2C_BUS_UNINITIALIZED) {
+		intel_dsi->i2c_bus_num = INTEL_DSI_I2C_BUS_INVALID;
 		i2c_acpi_find_adapter(intel_dsi, slave_addr);
+		if (intel_dsi->i2c_bus_num < 0)
+			drm_warn(&i915->drm, "Cannot find I2C bus %d client-addr 0x%02x, skipping MIPI I2C sequences\n",
+				 vbt_i2c_bus_num, slave_addr);
 	}
 
+	if (intel_dsi->i2c_bus_num < 0)
+		goto err_bus;
+
 	adapter = i2c_get_adapter(intel_dsi->i2c_bus_num);
 	if (!adapter) {
 		drm_err(&i915->drm, "Cannot find a valid i2c bus for xfer\n");
-- 
2.35.1

