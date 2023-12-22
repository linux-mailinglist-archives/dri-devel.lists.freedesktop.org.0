Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6E281CDCF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F88710E85A;
	Fri, 22 Dec 2023 17:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66B410E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-336746a545fso1256660f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266954; x=1703871754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVOgOlLPAvEr0sLISb9E6/KYZz//LU2ejxtiVGPulEQ=;
 b=hy+IIOIAc3MTqbcP5XDDj6bcZmzMzfDeG49fa0PVJ4mq7ZiTIt5URSvQ5XfisT752W
 vwNq1cDPrzXocRzhGfJjHhbQKPcNv2+enmrUuMzzyF9Q3R8/vvZdQeZV3IaWeFLjDi2Q
 vBsuOMBenz/MHBW2TtURmVBIDzPWXT694kaomJUU7Vimk6tlLuiq4pc2slcq+Vy98TwB
 diSsHglXCp31Ko5ytGctnK74qrI/hhKSdhn6ES0oZu2wF6Oy8itu40hbDa95c8suRQ5S
 Kl7TEqBuo9Y7tk/7B7uO4Q3AR/Ju4ZYRFJc4NLlSKzI9B3X2qSy1pnA7aw9sM38rOI2E
 gMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266954; x=1703871754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVOgOlLPAvEr0sLISb9E6/KYZz//LU2ejxtiVGPulEQ=;
 b=NbOjd2J3khHicEsjpTgqMS7OSM69g6AZfE4VtFte8Hn1oTLoQ8mlMXyXmotBY2Pcyv
 fBomHj3yWwVGoRT9ytLizbdTLagx0ARmkRmBDFFKIyr4uGvLicMurmmvUyx4RkDWeQOr
 eQmjtwJQ3kgVpqcqauvJJ3LY+iOGOihbgCpX+09WXl5UC6GIi66/Jl81GvBhDEaOitcL
 d3LFGzy4Hp++Qea7oENxKhig2aAFYmF+1GR1fHtp54QJQO3w3H5tfbZdp9gY8zAxdN/p
 U8T4+/Pemp+gLMNhk/hoeSYsm9Psv7lCUQnaPnZui7MPEja8V+nlOlGpbRlL7qyMNcyF
 coEw==
X-Gm-Message-State: AOJu0YwBGXUTiBv+bADNsvCpiUOvVgd1zQjrXGF+U2isXEFhLgwpsbNH
 21TFdn8pwq5vgSa1XwDVDQ==
X-Google-Smtp-Source: AGHT+IG0VO/bIXEiwSNnQQTPGjLRg14lP+2fe564PcKz/X7g3SD2+YUJXu7x0ci0ig2sXjCTtOJ87A==
X-Received: by 2002:adf:f74a:0:b0:336:8030:214d with SMTP id
 z10-20020adff74a000000b003368030214dmr748542wrp.19.1703266954331; 
 Fri, 22 Dec 2023 09:42:34 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:34 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 17/29] drm/rockchip: inno_hdmi: Drop irq struct member
Date: Fri, 22 Dec 2023 18:42:08 +0100
Message-ID: <20231222174220.55249-18-knaerzche@gmail.com>
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

The struct member irq isn't used anywhere. Drop it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
changes in v2:
 - new patch

changes in v3:
 - collect RB

changes in v4:
 - none

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

