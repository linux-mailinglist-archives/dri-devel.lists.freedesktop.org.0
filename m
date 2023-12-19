Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE905818D40
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F3B10E4DC;
	Tue, 19 Dec 2023 17:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AD810E1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c29f7b068so52844535e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005272; x=1703610072; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qH39RMJfndGmJ2yo6EAj0TEb5im2nG8g4/g1kbQG1h8=;
 b=Tdre+LUg4oNNkLe1blaBg7E97HIaUBx7FTZ5jBpQIysRhUhiM2FrWGaY6FroiavGi8
 3tVTpXNSM+o3Ghecu9tZzMO7qfTEHmxuGfsNkOIOO+vfa9BjMFFi+DU6ZIGkdO5jo/zI
 wwaxxckbbRdAepNLRnjzG7GLZ0KJ2rwYGpfEg2lxip2EqpQ95TmqVq1Vqp/lL/zj0Zaf
 Pjbui/dq4t5L6Pa6XCKWDMz2ZHmLCneC6ARUm8BPs18W6IUO58JHsIqwF9QzALYrT/IV
 OHk7dbylkSX9s10M1e5Ujo2V7jqFv8KeNZNrsj7I1+SHzmLuUfIBkqYOcVjVBu5F1Zwx
 kk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005272; x=1703610072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qH39RMJfndGmJ2yo6EAj0TEb5im2nG8g4/g1kbQG1h8=;
 b=n7axJUg1j5SgC7sj9nH43z+48pAPFoW8OGT4VsX0tcE1ArkwcsVXibK3EDw8zgoz3N
 /WHSYbnUkoR6C2ps/b84gPCjm3U18HuZhJvCeDX+O7qU7K4C5rCQfiReBARLiyod1LtU
 /+CHHa4L2ZjhP0V075Ws8qf5VnnIxKTMlE/aRw6yzAXd6z26vqUkOdY/QZcDvS8L3bwn
 VecD9cB+ZjmebAsVITfLQF6Xgq4VB4mDviloO3pQHbeP6xB4v+a32IAryIi7UKAzdBtb
 4UyBdET/y8oqkD/47oYalg0f328i/K9aveQjmRtlxNoDq+lbHU7V9fzwmppHpkZd/8H3
 nBow==
X-Gm-Message-State: AOJu0Yw68XETmrtLPmf2VGGMIzBf3xregfi9ne8IMnp82Mr3kb4UmfdG
 ZbzgeyFoFcd/J9CMjRfXcg==
X-Google-Smtp-Source: AGHT+IGtFrexi9uVeaZK/6ydPyM1BX9m1o9MELmkYq+IF/YlCMbmQvGLdQPCk5LCS9UJ76GWt9oJsw==
X-Received: by 2002:a05:600c:b99:b0:40d:27fb:2f27 with SMTP id
 fl25-20020a05600c0b9900b0040d27fb2f27mr601599wmb.111.1703005271769; 
 Tue, 19 Dec 2023 09:01:11 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:11 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 05/29] drm/rockchip: inno_hdmi: Remove useless copy of
 drm_display_mode
Date: Tue, 19 Dec 2023 18:00:35 +0100
Message-ID: <20231219170100.188800-6-knaerzche@gmail.com>
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

The driver maintains a copy of the adjusted mode but doesn't use it
anywhere. Remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - imported patch

changes in v3:
 - added my SoB

 drivers/gpu/drm/rockchip/inno_hdmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 0b1740b38c7b..14d2ba92a606 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -62,7 +62,6 @@ struct inno_hdmi {
 	unsigned int tmds_rate;
 
 	struct hdmi_data_info	hdmi_data;
-	struct drm_display_mode previous_mode;
 };
 
 static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
@@ -498,9 +497,6 @@ static void inno_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
 
 	inno_hdmi_setup(hdmi, adj_mode);
-
-	/* Store the display mode for plugin/DPMS poweron events */
-	drm_mode_copy(&hdmi->previous_mode, adj_mode);
 }
 
 static void inno_hdmi_encoder_enable(struct drm_encoder *encoder)
-- 
2.43.0

