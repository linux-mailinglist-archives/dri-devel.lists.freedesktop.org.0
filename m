Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95B99C531F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 11:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCD410E178;
	Tue, 12 Nov 2024 10:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q4GI9J8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5516810E178
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 10:23:09 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso901182866b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 02:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731406988; x=1732011788; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ezd42G+JwcNpijWol87RV7vPAsy6HdlYEXoioaZ3yUM=;
 b=Q4GI9J8nn23LGpN+5eq50R6UZbinmCkciIuT4af5yDMx2jd8F0j0guB5xi5fSu67Ne
 /+eOjsqmnb5Gnq0viHcRusKXB4vZ5klqY5TeSaH30qGHbdzwzs4RZphY3HEq197/9b9m
 Dgn1XmU2uvgf+QPsT7l33mVVm4Lb9GTFnO5qDg/J2Ya6xAXPnH4uRylEdNTZ9L7paMgW
 bMxk11IIojjEdCiCG2gZ3Mw0Az0W5vwAwSeC+ozDq8PJT2utCNKqXW00UwHK+qKYJ2mr
 eGpUmhXB6uwFQIu3VDkcurlMo4DBw3fyDvfIqfiTHNzEI8NGvddT2D3rmRo248Jv+uYb
 P0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731406988; x=1732011788;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ezd42G+JwcNpijWol87RV7vPAsy6HdlYEXoioaZ3yUM=;
 b=g838TBG+QERLwFqZ/76T+gH5ebGDBXUaZCy8pxz2EHHOOIeL3R4CNjl6UAy6oBXRvh
 8c9sPm4Ge5+R82rcOAEpi+Um2+Stsji2cW6Kn4p8mAp/1TA0KJWT/+ZcXXvaTYxswGke
 EVfhkFeqb2DhZAolRzm6C+eBsr3akudSOoFeQliB56uZqpyEyCCzgNLW8SQoFlLbtTYM
 uE0J+n6k2ew8eOF0nK3KWgIcROJHc7D8zv/RHxj4Xy8hys/Sf6W/3HIpz0DEGWBNe0lv
 h8lhR+nLBTx4v08pd7R5HZSlg9F9GfxSsJKbiI1p6eNQATz8Q4ESCNXrNXn7drgkAnuc
 luUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXELT6Gw7ftdzSdSKKrDgB1hY3OUL4wjUItVYLr2U7CTnJGoLMh4njWecILGn5i3IaSuIZAvT+A1Qo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydfxGi89oxfSnOFFPyra9zfKieKN4/jZn6O5GT987HEqfyNIJK
 4uGktNG52bUpitAoBV/XGqQ2XtH4dQ1xm75SH3B/iWaRr9pE28MZ4JBvVfrpWHs=
X-Google-Smtp-Source: AGHT+IGt4j9ZZSe9rgo5rLVKL7Sw0JNMnKYRedUbOwvl2VfIbz2NdhXaY+7ntI9ZFHojloYTONpjJw==
X-Received: by 2002:a17:907:7d8e:b0:a9a:14fc:44a2 with SMTP id
 a640c23a62f3a-a9eeff44f6emr1650475766b.30.1731406987590; 
 Tue, 12 Nov 2024 02:23:07 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9f08c9ae30sm394026966b.55.2024.11.12.02.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 02:23:07 -0800 (PST)
Date: Tue, 12 Nov 2024 13:23:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/bridge: ite-it6263: Prevent error pointer
 dereference in probe()
Message-ID: <804a758b-f2e7-4116-b72d-29bc8905beed@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

If devm_i2c_new_dummy_device() fails then we were supposed to return an
error code, but instead the function continues and will crash on the next
line.  Add the missing return statement.

Fixes: 049723628716 ("drm/bridge: Add ITE IT6263 LVDS to HDMI converter")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cbabd4e20d3e..5f138a5692c7 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -845,8 +845,8 @@ static int it6263_probe(struct i2c_client *client)
 	it->lvds_i2c = devm_i2c_new_dummy_device(dev, client->adapter,
 						 LVDS_INPUT_CTRL_I2C_ADDR);
 	if (IS_ERR(it->lvds_i2c))
-		dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
-			      "failed to allocate I2C device for LVDS\n");
+		return dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
+				     "failed to allocate I2C device for LVDS\n");
 
 	it->lvds_regmap = devm_regmap_init_i2c(it->lvds_i2c,
 					       &it6263_lvds_regmap_config);
-- 
2.45.2

