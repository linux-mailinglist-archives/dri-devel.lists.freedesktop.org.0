Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653F2658D83
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 14:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CF310E26A;
	Thu, 29 Dec 2022 13:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8200710E05E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 13:37:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 59F76CAE9C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 13:33:19 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 84017FF80F;
 Thu, 29 Dec 2022 13:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1672320777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZCL6q95y8D550Hzr4bmsZG2h4Gj8Umd37yboOQuCjQ=;
 b=AoGiwJknhnXDqyhyIBsmlxVbtQZwiDP0yFQLlvEbs2pYoFm+oFkJQ4RSVI+JuV3gOGZDXy
 ulYhdWiJO9Vh14vf31T6vMNjrszmdl2Q+iEFObvvprEn9tgvB0TwV2P31c/ztda1YQfWin
 mJiYh22/IUlRN0bYc/Nz3EgNYuuVz9uXNiHqCPei87x+ZBGWMrKt2GXNZpdO9D1k5S0zeO
 anxnA5SvNdcWBnfOMOx4mAn2cHczq2JGIxJ2yb6S2iAKUCLKiVZ3MD3WO89M9xazLUNZp5
 X5OYVMMJXsOt3GreeZqTCWaag+CUxw2owybu4IyRTjXhEeOHhQVFds806eIwRQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 16/21] staging: media: tegra-video: add a per-soc
 enable/disable op
Date: Thu, 29 Dec 2022 14:32:00 +0100
Message-Id: <20221229133205.981397-17-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Tegra20 VI needs an additional operation to enable the VI, add an
operation for that.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/vi.c | 7 +++++++
 drivers/staging/media/tegra-video/vi.h | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index a26eb1ca869f..22f6d6478d3e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1853,6 +1853,9 @@ static int tegra_vi_probe(struct platform_device *pdev)
 	vi->client.ops = &vi_client_ops;
 	vi->client.dev = &pdev->dev;
 
+	if (vi->ops->vi_enable)
+		vi->ops->vi_enable(vi, true);
+
 	ret = host1x_client_register(&vi->client);
 	if (ret < 0) {
 		dev_err(&pdev->dev,
@@ -1863,6 +1866,8 @@ static int tegra_vi_probe(struct platform_device *pdev)
 	return 0;
 
 rpm_disable:
+	if (vi->ops->vi_enable)
+		vi->ops->vi_enable(vi, false);
 	pm_runtime_disable(&pdev->dev);
 	return ret;
 }
@@ -1879,6 +1884,8 @@ static int tegra_vi_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	if (vi->ops->vi_enable)
+		vi->ops->vi_enable(vi, false);
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 879547073371..851c4f3fcb91 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -37,8 +37,11 @@ enum tegra_vi_pg_mode {
 	TEGRA_VI_PG_PATCH,
 };
 
+struct tegra_vi;
+
 /**
  * struct tegra_vi_ops - Tegra VI operations
+ * @vi_enable: soc-specific operations needed to enable/disable the VI peripheral
  * @vi_fmt_align: modify `pix` to fit the hardware alignment
  *		requirements and fill image geometry
  * @vi_start_streaming: starts media pipeline, subdevice streaming, sets up
@@ -48,6 +51,7 @@ enum tegra_vi_pg_mode {
  *		back any queued buffers.
  */
 struct tegra_vi_ops {
+	int (*vi_enable)(struct tegra_vi *vi, bool on);
 	void (*vi_fmt_align)(struct v4l2_pix_format *pix, unsigned int bpp);
 	int (*vi_start_streaming)(struct vb2_queue *vq, u32 count);
 	void (*vi_stop_streaming)(struct vb2_queue *vq);
-- 
2.34.1

