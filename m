Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B1094A4F9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 12:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A0F10E473;
	Wed,  7 Aug 2024 10:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Yc55t/Im";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0770C10E473
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 10:04:50 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-6bce380eb96so982938a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 03:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1723025089; x=1723629889; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=G8sD5tWPojbSoMGIcSaH0qeF9w3YLQb1BQMuSnaj9rk=;
 b=Yc55t/Imn0RMc/6/xiqNImXfkq+0FJaSe3rCKL48sG9n3602qaFI3dvyRlnvZKUHDm
 6+TuouYqDhSqBW+i8NAfqrB8P9/6jIvVhU4K8J25FCY1thaTHOQffNs7kODxCNdLr48K
 /2XpTge8JNs9M5Xh4hhKVq7V0Cv82CF+9dPkdv6LrtF6nafiu+8Q9ylQ2YCgVFU2ULVk
 b8FnPwQXtEIwC51kiYnBrgyByTadxFhsu1C9fQktlBVfTeJiIRakvg4Y9TeIcGonym28
 2DThDJ9TFhfWs4zMhG38HAmIhdJodI23omWWFfxG4k6boEnRBm6fZHUQsbwp1WPIZkRY
 fchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723025089; x=1723629889;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G8sD5tWPojbSoMGIcSaH0qeF9w3YLQb1BQMuSnaj9rk=;
 b=PhMEcLdneuWsZPHRNJLMKQwifm8nG86v4wH7HMTerk2n3btPCBMha8FstR4fgiTmep
 WLv8ODBjqnqmyB3TQMPmoPoxVZwHbXL5VdnKKDH3KOa2+JoycxCrV+00TfYGcMVx7LYH
 SjLF3rvUrFexbmfm1qoeOZsWq75PbCBtAsNTPY3mZ3u5BK2tsJDuxcLZIqkORduvALIj
 pN/nJhIKKxgeYZpc53M1RiUvI/WV4hVRnIC5EfyNKVZGtMrBU9zQD1nGXQSdCgbJGFwa
 gg8pN18AhV7PDULwxP4SUojeJ5JbqhofU1G0Deh+jfU1HIuYlYaWMoO60awOhVALLubW
 SB/A==
X-Gm-Message-State: AOJu0Yyrzkc1UZIUWnEmi9NLL7hNzjf7B1lmwWvEfNGezTFyAjrwKpOd
 fIqEbwf86ALsBiiMZDwr2Fe0+NdSbbXEUZu78SpoKAL/VHtdwbiusw342BO+Nek=
X-Google-Smtp-Source: AGHT+IELjUmVEpYVv5wdEeeHbgamYsaeKFOxsCWc01Nmqe8Yl8RaZRDYduWqqEPdR0Xpy6I1WQodnQ==
X-Received: by 2002:a05:6a20:258e:b0:1c4:ae14:4e3d with SMTP id
 adf61e73a8af0-1c6995809d9mr21497125637.13.1723025089264; 
 Wed, 07 Aug 2024 03:04:49 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7106ecdff89sm8119248b3a.103.2024.08.07.03.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 03:04:48 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, airlied@gmail.com,
 daniel@ffwll.ch, jagan@edgeble.ai, dmitry.baryshkov@linaro.org,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 2/2] drm/panel: jd9365da: Modify the init code of Melfas
Date: Wed,  7 Aug 2024 18:04:29 +0800
Message-Id: <20240807100429.13260-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807100429.13260-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240807100429.13260-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Modify the Melfas panel init code to satisfy the gamma
value of 2.2

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V3 and V2:
-  1. No changed.
v2: https://lore.kernel.org/all/20240806034015.11884-3-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  1. No changed.
v1: https://lore.kernel.org/all/20240725083245.12253-3-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 78 +++++++++----------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index ce73e8cb1db5..44897e5218a6 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -873,22 +873,22 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
 	jd9365da_switch_page(&dsi_ctx, 0x01);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xbf);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xd7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x01);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xbf);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xd7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x01);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x70);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x2d);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x2d);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x7e);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfd);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x19);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x28);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x12);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x7e);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x7f);
@@ -899,47 +899,47 @@ static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x01);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x8e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x6a);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x09);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x2e);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x1a);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x15);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x69);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x59);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x4e);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x4c);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x40);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x45);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x30);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x4a);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x49);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x4a);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x68);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x57);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x5b);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x4e);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x4f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x3e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x31);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x24);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x12);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x69);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x59);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x4e);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x4c);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x40);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x45);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x30);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x4a);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x49);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x4a);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x68);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x57);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x5b);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x4e);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x4f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x3e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x31);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x24);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x12);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x02);
-- 
2.17.1

