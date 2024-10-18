Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9E59A4935
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECB810E9C6;
	Fri, 18 Oct 2024 21:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w4tKjKmb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B22B10E9C2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:49:28 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso42937371fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729288166; x=1729892966; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=++kNX7bNku5QwEW8QyrZ4sh/fBENm2B/D5wgk1dPOsE=;
 b=w4tKjKmbi6DSVjXKxfoy8WZgbA1GXe2V5s9f6QhL7KjOXjaigk1X+NbxhxVtowsMB0
 nd6FozSKL/gTpHOupI1GvJmnCc5zw44rDezMzITa/xQgrQ9A2DL1l2PWRIToZWVONFYS
 CGBOY7Y+qTygPAyULGBZp+RTjaAkn4YftpmZYXHY8eRFUOR5R6MmTkwZnjGbpnr6xzn+
 YXdTOuT6wBz292F7iODyV/BF83tMUL6aZrpJHAQDbqjAhprpd5h9H6Z5FjuLdjswyHF+
 SI+652or0UPkHI4rk3JczjxfvSc3V5nYj4t4VgFrFjVxQlR97QYr663QLGuY4vsSqAFP
 hwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729288166; x=1729892966;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++kNX7bNku5QwEW8QyrZ4sh/fBENm2B/D5wgk1dPOsE=;
 b=mmSAKGBkwFLKszR5w6Dq2iWR/CPM7h3Qi/WSj2BbXE4YiwedikOviY0CFYBBgjOIyY
 wika+GJbwDFPbgQ4YODuP7xO7leTgfJkCZ5xu+a0oNI9dsyailHvlaJv6VBs5f1KOr/u
 i2jauwhtfXZA6g8ePfTsbD7I/ZCIkzEx9fv+NVP0/k1cy+0SZZTT8bnyQx2STlbLFZQZ
 jkT5tcIwl+DPS8LYEjKoNRlnz9TPNOZdGD5NfId0kznzC+4E6rHLSv/tbKJzGWxHu+4f
 fPnYTYjigmu56+ep0Py8JcIUOkEd06NqzF5ihFqEDNN72B0koytllXNPtuGcbEKoH5FC
 alqQ==
X-Gm-Message-State: AOJu0YzG1caC9LjdX5vGnIDs34cmqEFsWMdCvh0RW987+LXyu4kL2+Dq
 FaGkqaFfel17yUg6x+9r1Rn4lMpbYfm/dMDbWntc9FNuhaEe0JbCNkIlgI70YCM=
X-Google-Smtp-Source: AGHT+IEzY/SRAJiRek65ftXwRIaSZWszQ1TrTKHKVue2XD7qrdxALnnHFoS9HheGc0hNt3zatPurVA==
X-Received: by 2002:a05:6512:281e:b0:533:4505:5b2a with SMTP id
 2adb3069b0e04-53a15469bc3mr3671477e87.28.1729288166200; 
 Fri, 18 Oct 2024 14:49:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:49:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 00:49:15 +0300
Subject: [PATCH 4/6] drm/bridge: aux: allow interlaced and YCbCr 420 output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-bridge-yuv420-v1-4-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=djZfmDBuxlU0JNDnxFnHNPof6nNMCNv2DHOE5qEfzzs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEtfdxGkLweJv+OM6qHmNV/IfPe4ih05zIyoU7
 kJT9651h3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLX3QAKCRCLPIo+Aiko
 1Z66B/wOA1Y63ge3/9+ec5RRkm09oVvTET8CgLutvJicgnnXJpoD1xFAD9yeSZUxMm1JvpeCwUJ
 7/e85Jbgvnv0rT3m0G3RRigczR8IgIBM6sbVOwA3aGTAKEQdERPTHo7uO3ViUrNHtHpLEVA/GhK
 1H5b2Qp5xZP+xyI8bQD+sEWK49cJB6eEWw13zLPFj4VhFUtvpnG7Hmo+HbNLaShgegiXRUPxIth
 thR+rqDuF0nu2rbP+c3NaSwfcICzvALu405PAWooBekJ1qdYR/QzGQrHTvg8QBFwToKKLRi2sC7
 5J73pzZSvULsbl0/BUhl5RdsXjYT2zNV6UEcFPLPEOR0pnPV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

As both aux bridges are merely passthrough bridges, mark them as
supporting interlaced and YCbCr 420 data. Other bridges in the chain
still might limit interlaced and YCbCr 420 data support on the
corresponding connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/aux-bridge.c     | 4 ++++
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index b29980f95379..e3e95ccec1ae 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -120,6 +120,10 @@ static int drm_aux_bridge_probe(struct auxiliary_device *auxdev,
 	data->bridge.funcs = &drm_aux_bridge_funcs;
 	data->bridge.of_node = data->dev->of_node;
 
+	/* passthrough data, allow everything */
+	data->bridge.interlace_allowed = true;
+	data->bridge.ycbcr_420_allowed = true;
+
 	return devm_drm_bridge_add(data->dev, &data->bridge);
 }
 
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 6886db2d9e00..48f297c78ee6 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -180,6 +180,10 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
 	data->bridge.ops = DRM_BRIDGE_OP_HPD;
 	data->bridge.type = id->driver_data;
 
+	/* passthrough data, allow everything */
+	data->bridge.interlace_allowed = true;
+	data->bridge.ycbcr_420_allowed = true;
+
 	auxiliary_set_drvdata(auxdev, data);
 
 	return devm_drm_bridge_add(data->dev, &data->bridge);

-- 
2.39.5

