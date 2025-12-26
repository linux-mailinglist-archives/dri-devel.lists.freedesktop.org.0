Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0169FCDE6B9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 08:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB36812B7A3;
	Fri, 26 Dec 2025 07:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eDEutrHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3CB12B7A3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 07:20:21 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id
 2adb3069b0e04-5959d9a8eceso8003791e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 23:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766733620; x=1767338420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yFhZ1Iob5g8D9+twOAxyKqI3iKjJAC/mwXdTyun7kXA=;
 b=eDEutrHP0i7Oiz4U0INv7aJ3FkkP3o4dmiC8nID612ohqYisSn9zX3LfJnmDMzs0Rt
 jTva2EhTwDa9QrDxnt+7NK9X++Pkvj1RVfUqnAjzsCMqhpQRyV0i3/bw0QYUNBZq9/aH
 YU2oiu0DEDifrT/uOZc2BUK63nA1sYcJZEZ7WUGXtgBL5nid6rRgtv89T6FjjtVAo/vn
 wc4C9+bgpSvdqK/rXU4YpS3Yyfaau7zcWZ7xeNF13wkx7Msv5T92V7bFaPzej84GegdX
 j3HdH3xtDgi929yAkWsamiR3SoEF/5yDS0UKJH+rwcOJuouZjhJiKdyNRPRiKZvC3WPj
 rkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766733620; x=1767338420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yFhZ1Iob5g8D9+twOAxyKqI3iKjJAC/mwXdTyun7kXA=;
 b=gPv9SZL2rpyej4y0gW6TVfqLWw7tLFDHGfk9bi2PHDr/t0AjKVUyV4Tojr5cKH8jbB
 BPKyFMWBVaOKwwwgetHZIMVbjbCnpHZnNDjc3nFDXB3qsxwEOTh3HxlE5tJ8oimBNm0m
 Giu5uqurVG0wN/HQ8qc8w60KdVv4FjyH5KutLjBt9beVhx5w7pxBRjpg4zqvei7CADnD
 UYLPfBYBYsyxJwfLWdYqss+FXwdwEcdJKoNwl7QOkxhrNKzbotjN6yzTeh/IKVYGpyR+
 CWLU9/qo5cVPFSBqGb0SG1297iJ7CDKDYbb0myD6CJWexfbq6SNQtzegY59OA0plc6Na
 sfgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDn1QuXrjTDQdqgl1m9gtQ0S4Z5Dd5ykxouwaKvwVjzy5kOBuuz6upo84dmU/k7Pmsq7RuKvNJ4J8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx46TFulWzDh2wADq5TPDrhOUueDO0kkgrWTkGyeXn72OZdRtBi
 C6IJIn4X/oiOT/3g7BnWItjET4ra6A6KQ+QHxtaz8ODk4sJhLg0NDcim
X-Gm-Gg: AY/fxX4sPd7pu7zkkS0CIjatmXqu9YNQMrylqd/gu1rgLbGAQaL3qAnRrS91UUFER8O
 c614YfZLUoFIg8ryOm/Z21wz4xArOLRY1dvuff89duh9tAAz3LMKdYAPWIsV/Z2Km6jLZNIO3WI
 BpHlaygPH0zkrFBOrUasqi3YuILk9XvMpZIZfsh3dHwhYXndJg9ogSZxZBASzFzM4mAMU/3ZMiu
 fM3uu9NLHMFfgI/cpubL1fGhW556jzlSGCTCEhE1Mm99J+JO18prdoTdzENZSRhus/guv718Zx7
 kJMI9mS7HYOlAmVkDgnMd12+P2ssuu1iE+rhw9OhEBUI7m5pExYrsy68LkTDFyrCzMLP1KqSwmR
 Ec0aYqFn0QyxxHHpOGUyA8jsZX4Lk/NMyvxgM5+kESp94XG1cXKHNho51ZvWFLeydayY2sD/5VO
 9Onkv03/sFkw4cqIaQP7uI844UIYTv6q4ZXTc0Ag==
X-Google-Smtp-Source: AGHT+IHlCQMw1f05szzb0x+RXSFO0IxMOoazPQzDzIpEMXPOv+jyWa/qcp4LOJQgOzSPbOu2RVETTw==
X-Received: by 2002:a05:6512:2388:b0:598:e8b7:665d with SMTP id
 2adb3069b0e04-59a17d7228amr8142851e87.3.1766733619414; 
 Thu, 25 Dec 2025 23:20:19 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.121])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185dd229sm6320723e87.22.2025.12.25.23.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 23:20:17 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: andy.yan@rock-chips.com
Cc: Alper Ak <alperyasinak1@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: synopsys: dw-dp: Pass dp->irq instead of ret to
 ERR_PTR() on IRQ failure
Date: Fri, 26 Dec 2025 10:20:01 +0300
Message-ID: <20251226072001.16623-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The error handling after platform_get_irq() incorrectly passes ret to
ERR_PTR(), but ret still holds the value 0 from the previous successful
devm_add_action_or_reset() call. This causes ERR_PTR(0) which returns NULL
instead of a proper error pointer.

Pass dp->irq to ERR_PTR() since platform_get_irq() returns the negative
error code directly in dp->irq on failure.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 36382956bbe0..718397a29e80 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2079,7 +2079,7 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 
 	dp->irq = platform_get_irq(pdev, 0);
 	if (dp->irq < 0)
-		return ERR_PTR(ret);
+		return ERR_PTR(dp->irq);
 
 	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
 					IRQF_ONESHOT, dev_name(dev), dp);
-- 
2.43.0

