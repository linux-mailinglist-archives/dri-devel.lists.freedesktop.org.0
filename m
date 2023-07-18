Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 255D075B33A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 17:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B7F10E163;
	Thu, 20 Jul 2023 15:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB4510E15D;
 Thu, 20 Jul 2023 15:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fL17Q3VqUkjo+GQr3X1peWuyk2d3nfQk1RDbiYDBa5GQ6kD1vJIWjNFRVyG/GBhppbJilddoURlva9plAgm9N/O+CNYqfo2UWmYuYYb2oOnoZQDpQlg4WNUqFZH4SPH+E9e24XL8Xei4MAGABYkrVHtOV3TLI9LpCjemDgXO8yWzamBlbDJGMXqXh+Qo42ngiBSkQ8+7o40XtT4EpWXvc2yrbmouxijEjfuOF54m+FZ+JaPCihSormywLPxSaL65jU4wYtH6VIaCy/9V+6KdDYBqvgZVN1ietvsRed5fLQh7FvXVqOjya6IVAzBK70IFlJNDWrYUubJY9MWVk/+Z7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pm4E2+hW5eTc5xMhIXTVAYIwvZHWqYMYPPXcyOpVT5Q=;
 b=avPsmOTjPjnQICWAD5+JNNTcmpKEdQrQYPW5OHDD6/tqStRsPnmaCtiL87jhVaBwXVPygLBAiNG8d92WM2wzzRmPPGmRrng706v6ZEfu+ySpIl5eRutUD3JB1mzQCgCI/elIzhi6uJewkdjwosnlwPshfAZqG+cDBX43nF5zVfqcSk5/8AY9AicDkBU8AmmcDNS7okKM3Pe3ttvDeL9fvD6uWItDmjA8LGGa7236DLhi6t2hFYnfabpUVdRsh2PxygX6cxwSQtRlgSjdXrLWeucW0VBQK+Kl8JATt05z5pK6mtDv36jw+pwwGDSRQ9NUXgGz2t6wXvxnOUcys/9agg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm4E2+hW5eTc5xMhIXTVAYIwvZHWqYMYPPXcyOpVT5Q=;
 b=BCfDpAQx7ujYZWCQp2+X6WGon7Tdlytb1McqC/oQaJEphojcCWx0bv81DxfXBB1ttT6pJJ1cn7X3Te2fgCtEzRx0txy3hV7XF63KmBSSXGYVxVX0mz7jTJFCRx1dJzvmSB754mTm5W8F2z2cG65IpfHDrwAFDe6jhfa8TG2CDu4=
