Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E823D79897C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0474410E905;
	Fri,  8 Sep 2023 15:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACC710E8F1;
 Fri,  8 Sep 2023 15:02:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRqN9OaLbcRSyKn5lfYLulvIaZRuODg8KZfyLBKwSWhpLtP/rWbpSd8YFmS+mi1TVy24D6EfZQJE431HbK5+NIFjQjDyy5uTuazhXYQrT++/XEEfNhlj39yy3trFNAfvBj83zz+xoco8Nzm+bP1vfas9rCid8PnTFFXUy5GuZvQ36+7zMEpYFh7oEftyoRfRLmQ8uQ521rYrkBQwxlYhYikBE7xD9ResR/hsp5uuK/yb/VHWGb6kFJSzka1C8H96ibqQrzmdKrrif3TobgkrbYKyCUqMok7W7gpdr578LyeqWFQIbPpvYtayi4mDfbRIRsQ5A92wckCb4rl0h6TRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3D5Jt1c7JI9CLrV45yQgYx38Kjq6kDB1Ufl55t1Txr8=;
 b=NuORVZTjCJnbLuGKSOXUJspAdxjZtMYoh2PpG8SGkJ6eCHAigvKJIOiIipdmYyLNHeDdqntIS6sE+PB6KIWWTFsGP9fQg1boda9lcLZ89DGq5TOL4dviD+AkG3wdLZ2JC1+CULQbjWPOANm15081MHdR0Cx3Y+MN0f0ImeeIuutBIxrc6iYeT8Eg8juDXUtM2c6NuxaZmjIJ0i+0ZYpzSNAD5iuaWImq4wy45Cp4JmOa5UwXMqyXe+MGIGgL0dEy/F2K9rpj5tluLME/P5QtI1dC8hp3LrRvYCdp5N3hiPx2gGbXb6Ta1wStbMX0+t8rKNzLY8mhMiD0Z0BdSsLt9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3D5Jt1c7JI9CLrV45yQgYx38Kjq6kDB1Ufl55t1Txr8=;
 b=udKnbXmB0Ki5vd/KnWrVztdWNzDVqUUzhek7t4FFZeWOycZj/4z9RKGKrSyn/WN/qEJ4DLQ5b6syL+c7hL/swViVl+2W5tXWlPkUBiAnmpIjmpMMwVX6neoo7CKof7MlRnUMcqLWWcf39oFtU2duDrFJWZm9/UpR7XiczV/dYJ4=
Received: from CH0PR03CA0444.namprd03.prod.outlook.com (2603:10b6:610:10e::12)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Fri, 8 Sep
 2023 15:02:53 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::39) by CH0PR03CA0444.outlook.office365.com
 (2603:10b6:610:10e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36 via Frontend
 Transport; Fri, 8 Sep 2023 15:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 15:02:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:52 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 10:02:50 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 08/10] drm/colorop: Add new IOCTLs to retrieve drm_colorop
 objects
