Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104FC0C39C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4033610E344;
	Mon, 27 Oct 2025 08:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jBwUNIa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4724510E340
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:06:27 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-592fcf7a1ceso3300393e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 01:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761552386; x=1762157186; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cLWjaKLx+X0gG/JQr9xbszcB6rfPVQrK0WJygsJNUrg=;
 b=jBwUNIa/OvuIz5+M9urqhKBHzUN/sOtfc+ijcPVaejUyamRIG5x4gAPEy3lnPb+0JU
 x36u97CUOPUg7D1XBM9f5TXr9OG4U2MNP7Af1aSz9pmRa3CYluXj5Jw6cdGCEnzcV0pr
 n+GXw+b6haPKWE9rUeeNi+9tTq0bSH0uWnkpcAJnkq4cLvjjOjuBIoonEP+nw3bPkzOa
 ZluvBN6Z0MIMClms3BkQ3PI67c2zY9FeLCPcKtn91/xN4yBUFG9QakVKl36D6GPDpHoE
 NBfd0elL7kKLYQkV5nzOxJadY20L/6xe4wE67aDRYErJE4wPRJ2QwU/2HpasZBL4sa/Y
 fvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761552386; x=1762157186;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cLWjaKLx+X0gG/JQr9xbszcB6rfPVQrK0WJygsJNUrg=;
 b=XUgMMpZVJws2GO4y2B/KC+bXkGrkHQfd49pupe9WHtfAkYpEVW50Cksq/osdYzXCP1
 juXhEqDXyfYIBDzPH2OJ6wPf3L6yZGV2I7AUw7an3vS7VlpGSu9+p71DbwbTLtMhZWix
 2w9OZfFt2kbLkqTwMEGIDF/srlwRxFff6C5BVktHBWGx2uWRchZs6opO1cIlobcbqSc/
 x6NBXcdldJFI26KvgGAwT8K8W9KA2XcsHr5yHAGKVeakY/lEtNjT7bgslZJWkWSxb6Rr
 TSI5KIRKkdBCQ2HN0lXl/DUeisKq1+umiCmAoVfwAZNamW2bKA934No1fE4FDfGMpAYF
 RpUw==
X-Gm-Message-State: AOJu0YwQ4jrHXGQvqvd7xzsFuspTE4sTbyaH4t+s6J3OqXr6k1N9TpZZ
 d/Qv8c4sY4CA4X9IHTH6ZE0DhG1WMrrxYkZyryjzv2+UaeFKkNngi40l
X-Gm-Gg: ASbGncuhmh0IuCTYgkqKB/SLVNkLNoLjCPElUKcpLYS6/MXsD6QBLtM3D4hhxo0FpgM
 MxZS0wQ5afbHj3ZrpPYs7a3nuSu7tq5PPGpKyCUDbv/Z3O00gqmxEYNwaKaK4Y3Ib4otUbZcbd2
 5Ut5t8k/X4Y6MsZyJ8f3CNhnneae2LTk6BIU9iXsjQ9mo/FB498m0HcwxMXE+Bhyz2EVVwEQz9u
 QSF1tYPeFwVlmsoGL5Ti3emEV8epNYreg6zE6JXLborOl82TEDncktUm/4VLT+JM2vpXh10bc9Y
 fxsmrE2jNhGEZ5SaiYktuSimznVIEAl5rS+sKnjyL06SMlgoIn/JQrcXQCFH70QTLue0gxb+zGV
 rt2xHZ34jTF6xLYLCNa1dU/j4UOIZi8q5oooFSJ+wnYaVSBYZnFWZIiy0YVt8iUXPaAfRYbtck8
 WEGqx2aEfve1M2He+NxaHIXp7gcqQg6E5+oMUY1w4pCTyy
X-Google-Smtp-Source: AGHT+IH+aurWn18ayRrtNiWRdLqqMj+bLFYNr4oOdYqVnH8OIs+weAOzhle/Vj0N0XuWicoeo8Ozrg==
X-Received: by 2002:a05:6512:acc:b0:591:c8d7:c047 with SMTP id
 2adb3069b0e04-592fc9d4f1dmr3044117e87.2.1761552385274; 
 Mon, 27 Oct 2025 01:06:25 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41ce8sm2210689e87.6.2025.10.27.01.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 01:06:24 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 27 Oct 2025 09:05:42 +0100
Subject: [PATCH v2 2/6] drm/sitronix/st7571-i2c: add 'struct device' to
 st7571_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-st7571-split-v2-2-8352fb278d21@gmail.com>
