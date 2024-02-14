Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89485554A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 22:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E7F10E758;
	Wed, 14 Feb 2024 21:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OHVOleSi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DDB10E482;
 Wed, 14 Feb 2024 21:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRJ6olEaGFCdO0uYsIUYki5QFE6Go32nBiGTFEaQfgb6cXAy24wj9vUOBktcghqL7+JElNfg4nacXMLnrhvnxMxDtMxIy75KrlUoDI17qcatGHX07LuvvRlyjop57DSWGXrmh+4w3dZHFzGx4RpO76sgNFjk4GF2Bq3oLafJTyFTMXK80wc1ZXK/dW8F+L641syWZK4Yif8UDGYpRnCp4YIwF8NM2nl7ebg/rCp+eEA/ZlvcoVmcRw/uvM6tZQDpXQPCfe48qoVp/aMuGaSczaNpI/5/TjSLKtJNUa8J1mtDSRRp/weUJ7GdpQfeHLoLQJiAEStFj6PxwvG5BT4t0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijTBQLavwGwoqcodRrW9x+ZVRUoNo9dDweW735Q8j+I=;
 b=Mn8DbT/2TontnMRCNtnMEZeZaivRQriM3V6mPAo+TgLfPgFf/35nGfSBAbmrZI0Cchg3nTNjsBj7P5k5RwH6tC5RhXuYqvmFM0tP3FvhDcBkwcU6mN0j8eXapr3ZMM/7eI5DcTVhY+9PKNydr2fKL+WVajfJ+0UxC0n3ihIsSbNj8tl2cOLFYuI26ikmj2Oho+RSJ0uXQABtYnq9GjwHd/ACR4wwi3CXkqpVjqHHljoT0TRBfhJJz2FTAlFp2JMZOBeJUIzMbW3soWp8n8uPmh4B0GEg8vnJkKHt/J/a8JoJjGNBBYnsrxZU/ZDwtUGN4KcWhKUo1eSx/Nq+hXMZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijTBQLavwGwoqcodRrW9x+ZVRUoNo9dDweW735Q8j+I=;
 b=OHVOleSiSc9B3eB7cJXimILFNUg0+psPv7snMSODD7Qy4iLopUEmIIdv49l+YMHFhh7GyWPzXkmDgYdO0KGyCPdJADYVuzqytIDqQ8ysno2mm3LlPzudoGXqkZAp2HcZCV/v8mKKLPhh7fiV8iaaKeP/vlvy9mZf0xlNlHagW4M=
Received: from BL1PR13CA0020.namprd13.prod.outlook.com (2603:10b6:208:256::25)
 by IA0PR12MB7506.namprd12.prod.outlook.com (2603:10b6:208:442::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Wed, 14 Feb
 2024 21:58:29 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::d0) by BL1PR13CA0020.outlook.office365.com
 (2603:10b6:208:256::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 21:58:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 21:58:29 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 15:58:28 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
CC: <amd-gfx@lists.freedesktop.org>, "open list:USB SUBSYSTEM"
 <linux-usb@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <linux-renesas-soc@vger.kernel.org>, "open list:ACPI"
 <linux-acpi@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v6 3/5] drm: Add support to get EDID from ACPI
