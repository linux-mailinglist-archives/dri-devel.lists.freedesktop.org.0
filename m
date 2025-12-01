Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED756C9993C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 00:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE9F10E4D0;
	Mon,  1 Dec 2025 23:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w5G8FsS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE7210E4D0;
 Mon,  1 Dec 2025 23:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/PhnL7q1aJzlSRppt0m+Wm3Pf4gakUYxkwRA7xClM4I01n6H6+7oHPD3NkDwcIDFyjqPIIPXhpaGddmn3SIOZlALMpY88OcJRuLh8XCZJwrxLvb8uxKGZHZSKSO3iBrGYdVOZxqb7L+ljMz+CJJzudzorsMSNGbyoKU/ld7E7agG+RDfqDkFQWEWPLoSvXQjgtSYKtzaPgpU38hw2yfPNsxuW0ln7O/JK/MaGEI3r8MIDJ/CUWkTV564I1CMymSEwWt/kkQEKH8Rzo8petOmFpvMOq/Jel6DHF6hub0Z8c9SJhIFmmmX06oRsx9ui85McOQ1TQ5N47bqx9lj7QenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoDT34ftPQAeSWx56k0XE0bVgMRF8ugW9TZTNV5ywIg=;
 b=ZQtSd4UQGMaxgehN5epdUQJ+//VwqMiOYSnONWSXbTRH3nMJteUmcjlaGXzm8ykg4IMJyGLKXWGTO6gNuNywR1ZBtMZPpWBgfLVCuu+kIOvPvFNSVc7Lwz/Ef6fK6cNCuxw37RpSYoyRjdOuzTRpFWX8fQZeWGWvu0XwL5JGQ8ZKKpq+wNmuCJRGZScQtFp2i1G8+iyTKKjpVaUpmYEuhg7QM9j8J8Jj+DVJKBWUziIZdnyIkSXr5MkrVxJl4A0Fi6kIuLP+wEefGEYqWDLVeeIAtRhQ4ey3fKc28FBaYhWXUCMgUzexSytUelRTKGxCA8Ozl5CRBqX+G//Gma7usA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoDT34ftPQAeSWx56k0XE0bVgMRF8ugW9TZTNV5ywIg=;
 b=w5G8FsS8sApENxsjXFWnzTalT3AmrwOAUwuB56hDI9r2OI9mnpmCjJGdkiZOsDtOnaJT5dR3WB0Y19cRmJnq1kKogCAKBkzs4Xe9R7GYI8MPqxEB5JZBP3/O1YgXUaQJIPWFnl6iUKzTzBhAXIeOtjmd+K1TZnREHORz1zJtFiQ=
