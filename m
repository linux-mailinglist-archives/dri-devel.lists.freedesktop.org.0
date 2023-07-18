Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D467475B336
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 17:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAE610E15A;
	Thu, 20 Jul 2023 15:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5CA10E152;
 Thu, 20 Jul 2023 15:42:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByvUMAyCa4KCBieuxV9sECi2gCa4Q4x4RSEsYuJmcC8FDLNwrCt28M4sV9ggRR6dV7YeryMUZiuVBpqzwPa60awjEB6sIiLzxYqTOLiLWXNSexNJBhMNhNZ2WWYvsaUPk6C5MZiBBxxZJIMeLltdy2Ww6odqwh1ml9bMSn6y+oTgQRWjW6/xiaPchY+bp8JoiWFqzI/4P4w1bcH/II5sLxqZnem0Xuug2EAqUTaIUf3NFQtD6voFVZQIAViGPFwrvaPu4Hv4xJqdQ9NGqAnCuh1xCoulpaQeTDqvRIJltA7zFvA4px6wDTL/72XPdMP9PZtU0BniVnIfk7lHgwwSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdiUILM/nQcuoALqK4CGcMA91lbUzkpGmKFXl3R/JBA=;
 b=l3gToPVK4qRy6sh4fDY5ZEpZoMOI0AjoeDkHAAdaIu9M70e0Ct0oNWpHZXZh78L2paJZlfjkfftxfCz8xLYMSzhY9q8otIVmQTGMWTuUhGxQI/+4GS+Jn2FpDinbgixt+HA49Fh3eKaVnDCCo5aSe2ZbD5rXUppSuPhBELY5Jw77r9jXnuy7OLSlSGqrhFJC2ShNtrysLIOZU7x5icrhDxyhFSXfhY04KDrw8kA71RZG4FM+cwsn5IvB/RgHWRq4+aThgS4PGHGwuO2avxOwclppcpdcHxzGjmg2GT7W2mQ1TJQX8RmIjBJelXObHdfIgf4XxXJ8ua99+4yajwYlxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdiUILM/nQcuoALqK4CGcMA91lbUzkpGmKFXl3R/JBA=;
 b=n3GNqAqDlq2Xu9VXxPLhSudyK7DrjFE8CaEWd6YrEHG8Zm8nS8aIHREUDRn9iteJ6cdhtsmXWgpZvxQG5m41ou8yVVhOQS1VK2VKf+gQt55gFKpwR3bV0M6wz3wqqiR6HSC280DU7a8kjQRMOkDecSyDkSQ2ja7OWwEYrkfwxog=
Received: from MW4PR03CA0317.namprd03.prod.outlook.com (2603:10b6:303:dd::22)
 by CYYPR12MB8751.namprd12.prod.outlook.com (2603:10b6:930:ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 15:42:19 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::6d) by MW4PR03CA0317.outlook.office365.com
 (2603:10b6:303:dd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Thu, 20 Jul 2023 15:42:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6609.28 via Frontend Transport; Thu, 20 Jul 2023 15:42:18 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 20 Jul
 2023 10:42:15 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <stable@vger.kernel.org>
Subject: [PATCH 6.1] drm/client: Send hotplug event after registering a client
Date: Mon, 17 Jul 2023 23:22:47 -0500
Message-ID: <20230718042247.80514-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT057:EE_|CYYPR12MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffcf219-dd15-4ed2-f45f-08db8937e6c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S7ud+dNEhrqJaEsUigSY1/wdOf7SSIvW5NaGfVcpALIbEHQRVmoVKD9MqRyN4E54jTNxrzfpFo2BKMYYr+k1TzZIQpr3xeiM1QtePYTJme/nkyau61IVGJbchtfDw8T7LZDCrGKdHOkYIkXpZaak2cJPVvhw1d+DRx73JS45y7OzQfYfmBu/HOaGnPWwBEKw3+qjKHeNFYROcT6RWceWsMQl0SIRuSTCoUefu0Je1KiiK0/HIogBkUeSRqV+XD1mIfG37dm+HkKCIjRUtRtKTKNkokd3lVjI1fHFM//mKCXmuN9kAzsnjz5ifa4SYaUX63T+zSFQ+7tn5bcEzE0LRndagMObEKR3NQQGVud0zY8OLV1QXXlkuOHJsCQAVd2t3QS3jFu62C4PFzWC8KmJJ3UySSB9z2OkaWW5LMKhsa+mlX7aUundC0TG0GW3LgFkltnZ5fMnA5M+BEXwY6uUWgW4jImlLsdtOwVs5ICmXbgTLsdB5nJFbzTwy5+mBr5uLKV8Bu67ztQEizKaQejL2sfXFHX84EI0AdFSSErJqO/bY1iu4TqIWpSjc/mf7/a4zjVEJl3cth67s9J5IsSha3e3b9b7rNaWFK1PcF0nzsJKd7JrrKQATTdlpuGjI5oM6kxHIiFflk2obk4MTEkbPggoUP9ma4r+IlNu6AhdbS4jPdUrHMjv6zCWlIzmm1mD3GqGBfunMIBOq5BsONk+MTBg8sMJCWW8vRo6aoWRCjkLt1JxP2jedPTS9n96s7bymPkA93e/jwvdhpBzKLI7RAPqohX3EFAGhCRruISEecU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(70206006)(70586007)(40460700003)(4326008)(316002)(6916009)(6666004)(7696005)(45080400002)(81166007)(82740400003)(356005)(47076005)(26005)(336012)(66574015)(966005)(2616005)(426003)(186003)(1076003)(36860700001)(16526019)(83380400001)(478600001)(2906002)(36756003)(86362001)(40480700001)(54906003)(44832011)(41300700001)(5660300002)(7406005)(7416002)(8936002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 15:42:18.9393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffcf219-dd15-4ed2-f45f-08db8937e6c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8751
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
 alexandru.gagniuc@hp.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
was introduced in 6.5-rc1.

Dropped changes to exynos, msm, omapdrm, radeon, tegra drivers
as missing code these commits introduced:

99286486d674 drm/exynos: Initialize fbdev DRM client
841ef552b141 drm/msm: Initialize fbdev DRM client
9e69bcd88e45 drm/omapdrm: Implement fbdev emulation as in-kernel client
e317a69fe891 drm/radeon: Implement client-based fbdev emulation
9b926bcf2636 drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is set
25dda38e0b07 drm/tegra: Initialize fbdev DRM client
8f1aaccb04b7 drm/gma500: Implement client-based fbdev emulation
b79fe9abd58b drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers

Move code for drm-fbdev-generic.c to matching file in 6.1.y because
these commits haven't happened in 6.1.y.
8ab59da26bc0 drm/fb-helper: Move generic fbdev emulation into separate source file
b9c93f4ec737 drm/fbdev-generic: Rename symbols

Cc: alexandru.gagniuc@hp.com
Link: https://lore.kernel.org/stable/SJ0PR84MB20882EEA1ABB36F60E845E378F5AA@SJ0PR84MB2088.NAMPRD84.PROD.OUTLOOK.COM/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/drm_client.c    | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c |  4 ----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 2b230b4d6942..dcbeeb68ca64 100644
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
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 76e46713b2f0..442746d9777a 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2634,10 +2634,6 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
 		preferred_bpp = 32;
 	fb_helper->preferred_bpp = preferred_bpp;
 
-	ret = drm_fbdev_client_hotplug(&fb_helper->client);
-	if (ret)
-		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
-
 	drm_client_register(&fb_helper->client);
 }
 EXPORT_SYMBOL(drm_fbdev_generic_setup);
-- 
2.34.1

