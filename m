Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0FB907929
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0415110EB32;
	Thu, 13 Jun 2024 17:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ee/87avQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337E010EB27;
 Thu, 13 Jun 2024 17:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLiOdUnQnTIfNhDostZ4bx+3IMu94SPo8wEE/mdGebxru0gA/iLdMnLvhRlSFSQlZ+K7GaEoHF+svNkdiRwy7EEs3FU92sxW79gHRY5KBgi00Cjqra4y5Df5FzG3Cz6/weOoHQnM8A9yr0rOceVZ5/tEW28C+7RsMwgDxLkiJffsQezp6S1h/mqjvHcTTnodgA9Com6+QqX+TnLFtMNZEvkxWvLeE1K9V1txyYXnblARo63uGfynFoqfnNxUbch5RJhiNH7g6YsLB8dJXH4dD870bQPL5XS0WLdVDloBmDppubj3xWNnBP823g0ItkUwaeMbpK+BcRxrtAElSVGCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUKDIIHh7zc+jLnu+bG1wf5BWverLBq5ntsDilv8nsU=;
 b=B/56bPa3furJ0LBZzHppjOB/iZWfT4XFVBygTh+11ox5ynmcMFsQJ48OQEaiRQWu9vj+w4NRZ92nh4OlzIcTXwPJv+Abva1vkw+HCOecf1JdUzl/8hPIVBQyCUrQBJ/47iqS2xZk5vuLemYcDli/NWgG6uSg2cNEnWExy28wkBu4+HsMSuDBLsAKdNSfBs6DDOZRY2zZa3I1ZPZs4srXa6zN5XHwg2+CjdtnuSDxksCG2rd1mJ0UJVigA3lgPRGBl376TyHs1m0VfHmtYXEaG5dEEskdSdRV7/9eU8B8Us8gIVP9rJtf2q7sERkl/qCEYmG07IxSvwPcgeQRwO4Orw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUKDIIHh7zc+jLnu+bG1wf5BWverLBq5ntsDilv8nsU=;
 b=Ee/87avQbtWaPe+S8RFbrTcn+0eWkvHnIFX64Z1i8ksToWaZkfGsjXWVpSUpGzafiTdXhXXuhzIrNgAynFK2hIbCtvI61TZjg0/7oPbwzUocg4PkMkxoKsXW6KVw4KzKw4V/Hv0GX2VLUMhOw+zKu5/56KrraVLiaeibWM7Ox+etARqcj8hWQ+Ep4fx4hEuTPlR1Ok0RkKhHCvhLJaOc4ko3DiMx+XSf0SzP72Jx7PEg1T3q7jXWbU6urZRCPqL2vPaQUm7t6kmN89jCex0UIfzzJdUzIrE+Hvw5Fczm9Kqkx78U9SBDFp4zaY1nUwNABsCyv1X2pJn+gWo3PmpwSQ==
Received: from BY5PR17CA0029.namprd17.prod.outlook.com (2603:10b6:a03:1b8::42)
 by SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 17:00:24 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::f4) by BY5PR17CA0029.outlook.office365.com
 (2603:10b6:a03:1b8::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:00:04 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:00:03 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 19/21] drm/nouveau: wrap pm_runtime_* calls with nouveau_runpm