Date: Wed, 14 Feb 2024 15:57:54 -0600
Message-ID: <20240214215756.6530-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214215756.6530-1-mario.limonciello@amd.com>
References: <20240214215756.6530-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|IA0PR12MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d143d8-d99f-4b44-3862-08dc2da81406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RX5sbaqCoKR40WnF+AYC3SHOOANWsa07s+Q2V+V53GWgOt4EoPmRaPO6Q9z93AaqM1TtM6x9PIQVlZhNKbiTHOKKLsqvc982YasmOUxuKqNJtb/RbOhFj1i8qPzAB3mdL+6DU40/1cn1VliPsleGxs0/yRi7i/wQxJCzts3azlYUS7BwbD97ow8bQsX9aRBGH15WlFomanfLJlJHraUbUzj88oiV6EiR/jAFVyjsTB2d1yuDXevyKylERjQxH6yt+eh2ziQ1R6S4dJIbWGoR3IG5ByPDib2duH/HRYSzDkkQ+5OVnT8PDlYDYGZfWx9hKNgSiz9wBxUJt71ryF8m9oAHA9CQJyghXAefLsVRMNVyKpeiIvLuvqdCczH0SkdwoAcLifhLPmFFF8bjk7HkBrx1cVanT0f9D/oMYX5qHLMUG2nQ6GYgC4ZYrz8qabTysGlQlBdvLIDjfi6gCaigIsaTpVZDVQ/z+ANmKMNPI2zdrTO1zdY7ysZNPT5SgUXOvirHynygGYg5ulfT202+aDBTbLJ2QaxUGZyTEDR1xTwIoSR3NULp2hEgho7gG3Mrv8p3wiNYItU0bKxTuUbEgKKjpXznmKCc+Mm/2cz+PCElONv66epSvTTZG2Fta9largZSJSHe9SoMUiHggOb8hT19SbYamy5SsV1eVJT5Rp0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(36860700004)(64100799003)(82310400011)(186009)(1800799012)(451199024)(46966006)(40470700004)(2616005)(41300700001)(7696005)(478600001)(66899024)(7416002)(44832011)(5660300002)(8936002)(8676002)(4326008)(2906002)(70586007)(70206006)(6666004)(54906003)(316002)(16526019)(1076003)(26005)(83380400001)(86362001)(36756003)(110136005)(426003)(82740400003)(81166007)(356005)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 21:58:29.3006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d143d8-d99f-4b44-3862-08dc2da81406
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7506
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some manufacturers have intentionally put an EDID that differs from
the EDID on the internal panel on laptops.  Drivers that prefer to
fetch this EDID can set a bit on the drm_connector to indicate that
the DRM EDID helpers should try to fetch it and it is preferred if
it's present.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/Kconfig     |   1 +
 drivers/gpu/drm/drm_edid.c  | 109 +++++++++++++++++++++++++++++++++---
 include/drm/drm_connector.h |   6 ++
 include/drm/drm_edid.h      |   1 +
 4 files changed, 109 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 872edb47bb53..3db89e6af01d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -8,6 +8,7 @@
 menuconfig DRM
 	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
+	depends on (ACPI_VIDEO || ACPI_VIDEO=n)
 	select DRM_PANEL_ORIENTATION_QUIRKS
 	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
 	select FB_CORE if DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 923c4423151c..cdc30c6d05d5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -28,6 +28,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <acpi/video.h>
 #include <linux/bitfield.h>
 #include <linux/cec.h>
 #include <linux/hdmi.h>
@@ -2188,6 +2189,58 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
 	return ret == xfers ? 0 : -1;
 }
 
