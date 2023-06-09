Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC8E729F5F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFEE10E6CC;
	Fri,  9 Jun 2023 15:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDAB10E6C4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 15:56:40 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686326198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zH5i8gD2KWtLGfG2HZpAxGk9wS5MvKvPER7W/D9EpLU=;
 b=AGmRXALloLnaa8ShBCvEp/8Nfa3mGZesXB5ySaTWhkwrZcAg4sSK/ow0JMx0Kg1tOCbKvZ
 gdCc8/ZUIovVwXgT6whhBi2DXy8pflhy4FJWfcC62ytXKauRL1OEd+I40yd2S2PajAHksH
 vE3NBUbkx3JGocrsK+0lCsebm6pg4nelRpxpsGrGd2vAyoiE5JeDnmn3oOj6VgeGsF2NPL
 3li2JnelaVmEZ2vLfiQ/EZ3eOOVmGG2BlAyfi6s7BYoSQ/JhZTG8+818z6NHSI7wbfo2h/
 CGopXBe6eDxGF19bZkLi8R0aMMLNv1A89/ywSJOVX+YDWHU9c36E3t95qtIVfA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A69DB1C0002;
 Fri,  9 Jun 2023 15:56:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] gpu: host1x: Stop open-coding of_device_uevent()
Date: Fri,  9 Jun 2023 17:56:34 +0200
Message-Id: <20230609155634.1495338-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
References: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-tegra@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is apparently no reasons to open-code of_device_uevent() besides:
- The helper receives a struct device while we want to use the of_node
  member of the struct device *parent*.
- of_device_uevent() could not be called by modules because of a missing
  EXPORT_SYMBOL*().

In practice, the former point is not very constraining, just calling
of_device_uevent(dev->parent, ...) would have made the trick.

The latter point is more an observation rather than a real blocking
point because nothing prevented of_uevent() (called by the inline
function of_device_uevent()) to be exported to modules. In practice,
this helper is now exported, so nothing prevent us from using
of_device_uevent() anymore.

Let's use the core helper directly instead of open-coding it.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

---

This patch depends on the changes performed earlier in the series under
the drivers/of/ folder.
---
 drivers/gpu/host1x/bus.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 4d16a3396c4a..dae589b83be1 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -338,32 +338,15 @@ static int host1x_device_match(struct device *dev, struct device_driver *drv)
 	return strcmp(dev_name(dev), drv->name) == 0;
 }
 
+/*
+ * Note that this is really only needed for backwards compatibility
+ * with libdrm, which parses this information from sysfs and will
+ * fail if it can't find the OF_FULLNAME, specifically.
+ */
 static int host1x_device_uevent(const struct device *dev,
 				struct kobj_uevent_env *env)
 {
-	struct device_node *np = dev->parent->of_node;
-	unsigned int count = 0;
-	struct property *p;
-	const char *compat;
-
-	/*
-	 * This duplicates most of of_device_uevent(), but the latter cannot
-	 * be called from modules and operates on dev->of_node, which is not
-	 * available in this case.
-	 *
-	 * Note that this is really only needed for backwards compatibility
-	 * with libdrm, which parses this information from sysfs and will
-	 * fail if it can't find the OF_FULLNAME, specifically.
-	 */
-	add_uevent_var(env, "OF_NAME=%pOFn", np);
-	add_uevent_var(env, "OF_FULLNAME=%pOF", np);
-
-	of_property_for_each_string(np, "compatible", p, compat) {
-		add_uevent_var(env, "OF_COMPATIBLE_%u=%s", count, compat);
-		count++;
-	}
-
-	add_uevent_var(env, "OF_COMPATIBLE_N=%u", count);
+	of_device_uevent((const struct device *)&dev->parent, env);
 
 	return 0;
 }
-- 
2.34.1

