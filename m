Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F13790E78
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199EA10E251;
	Sun,  3 Sep 2023 21:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327E710E21E
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:41:58 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5007616b756so1449295e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777316; x=1694382116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQu1z4f66ZLko+rKDaNEqwlYcOO6KOPqUNdRGmTYflk=;
 b=rqK0ozHC0sLLK+cuvMLmGCDbDgPXYhs0stHEugEIlVCOBO+4CPy/uGFfISjnzcSRmw
 ND6uRhaxssyOxKTYafRR7+v7l4VvlKH3LEkJej1fEuI6efjuY4qs6HPRHzMFDdskBU+D
 rrNY7YaBhuULOeRTnryRjlimfie06oRtRB+53ScUKIsy7bhhS7lwQJxdGzsb6DQIlTiu
 dLZ6Qjti/mWduzKNJOUcrF0Oy2eNJTRkClvXnTXD/gguxhHV0HuGLwOZn8CyPhB/ILF3
 MImzkPxM8R/Lnx2+HK0fwz/2ECy70C+RiRQqagcrDRJn4Kd0LdhODIBYIonRtT1AjD+N
 eqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777316; x=1694382116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQu1z4f66ZLko+rKDaNEqwlYcOO6KOPqUNdRGmTYflk=;
 b=ElI/pxR6wfZ3/BtqVpESVkobj4EGPdO0zG5cs8E4Z/xXsCrllaMrSA4e/nyGkoWYcG
 T6LadcTVhCbxQu9WENlriPqb6EhW1iPPp9UYKXf3GDxYjikbzdxCbX03DVfpMbSiorz3
 zpTlJe96hgOe1MgWFvv+GGMtj9wM2G52fOwfpcdbio9+j4UKjN/6jAtc/b+OM3gAPvjA
 Z53Et1Fyqw3YQmUCA98BRm8ct80sH4YszxDkgrKtdD++wju1leei67YT2U8XZI2kb0fO
 rK/5dCOAX26PFKSFD6uFjk3MRpYK4JDsgb7jo7B/+PCnq1XyaCWPwx1jfDB841EFgLTA
 +R8g==
X-Gm-Message-State: AOJu0Yw7loKSz5brcv8BcUUHKeqSf9mHNizhj/yxposAH5raMc0Oi3Ra
 5mmZI9SgyK/UYhWLXkFc8htAvA==
X-Google-Smtp-Source: AGHT+IExVQuQX3Gj81jbZ+R6ySGMUAgWZnxuPMcXW9RME/R1Qx0IzJskMS/e3HZRFl9o1BgsPXmohw==
X-Received: by 2002:a05:6512:34d0:b0:4fe:85c:aeba with SMTP id
 w16-20020a05651234d000b004fe085caebamr5162568lfr.21.1693777316523; 
 Sun, 03 Sep 2023 14:41:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:56 -0700 (PDT)
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
Subject: [RFC PATCH v1 07/12] soc: qcom: pmic_glink_altmode: report that this
 is a Type-C connector
Date: Mon,  4 Sep 2023 00:41:45 +0300
Message-Id: <20230903214150.2877023-8-dmitry.baryshkov@linaro.org>
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

Set the bridge's path property to point out that this connector is
wrapped into the Type-C port.

We can not really identify the exact Type-C port because it is
registered separately, by another driver, which is not mandatory and the
corresponding device is not even present on some of platforms, like
sc8180x or sm8350. Thus we use the shortened version of the PATH, which
includes just the 'typec:' part.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 974c14d1e0bf..a5b72046caaa 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -466,6 +466,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->bridge.of_node = to_of_node(fwnode);
 		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
 		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+		alt_port->bridge.path = "typec:";
 
 		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
 		if (ret)
-- 
2.39.2

