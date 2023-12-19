Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88169818D43
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DBF10E4E3;
	Tue, 19 Dec 2023 17:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F52010E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:25 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c2bb872e2so54681585e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005283; x=1703610083; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bc0b+TzRBYlgBswaLzZiZATkVZXs4jtzYrqChWAdmP8=;
 b=NnuBIwKXU/rg2zS8x1UbC9xr+g+eHB/R2pC8Nh8h0+MIrCwWEp+0BLrNe2c1krVuen
 Xomx9K0RhyAUBkFfvPqd+rEdJfa+X3bYqdGrgyyFDQLYfK6+ZB4E1+GlUjianwiTxnAl
 hZKAWlLrnT4SLt/+tesFvzFUYwDKJUmamKdWY0WYyEVZ+Zz211vqhJNh1+MQgxyc0QAT
 FxXlpANs1oxjp/kt29nO/sykJfdnfK4024y7zOAIPQgctkX9Ip4brq6j8AOstB6D0Nyj
 5m3X5tnumeD2tZNyKJ3rG+vU4hA8a5vgUy7NyfSRo+bjGsdHwLPruSLaVdLNDNa81B5j
 wxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005283; x=1703610083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bc0b+TzRBYlgBswaLzZiZATkVZXs4jtzYrqChWAdmP8=;
 b=WLvlwzqMGeHhJq3xVjM4bhwrzU1JWa33kp3RvIsDje3X087oIMqSx7Dh3r4/lhfW5x
 N2tqmGeO43CHQuesqvVb+9Pb7Br0im060+qHgjaONINmJ+/HlNjV+gWs6KmbIF+TDgPh
 ANtjIyVxA+UKHf0HZdjd9VZDc3iDLw8+Ucd1Qz6kqV7geSoHfWSMWhbs1XbHqfziwTXd
 fXtBsCVlkAE6ONHYfnM4f+NHuHVXTntymt1/BOr6cAlolQ5q+YfNbMmGa9MvocaUJIm+
 ecZ2tQBvRaluCnd7mbq7qOThaTrC2U24Dutcs3EqzhJ6UZNZyxKhigQG4PmAWNsmcrMs
 tfuA==
X-Gm-Message-State: AOJu0YyFpfWOVM0vHPoc+8ogd/gf631wkumnKtUxKPeVmp4W4bWbrtXZ
 vOIRE2QxsCg1QwY9DCCFfA==
X-Google-Smtp-Source: AGHT+IGsXiyRLPSKTLiCmb5HKcIoTm/Gx4nMKjVc/FhMnHN1ip8FwDTTR8xwruHseC++DoM215yynw==
X-Received: by 2002:a05:600c:4588:b0:40c:6b55:2a0f with SMTP id
 r8-20020a05600c458800b0040c6b552a0fmr2064612wmo.224.1703005283542; 
 Tue, 19 Dec 2023 09:01:23 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:23 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 18/29] drm/rockchip: inno_hdmi: Remove useless include
Date: Tue, 19 Dec 2023 18:00:48 +0100
Message-ID: <20231219170100.188800-19-knaerzche@gmail.com>
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

The inclusion syscon.h isn't used anywhere. Remove it.

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
index 138cd4287dea..c306db90832a 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -10,7 +10,6 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/hdmi.h>
-#include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-- 
2.43.0

