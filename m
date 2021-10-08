Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C4426686
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 11:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466036E870;
	Fri,  8 Oct 2021 09:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E286E86C;
 Fri,  8 Oct 2021 09:17:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU0hQ5ikC4K9A8OPy1W/9SNkySK+PGasVsS1vweD3Wp9IVBKEPgMGfc7vUEYUhTPeY8+Ln9tbD19B5GI3ePktk1O8M4VKW4E5a8XJXtGKMvkFPKhTg7rJ3ev8Xu2F93t4LSCENvS8BKroYKo+2iQnZb3DnwrmVlCmdHjKO5EQu2EfW475nIYmZHbAjdzVaXzf7n91NiC2YauPfE/4wdrmp5CjU2K5Zq++gwn2s05NXvwD3AinVYMW8meebk2veSnUBZBHQNV0GPEZIelTz1E7Q3EtQXX7QKOQP9yR04zGKZJCM76L1Y1MYmMwZGvnWJ4LdxSrXxxM1UlrcLDe32CAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u06rmKXrZin+JAh2cAfs6lh4BIK6+k5nBomjiPUfDEk=;
 b=bxGczdEKaOV7Vxda5AlWb1HoMOSUJltQtgDddhRnuaf6yUhrhYIWo8VLarsbjZO6ZuhK2ys0lSJ1OsSjaU0zZh+tX+B9HMP9ZSVCWj5Rkls3NimBgGBqLASz3hlSH0FLHP62KwjRebcULHy1pmeEofGOmStbUocRH5d98uXvDpjOV9SrRrdOSnrGWANVpeVen8cAuqGLMh83WDKye3rrGakGOv4O6wCWWA2Ve9HT00hT7TmRPlDhGSFKFsBUw7ZAEtXNeES32BTyZnadUMZGtEjpF5cHSWAApXwY4XeNrKBvKcGLQc2aRNBVkIBhs+5R/bnuixHO5by0PGyoyRXznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u06rmKXrZin+JAh2cAfs6lh4BIK6+k5nBomjiPUfDEk=;
 b=OKqaGSyDYJxzJ7B14CcaL8N6aIyCpenTxQHPs8tIv91M45ZjEaafVMQUdVItdPKxuRk79HUmjKty6Bq1CD5yriTOPMrIIlhpY4U9Hr7q2g5c3xtkfKgUBawtTzssouToAnYv9+WHAKdmP2WpGShDBWx/W775wN3qsAFUaiXOPx0=
Received: from DM5PR17CA0067.namprd17.prod.outlook.com (2603:10b6:3:13f::29)
 by CY4PR12MB1448.namprd12.prod.outlook.com (2603:10b6:910:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 09:17:21 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::5d) by DM5PR17CA0067.outlook.office365.com
 (2603:10b6:3:13f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend
 Transport; Fri, 8 Oct 2021 09:17:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 09:17:20 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 8 Oct 2021
 04:17:18 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/5] dri: cleanup debugfs error handling
Date: Fri, 8 Oct 2021 11:17:00 +0200
Message-ID: <20211008091704.27094-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 519ceada-296c-4f90-efe9-08d98a3c6e70
X-MS-TrafficTypeDiagnostic: CY4PR12MB1448:
X-Microsoft-Antispam-PRVS: <CY4PR12MB144896A9E05C122664C880CB8BB29@CY4PR12MB1448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CxpKOnyzv24j+6yoURAM1qMmntunUAntYgWwKWHQvu2jKuPS/OXjtV1ub6umBnm3AQPaIus91VIMUpSnNMvJ7XBrh2ZvZNXPwtHeXK5aGQhCt2RsEc4K39HtgXB51LMfbvBiRW09YI6fTPvwaWR3pzIw61d24vd7WQ9FBsZOMJLj4QhZ8CHnpXfhx3NDL7NG12pTQbAr3LX9KYjcaK0PYjwDlJb7PkAAh2fKXBjnUQ8FJwndkauP5ceNdhkvrELSnHgCVPgCrVIfgl0K4DfkR9GyTda2/rCZ/Z2omNsX0NZK/LqDPwnO10QHBVUPCd/5DVEtyhTn3D78tMRBnDTEH0AK8We/htk73qQC1X5rwSzkwX7Nb6vgx+NV+Hc3AfZxLnrsEVKtxtCakx0OIMht6zNsW52pXWMgnywQqQJ1VRlZmuKWiztW6fa4ps/0fBg4m+QSgUMYFU14gVZ194pTkUTD5Y1XULGrUNjTs0mGUm3DBUv+Do3AyyTA8n+GdolW11iVD6aimHshiVB0wD1MtiQPZChZf2yIATP2D86QjWaEcrAY11Ovm+Dc1wSbmwJO0coMvQpWi15W488g0/rcIACkNSVYi2dYkCI4D9m5TQ98oXYo9yTAf6cDwuE5QjbdEe9YbWLJS/inbWVPKYhXUpzGaGcnr9SO7etHXyRYkl3qfDJ9lwIF6xdwDbqwFV06uAwqXXb3i2gHGYD4vvgq/FKpMZagHYMilxZpRtJwzFQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(44832011)(2906002)(5660300002)(70206006)(83380400001)(70586007)(4326008)(7696005)(336012)(6666004)(426003)(2616005)(86362001)(82310400003)(8676002)(16526019)(508600001)(186003)(6916009)(26005)(36756003)(54906003)(356005)(81166007)(1076003)(47076005)(316002)(8936002)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 09:17:20.4392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 519ceada-296c-4f90-efe9-08d98a3c6e70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1448
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

