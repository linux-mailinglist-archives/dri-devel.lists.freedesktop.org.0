Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D415D7345D8
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 12:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5CE10E042;
	Sun, 18 Jun 2023 10:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797C110E046
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 10:39:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgMOYkZ2eAPt2f80bmJldGFTkIcVRsA+ZMcdTQpoXr8nd8RB0wwXUC0yjluVcSIDlu+rG/9thIGcoZVINQoHTRPy5xaf3vog5ReCBJiv9/mMcK+jqxzUVSlQxfhHchOkRiAwEFGGmMGopTkbFd9yix0pWKU2G591dYOcSrTEnvuUjNablvQWi1edbvVl9oObHCnHbvDSWskH6MdukW42n5yvkQaW++5i+5Tv6URYnYYlKaFqAzCVKZ1dU+rPqf7tJ77uCH2OZIAkLHl0Xl2/OtDsiiZ99ePjSN0efXOlLIY8YxaN2RG5W7Xy6jhG7y0ZXY5nly+aP95Y5X8mUcpWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SXh8ZCADS/KkzCjHQ84sL1QIsA8Mx80kRGhaxu77LI=;
 b=HN0cps/2HhR0uSMs8aBzR90D422WX8p3NUonQ1P6u1LJ3+ejT48ClN/zs46A9WhdptfU2Pl67xqAoNe4QY127YMWWvRc7rIbEm03QKOQa/Djv56ibTH0RvCt2aYeCcQVY1ylj65zFHvm13PJOsIqzuTRGtl/iMQN0EycKZmdezyN13x3i9ZEszx4OlosFm99JZ45yeN4zPDn+j8EPSIdqYuEyzKiCvgzG10YdGwEDMl+kti/3gnVhhPW96SeqmzXEdfnKsc5RURWW25XJPXg4qjX+LCZcLH+2zQYiaFAhRLYfY3ZAdQzVmslAxNMk7jC/k4MdLruSZH4BPJbvx0QLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SXh8ZCADS/KkzCjHQ84sL1QIsA8Mx80kRGhaxu77LI=;
 b=aVFqnlf0X0vLVV2ZiWbq0d+6236oNabn1hO2ceduKh7JdK8KDUzbpAoHu8XCTQeSrSj6ic3RUU4mntDalGCSCTThgf0QJdNPmdNlv4ZX+8l9NUlI1N+09fp+XZFSJRNx+AlYCBXdoD0MDedHMpaEXQ7mQUWpD/U7bHLPccbLUmo=
Received: from CY8PR22CA0005.namprd22.prod.outlook.com (2603:10b6:930:45::9)
 by SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Sun, 18 Jun
 2023 10:39:06 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:45:cafe::bf) by CY8PR22CA0005.outlook.office365.com
 (2603:10b6:930:45::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35 via Frontend
 Transport; Sun, 18 Jun 2023 10:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Sun, 18 Jun 2023 10:39:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 18 Jun
 2023 05:39:04 -0500
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Sun, 18 Jun 2023 05:38:58 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/3] drm: Introduce CRTC checksum region and CRC properties
Date: Sun, 18 Jun 2023 18:38:45 +0800
Message-ID: <20230618103847.614721-2-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230618103847.614721-1-HaoPing.Liu@amd.com>
References: <20230618103847.614721-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 363169f1-2d75-47e8-ca55-08db6fe83d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P74EU5fW5itSETo3Tg8ECgdHP3Uffp2oc8fu5Qsqz0JZrvc4ahsOxXSDc28AWl/yJUobA8226/ZJJnJQMbbygE0ZXpuEAH6gBHMKu8khovi0c1qY5UYqCqBLlEuU4nd6fSsHYKu+bMXE8cnDSpbypchaZqdZLsShARbw+uPg130cTE+ObdclqKrSa/8oVw6uab0h58oWaYoylsKlXIiaC5MMpSer86xFMzqMAAdrxH7gN3u/zbLMghS6tdJ/nlvwVrNgx621sIbGJKNI8tGLXswB7J18X/xuu8GYK++OFYjTXTez4qXwVABpKboKYQobFyWS69oDV5Mrfl2lZfbD89yuIWj01N51vqWi+b76pZmGRt6AAxmgmWbilU2Mh/ncXxqjeaM2zfGmKb7K1R72USfpSjFkq3Mbfdp8AgPRk5N4J8zr0Va5Qdy/J1Tpc5SLBP5NlsdcgGI9edKyf7mBJqkO35hNyRxbxMdRR1Yzo7Q3HaNULeQWOeo0S7xqz9gGSNiWtSMw8Y87ihhITSjZxj+hx/WzSIxlnuZCWktVlmkAjPEpRwHx2M6QqkXbpLxloC7/UD/SjhzXZL+BZr001G0PUNQDw9ZUUF4eCdI0qsCijXHDYq520wOyQjWbtt3TEm1H/2l86Jzg5zuqsOMWumgH+/mugWA16+cmc9vtDZY6ZPIdak2nP2MeVRPQBz4InMz+Q3Z6gkXsUL7Ze2qXNT7zTdlfzy769+4FOFKYZku+cHPOnAJmTgCb8H21BYsDB9m9JruGVEF+FFD3v0NGzQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(70586007)(186003)(8676002)(70206006)(8936002)(82740400003)(5660300002)(54906003)(40460700003)(4326008)(6666004)(7696005)(82310400005)(316002)(478600001)(41300700001)(36756003)(26005)(1076003)(6916009)(40480700001)(426003)(336012)(81166007)(356005)(47076005)(86362001)(83380400001)(2906002)(36860700001)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2023 10:39:05.6385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 363169f1-2d75-47e8-ca55-08db6fe83d78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Wayne.Lin@amd.com, Lili.Gong@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce per-CRTC properties: CHECKSUM_REGION and CHECKSUM_CRC.
Userspace can configure a region by setting the region property and
retrieve the CRC values from the CRC property to validate the content
of the region.