+/**
+ * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
+ * @data: struct drm_connector
+ * @buf: EDID data buffer to be filled
+ * @block: 128 byte EDID block to start fetching from
+ * @len: EDID data buffer length to fetch
+ *
+ * Try to fetch EDID information by calling acpi_video_get_edid() function.
+ *
+ * Return: 0 on success or error code on failure.
+ */
+static int
+drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	struct drm_connector *connector = data;
+	struct drm_device *ddev = connector->dev;
+	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
+	unsigned char start = block * EDID_LENGTH;
+	void *edid;
+	int r;
+
+	if (!acpidev)
+		return -ENODEV;
+
+	switch (connector->connector_type) {
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_eDP:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* fetch the entire edid from BIOS */
+	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
+	if (r < 0) {
+		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
+		return r;
+	}
+	if (len > r || start > r || start + len > r) {
+		r = -EINVAL;
+		goto cleanup;
+	}
+
+	memcpy(buf, edid + start, len);
+	r = 0;
+
+cleanup:
+	kfree(edid);
+
+	return r;
+}
+
 static void connector_bad_edid(struct drm_connector *connector,
 			       const struct edid *edid, int num_blocks)
 {
@@ -2621,7 +2674,8 @@ EXPORT_SYMBOL(drm_probe_ddc);
  * @connector: connector we're probing
  * @adapter: I2C adapter to use for DDC
  *
- * Poke the given I2C channel to grab EDID data if possible.  If found,
+ * If the connector allows it, try to fetch EDID data using ACPI. If not found
+ * poke the given I2C channel to grab EDID data if possible.  If found,
  * attach it to the connector.
  *
  * Return: Pointer to valid EDID or NULL if we couldn't find any.
@@ -2629,20 +2683,50 @@ EXPORT_SYMBOL(drm_probe_ddc);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter)
 {
-	struct edid *edid;
+	struct edid *edid = NULL;
 
 	if (connector->force == DRM_FORCE_OFF)
 		return NULL;
 
-	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
-		return NULL;
+	if (connector->acpi_edid_allowed)
+		edid = _drm_do_get_edid(connector, drm_do_probe_acpi_edid, connector, NULL);
+
+	if (!edid) {
+		if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
+			return NULL;
+		edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
+	}
 
-	edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
 	drm_connector_update_edid_property(connector, edid);
 	return edid;
 }
 EXPORT_SYMBOL(drm_get_edid);
 
+/**
+ * drm_edid_read_acpi - get EDID data, if available
+ * @connector: connector we're probing
+ *
+ * Use the BIOS to attempt to grab EDID data if possible.
+ *
+ * The returned pointer must be freed using drm_edid_free().
+ *
+ * Return: Pointer to valid EDID or NULL if we couldn't find any.
+ */
+const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector)
+{
+	const struct drm_edid *drm_edid;
+
+	if (connector->force == DRM_FORCE_OFF)
+		return NULL;
+
+	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector);
+
+	/* Note: Do *not* call connector updates here. */
+
+	return drm_edid;
+}
+EXPORT_SYMBOL(drm_edid_read_acpi);
+
 /**
  * drm_edid_read_custom - Read EDID data using given EDID block read function
  * @connector: Connector to use
@@ -2727,10 +2811,11 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
 EXPORT_SYMBOL(drm_edid_read_ddc);
 
 /**
- * drm_edid_read - Read EDID data using connector's I2C adapter
+ * drm_edid_read - Read EDID data using BIOS or connector's I2C adapter
  * @connector: Connector to use
  *
- * Read EDID using the connector's I2C adapter.
+ * Read EDID from BIOS if allowed by connector or by using the connector's
+ * I2C adapter.
  *
  * The EDID may be overridden using debugfs override_edid or firmware EDID
  * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
@@ -2742,10 +2827,18 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
  */
 const struct drm_edid *drm_edid_read(struct drm_connector *connector)
 {
+	const struct drm_edid *drm_edid = NULL;
+
 	if (drm_WARN_ON(connector->dev, !connector->ddc))
 		return NULL;
 
-	return drm_edid_read_ddc(connector, connector->ddc);
+	if (connector->acpi_edid_allowed)
+		drm_edid = drm_edid_read_acpi(connector);
+
+	if (!drm_edid)
+		drm_edid = drm_edid_read_ddc(connector, connector->ddc);
+
+	return drm_edid;
 }
 EXPORT_SYMBOL(drm_edid_read);
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fe88d7fc6b8f..74ed47f37a69 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1886,6 +1886,12 @@ struct drm_connector {
 
 	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
 	struct hdr_sink_metadata hdr_sink_metadata;
+
+	/**
+	 * @acpi_edid_allowed: Get the EDID from the BIOS, if available.
+	 * This is only applicable to eDP and LVDS displays.
+	 */
+	bool acpi_edid_allowed;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 7923bc00dc7a..1c1ee927de9c 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -459,5 +459,6 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid);
 
 const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index);
+const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.34.1

