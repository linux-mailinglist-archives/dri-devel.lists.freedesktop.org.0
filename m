Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64327F3A1C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 00:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8A610E594;
	Tue, 21 Nov 2023 23:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBA910E549;
 Tue, 21 Nov 2023 23:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEsHgGwNjc7+Cn77+CcGKKpZj3K1A2lToYThvD5VFvT0/dg6GC59y423aoQs7RmfNo5yWyyfIjnF6j5xiOY+YPF21/vhgLl8fhZ98AAnes8tUDeCO795nj5WC7cUc+HtFFNSLxCLnh6od9Gog54jUJXpnCPTddyfjgNR2ItCAIN2+1uuaVIfpQom5AKWCJk/7CvdgNrNyaE8bXCEPD+n46cfkvMkQmO4nT18zmDz+2hUjkwaI+IkjybqZpjwKHy1Xd7V0RmPjeBaZD8A6Fu19nTbdu8xMIaoURryUFqH47FOzz8B5/IUbLNOd1ymMAEXQyq85/75a6sRqOWbhYF+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqlTRFKc45BOhZh3JFrIKFUHlXLE0tJhDZFLOAKnCRY=;
 b=Avw01bUtjm2otd38LZXj81/5SQFA+yyyzmHSkvSit2IHyh318G//nlKfjqdmhThumwVPnem8rRNvCGOpOF+rxkFqmB+jC5DUvI56bEWwxCPJcA4h+r1Bf3d1BnHK9saFjC7VSGOyjE5hQXDBuiuuPqti+ua7IyHowQj90ZCffAYqOryPIr9Zqb0hyzXPF1NymYfjx/ljVc2NSe1s2uH2EvEFjkkX6nRACUhJOPlvgkwGYlDi8WPtmv8RlJkyCzKDAe7TqVkOSW+6fDb9EpczOIzOd60B+7fM8x/Jz7IgOC5/haCznPX0wSaVvYMV5gX+G0aadX2j1ta8Nh5XclET8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqlTRFKc45BOhZh3JFrIKFUHlXLE0tJhDZFLOAKnCRY=;
 b=g4M4q0tJk/mhea/mlyS+L9fLOvahePcyWXnr2TjcBQ84sY0MRbbenf3xG0Y8Y/UxZJtpMVjyc7aHqhS1f2DcIKsSTDnC84bE8SNpKFCiumltYSO77WefXbPFBILMSrLSAeL5Cvv2dkcg0ywWcKfa3cpnQTk6tCkq6OkZgKC5G4o=
Received: from CH0PR03CA0256.namprd03.prod.outlook.com (2603:10b6:610:e5::21)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 23:11:39 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::b8) by CH0PR03CA0256.outlook.office365.com
 (2603:10b6:610:e5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Tue, 21 Nov 2023 23:11:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 23:11:39 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 17:11:37 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/4] drm/prime: Helper to export dmabuf without fd
Date: Tue, 21 Nov 2023 18:11:12 -0500
Message-ID: <20231121231114.703478-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231121231114.703478-1-Felix.Kuehling@amd.com>
References: <20231121231114.703478-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb46085-7ff9-41bd-fe8a-08dbeae73784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Is9YG6aZdbHTQSZdlvFn5dMP7xOPrDrV7irXv/YwJWWYhUSPwVCArPmNTaOwz5YmkSTV3aX9yc9vXIcKTOK1WRyNyabwEpO0HvsVF1GjOJQb7GoRB8naPUUQcgZ1RUK0Q6Ntp9dJ0sgGvKOoBXC29LXFtd9QQvDx1tHyKFyKwncTXq/kvtabIJHf6l4KF3JoPuVvadG62Xnropgfr05G9Nq/e8rO1AwM27Oo1pZrkUuAewmBzkZ0uZkQhr+QVgKjo0kNDPoAXI8NXO6YCLYsxWjAWONXiWydLmkFrR9RU78P0QtLnpthoqhoqAkgmeKEMMfeRXqKU4VxVsYcChxntfr+IFOYTAuf7vggY2TpDJ7vT+PQoB/Mfx8F1heEjIWKHhul+eYuWzxBBZCXPpPLReYy+IIbq5Z+xSyD6FRV6XF2iTCM177OmpL/NgiG/8yaQgoRHGkyoUpYdiYRGQAVR+2RUJCRlsPdki7vG/1ugy9l6EQwbOzaLEbAhEHDuCRssF66qwMFHneYE4BowSUbb3Vb/tpbqHAozZo3D42r9VhwLkpIn420+gWHw/iX7NToJJA2sMfgkIeuL3aqu0m6s6LHsyOI1b8LnQv5t4WnCmPCSD+i29TMK3CwpZwELWw+ILvZD8/kDe0XKFN4JfmbhhMcQQboeASQqxpMDl4A9hMAPrJy8lxMFqhBh8R+vgO9ioSieQnOp8N2PvJhNo8ceLLipCZ7kSL4YGeHd+xqGnXrKRnB50Gur8te5N0lgpxjxN6CGPNic1/cXiz5b2YI1g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(426003)(336012)(16526019)(83380400001)(81166007)(356005)(86362001)(36756003)(82740400003)(47076005)(36860700001)(41300700001)(70586007)(110136005)(54906003)(70206006)(8676002)(4326008)(8936002)(316002)(5660300002)(2906002)(26005)(2616005)(1076003)(40480700001)(45080400002)(6666004)(478600001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 23:11:39.2083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb46085-7ff9-41bd-fe8a-08dbeae73784
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425
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
Cc: christian.koenig@amd.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change drm_gem_prime_handle_to_fd to drm_gem_prime_handle_to_dmabuf to
export a dmabuf without creating an FD as a user mode handle. This is
more useful for users in kernel mode.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/drm_prime.c | 63 ++++++++++++++++++-------------------
 include/drm/drm_prime.h     |  6 ++--
 2 files changed, 33 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 834a5e28abbe..d491b5f73eea 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -410,26 +410,25 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
 }
 
 /**
- * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
+ * drm_gem_prime_handle_to_dmabuf - PRIME export function for GEM drivers
  * @dev: dev to export the buffer from
  * @file_priv: drm file-private structure
  * @handle: buffer handle to export
  * @flags: flags like DRM_CLOEXEC
- * @prime_fd: pointer to storage for the fd id of the create dma-buf
+ * @dma_buf: pointer to storage for the dma-buf reference
  *
  * This is the PRIME export function which must be used mandatorily by GEM
  * drivers to ensure correct lifetime management of the underlying GEM object.
  * The actual exporting from GEM object to a dma-buf is done through the
  * &drm_gem_object_funcs.export callback.
  */