Apon userspace submits the 4 coordinate values with checksum_region_enable true,
kernel instructs DC hardware to calculate the CRC value accordingly as frames
scanned out. The result CRC value of RGB colors are then stored in CHECKSUM_CRC
property, with a reference frame count for userspace to know which frame the
CRCs are calculated at.

Driver can set up these properties for a CRTC by calling
drm_crtc_create_checksum_region_properties() and hook its own
implementation on new CRTC function update_chechsum_region_crc() to update
the values of the CRC property for the incoming userspace request.

Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  7 ++++
 drivers/gpu/drm/drm_atomic_uapi.c         | 21 ++++++++++-
 drivers/gpu/drm/drm_crtc.c                | 44 +++++++++++++++++++++++
 include/drm/drm_crtc.h                    | 43 ++++++++++++++++++++++
 include/uapi/drm/drm_mode.h               | 42 ++++++++++++++++++++++
 5 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index dfb57217253b..a8f25575edef 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -143,6 +143,11 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 		drm_property_blob_get(state->ctm);
 	if (state->gamma_lut)
 		drm_property_blob_get(state->gamma_lut);
+	if (state->checksum_region.region_blob)
+		drm_property_blob_get(state->checksum_region.region_blob);
+	if (state->checksum_region.crc_blob)
+		drm_property_blob_get(state->checksum_region.crc_blob);
+
 	state->mode_changed = false;
 	state->active_changed = false;
 	state->planes_changed = false;
@@ -215,6 +220,8 @@ void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state)
 	drm_property_blob_put(state->degamma_lut);
 	drm_property_blob_put(state->ctm);
 	drm_property_blob_put(state->gamma_lut);
+	drm_property_blob_put(state->checksum_region.region_blob);
+	drm_property_blob_put(state->checksum_region.crc_blob);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c06d0639d552..5a934f191940 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -450,6 +450,17 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
 	} else if (property == crtc->scaling_filter_property) {
 		state->scaling_filter = val;
+	} else if (property == crtc->checksum_region_property) {
+		ret = drm_atomic_replace_property_blob_from_id(dev,
+					&state->checksum_region.region_blob,
+					val,
+					-1, sizeof(struct drm_checksum_region),
+					&replaced);
+		state->checksum_region.region_changed |= replaced;
+		return ret;
+	} else if (property == crtc->checksum_crc_property) {
+		/* don't let user set CRC data */
+		return -EPERM;
 	} else if (crtc->funcs->atomic_set_property) {
 		return crtc->funcs->atomic_set_property(crtc, state, property, val);
 	} else {
@@ -487,7 +498,15 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
 		*val = state->scaling_filter;
-	else if (crtc->funcs->atomic_get_property)
+	else if (property == crtc->checksum_region_property)
+		*val = (state->checksum_region.region_blob)
+			? state->checksum_region.region_blob->base.id : 0;
+	else if (property == crtc->checksum_crc_property) {
+		if (crtc->funcs->update_checksum_region_crc)
+			crtc->funcs->update_checksum_region_crc(crtc);
+		*val = (state->checksum_region.crc_blob)
+			? state->checksum_region.crc_blob->base.id : 0;
+	} else if (crtc->funcs->atomic_get_property)
 		return crtc->funcs->atomic_get_property(crtc, state, property, val);
 	else
 		return -EINVAL;
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index df9bf3c9206e..07186cb8bfd4 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -955,3 +955,47 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 	return 0;
 }
 EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
