Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB85623DCC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF8D10E690;
	Thu, 10 Nov 2022 08:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BEF8994A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:31:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 83F5CC25BA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:20:17 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id BA999FF805;
 Wed,  9 Nov 2022 14:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1668003614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSVYZovD1TAgVblUZpBlNNL+t9V++IJQO3Isa2vGQCk=;
 b=CRfLYcSZmOynYgH0wnczOygJKS8k70dhMyr41WYqMN3XP9NM+VYZmiwT2nLokQZQP5qRye
 rrW5jxOJCuxPlkkVTUBL4yxIMxzV/VcxKvTS5+H6GkRx2M5T7XQVg6yuBCl+lpWGVozc9I
 QEpGpYRmmXEgj0Ar0sEeogu70S2Cr4DYI7kcrw/e40Dt9G7wqxbI1tA2SBnqqcEyaMdSWz
 iPiRVMQABPtyAvWI1YSSp0uH+SNs5Bjzzs0qYSI4orXnY+yijlFslVkB5az+qt2UE5yhnn
 x3Re8bFv2gXsTU+V9Jq3FWVMy/ljD/RrT7dWnB99AFRWnsd3G1Fyd4r89r2URg==
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
Subject: [PATCH 21/23] staging: media: tegra-video: add H/V flip controls
Date: Wed,  9 Nov 2022 15:18:50 +0100
Message-Id: <20221109141852.729246-22-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Nov 2022 08:47:30 +0000
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

Tegra20 can do horizontal and vertical image flip, but Tegra210 cannot
(either the hardware, or this driver).

In preparation to adding Tegra20 support, add a flag in struct tegra_vi_soc
so the generic vi.c code knows whether the flip controls should be added or
not.

Also provide a generic implementation that simply sets two flags in the
channel struct. The Tegra20 implementation will enable flipping at stream
start based on those flags.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/vi.c | 14 +++++++++++++-
 drivers/staging/media/tegra-video/vi.h |  8 ++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index ebb502a45e96..0dbc3da6f98c 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -29,7 +29,7 @@
 #include "vi.h"
 #include "video.h"
 
-#define MAX_CID_CONTROLS		1
+#define MAX_CID_CONTROLS		3
 
 /**
  * struct tegra_vi_graph_entity - Entity in the video graph
@@ -893,6 +893,12 @@ static int vi_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY:
 		chan->syncpt_timeout_retry = ctrl->val;
 		break;
+	case V4L2_CID_HFLIP:
+		chan->hflip = ctrl->val;
+		break;
+	case V4L2_CID_VFLIP:
+		chan->vflip = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -964,6 +970,12 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		v4l2_ctrl_handler_free(&chan->ctrl_handler);
 		return ret;
 	}
+
+	if (chan->vi->soc->has_h_v_flip) {
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	}
+
 #endif
 
 	/* setup the controls */
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index a23ee8800d33..7cb038957f1b 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -74,6 +74,7 @@ struct tegra_vi_ops {
  * @hw_revision: VI hw_revision
  * @vi_max_channels: supported max streaming channels
  * @vi_max_clk_hz: VI clock max frequency
+ * @has_h_v_flip: the chip can do H adn V flip, and the driver implements it
  */
 struct tegra_vi_soc {
 	const struct tegra_video_format *video_formats;
@@ -83,6 +84,7 @@ struct tegra_vi_soc {
 	u32 hw_revision;
 	unsigned int vi_max_channels;
 	unsigned int vi_max_clk_hz;
+	bool has_h_v_flip:1;
 };
 
 /**
@@ -170,6 +172,9 @@ struct tegra_vi {
  * @syncpt_timeout_retry: syncpt timeout retry count for the capture
  * @pg_mode: test pattern generator mode (disabled/direct/patch)
  * @notifier: V4L2 asynchronous subdevs notifier
+ *
+ * @hflip: Horizontal flip is enabled
+ * @vflip: Vertical flip is enabled
  */
 struct tegra_vi_channel {
 	struct list_head list;
@@ -219,6 +224,9 @@ struct tegra_vi_channel {
 	enum tegra_vi_pg_mode pg_mode;
 
 	struct v4l2_async_notifier notifier;
+
+	bool hflip:1;
+	bool vflip:1;
 };
 
 /**
-- 
2.34.1