Received: from BN9PR03CA0558.namprd03.prod.outlook.com (2603:10b6:408:138::23)
 by CH0PR12MB8529.namprd12.prod.outlook.com (2603:10b6:610:18d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 15:42:40 +0000
Received: from BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::da) by BN9PR03CA0558.outlook.office365.com
 (2603:10b6:408:138::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Thu, 20 Jul 2023 15:42:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT112.mail.protection.outlook.com (10.13.176.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6609.25 via Frontend Transport; Thu, 20 Jul 2023 15:42:40 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 20 Jul
 2023 10:42:37 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <stable@vger.kernel.org>
Subject: [PATCH 6.4] drm/client: Send hotplug event after registering a client
Date: Mon, 17 Jul 2023 23:23:26 -0500
Message-ID: <20230718042326.80531-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT112:EE_|CH0PR12MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: a3eeaa6d-a90b-48d1-4d80-08db8937f389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iVk8hyt2nmP+TsAHLNV08Bz+fM6CWYuE98bFIxXF47AHyZtrEAM133P0bgdeZfHuRc7HhHV8PsgvW4pqKeXGUSFhoIKZcj3xCTvNnDZNwHZs0eSv8bjV8V/A4ZgOznAAuG5fURhcLbsgD3attINAgtdECDJg+gIslFNKAwCzl/gPRDFnyAETC8sbAzDZqPVfLZfNMH/0Vu8LQtOpPqt/7+cQsvreoo4PCoV9AII2d2p24VOnkbtis2ECiYxXjiUTqj+XndPBf0ofzyxnceS/ZXunpv6ELroE35a0iGZhVYFw0QCi7wRnix7OIb5ypJ7gmO/nTqfYcISEwh8HyWJ8bFSuvoMACVDiYBu6g9ZJZJX93p7cR9PlblumdqWjuUWB8CWPDXCyd65T07vDGBfaxhpnVucQ87XVfYn032wQEFOSRzpudY0OXz45gO4btmaPQ2rFmjzHNFd4ogQKnhG9HpgmIMix9nByWxkh2/wT0Vc8VQ3Gwl/No1xAu6Ponx18cMbdsweg72AdeImOyGrExEuuvQy0Z9p3sKdB+rHsC9t6LgUFNNmnz4IiV+K/FS0tnujwFmfeofe2MFIQGpXMag7Z3gUVw9QFH23MiBAha/hXNMYCXP5Qr4VkPyWZMUmEXqWnBHIH2mkN+cDCr7O3pIKAbNIcACdjWpJuGy2ZqjS2tCH8Qws9ULxyddDzJcUTaE7SS3rkPv6CVgxwnPr6wO/ujydeSMVv6yJY+eI2uc+2QkjYvi7/xeOo692k90RKviYLF2s9YkCmp1q1o3Jy8gxRDEUERz9EiF5iBhQlAnI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(54906003)(478600001)(966005)(7696005)(6666004)(40480700001)(36860700001)(36756003)(86362001)(83380400001)(40460700003)(426003)(2906002)(30864003)(4326008)(336012)(2616005)(16526019)(186003)(1076003)(82740400003)(81166007)(316002)(356005)(26005)(6916009)(70206006)(7406005)(70586007)(8936002)(44832011)(47076005)(7416002)(8676002)(66574015)(41300700001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 15:42:40.4500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3eeaa6d-a90b-48d1-4d80-08db8937f389
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8529
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Russell
 King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Paul Schyska <pschyska@gmail.com>,
 Torsten Krah <krah.tm@gmail.com>, linux-arm-msm@vger.kernel.org, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, linux-tegra@vger.kernel.org, Mikko
 Perttunen <mperttunen@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Moritz Duge <MoritzDuge@kolahilft.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

Generate a hotplug event after registering a client to allow the
client to configure its display. Remove the hotplug calls from the
existing clients for fbdev emulation. This change fixes a concurrency
bug between registering a client and receiving events from the DRM
core. The bug is present in the fbdev emulation of all drivers.

The fbdev emulation currently generates a hotplug event before
registering the client to the device. For each new output, the DRM
core sends an additional hotplug event to each registered client.

If the DRM core detects first output between sending the artificial
hotplug and registering the device, the output's hotplug event gets
lost. If this is the first output, the fbdev console display remains
dark. This has been observed with amdgpu and fbdev-generic.

Fix this by adding hotplug generation directly to the client's
register helper drm_client_register(). Registering the client and
receiving events are serialized by struct drm_device.clientlist_mutex.
So an output is either configured by the initial hotplug event, or
the client has already been registered.

The bug was originally added in commit 6e3f17ee73f7 ("drm/fb-helper:
generic: Call drm_client_add() after setup is done"), in which adding
a client and receiving a hotplug event switched order. It was hidden,
as most hardware and drivers have at least on static output configured.
Other drivers didn't use the internal DRM client or still had struct
drm_mode_config_funcs.output_poll_changed set. That callback handled
hotplug events as well. After not setting the callback in amdgpu in
commit 0e3172bac3f4 ("drm/amdgpu: Don't set struct
drm_driver.output_poll_changed"), amdgpu did not show a framebuffer
console if output events got lost. The bug got copy-pasted from
fbdev-generic into the other fbdev emulation.

Reported-by: Moritz Duge <MoritzDuge@kolahilft.de>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2649
Fixes: 6e3f17ee73f7 ("drm/fb-helper: generic: Call drm_client_add() after setup is done")
Fixes: 8ab59da26bc0 ("drm/fb-helper: Move generic fbdev emulation into separate source file")
Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers")
Fixes: 63c381552f69 ("drm/armada: Implement fbdev emulation as in-kernel client")
Fixes: 49953b70e7d3 ("drm/exynos: Implement fbdev emulation as in-kernel client")
Fixes: 8f1aaccb04b7 ("drm/gma500: Implement client-based fbdev emulation")
Fixes: 940b869c2f2f ("drm/msm: Implement fbdev emulation as in-kernel client")
Fixes: 9e69bcd88e45 ("drm/omapdrm: Implement fbdev emulation as in-kernel client")
Fixes: e317a69fe891 ("drm/radeon: Implement client-based fbdev emulation")
Fixes: 71ec16f45ef8 ("drm/tegra: Implement fbdev emulation as in-kernel client")
Fixes: 0e3172bac3f4 ("drm/amdgpu: Don't set struct drm_driver.output_poll_changed")
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Moritz Duge <MoritzDuge@kolahilft.de>
Tested-by: Torsten Krah <krah.tm@gmail.com>
Tested-by: Paul Schyska <pschyska@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.2+
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
Link: https://patchwork.freedesktop.org/patch/msgid/20230710091029.27503-1-tzimmermann@suse.de
(cherry picked from commit 27655b9bb9f0d9c32b8de8bec649b676898c52d5)
Dropped changes to drivers/gpu/drm/armada/armada_fbdev.c as
174c3c38e3a2 drm/armada: Initialize fbdev DRM client
was introduced in 6.5-rc1
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/drm_client.c              | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_fbdev_dma.c           |  4 ----
 drivers/gpu/drm/drm_fbdev_generic.c       |  4 ----
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  4 ----
 drivers/gpu/drm/gma500/fbdev.c            |  4 ----
 drivers/gpu/drm/msm/msm_fbdev.c           |  4 ----
 drivers/gpu/drm/omapdrm/omap_fbdev.c      |  4 ----
 drivers/gpu/drm/radeon/radeon_fbdev.c     |  4 ----
 drivers/gpu/drm/tegra/fbdev.c             |  4 ----
 9 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index f6292ba0e6fc..037e36f2049c 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -122,13 +122,34 @@ EXPORT_SYMBOL(drm_client_init);
  * drm_client_register() it is no longer permissible to call drm_client_release()
  * directly (outside the unregister callback), instead cleanup will happen
  * automatically on driver unload.
+ *
+ * Registering a client generates a hotplug event that allows the client
+ * to set up its display from pre-existing outputs. The client must have
+ * initialized its state to able to handle the hotplug event successfully.
  */
 void drm_client_register(struct drm_client_dev *client)
 {
 	struct drm_device *dev = client->dev;
+	int ret;
 
 	mutex_lock(&dev->clientlist_mutex);
 	list_add(&client->list, &dev->clientlist);
+
+	if (client->funcs && client->funcs->hotplug) {
+		/*
+		 * Perform an initial hotplug event to pick up the
+		 * display configuration for the client. This step
+		 * has to be performed *after* registering the client
+		 * in the list of clients, or a concurrent hotplug
+		 * event might be lost; leaving the display off.
+		 *
+		 * Hold the clientlist_mutex as for a regular hotplug
+		 * event.
+		 */
+		ret = client->funcs->hotplug(client);
+		if (ret)
+			drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
+	}
 	mutex_unlock(&dev->clientlist_mutex);
 }
 EXPORT_SYMBOL(drm_client_register);
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 728deffcc0d9..ce85b30d585e 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -253,10 +253,6 @@ void drm_fbdev_dma_setup(struct drm_device *dev, unsigned int preferred_bpp)
 		goto err_drm_client_init;
 	}
 
-	ret = drm_fbdev_dma_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 8e5148bf40bb..7e65be35477e 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -340,10 +340,6 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
 		goto err_drm_client_init;
 	}
 
-	ret = drm_fbdev_generic_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index ea4b3d248aac..cc98168a7a5e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -216,10 +216,6 @@ void exynos_drm_fbdev_setup(struct drm_device *dev)
 	if (ret)
 		goto err_drm_client_init;
 
-	ret = exynos_drm_fbdev_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 62287407e717..ba193c5bb35e 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -330,10 +330,6 @@ void psb_fbdev_setup(struct drm_psb_private *dev_priv)
 		goto err_drm_fb_helper_unprepare;
 	}
 
-	ret = psb_fbdev_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 2ebc86381e1c..c082646c3c0b 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -227,10 +227,6 @@ void msm_fbdev_setup(struct drm_device *dev)
 		goto err_drm_fb_helper_unprepare;
 	}
 
-	ret = msm_fbdev_client_hotplug(&helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b950e93b3846..02cec22b9749 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -323,10 +323,6 @@ void omap_fbdev_setup(struct drm_device *dev)
 
 	INIT_WORK(&fbdev->work, pan_worker);
 
-	ret = omap_fbdev_client_hotplug(&helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 8f6c3aef0962..8b93e6e5d2ff 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -386,10 +386,6 @@ void radeon_fbdev_setup(struct radeon_device *rdev)
 		goto err_drm_client_init;
 	}
 
-	ret = radeon_fbdev_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(rdev->ddev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 
 	return;
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index dca9eccae466..d527b0b9de1d 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -227,10 +227,6 @@ void tegra_fbdev_setup(struct drm_device *dev)
 	if (ret)
 		goto err_drm_client_init;
 
-	ret = tegra_fbdev_client_hotplug(&helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&helper->client);
 
 	return;
-- 
2.34.1

