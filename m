Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B49818D42
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBE810E4E0;
	Tue, 19 Dec 2023 17:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9F710E4D4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d2376db79so9388555e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005283; x=1703610083; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0WseMEHOavtmxykYRA2JtvMxiK/FtoaZXXQqi1uMlW0=;
 b=B6Z78D85HnJU3X0nixdMCagShJ0es8VSxk0mibRdDdJPgm2d22+w43meKKplptCNJR
 d+D73QiHOWJAmuKfPns1Xq3KLYNL70ZZ/mXlhCz0ptLq/9ZCmxk5VMlRYT62yGy/Qx/W
 3OlyqE6JVgNYjKLT9ydMQFWQL66Gfxx0UvnjLD9gmmRvYQhUfJS8neF3tbD7bX3yAXtP
 bWmTSD9447gZX6cwkx+PuXnaZnoCcHxUztsKjpkT25zsgdntcLI7QWQEPaoOqZ/+7+7K
 S3g8jV8nS60MMh8HZOPFDQl4S8M6idFZNCNI5nWRmb8RtNzs7VjyGe+GfVJNDwQU6pXR
 qTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005283; x=1703610083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0WseMEHOavtmxykYRA2JtvMxiK/FtoaZXXQqi1uMlW0=;
 b=MSbkT6jDQvHRtq26sEWxlbTKPoABLppo/kKFeJPdgwp+C+tzyP9FRVBnRPWgN0xnqg
 VtnG6DjaqciH6dFr4NdUwaey9tin904OMDWbTWtVlBq8iDFfFtLKWWHsZYG+EA6dkTn6
 M1FltsDQpS0OOPkmETmy3s/ATAfQ3DEunOD5dMAyu9CScOISt7qoDjx9pwUgeoEvSWGa
 DczM+IkkK3dMhGbCHiev8XQPCgw4tmTfbJHr4Rpmt6SVi1kZzO94psZWHpEqWtE4R3xY
 fdzz5fjgUs7R9rgR9QVcv5VNRml1ifL4lv5pcFefIFiGRHJWmPP35HD6pNxFCvZInRhd
 kySw==
X-Gm-Message-State: AOJu0Ywh02uCGKFTo70SMUgpSugNmpkD+2v4Bm2n0Ef27tz77O+PTbpd
 t/ZPACFu512gE2dzhf4SsA==
X-Google-Smtp-Source: AGHT+IGOZJZnOnuHfdIdouJRryXsfventVWMJzlbA9qGEmVPHmZahIRRyc0+LTqlmnQmmG0gfJFPiw==
X-Received: by 2002:a05:600c:1d10:b0:40c:50c:9f3f with SMTP id
 l16-20020a05600c1d1000b0040c050c9f3fmr10565023wms.95.1703005282571; 
 Tue, 19 Dec 2023 09:01:22 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:22 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 17/29] drm/rockchip: inno_hdmi: Drop irq struct member
Date: Tue, 19 Dec 2023 18:00:47 +0100
Message-ID: <20231219170100.188800-18-knaerzche@gmail.com>
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

The struct member irq isn't used anywhere. Drop it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
changes in v2:
 - new patch

changes in v3:
 - collect RB

 drivers/gpu/drm/rockchip/inno_hdmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 51c1a69dfcc0..138cd4287dea 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -45,7 +45,6 @@ struct inno_hdmi_i2c {
 struct inno_hdmi {
 	struct device *dev;
 
-	int irq;
 	struct clk *pclk;
 	void __iomem *regs;
 
-- 
2.43.0

