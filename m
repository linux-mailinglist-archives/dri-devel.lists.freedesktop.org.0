Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE98379CF12
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BA710E22B;
	Tue, 12 Sep 2023 11:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150CC10E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 11:00:02 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3ab3aa9ae33so4238178b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 04:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1694516401; x=1695121201; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMG6a3B9JSS3bDoYC2nmmUP21A8iJCDZj6ACi+jsAKs=;
 b=Dcicbj0cCCwm/nt4jhmy+7LZ0FrwUx2C039SOt7hdCyWAKOJxkt2dSslFQGRB+KGf+
 JjJs5VY/CqaZKgUu+7rnLT7RGsvTtRqJEz2z+UyPpSOk203NRaSRmRbqPiUnqeQV1MTE
 wpFFVBHczii+R/Vgfna03F+xDTlO5Rc10f7Dmh5woSD2Nsn7CKfbxAEQ0ke7i5m1NsJo
 LlBoJoFmK2HtYVX5Mm+XZAIWc0Rpw4k9ltWHe7e2sYAZRxvMq8/n8Fv4J0NFxnXyUgaF
 MUXGeKNxGgJdkuS9TIvD6R/mZ5PdB7+7nE5V63jyL9g+9Xq5H2Jtf8OL8sRUDWJjS3wg
 NzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694516401; x=1695121201;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CMG6a3B9JSS3bDoYC2nmmUP21A8iJCDZj6ACi+jsAKs=;
 b=Vo+X88dAIM1GRL/atPwZc6b8vSAXtT5WTxoZVdmzv+v1PY6VcRbyxkdoLVoV8adYp+
 hyF2ksEWTbBItmxV5tUtLL+n1CH1ZrgSqFYoSQj5fkNOIHsDYrjf0mz0qXir82Cg7Z5j
 G0HpEdOdvmPJhaPFKzEdcP4XE+83x1atcJXshYvALUrlB56HoLGtrKC6bg1T+AZjtOIo
 nMmIwPXVdT2e276mJMaQ4Uq1e0s+H3+u33MxpjBdQSQgl/gRIW3Xvd4BDzH+KnJ4zAKQ
 GKGCWRQCmtYZGCDwCsMpG/X+7Zi9pjjlv6jD40dA5axKLEEbEGhBMUbpX+pUv4xssMFL
 XjxQ==
X-Gm-Message-State: AOJu0YxoNX/3uF94sdONELXUpacShL5Sv5AWYnKwbg1LRj8LGS/H7d9h
 frICKsJMC3PPO+arHGWC9EpiWw==
X-Google-Smtp-Source: AGHT+IEkeRwFiCQH+Swyjb4qUbEnJQs4OMbOm03U1v1iQAiCUcYftTwKwbLjw/peAKOmWRxHIkyczQ==
X-Received: by 2002:aca:f0a:0:b0:3a7:7d4:4f91 with SMTP id
 10-20020aca0f0a000000b003a707d44f91mr13458976oip.14.1694516401274; 
 Tue, 12 Sep 2023 04:00:01 -0700 (PDT)
Received: from chromeos.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a63af14000000b00577ae8ad823sm760255pge.80.2023.09.12.03.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 04:00:00 -0700 (PDT)
From: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/panel: boe-tv101wum-nl6: Completely Pull GPW to VGL
 before TP term
Date: Tue, 12 Sep 2023 18:59:32 +0800
Message-Id: <20230912105932.16618-1-zhouruihai@huaqin.corp-partner.google.com>
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

Signed-off-by: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
---
This patch base on original fixes series [1]
[1] https://patchwork.kernel.org/project/dri-devel/cover/20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org/
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index c2ee2c6b4150..e37b9b4f528d 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1305,9 +1305,8 @@ static int starry_himax83102_j02_init(struct mipi_dsi_device *dsi)
 	mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x01, 0xBF, 0x11);
 	mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x86);
 	mipi_dsi_dcs_write_seq(dsi, 0xD2, 0x3C, 0xFA);
-	mipi_dsi_dcs_write_seq(dsi, 0xE9, 0xC5);
-	mipi_dsi_dcs_write_seq(dsi, 0xD3, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xE9, 0x3F);
+	mipi_dsi_dcs_write_seq(dsi, 0xD3, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80,
+			       0x0C, 0x01);
 	mipi_dsi_dcs_write_seq(dsi, 0xE7, 0x02, 0x00, 0x28, 0x01, 0x7E, 0x0F, 0x7E, 0x10, 0xA0,
 			       0x00, 0x00, 0x20, 0x40, 0x50, 0x40);
 	mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x02);
-- 
2.17.1

