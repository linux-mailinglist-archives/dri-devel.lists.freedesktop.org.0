Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 339035B6E1C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 15:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1FD10E702;
	Tue, 13 Sep 2022 13:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D878C10E717
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WPTT/lWY1pF8BiH6WPVmkViAQEe1BgeLFBLcqSEATp4=; b=IqV1PbO+YyArCK0JdJWV4CssQH
 PmyBZZwq6UTUbMHC98Qh3eUwhceHA7TI45pG3q4VhhTdwDYTTJnpBQ4jMNVeM3POGH4v4r0wg5tb6
 8ojNaML1Z4f0OAJKWmhd8tFFQwxAdUmg0jW85Nwcs+X0AdYD2vVbxTthMkoFsuinpS70k7ptArWZ5
 F1kZVdPXTfl1nvOWrbuni9mGDMQjD1xCRdwsrPwn+M9BKefavawcuSBB0GV0fWbZtKK/C+s3yvMAk
 43iOoLPZ7kbL3ExQS3lTPHqeio3xURg7wUrGyrwdA3Ax/bjyBEhm2EKDs1kjNF/EOIs+nGUDkWs6M
 MXUrZOYg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oY5kh-00EVnM-Ts; Tue, 13 Sep 2022 16:14:59 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 5/8] gpu: host1x: Add stream ID register data for NVDEC on
 Tegra234
Date: Tue, 13 Sep 2022 16:14:43 +0300
Message-Id: <20220913131447.2877280-6-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220913131447.2877280-1-cyndis@kapsi.fi>
References: <20220913131447.2877280-1-cyndis@kapsi.fi>
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