Date: Fri, 14 Jun 2024 03:00:11 +1000
Message-ID: <20240613170046.88687-20-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240613170046.88687-1-bskeggs@nvidia.com>
References: <20240613170046.88687-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|SJ2PR12MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 8428ac8d-c7f1-4281-f29e-08dc8bca501e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|82310400021|36860700008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I5y+zRWiCiCNUM6lL8ctRiZb3dvbIiM/+ZoLw4Mbm0Kn2H8OGOSCibXRE+5z?=
 =?us-ascii?Q?oUm8XIevUI2XM27BrN9piJym+0KGKC4XPXelAIqcsERjYv4h33TT+k5go44Y?=
 =?us-ascii?Q?qkNc6wS3cjgjMYHwQjCO9uR0PHK1z0j2w+rbdPWgvwPwr8D2pSEds5c3vlAr?=
 =?us-ascii?Q?4krjuk5uRTMG3TXW8C6Ai+PiOxlinwybgz6AJfLuL9qtrv2iviJHWZUYxVtV?=
 =?us-ascii?Q?iEKFYn0zWSSSrZxin74CSJvndA6Dh0XoHBYPSGgALt4xXjSpbiNLrj/gk8TY?=
 =?us-ascii?Q?1ikiluLidwLr5XQ5LurXMUdhldetMonE2+yvckMfVRVcwE7UyO7HXzmjG8oo?=
 =?us-ascii?Q?WYlVXhS34AtOFCT6dOTeEx9SbP3AwjOIWoCFEmoKO4MjtZTwZfLgQZbgYevt?=
 =?us-ascii?Q?8Wsl4plQfMyHSp5ZHe+1jjGIZ3RohN/LLQOUg+guY6o1zQa02vOTMR7vAofB?=
 =?us-ascii?Q?iesNgQtRvoHVIq/UHfkdD0tzsXEJE4/CfPM9EOY8OqFV5qNNpOAB7E1L1mUa?=
 =?us-ascii?Q?qTfUClPg4DmnARA1nvuGGAEJGp6u8/ptvwwCC3SliTZpAuB5RBcBA1wB5Jr7?=
 =?us-ascii?Q?gudtthRNuuxciQa4fAakz2oENkh+BDL4SDBwK9p3aZVOyvtZK0Ba1wl+YVe3?=
 =?us-ascii?Q?ywol8TQ6D+dC/yZc9clGvlMcPrW4771oyKKfvyZUQ4djRxrAaTPP6OUm84wI?=
 =?us-ascii?Q?7NGnlKBagKrqsHVhrYqcQ4xZXPaUUfSryZrLpT4aWhvdcEZcl1nfw356nfUn?=
 =?us-ascii?Q?aEE0E6yTzoark6RYpmMy7tlq0biAXfi8bZnr+H6oxesqzYX0/SLjztP6qqui?=
 =?us-ascii?Q?b0kNrqEmCqqzj3Q/e0IpieT6nZzzSgVodLlgiWCx/vYDQwtDxVkI/1gBqsRx?=
 =?us-ascii?Q?J4kqBFWstbdMJO78cZUrivg+70RVCZrkJWPQTs31oVfWo+5waJ8RiSpi3UZY?=
 =?us-ascii?Q?F+pM5RD9n0zJFmRAW1lJzjlXB5jNPrXQw7MbbEV1mWBOcC/ZRvUuJcq5QHV9?=
 =?us-ascii?Q?JHpyqMDwL1nWM+hf1Q4MkrInnF1yGKSFjdA12ErmrmD9ve4LBAlBONlsRukh?=
 =?us-ascii?Q?sOOloa+f7BgKKrbT/NPhxnN9Tuo/DpqiSj4PqALkg1B6m/jwSqlV0/ZKb+dI?=
 =?us-ascii?Q?gqpc2FUSZzv++HMDtjsw2RYUdWuwcCvCIjqdaorg8y9ifuntK7K2lBlb67XV?=
 =?us-ascii?Q?Q/sYTC4Eu20t0dPJaOtICE/66e4SvvLOqGn1zRUE3vi89guRD5MG0Qia5EQF?=
 =?us-ascii?Q?uK0Ce6HJXDjEotem6S3DuOY8UUz/OsOGAPZN2Y++hQ1xcwgJKz0hvSpca3/S?=
 =?us-ascii?Q?XFQB/docWC8fDeYD8icYpwyl6jboFN+I5zF3R661kplFXMK0VSYee6PR/HBP?=
 =?us-ascii?Q?kU0JffxNVEwsjJaNJogKpc6Meiyd1KW0EkO7OmgnYYxRGxA9gA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(1800799019)(82310400021)(36860700008); DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:22.3471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8428ac8d-c7f1-4281-f29e-08dc8bca501e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8782
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

This wraps direct calls to pm_runtime functions to cleanup some common
usage patterns, and keep the logic in one place.

From the next commit, the pm_runtime calls will need to operate against
the DRM driver's auxiliary device instead of directly on the underlying
PCI device.  This commit will help make that switch cleaner.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 31 ++++---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 12 ++-
 drivers/gpu/drm/nouveau/nouveau_connector.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c   | 24 +++---
 drivers/gpu/drm/nouveau/nouveau_display.c   | 19 ++---
 drivers/gpu/drm/nouveau/nouveau_drm.c       | 45 ++++-------
 drivers/gpu/drm/nouveau/nouveau_gem.c       | 30 +++----
 drivers/gpu/drm/nouveau/nouveau_runpm.h     | 89 +++++++++++++++++++++
 8 files changed, 156 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_runpm.h

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 64f3a1b00173..c0fc5233ebd4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -952,17 +952,16 @@ static int
 nv50_mstc_detect(struct drm_connector *connector,
 		 struct drm_modeset_acquire_ctx *ctx, bool force)
 {
+	struct nouveau_drm *drm = nouveau_drm(connector->dev);
 	struct nv50_mstc *mstc = nv50_mstc(connector);
 	int ret;
 
 	if (drm_connector_is_unregistered(connector))
 		return connector_status_disconnected;
 
-	ret = pm_runtime_get_sync(connector->dev->dev);
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(connector->dev->dev);
+	ret = nouveau_runpm_get(drm);
+	if (ret)
 		return connector_status_disconnected;
-	}
 
 	ret = drm_dp_mst_detect_port(connector, ctx, mstc->port->mgr,
 				     mstc->port);