Date: Fri, 8 Sep 2023 11:02:33 -0400
Message-ID: <20230908150235.75918-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230908150235.75918-1-harry.wentland@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 845e55ab-afc9-4cb3-ccb8-08dbb07cacfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJcCo+uTkDVgY0YPBSeXKEUGP0jjhwV0RrY5hmgnSb+GZz6ARSduEM+Nh2WDNmnTeTlWerDMoM5ckMPaPezbQaULxQg3nNVN8OEY/J3QIAI4jd2tMGI6B0FEirgQlhNtmczkd2mMo/j9+c+om2p/H1kWXL5RI99q3ljjOnrXxsGU8Q/aFg53ppicYPBVmeHHIKXtSPbEcyNpHU6l16JTQiyXE7Pa7oENzUIO/ZN6PQkhJbgKE9Lwj2CYpdwFE8dinTynPMw9HPVPgAcsGRvGpaOVXUkvRusyAGCrCzzKl244MpF3thy3pJeH/MUnuiSfBkd2vfY3mdqb3KL7QDjFAYQRyLJ1Km5qz+hM48xCLjQjaMiSbwArovX4KiwWQYsqvnWXTOVTnWYPr+QTH1MLlQmC3zgTErHE1Xd5BaeXUHmzCYKM9BwKoHttsSHM9BC4h9XwsqD2MomwpZcLElbNmgzthvgAw8QXEb8lfNUV8v6lyVWeAUaVZHA73wzngfepQ5WUgPMLi/9i7j6TRoR4uEDolY8pBB2/Icgvg5yJbfo56+66blkqag6VWaHv8ilZWRSVt4OOHocXgohFFWO67m7avGWGbfgYLlzsTopo32aha6KZkTMLXFpLpJKZ7RB5xndNGlGoncG9JuYp4PYiRc4tWj4elwD1W/qk587ig+7+OqNE2G0r8hJRbjKbOJTSnwuofDWcAON2KsDdl2eeMgWdp7njbfIld80eiRK3bz4seWgi0g6MTtujznZLgdHLdyXaAOEptNZ3+U3HhVhUXA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(82310400011)(186009)(451199024)(1800799009)(36840700001)(46966006)(40470700004)(356005)(6666004)(7696005)(2906002)(336012)(478600001)(1076003)(426003)(7416002)(6916009)(44832011)(316002)(41300700001)(70206006)(8936002)(26005)(70586007)(54906003)(4326008)(5660300002)(8676002)(82740400003)(40460700003)(40480700001)(2616005)(47076005)(36756003)(36860700001)(86362001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 15:02:52.6892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 845e55ab-afc9-4cb3-ccb8-08dbb07cacfb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we created a new DRM object we need new IOCTLs (and
new libdrm functions) to retrieve those objects.

TODO: Can we make these IOCTLs and libdrm functions generic
to allow for new DRM objects in the future without the need
for new IOCTLs and libdrm functions?

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
---
 drivers/gpu/drm/drm_colorop.c       | 51 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h |  4 +++
 drivers/gpu/drm/drm_ioctl.c         |  5 +++
 include/uapi/drm/drm_mode.h         | 21 ++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index a92e170aed87..fb85b5c41cc4 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -32,6 +32,57 @@
 
 /* TODO big colorop doc, including properties, etc. */
 
+/* IOCTLs */
+
+int drm_mode_getcolorop_res(struct drm_device *dev, void *data,
+			    struct drm_file *file_priv)
+{
+	struct drm_mode_get_colorop_res *colorop_resp = data;
+	struct drm_colorop *colorop;
+	uint32_t __user *colorop_ptr;
+	int count = 0;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return -EOPNOTSUPP;
+
+	colorop_ptr = u64_to_user_ptr(colorop_resp->colorop_id_ptr);
+
+	/*
+	 * This ioctl is called twice, once to determine how much space is
+	 * needed, and the 2nd time to fill it.
+	 */
+	drm_for_each_colorop(colorop, dev) {
+		if (drm_lease_held(file_priv, colorop->base.id)) {
+			if (count < colorop_resp->count_colorops &&
+			    put_user(colorop->base.id, colorop_ptr + count))
+				return -EFAULT;
+			count++;
+		}
+	}
+	colorop_resp->count_colorops = count;
+
+	return 0;
+}
+
+int drm_mode_getcolorop(struct drm_device *dev, void *data,
+		        struct drm_file *file_priv)
+{
+	struct drm_mode_get_colorop *colorop_resp = data;
+	struct drm_colorop *colorop;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return -EOPNOTSUPP;
+
+	colorop = drm_colorop_find(dev, file_priv, colorop_resp->colorop_id);
+	if (!colorop)
+		return -ENOENT;
+
+	colorop_resp->colorop_id = colorop->base.id;
+	colorop_resp->plane_id = colorop->plane ? colorop->plane->base.id : 0;
+
+	return 0;
+}
+
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 };
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 501a10edd0e1..b68e05c2cf57 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -278,6 +278,10 @@ int drm_mode_getplane(struct drm_device *dev,
 		      void *data, struct drm_file *file_priv);
 int drm_mode_setplane(struct drm_device *dev,
 		      void *data, struct drm_file *file_priv);
+int drm_mode_getcolorop_res(struct drm_device *dev, void *data,
+			    struct drm_file *file_priv);
+int drm_mode_getcolorop(struct drm_device *dev, void *data,
+		        struct drm_file *file_priv);
 int drm_mode_cursor_ioctl(struct drm_device *dev,
 			  void *data, struct drm_file *file_priv);
 int drm_mode_cursor2_ioctl(struct drm_device *dev,
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 7c9d66ee917d..a3c137ac88c6 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -716,6 +716,11 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
+
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCOLOROPRESOURCES, drm_mode_getcolorop_res, 0),
+	/* TODO do we need GETCOLOROP? */
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETCOLOROP, drm_mode_getcolorop, 0),
+
 };
 
 #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE(drm_ioctls)
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 6dcf628def56..9e37eec55291 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -357,6 +357,27 @@ struct drm_mode_get_plane {
 	__u64 format_type_ptr;
 };
 
+struct drm_mode_get_colorop_res {
+	__u64 colorop_id_ptr;
+	__u32 count_colorops;
+};
+
+
+/**
+ * struct drm_mode_get_colorop - Get colorop metadata.
+ *
+ * Userspace can perform a GETCOLOROP ioctl to retrieve information about a
+ * colorop.
+ */
+struct drm_mode_get_colorop {
+	/**
+	 * @colorop_id: Object ID of the colorop whose information should be
+	 * retrieved. Set by caller.
+	 */
+	__u32 colorop_id;
+	__u32 plane_id;
+};
+
 struct drm_mode_get_plane_res {
 	__u64 plane_id_ptr;
 	__u32 count_planes;
-- 
2.42.0

