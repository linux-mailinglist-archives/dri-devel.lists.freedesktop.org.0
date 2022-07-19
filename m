Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FEB5794ED
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6230211A203;
	Tue, 19 Jul 2022 08:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E6B11A20A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:09:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26J88v5X051606;
 Tue, 19 Jul 2022 03:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1658218137;
 bh=q0RZSGoqX0l3oqgqeLlFifbhK1Q1TFJ9jWAvsrjbNFE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=v8/jstBv4kfhTkuZXpbgwDgnMfwkbhomCWvehKgRaVlw9ZN5Tg1qvjfgdWqJvqR/k
 HD7MbT8oGiPgc8aal7iykBIknUV6r6KneG8srtTcTxaPNS1UYyMka6AAzp5L+RwNvM
 x1OXMg8zU9bQZ36goqRnI33rtul0Of//pELaaNMg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26J88v5v022622
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Jul 2022 03:08:57 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 03:08:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Jul 2022 03:08:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26J88uHT020236;
 Tue, 19 Jul 2022 03:08:56 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 7/8] drm/tidss: Fix clock request value for OLDI videoports
Date: Tue, 19 Jul 2022 13:38:44 +0530
Message-ID: <20220719080845.22122-8-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220719080845.22122-1-a-bhatia1@ti.com>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OLDI TX(es) require a serial clock which is 7 times the pixel clock
of the display panel. When the OLDI is enabled in DSS, the pixel clock
input of the corresponding videoport gets a divided-by 7 value of the
requested clock.

For the am625-dss, the requested clock needs to be 7 times the value.

Update the clock frequency by requesting 7 times the value.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index c4a5f808648f..0b9689453ee8 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1326,6 +1326,16 @@ int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
 	int r;
 	unsigned long new_rate;
 
+	/*
+	 * For AM625 OLDI video ports, the requested pixel clock needs to take into account the
+	 * serial clock required for the serialization of DPI signals into LVDS signals. The
+	 * incoming pixel clock on the OLDI video port gets divided by 7 whenever OLDI enable bit
+	 * gets set.
+	 */
+	if (dispc->feat->vp_bus_type[hw_videoport] == DISPC_VP_OLDI &&
+	    dispc->feat->subrev == DISPC_AM625)
+		rate *= 7;
+
 	r = clk_set_rate(dispc->vp_clk[hw_videoport], rate);
 	if (r) {
 		dev_err(dispc->dev, "vp%d: failed to set clk rate to %lu\n",
-- 
2.37.0

