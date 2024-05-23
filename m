Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F0B8CD2A4
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CB410E397;
	Thu, 23 May 2024 12:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="P4v6B/Cw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BECF10E36A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:45 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-354f8a0cd08so1001510f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468584; x=1717073384;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tla+QFcP97ewfTbQi7g23xuxojyfOlpLXvPFzq8Qwg4=;
 b=P4v6B/Cw/51JzoQitCRb+zENstJdKGQABwDpBxEkJK35/Tvd9pTF9bTgtBlhEUCsXG
 5G/XHflFby8zUSNi15BNKAlf07UQPvmRA2mGrDC+7gDOebFcwY0YnxFUsRWwgzAOWDXa
 PJdGxM/nllMf5YCRQ25UJ0oWPNn1KWqCn75a5GKVLl5dEEKLCNQl0MRaZhC+v/8SZcV/
 oscO30PlLSdN5pjkiYAVY/yq1MEOCIpizlKp6un6XXd101g8b6eqpvnOMUufaBDe3TK+
 4VM4wzeVlLEIzWRzKS1miNNlxez/Dhekk5oOIjd6UXbM6GRKcQI04kiqyYkU/HTsfAGO
 6bZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468584; x=1717073384;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tla+QFcP97ewfTbQi7g23xuxojyfOlpLXvPFzq8Qwg4=;
 b=LiSnZu2pdRT+odtVki2LKDtooEmf1OQyBhuSzlsg7sKJUJq2GPnXsVgwCvzjq39VfN
 4Xc94/s/4yIxRXWszVLrDQrCvkSIJRr3knW/n1MIQcpkXm97lDBZlXAotIZWMT2Dl8tG
 gz+02oLjAMmYYKmctkJuZe3qOSBLbcHStQjH8ObHyDrM7iaL4PBwQlCcvupept2IUZda
 X29UEuedmZj3sHr/v82NlGmA/mxoEXlog8A+cn7mPMGu62/f0gnEGt6/oDbbxJd57YlT
 Z/YHTsdw7plpXZ1wb/sXuuX2hBisr8BO8pRMRC0xcoKnitLiTrW+zNAAnk/EU4XE1vXe
 mfGg==
X-Gm-Message-State: AOJu0YxjUWOHnYlzB68x/yvdlKBiQ9ijLdymiDPfiNNQLJ1PmbgiDIfO
 himZ7InlOADSlUDY+VKhUYhlUNpJhIS7jTRtQ19aiWOs+SCMoFxY+ovolq9FH8e9Mx4s6YYVlhY
 WDY0=
X-Google-Smtp-Source: AGHT+IFLhyC8Xpob3M3s4Cxdqi4ACW/Cye9oy07BDePPRH9xUy37KKFTstNcxwjc/zHabOXrMLcPSQ==
X-Received: by 2002:adf:ef8e:0:b0:354:f6f1:82d with SMTP id
 ffacd0b85a97d-354f6f10b38mr1729718f8f.67.1716468583878; 
 Thu, 23 May 2024 05:49:43 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:43 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:26 +0200
Subject: [PATCH v4 13/15] arm64: defconfig: enable display connector
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-13-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=693; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=lT6J9gv517qEQpypdtd6Iu9RcuwU5IxfY3HAdtX+bNM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTj7oyWFDNqOH2/emBzEE6Rhg5Wol/HE4THuRE
 L+4q3siJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURZ8LD/
 sFyC5Joy1O1vuXzM9ubKBm4QaSmd7AWbmjAQLbyxBipVHccFjqq0cUG5F1a0/awy6JyazMrSGvTeaS
 Pw2cJiYytxRFt9wnaU95dJR0iBlzRsHJv9LegsXbVeDQhDdFs62sQoE/GYZx7xXQ+jewDmloFf0x+B
 WEbrMNiYBy+mNfXPakQRAkudGwHFaNjOjrjo84cdxcFaRw/Yj2VPqNejmLW44onVsu0oPAPKY16LCd
 3nDGa5pH4RFvtmh7q2bgdMZG6+EpV8vllDQD4C8rLQtbbgRlSWT6x+1MP/RfAx5fRrHPaA2cu7i1cu
 4uJOHNHTkMWr5Q9K5UcfowqO45Ngs/2QCu7gR8fgvpkVTE/7MsWqIxTr2SMEMJ2HjFWbUAeTEvW4d/
 SGohMB3IfKQt54delkSDE7qZCiBDCG+gJ3kAXdgwzmZYE/bwcjGQsFMeACBnC/buhruAT1hsJpulFQ
 /+S4osrgiCBiBRgvg3tggDrDuUrX8RMsyapeXXdkWJ30m+monbTvWJdlFeZtjBrFvGQdP04lwgUtts
 k2DG79Vq8DhBvHCZQkvAxGy2mE5WGFVTsoq/QCpQmdds8beUX5EgAzb/WfSFYww/d03x/B0kpmyCmJ
 jcQMzsE1Hex3G6qXQQCVaOFOJBfr8fWMLYQVZ5eCN7ggFPGVFzCVfyXlh4Ow==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Enable this feature for the i350-evk HDMI connector support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6281975199c4..7dac8f92b0b9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -881,6 +881,7 @@ CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1

