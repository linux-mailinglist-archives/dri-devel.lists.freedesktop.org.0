Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9787EAA6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 15:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8C910F7BB;
	Mon, 18 Mar 2024 14:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GGFPw6Fr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B0110F7AE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 14:16:30 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41409fd8b6eso18124635e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710771388; x=1711376188; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6hoHJPzKivMW1yEjOBGD1bftC6F87yAj85WAtXr98Do=;
 b=GGFPw6Frw4nF87PJlrT+RvrtKd1IPAoOA4SHj71rVAyG6q7YLARsdPEFyeAB9VairM
 2lAwv1+lwmoF7cAf/NoKhSm2xlO/VgyjWr8CEKebDQMEw21aZ7Ddit1uo9XD9B04LzJU
 vY4TSqAkOfibF7LUpwfF69YE3ewolUzpd7W9DGXO+ftrjTCrgmdYy0sDd4lXnSw3WJ+D
 mDir5U1MaiDvGkWivWGxYjN/ysNTz9s30DbyO6Ppb84yNiHmGGNl4sUPxOlD5YdUUh2L
 iB6Slxt/DrR3jNbRy/6yjgpU5PUPBLucaoj99IODon1aU4uT9+YrYqGhTU7GZyhB3yav
 cR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710771388; x=1711376188;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6hoHJPzKivMW1yEjOBGD1bftC6F87yAj85WAtXr98Do=;
 b=huGMMbNV7ciSIBFl+g8mGjAA8ermFfxMRBJrcojzEEbEYPwYJ63gXa+nSg2yw2cbXa
 p17ZiK4JhatsKanYlfHpqFwq2/4RUMy+OqS3pWQiMYNHVlo3avT9ZcAfuS8Q6LxMOfck
 3JuItU1KIcJRST45OssrdqSbSBSz9BXp4Ji+xmv2eitdbgj6bmKh2C6uoZgCWFF5oMgb
 n7ahQ4Xw9nwh0JAK7SrFvWyQ7DkMq61jFT+87n7QiQurYyJQz5YM15Qnbg4aCLv+an2A
 8PZEibvA6CKil4egQJLveT04c3mpgI8AX42Y8Nd5vg4ouoBdNp/zSCy5JzKdaUWyaIZE
 Xacw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTIoaoQMUJQvR1WQ9zYSGVSRGFYl6ZmgO21NG9bcEoqJzsTNV+NJ6ihk52trFUSnNhH4vs5NIExaVzcbXw7YVUZUgGtHkGIIfy676+KK1k
X-Gm-Message-State: AOJu0YxpriLk/Xv/o1OInVhN5XQF7S/Vrcb7uGcislsLp93dQlnJ7uGJ
 ltxYb1iJy0Dd+hmqlxLJLOItdVG3DRUYWE47VKHu4Ciq5FViIyuC5driqEwQB98=
X-Google-Smtp-Source: AGHT+IEqzbstFUamf1dr3ZQZI+3TDFusQzNphV5aLQUHgxcZhBUC+9G9ERQlw3BfIaiybAdjAODiyA==
X-Received: by 2002:a05:600c:314b:b0:413:7f3:8d5 with SMTP id
 h11-20020a05600c314b00b0041307f308d5mr6541011wmo.0.1710771388257; 
 Mon, 18 Mar 2024 07:16:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm1642584wmq.26.2024.03.18.07.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 07:16:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 18 Mar 2024 15:16:21 +0100
Subject: [PATCH] Revert "drm/bridge: Select DRM_KMS_HELPER for
 DRM_PANEL_BRIDGE"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240318-revert-select-drm_kms_helper-for-drm_panel_bridge-v1-1-52a42a116286@linaro.org>
X-B4-Tracking: v=1; b=H4sIALRM+GUC/x2NUQqDMBAFryL73UDUUNtepUhIk2ddGmPYSCmId
 2/wc4bHvJ0KhFHo0ewk+HLhNVVoLw352aU3FIfK1OnO6L69qTqCbKogwm8qyGI/S7EzYoaoaZV
 TZZcQ7Us41ICGcWHwQ2/uV6rdLJj4d34+x+P4A5vjllqDAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Imre Deak <imre.deak@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1324;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=AVO0CRv0JE94l/fO/dv5SVK7xIoOeyHJggaKr7jbwXQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl+Ey6S6ifjkU3YMO3rgKK5FOvKjMM3uGWoM5xG2o7
 N201Wu+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZfhMugAKCRB33NvayMhJ0e9SEA
 CcbN4WdLH4CEADtmqIVE2Xtq5X2X7rEhhGy6VcD2y4DKdXTRz53ijDHOVdnkeo0/hos94YeCl4qufj
 AFN2UxsLFgB3NHZVzY9L0Y5B0vvDUcIZEaYDReC286ANi4fgXvDJOjL4FvyKQCvMjqPpvmaiDNYcXM
 pynfskGc4LNdzgxcjnYOzO7tx9j/h4XS0D5ogPJUd8NYl0lE6tPfG9fYkLg+X4JiNZQzX3+GO2zJD/
 kryghoe9ixPlOQM6QwdH0U3CStqM52jLURE6DgBooJX7HJ8sWiKlIFVhW4S+EG/8px030HS6ltIuwX
 xNkFLQh3ZJ0woCwRdWJM1m8pH3zOenMvAGqPS1dK4IyhJCXd4VpiVNiM1M866FIaNnowS/aEh/AFlE
 dPCuWeeSery+dIe6I+JLZtS9xee3eGEQyuKJrw3PtrfTWzvozMfDE7LXz24uvR2Bf16WkVTeN8QVrV
 8JF+qUfBIAt/Rq24jpZez7sHq93f0RQcKuhRXO8kq7erV2f5Qu2AYG3avsbvhDdkG6dBExIyz9CUXu
 jei7sjB7c6UUJiCIrhzGvY/X8crqRNh380If+QzxuwlQurGXCSZAO9ZhZ00MJdQm7yrmtwcq6M/D3k
 BEw4+Qtzzo1LTnkF1Z/kN/wjS1TtA38o77pfiX58P7Hz970ttecQw8vRweWA==
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

This reverts commit e3f18b0dd1db242791afbc3bd173026163ce0ccc.

Selecting DRM_KMS_HELPER for DRM_PANEL_BRIDGE leads to:
WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
  Depends on [m]: HAS_IOMEM [=y] && DRM [=m]
  ...

and builds with CONFIG_DRM=m will fail with the above kconfig
warns and then multiple linker error.

Reported-by: Imre Deak <imre.deak@intel.com>
Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Fixes: e3f18b0dd1db ("drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/bridge/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 1d4f010af97b..efd996f6c138 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -8,7 +8,6 @@ config DRM_BRIDGE
 config DRM_PANEL_BRIDGE
 	def_bool y
 	depends on DRM_BRIDGE
-	select DRM_KMS_HELPER
 	select DRM_PANEL
 	help
 	  DRM bridge wrapper of DRM panels

---
base-commit: e3f18b0dd1db242791afbc3bd173026163ce0ccc
change-id: 20240318-revert-select-drm_kms_helper-for-drm_panel_bridge-0e4ad7c73496

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

