Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C09E7799F00
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 18:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6134710E049;
	Sun, 10 Sep 2023 16:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8CD10E049
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 16:39:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE48E60C17;
 Sun, 10 Sep 2023 16:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49886C433C7;
 Sun, 10 Sep 2023 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694363991;
 bh=LY/9+wRW8YMo14dZyzZkH1P4Vtp7V1yARKdNLvP2b1U=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=oAvTTEqlpC3k5Sndwy855qLdP/JG8kJz0t3eWOxHr/gdT8G7oFgpQJK2zFOVexWoA
 nHyQ4+OF4Rr2zFsEGa511dJTgMMtFml3U+WUZkRipVQ+GRIROXvBUfUhZotuPZ/xbM
 cqSWY1xcvyMa4jUhYV3F46rOpHAC4/hdf04RJEfnR1UpKMms7lGvmMW2ZxlM+T68WH
 9lcUm9JEtRtY6/JYNpSjy3VnYoHzcPJic8iudd9Crt1dtV4xqg/PnvoXyl0oM34Jh3
 vU/EXT6q8hXxca+Fm4ZmYsUsiFH2GV1tiE8yM0LXw5IRLddhFx47hUqx5JFXhGXTp/
 TVwa1x94i/eWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 26802C71153;
 Sun, 10 Sep 2023 16:39:51 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Sun, 10 Sep 2023 18:39:39 +0200
Subject: [PATCH] drm/simpledrm: Add support for multiple "power-domains"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230910-simpledrm-multiple-power-domains-v1-1-f8718aefc685@jannau.net>
X-B4-Tracking: v=1; b=H4sIAErx/WQC/x2NywqDMBAAf0X27EJipaC/UnqIZlMXzINdtQXx3
 xu8zVxmTlASJoWxOUHoYOWcqti2gXlx6UPIvjp0pnuYwRpUjmUlLxHjvm5cGUv+kqDP0XFSDL2
 l4J7OD9MMNVOEAv/uxet9XX/dov7xcgAAAA==
To: Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5664; i=j@jannau.net;
 h=from:subject:message-id; bh=EJPagUuzxc0WqRlov5ut5ybAy0M3MV6MA3GMn1r/gd8=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhpS/H8MYXzPpOTWEfjfa6HD/FX9UTc8GXzOBCXV7HNSSl
 leL5c3tKGVhEONgkBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJGFCxgZHsxV28SbomKz6ICV
 8rEXtT7+kQLm7AbLJkqq1xx1N7kuw/C/Rn1dyMES7nAGvVlC5hKa+5RX/dize/eNyECWJ+/Tz/X
 xAQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
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
Reply-To: j@jannau.net
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Janne Grunau <j@jannau.net>

Multiple power domains need to be handled explicitly in each driver. The
driver core can not handle it automatically since it is not aware of
power sequencing requirements the hardware might have. This is not a
problem for simpledrm since everything is expected to be powered on by
the bootloader. simpledrm has just ensure it remains powered on during
its lifetime.
This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
systems. The HDMI output initialized by the bootloader requires keeping
the display controller and a DP phy power domain on.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/gpu/drm/tiny/simpledrm.c | 106 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index ff86ba1ae1b8..efedede57d42 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -6,6 +6,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_aperture.h>
@@ -227,6 +228,12 @@ struct simpledrm_device {
 	unsigned int regulator_count;
 	struct regulator **regulators;
 #endif
+	/* power-domains */
+#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
+	int pwr_dom_count;
+	struct device **pwr_dom_devs;
+	struct device_link **pwr_dom_links;
+#endif
 
 	/* simplefb settings */
 	struct drm_display_mode mode;
@@ -468,6 +475,102 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
 }
 #endif
 
