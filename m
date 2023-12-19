Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5FF818D2E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F174810E1C6;
	Tue, 19 Dec 2023 17:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2F310E1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:11 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c256ffdbcso56765245e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005269; x=1703610069; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uClaQQ2dRjLaUKPRgkZZsqsXWCBLw2oyW3zHKJRRqCQ=;
 b=DMTYgQ/BiLNEO3KK0EcFab40wbYUFBxsvF139HMlTXS3BAxLLH7JH338h76biz2jLv
 6p2ifw1eTYWHzbC07Teh1yGu8kNfmi13+9Z1hn0O7M5TJou3ehddG888SxjkuX3RBjMN
 Oo+4XhwefTrz1jQcwr/dkAtNnEKEQrJfp/yUov1hRu4KNT3Isli7V0ukARAWVA3Xsawd
 Y1kQ92zd1R04QgIT//f8XXNYPueBRlG9mvkY9wxRn6LOxD2lsZH6j6UW3yN+ijlRrBFR
 auhVZswCF3xqOTou10jbKwrs+5uPMmN1BnKY7oZ7vZM8OHZhyvyG2WgyRxiOnoOwJUGj
 7TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005269; x=1703610069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uClaQQ2dRjLaUKPRgkZZsqsXWCBLw2oyW3zHKJRRqCQ=;
 b=f0O4cbRTFZnjOqXGwiPqOmUSvJi2cnTMTjS/076zJqjSpazXeFg1w/vWpEBL6/5JcB
 iTV1FmcexRrpkpm7Q3S1bk+NhHpZAk62DjdJxsnvdMNm2Gu2PDiW3RZDFemih8r3Wk2C
 M+EBCNUhyZyNT/e6CXiIEGRAzlyMOq1hMQxY4brfO/2L/7qTSONQh1Duc7ZK5B2NsOzd
 2/NUK3biCGEJVOtnEv+YVpuJz4iw++jEyQuTO+NSwc+7l/bmsRLMvr80O+7Rtj6dtZyX
 iExWiKau08iv2eXWKSSNRbBNcY/US1XZJ7U1r52km/LXy8nx92rVRSGfB7NZKFODyVKB
 ds+Q==
X-Gm-Message-State: AOJu0Yzj3C4hM70lh4gQOCvGqxxkDEAAY9ozg389aDvZ1TfqvzBOsHs3
 ooQxM0A8QkBAKYGCze1Utw==
X-Google-Smtp-Source: AGHT+IFjM19BzeJ7opBdpwxu2A1HFwreYdOm1l3GDNQQNs3Nw6kKgPMgszKGHl0AEjwpNwVYqeSAcA==
X-Received: by 2002:a05:600c:2212:b0:40c:6160:98f7 with SMTP id
 z18-20020a05600c221200b0040c616098f7mr5158875wml.17.1703005269466; 
 Tue, 19 Dec 2023 09:01:09 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.08
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
Subject: [PATCH v3 03/29] drm/rockchip: inno_hdmi: Fix video timing
Date: Tue, 19 Dec 2023 18:00:33 +0100
Message-ID: <20231219170100.188800-4-knaerzche@gmail.com>
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
 linux-arm-kernel@lists.infradead.org, Zheng Yang <zhengyang@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The controller wants the difference between *total and *sync_start in the
HDMI_VIDEO_EXT_*DELAY registers. Otherwise the signal is very unstable for
certain non-VIC modes. See downstream commit [0].

[0] https://github.com/rockchip-linux/kernel/commit/8eb559f2502c

Fixes: 412d4ae6b7a5 ("drm/rockchip: hdmi: add Innosilicon HDMI support")
Co-developed-by: Zheng Yang <zhengyang@rock-chips.com>
Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - none

changes in v3:
 - none
 
 drivers/gpu/drm/rockchip/inno_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 6e5b922a121e..345253e033c5 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -412,7 +412,7 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HBLANK_L, value & 0xFF);
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HBLANK_H, (value >> 8) & 0xFF);
 
-	value = mode->hsync_start - mode->hdisplay;
+	value = mode->htotal - mode->hsync_start;
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDELAY_L, value & 0xFF);
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDELAY_H, (value >> 8) & 0xFF);
 
@@ -427,7 +427,7 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 	value = mode->vtotal - mode->vdisplay;
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VBLANK, value & 0xFF);
 
-	value = mode->vsync_start - mode->vdisplay;
+	value = mode->vtotal - mode->vsync_start;
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDELAY, value & 0xFF);
 
 	value = mode->vsync_end - mode->vsync_start;
-- 
2.43.0

