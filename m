Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD424A6CDF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE56A10EFFD;
	Wed,  2 Feb 2022 08:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx4.securetransport.de (mx4.securetransport.de [178.254.6.145])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB22310E42C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:12:12 +0000 (UTC)
Received: from mail.dh-electronics.com
 (business-24-134-97-169.pool2.vodafone-ip.de [24.134.97.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx4.securetransport.de (Postfix) with ESMTPSA id A9151720CA1;
 Tue,  1 Feb 2022 12:03:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1643713420;
 bh=hCPApabgAHY1xDIJ31HkWQFc0yj1SA2YQ4GkJvKoKwA=;
 h=From:To:CC:Subject:Date:From;
 b=N/F4Qn4Dgp1l7Qe15xuQiS89mKxlbLpHLl2XUtMgVFu10y6q+l9GjM9A39hJRB0Rb
 Ijthdch9IW+92Eruan3D+Ww62e7X9tPvLsxjgx+S8I8tnZUOK1WZsZt19Gq7dbIiSO
 anz8AHyZnbTZKZ3t5GVgleCC0W81nzXMECa6WsnusNQCI0qnAX3qdx9RmfAfLrFP04
 bHTtBGqFPhDDnf2OEWfJh3oSOJkw2FT7rnirHZ4TAr8rKk3H6QNSgdmaK0MqbCoOn2
 HR5JYPegv4HcJAHld5w2QNFL/FrEnzp5+2tsBK3Vo07qhSiUtNB2GfjkJIWBjCWdbT
 ejr48zbiFVIKw==
Received: from DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 1 Feb 2022 12:03:16 +0100
Received: from localhost.localdomain (172.16.51.18) by
 DHPWEX01.DH-ELECTRONICS.ORG (10.64.2.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Tue, 1 Feb 2022 12:03:16 +0100
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/panel: simple: Assign data from panel_dpi_probe()
 correctly
Date: Tue, 1 Feb 2022 12:01:53 +0100
Message-ID: <20220201110153.3479-1-cniedermaier@dh-electronics.com>
X-Mailer: git-send-email 2.11.0
X-klartext: yes
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 02 Feb 2022 08:24:59 +0000
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the function panel_simple_probe() the pointer panel->desc is
assigned to the passed pointer desc. If function panel_dpi_probe()
is called panel->desc will be updated, but further on only desc
will be evaluated. So update the desc pointer to be able to use
the data from the function panel_dpi_probe().

Fixes: 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support")

Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e46db5e359c..3c08f9827acf 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -588,6 +588,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		err = panel_dpi_probe(dev, panel);
 		if (err)
 			goto free_ddc;
+		desc = panel->desc;
 	} else {
 		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
-- 
2.11.0

