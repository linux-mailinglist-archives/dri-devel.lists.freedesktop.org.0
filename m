Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C29CDE1F9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 23:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E3710FC3A;
	Thu, 25 Dec 2025 22:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lQDKKd5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C66F10E10E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 18:44:24 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id
 2adb3069b0e04-5957d7e0bf3so6856619e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 10:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766688262; x=1767293062; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U/PCtdBrd5gfcnsMAMkbngVQy1JE4sQh5YcUVQup/Us=;
 b=lQDKKd5BX7ZGnzl3uhVY+z5B3DvrDe1vFnGsze8Tpix4ihlI9/XVnJBbOLBcDYXvq+
 TBCinCP+aOR78LOagyej2byC66tqeAirfUJFDj2ftbDiMqeyTRP+aZ27Gwh0m9A6kszW
 7vDCPwY9q6+NU8Xca1KCvkPBOvgdZAanm3jc55FJ3Y8cBOWssdgi6EzQaa2SLkLznBaN
 5eQ23eq/K3c6TQuajmKhV0qrN7ZcS9Tl+p04FUBFOHD46cVFxBpjPhD8mcU8qGEDVFSz
 Yd2wujYRhHr2p25VOCm4uyh6FEhbg0auEL3tTCm2Wm9b6rszJ6ScjuTtdrCqGWbJq9mI
 07Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766688262; x=1767293062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/PCtdBrd5gfcnsMAMkbngVQy1JE4sQh5YcUVQup/Us=;
 b=ENSDqyLWG16+PBiOZXENtPTwGwqajTTWZ7OhnlwbBETxUUuKXx3LApvyjzkDxKeBId
 xgYhl7WuDlpJz5+xptzNGq49j3KYteFAorS6wZxvDd9uPDu9MGWueNyOtjvJ1nG4vD3T
 bx3zN51jUypmnvS7v19Iegk1xaXyWWtwPhBsfvZWOIPjJzhpKagpO+aOg32pmdgyefP6
 LOENu6Tlg6JGfha/QBnmwqgaWghL9wK/iyezF2nLHgdNmnb/HV43GdcQlkVNqcDONCG8
 uOSDpRdbrtAY4V/cSPiWh8awatBo9iERIYE8Fp051rSv/vf1ZORVw4006Eb1yXwI1JY4
 uNDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHchGkX6tn+Nm1d35BDDiStaSOzWEVTvOhPpgCfXh6BUhdZy8YJAUJaM9hJY1EAdeDd5LJgDJBXEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD45a/3E/fuUJlPwEOMwti6qndfi7HW2oQi9oH11wbscJ5z4oy
 jaUHxxXrRROAd/a/592Lt1iJfOJgQpLzi6bEYhvotKO84kjJbiFjSM/q
X-Gm-Gg: AY/fxX5L0z2E8LprcAZuUZ09ZG63OaP3R8CDcpbJXvB5iim34EdbTIB6WxZALH5VPE6
 gdHEK+CtG2zFMIwM0Stt+9r6gUVRmBNW+YRkEoLAQ8eQJ2T9EfIWje54yDTBf8gWe9/H+Zx50kL
 7TKxNQYyye81LtzB8cO/RcBF0/1wGST5b14eYDbwDb4AdOAGZ9dXlTEgFtqLwLr6V/yq8ujMQ6s
 o9SzD1QzOU27vHlcyeMkX0aCf7x5ttwzX+poOpvIcGTvyk7UBImoKdllb1hQacsq3EfM3DfCcI4
 YDhuJUNIFd3EXSMaKw/D//balEU8HEtlqmbQ/rELpFX2gEsJdJepu3J+fOs/5tgvqdwZeZQI8ZQ
 z+WqaE2QK2R9WoPWfuMsvsk79b5y4SXoxMICOHX4bic3Q8XUwGyT0C9PF9Is/AYleEc78aY987E
 b+jsuOIQ3o7b+A714KdyG6hCilVQ==
X-Google-Smtp-Source: AGHT+IHXvCx1At13BaXrrlznppwAsDE2Q/dS2P9RM35UJFX4z+lidRRHUKi4OAdE+UoSAmnEKikUJQ==
X-Received: by 2002:a05:6512:2310:b0:595:90ce:df8e with SMTP id
 2adb3069b0e04-59a17d042f2mr5965201e87.5.1766688261960; 
 Thu, 25 Dec 2025 10:44:21 -0800 (PST)
Received: from localhost.localdomain ([176.33.67.19])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185dd90esm6116355e87.31.2025.12.25.10.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 10:44:21 -0800 (PST)
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
Subject: [PATCH] drm/bridge: synopsys: dw-dp: fix signedness bug in
 dw_dp_video_need_vsc_sdp()
Date: Thu, 25 Dec 2025 21:44:01 +0300
Message-ID: <20251225184401.414021-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 25 Dec 2025 22:00:46 +0000
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

Since dw_dp_video_need_vsc_sdp() returns bool, have it return false
instead of -EINVAL if state is NULL.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 82aaf74e1bc0..36382956bbe0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1149,7 +1149,7 @@ static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
 
 	state = dw_dp_get_bridge_state(dp);
 	if (!state)
-		return -EINVAL;
+		return false;
 
 	if (!link->vsc_sdp_supported)
 		return false;
-- 
2.43.0

