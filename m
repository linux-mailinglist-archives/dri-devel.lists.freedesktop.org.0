Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59B93BE03
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 10:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D7E10E132;
	Thu, 25 Jul 2024 08:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="JDVv+K5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54A810E132
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 08:33:11 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1fc52394c92so6102805ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 01:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721896391; x=1722501191; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=30WwC7xF4wqRXYdTsITwiTq4M3u3wouKo8DLJsogsOg=;
 b=JDVv+K5MQJsqxu2J2zKLGxTfN61YEnK6HawhnnIgf8fNFzbxnO3IIlAYdTICEHOALt
 b9Vtz+XowrZCDkpOA+awM2srLahyqIQc07kbbs9ZYgN43XbcaLOH9QsWf2iLbsyhT67C
 zsC7eXZn4AKzXeVjiSAY+DVyVshTbi+5OLuxiBVA6i0uUGSwYDXgrT96smPU45Th9dqa
 9gntr6YooxGa9atb75DadVCdtIBw2Mvo2TSPnFLaz3yuVuzJDQwimEovQZI5kuZBacpD
 GIiH13TxQbD4BH82nLber0qQ25hwYM8YdHYjO/gKcEJLxA61t1LZIvb6Gu42bqUFOtR0
 K/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721896391; x=1722501191;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=30WwC7xF4wqRXYdTsITwiTq4M3u3wouKo8DLJsogsOg=;
 b=ggrZWAxdpACeky3RT0VgF5rCpV4NfLE+23+SqROm+kFvnsKwCgA8Hr+sLJ73r5PDjS
 KoKBX3bZUUTtJaGHlthYp9LbboTjlvX1C19XyM4ce+q6FWep1NAMemeH71vEOS+hXlNS
 kRiapzhtnO0x9opC9RFPPP8UMXdz+Mjp1BCRdDNOMR5cBKdmzaVgvCQDFc80YjixxFZx
 JexDlObfPvW08hVGoVJ/0amMIxdEqtji8ot5IVNy6nY3g48+5WVfML+lFFD7b+4O0kEZ
 THvskxKW8sdO0gc9/zv+aVSRf5x/HEMa0EzWwJjUTOJFUYqYfnw0enPRDR72JA5LWOJQ
 0EDw==
X-Gm-Message-State: AOJu0Yz0iaRtySHE2J0TQE9HTskNR/xI9pVqTKnstYerb5sP9eDBqMhc
 9AXaQltjxzoYJlK6bzcm7ZDkeTwCOYoTAlG0ba36p8BT6i13IH49naRE5fq3caY=
X-Google-Smtp-Source: AGHT+IGbr51RozlEceTw/4wKNvo8hmR6J1IdnMHUkKsnQG6xKcoPWLQWQeH1Q/3w11hGQOdfvdL1MQ==
X-Received: by 2002:a17:902:e746:b0:1fb:a1cb:cb25 with SMTP id
 d9443c01a7336-1fed3aed419mr25323835ad.40.1721896391372; 
 Thu, 25 Jul 2024 01:33:11 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7ff9086sm8595595ad.302.2024.07.25.01.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 01:33:10 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, airlied@gmail.com,
 daniel@ffwll.ch, jagan@edgeble.ai
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 2/2] drm/panel: jd9365da: Modify the init code of Melfas
Date: Thu, 25 Jul 2024 16:32:45 +0800
Message-Id: <20240725083245.12253-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
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