Debugfs API returns encoded error instead of NULL.
This patch cleanups drm debugfs error handling to
properly set dri and its minor's root dentry to NULL.

Also do not error out if dri/minor debugfs directory
creation fails as a debugfs error is not a fatal error.

CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@linux.ie>
CC: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c  | 25 +++++++++++++++++++++++--
 drivers/gpu/drm/drm_drv.c      | 16 ++++++++++------
 drivers/gpu/drm/drm_internal.h |  7 +++----
 3 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index b0a826489488..af275a0c09b4 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -180,6 +180,9 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 	struct drm_info_node *tmp;
 	int i;

+	if (!minor->debugfs_root)
+		return;
+
 	for (i = 0; i < count; i++) {
 		u32 features = files[i].driver_features;

@@ -203,7 +206,7 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
 }
 EXPORT_SYMBOL(drm_debugfs_create_files);

-int drm_debugfs_init(struct drm_minor *minor, int minor_id,
+void drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root)
 {
 	struct drm_device *dev = minor->dev;
@@ -212,8 +215,16 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	INIT_LIST_HEAD(&minor->debugfs_list);
 	mutex_init(&minor->debugfs_lock);
 	sprintf(name, "%d", minor_id);
+
+	if (!root)
+		goto error;
+
 	minor->debugfs_root = debugfs_create_dir(name, root);

+	if (IS_ERR(minor->debugfs_root))
+		goto error;
+
+
 	drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
 				 minor->debugfs_root, minor);

@@ -230,7 +241,11 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	if (dev->driver->debugfs_init)
 		dev->driver->debugfs_init(minor);

-	return 0;
+	return;
+
+error:
+	minor->debugfs_root = NULL;
+	return;
 }


@@ -241,6 +256,9 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
 	struct drm_info_node *tmp;
 	int i;

+	if (!minor->debugfs_root)
+		return 0;
+
 	mutex_lock(&minor->debugfs_lock);
 	for (i = 0; i < count; i++) {
 		list_for_each_safe(pos, q, &minor->debugfs_list) {
@@ -261,6 +279,9 @@ static void drm_debugfs_remove_all_files(struct drm_minor *minor)
 {
 	struct drm_info_node *node, *tmp;

+	if (!minor->debugfs_root)
+		return;
+
 	mutex_lock(&minor->debugfs_lock);
 	list_for_each_entry_safe(node, tmp, &minor->debugfs_list, list) {
 		debugfs_remove(node->dent);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7a5097467ba5..fa57ec2d49bf 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -160,11 +160,7 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 	if (!minor)
 		return 0;

-	ret = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
-	if (ret) {
-		DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
-		goto err_debugfs;
-	}
+	drm_debugfs_init(minor, minor->index, drm_debugfs_root);

 	ret = device_add(minor->kdev);
 	if (ret)
@@ -1050,7 +1046,15 @@ static int __init drm_core_init(void)
 		goto error;
 	}

-	drm_debugfs_root = debugfs_create_dir("dri", NULL);
+	if (!debugfs_initialized()) {
+		drm_debugfs_root = NULL;
+	} else {
+		drm_debugfs_root = debugfs_create_dir("dri", NULL);
+		if (IS_ERR(drm_debugfs_root)) {
+			DRM_WARN("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
+			drm_debugfs_root = NULL;
+		}
+	}

 	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 17f3548c8ed2..e27a40166178 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -182,8 +182,8 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,

 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
-int drm_debugfs_init(struct drm_minor *minor, int minor_id,
-		     struct dentry *root);
+void drm_debugfs_init(struct drm_minor *minor, int minor_id,
+		      struct dentry *root);
 void drm_debugfs_cleanup(struct drm_minor *minor);
 void drm_debugfs_connector_add(struct drm_connector *connector);
 void drm_debugfs_connector_remove(struct drm_connector *connector);
@@ -191,10 +191,9 @@ void drm_debugfs_crtc_add(struct drm_crtc *crtc);
 void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
 void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
 #else
-static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
+static inline void drm_debugfs_init(struct drm_minor *minor, int minor_id,
 				   struct dentry *root)
 {
-	return 0;
 }

 static inline void drm_debugfs_cleanup(struct drm_minor *minor)
--
2.32.0