+#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
+/*
+ * Generic power domain handling code.
+ *
+ * Here we handle the power-domains properties of our "simple-framebuffer"
+ * dt node. This is only necessary if there is more than one power-domain.
+ * A single power-domains is handled automatically by the driver core. Multiple
+ * power-domains have to be handled by drivers since the driver core can't know
+ * the correct power sequencing. Power sequencing is not an issue for simpledrm
+ * since the bootloader has put the power domains already in the correct state.
+ * simpledrm has only to ensure they remain active for its lifetime.
+ *
+ * When the driver unloads, we detach from the power-domains.
+ *
+ * We only complain about errors here, no action is taken as the most likely
+ * error can only happen due to a mismatch between the bootloader which set
+ * up the "simple-framebuffer" dt node, and the PM domain providers in the
+ * device tree. Chances are that there are no adverse effects, and if there are,
+ * a clean teardown of the fb probe will not help us much either. So just
+ * complain and carry on, and hope that the user actually gets a working fb at
+ * the end of things.
+ */
+static void simpledrm_device_detach_genpd(void *res)
+{
+	int i;
+	struct simpledrm_device *sdev = /*(struct simpledrm_device *)*/res;
+
+
+	drm_err(&sdev->dev, "% power-domains count:%d\n", __func__, sdev->pwr_dom_count);
+	if (sdev->pwr_dom_count <= 1)
+		return;
+
+	for (i = sdev->pwr_dom_count - 1; i >= 0; i--) {
+		if (!sdev->pwr_dom_links[i])
+			device_link_del(sdev->pwr_dom_links[i]);
+		if (!IS_ERR_OR_NULL(sdev->pwr_dom_devs[i]))
+			dev_pm_domain_detach(sdev->pwr_dom_devs[i], true);
+	}
+}
+
+static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
+{
+	struct device *dev = sdev->dev.dev;
+	int i;
+
+	sdev->pwr_dom_count = of_count_phandle_with_args(dev->of_node, "power-domains",
+							 "#power-domain-cells");
+	/*
+	 * Single power-domain devices are handled by driver core nothing to do
+	 * here. The same for device nodes without "power-domains" property.
+	 */
+	if (sdev->pwr_dom_count <= 1)
+		return 0;
+
+	sdev->pwr_dom_devs = devm_kcalloc(dev, sdev->pwr_dom_count,
+					       sizeof(*sdev->pwr_dom_devs),
+					       GFP_KERNEL);
+	if (!sdev->pwr_dom_devs)
+		return -ENOMEM;
+
+	sdev->pwr_dom_links = devm_kcalloc(dev, sdev->pwr_dom_count,
+						sizeof(*sdev->pwr_dom_links),
+						GFP_KERNEL);
+	if (!sdev->pwr_dom_links)
+		return -ENOMEM;
+
+	for (i = 0; i < sdev->pwr_dom_count; i++) {
+		sdev->pwr_dom_devs[i] = dev_pm_domain_attach_by_id(dev, i);
+		if (IS_ERR(sdev->pwr_dom_devs[i])) {
+			int ret = PTR_ERR(sdev->pwr_dom_devs[i]);
+			if (ret == -EPROBE_DEFER) {
+				simpledrm_device_detach_genpd(sdev);
+				return PTR_ERR(sdev->pwr_dom_devs[i]);
+			}
+			drm_err(&sdev->dev,
+				"pm_domain_attach_by_id(%u) failed: %d\n", i, ret);
+		}
+
+		sdev->pwr_dom_links[i] = device_link_add(dev,
+							 sdev->pwr_dom_devs[i],
+							 DL_FLAG_STATELESS |
+							 DL_FLAG_PM_RUNTIME |
+							 DL_FLAG_RPM_ACTIVE);
+		if (!sdev->pwr_dom_links[i])
+			drm_err(&sdev->dev, "failed to link power-domain %u\n", i);
+	}
+
+	return devm_add_action_or_reset(dev, simpledrm_device_detach_genpd, sdev);
+}
+#else
+static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
+{
+	return 0;
+}
+#endif
+
 /*
  * Modesetting
  */
@@ -651,6 +754,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 	ret = simpledrm_device_init_regulators(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = simpledrm_device_attach_genpd(sdev);
 	if (ret)
 		return ERR_PTR(ret);
 

---
base-commit: 15d30b46573d75f5cb58cfacded8ebab9c76a2b0
change-id: 20230910-simpledrm-multiple-power-domains-f41efa6ad9bc

Best regards,
-- 
Janne Grunau <j@jannau.net>

