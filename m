Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F25FF818D36
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEFE10E492;
	Tue, 19 Dec 2023 17:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5D810E1D0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d05ebe642so17225035e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005275; x=1703610075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SMIbD+dY7Kjgg6ECXdMxWD6N2Rzqy4kZE/eQIX1m8rA=;
 b=Ul8aV2IzAeGF0g+1yUAAvdySY144U85fVBAD4nm0BAdWUf2y8pp4mW2T3rXY+PdVKf
 LpH2hUirJzqxxCuh5zYzzUDt3OZZUPUBN36sa63SXWZ7zQ0UejDaZxpAET8/+ugEwiJR
 N1i8cdtTXYRXNQDfmiaodohKcaV3EUibaJqvUDY29a6chZknKpM1JlgEtPppsK6OV5Y8
 joOJKW5PUSdhtDNJiwHIJD1+6HOOUzk/b7piPtAe5cRwpWvNIr3TOtilT/KdjRh6dDGk
 NZ1lvDEIPBdrMut4iTZ38YcCx27QinZ4nB1hkRGyHjcu3FmENJ73kVgvqsg+SCQPjU9w
 0/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005275; x=1703610075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SMIbD+dY7Kjgg6ECXdMxWD6N2Rzqy4kZE/eQIX1m8rA=;
 b=VXzuYNejld75Sxgketp1KK3cnNJoi4GPENLXxMDT0RP26l0QIVwrS0+AP7TeNxKGcE
 d8lIqTLTvQLBh3ts5VjFKvOk182vueO347dWRpqRvIYbbeqOTHi1rGVqIyUyW03g2Bzp
 RB9qKxNfhU4M6skwokPegXmC7w+tGa6Tu50C4pCJwdVAFOU9k2re7fzFkHSqQ1rCcVAN
 WPzz750EWyS2HvF6xa0gDyZCURLgThNeXOoz1k3KAR4Au6WDv6+ZgO0QyliZxK4sZrxm
 AXfFJEZx5CKkAHFCTp/UTD2eyWTcevb8dygsCDe8D689i7jEXzFWoVn8k1lmv0NNgVKy
 YpgQ==
X-Gm-Message-State: AOJu0YxMdcS8H0wy0Bo6HdV4yk9DeDhrnYmW+f3CXs8RzVHXksiU4h4z
 FKuAySOec8WypBnKF/Gu6Q==
X-Google-Smtp-Source: AGHT+IFd/r09bOpDmnqqwNJVgTHnXa/6FuakfAQjMYF9yiMWHDt7k1Pyk+VRkFPu8kUv7M2V8n7jSg==
X-Received: by 2002:a05:600c:6988:b0:40b:5e4a:233e with SMTP id
 fp8-20020a05600c698800b0040b5e4a233emr768909wmb.64.1703005275517; 
 Tue, 19 Dec 2023 09:01:15 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:15 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 09/29] drm/rockchip: inno_hdmi: Remove unneeded has audio
 flag
Date: Tue, 19 Dec 2023 18:00:39 +0100
Message-ID: <20231219170100.188800-10-knaerzche@gmail.com>
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

From: Maxime Ripard <mripard@kernel.org>

The sink_has_audio flag is not used anywhere in the driver so let's get
rid of it. It's redundant with drm_display_info.has_audio anyway.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - imported patch

changes in v3:
 - added my SoB

 drivers/gpu/drm/rockchip/inno_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index d99896f1a73a..58aff7a9c09a 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -28,7 +28,6 @@
 #include "inno_hdmi.h"
 
 struct hdmi_data_info {
-	bool sink_has_audio;
 	unsigned int enc_in_format;
 	unsigned int enc_out_format;
 	unsigned int colorimetry;
@@ -554,7 +553,6 @@ static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	edid = drm_get_edid(connector, hdmi->ddc);
 	if (edid) {
-		hdmi->hdmi_data.sink_has_audio = drm_detect_monitor_audio(edid);
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
 		kfree(edid);
-- 
2.43.0

