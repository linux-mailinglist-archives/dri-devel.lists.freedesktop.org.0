Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CA3AFCA32
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F6310E62A;
	Tue,  8 Jul 2025 12:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="m3sJDprV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9650C10E610
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8bA1fIZoxmI2vdgHJBtDrQp+hI4tTUxQ2x0sAD1aEPc=; b=m3sJDprV7VZHfn82zBvK+jT12s
 wWc7w2h4nQpN2SfPw0KWFeTXTVEOyo00attfAG5exm5/qPNcS/WiH2tqrnIqk7OUfvE7JfMk22M0w
 mE4ElSLBZzhnX5uVVZrb4rirH5A8ufUgfU+Le0J2IrWGJDTJhIqDW1o5bmOMa1quhS5aSdhGuwMkR
 PHPbfC+LFzpnfvhEEyM1hgUukj5lofkn1boWPana0GURbaobd6J8dUBeqpB4YVFCsxmyEzNAz40Hj
 53EhFOXd8ajTkoz/g9mEbzi+8jaHEac36CEXXsB3jw2m8wB6SKmI5T5BFH6bzPuGSEYSTNrZh6PqI
 dMBVdinw==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
 (helo=senjougahara.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1uZ7HH-008UTB-3A;
 Tue, 08 Jul 2025 15:18:28 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Tue, 08 Jul 2025 21:18:08 +0900
Subject: [PATCH] gpu: host1x: Allow loading tegra-drm without enabled engines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-host1x-allow-no-subdevs-v1-1-93c66c251f03@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAH8MbWgC/x3MTQqAIBBA4avErBuwKJSuEi20phoIDac/kO6et
 PwW7yUQikwCXZEg0sXCwWdUZQHjav1CyFM21KpulVYG1yBH9aDdtnCjDyinm+gSnE3jnHaNsVZ
 DrvdIMz//uR/e9wMDsUXDaQAAAA==
X-Change-ID: 20250708-host1x-allow-no-subdevs-f84bb7b48aa7
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vamsee Vardhan Thummala <vthummala@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

From: Vamsee Vardhan Thummala <vthummala@nvidia.com>

Add support to register host1x devices without requiring subdevices.
This ensures syncpoint functionality remains available even when engine
subdevices are not present.

Add softdep for tegra-drm to make userspace interface available
without module autoloading through device tree entries.

Signed-off-by: Vamsee Vardhan Thummala <vthummala@nvidia.com>
[mperttunen@nvidia.com: some rewording]
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 12 ++++++++++++
 drivers/gpu/host1x/dev.c |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 344cc9e741c1357420240467754fd151926b3bd5..723a80895cd43bde840adf8d26812e82d12385ab 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -471,6 +471,18 @@ static int host1x_device_add(struct host1x *host1x,
 
 	mutex_unlock(&clients_lock);
 
+	/*
+	 * Add device even if there are no subdevs to ensure syncpoint functionality
+	 * is available regardless of whether any engine subdevices are present
+	 */
+	if (list_empty(&device->subdevs)) {
+		err = device_add(&device->dev);
+		if (err < 0)
+			dev_err(&device->dev, "failed to add device: %d\n", err);
+		else
+			device->registered = true;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 1f93e5e276c0835eac2f713ffcd60a9db8db2c21..e1a9246d35f4b7685dd828c53eaf3910a5ef739e 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -821,6 +821,7 @@ u64 host1x_get_dma_mask(struct host1x *host1x)
 }
 EXPORT_SYMBOL(host1x_get_dma_mask);
 
+MODULE_SOFTDEP("post: tegra-drm");
 MODULE_AUTHOR("Thierry Reding <thierry.reding@avionic-design.de>");
 MODULE_AUTHOR("Terje Bergstrom <tbergstrom@nvidia.com>");
 MODULE_DESCRIPTION("Host1x driver for Tegra products");

---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250708-host1x-allow-no-subdevs-f84bb7b48aa7

