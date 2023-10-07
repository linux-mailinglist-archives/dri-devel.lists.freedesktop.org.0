Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAC57BC526
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 08:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D7D10E111;
	Sat,  7 Oct 2023 06:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380F410E111
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 06:50:24 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c723f1c80fso21560305ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 23:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1696661424; x=1697266224; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z1LBLwayKsoX7mk4wX2T6YHmJ0vjeZPTMdzkWecqwIw=;
 b=Dh0CYj5hnFHE9yFbIDqhcK3mlSBUOxdZO6E3i0SZSWUdLOpPXCC8jjrsbHkndNFo4M
 nLPoZUbepSyU8SjjUB4/qtg7fmxhKKKtKbJ3sttOdphNPdKQRr6O9XG23TSMmi+/wX5T
 Tduik6FlL7xgAKTf7wV6kmso2mrAW6yL2X3OQdgNVDexwDD0FI4Xp+cXUMIv1s4y5ZjS
 KoiOnTi/QGlgHc5OK9rAbWJpKHy/lG2TQhbVX/SpnhBobhZKNqQCgc3hm4Ou/nZK3X2m
 slyFewo7X6sOIRp9L2mG3wGx4gKwLjAN7DxB2PYD+aAeNG+2AFyLw0EH79rexYo0kg2u
 6l6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696661424; x=1697266224;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z1LBLwayKsoX7mk4wX2T6YHmJ0vjeZPTMdzkWecqwIw=;
 b=GmQk8X5ghdULLlYQNvuwppXVqT7CSCkxsRn3lQz0EVeHt89PzWS3esEepGjWFbykEy
 sFcHWgP3++xj6YioCh6hpVZpFZYtCLRdAnXDg6LzCwXaf+pkjyrkBJn5ZDbHo904iKwY
 gmdqNytf5nsDWVO4IcnZICsCoKP/3gAnXxN+S1wbdu1W4wVHL4XsL79OxYCJT+fHGhHX
 uYa946Kyhqe5SogMpGmkYLszjdoawHrVrjV7i1FuEyFQAUsyRa5ZRVizjn7kD19WGuAs
 TOXiDbvG/+1+2CuPsMig0p0lHdrQ3JJCpsCM9TJBbdpYCCkanA2XDZoODs+VLN9SdFDJ
 qDpQ==
X-Gm-Message-State: AOJu0YzY1Bquwpgmm0F0TR7T8ogoQQdMb1NYLOYs2MI3MLcsEQBVsWTT
 MPxM/y6aIQuCgTBBmv61Hutmtg==
X-Google-Smtp-Source: AGHT+IEJKd0g37TMqMt6WzCwYKMBWZ6FXcXKOMm99HyKTzO52lk/0Wvv4JxNKg/q5FAkvPR9ssUgog==
X-Received: by 2002:a17:903:2309:b0:1c3:6e38:3940 with SMTP id
 d9-20020a170903230900b001c36e383940mr11770898plh.7.1696661423628; 
 Fri, 06 Oct 2023 23:50:23 -0700 (PDT)
Received: from chromeos.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a170902740600b001bc18e579aesm5051796pll.101.2023.10.06.23.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 23:50:23 -0700 (PDT)
From: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 yangcong5@huaqin.corp-partner.google.com
Subject: [PATCH v2] drm/panel: boe-tv101wum-nl6: Completely pull GPW to VGL
 before TP term
Date: Sat,  7 Oct 2023 14:49:49 +0800
Message-Id: <20231007064949.22668-1-zhouruihai@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sta_himax83102 panel sometimes shows abnormally flickering
horizontal lines. The front gate output will precharge the X point of
the next pole circuit before TP(TouchPanel Enable) term starts, and wait
until the end of the TP term to resume the CLK. For this reason, the X
point must be maintained during the TP term. In abnormal case, we
measured a slight leakage at point X. This because during the TP term,
the GPW does not fully pull the VGL low, causing the TFT to not be
closed tightly.

To fix this, we completely pull GPW to VGL before entering the TP term.
This will ensure that the TFT is closed tightly and prevent the abnormal
display.

Fixes: 1bc2ef065f13 ("drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel")
Signed-off-by: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
---
Changes since v1:

- Rebased on top of drm-misc-next
- Add Fixes tag from Jessica's comment

v1: https://patchwork.kernel.org/project/dri-devel/patch/20230912105932.16618-1-zhouruihai@huaqin.corp-partner.google.com/
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 5ac926281d2c..c9087f474cbc 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1342,9 +1342,7 @@ static const struct panel_init_cmd starry_himax83102_j02_init_cmd[] = {
 	_INIT_DCS_CMD(0xB1, 0x01, 0xBF, 0x11),
 	_INIT_DCS_CMD(0xCB, 0x86),
 	_INIT_DCS_CMD(0xD2, 0x3C, 0xFA),
-	_INIT_DCS_CMD(0xE9, 0xC5),
-	_INIT_DCS_CMD(0xD3, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x01),
-	_INIT_DCS_CMD(0xE9, 0x3F),
+	_INIT_DCS_CMD(0xD3, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x01),
 	_INIT_DCS_CMD(0xE7, 0x02, 0x00, 0x28, 0x01, 0x7E, 0x0F, 0x7E, 0x10, 0xA0, 0x00, 0x00, 0x20, 0x40, 0x50, 0x40),
 	_INIT_DCS_CMD(0xBD, 0x02),
 	_INIT_DCS_CMD(0xD8, 0xFF, 0xFF, 0xBF, 0xFE, 0xAA, 0xA0, 0xFF, 0xFF, 0xBF, 0xFE, 0xAA, 0xA0),
-- 
2.17.1

