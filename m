Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47DF8509BA
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 15:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D7D10EAFE;
	Sun, 11 Feb 2024 14:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kbvZyFkf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D3810EA13;
 Sun, 11 Feb 2024 14:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJlm84cG+Qiz7fTfjx+s6L/rop1lOkUae38FxQTx4S0wCdt7oHpXXATha01ptfNmkUgqwl3tZqwLWzFWTCMQ2yBnz1lHi6HabDDFUuyBavNQumn9gn8HrHoUUqNt8oyw+SGrBU4nykU3DnSSkGVL/jILC3TbUllNB7v38QFwOS9qc3CryE5fllfGiRykeXtaVYsV+eoXdUIJXWJUXtae7MOWizmCiBN2Jqgy4YaLoTOIqz3Aif9CWGiAwmLJE5WZ6hDaRpFizkdEUcjUkxUd1AcdUFc5MhC7VdiWThM75StJfZ/ewBRRhuzNyXh9CjkYNC9upcWqXjP7fvI7xzacuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt4IJtDz9lJXEWpJox7SKHGWQTRgQ/1HuPjj515rsMA=;
 b=V1OEeigsyM9q/3ZP9MlPMDqfq025zSYFQgO45O904KKKHitrh8U859M8e3qFEYbv3xs/UFXteSGIL13P9zWNvGLevAPCuB9AHNRY72ODuY2vDMWWMAAQOBhvsneIYwhLzRC9G6f1ZMYRTLcxCaYzrefiMfAO7+CwhGJtYo4yTZLdWmz5H+w/UOYdv5efl98gGXgL/NwFaZseeDrGZzBbvB/kr3UMLVHNbiVD5R24qiQl2DGwNLnv72xWuv7o0KcnxRpXfUmJ/cP1bFGekNwSgbyYNbJbT8Pjy+H5V8lROXPX/8ocHXpaalDpsARb7ZpZ9WY6iUal/JfQ4r68g4LGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt4IJtDz9lJXEWpJox7SKHGWQTRgQ/1HuPjj515rsMA=;
 b=kbvZyFkfeh5q40dW5W4IdXBnzAmtkWoVbVQUFHw2jveI1CeE+WQCytF3t8EgFywYMSw8FnMfrrazLcnrn6TE0AwCKCRBZVgQGWzy+m34I5gwBlM3EY2lChicy1mXQREIVaAWdMzeJqA/KXP6sCyotePYBVQAVwSWeTWbtLVQHYs=