Received: from DM6PR06CA0099.namprd06.prod.outlook.com (2603:10b6:5:336::32)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:23:09 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::68) by DM6PR06CA0099.outlook.office365.com
 (2603:10b6:5:336::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:23:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:23:08 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 17:23:08 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 15:23:08 -0800
Received: from thonkpad.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 1 Dec 2025 15:23:07 -0800
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
Date: Mon, 1 Dec 2025 18:18:06 -0500
Message-ID: <20251201231807.287414-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|SA0PR12MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: cb65be36-62a1-48e2-a18f-08de313096aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I5vMxuAz7/amLJIXrCCVE64lIUrcOOO+i97hnCOq9jOLDudNxj62z5pnA3Rx?=
 =?us-ascii?Q?DNGdxlE5tivhHETM/QPR28x3e96GSq1pVq8QmPLpn1hkehbNorGwlZQuI+T1?=
 =?us-ascii?Q?Ta+c6H87qtBa+z5tHA8VsjyAwFap/+99r95UxmfdvCIU4ttk9ymtvboYXK5Y?=
 =?us-ascii?Q?yo7hhIhXY3T8/+cOjSSCdpIhwMPb09dlck1OlHZDUo/tSlCFo+4k4BskAhzw?=
 =?us-ascii?Q?2LDvEFIoRflYHN+D8eVdkY/m7IQl7XsnFXgeO9bd65zui8dw8tDlitB84hkr?=
 =?us-ascii?Q?9VuG3pHNi7i9hhZxxeKavx3/mp/bEEAk1A7BI8m8NNCE006wyxsyPgiyT/Gi?=
 =?us-ascii?Q?dSlF1gJhXN4bGdK2y30izYdDsKIDto+DJPRHU02ohVF/J/KAhZ/PeWbJYJnl?=
 =?us-ascii?Q?T2Gmr3ekjDlhhnd8HCrCjmzefTgp2Vkk2A9XCIYMGubr7f8j8CgdDY3VDMS5?=
 =?us-ascii?Q?rMNdbwJMo+Qwcly+/0p1kMy/HX/NWrLbB+s5nC4+IIdx+KZ0XBdH3lTfIojr?=
 =?us-ascii?Q?0R8GIycYORDBO44I0/FcV91dnErTjlWQ2CwprUyhhhhVQCEj3nIcLpjjHTsX?=
 =?us-ascii?Q?fH1/TOWSlpFpiY3CuFasSUeaTXNb+PgD4IXQQQqeq4WM71Ap1QGK93HVUDvZ?=
 =?us-ascii?Q?LXMwxEAoy2kYIkMGl2oDi5EEUjCp5hjO0QQSZog2+wjre17g7jZnrMB1UWY6?=
 =?us-ascii?Q?esk3O4tdsib8PAaQqv9MWQi6h5WXyI3rOtz/YPEAI8qT3Io45/LLRx2QZMcS?=
 =?us-ascii?Q?FV5dlFkTZXzR5mC016OiZdFgIJZnHjSDktXEqtEj3Tl2zRPNkvGhGvAX1KW9?=
 =?us-ascii?Q?0FJJ/5O+qLMTZoF4ENodszhOdjjU85jdrQUuTd350xSFFCB2WFJocNbiX4o4?=
 =?us-ascii?Q?ltpB7XXHT241kdsZ6bG8lEA2fbM+aLVmaybOWtcP/9mGi3v2WB+PdaBfRaxK?=
 =?us-ascii?Q?ZUA78xbzvasRbnKphyFfP8v0bEPZ8x73TUgQB4I/V6hoJuTZHw6XlzmvTD7E?=
 =?us-ascii?Q?mICRukjkDEtap6l3RnuFDGu/AKpsdkie8nuY9Qf/0jRHrW8cW8uUB6jGSTu9?=
 =?us-ascii?Q?IPVHM1Z2qjaFx8dGndEpohMryggIBZCPcJmrIAZL93juEcrxzS6rovMI/xAv?=
 =?us-ascii?Q?YRXkxJUle/PL23ENAiTf9ee27YRbnyqOe6oksI7mYZJhR3BYo6fpBpHSFB+G?=
 =?us-ascii?Q?cgXFpkf6n8hbxBmN6/uXehf6r/0yw4IaAY2TpatX9oMk92vOLC6b6eVoYI/q?=
 =?us-ascii?Q?yl6pCZ904iSeiiymsD/NF6PsSmKBUza6RxbextHbWLorUvaSm5RV8dkid6S4?=
 =?us-ascii?Q?3CBiWITKgG2Z+7BiOXfxpscbnzFv+5MDK2aWs43ZPFKqsTHGiFN/XpNK19m+?=
 =?us-ascii?Q?OnHNT58duBUz2mLw2CcTqkEx5ZKezbjfowBkl2BM6iXIUA8AFCjjGX7A/r5a?=
 =?us-ascii?Q?n4SeeX7zPPWpequayB4C58ZgxUsIknVjNdMFLydDQjvqE90W2o+asTbbBemv?=
 =?us-ascii?Q?r+FCxfo8k8KRNKgnhl3Yg5L9ay4clKF0Voe6RpJN6jT5DQhgUsDEOG7LpEYu?=
 =?us-ascii?Q?eQCPa1QP+8liJAEcoUs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:23:08.8349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb65be36-62a1-48e2-a18f-08de313096aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494
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

