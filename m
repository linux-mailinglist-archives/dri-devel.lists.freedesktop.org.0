Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41750892CF4
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3943410E2BE;
	Sat, 30 Mar 2024 20:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jZNyL89t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5444D10E2BE
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:27:49 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41558d2a06cso3879505e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830467; x=1712435267; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKq1cSJLmBMggJ/k26mH1K2G4dZv2uJutdH8DjECGXE=;
 b=jZNyL89t6neZReB+ZUGvpmOx6Th9NjVQloedj8i/wFRgZ1FwbnCp2rtgxj69HotOwR
 X+sZeBE/wmcFW5yIjPsi4yFuxA/hUpfzoNX/cbvdb9c7ffSg85Cmi/Ja0pqrx+56+Zey
 cCPXdS9Ix32+7yR37LH72yMmW1zHkNn/kIMYsJ+CGi1kD69RNoa7LIXv7UuSHyfJCjd4
 4FadW/ZzfIH29cyr+xp7pHXLKYEHh1DnEsNim/9eJfseHg6E+J3VDrhLvbZ2N8e7uJ3/
 hepJlKNtsIDsx7aJd9lmugR/6qffmD8Mzr3mFY5xbDEXJCiZBDr6Z3WTwH0O1R3F91HU
 FQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830467; x=1712435267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKq1cSJLmBMggJ/k26mH1K2G4dZv2uJutdH8DjECGXE=;
 b=clMjS8JNvqvGmIH7UilIblCS4ThN8zZHLBLvAI4mo+N1R/ulncyk3+fpfQCI6v0ft/
 N6DHEoZQj4V60st6DmSIup782r+77OZzz4hTluMpopc/lbzNyMu9KO67kanbHMNoT+mt
 Om7xZsxta+p25nRN3XjmKHQabT3EjaIgbo5K5yMnuUzsAKDviFk7T8UQnYT/erl/z+Qz
 ijCuX0CbLCYdxY6eKSY6RrQ18ygBc5xV98fAYWVhzaYpSZfW6jn69oRpMVxBA9j7rD0N
 fQpXjIVK1KUTb/CRRNC8vLJyWpFmtI4+RGjmU/LP9qvkNsX7DNi6r+29kzpqTVCGmkOu
 IGfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDSlb5DDvCZcOK+V6nrMgzv0fFzIVlT7sy5NUbiZ4vXIWwkUBbESiK7IVbFDtDf8t8TBSBp35F59q5DJCJ6ojJYdzrlJy3bXjmxn2896WG
X-Gm-Message-State: AOJu0YzPLh3VCGtCyFCe1GWiPUJByrwLRNwbi++tEluWBKEL+RcZJU0a
 r/2A3ZDKMUsqR4GrBgW5qun5uoG6qrQlSBOqrhuCw7e4H59zMk1vURnanxracSo=
X-Google-Smtp-Source: AGHT+IFuJD+q3yYb7HgBA+jgGA0QcBVPVNkVgdIkuGN72/Mz7njw6maSOomeiJziCDBGX+JyPmDdbw==
X-Received: by 2002:a7b:c7d3:0:b0:414:d8f:4399 with SMTP id
 z19-20020a7bc7d3000000b004140d8f4399mr4105090wmk.18.1711830467366; 
 Sat, 30 Mar 2024 13:27:47 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b0041409db0349sm9505616wmo.48.2024.03.30.13.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:27:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] drm/bridge: tc358764: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:27:41 +0100
Message-Id: <20240330202741.83867-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330202741.83867-1-krzysztof.kozlowski@linaro.org>
References: <20240330202741.83867-1-krzysztof.kozlowski@linaro.org>
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

Core in mipi_dsi_driver_register() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/bridge/tc358764.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index deccb3995022..3d3d135b4348 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -401,7 +401,6 @@ static struct mipi_dsi_driver tc358764_driver = {
 	.remove = tc358764_remove,
 	.driver = {
 		.name = "tc358764",
-		.owner = THIS_MODULE,
 		.of_match_table = tc358764_of_match,
 	},
 };
-- 
2.34.1

