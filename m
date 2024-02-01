Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3116846338
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 23:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE11310EBDC;
	Thu,  1 Feb 2024 22:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rdRwzx/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B776810E852;
 Thu,  1 Feb 2024 22:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpBnjjVzKoj0CunM7Oz+GyOYcfY04QvH2ZPr5axhNBlC+lvkZ1QttbIjSWrkeZD2P+A7/C2KYz/DbQ1hgYfbQk4+Vc8/eu02+m98CvvtzLjIj/g9EUzKAuYcxkKDUZriKKGnt3h3HwasfhGq1RG6tAsI/pm5PVQndRkWtQSd1RBRm8PMIpV8ZeV6+dhQSFdvnd/MUQedtgPh++yCk5QrVYoRodnfut23gD9rvJmgtvGRnmIcjqJnWr6awEJ4kEVRXngX4S6DQuDvs7d+MbKrc326Xz1IaOsSAsxFWK/iNt/jAydnpvd1UqaC6fAof3uxBCu50vHNrcXOoSujaFJMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIfrqyp9eDLDXYMlV5/hdLG7RgFw85JWLVBsFdU4Xsw=;
 b=Q5RUnzqd6T7atOYXwbq1Pp//UE1jDqeVsuaBO0BB6HUKlL3EE9RGzRKPQNduty1aixO1Pif4cHzIsawnMCGMsPye7ZBdQn5phf6dQe4XSC7fbQKjZ1Fmd8xPH+6qMvRvXCx5mb8NkfOnShPx8tSysIuT4SoFdXYwudE0fX9Xtl2bRJ+djqogwGON+WjAFPBE5mlnoKNIDGn3Q8c2obKaWKFSRYBWCQ8pI9NIT8sPyvbIk9FYydu5SWlJwWUwya2SHdnXVhOTtT8FcTxVb3d6F8uUvvFdd9HRcSn1bZMHAogLHvB/G7AY64qAPGtdGdTkfKiYS5d/O+s/aaTJAKTghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIfrqyp9eDLDXYMlV5/hdLG7RgFw85JWLVBsFdU4Xsw=;
 b=rdRwzx/9qHmqrZBrJ8UYc+0TpYlHkAdfProodU4FOQiYvV4iiYPQYQs1BTe2+kvKfh1mrJwGbZ3msz1DtpabRveDP6j0y9xnkjH2AjzB2jXk37Fz3t7Bt/l7pTWdXlapR/TCRtySDYpoLIuqcE/uUFjrAGGsQgWWu4sdSduNDUQ=
Received: from DM6PR10CA0005.namprd10.prod.outlook.com (2603:10b6:5:60::18) by
 LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Thu, 1 Feb
 2024 22:11:40 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:60:cafe::ff) by DM6PR10CA0005.outlook.office365.com
 (2603:10b6:5:60::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Thu, 1 Feb 2024 22:11:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Thu, 1 Feb 2024 22:11:39 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 1 Feb
 2024 16:11:38 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
CC: "open list:ACPI" <linux-acpi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v3 2/5] drm: Add drm_get_acpi_edid() helper
Date: Thu, 1 Feb 2024 16:11:16 -0600
Message-ID: <20240201221119.42564-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201221119.42564-1-mario.limonciello@amd.com>
References: <20240201221119.42564-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8d9e4c-c121-4336-106b-08dc2372c3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7fq/j9+upagM0b2wTPvVA1KNhSyqwUQRiSkZLYY4nj51MHYotRg1ztl2/rmqf+61c0jS7hOIUY/6hGusjH9Uglx7pN+asbnPFHoZd1iwjvWIeE1iy+zJik/6ZtWWVECBJFNtqQUAMS+QwKLWk6+dFJJV8m2t08fudGuXxLZljo5LPXBtAMxICr5lKCoKyDzd5RHcYXr6U3GV/4WYXOm3Aa0L7wo8lD5kbQm0WnaFtoaBB98WkEOWAewZM6QRj5NjhGa74efhwkHquZRZmq2ub/XHpOHZ74lZK8+xZYE41StG+IMxAvJYrOxObb4WoKWW0yMrCu2fc0FJWnF5VYBdaMJOG4VNraOqynMG4ra7Q7LSO4otFHct5nqXAHfFNH+usq4nDJIl0QDgZ2/2bEvqLINeyGO0Z54195I6mldE6A5wFNiQNymYLJEkeHqSfaUYKDukbGKGcnltQxnTvSzyb1nd5mcLz5N63C2a0hD+PuuXxsbvnhvijKTUzx9dYzKdYzrJJT6PL/tFHMXcwRSr90zuSmL05uwiDIihLpWrOuIcZ22UNIEylHrS6nPgOoO8i8I72biRIJHimk2ZhvgQL0RpeJ9SpB6s35g08kRxqbStOFZqFZCPtppxrfTnbwTVZdJNoHBet8XAW8Z2i/vv0V0+a/ia5df2lu6hSrBzVdD3ixABpfc5y3gPJjRbU91Skw29tRME0Xo/Yd6ohqz2VjgJ07+dfE9xPvuBehLWphoZODNKGqNFs6/UGsnh2UH3jlXVzYqVLyg9ScjinF9Tg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(186009)(82310400011)(1800799012)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(44832011)(40480700001)(40460700003)(8936002)(2906002)(4326008)(82740400003)(8676002)(1076003)(36860700001)(16526019)(26005)(6666004)(426003)(336012)(70206006)(81166007)(54906003)(70586007)(478600001)(5660300002)(316002)(110136005)(356005)(7696005)(2616005)(86362001)(66899024)(47076005)(83380400001)(36756003)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 22:11:39.8446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8d9e4c-c121-4336-106b-08dc2372c3e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944
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
the EDID on the internal panel on laptops.  Drivers can call this
helper to attempt to fetch the EDID from the BIOS's ACPI _DDC method.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * Split code from previous amdgpu specific helper to generic drm helper.
v2->v3:
 * Add an extra select to fix a variety of randconfig errors found from
   LKP robot.
