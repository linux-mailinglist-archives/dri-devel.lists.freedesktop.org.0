Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46251C21364
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 17:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6519610E29E;
	Thu, 30 Oct 2025 16:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kRagolsW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141A710E29E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:35:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AE7874517B;
 Thu, 30 Oct 2025 16:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88974C4CEFB;
 Thu, 30 Oct 2025 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761842106;
 bh=HdDzBszjRT1bjtGdY7rWYwp2aMVoUkReGlxOWh0bxh4=;
 h=From:To:Cc:Subject:Date:From;
 b=kRagolsWLCR0E/AtgHrrngcBHOH1aVkzgGg2k9G2AXliMsHK2pnRhICuB+64f7pJs
 eEJbkxjveKUSGSADFl8aLj4YK3XZ2gXatdyIoufEMRtkXIGHkNPfRVsMWljFd3FcmA
 0gERd3kK1D0r/wW3qpxRBqVuUBfWs6gRWi2INFZnMjLh98qbEtNQ4l7Jw9PU5HHBI6
 Kk3oWqAUnl1Jno55agbNT/X+lrdL7M79j+iToYZpFhCvxt3EeyrZcnS1vvPXJMVmui
 UmEWfNOYhgwTek+aCj7uwD6n5gCK7elmKe2prS8NRjRfHVom9hq5Z8mIqrVUZWjLXR
 xCtLERFmWeMig==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vEVcI-0000000047N-15xn;
 Thu, 30 Oct 2025 17:35:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, stable@vger.kernel.org,
 Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] drm/imx/tve: fix probe device leak
Date: Thu, 30 Oct 2025 17:34:56 +0100
Message-ID: <20251030163456.15807-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure to drop the reference taken to the DDC device during probe on
probe failure (e.g. probe deferral) and on driver unbind.

Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television Encoder (TVEv2)")
Cc: stable@vger.kernel.org	# 3.10
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---

Changes in v2:
 - add missing NULL ddc check


 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index fd1e617e171e..68bbbdbd347b 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -525,6 +525,13 @@ static const struct component_ops imx_tve_ops = {
 	.bind	= imx_tve_bind,
 };
 
+static void imx_tve_put_device(void *_dev)
+{
+	struct device *dev = _dev;
+
+	put_device(dev);
+}
+
 static int imx_tve_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -546,6 +553,12 @@ static int imx_tve_probe(struct platform_device *pdev)
 	if (ddc_node) {
 		tve->ddc = of_find_i2c_adapter_by_node(ddc_node);
 		of_node_put(ddc_node);
+		if (tve->ddc) {
+			ret = devm_add_action_or_reset(dev, imx_tve_put_device,
+						       &tve->ddc->dev);
+			if (ret)
+				return ret;
+		}
 	}
 
 	tve->mode = of_get_tve_mode(np);
-- 
2.51.0

