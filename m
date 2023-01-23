Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 387BD678538
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158D110E078;
	Mon, 23 Jan 2023 18:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F7210E078
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 18:46:54 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id lp10so9092569pjb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 10:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m5i4QR8qy1CMbxdo43pdI8cVBA6fl0tkLIrsZh+J/D4=;
 b=C2iWosssSY0cmzfPxup47V5McMzQzaWs+qrgrMKlZj9B9iFiaFiRYG/S9I2vl1vAWq
 dAODN44UDjBtbgAWsAayBRtSav8QjtUwr0gzOEpSH5H9Bd/xCkYeAl9dvPtTy7utl26O
 6n4poiukSq+nw8ySuoEsh1UWzKyfZd8rQjziSfV4a+WxOBRYgTVpzNbM9ePst/4llMA/
 JxUBWb/Fxnkl+1knfTmAcExt+ci8seV/v/CydCJyQh8BJ3VPbbKjptZ7DzQGG3Y4pixx
 qWxf6RQlwG7HI7In5FuiSVGzHQ/E09NA+om0S7Rv1551beszM2dzq9EbgcFcJ9p9g7Ot
 nzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m5i4QR8qy1CMbxdo43pdI8cVBA6fl0tkLIrsZh+J/D4=;
 b=d8+3En2qjvl/+DRACJ7ScBcjXX4iesYebonO/dovUwd3PP/ERWtpjAZebdj3GSmPkc
 YIF7fKtrpXqqVk1Wjf5qasxpcaBPxN2ARLzEziMl23jXrz343Mw4Ck+fR6Nh5b5lpxIl
 QJOs7/N+U0UTrj3I0hwykTjT/JMM/dIiES6FTNnf/5aptKYkGGnqrmyzqmyOC60suXDE
 9NFD/DdjeorIPKc2lY5wbZTi8J+DncdS102illz1Wab286b1/wMk3xTrZq9viWXjznQz
 A7P2cNLXlGj2iJK0KP+p5dgKkTYYsN9qSTfD88SD2C03UAxkH9PaEuPHPFyVaFSbhmIN
 Lz0Q==
X-Gm-Message-State: AFqh2krwaV1tMBQMEgAzRVdWJDOqj9QsuTlsu1D0IWP7UY8zVKdWs7fD
 ibT7ka2sfjMglZ9LVliHHPljSw==
X-Google-Smtp-Source: AMrXdXsb9+5dnzTJOITTAhlcH22qiCHJZTUcZ0ir4M/PwCv7rd/tvtjDKZkkSYM4UtaRBlhPzz2ntg==
X-Received: by 2002:a17:902:c408:b0:194:6afa:ca with SMTP id
 k8-20020a170902c40800b001946afa00camr36597498plk.56.1674499614293; 
 Mon, 23 Jan 2023 10:46:54 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 jb11-20020a170903258b00b00189a7fbfd44sm17441plb.211.2023.01.23.10.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 10:46:54 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH 1/2] drm: bridge: dw-mipi-dsi: Handle NO_EOT_PACKET mode
Date: Tue, 24 Jan 2023 00:16:46 +0530
Message-Id: <20230123184647.437965-1-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many downstream bridges or panels followed by dw-mipi-dsi were
using MIPI_DSI_MODE_NO_EOT_PACKET.

So, handle the EOTP bits accordingly in the dw-mipi-dsi host.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index b2efecf7d160..47bd69d5ac99 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -664,7 +664,13 @@ static void dw_mipi_dsi_dpi_config(struct dw_mipi_dsi *dsi,
 
 static void dw_mipi_dsi_packet_handler_config(struct dw_mipi_dsi *dsi)
 {
-	dsi_write(dsi, DSI_PCKHDL_CFG, CRC_RX_EN | ECC_RX_EN | BTA_EN);
+	u32 val;
+
+	val = CRC_RX_EN | ECC_RX_EN | BTA_EN | EOTP_TX_EN;
+	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
+		val &= ~EOTP_TX_EN;
+
+	dsi_write(dsi, DSI_PCKHDL_CFG, val);
 }
 
 static void dw_mipi_dsi_video_packet_config(struct dw_mipi_dsi *dsi,
-- 
2.25.1