@@ -970,8 +969,7 @@ nv50_mstc_detect(struct drm_connector *connector,
 		goto out;
 
 out:
-	pm_runtime_mark_last_busy(connector->dev->dev);
-	pm_runtime_put_autosuspend(connector->dev->dev);
+	nouveau_runpm_put(drm);
 	return ret;
 }
 
@@ -1950,7 +1948,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 			  asyh->clr.mask, asyh->set.mask);
 
 		if (old_crtc_state->active && !new_crtc_state->active) {
-			pm_runtime_put_noidle(dev->dev);
+			nouveau_runpm_put_noidle(drm);
 			drm_crtc_vblank_off(crtc);
 		}
 
@@ -2040,7 +2038,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 		if (new_crtc_state->active) {
 			if (!old_crtc_state->active) {
 				drm_crtc_vblank_on(crtc);
-				pm_runtime_get_noresume(dev->dev);
+				nouveau_runpm_get_noresume(drm);
 			}
 			if (new_crtc_state->event)
 				drm_crtc_vblank_get(crtc);
@@ -2159,8 +2157,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 	drm_atomic_state_put(state);
 
 	/* Drop the RPM ref we got from nv50_disp_atomic_commit() */
-	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	nouveau_runpm_put(drm);
 }
 
 static void
@@ -2175,15 +2172,14 @@ static int
 nv50_disp_atomic_commit(struct drm_device *dev,
 			struct drm_atomic_state *state, bool nonblock)
 {
+	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_plane_state *new_plane_state;
 	struct drm_plane *plane;
 	int ret, i;
 
-	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(dev->dev);
+	ret = nouveau_runpm_get(drm);
+	if (ret)
 		return ret;
-	}
 
 	ret = drm_atomic_helper_setup_commit(state, nonblock);
 	if (ret)
@@ -2219,7 +2215,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 	 * Grab another RPM ref for the commit tail, which will release the
 	 * ref when it's finished
 	 */
-	pm_runtime_get_noresume(dev->dev);
+	nouveau_runpm_get_noresume(drm);
 
 	if (nonblock)
 		queue_work(system_unbound_wq, &state->commit_work);
@@ -2230,7 +2226,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 	if (ret)
 		drm_atomic_helper_unprepare_planes(dev, state);
 done:
-	pm_runtime_put_autosuspend(dev->dev);
+	nouveau_runpm_put(drm);
 	return ret;
 }
 