Received: from BL1PR13CA0270.namprd13.prod.outlook.com (2603:10b6:208:2ba::35)
 by PH7PR12MB9127.namprd12.prod.outlook.com (2603:10b6:510:2f6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.12; Sun, 11 Feb
 2024 14:54:58 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:2ba:cafe::d6) by BL1PR13CA0270.outlook.office365.com
 (2603:10b6:208:2ba::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.10 via Frontend
 Transport; Sun, 11 Feb 2024 14:54:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Sun, 11 Feb 2024 14:54:57 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 11 Feb
 2024 08:54:57 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
CC: "open list:ACPI" <linux-acpi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v5 1/3] drm: Add support to get EDID from ACPI
Date: Sat, 10 Feb 2024 23:50:09 -0600
Message-ID: <20240211055011.3583-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240211055011.3583-1-mario.limonciello@amd.com>
References: <20240211055011.3583-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|PH7PR12MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: c792d1f3-ffab-49a5-e5a6-08dc2b116a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EdiyyLUlXHoFNFGxglZXwHxayjgusrnM15c78NmCAHBr3/Ggca5u1mVrpd6CXIJWq8nx2lvLLQMdJQPCqk5ja5PoetUAdCB36k8JEP+f410hZDBWH1jh2SVzKofrffjRg9d2uMSq7Q+SB0189Y3nqtsQrP+383fWzeUog9SjBFrb0K1kXN8xRyKsi3ELiJtEvZ7NSPAldSO5fx30NDylUTxQow5Y7NfckYeDaBT+fjGVycfbTWLU5VtTMmSqvdSIsO43vlHSk0lVeiECh+mbuMhpbmy8M/54xTDnL+okvb0uU3uZvFtToicdxIWlMfdE7Tt3uvFuHjGzob32l+0hv1HrHsR1tZPWWUlPfmLILSUdP9pA26VrYxf3J9lvqALtnnSX95nj5jMpYmFzmRrrdhrGN3IYyV24RbHLD7uhY8j/CcAGT/YfeokNIIkKZa/NB6EzC+STDD+PdrYlFFu1FuMaOQMspvoCXrf6HRoeupmladWfa17ty/LR2+tGOY9tGo1qnk8enwHLeVX0Ffl82uoIAu5F3Se3/p/RjGVsAxPegGShv2tU5OJtKTgwnN5X5gpnXFaSvm2js95aJN4goam+m3qOqJZUnTJZx9gvri0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(82310400011)(40470700004)(36840700001)(46966006)(7696005)(478600001)(2616005)(41300700001)(66899024)(5660300002)(8936002)(70206006)(4326008)(70586007)(44832011)(2906002)(8676002)(110136005)(6666004)(316002)(54906003)(26005)(83380400001)(16526019)(1076003)(82740400003)(36756003)(86362001)(336012)(356005)(81166007)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2024 14:54:57.9783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c792d1f3-ffab-49a5-e5a6-08dc2b116a74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9127
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
v1->v2:
 * Split code from previous amdgpu specific helper to generic drm helper.
v2->v3:
 * Add an extra select to fix a variety of randconfig errors found from
   LKP robot.
v3->v4:
 * Return struct drm_edid
v4->v5:
 * Rename to drm_edid_read_acpi
 * Drop selects
---
 drivers/gpu/drm/Kconfig     |   7 +++
 drivers/gpu/drm/drm_edid.c  | 113 +++++++++++++++++++++++++++++++++---
 include/drm/drm_connector.h |   6 ++
 include/drm/drm_edid.h      |   1 +
 4 files changed, 119 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2520db0b776e..a49740c528b9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -103,6 +103,13 @@ config DRM_KMS_HELPER
 	help
 	  CRTC helpers for KMS drivers.
 
+config DRM_ACPI_HELPER
+	tristate "ACPI support in DRM"
+	depends on DRM
+	depends on (ACPI_VIDEO || ACPI_VIDEO=n)
+	help
+	  ACPI helpers for DRM drivers.
+
 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 69c68804023f..096c278b6f66 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -28,6 +28,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <acpi/video.h>
 #include <linux/bitfield.h>
 #include <linux/cec.h>
 #include <linux/hdmi.h>
@@ -2188,6 +2189,62 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
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
+	if (IS_REACHABLE(CONFIG_DRM_ACPI_HELPER)) {
+		r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
+		if (r < 0) {
+			DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
+			return -EINVAL;
+		}
+	} else {
+		r = -EOPNOTSUPP;
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
@@ -2621,7 +2678,8 @@ EXPORT_SYMBOL(drm_probe_ddc);
  * @connector: connector we're probing
  * @adapter: I2C adapter to use for DDC
  *
- * Poke the given I2C channel to grab EDID data if possible.  If found,
+ * If the connector allows it, try to fetch EDID data using ACPI. If not found
+ * poke the given I2C channel to grab EDID data if possible.  If found,
  * attach it to the connector.
  *
  * Return: Pointer to valid EDID or NULL if we couldn't find any.
@@ -2629,20 +2687,50 @@ EXPORT_SYMBOL(drm_probe_ddc);
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
@@ -2727,10 +2815,11 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
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
@@ -2742,10 +2831,18 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
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
index 518d1b8106c7..38b5e1b5c773 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -463,5 +463,6 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid);
 
 const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index);
+const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.34.1

