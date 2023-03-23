Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411296C62D1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 10:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D063710E47D;
	Thu, 23 Mar 2023 09:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E8E10E45E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 09:08:31 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 25A4A66030C0;
 Thu, 23 Mar 2023 09:08:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679562510;
 bh=2/LIFSrMCDoyTlFa4VDWRrfC/Sm1DtA+dl9eYJSJR1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yt//uoEkj/BWkf0EBe+96syvd9Bu0BOr19S3kLHTikmPp7PfL15jVOl1ZLyOPkxJV
 T4YcpH3oExuHfHzEQvv70Fhcucgf6SFBxtXa/ed9HHKgZf4np7vDrHja7j6h4Tj74z
 SpAYDtAYtpcIE4Uzzw99WG3zT6M0M57CJ9vwZgbQbAD+H/ma/DaOscrfBErRoOBhrp
 TX+1sJqcED6Tr7jQobIW+foKmaYPgDwdz/YUw19+d9KfBl0LQ1MHjjpZ8XY6IkB/kH
 v9movDENfui0+J6C+uGPOCDmCDTSUZEJ8HlbuqDNFVUFBkViONVieTGrzVs3hqRir1
 ypVrB0FCXDkGw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v1 RESEND 2/2] drm/panfrost: Add basic support for speed
 binning
Date: Thu, 23 Mar 2023 10:08:22 +0100
Message-Id: <20230323090822.61766-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230323090822.61766-1-angelogioacchino.delregno@collabora.com>
References: <20230323090822.61766-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 wenst@chromium.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some SoCs implementing ARM Mali GPUs are subject to speed binning:
this means that some versions of the same SoC model may need to be
limited to a slower frequency compared to the other:
this is being addressed by reading nvmem (usually, an eFuse array)
containing a number that identifies the speed binning of the chip,
which is usually related to silicon quality.

To address such situation, add basic support for reading the
speed-bin through nvmem, as to make it possible to specify the
supported hardware in the OPP table for GPUs.
This commit also keeps compatibility with any platform that does
not specify (and does not even support) speed-binning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index fe5f12f16a63..58dfb15a8757 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -4,6 +4,7 @@
 #include <linux/clk.h>
 #include <linux/devfreq.h>
 #include <linux/devfreq_cooling.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 
@@ -82,6 +83,31 @@ static struct devfreq_dev_profile panfrost_devfreq_profile = {
 	.get_dev_status = panfrost_devfreq_get_dev_status,
 };
 
+static int panfrost_read_speedbin(struct device *dev)
+{
+	u32 val;
+	int ret;
+
+	ret = nvmem_cell_read_variable_le_u32(dev, "speed-bin", &val);
+	if (ret) {
+		/*
+		 * -ENOENT means that this platform doesn't support speedbins
+		 * as it didn't declare any speed-bin nvmem: in this case, we
+		 * keep going without it; any other error means that we are
+		 * supposed to read the bin value, but we failed doing so.
+		 */
+		if (ret != -ENOENT) {
+			DRM_DEV_ERROR(dev, "Cannot read speed-bin (%d).", ret);
+			return ret;
+		}
+
+		return 0;
+	}
+	DRM_DEV_DEBUG(dev, "Using speed-bin = 0x%x\n", val);
+
+	return devm_pm_opp_set_supported_hw(dev, &val, 1);
+}
+
 int panfrost_devfreq_init(struct panfrost_device *pfdev)
 {
 	int ret;
@@ -101,6 +127,10 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		return 0;
 	}
 
+	ret = panfrost_read_speedbin(dev);
+	if (ret)
+		return ret;
+
 	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names);
 	if (ret) {
 		/* Continue if the optional regulator is missing */
-- 
2.40.0

