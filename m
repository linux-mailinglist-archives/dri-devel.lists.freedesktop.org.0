Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEA6818D3E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC9810E4E1;
	Tue, 19 Dec 2023 17:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE07D10E1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:11 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c41b43e1eso60607315e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005270; x=1703610070; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdMgjNjNBTOoBWK3IcfrwTBNKKERl2lF+r21sur0UJs=;
 b=UrJY4J8yXLmfuoJxWHg+tipHlCIyl0x79lqTJ7XPIt7ATBH75CQEIgdn2E2nzqo28H
 jCIriEApnPREdJTcm9A2e9yWHZaREl/cJ9aaIzwQAse3vDgYEN7hGw2wnU5fmuXrWXGM
 RM5/rujxa3WhQJzfLU5hl+4v9eH4DdxghsGFbb1qcEDG885w2X43ZAaDwe3XW3EhyxEX
 g1Z9vh6cZzHmd+PSkym6HSqzqMWRL5wIAqNWLpJvpPz44Yp3jt6WxlbUf7dnzRlCygbM
 a6RX8pDmUSIrmgIJeaJ45qDFprSaK1qPHYdFADtqXe2G4Dx3yFQ8e8v9TzUIf+nYpCeU
 J5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005270; x=1703610070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qdMgjNjNBTOoBWK3IcfrwTBNKKERl2lF+r21sur0UJs=;
 b=W4/eMkNK/xpAnk0bV7ipZbPvgQDrv7pR0vQXEdDyVjxk8hW30sr/AtoS+Gxl6oVlpH
 cgrl4G4npL3DASm4ComCH6WTCGXf4+Y2fIu0Zm+HrxO8B/jxGy4IypwTbOlbeFshHm73
 FJwQpi4wZQt7TMhNtCBjNEBC23prw88hJzNDnvPNoYHrOao8UczyUUw7M9P/qE6L3mMJ
 RmyGXv/+IXhVOwStFOD7w764jMcxiuUooFwdTHFsGAxPgC5mkI2YpszQLAMm1MxMU3fX
 M6Ps9dRz5PRG5BQ3AusYsOg8MhxumoXG8Pk3xP9IE2T+o8lG4O64CHHy46Dl6DKFhJv8
 LLxg==
X-Gm-Message-State: AOJu0YzZADYi94oG7vizYo21SeQ+9TGbBiTN/MM7F/GK0Lh7FDULN6/O
 QC/MuWOO73RwcDank1GGJw==
X-Google-Smtp-Source: AGHT+IEkfFJDXwsv4Zfxm5NA1za7VpADdznfWYCyodddd8eXDeufpwxwQM+20Je7C3cazgS46y7cEw==
X-Received: by 2002:a1c:7218:0:b0:40c:317e:7cb0 with SMTP id
 n24-20020a1c7218000000b0040c317e7cb0mr8717116wmc.158.1703005270277; 
 Tue, 19 Dec 2023 09:01:10 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:09 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 04/29] drm/rockchip: inno_hdmi: Remove useless mode_fixup
Date: Tue, 19 Dec 2023 18:00:34 +0100
Message-ID: <20231219170100.188800-5-knaerzche@gmail.com>
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

The mode_fixup implementation doesn't do anything, so we can simply
remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - imported patch

changes in v3:
 - added my SoB

 drivers/gpu/drm/rockchip/inno_hdmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 345253e033c5..0b1740b38c7b 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -517,13 +517,6 @@ static void inno_hdmi_encoder_disable(struct drm_encoder *encoder)
 	inno_hdmi_set_pwr_mode(hdmi, LOWER_PWR);
 }
 
-static bool inno_hdmi_encoder_mode_fixup(struct drm_encoder *encoder,
-					 const struct drm_display_mode *mode,
-					 struct drm_display_mode *adj_mode)
-{
-	return true;
-}
-
 static int
 inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_crtc_state *crtc_state,
@@ -540,7 +533,6 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
 	.enable     = inno_hdmi_encoder_enable,
 	.disable    = inno_hdmi_encoder_disable,
-	.mode_fixup = inno_hdmi_encoder_mode_fixup,
 	.mode_set   = inno_hdmi_encoder_mode_set,
 	.atomic_check = inno_hdmi_encoder_atomic_check,
 };
-- 
2.43.0

