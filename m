Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C703B48E8C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 15:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6997310E527;
	Mon,  8 Sep 2025 13:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m2y9qCV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CA510E523
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 13:04:28 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45de64f89a9so7512625e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 06:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757336667; x=1757941467; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4X5mW1qB7suLhxQR7vN67LmE2/9l2QgAFiGjCe5Ekvo=;
 b=m2y9qCV2uTEJA3vp7tdJuCcQK+Ty0LcsTtI9nOwHDHsNsZupTD9O96tq/eUF7pAYxO
 PQXIdPqglSVsIg8TxYOoSoN3aejKm1l4jBcaKY5W1zB0i5Trq+b7jqx3LUDafAmpXBBD
 C2ASDRQJMBwbN6AhZZ8KLUM4g38T6vbjQu3o5S5RVdL2CnPWhtlgBg8hZmB5EhnIwAmO
 F4YH4JaV3uNhUNRtrIHzGtu5p1XT1FAx2LtRYJIOR3wke3UqEEaVvR84apgbpemv5TeU
 VcAmuzpQsLPwxfDtwVLk06dOcaLghtMUSyP/bh0X+gHKaMHo6FORBNx43K2mHKuvMv7G
 +DAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757336667; x=1757941467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4X5mW1qB7suLhxQR7vN67LmE2/9l2QgAFiGjCe5Ekvo=;
 b=KKpbfRYr5TgJ7TSmf6zFUKXF4mxxslBgjzGYxIeUYwy91iU2NgSAoL3tjs+j2reukF
 aAyDRL0uCU3+Rl5YLHmw2e2YRw3o0cRjUi0a/CzNmZFKs9iLagaiwgKFs8Pg2oWg2EC4
 gFzhyttV8UI56XkJ89QvVHgvU1q1U1+a9HfKQkpHS5tYlg/3uFTXNzBJG3U+hgRqH6Ql
 h4LcTZMIBQuTa7gvQeUpRBu4kXoDQjkwwKG/PJbXpf8uJCDpBnny4W25LKFMYJ82WHgg
 ya7lIfEDwKU11B/6ZuvgCjD0BJn28h7MiSWbdhboOfFU6gKBBI3PrHF2AxX0Y2E/ptLf
 g5Zw==
X-Gm-Message-State: AOJu0Yy9srXyfc/AybjumhJ/dj85BgfphYT9EgedDPejPrR6VK821HTQ
 CklTYy167uO2zyAn6qB9s0fSzwk0BrwEfUyRp0RzP6oIAkrQSwHmtqlUiH4bFxzYiT0=
X-Gm-Gg: ASbGncvbnVRGKSRRSMtmkMhkKr2UDwsQFNe4MRmBnUJH7STcgX4P34izOfFM25jPwNJ
 8Ltj6wppNXedUnECf8JGAnWCH8pARBmmBqKStwMRAF19uVgDGQWP6rmmk6qcBDdOsZZq5owKBsQ
 wHHwY+xLfYQ41Nv4CTHrkSqAsqikSW6D5A03I6rJ7fOyND8U8zl2xbmNpisHw3BlN+WWTNk1pLE
 FZlq44RL/6HdJIVXtFr7Rip2Msaz1l670bW88XMhuXW8hjxtKW3X2V6Q8mK7h9KEZi9OVnsK64R
 MHW6xazB0NVzp5btJspuS05XjJQj+NwWSw4JiY9DmLr6eB4PJfObRkQkC4UgWtkBXXNEvI+tSyP
 BhInyAk7trpouFAK7y+Ws3Z073uu4TD9LD/gfQvCtfZ9UmVEMOtnqF3y0WGfO9bnU
X-Google-Smtp-Source: AGHT+IEGJNo8lvHD3KT1nd3z0SZyukocp+3vpAes2A8i8fYAVWbJ1r9NqWQEV9vNhvmGaNyomqk4OQ==
X-Received: by 2002:a05:600c:3b1d:b0:45b:8ac2:9761 with SMTP id
 5b1f17b1804b1-45dde20e5c0mr71641885e9.13.1757336666930; 
 Mon, 08 Sep 2025 06:04:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd6891d23sm145632475e9.4.2025.09.08.06.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 06:04:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 08 Sep 2025 15:04:19 +0200
Subject: [PATCH v3 2/5] drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI
 bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-topic-x1e80100-hdmi-v3-2-c53b0f2bc2fb@linaro.org>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=57wYQRJRg4ExArTqXm5cpG0+xrX0pV4cmaNg44EIRGY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBovtRWQc6EqvDQUILTPG2XMP0l4jGNYemvl7JX0cwS
 ZQL48r6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaL7UVgAKCRB33NvayMhJ0bWxD/
 9GOARmjbH2RhQfFuwESyv5NkmWCcN/CI2i9DNfY/SfhlryWRHAlztPNcY3o93MW3GOANYV7L0wAhTB
 C7qiw4uh10jFrOkhxeHewFGc55BdptV0ZuALp9fKoKpUSUvYU1rQ+jdgm0TJmWXoJUkrqbchBbMA4E
 pQsPkfWINXsZ3Km5s0bKu+j6e/2GfqhtLXnW07cjOEUfdr2MMNYK4JHrhU0iXSTtQMYh4txKmi2NkJ
 59htO8o93xz9hWLFoZWKKEyjm7SpZRZbwcwKN0Gfen/vSduFv/FNZYd5eDMbYwoqh7vSM1/pRhk5vg
 pnBHMDL+yg6zAvfBNvoSFPjqqTWlX8NySuam9JE1tluCspNls9s65c+U7eK+OKYvx/P5w3NGASQK66
 dNOGUz5/3160k52iVHpxgPdZMmVffGChGKctVoUbda98pR80nm2yEKmre/ky3IHog4ZqTBcIs2TU9u
 i2XqCudzV1iqvnxR70jMiGjVFp4yDTwq8ClGhFnkK6sfJwLfvK3wPjwYYhR5u/FSJdYmxyILYJgsBN
 cFvByrkVdDKR44TOtXhSXe7K11w2/z2u7pzCGzqrS8zpHXb/0BAqBpbkGDRPE3CT91hFnFlzd/6NCd
 lxp4tzknBJLQus3yJHTmE7pMiwLC8t+TXPiw+c1Pl4lu1eKClLhmFD8eYKCQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Add support for the transparent Realtek RTD2171 DP-to-HDMI bridge.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 1f16d568bcc4e0fb56c763244389e6fecbcb2231..e4d0bc2200f8632bcc883102c89c270a17c68d0c 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -266,6 +266,11 @@ static const struct of_device_id simple_bridge_match[] = {
 		.data = &(const struct simple_bridge_info) {
 			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
 		},
+	}, {
+		.compatible = "realtek,rtd2171",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "ti,opa362",
 		.data = &(const struct simple_bridge_info) {

-- 
2.34.1

