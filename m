Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6235A5F7F6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D90710E8B0;
	Thu, 13 Mar 2025 14:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KMEKgBVl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AB010E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:25:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70D27444F4;
 Thu, 13 Mar 2025 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741875937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vrsRvrI2fVkzeaX8UjmDzn0XjDjCg6WTOhzziOVkric=;
 b=KMEKgBVls9RbWZlGt4UHN2T0cibIhnQ4oQxSR9n5eSq2UlsemvsVLgxzZtRhUHqGlZk3PO
 pBScKqn59/3RGZdiZmr2bD857dG620+Vjqk3jrEFOoAQAvFDxjDnYF470hoQVgQCmMIwcr
 LpS3qx8TOFzc5hep5vyjXHLNtwZ4piXeh6c9q/ikQeVduy0uG560Jyyj48oTJrWlx6d6aF
 0sj7fHbaojLRTtSdXXsJ8FhGdGTNl+LVZOROCcHV+tMTu2aXAcS8oGDcNx50ID/DFP/go2
 sUMJkoa/UayqKhELoKovvpUjNt7dWfSKOsxjNLterwauL1PrAy+5HeFlnkSWEQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 13 Mar 2025 15:25:17 +0100
Subject: [PATCH] drm/mxsfb: fix missing rollback on failure in
 mxsfb_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mxsfb_probe-fix-rollback-on-error-v1-1-ad2fb79de4cb@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMzq0mcC/x2N0QqDMAwAf0XybCBaZW6/IjKspjPMNZLCEMR/t
 /h4cNwdkNiEE7yKA4z/kkRjhqosYFrG+GGUOTPUVLfkKoe/PQX/3kw9Y5AdTdfVj9MXNSKbqaG
 jR+Of1FFwDeTOZpzF+9EP53kBBQ8OK3MAAAA=
X-Change-ID: 20250313-mxsfb_probe-fix-rollback-on-error-3074b9080f34
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdekudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfffgeekhfdtveffheeuudeltefhfeduteekleffvefgfffgkeevfeejtdekkeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtr
 giiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: luca.ceresoli@bootlin.com
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

When aperture_remove_all_conflicting_devices() fails, the current code
returns without going through the rollback actions at the end of the
function, thus the actions done by drm_dev_alloc() and mxsfb_load() are not
undone.

Fix by using a goto statament, as done for the previous and following error
conditions.

Fixes: c8e7b185d45b ("drm/mxsfb: Remove generic DRM drivers in probe function")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
The offending commit is not yet merged into master, and even less in a
released kernel, so this does not need to go through stable.
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index c183b1112bc4e9fe4f3b048a2b6e4c98d1d47cb3..b4273e678d26dbc3dee2014266d61470da4e8010 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -365,9 +365,10 @@ static int mxsfb_probe(struct platform_device *pdev)
 	 * located anywhere in RAM
 	 */
 	ret = aperture_remove_all_conflicting_devices(mxsfb_driver.name);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "can't kick out existing framebuffers\n");
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "can't kick out existing framebuffers\n");
+		goto err_unload;
+	}
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)

---
base-commit: f9f087d946266bc5da7c3a17bd8fd9d01969e3cf
change-id: 20250313-mxsfb_probe-fix-rollback-on-error-3074b9080f34

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