---
 drivers/gpu/drm/Kconfig    |  5 +++
 drivers/gpu/drm/drm_edid.c | 73 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  1 +
 3 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2520db0b776e..14df907c96c8 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -21,6 +21,11 @@ menuconfig DRM
 	select KCMP
 	select VIDEO_CMDLINE
 	select VIDEO_NOMODESET
+	select ACPI_VIDEO if ACPI
+	select BACKLIGHT_CLASS_DEVICE if ACPI
+	select INPUT if ACPI
+	select X86_PLATFORM_DEVICES if ACPI && X86
+	select ACPI_WMI if ACPI && X86
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
 	  introduced in XFree86 4.0. If you say Y here, you need to select
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 69c68804023f..1fbbeaa664b2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -28,6 +28,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <acpi/video.h>
 #include <linux/bitfield.h>
 #include <linux/cec.h>
 #include <linux/hdmi.h>
@@ -2188,6 +2189,47 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
 	return ret == xfers ? 0 : -1;
 }
 
+/**
+ * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
+ * @data: struct drm_device
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
+	struct drm_device *ddev = data;
+	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
+	unsigned char start = block * EDID_LENGTH;
+	void *edid;
+	int r;
+
+	if (!acpidev)
+		return -ENODEV;
+
+	/* fetch the entire edid from BIOS */
+	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
+	if (r < 0) {
+		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
+		return -EINVAL;
+	}
+	if (len > r || start > r || start + len > r) {
+		r = EINVAL;
+		goto cleanup;
+	}
+
+	memcpy(buf, edid + start, len);
+	r = 0;
+cleanup:
+	kfree(edid);
+	return r;
+}
+
 static void connector_bad_edid(struct drm_connector *connector,
 			       const struct edid *edid, int num_blocks)
 {
@@ -2643,6 +2685,37 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_get_edid);
 
+/**
+ * drm_get_acpi_edid - get EDID data, if available
+ * @connector: connector we're probing
+ *
+ * Use the BIOS to attempt to grab EDID data if possible.  If found,
+ * attach it to the connector.
+ *
+ * Return: Pointer to valid EDID or NULL if we couldn't find any.
+ */
+struct edid *drm_get_acpi_edid(struct drm_connector *connector)
+{
+	struct edid *edid = NULL;
+
+	switch (connector->connector_type) {
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_eDP:
+		break;
+	default:
+		return NULL;
+	}
+
+	if (connector->force == DRM_FORCE_OFF)
+		return NULL;
+
+	edid = _drm_do_get_edid(connector, drm_do_probe_acpi_edid, connector->dev, NULL);
+
+	drm_connector_update_edid_property(connector, edid);
+	return edid;
+}
+EXPORT_SYMBOL(drm_get_acpi_edid);
+
 /**
  * drm_edid_read_custom - Read EDID data using given EDID block read function
  * @connector: Connector to use
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 518d1b8106c7..60fbdc06badc 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -412,6 +412,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	void *data);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
+struct edid *drm_get_acpi_edid(struct drm_connector *connector);
 u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
-- 
2.34.1

