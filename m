Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC349B0AEC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C8910EB4D;
	Fri, 25 Oct 2024 17:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mOHjpNPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC37B10EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:33 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-37d70df0b1aso1770650f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876592; x=1730481392;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yUMbW8c4fnS4xc6t+S+xmsFii0Nh8WSEhqluNBn7tHo=;
 b=mOHjpNPZUZ0GiqPIXiKrfBTRSwan/n/JI6ns3jX0ld8Lc7MrieqW8UNDY4cMQGz5KN
 PRhyBUSPAt8tmhTuJDlsiY6JqbxXUV/CehT5NqmuRGmgIE6DJrMRUNr7okjxS3xDbfs4
 D/6JlFqCrL3akO4mYzKUIHUBdbCqVJ07f1R0ihnPE58nSUufvQLuOL+1fiHGgVL7PGcO
 TuEhWgYU2M6HCYwBV0nFTmPGgDLChhhPAwKrzRHjg7utZdc3Dbs6+XHxAxA14n7FbS4s
 0Cqt5wL+ajIsJdrzxtxlNya3QqNO7FYw3asQNaFrCTDprxax6X/LW9/BR7NRLjaxt6AN
 yFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876592; x=1730481392;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yUMbW8c4fnS4xc6t+S+xmsFii0Nh8WSEhqluNBn7tHo=;
 b=iDjomFV/WbgI4fiI3mYtPUSXX543fdmEN5VB/0WrlplfK9IS59BucjcZkHimFXqnEY
 dfwWBBIjsjgbOUkOKVuMyzRr1yath7t6YExXHAiKyFXyzHKXpw+3xG60aror0AzBtU6O
 RKcCaetw/XdYR88BnADJyKbjhSLDks5FaeFsn2FO8vQZ/nzENTljYOnDoS3xtrBWXHC1
 0h2Kg7gTncuDiIsAyFH9/7UvmreYMhFd6RofatpYvVkMcDvRKM0QAghZUAF+rZ64ODnD
 NIEffnnGn+ix/yjPQA+oaM2OAxQ0sJ+nc0LOF5yJwwteeCe/9q0uZZJS3isbR+w7MQsR
 T2Gw==
X-Gm-Message-State: AOJu0Yy9B9/BGnAcD79GUOt5qoIhW0WrN2kXM6Ha4XjHXARvS+Vdh1+/
 Qmfylyl3262PZTBBVjhEZcUDV4hQ6BoZZ+L9vNW2SkhgXvECwuWSkgEbVxcNHsw=
X-Google-Smtp-Source: AGHT+IGlWiJn7Ozkgg+McXgEdyvgzuVLywKtK/tT5oVLgmb42gKrNvsGZclRa3uCRrKPuzJCn2aCmA==
X-Received: by 2002:adf:9bd4:0:b0:37d:4e74:687 with SMTP id
 ffacd0b85a97d-380611e1392mr111275f8f.41.1729876592186; 
 Fri, 25 Oct 2024 10:16:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:03 +0100
Subject: [PATCH v2 32/36] clk: bcm: rpi: Create helper to retrieve private data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-32-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

From: Maxime Ripard <mripard@kernel.org>

The RaspberryPi firmware clocks driver uses in several instances a
container_of to retrieve the struct raspberrypi_clk_data from a pointer
to struct clk_hw. Let's create a small function to avoid duplicating it
all over the place.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 9f716b2223ae..b12d86720207 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -56,6 +56,12 @@ struct raspberrypi_clk_data {
 	struct raspberrypi_clk *rpi;
 };
 
+static inline
+const struct raspberrypi_clk_data *clk_hw_to_data(const struct clk_hw *hw)
+{
+	return container_of(hw, struct raspberrypi_clk_data, hw);
+}
+
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
@@ -176,8 +182,7 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 
 static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -194,8 +199,7 @@ static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -211,8 +215,7 @@ static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 _rate = rate;
 	int ret;
@@ -229,8 +232,7 @@ static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 					      struct clk_rate_request *req)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk_variant *variant = data->variant;
 
 	/*

-- 
2.34.1

