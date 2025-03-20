Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E2DA6A1C4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 09:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7225B10E2CD;
	Thu, 20 Mar 2025 08:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v4r8/iss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CDB10E5A7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 08:49:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43948021a45so4239185e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742460554; x=1743065354;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gQeXTV1LA9vLFyUSPTOWos3fw/hNZwIQ/slXSCfXZO8=;
 b=v4r8/issWbv0oukZPF9ps6XgTDtWT4agHiUfQ0mSntw9c0iv5EL/uy8Ckjlo2qDY22
 hwqd1kod1NblSjsofWxDL7nRsaXA3ByqPuOWdiJowuodDGlMquk/UVPng5R2veCcWhem
 0rpYn1ZlpLzTdJof8LqGk/DwhIim0vO2/Iv+4dQVPMQvM8bx6loZUMPYaA4ICrP0gZ1L
 NbGvnlBCDgRjWYf8ZAKbY6c+FSBgPxuscjOJWRjE5tyTkzFXEepqv5c0AVIGFkOhtjH1
 hiWXkGtShGeOMPONgqBDyPNSHgqfXFBzUHfriRpSQw+lu8LK2RZaXUi25tGOfUbsa6aK
 TT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742460554; x=1743065354;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gQeXTV1LA9vLFyUSPTOWos3fw/hNZwIQ/slXSCfXZO8=;
 b=sASIeAbfI3/zY+Jqx3fXPjatWl4/pYmLvxHjzNq8zVlRkyLGjNtAzS0j2TRikmupl1
 Wa5n4EHas+Wp9ZY1JknhM/MLuVWwEQ1320GsHAyDmK+cYB6+t0RM1Y2kqR/xV8WQJgLx
 mbYCKVvny6Ww4q6ommEoVI8eWYJfFZ1XAxmztxJnRNz8TIPmuQavKDzkzdGj7mZPLr6A
 aNBm11S/KrApMChX12YJENw7X/BUUMw0gi/jIjL3Bx+Pos4hIGOi0ecjeKHtcWph15Us
 n4ETDZsNKCuhav0/B76Nth869u/79ugZlZ6YgTuu/yucojxykPhUr2De6pCNOUAYykik
 +gUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaxS7dujIzysXff3kx1SCsaaCxGuaHA3AJO1RoyXcokuQ20qzw+d4bd4wt/eLtNOBgp6pXbFG9/tY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZMA/ZGwWUAGNy4fYqzlgFPnZau1ciEjrIETwvfZ7zaKnrB2xR
 f/TPsDHpH9A0FRfTGk1oqx2BymLs/1XS/QcdtFpyEe6+i9RzA1mTVf5nSXnOuO0=
X-Gm-Gg: ASbGncsZLaGgTRDqPvhTWg379GjPqAqwGbzcggyCjQh532ygIAhhxMXdHoR2wuv275V
 Wqqc3L2yGON1Iq3cypmd5f1Hvg3xlYaTdxdYQnFIEEeV6Iw7Hmq7HbdpfaZnbwCQkDVBPkwtY5K
 R0pnDmhFVSKVFyDzAiAGLE5Jt+xNA+byQN6515cWyd/4JN02GbL+aqeLsCTT0NP7UgD8FXYfzH9
 dfxNykl7lUzrYarhISC+btw08xd4/5Q8KSwy0fP0+oMTUx1Q7k9t1A+jhxNuco0K4NWP/2Bsp9/
 Cz/TUT0QBfqO5MV4Cb4RG5LXDgeC9lNPmH/wf9XN9QO3m9tT
X-Google-Smtp-Source: AGHT+IH58YmM+Ar3OIBnrYDz72JB09Ne3XzaCC0yavAlSFgbWvLySke1g9L5Z6waa+wCIlyWCNTAWg==
X-Received: by 2002:a05:600c:5248:b0:43d:aed:f7d0 with SMTP id
 5b1f17b1804b1-43d495aba92mr15463345e9.28.1742460554194; 
 Thu, 20 Mar 2025 01:49:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:c11c:487d:c821:54a0])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdac9dsm41381655e9.30.2025.03.20.01.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 01:49:13 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 20 Mar 2025 09:48:45 +0100
Subject: [PATCH v8 1/3] arm64: defconfig: enable display support for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com>
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
In-Reply-To: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=ZusPf2YtjBEtNve2Icxs25V5Tl/ibrpsGhWI+A0KSgU=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn29aH6usGfN2/1gaTh9wKj+TSHgkhwQ2e617HVo3A
 T2nrw+uJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ9vWhwAKCRArRkmdfjHURarMD/
 kBEjarCQjoLriCSN2ub60j2k/Jqp4G5LTX4M3crHIEvT/AJ1/D0ShmhMqlAGFJqzIuOD/uTzvBCH4C
 bvY4jxUtPHFP/4FqhTFtCiB4ieeiipBTC4gDQ3iDwnQtJ3egvFXIU+TYQICa3/lds2dwg3LPfI8lYW
 kTmBMlwM/FxFnUZA//Onw6iJsbRzaKrvCZaHfmhIkKN8cXdO73g41J5uiws/LV9OioWmTwxioi3sfT
 yeQC0vJB+q0EmE5vnp499CedQpZWTJvw5dAGVOr6zP8fJIYS/LyWObKhn5t+mJCHol1lJ+Ty3dDXoD
 5tfUCbkzfXmiZK8Y+pzH2Yl+YSxgeZUyF5g4yS3gNaLO4/LHIsyfFPzqrN8Nu2/T+Vu8xf57gtRiTN
 yvlzEAOgC2gFD6lEdCls5eBIHksYK0ntvzYD7ykbnM9YJ9zI1amHZHpVw3tJ9lJn/Ko1hm9sgXLuKn
 OvS7nxXk6ABvpHrHXIHTttwaqOrMN2+kAxT8Si3Tr+A//FpFpOx+BNJs6CBZ1kaB9CuFFvYHJtvNwA
 GLfDzh1Kdf659ylFdqcCdiT0kjaEmujM+W2KwrWgohbdkT8f5pSvPl2HTVwIrxStU8MXgya8H0ksA3
 Rrn6wVEmTr6rmJmD3UfNG4LkSVcvwzH8JGPe3ChKA7ZNLm2ZbW0s1XUAoDZg==
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

Enable the DRM HDMI connector support and the MIPI-DSI display
Startek KD070FHFID015 panel to have HDMI and DSI display working
on the mt8365-evk board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e615863..1e2963a13500b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1