@@ -2439,6 +2435,7 @@ static inline void
 nv50_display_read_hw_or_state(struct drm_device *dev, struct nv50_disp *disp,
 			      struct nouveau_encoder *outp)
 {
+	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_crtc *crtc;
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *conn;
@@ -2501,7 +2498,7 @@ nv50_display_read_hw_or_state(struct drm_device *dev, struct nv50_disp *disp,
 	armh->state.connector_mask = drm_connector_mask(conn);
 	armh->state.active = true;
 	armh->state.enable = true;
-	pm_runtime_get_noresume(dev->dev);
+	nouveau_runpm_get_noresume(drm);
 
 	outp->crtc = crtc;
 	outp->ctrl = NVVAL(NV507D, SOR_SET_CONTROL, PROTOCOL, proto) | BIT(crtc->index);
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index e3071ea845e6..c5386166b15d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -26,7 +26,6 @@
 
 #include <acpi/button.h>
 
-#include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -579,11 +578,11 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	 * if possible.
 	 */
 	if (drm_kms_helper_is_poll_worker()) {
-		pm_runtime_get_noresume(dev->dev);
+		nouveau_runpm_get_noresume(drm);
 	} else {
-		ret = pm_runtime_get_sync(dev->dev);
-		if (ret < 0 && ret != -EACCES) {
-			pm_runtime_put_autosuspend(dev->dev);
+		ret = nouveau_runpm_get(drm);
+		if (ret) {
+			nouveau_runpm_put(drm);
 			nouveau_connector_set_edid(nv_connector, NULL);
 			return conn_status;
 		}
@@ -674,8 +673,7 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	if (!nv_connector->edid)
 		drm_dp_cec_unset_edid(&nv_connector->aux);
 
-	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	nouveau_runpm_put(drm);
 
 	return conn_status;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 0608cabed058..d2035855861d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -40,6 +40,7 @@
 
 #include "nouveau_crtc.h"
 #include "nouveau_encoder.h"
+#include "nouveau_runpm.h"
 
 struct nvkm_i2c_port;
 struct dcb_output;
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index aff6ee476f65..4c0e122ba724 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -31,6 +31,7 @@
 #include <linux/debugfs.h>
 #include "nouveau_debugfs.h"
 #include "nouveau_drv.h"
+#include "nouveau_runpm.h"
 
 static int
 nouveau_debugfs_vbios_image(struct seq_file *m, void *data)
@@ -51,18 +52,14 @@ nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
 	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
 	int ret;
 
-	ret = pm_runtime_get_sync(drm->dev->dev);
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(drm->dev->dev);
+	ret = nouveau_runpm_get(drm);
+	if (ret)
 		return ret;
-	}
 
 	seq_printf(m, "0x%08x\n",
 		   nvif_rd32(&drm->device, 0x101000));
 
-	pm_runtime_mark_last_busy(drm->dev->dev);
-	pm_runtime_put_autosuspend(drm->dev->dev);
-
+	nouveau_runpm_put(drm);
 	return 0;
 }
 
@@ -135,8 +132,9 @@ nouveau_debugfs_pstate_set(struct file *file, const char __user *ubuf,
 			   size_t len, loff_t *offp)
 {
 	struct seq_file *m = file->private_data;
-	struct drm_device *drm = m->private;
-	struct nouveau_debugfs *debugfs = nouveau_debugfs(drm);
+	struct drm_device *dev = m->private;
+	struct nouveau_debugfs *debugfs = nouveau_debugfs(dev);
+	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvif_control_pstate_user args = { .pwrsrc = -EINVAL };
 	char buf[32] = {}, *tmp, *cur = buf;
 	long value, ret;
@@ -174,14 +172,12 @@ nouveau_debugfs_pstate_set(struct file *file, const char __user *ubuf,
 		args.ustate = value;
 	}
 
-	ret = pm_runtime_get_sync(drm->dev);
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(drm->dev);
+	ret = nouveau_runpm_get(drm);
+	if (ret)
 		return ret;
-	}
 
 	ret = debugfs->impl->pstate.user(debugfs->priv, &args);
-	pm_runtime_put_autosuspend(drm->dev);
+	nouveau_runpm_put(drm);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index e892f5f5ea16..57d31a17ad68 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -466,7 +466,7 @@ nouveau_display_hpd_work(struct work_struct *work)
 	int changed = 0;
 	struct drm_connector *first_changed_connector = NULL;
 
-	pm_runtime_get_sync(dev->dev);
+	nouveau_runpm_try_get(drm);
 
 	spin_lock_irq(&drm->hpd_lock);
 	pending = drm->hpd_pending;
@@ -474,8 +474,10 @@ nouveau_display_hpd_work(struct work_struct *work)
 	spin_unlock_irq(&drm->hpd_lock);
 
 	/* Nothing to do, exit early without updating the last busy counter */
-	if (!pending)
-		goto noop;
+	if (!pending) {
+		nouveau_runpm_put_noop(drm);
+		return;
+	}
 
 	mutex_lock(&dev->mode_config.mutex);
 	drm_connector_list_iter_begin(dev, &conn_iter);
@@ -532,9 +534,7 @@ nouveau_display_hpd_work(struct work_struct *work)
 	if (first_changed_connector)
 		drm_connector_put(first_changed_connector);
 
-	pm_runtime_mark_last_busy(drm->dev->dev);
-noop:
-	pm_runtime_put_autosuspend(dev->dev);
+	nouveau_runpm_put(drm);
 }
 
 #ifdef CONFIG_ACPI
@@ -545,24 +545,25 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 {
 	struct nouveau_drm *drm = container_of(nb, typeof(*drm), acpi_nb);
 	struct acpi_bus_event *info = data;
+	struct device *dev = drm->dev->dev;
 	int ret;
 
 	if (!strcmp(info->device_class, ACPI_VIDEO_CLASS)) {
 		if (info->type == ACPI_VIDEO_NOTIFY_PROBE) {
-			ret = pm_runtime_get(drm->dev->dev);
+			ret = pm_runtime_get(dev);
 			if (ret == 1 || ret == -EACCES) {
 				/* If the GPU is already awake, or in a state
 				 * where we can't wake it up, it can handle
 				 * it's own hotplug events.
 				 */
-				pm_runtime_put_autosuspend(drm->dev->dev);
+				pm_runtime_put_autosuspend(dev);
 			} else if (ret == 0 || ret == -EINPROGRESS) {
 				/* We've started resuming the GPU already, so
 				 * it will handle scheduling a full reprobe
 				 * itself
 				 */
 				NV_DEBUG(drm, "ACPI requested connector reprobe\n");
-				pm_runtime_put_noidle(drm->dev->dev);
+				pm_runtime_put_noidle(dev);
 			} else {
 				NV_WARN(drm, "Dropped ACPI reprobe event due to RPM error: %d\n",
 					ret);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index aa54aee23814..2a9faf0fc277 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -25,7 +25,6 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/mmu_notifier.h>
 #include <linux/dynamic_debug.h>
@@ -72,6 +71,7 @@
 #include "nouveau_exec.h"
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
+#include "nouveau_runpm.h"
 
 DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
 			"DRM_UT_CORE",
@@ -486,10 +486,8 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
 	struct drm_device *dev = drm->dev;
 	struct nouveau_cli *cli, *temp_cli;
 
-	if (nouveau_pmops_runtime(dev->dev)) {
-		pm_runtime_get_sync(dev->dev);
-		pm_runtime_forbid(dev->dev);
-	}
+	if (nouveau_pmops_runtime(dev->dev))
+		nouveau_runpm_disable(drm);
 
 	nouveau_led_fini(dev);
 	nouveau_dmem_fini(drm);
@@ -581,14 +579,8 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	nouveau_dmem_init(drm);
 	nouveau_led_init(dev);
 
-	if (nouveau_pmops_runtime(dev->dev)) {
-		pm_runtime_use_autosuspend(dev->dev);
-		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
-		pm_runtime_set_active(dev->dev);
-		pm_runtime_allow(dev->dev);
-		pm_runtime_mark_last_busy(dev->dev);
-		pm_runtime_put(dev->dev);
-	}
+	if (nouveau_pmops_runtime(dev->dev))
+		nouveau_runpm_enable(drm);
 
 	ret = drm_dev_register(drm->dev, 0);
 	if (ret) {
@@ -1025,11 +1017,9 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 	int ret;
 
 	/* need to bring up power immediately if opening device */
-	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(dev->dev);
+	ret = nouveau_runpm_get(drm);
+	if (ret)
 		return ret;
-	}
 
 	get_task_comm(tmpname, current);
 	rcu_read_lock();
@@ -1058,8 +1048,7 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 		kfree(cli);
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	nouveau_runpm_put(drm);
 	return ret;
 }
 
@@ -1079,7 +1068,7 @@ nouveau_drm_postclose(struct drm_device *dev, struct drm_file *fpriv)
 	if (!drm_dev_enter(dev, &dev_index))
 		return;
 
-	pm_runtime_get_sync(dev->dev);
+	nouveau_runpm_try_get(drm);
 
 	mutex_lock(&cli->mutex);
 	if (cli->abi16)
@@ -1092,8 +1081,9 @@ nouveau_drm_postclose(struct drm_device *dev, struct drm_file *fpriv)
 
 	nouveau_cli_fini(cli);
 	kfree(cli);
-	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+
+	nouveau_runpm_put(drm);
+
 	drm_dev_exit(dev_index);
 }
 
@@ -1122,14 +1112,12 @@ long
 nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct drm_file *filp = file->private_data;
-	struct drm_device *dev = filp->minor->dev;
+	struct nouveau_drm *drm = nouveau_drm(filp->minor->dev);
 	long ret;
 
-	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(dev->dev);
+	ret = nouveau_runpm_get(drm);
+	if (ret)
 		return ret;
-	}
 
 	switch (_IOC_NR(cmd) - DRM_COMMAND_BASE) {
 	case DRM_NOUVEAU_NVIF:
@@ -1140,8 +1128,7 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		break;
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	nouveau_runpm_put(drm);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index ede2bf30ebc2..e650cb52e267 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -30,6 +30,7 @@
 #include "nouveau_dma.h"
 #include "nouveau_fence.h"
 #include "nouveau_abi16.h"
+#include "nouveau_runpm.h"
 
 #include "nouveau_ttm.h"
 #include "nouveau_gem.h"
@@ -78,22 +79,18 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	struct device *dev = drm->dev->dev;
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
-	if (WARN_ON(ret < 0 && ret != -EACCES)) {
-		pm_runtime_put_autosuspend(dev);
+	ret = nouveau_runpm_get(drm);
+	if (WARN_ON(ret))
 		return;
-	}
 
 	if (gem->import_attach)
 		drm_prime_gem_destroy(gem, nvbo->bo.sg);
 
 	ttm_bo_put(&nvbo->bo);
 
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	nouveau_runpm_put(drm);
 }
 
 int
@@ -102,7 +99,6 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	struct device *dev = drm->dev->dev;
 	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
 	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
 	struct nouveau_vma *vma;
@@ -119,19 +115,17 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(dev);
+	ret = nouveau_runpm_get(drm);
+	if (ret)
 		goto out;
-	}
 
 	/* only create a VMA on binding */
 	if (!nouveau_cli_uvmm(cli))
 		ret = nouveau_vma_new(nvbo, vmm, &vma);
 	else
 		ret = 0;
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+
+	nouveau_runpm_put(drm);
 out:
 	ttm_bo_unreserve(&nvbo->bo);
 	return ret;
@@ -188,7 +182,6 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	struct device *dev = drm->dev->dev;
 	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
 	struct nouveau_vma *vma;
 	int ret;
@@ -206,12 +199,11 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	vma = nouveau_vma_find(nvbo, vmm);
 	if (vma) {
 		if (--vma->refs == 0) {
-			ret = pm_runtime_get_sync(dev);
-			if (!WARN_ON(ret < 0 && ret != -EACCES)) {
+			ret = nouveau_runpm_get(drm);
+			if (!WARN_ON(ret)) {
 				nouveau_gem_object_unmap(nvbo, vma);
-				pm_runtime_mark_last_busy(dev);
+				nouveau_runpm_put(drm);
 			}
-			pm_runtime_put_autosuspend(dev);
 		}
 	}
 	ttm_bo_unreserve(&nvbo->bo);
diff --git a/drivers/gpu/drm/nouveau/nouveau_runpm.h b/drivers/gpu/drm/nouveau/nouveau_runpm.h
new file mode 100644
index 000000000000..92d6c518bdad
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_runpm.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NOUVEAU_RUNPM_H__
+#define __NOUVEAU_RUNPM_H__
+#include <linux/pm_runtime.h>
+
+static inline struct device *
+nouveau_runpm_dev(struct nouveau_drm *drm)
+{
+	return drm->dev->dev;
+}
+
+static inline void
+nouveau_runpm_put_noidle(struct nouveau_drm *drm)
+{
+	struct device *dev = nouveau_runpm_dev(drm);
+
+	pm_runtime_put_noidle(dev);
+}
+
+static inline void
+nouveau_runpm_put_noop(struct nouveau_drm *drm)
+{
+	struct device *dev = nouveau_runpm_dev(drm);
+
+	pm_runtime_put_autosuspend(dev);
+}
+
+static inline void
+nouveau_runpm_put(struct nouveau_drm *drm)
+{
+	struct device *dev = nouveau_runpm_dev(drm);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+}
+
+static inline int
+nouveau_runpm_try_get(struct nouveau_drm *drm)
+{
+	struct device *dev = nouveau_runpm_dev(drm);
+
+	return pm_runtime_get_sync(dev);
+}
+
+static inline __must_check int
+nouveau_runpm_get(struct nouveau_drm *drm)
+{
+	struct device *dev = nouveau_runpm_dev(drm);
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_autosuspend(dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static inline void
+nouveau_runpm_get_noresume(struct nouveau_drm *drm)
+{
+	struct device *dev = nouveau_runpm_dev(drm);
+
+	pm_runtime_get_noresume(dev);
+}
+
+static inline void
+nouveau_runpm_disable(struct nouveau_drm *drm)
+{
+	struct device *dev = nouveau_runpm_dev(drm);
+
+	pm_runtime_get_sync(dev);
+	pm_runtime_forbid(dev);
+}
+
+static inline void
+nouveau_runpm_enable(struct nouveau_drm *drm)
+{
+	struct device *dev = nouveau_runpm_dev(drm);
+
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 5000);
+	pm_runtime_set_active(dev);
+	pm_runtime_allow(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put(dev);
+}
+#endif
-- 
2.44.0

