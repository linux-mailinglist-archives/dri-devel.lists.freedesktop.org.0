Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B3B1195E5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240356E17C;
	Tue, 10 Dec 2019 21:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B001D6E17C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:25:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC9D6206D5;
 Tue, 10 Dec 2019 21:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576013113;
 bh=v6LmL/NeMzNNjx/i1AH1Pv8OWWxPbJ9jR8WnQcgNOWY=;
 h=From:To:Cc:Subject:Date:From;
 b=cT/m7ieJ2a9/g2XB0LOwMVw+ffcHD61EEP4FISl3Udqma2+unvklcyEO5QPw9WURp
 pChq2yItKrCcEZnc+lJxmeaF53p2Z/6ZxgmaVwjje+JUqRW0xm5Umg90aFTx7Wlkxb
 /r0RsBihnhIoItc6FNfcfYxMvxxCSiJPjpEB7nGQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 001/292] drm/vc4/vc4_hdmi: fill in connector info
Date: Tue, 10 Dec 2019 16:20:20 -0500
Message-Id: <20191210212511.11392-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dariusz Marcinkiewicz <darekm@google.com>

[ Upstream commit 66c2dee4ae10a2d841c40b9dd9c7141eb23eee76 ]

Fill in the connector info, allowing userspace to associate
the CEC device with the drm connector.

Tested on a Raspberry Pi 3B.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Eric Anholt <eric@anholt.net>
Link: https://patchwork.freedesktop.org/patch/msgid/20190823112427.42394-2-hverkuil-cisco@xs4all.nl
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ee7d4e7b0ee33..0853b980bcb31 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1285,6 +1285,9 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
 
 static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
+#ifdef CONFIG_DRM_VC4_HDMI_CEC
+	struct cec_connector_info conn_info;
+#endif
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = drm->dev_private;
@@ -1403,13 +1406,15 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 	hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 					      vc4, "vc4",
-					      CEC_CAP_TRANSMIT |
-					      CEC_CAP_LOG_ADDRS |
-					      CEC_CAP_PASSTHROUGH |
-					      CEC_CAP_RC, 1);
+					      CEC_CAP_DEFAULTS |
+					      CEC_CAP_CONNECTOR_INFO, 1);
 	ret = PTR_ERR_OR_ZERO(hdmi->cec_adap);
 	if (ret < 0)
 		goto err_destroy_conn;
+
+	cec_fill_conn_info_from_drm(&conn_info, hdmi->connector);
+	cec_s_conn_info(hdmi->cec_adap, &conn_info);
+
 	HDMI_WRITE(VC4_HDMI_CPU_MASK_SET, 0xffffffff);
 	value = HDMI_READ(VC4_HDMI_CEC_CNTRL_1);
 	value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
