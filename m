Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B292A86E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 19:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0967110E191;
	Mon,  8 Jul 2024 17:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aOkiPSZe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C9D10E191
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 17:53:16 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1faad2f1967so35662175ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720461194; x=1721065994;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O9BjDRQX7kj+10HbtsCDkp5kJ5lKfYRGsbWpWcg95/M=;
 b=aOkiPSZeycKguWW3CSIHhoPtNExmUOvX3rKY/Y+PzW/YuqcOd6k+z1D/ox/8cl6QNb
 aLYMGauXoPvRyqeoYB9LojSt8ph/LySVzMEmDDsieXsxtxGbU0wpiYk385isrqZBBgR1
 eMnkjhng8CH2HYZbu5Z8lU80FpV8vcapsq6RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720461194; x=1721065994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O9BjDRQX7kj+10HbtsCDkp5kJ5lKfYRGsbWpWcg95/M=;
 b=S3L/ibK7yhEHY3hIFr3HXfVg5za72Wa6osVQiXMa33onakFiGMczzEo2FFmG+lg55f
 A156MkCU2CI4U3Vp07geHTJbU/m42zRvH1US2WRBpigGWfYvCnLfuRe9oNdSvUuCQ5FY
 fnNGpq1glymeNYcfT3PZo6VcnymfJKYySAQTqOs+z3jRjfnKRFWXMCv9NZcs6U2t/Qjc
 yxXSj6REk+J4jgqGQ7sly2ocD7mmvimXjLB4mh3j8jUT9L9ClAJp0L+AsKoA3n5iyUY+
 1CHYSO9YnH/9PYENKQSus2mQxi96UJEWA9ugy5Ayx0dlzesfGwLDODZpqPlHFJW9eV4/
 yRdw==
X-Gm-Message-State: AOJu0YwYUVksyQ3QDmRChy5N1CJJQyQMfnpmytvyzVwULVkkWmQ55CM+
 Du7mfmXIMDvb8R50EYSVp5SX9Dl4ErGyvqHShC9XcwoUMQ0r4G39UyDGW1cVu33JdpoHAqK4u7s
 =
X-Google-Smtp-Source: AGHT+IHPFw3gZqk59xHeov3I6X4Z0L3gagGKfy7AhBoV0V+C3PC9P2uqs2UeYxrwQRh/JJc7gzOsvg==
X-Received: by 2002:a17:902:ce8a:b0:1fb:3263:2e60 with SMTP id
 d9443c01a7336-1fb37046126mr172139675ad.13.1720461194560; 
 Mon, 08 Jul 2024 10:53:14 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:45f:e756:a603:fedf])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a3132csm1415315ad.112.2024.07.08.10.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 10:53:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <treding@nvidia.com>, kernel test robot <lkp@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: sharp-lq101r1sx01: Fixed reversed "if" in remove
Date: Mon,  8 Jul 2024 10:52:21 -0700
Message-ID: <20240708105221.1.I576751c661c7edb6b804dda405d10e2e71153e32@changeid>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
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

Commit d7d473d8464e ("drm/panel: sharp-lq101r1sx01: Don't call disable
at shutdown/remove") had a subtle bug. We should be calling
sharp_panel_del() when the "sharp" variable is non-NULL, not when it's
NULL. Fix.

Fixes: d7d473d8464e ("drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove")
Cc: Thierry Reding <treding@nvidia.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202406261525.SkhtM3ZV-lkp@intel.com/
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index edc9425bb143..a0d76d588da1 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -362,7 +362,7 @@ static void sharp_panel_remove(struct mipi_dsi_device *dsi)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
 
 	/* only detach from host for the DSI-LINK2 interface */
-	if (!sharp)
+	if (sharp)
 		sharp_panel_del(sharp);
 }
 
-- 
2.45.2.803.g4e1b14247a-goog

