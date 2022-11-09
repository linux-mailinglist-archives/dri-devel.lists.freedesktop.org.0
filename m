Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA3F623DC2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F5B10E67C;
	Thu, 10 Nov 2022 08:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD6A8920D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:31:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9C688CEBD2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:19:44 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 06392FF803;
 Wed,  9 Nov 2022 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1668003581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RsU9udyOxbtNMCtf0EHobHgYEBuyM2u9K+TcM2I99E=;
 b=biRjzYCKiMiK3svK2VKWNf11WrjwfSmb93QTki/yAX5a4oGK9goYuwsp74LGimY6D8+sKX
 nys7/la8xEr3zJzK5ZZqcUPCi0b36LSY+ZV279xJAgoDTTCvaHzeJacDH00xOcHHs5RZ2i
 l2V1Z0CxzaSfrz2xQd0nBs1C15rdfqt/oWwEYcndru3Kgovd51zcTkThHNjbbBWQuVWHU1
 o54R5jFItRiHIqe21ThCJ0l0LZcK68kGMLiUfhiR8u4VkfwN4gKBhtv3rI9ljRcHBe2IrP
 5RyAcHEkpHwSpDlE2qBF9AeSiMW4hJg8Zd+ebdUepgjORZC9TFcfDnx4KVuscA==
From: luca.ceresoli@bootlin.com
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH 09/23] staging: media: tegra-video: improve error messages
Date: Wed,  9 Nov 2022 15:18:38 +0100
Message-Id: <20221109141852.729246-10-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Nov 2022 08:47:29 +0000
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

tegra_vi_channels_alloc() can primarily fail for two reasons:

 1. "ports" node not found
 2. port_num > vi->soc->vi_max_channels

Case 1 prints nothing, case 2 has a dev_err(). The caller [tegra_vi_init()]
has a generic dev_err() on any failure. This mean that in case 2 we print
two messages, and in case 1 we only print a generic message.

Remove the generic message and add a specific message when case 1 happens,
so that we always have one specific message without even increasing the
number of dev_dbg*() calls.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/vi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index b24b9353077f..24de4ed1eaf0 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1272,7 +1272,7 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 
 	ports = of_get_child_by_name(node, "ports");
 	if (!ports)
-		return -ENODEV;
+		return dev_err_probe(vi->dev, -ENODEV, "%pOF: missing 'ports' node\n", node);
 
 	for_each_child_of_node(ports, port) {
 		if (!of_node_name_eq(port, "port"))
@@ -1824,11 +1824,8 @@ static int tegra_vi_init(struct host1x_client *client)
 		ret = tegra_vi_tpg_channels_alloc(vi);
 	else
 		ret = tegra_vi_channels_alloc(vi);
-	if (ret < 0) {
-		dev_err(vi->dev,
-			"failed to allocate vi channels: %d\n", ret);
+	if (ret < 0)
 		goto free_chans;
-	}
 
 	ret = tegra_vi_channels_init(vi);
 	if (ret < 0)
-- 
2.34.1

