Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B9C81CDC7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D9A10E854;
	Fri, 22 Dec 2023 17:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4246610E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33679c49fe5so1698029f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266949; x=1703871749; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=soAjE8acoLO25uetbn7sq4B8XVGjHmzUhDkeJCVuw6s=;
 b=mXq3w3Ti9MSymLPjZBH5qT97a3sl0/2ixpoTIL+k3hQjFDZQOUCdY7Q5mua5slvPHK
 YiE2Tsi1wTZUOtWKWgE/MrliOb0S8r2OG9Qipgrmr1SKe8pwr3rg4d/7HRUSISwqmo+c
 617gCwFHYRzgya8cUVpJ88odOfXPz4nvavvaZ7Bk2rPWAx2PmEfbXynqPrkctME5V/oS
 T8XwN0eGNfyh6cmDiDi4c3SC8uPVBI8XsSeZvdDBBUVs2Vt7o6lPjdrZGY+5NHZx5BNV
 yupCnOAVOAd22vaj3XMHMcZ1BXH+Mxgm3T4HREkGhinRHaSjkrMwDe5Tv+sZK6/F2CPQ
 atvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266949; x=1703871749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=soAjE8acoLO25uetbn7sq4B8XVGjHmzUhDkeJCVuw6s=;
 b=GEKam955Ja5AiEH/ubRB8tdopHmKAx3Tz7N8ZQIdBPodfBoZrIGZ0STwu3HXEL54f5
 k4W9vVwoBBwDSuhtmJXF2htAt4h6UYJxQ2tLpBTUTVB5Ov1bSuqOuWYhn2B0Rvb8r5CJ
 xrkCIaO62T4OxgctFoIDNhjzbPaJ9n02WjaPP9FhC2VlN02pDYVxFpbpkNphTzc+Z/km
 evBS0r6uk8xtJAfJJyei1cGbwY2Yu8x51taEeKJKauGqjafmnYfpGmdWGydJoR/Zzenl
 5rbuL9svixSzmFyIs4JZv8xYE4O3VKhe6Zz4np3YHqqTcwEqS/orBCluwocy9zbhwUi6
 EOBA==
X-Gm-Message-State: AOJu0YytptnrcEK7G70JZNvXThKv9mi7msdedpca845f9hyeBpbu+7H0
 JJo2F8irRGR4fD3q38aiMw==
X-Google-Smtp-Source: AGHT+IHah4jnfoc/iQDiaH04TqQnyPss1cyXKoR1c4+dSrS+PxFbwT+bgS5fPTlfRhKEEGTVhCzfJw==
X-Received: by 2002:adf:8b1d:0:b0:336:6e32:3fe3 with SMTP id
 n29-20020adf8b1d000000b003366e323fe3mr1295901wra.54.1703266948656; 
 Fri, 22 Dec 2023 09:42:28 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:28 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 09/29] drm/rockchip: inno_hdmi: Remove unneeded has audio
 flag
Date: Fri, 22 Dec 2023 18:42:00 +0100
Message-ID: <20231222174220.55249-10-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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

changes in v4:
 - none

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

