Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B350D7D03D1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4DF10E568;
	Thu, 19 Oct 2023 21:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD0B10E54E;
 Thu, 19 Oct 2023 21:22:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwXLdZwf+WAOyYottOzZJzoItAYIT7qHO7UZEjKgR5kSYl4VSGRnaF1U6dkZYo9LiQXZ/S8nNcfo9YDK89m1/VYr9G3+G/ZuKqbHl0Bhepq8ziAf9eRHmYW3Y4Mf6up04K41+9Nzb/v5gfPIiFNbV0mnDx2ocHVr/A0oWo70sADITsfTZ3m/Ehe4B1AI8j7aMCQJ+nS0EWHcxulTE6ZXG0WMJxZA7HI+67p1Vp4M/hwyyavIbKt6LsMRU+BxZLvfVpu/UdV1PWwRujmhncBVeYeJe011Loe9YP/U4tkA82lG81b1hO+gxBQ6IHPImpANzCNyAfNR9KniagJ70bSlkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttubomwN/OpCoz4E4NiUcH3OcPQ11gsS/g82jclU64I=;
 b=ccbUVoILCtjAY/vsNsHG79/fwUmc8iB1Szmv/b1S98LLmlIrnXD1Kdii1UZ1w85Hm/okoWM4AvmIa5nFwYVPRTM3a8zeybpY3cKRFV4eO91CWRuuTKB+54TD/A0pZTZcZ3qvj7gNjS1G63dsgAMT2IHkWeQGtdkY82Z7dRHO5ieDxyDhTUmGzNcJupqWeSh9kWdyNyuHgFFiG1+7mbEBlFM5NfTe75jALkBMwutw8Tx0nO4KmS9KcKl4X5Th6xrVmamOTycqLH8JuDfxUC8CissX2Kzqs6m0tva3GDGLvJMh+NHL654GTUMJlDaZ4T9Po35lOaAjKqeus/q4Y6HXlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttubomwN/OpCoz4E4NiUcH3OcPQ11gsS/g82jclU64I=;
 b=YYnjryAVWlczmu5MLGmGSclCWAeZ4tV5oE9Tc6SE6+XLBjTpXFh23rB0+M6LlLvOQr20XmPrKRUTtsToMcUzVf2oj3jj8d5J7ksuXMhG3fPvwwUhKD5Ld/QuPu/1RZPvVeRS8PJTKZNRLdkxukTuRqLkGZR0jUoGsXN0rnS6fBY=
Received: from MN2PR03CA0018.namprd03.prod.outlook.com (2603:10b6:208:23a::23)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 19 Oct
 2023 21:22:44 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::f8) by MN2PR03CA0018.outlook.office365.com
 (2603:10b6:208:23a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Thu, 19 Oct 2023 21:22:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.21 via Frontend Transport; Thu, 19 Oct 2023 21:22:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:22:43 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:22:42 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 13/17] drm/colorop: Add new IOCTLs to retrieve
 drm_colorop objects
Date: Thu, 19 Oct 2023 17:21:29 -0400
Message-ID: <20231019212133.245155-14-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: dd414f6d-2bc8-4cfb-1e81-08dbd0e98872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 51J6x+9tTRlXRzyRWOwIcDqKQhVTJhVUbNe05U4kCF9kdk3cnkMCjOA2Sjo80CG4LH9Scth28AYTEj3+CYKxIvYxRe34owdqX/ni9A6t7/C9sMqF/i0CyA5K/Q4Hc4OHFpZhNZQ6lfCmihOOc24h0n2MHE775fowmvfE1bFKWu/fF4YOZqDFF8pjxgnkOBOpQ3HJlq6Fk/e55mDWnRJm4M1ostrpjifyEIB5foyPGTRY3iU+tjvbiF/EsR7YhXmMYUclKZ3Xm25x+/qZtM6hKseNj1zPj8GlVrkkJy/hMYg52+AUGoBe4l5PIze+cAoulyDO6tQNgPFxSUVU0U2mZCZ3pCxZ+v8MA/y0fEjtVxJC+ncPIN5vtKE3gVj4XoaHHaEoSLm24uXsPNbG1Zvope5zSG4DMC1Z7LZHLFUuOpj47mi6AjNFPgUuh0Dqpj6PcVviVbAq4C3DObK3t7Y9CDqRVgxLcXzNDvBBIzksdWk1euf2h7FacDVPneVnrH1+u/DR4uA61hXBJumlFU72F6IpTAntgin/75RobKRdQ7jciB+k9saAJwildg6lSS9QFB3as/Qfvo4L0hE+BpPK+e38f62QmK3P8bXkkvNaf9VFB4eEeiNjAek4vqB0jn5IAV+t7/KurOAw0d/e1us5/HPUck6Yah8vd4Q/zqq5cx9OknmHPPgyTeJDNZkwX8QzVJmaK9YujknMiJSXAwJYO4TxMY+9S6xqSMnO59dprZ8FKcMJy6jGlgtuUKMPX1LUZlqAQQx3a04OOa+FXRlhNQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(64100799003)(1800799009)(82310400011)(451199024)(186009)(36840700001)(46966006)(40470700004)(40460700003)(86362001)(47076005)(44832011)(41300700001)(36756003)(5660300002)(7696005)(4326008)(7416002)(2906002)(1076003)(82740400003)(40480700001)(26005)(81166007)(356005)(336012)(426003)(36860700001)(2616005)(478600001)(8676002)(6666004)(8936002)(70206006)(70586007)(6916009)(316002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:22:43.7726 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd414f6d-2bc8-4cfb-1e81-08dbd0e98872
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher
 Braga <quic_cbraga@quicinc.com>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
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
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
---
 drivers/gpu/drm/drm_colorop.c       | 51 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h |  4 +++
 drivers/gpu/drm/drm_ioctl.c         |  5 +++
 include/uapi/drm/drm_mode.h         | 21 ++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index bc1250718baf..1afd5fbe8776 100644
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
index 8556c3b3ff88..252cd7e607e3 100644
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
index 77590b0f38fa..8a4b7d8d8a0b 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -717,6 +717,11 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
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
index 009a800676ac..5c71eb011181 100644
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