References: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
In-Reply-To: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4484;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=LfOcWsXvHf24Rmlqiz3/HxiBo5dw0vDuG1TwXuVbpUw=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo/yfjwDnLYpkefFw8wspv86ZqWh7GZDBsJdLoT
 Um3JTZAYAiJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaP8n4wAKCRCIgE5vWV1S
 MtmTEACeFpCAFkUknPDpaoEYTuORZ3YCKbfDe6m73afchsg9qwSwf4jAQOXZB8KnpLOT4rc9kgC
 qmIS6JpWGJqAwi/uSGVC9cWTF+BZlnlXV2vIo5MPoISAwAgRuiZ3ZqViR4SHH+yB8/OZk8pREln
 3/Y8u8epGhjB7Y4d84JBvv7cD6JfZLDQUT4itSQSw4r8mccksim6hHd4hFNNCoU0LHQtKNL+gaK
 oBz9lRN2504QKfzGpBAZlTJJ+Pxhd8ZepPIkyY1UQTVnrVgvraam/bkq4SZ2IT3RtHt4VofU9sZ
 xqbqvAdH77PJkdRa/83x/8DrOTQqkFfTrxNJFtkfSB/kmpH1CSysZux8QhwFIc1+D/PJk0fROR9
 QujMlPCQHzFL0w15eoKa86244QWm2GY0DS4gc8jDYNeVggUqrs8Ccx7lm4vCuZzLyObDwbG48jB
 S6NzG5nD1lZwXNwP/ElhygkM3xUomK3ewmjcdzfc91eMpLGCrK7pbSYXW5GWLRvLV5uuJj2KaWG
 001oroV8d+vRP6n1/LInvl1bj6HScsZ4E5vRC4PeQHlDg8/5xw39pXN80NYPsyT1l5vRWtxPiD/
 1TNeL7xXLVb77nSCGhGIoBO1bQOu9HGxBGRD7zyv++c9N+6GDZEON72aPtrXGgWDq2FosKv7bBU
 Dc3zQQLkA8W+Mbw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Keep a copy of the device structure instead of referring to i2c_client.
This is a preparation step to separate the generic part from all i2c
stuff.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 71814a3eb93b7adf554da082a0237da371e5f5b5..2b52919d7dd434bb16aa66274eae8730649f62f1 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -113,6 +113,7 @@ struct st7571_panel_format {
 
 struct st7571_device {
 	struct drm_device drm;
+	struct device *dev;
 
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
@@ -741,7 +742,7 @@ static const struct regmap_config st7571_regmap_config = {
 
 static int st7571_validate_parameters(struct st7571_device *st7571)
 {
-	struct device *dev = st7571->dev.dev;
+	struct device *dev = st7571->dev;
 	const struct st7571_panel_constraints *constraints = &st7571->pdata->constraints;
 
 	if (st7571->width_mm  == 0) {
@@ -781,7 +782,7 @@ static int st7571_validate_parameters(struct st7571_device *st7571)
 
 static int st7567_parse_dt(struct st7571_device *st7567)
 {
-	struct device *dev = &st7567->client->dev;
+	struct device *dev = st7567->dev;
 	struct device_node *np = dev->of_node;
 	struct display_timing dt;
 	int ret;
@@ -808,7 +809,7 @@ static int st7567_parse_dt(struct st7571_device *st7567)
 
 static int st7571_parse_dt(struct st7571_device *st7571)
 {
-	struct device *dev = &st7571->client->dev;
+	struct device *dev = st7571->dev;
 	struct device_node *np = dev->of_node;
 	struct display_timing dt;
 	int ret;
@@ -943,9 +944,10 @@ static int st7571_probe(struct i2c_client *client)
 		return PTR_ERR(st7571);
 
 	drm = &st7571->drm;
+	st7571->dev = &client->dev;
 	st7571->client = client;
 	i2c_set_clientdata(client, st7571);
-	st7571->pdata = device_get_match_data(&client->dev);
+	st7571->pdata = device_get_match_data(st7571->dev);
 
 	ret = st7571->pdata->parse_dt(st7571);
 	if (ret)
@@ -966,20 +968,20 @@ static int st7571_probe(struct i2c_client *client)
 	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLING))
 		st7571->ignore_nak = true;
 
-	st7571->regmap = devm_regmap_init(&client->dev, &st7571_regmap_bus,
+	st7571->regmap = devm_regmap_init(st7571->dev, &st7571_regmap_bus,
 					  client, &st7571_regmap_config);
 	if (IS_ERR(st7571->regmap)) {
-		return dev_err_probe(&client->dev, PTR_ERR(st7571->regmap),
+		return dev_err_probe(st7571->dev, PTR_ERR(st7571->regmap),
 				     "Failed to initialize regmap\n");
 	}
 
-	st7571->hwbuf = devm_kzalloc(&client->dev,
+	st7571->hwbuf = devm_kzalloc(st7571->dev,
 				     (st7571->nlines * st7571->ncols * st7571->bpp) / 8,
 				     GFP_KERNEL);
 	if (!st7571->hwbuf)
 		return -ENOMEM;
 
-	st7571->row = devm_kzalloc(&client->dev,
+	st7571->row = devm_kzalloc(st7571->dev,
 				   (st7571->ncols * st7571->bpp),
 				   GFP_KERNEL);
 	if (!st7571->row)
@@ -987,34 +989,34 @@ static int st7571_probe(struct i2c_client *client)
 
 	ret = st7571_mode_config_init(st7571);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize mode config\n");
 
 	ret = st7571_plane_init(st7571, st7571->pformat);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize primary plane\n");
 
 	ret = st7571_crtc_init(st7571);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize CRTC\n");
 
 	ret = st7571_encoder_init(st7571);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize encoder\n");
 
 	ret = st7571_connector_init(st7571);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to initialize connector\n");
 
 	drm_mode_config_reset(drm);
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
+		return dev_err_probe(st7571->dev, ret,
 				     "Failed to register DRM device\n");
 
 	drm_client_setup(drm, NULL);

-- 
2.50.1

