Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A793EC9061A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 00:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6019D10E87E;
	Thu, 27 Nov 2025 23:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lrroeNFT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010044.outbound.protection.outlook.com
 [40.93.198.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0AF10E877;
 Thu, 27 Nov 2025 23:58:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MO4qniDYIgCREtPH9XPf8fhw6r9BXPZnWQYfRGI3H45I87nSmbnq3EZ2zruMJu1fQ3LaEQ5iDWIYA+kO2cgMERJK4UfDVJRTQjvoHk5tgXQHi3BPSKhxNouA0QSBUafjwZgQbAQmS89UosrPZMVl23wDfagImNjT7d2EiUTQOOh5fJiaRhCwUMdpoGIBzhsAmWSF3yV2rvuGIr4FYYFnJ8lP/mORc944spqRsYZqm5945TnKvprRojcVnZSWHnKR3JbxLj4CcTGU9LnJKvwUz32hJQMbgeuTBvtowY/us3Wu4s2XZXewlpwaZ2ZaMJn25mB5dTXEGXjsSIgW0UCOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoDT34ftPQAeSWx56k0XE0bVgMRF8ugW9TZTNV5ywIg=;
 b=faU9oqkDlCJ6H+nzIron1GCoerER4mv6Juum8lYwLwwTcN4krVoLZULzdmqH3NfdUkCwPQk3cRHix0pbt/K3zwaFS1KL+aTaksvr7Dn7MeylsB5r3ZadBnSHA9TU02QA10kX7Ggmt8k6JLxzDn2FmRuW+ItInLKlcxI5g9216r6EJB5nIU2qZrjizYRGqE4TEw9FbSrfVA3sNLFtOJo+9tskFX2dpnNyocuXJDENHNhFTklwP65NGLKgvP3ySk3R1/RSp8DE2mSwkC0aMiV3scvrSQZnd+mUWfErlguZgbGdP8gWaqF1s+Ll8fl9kez4sgVhdipTyQVd3i/Ha589Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoDT34ftPQAeSWx56k0XE0bVgMRF8ugW9TZTNV5ywIg=;
 b=lrroeNFTw5muG3T2X3LTYXh25NCNC3LOmpW9YUP3pU9RWYHG1Y6S0vSkfLVZI8709enEt37+LAHnNSeDngNhuIMTffNUouw092Bn2/ACfhQ7BHq3sqtbXMwJ9o0il2mJrrH8c1Kc592ezoIPrm1cVmfC4cIpDBOadfS7KZPFT6E=
Received: from BYAPR08CA0013.namprd08.prod.outlook.com (2603:10b6:a03:100::26)
 by CY8PR12MB8244.namprd12.prod.outlook.com (2603:10b6:930:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 23:58:21 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:100:cafe::93) by BYAPR08CA0013.outlook.office365.com
 (2603:10b6:a03:100::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Thu,
 27 Nov 2025 23:58:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 23:58:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 27 Nov
 2025 17:58:19 -0600
Received: from thonkpad (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Thu, 27 Nov 2025 15:58:19 -0800
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 1/2] drm: Introduce drm_crtc_vblank_prepare()
Date: Thu, 27 Nov 2025 18:57:59 -0500
Message-ID: <20251127235800.831297-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|CY8PR12MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 5088a0a0-fd49-4527-bcd8-08de2e10d7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7AQ/YDN3HpWTDre17qRVV1l+6Y4aojeuSqvPeqzHqUDa2DKUwU8/mh+Ppj60?=
 =?us-ascii?Q?2ykKVwA5/D2lYs2MbcXkIWJ4HYDhNikgoCmqo2L3aaImZytZ0cHXmpI/VkfX?=
 =?us-ascii?Q?TXoQyCVXf36Xyxxgv4jURA1gDUkvMb4T6gFXglgRxw/F4C3+r/GGBCB3rGzq?=
 =?us-ascii?Q?KsX9spmK1VpEHZgAsJwSxovUb/ADt7135ww0UFfs/PaegpqhmYU0qxOa2GI3?=
 =?us-ascii?Q?z2sK8HFMPOr+uLHgkwxGRLgNgUUeiDZAPGEV7Br+RA+ppJ58cq3Mw3gRMYSd?=
 =?us-ascii?Q?MIC5RgNpp4uArJ/b9CLUypNT7MMkLWRKV95K+kRydYvqSCwJfdMcsWr04bAK?=
 =?us-ascii?Q?9PEVBP+oLsLfjN6FPT7CH4XgCSzQyDvfBeDIePySqIkSeeUYQ256QVqzRKmv?=
 =?us-ascii?Q?nNO/9jCKzfkHlGmBYVbXMama+G2D6ZCvulpy6Gg9YBXuPG/DExyxdZWMJ5bN?=
 =?us-ascii?Q?ZAadOQblamzDPk8htUkjoN29uJkVdsAfLTCSqbVZ8jSG4JWwNIPyFaxaRzAN?=
 =?us-ascii?Q?Olsj+m2CvrXYaAC3jDaHL3RHjqDAE9oG+26nFxApwtg6tpr3mB7diLKq/j73?=
 =?us-ascii?Q?PTyuPIJm9DekwaV3Dy8jCbRD8ujHufcCoOWLrYGQUYf6q6XNKPJzWegROiwB?=
 =?us-ascii?Q?xkW+cUOswDdIWHqrCB/crnAqY/wuCx0YsWVxEBBPhMizqXmqqwRtKxLgqxrZ?=
 =?us-ascii?Q?vhRVSmU6PWWrcOjF2ymIiADCEX+VT70q0i9EPnKxECjiR/g4LdmB+t66egMt?=
 =?us-ascii?Q?yj+YXsKh7dZ+n5Ipl10BkyqzA0msGr/9ZLvLmqr6Vevg2j9bArhOONGjNDiu?=
 =?us-ascii?Q?yCnGQ9ewu7610gtxQ1r8oM3FKl8eRPm1juO1lPych8A8IRle3FZp8+qeD/DK?=
 =?us-ascii?Q?TSy7UVBm4OYPocYxcbkEi2198GLks2/b9VffkMKEw94Diu5a8wkhsjgM299/?=
 =?us-ascii?Q?7K9SfQf5WieDl0/MmpQHuTANgEGU+0iezPvVgp5QloI+z8qW/C1jUwOuWScm?=
 =?us-ascii?Q?DTPO6VuEagCIrJPDk8Jo0pl2kFqvbSSFoKAGhPLMwBJc6cYAB/S8uAJyrY7s?=
 =?us-ascii?Q?G1GzqeTOCY80eG4wkLu8yJ57G3teI0ABZR+mgsEVRLX5mcCUhxG1CeQiD7n2?=
 =?us-ascii?Q?G0nbRrh5T1P8PwhGEpZQ4qjSAa3It745HBM+Up/OV43MuzXZ9r/uJZPTo0ph?=
 =?us-ascii?Q?NsQu/5jUnYjADzN4QiFfNeppJuDwdLPgP3LtYD4RK57DM6QSu+VQo9sPQrKM?=
 =?us-ascii?Q?mfLDe8Cf+3VDPnxibdRNVXQpBSvADxbQ4qiTFjqtrasWtPW5OrFYxfftjsyS?=
 =?us-ascii?Q?Fw3vEe20qHmNb0MZZSgojCyBfPz/stFLvN+9819gNGomam9IlQjQamxA5Bfm?=
 =?us-ascii?Q?JFUGILWDzfTPfi1x4a44yloMWlIln7EILqDB5/iNWpSRBxYiRgy/MNF1fLHA?=
 =?us-ascii?Q?sGXV3urXghPnVN3f9sv3qhf4bRPA5MX5esHAMI7tzLVSep8x7BNt7MCDSobm?=
 =?us-ascii?Q?9jGPEtgoPTSM0/+vojD3AOLDxYzJHaG+3+00C7sLI0lGj+R+5AZ5kwlUjRGp?=
 =?us-ascii?Q?4AZrnPLKK73wLCwbOQE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 23:58:20.5155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5088a0a0-fd49-4527-bcd8-08de2e10d7b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8244
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

From: Leo Li <sunpeng.li@amd.com>

Some drivers need to perform blocking operations prior to enabling
vblank interrupts. A display hardware spin-up from a low-power state
that requires synchronization with the rest of the driver via a mutex,
for example.

To support this, introduce a new drm_crtc_vblank_prepare() helper that
calls back into the driver -- if implemented -- for the driver to do
such preparation work.

In DRM core, call this helper before drm_vblank_get(). Drivers can
choose to call this if they implement the callback in the future.

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 drivers/gpu/drm/drm_atomic_helper.c |  8 ++++
 drivers/gpu/drm/drm_fb_helper.c     |  4 ++
 drivers/gpu/drm/drm_plane.c         |  4 ++
 drivers/gpu/drm/drm_vblank.c        | 69 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_vblank_work.c   |  8 ++++
 include/drm/drm_crtc.h              | 27 +++++++++++
 include/drm/drm_vblank.h            |  1 +
 7 files changed, 121 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ef56b474acf59..e52dd41f83117 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1264,6 +1264,10 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
 		if (!drm_dev_has_vblank(dev))
 			continue;
 
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret)
+			continue;
+
 		ret = drm_crtc_vblank_get(crtc);
 		/*
 		 * Self-refresh is not a true "disable"; ensure vblank remains
@@ -1815,6 +1819,10 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 		if (!new_crtc_state->active)
 			continue;
 
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret != 0)
+			continue;
+
 		ret = drm_crtc_vblank_get(crtc);
 		if (ret != 0)
 			continue;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 11a5b60cb9ce4..7400942fd7d1d 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1103,6 +1103,10 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 		 * enabled, otherwise just don't do anythintg,
 		 * not even report an error.
 		 */
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret)
+			break;
+
 		ret = drm_crtc_vblank_get(crtc);
 		if (!ret) {
 			drm_crtc_wait_one_vblank(crtc);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 38f82391bfda5..f2e40eaa385e6 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1421,6 +1421,10 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 		u32 current_vblank;
 		int r;
 
+		r = drm_crtc_vblank_prepare(crtc);
+		if (r)
+			return r;
+
 		r = drm_crtc_vblank_get(crtc);
 		if (r)
 			return r;
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 46f59883183d9..4dac3228c021f 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1194,6 +1194,30 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 	return ret;
 }
 
