Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DABA6DADCC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 15:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8147C10EAB3;
	Fri,  7 Apr 2023 13:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6ED10EAA7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 13:39:56 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 213161BF20E;
 Fri,  7 Apr 2023 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680874793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLj+HTnVwetVKCJYGoFXl8GPfSvVBH6A468cry27oag=;
 b=Q161tZV+jeLOXvhQkBerEA1g5pxQ9hbaarPBua7Vxnwx7xhJtnpuFjPhHAGF6Akytc0Hf3
 erPQMOM/h5zCQTLTT/Sr0gAn1XDQCGa5FBvUB1U6C5T1nKed49RiLv+/w6064U1u3W2Mbi
 F6/zvcmjnCQQNWeSfOmOHIQfjkWIja4zH2yx/TIJYUWwOL+pPNRY4ntwbCSqxAkbtgxlsU
 DSUgCyrdB91T595fSnGmNdZjKdw6E4LIbPJPIiiosrkIhtEVnpIOeQwb8mvt9MvqHLmzdx
 I3nX3fzaNjHPjXTQ/daBFcDHQDz8ibxhSvH6Lt0Z5v1UneITFF2gteKUJ2l0mA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: linux-tegra@vger.kernel.org
Subject: [PATCH v5 07/20] staging: media: tegra-video: slightly simplify
 cleanup on errors
Date: Fri,  7 Apr 2023 15:38:39 +0200
Message-Id: <20230407133852.2850145-8-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
References: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_node_put(node) does nothing if node == NULL, so it can be moved to the
cleanup section at the bottom.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

No changes in v5

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 1c0424bf1ab0..ce4ff4cbf587 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1352,7 +1352,7 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 	struct device_node *node = vi->dev->of_node;
 	struct device_node *ep = NULL;
 	struct device_node *ports;
-	struct device_node *port;
+	struct device_node *port = NULL;
 	unsigned int port_num;
 	struct device_node *parent;
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
@@ -1375,7 +1375,6 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 			dev_err(vi->dev, "invalid port num %d for %pOF\n",
 				port_num, port);
 			ret = -EINVAL;
-			of_node_put(port);
 			goto cleanup;
 		}
 
@@ -1398,13 +1397,12 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 
 		lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
 		ret = tegra_vi_channel_alloc(vi, port_num, port, lanes);
-		if (ret < 0) {
-			of_node_put(port);
+		if (ret < 0)
 			goto cleanup;
-		}
 	}
 
 cleanup:
+	of_node_put(port);
 	of_node_put(ports);
 	return ret;
 }
-- 
2.34.1

