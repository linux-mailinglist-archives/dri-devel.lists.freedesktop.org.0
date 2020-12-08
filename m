Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAF62D2AC6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDD46E92B;
	Tue,  8 Dec 2020 12:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56796E0CF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:29:59 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTsRQ064024;
 Tue, 8 Dec 2020 06:29:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607430594;
 bh=JpHA/w1FiegOmLYTvyhahyGj8gRh7jLTeSQfmEeloCI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=JNezfKgmxr6xNeSNkJG5a7lzqq7eWzJR9KbGIaZ0bHeMujU6kIkq01JuSoCvKOOmS
 eByFph3s/eT8uP4ENhfEJXr7OVijLdPbZM3jSf+TC50n2kVU0ebk7Zbbkha2AdMuIo
 bMGm2rUJh3zR30KYevjTFbtaPg0NJ2F56Ga+vm5M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CTsUM103314
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 06:29:54 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:29:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:29:53 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjJ095068;
 Tue, 8 Dec 2020 06:29:51 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 05/29] drm/panel: panel-dsi-cm: set column & page at setup
Date: Tue, 8 Dec 2020 14:28:31 +0200
Message-ID: <20201208122855.254819-6-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208122855.254819-1-tomi.valkeinen@ti.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the column & page address once during setup, instead of relying the
DSI host driver to set those.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index 38f79dca1fd0..556f9a2c5c0c 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -170,6 +170,22 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
 	return 0;
 }
 
+static int dsicm_set_update_window(struct panel_drv_data *ddata)
+{
+	struct mipi_dsi_device *dsi = ddata->dsi;
+	int r;
+
+	r = mipi_dsi_dcs_set_column_address(dsi, 0, ddata->mode.hdisplay - 1);
+	if (r < 0)
+		return r;
+
+	r = mipi_dsi_dcs_set_page_address(dsi, 0, ddata->mode.vdisplay - 1);
+	if (r < 0)
+		return r;
+
+	return 0;
+}
+
 static int dsicm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
@@ -307,6 +323,10 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
+	r = dsicm_set_update_window(ddata);
+	if (r)
+		goto err;
+
 	r = mipi_dsi_dcs_set_display_on(ddata->dsi);
 	if (r)
 		goto err;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