-int drm_gem_prime_handle_to_fd(struct drm_device *dev,
-			       struct drm_file *file_priv, uint32_t handle,
-			       uint32_t flags,
-			       int *prime_fd)
+struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
+					       struct drm_file *file_priv,
+					       uint32_t handle, uint32_t flags)
 {
 	struct drm_gem_object *obj;
 	int ret = 0;
-	struct dma_buf *dmabuf;
+	struct dma_buf *dmabuf = NULL;
 
 	mutex_lock(&file_priv->prime.lock);
 	obj = drm_gem_object_lookup(file_priv, handle);
@@ -441,7 +440,7 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 	dmabuf = drm_prime_lookup_buf_by_handle(&file_priv->prime, handle);
 	if (dmabuf) {
 		get_dma_buf(dmabuf);
-		goto out_have_handle;
+		goto out;
 	}
 
 	mutex_lock(&dev->object_name_lock);
@@ -479,40 +478,22 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 				       dmabuf, handle);
 	mutex_unlock(&dev->object_name_lock);
 	if (ret)
-		goto fail_put_dmabuf;
-
-out_have_handle:
-	ret = dma_buf_fd(dmabuf, flags);
-	/*
-	 * We must _not_ remove the buffer from the handle cache since the newly
-	 * created dma buf is already linked in the global obj->dma_buf pointer,
-	 * and that is invariant as long as a userspace gem handle exists.
-	 * Closing the handle will clean out the cache anyway, so we don't leak.
-	 */
-	if (ret < 0) {
-		goto fail_put_dmabuf;
-	} else {
-		*prime_fd = ret;
-		ret = 0;
-	}
-
-	goto out;
-
-fail_put_dmabuf:
-	dma_buf_put(dmabuf);
+		dma_buf_put(dmabuf);
 out:
 	drm_gem_object_put(obj);
 out_unlock:
 	mutex_unlock(&file_priv->prime.lock);
 
-	return ret;
+	return ret ? ERR_PTR(ret) : dmabuf;
 }
-EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
+EXPORT_SYMBOL(drm_gem_prime_handle_to_dmabuf);
 
 int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file_priv)
 {
 	struct drm_prime_handle *args = data;
+	struct dma_buf *dmabuf;
+	int ret;
 
 	/* check flags are valid */
 	if (args->flags & ~(DRM_CLOEXEC | DRM_RDWR))
@@ -523,8 +504,24 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
 						       args->handle, args->flags,
 						       &args->fd);
 	}
-	return drm_gem_prime_handle_to_fd(dev, file_priv, args->handle,
-					  args->flags, &args->fd);
+	dmabuf = drm_gem_prime_handle_to_dmabuf(dev, file_priv, args->handle,
+						args->flags);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+	ret = dma_buf_fd(dmabuf, args->flags);
+	/*
+	 * We must _not_ remove the buffer from the handle cache since the newly
+	 * created dma buf is already linked in the global obj->dma_buf pointer,
+	 * and that is invariant as long as a userspace gem handle exists.
+	 * Closing the handle will clean out the cache anyway, so we don't leak.
+	 */
+	if (ret < 0) {
+		dma_buf_put(dmabuf);
+	} else {
+		args->fd = ret;
+		ret = 0;
+	}
+	return ret;
 }
 
 /**
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 2a1d01e5b56b..89e839293d14 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -69,9 +69,9 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
 
 int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 			       struct drm_file *file_priv, int prime_fd, uint32_t *handle);
-int drm_gem_prime_handle_to_fd(struct drm_device *dev,
-			       struct drm_file *file_priv, uint32_t handle, uint32_t flags,
-			       int *prime_fd);
+struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
+					       struct drm_file *file_priv,
+					       uint32_t handle, uint32_t flags);
 
 /* helper functions for exporting */
 int drm_gem_map_attach(struct dma_buf *dma_buf,
-- 
2.34.1