+/**
+ * drm_crtc_vblank_prepare - prepare to enable vblank interrupts
+ *
+ * @crtc: which CRTC to prepare
+ *
+ * Some drivers may need to run blocking operations to prepare for enabling
+ * vblank interrupts. This function calls the prepare_enable_vblank callback, if
+ * available, to allow drivers to do that.
+ *
+ * The spin-up may call blocking functions, such as mutex_lock(). Therefore,
+ * this must be called from process context, where sleeping is allowed.
+ *
+ * Also see &drm_crtc_funcs.prepare_enable_vblank.
+ *
+ * Returns: Zero on success or a negative error code on failure.
+ */
+int drm_crtc_vblank_prepare(struct drm_crtc *crtc)
+{
+	if (crtc->funcs->prepare_enable_vblank)
+		return crtc->funcs->prepare_enable_vblank(crtc);
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_vblank_prepare);
+
 int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
@@ -1288,12 +1312,22 @@ EXPORT_SYMBOL(drm_crtc_vblank_put);
 void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
 	int ret;
 	u64 last;
 
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
+	crtc = drm_crtc_from_index(dev, pipe);
+	if (crtc) {
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (drm_WARN(dev, ret,
+			     "prepare vblank failed on crtc %i, ret=%i\n",
+			     pipe, ret))
+			return;
+	}
+
 	ret = drm_vblank_get(dev, pipe);
 	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
 		     pipe, ret))