+
+/**
+ * drm_crtc_create_checksum_region_properties - create new checksum_region
+ * properties
+ *
+ * @crtc: drm CRTC
+ *
+ * This function creates and attaches CHECKSUM_REGION and CHECKSUM_CRC blob
+ * properties for the given CRTC.
+ *
+ * RETURNS:
+ * Zero for success or -ENOMEM
+ */
+int drm_crtc_create_checksum_region_properties(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_property *region_prop, *crc_prop;
+
+	region_prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+					"CHECKSUM_REGION", 0);
+	crc_prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+					"CHECKSUM_CRC", 0);
+
+	if (!region_prop || !crc_prop)
+		goto fail;
+
+	drm_object_attach_property(&crtc->base, region_prop, 0);
+	drm_object_attach_property(&crtc->base, crc_prop, 0);
+
+	crtc->checksum_region_property = region_prop;
+	crtc->checksum_crc_property = crc_prop;
+
+	return 0;
+
+fail:
+	if (region_prop)
+		drm_property_destroy(dev, region_prop);
+
+	if (crc_prop)
+		drm_property_destroy(dev, crc_prop);
+
+	return -ENOMEM;
+}
+EXPORT_SYMBOL(drm_crtc_create_checksum_region_properties);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8e1cbc75143e..e588c321eb7a 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -322,6 +322,21 @@ struct drm_crtc_state {
 	 */
 	enum drm_scaling_filter scaling_filter;
 
+	/**
+	 * @checksum_region:
+	 *
+	 * Checksum_region properties for configuring the region and retrieving the
+	 * CRC checksum values of the region content. The region_changed is set when
+	 * a new region is set by the userspace. If not NULL, the region_blob is of
+	 * type struct drm_checksum_region and the crc_blob is of type struct
+	 * drm_checksum_crc.
+	 */
+	struct {
+		struct drm_property_blob *region_blob;
+		struct drm_property_blob *crc_blob;
+		bool region_changed: 1;
+	} checksum_region;
+
 	/**
 	 * @event:
 	 *
@@ -926,6 +941,22 @@ struct drm_crtc_funcs {
 				     int *max_error,
 				     ktime_t *vblank_time,
 				     bool in_vblank_irq);
+	
+	/**
+	 * @update_checksum_region_crc:
+	 * 
+	 * Driver callback to update the content of CRTC CHECKSUM_CRC property.
+	 * This function fetches the latest checksum CRC values and replaces the
+	 * old crc_blob in struct drm_crtc_state.
+	 *
+	 * This callback is optional if the driver does not support any CRC
+	 * generation functionality.
+	 *
+	 * RETURNS:
+	 *
+	 * True on success, false on failure.
+	 */ 
+	bool (*update_checksum_region_crc) (struct drm_crtc *crtc);
 };
 
 /**
@@ -1180,6 +1211,17 @@ struct drm_crtc {
 	 * Initialized via drm_self_refresh_helper_init().
 	 */
 	struct drm_self_refresh_data *self_refresh_data;
+
+	/**
+	 * @checksum_region_property: property for checksum region configuration.
+	 */
+	struct drm_property *checksum_region_property;
+
+	/**
+	 * @checksum_crc_property: property for retrieving the CRC checksum
+	 * values of the content of checksum region.
+	 */
+	struct drm_property *checksum_crc_property;
 };
 
 /**
@@ -1329,4 +1371,5 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
 
+int drm_crtc_create_checksum_region_properties(struct drm_crtc *crtc);
 #endif /* __DRM_CRTC_H__ */
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 46becedf5b2f..a2b7d2be94d3 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1303,6 +1303,48 @@ struct drm_mode_rect {
 	__s32 y2;
 };
 
+/**
+ * struct drm_checksum_region - The enablement and region of checksum_region
+ * @x_start: Horizontal starting coordinate of the region.
+ * @y_start: Vertical starting coordinate of the region.
+ * @x_end: Horizontal ending coordinate of the region.
+ * @y_end: Vertical ending coordinate of the region.
+ * @checksum_region_enable: To enable or disable checksum_region.
+ *
+ * Userspace uses this structure to configure the region and enablement for
+ * checksum_region. Userspace should not submit a region out of the displayable
+ * region because there is nothing to display and need protection.
+ */
+struct drm_checksum_region {
+	__u32 x_start;
+	__u32 y_start;
+	__u32 x_end;
+	__u32 y_end;
+	__u8 checksum_region_enable;
+	__u8 pad[7];
+};
+
+/**
+ * struct drm_checksum_crc - The CRC value of the corresponding checksum region.
+ * @crc_r: CRC value of red color.
+ * @crc_g: CRC value of green color.
+ * @crc_b: CRC value of blue color.
+ * @frame_count: a referenced frame count to indicate which frame the CRC values
+ *  are generated at.
+ *
+ * Userspace uses this structure to retrieve the CRC values of the current
+ * checksum region. @frame_count will be reset once a new region is updated or
+ * it reaches a maximum value. Currently these CRC values are designed to
+ * be validated with pre-saved CRC values, so userspace doesn't need to concern
+ * about the algorithm used to compute the CRC.
+ */
+struct drm_checksum_crc {
+	__u32 crc_r;
+	__u32 crc_g;
+	__u32 crc_b;
+	__u32 frame_count;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

