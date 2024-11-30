Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46B99DEE68
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D700610E0D9;
	Sat, 30 Nov 2024 01:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="evy+WIjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5C110E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:52:40 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53df1e063d8so3074806e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931558; x=1733536358; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rL+Q+A1E5WdeyWGlnmxBrdioN3F1q14QakvZcTSmWyI=;
 b=evy+WIjEUPujaboerNiJEFYqDLISl/SpBWO+v0OP5V2/GG0dXbvnEOkmjAImZaGU14
 lN2gB9fJ2kBIBsR99k6b1jxKVB7hQl6e9TGYWJsm53tIHmaR8k1zXpmZrwkucW5bqfHN
 ejCGiRupC/L0Ge9G30wKa0cWaw5dRRJp0zFqLN7LSVCmS+UwjJUC3eQ6aU6nQkP/KdLC
 JOh7gop2o2Zd87NIM3rciWbjthuhSSZnjFuOR62Q+iOeWR4tvUHq7pHw96XFKySwnhTu
 d0sA1M4QJt2bXC5Pvp998RUj8R9P0x32Ct6ke9RhZ3hjmFtFa6/ZrN5f1tRXHcYTcDzZ
 PFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931558; x=1733536358;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rL+Q+A1E5WdeyWGlnmxBrdioN3F1q14QakvZcTSmWyI=;
 b=IhY/W+k90Vhn4fOLXwQKWNiAXo72M89jlroMnvGXvGmfQ2dcqyQlnTC72QO+C5BmJi
 /VO+6BJ8f+aZCZyg6LmgV8475Haz4p2KX1TU37iWOk71A/FUyRYUZv57Dy/g+uoo5jiv
 o9DEJtYY7wfqURk00Ud09edocJTm4oc6fHmPuPkWgrS2FbXkbYKilscQPEX60HSepqQz
 3mffYQbWSFUO0N9sS5M7JUpnTfwt17rwo283A3TxJNAaPqILUA+Var7aAnvaPluBu6vp
 NMD5umV+s1ZC94yW/oel/vTBkXFsTPrVvKYMS9jfoqrp4sPZWmKP/REvI/5a5eIMX9K+
 QtoQ==
X-Gm-Message-State: AOJu0Yyy4da5oYe05B89dkq9QzAeTmz+vKwHJIiZ6G09IZda6XE18vmi
 5VOlRaIw9otxAaC/bSTzydKkUkVeMpWnluavADNxids0VM9p5S8soIja5Q5bTiw=
X-Gm-Gg: ASbGncu1Yngwaq1hI1xgvx1WFtFeunFGDGiNIAGZgFRm2BY9v4Bgo9Yw/JtDIdPjGQb
 +85tmEf0yanbpRNr6YRX1MXwY2iTH9iF9LQH4hVRDVgKxqMjgW4DFHwCh8ud0do8+hiEplW5lC0
 ldmPubbFTN5XdEDK1wBvulREGPQ6WAbLcFWBeH+tMJg4u1Gy/Q71X1XEFGJkjKSssLaNjxDpx30
 L0Y7Jbx5RR5nJfAyzFUuBbZJhGNYXCfqLTteP1P77K4lQPfU70rwerk8w==
X-Google-Smtp-Source: AGHT+IGVvdf1lO5fwuFWw9xeRiergMVxDBWPVsqq8kgBU3WEnEIe51FT1/PQjZaCSi/PMkMqSKbTIQ==
X-Received: by 2002:a05:6512:2822:b0:539:da76:c77e with SMTP id
 2adb3069b0e04-53df00aa234mr9021742e87.5.1732931558219; 
 Fri, 29 Nov 2024 17:52:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:52:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:26 +0200
Subject: [PATCH v5 01/10] drm/tests: hdmi: handle empty modes in
 find_preferred_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-1-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rXzXs1LIiHZL8UtREKepdy9gjR2Nvrl9SsrJH4c2YZQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/fBLnvkUW9qRbw575QavDrP72LTHBm1NxMz
 85M4Ziti7uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv3wAKCRCLPIo+Aiko
 1dv7CACoQI2bC+09l2FHVrI7eITxhbdZjhlH6ypKucApGgA2wGe3crPMsMfJbwgJSJY1noUUULK
 YusunI4AlPgsBei8HxSGMe41Mk0z8AcWabq+XcdFbHG9aaY7Q+myFSq3c3F2ErXzjv0yWu8DFBA
 8oR967KFGvjLLSa7noPp/Moe5zrDoJaVD7HriBced36KzyqZLROp652AKv+6CpC+rsOt/T1NK4L
 CNXvVqRyV1Adpa4JZASWt/Yj/xDR+/FMfqRCCdFJLQPyN9uG1m4rChL+TjewMB99voI2nIaImHt
 /oXkkNBHtWoZFXDTAnJws5tJU/s1zd70ka0C29pX++CTpwbp
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

If the connector->modes list is empty, then list_first_entry() returns a
bogus entry. Change that to use list_first_entry_or_null().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 294773342e710dc56772f839c2db9c2e487bbc1e..1e77689af6549f162eb3026c7bd2bbd59516ed98 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -46,7 +46,7 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
 	struct drm_display_mode *mode, *preferred;
 
 	mutex_lock(&drm->mode_config.mutex);
-	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+	preferred = list_first_entry_or_null(&connector->modes, struct drm_display_mode, head);
 	list_for_each_entry(mode, &connector->modes, head)
 		if (mode->type & DRM_MODE_TYPE_PREFERRED)
 			preferred = mode;

-- 
2.39.5

