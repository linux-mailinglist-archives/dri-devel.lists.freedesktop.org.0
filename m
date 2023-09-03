Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68992790E55
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D29310E244;
	Sun,  3 Sep 2023 21:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7914810E218
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:41:57 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe27849e6aso1299617e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777315; x=1694382115; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQcAPcnsh/PX6lyiVXrbFZsnqyLcpAkILp56uQTeTQw=;
 b=zEtOzK2iGbNmmmWo7+pqaLa0CFIQBI0kBgUea7fc2dWFUx1VllyFAgxn5aa1hST1Ke
 1mNY/QjLuQBZb5hMZfsIvTPtKgWEp3qHk+/2WiuEytP9nfSLM1BsvV1m2MwFb0dTg7xV
 f+CfRgn+Ff2zDz/ZjmJ1EscldalBO8iXtOBdfgkVd6Za8BGP6NGRd9zbCCsAQIaIDvPo
 3lSrR7MHjgWr8djCEOeOGALmI6S/jGcO9injeH8sJ7pul5WNGSqQjlF2cfwO0kzt6LQ/
 kzhOkbu41nLZ/9kWXRxpG7wlMlo7lG5gWgVhTR9G6hl5N/n75lTGaz1f4OQhJc64ghrF
 j4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777315; x=1694382115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OQcAPcnsh/PX6lyiVXrbFZsnqyLcpAkILp56uQTeTQw=;
 b=RMvrOe6pnUCjlAecjkiPXFi2txbGqgJherUlcHp5FvyrzMmjL+dvgBQaDFdlxQrdis
 pxHo2bEDt99lF28jPz/IJ6+a2l/PhIPmVLQSQ0NBYQbj2BWwQyUrT08nBN96d/FxPZ8F
 EmeblGaqs/0/2J6uj8PEQuswF/wJX2qTl4ss8Ob2xdZI5MUKfKo7O6YRQi6mWp62xb9Q
 1Oj4iu5vh04pNx8pAhIibGsnTABwjlhUpDeT3gAxUm8NFWfc0Ejq4acE5FVB6F9zECpe
 4tHoGGHOa7SBSylsZslYqWByUYYWptj5Pgb7e+1sXlTCJ0nVAHa5fT+iI/CpnunsDwrM
 ueNA==
X-Gm-Message-State: AOJu0YzVut23jgdZnQfVu+DNzUrUiiCBq5Ftf4S7CiSogh72O/AtccMp
 SglMQ4NfKv9Fqb/8u3NdqePrVw==
X-Google-Smtp-Source: AGHT+IFpEl+oUE18/qsarFYaU8IntNTWUpC/nioDioEjFcJUMzzHif7+zO1awGEwu6H7kQPHIzxz/g==
X-Received: by 2002:a05:6512:2814:b0:4f8:62a6:8b2 with SMTP id
 cf20-20020a056512281400b004f862a608b2mr6629124lfb.46.1693777315799; 
 Sun, 03 Sep 2023 14:41:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RFC PATCH v1 06/12] soc: qcom: pmic_glink_altmode: fix DRM connector
 type
Date: Mon,  4 Sep 2023 00:41:44 +0300
Message-Id: <20230903214150.2877023-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During discussions regarding USB-C vs native DisplayPort it was pointed
out that other implementations (i915, AMD) are using
DRM_MODE_CONNECTOR_DisplayPort for both native and USB-C-wrapped DP
output. Follow this example and make the pmic_glink_altmode driver also
report DipslayPort connector rather than the USB one.

Cc: Simon Ser <contact@emersion.fr
Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index d05e0d6edf49..974c14d1e0bf 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -465,7 +465,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
 		alt_port->bridge.of_node = to_of_node(fwnode);
 		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
-		alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
+		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
 		if (ret)
-- 
2.39.2

