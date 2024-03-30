Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E468892CF6
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8C610E2ED;
	Sat, 30 Mar 2024 20:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NTwB0soS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042BF10E352
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:27:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-415584360c0so4096725e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830478; x=1712435278; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VEUaT6J6FXID1oZan7ok4XZwZWXYAqZIH0eNgAaKUuw=;
 b=NTwB0soSgXmWUZ5CeeupjFF48V5xAdVn1yy9YxcaSwYu3taWsYXA0XjBmPOJfRoLsD
 tepFFTc1E0s8u2t1jItU+QCCvQSUw6kwaQIteUs0+59BuMDE7Yo1NM09DSE/jk7dHrwQ
 dV7xugCLu9N9Ec9Vvpi1SDE8zwjxG1WpyuOZaslg186sOFu+cEsxD/Qk74YbTTM+0j1Y
 Qmhsgzi1xaj+cXxx7LdW6BET2DIfL/mEMhiOJ3swEMcUxLUmlxwa8yaTZPeSg8xxuxOf
 A1C98oHTEiF96PK6+RTOAu2N+dW+ObiWbTyo9Vo99wJsdBKzSXYpLtJvwMK6GlPp01Pm
 UoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830478; x=1712435278;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VEUaT6J6FXID1oZan7ok4XZwZWXYAqZIH0eNgAaKUuw=;
 b=TogRTPu56Nb8RhWD8a7tyAcDx75ZaVI+VhHw9UsZ/cEhACfcoTUkAeH6TeV8nu0Vv7
 0fOMqCibrg0CYWiTDLm/WPcNulCSjffuPa5xw6eUBqgZzdYHWaAHvZt1gat5GPrLVA+1
 M/T/UhdrXKXHiCCiVPCVaovHhDB1ivHxhH8WdysUVGniHcCZW3lCqKWRH68pQmy6R5ei
 1KgPjwIyIFgnyW2YF5pQRVa3tpHYIjmkV9+peheotti7rbXRa4ihmtU+TQQ65nGiyW7/
 nA65aoOJ602HXsAweDjnwt0EiBcpYHsAYUQCzufBhzVE4GwgKtSACrUn64pFh2+3MvEV
 EH5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4KSvlRMuJzkXHbuUa/XhbZvW1Ivj9r95o/2krTGB9m3auqMy4V7SwcTu9ov5WW0hhFRb37tD1r6PpnZMrtkNa6foJuWmNZEPHtAJYDE6B
X-Gm-Message-State: AOJu0YyZ1ncB3EQ5nER527AAqtcz4ydrW7q2yDRGp/K3HFfMF9kJGZmm
 Ag1ad4CFT50kTzUYN8+fhrOHRHlntdtYonT0cv/bQaMUhz3WAHckVbAbNQU5Ozg=
X-Google-Smtp-Source: AGHT+IH9u1jbXm1D+cbxbpcnjqvR/sECjqitbMaUx4EQPajbJbh1hh8/lA8Akm+UYN+n59Vpp7Aj/w==
X-Received: by 2002:a05:600c:35ce:b0:414:64de:160a with SMTP id
 r14-20020a05600c35ce00b0041464de160amr3982003wmq.12.1711830478425; 
 Sat, 30 Mar 2024 13:27:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b004146a1bf590sm12601295wmb.32.2024.03.30.13.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:27:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/rockchip: cdn-dp: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:27:54 +0100
Message-Id: <20240330202754.83907-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index a855c45ae7f3..419542c66b53 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1259,7 +1259,6 @@ struct platform_driver cdn_dp_driver = {
 	.shutdown = cdn_dp_shutdown,
 	.driver = {
 		   .name = "cdn-dp",
-		   .owner = THIS_MODULE,
 		   .of_match_table = cdn_dp_dt_ids,
 		   .pm = &cdn_dp_pm_ops,
 	},
-- 
2.34.1

