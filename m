Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984EB5AEA67
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 15:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0347710E675;
	Tue,  6 Sep 2022 13:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9510E675
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WPTT/lWY1pF8BiH6WPVmkViAQEe1BgeLFBLcqSEATp4=; b=CCePPD9ggiQwEhN2WORiIOGbBD
 DFX/B+OOnvuVARQW9lcZjfCO7V1bVbGXfstB6SyOOJJIUpQMY6/fRkWCA1wAk7iIZYPmvqE2gd9iv
 QqiavM1xW8iEc5XPzobBN4RKfFnmOXRDjPqueERTz01wm6kvQtfzJRyKr/VBe3DgTjqxEKNE7nzYa
 WM2M9+fPKcVzmnlvQDf4dN+sA6EmfsrdpD7t3NBSzGRszJbCTmG45eNXdXbqTahd1M4op6VxHONr3
 n7cXyterMZ01eJ9b4r2ndtdsr/oDh24y7gC/G314dqH2WQf2TrTkHciK94FzPmLcDfxqhpdPpluDT
 qmBEmjiw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oVYdY-008sZV-A4; Tue, 06 Sep 2022 16:29:08 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 5/8] gpu: host1x: Add stream ID register data for NVDEC on
 Tegra234
Date: Tue,  6 Sep 2022 16:28:20 +0300
Message-Id: <20220906132823.2390953-6-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220906132823.2390953-1-cyndis@kapsi.fi>
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add entries for NVDEC to the Tegra234 SID table.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 0cd3f97e7e49..d6b4614f968f 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -225,6 +225,18 @@ static const struct host1x_sid_entry tegra234_sid_table[] = {
 		.offset = 0x34,
 		.limit = 0x34
 	},
+	{
+		/* NVDEC channel */
+		.base = 0x17c8,
+		.offset = 0x30,
+		.limit = 0x30,
+	},
+	{
+		/* NVDEC MMIO */
+		.base = 0x1698,
+		.offset = 0x34,
+		.limit = 0x34,
+	},
 };
 
 static const struct host1x_info host1x08_info = {
-- 
2.37.0

