Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B3E9B09B5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 18:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1F210EB19;
	Fri, 25 Oct 2024 16:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="PLrakD+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A3110EB19
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 16:21:23 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539ebb5a20aso2360359e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1729873281; x=1730478081;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMjnh9e7Jw2TD0W4BB+OtBZvaU7qr6SdoxJVRCE4W9g=;
 b=PLrakD+4JWQuD0vfAkhd+v4qjh6B8caRb6d+kDPtM+ZslzspMbkka8pNS4q54nJf7V
 1IYjmLrkAhm9fL9s+Rhg5GbkTFtgnBgsYvCd/LL5lSQxaOn0Q6msdKnROnJ8h5+PhXAw
 ewUFyrNmNW5ZdylU3lXN5JNX8aziDXokNgQiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729873281; x=1730478081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZMjnh9e7Jw2TD0W4BB+OtBZvaU7qr6SdoxJVRCE4W9g=;
 b=ASjrNa5SD3XSU5ocMlXhusQmVdaKyMuU3ZY4X67oRn3zS7zFdBoHqgkNWPJVDcgc0u
 QMvJ4LRhCw8LUQu2rJM1v5YmsRbyETCTa1faUaoA/qp36gr5ncJNeDxJegNt5G6UovrU
 zZh6zqth9x43jAhjp+7zyyiBQupzNCgbLBIqNNywWFlg4boPAo/h9BUzqjhsXe2o0L57
 SBz4VpewW3WQuhpz6ut/Uu7HhuYXS29zY3aPxzHBlJSKxlcQpBaTqa+/9VNO31m56I3J
 tHaBzXilpbQoKlrMHt65XRdUvP/wPdNOATMARpCIH1ov/L/lVCsLoc4wVBptP731QaoE
 oZzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAdDmMJD+P7wkmxZ2kEc5FqsW7I2fXOBPg69rfKffgcx1IEaKDjzUi1BqP/sHjohlyS0r6kBOxrQA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFzoZUAMuqhHJl761f3PvXgqqaHDBzBJ9WTY55Wsf8ws3Bjn5c
 IX9zZvI17DLXs5e7cDqwJGqKXnMTVpiNWmE6CO6tDBlQcdYhZM5ZaxRwXtw+ZNM=
X-Google-Smtp-Source: AGHT+IHpRXVcg9COz+CBZOVkqqUYia7I4b+x2BPKv04aHOjbK1ZReF3rzypWbORxTuCO5E/o/yIaGQ==
X-Received: by 2002:a05:6512:acc:b0:533:43e2:6ac4 with SMTP id
 2adb3069b0e04-53b1a37540fmr5770667e87.49.1729873281276; 
 Fri, 25 Oct 2024 09:21:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.251])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3af02sm1906019f8f.25.2024.10.25.09.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 09:21:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panel: synaptics-r63353: Fix regulator unbalance
Date: Fri, 25 Oct 2024 18:20:49 +0200
Message-ID: <20241025162115.4115352-1-dario.binacchi@amarulasolutions.com>
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

From: Michael Trimarchi <michael@amarulasolutions.com>

The shutdown function can be called when the display is already
unprepared. For example during reboot this trigger a kernel
backlog. Calling the drm_panel_unprepare, allow us to avoid
to trigger the kernel warning.

Fixes: 2e87bad7cd33 ("drm/panel: Add Synaptics R63353 panel driver")
Tested-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

---

Changes in v2:
- Add 'Fixes' tag.
- Add 'Reviewed-by' tag of Neil Armstrong.

 drivers/gpu/drm/panel/panel-synaptics-r63353.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index 169c629746c7..17349825543f 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -325,7 +325,7 @@ static void r63353_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct r63353_panel *rpanel = mipi_dsi_get_drvdata(dsi);
 
-	r63353_panel_unprepare(&rpanel->base);
+	drm_panel_unprepare(&rpanel->base);
 }
 
 static const struct r63353_desc sharp_ls068b3sx02_data = {
-- 
2.43.0

