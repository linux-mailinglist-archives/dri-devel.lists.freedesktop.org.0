Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4AA818D48
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D8A10E4F0;
	Tue, 19 Dec 2023 17:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9B510E4DA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d31116dbeso618025e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005292; x=1703610092; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=arQ8xIKVUtWj1nUwdouDUReL6yFeDt+BlaNGpwFH10c=;
 b=IhLp59LJs9a9SYFLvKBN7V2QfURicuPTL47OHnhMYKjwtagqe55xcBSNgZXHroEdJC
 Ukry/73e3BveoPrrXKQDZCwIgN+9zVZccWFvf2DrND4HbFy1PuW02WIKqFimHI8lBy+W
 +BZwVriMwTv884PpQSVyMEDde7IbZ4W+vbsrJSGF6ZTxuYxZsD+HiItkdS/3MnHAlZYN
 7lY4pSIDWJN5nerl8yLYhBSa3ogRwDXFffUbWTzfe0KqGFhnG+pZ6ZBp9YnzXwHB6NFl
 FBdsQ2Dd1hZLn+zGBitytancv3Bw3DkWQ2Kp6kUmI/NjZTSQkygok3pZUYEjyDO05Ec4
 Xwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005292; x=1703610092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=arQ8xIKVUtWj1nUwdouDUReL6yFeDt+BlaNGpwFH10c=;
 b=RdgJkadROD7tvVD6jjcbqtnC4ooSw6SVqC3Fu4W1pB9tVyZu0fnDXGl++nU5roXUhL
 klCuvusnsjUwg5jtEO8TJEXQZFGaeqf7EfFaNuPteUGZytCKlk/K0Se3g0CfKk7/as/1
 D+4TknANd7dsIQN15BpWH7r5oGNqk3I/K217Uo2/2EYY/HydoAxOoBkF6PYlAPnUHNzr
 C2EsfR3D0dhX1ZXoGN+IEG9Vk8hhFQw0a9YNsIkx1ERitC7D0mCg8xBrxa64ZmiCdEx4
 m+LOMSKfr1lOshzsE6xRvY2pdw3/pX3ue+PKCzXcYcRcyjPSPqFvPD2zMqirld3QmExP
 6sqw==
X-Gm-Message-State: AOJu0YwBuPsNVaTHLlCoVH24pASCPSIG6pMxDr+DJNBV/ibldEkEdRBS
 QsrzmVSK68wxq/hJrd8LdHhRf3PgsA==
X-Google-Smtp-Source: AGHT+IEm8HS6oHyVinKk2y2E+36YVQQ/TKqJ6BvNP4pRKrkPrVlgTtkIQOEcQo7tQa1nD+AR7BZaTw==
X-Received: by 2002:a05:600c:4f52:b0:40b:5e21:d362 with SMTP id
 m18-20020a05600c4f5200b0040b5e21d362mr9931502wmq.107.1703005291752; 
 Tue, 19 Dec 2023 09:01:31 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:31 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 26/29] drm/rockchip: inno_hdmi: Drop custom fill_modes hook
Date: Tue, 19 Dec 2023 18:00:56 +0100
Message-ID: <20231219170100.188800-27-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219170100.188800-1-knaerzche@gmail.com>
References: <20231219170100.188800-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have proper pixelclock-based mode validation we can drop the
custom fill_modes hook.
CRTC size validation for the display controller has been added with
Commit 8e140cb60270 ("drm/rockchip: vop: limit maximum resolution to
hardware capabilities")

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
changes in v2:
 - no changes

changes in v3:
 - collect RB

 drivers/gpu/drm/rockchip/inno_hdmi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index a2a9e54b76c0..29a2c1b87294 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -631,13 +631,6 @@ inno_hdmi_connector_mode_valid(struct drm_connector *connector,
 	return  inno_hdmi_display_mode_valid(hdmi, mode);
 }
 
-static int
-inno_hdmi_probe_single_connector_modes(struct drm_connector *connector,
-				       uint32_t maxX, uint32_t maxY)
-{
-	return drm_helper_probe_single_connector_modes(connector, 1920, 1080);
-}
-
 static void inno_hdmi_connector_destroy(struct drm_connector *connector)
 {
 	drm_connector_unregister(connector);
@@ -691,7 +684,7 @@ inno_hdmi_atomic_destroy_state(struct drm_connector *connector,
 }
 
 static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
-	.fill_modes = inno_hdmi_probe_single_connector_modes,
+	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = inno_hdmi_connector_detect,
 	.destroy = inno_hdmi_connector_destroy,
 	.reset = inno_hdmi_connector_reset,
-- 
2.43.0