@@ -1485,10 +1519,18 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+	int ret;
 
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
+	if (crtc) {
+		ret = drm_crtc_vblank_prepare(crtc);
+		drm_WARN_ON(dev, ret);
+		if (ret)
+			return;
+	}
+
 	spin_lock_irq(&dev->vbl_lock);
 	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
 		    pipe, vblank->enabled, vblank->inmodeset);
@@ -1796,6 +1838,17 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 		return 0;
 	}
 
+	crtc = drm_crtc_from_index(dev, vblank->pipe);
+	if (crtc) {
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret) {
+			drm_dbg_core(dev,
+				     "prepare vblank failed on crtc %i, ret=%i\n",
+				     pipe, ret);
+			return ret;
+		}
+	}
+
 	ret = drm_vblank_get(dev, pipe);
 	if (ret) {
 		drm_dbg_core(dev,
@@ -2031,6 +2084,14 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 		READ_ONCE(vblank->enabled);
 
 	if (!vblank_enabled) {
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret) {
+			drm_dbg_core(dev,
+				     "prepare vblank failed on crtc %i, ret=%i\n",
+				     pipe, ret);
+			return ret;
+		}
+
 		ret = drm_crtc_vblank_get(crtc);
 		if (ret) {
 			drm_dbg_core(dev,
@@ -2098,6 +2159,14 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 	if (e == NULL)
 		return -ENOMEM;
 
+	ret = drm_crtc_vblank_prepare(crtc);
+	if (ret) {
+		drm_dbg_core(dev,
+			     "prepare vblank failed on crtc %i, ret=%i\n",
+			     pipe, ret);
+		return ret;
+	}
+
 	ret = drm_crtc_vblank_get(crtc);
 	if (ret) {
 		drm_dbg_core(dev,
diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index e4e1873f0e1e1..582ee7fd94adf 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -113,11 +113,19 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
 {
 	struct drm_vblank_crtc *vblank = work->vblank;
 	struct drm_device *dev = vblank->dev;
+	struct drm_crtc *crtc;
 	u64 cur_vbl;
 	unsigned long irqflags;
 	bool passed, inmodeset, rescheduling = false, wake = false;
 	int ret = 0;
 
+	crtc = drm_crtc_from_index(dev, vblank->pipe);
+	if (crtc) {
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret)
+			return ret;
+	}
+
 	spin_lock_irqsave(&dev->event_lock, irqflags);
 	if (work->cancelling)
 		goto out;
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index caa56e039da2a..456cf9ba0143a 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -860,6 +860,33 @@ struct drm_crtc_funcs {
 	 */
 	u32 (*get_vblank_counter)(struct drm_crtc *crtc);
 
+	/**
+	 * @prepare_enable_vblank:
+	 *
+	 * An optional callback for preparing to enable vblank interrupts. It
+	 * allows drivers to perform blocking operations, and thus is called
+	 * without any vblank spinlocks. Consequently, this callback is not
+	 * synchronized with the rest of drm_vblank management; drivers are
+	 * responsible for ensuring it won't race with drm_vblank and it's other
+	 * driver callbacks.
+	 *
+	 * For example, drivers may use this to spin-up hardware from a low
+	 * power state -- which may require blocking operations -- such that
+	 * hardware registers are available to read/write. However, the driver
+	 * must be careful as to when to reenter low-power state, such that it
+	 * won't race with enable_vblank.
+	 *
+	 * It is called unconditionally, regardless of whether vblank interrupts
+	 * are already enabled or not.
+	 *
+	 * This callback is optional. If not set, no preparation is performed.
+	 *
+	 * Returns:
+	 *
+	 * Zero on success, negative errno on failure.
+	 */
+	int (*prepare_enable_vblank)(struct drm_crtc *crtc);
+
 	/**
 	 * @enable_vblank:
 	 *
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 151ab1e85b1b7..5abc367aa4376 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -272,6 +272,7 @@ void drm_vblank_set_event(struct drm_pending_vblank_event *e,
 			  ktime_t *now);
 bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
 bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
+int drm_crtc_vblank_prepare(struct drm_crtc *crtc);
 int drm_crtc_vblank_get(struct drm_crtc *crtc);
 void drm_crtc_vblank_put(struct drm_crtc *crtc);
 void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe);
-- 
2.51.0

