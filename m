Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73458A701CC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 14:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3D410E3A1;
	Tue, 25 Mar 2025 13:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="kIhzMVOC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0945110E3A1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=ImgTL
 dqMQ1HWln0/pjTdJ4Wv5Wf+bnJovoBh7j+FUq8=; b=kIhzMVOCLBFylit8p4PG3
 RQuG14+3qmmuGUjVkkouivWS3loXJ5QTbei0vILd9ta98s4X5nmKmPK6TYcAJovC
 A+q2frQ7jwaTDy5ovPPy8pINeVKq7Ip8PihXnUas8AX/kB296qxcIOZJbpRMwKAs
 6l8VMdbtxS3GHEMNV5RtFM=
Received: from ProDesk.. (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgAnc2bLr+JnWNnrAA--.35530S5;
 Tue, 25 Mar 2025 21:29:53 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 3/6] drm/rockchip: inno-hdmi: Simplify error handler with
 dev_err_probe
Date: Tue, 25 Mar 2025 21:29:37 +0800
Message-ID: <20250325132944.171111-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325132944.171111-1-andyshrk@163.com>
References: <20250325132944.171111-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnc2bLr+JnWNnrAA--.35530S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uryfXr47XFy5uw1kCr17Jrb_yoW8AFWUpr
 ZxJFyjva48XF18W347ua15Ar1Sya1Uta18CrZrGwn5Zw17Zr4Dtry3ZFWFqrWFyF95Za1a
 y393Xa4UZ3W7WaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jZfHUUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hMbXmfirF9ioAAAsw
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

From: Andy Yan <andy.yan@rock-chips.com>

Use dev_err_probe simplify the error handle.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- First included in this series

 drivers/gpu/drm/rockchip/inno_hdmi.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 483ecfeaebb08..e891d42dd08a4 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -885,29 +885,22 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(hdmi->regs);
 
 	hdmi->pclk = devm_clk_get(hdmi->dev, "pclk");
-	if (IS_ERR(hdmi->pclk)) {
-		DRM_DEV_ERROR(hdmi->dev, "Unable to get HDMI pclk clk\n");
-		return PTR_ERR(hdmi->pclk);
-	}
+	if (IS_ERR(hdmi->pclk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->pclk), "Unable to get HDMI pclk\n");
 
 	ret = clk_prepare_enable(hdmi->pclk);
-	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev,
-			      "Cannot enable HDMI pclk clock: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot enable HDMI pclk: %d\n", ret);
 
 	hdmi->refclk = devm_clk_get_optional(hdmi->dev, "ref");
 	if (IS_ERR(hdmi->refclk)) {
-		DRM_DEV_ERROR(hdmi->dev, "Unable to get HDMI reference clock\n");
-		ret = PTR_ERR(hdmi->refclk);
+		ret = dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
 		goto err_disable_pclk;
 	}
 
 	ret = clk_prepare_enable(hdmi->refclk);
 	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev,
-			      "Cannot enable HDMI reference clock: %d\n", ret);
+		ret = dev_err_probe(dev, ret, "Cannot enable HDMI refclk: %d\n", ret);
 		goto err_disable_pclk;
 	}
 
-- 
2.43.0

