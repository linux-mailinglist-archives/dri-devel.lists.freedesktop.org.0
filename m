Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1E88984BC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 12:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CAF11B338;
	Thu,  4 Apr 2024 10:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tRRrRXuy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F0C11B32D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 10:08:10 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56e0e1d162bso725163a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712225289; x=1712830089; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dp8USTzsG3ntp/LxWp9gHMeUcZJjL0z8l7/Rhp/dYWg=;
 b=tRRrRXuyTYoATrxWvu2M9J/av8KgVuLiIgd5lJrODLYBjhXaQ111HsV125XJwARKGy
 kbz5GJ7ChlM8N0BHvnXiAw3QfOGtPgnJE4uTtslYSCSgYhFsK6bWAO9rNqcTHy4UjZj4
 AKxdCFGc3rhsdC2t+cLcM6Wh+o5lQVJhrDhvbpj4bJCcfRz4wgHM+Z6AZ1Z3h6RXzcCd
 vrCJxo83ON3PvWtgpzpAA06fP2le60zvgBpR5mQXZi2YznzsmKbWcu2QTxeYmJ0lezT5
 d5668dSfKTLUOU61+fylqeMeSe+Y8M18Q2DrBM7wgHeE/61jveoFGEcx/tiZ2TUqZ61Q
 AJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712225289; x=1712830089;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dp8USTzsG3ntp/LxWp9gHMeUcZJjL0z8l7/Rhp/dYWg=;
 b=lYqn9uV/Sqsm7gvuijuVyaKbmDdrI8sVSRFUHzS5tXbLyO0mWME09VagEEQ0Wbpx1p
 PmNxoxnjPRY0Tg7FlLgHECMu1CczjD4LjFrL5LGFD8SlsWFS9NqSmma60E3Xws8jL6dF
 +KpeTl7U2z+/G5vpy9OvlEACSEky8X0VOLkHHx6inCYr2YGANt/0Wr1xIqsDEEnAMukX
 jZR6ENrLWBCrcMk7Wq6rwf3VgFsn+X37xJ48LPJbVCH6sIJxppwlzgy2XfQHHGaisXAO
 MkuX58lcB2y0DuANi/OKqVQEi3ZBKmJ7g7/0dbDCSHGNLShFLJKjfkQ8TySoR/XEZdKv
 ybCg==
X-Gm-Message-State: AOJu0YwSUKMy0yPB0Un0zUTSxg52RtjB51LKk1L7aOkDB1OoYyjrXS/t
 yOdflBILXM7FAYqD6jTsBuaIWS8GxlML7jaRdmoEUBIhPQ4/KaZzmuDgAqbyh1A=
X-Google-Smtp-Source: AGHT+IHpY7DJnbfRwrN+pggOgCfH6syNZv4JzFQ7NFRdr6EFSZOLNeW3eQkAhrKYCeBUc5BBBg2YBA==
X-Received: by 2002:a50:d4de:0:b0:56e:df1:534a with SMTP id
 e30-20020a50d4de000000b0056e0df1534amr1014440edj.42.1712225288726; 
 Thu, 04 Apr 2024 03:08:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 ig10-20020a056402458a00b0056c0a668316sm1984219edb.3.2024.04.04.03.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 03:08:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 04 Apr 2024 13:07:59 +0300
Subject: [PATCH 1/6] drm/panel: visionox-rm69299: don't unregister DSI device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-drop-panel-unregister-v1-1-9f56953c5fb9@linaro.org>
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
In-Reply-To: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, 
 Harigovindan P <harigovi@codeaurora.org>, 
 Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xtfhuUTM99xHxoMeoYk5bzlIduxzhp/GTlxP2mkYgaY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDnwFymsormB7E2rQzeFs0/IGcTvRxMiWf2O5A
 yUo7xUWQCKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZg58BQAKCRCLPIo+Aiko
 1TgJB/4z75ZXyRi0GestVgdCyBjlrKyuTdUKv5EevhWnh+aLaSOFY5w85Ts/sc4S/+3rDxvdwU2
 CkN/oVbiKN54mlfRaS7cm0j6/4ZpwgfPkr9H/WmkWaCG5eC8HSr4z3U46sxjNJdaj3FuUW8ouk5
 h04EnLDzSFxa+NJdOnAoFE/qEWblFiPDpVFKpw/ml2sjTU1HUObnzOLZtarfPdKnp10mk7Xmgte
 pwYLYkrAbrUp0xySxMlW7cfEQS6poi0IhoOj0tt7YLGHJq5j5Cp7x/HwHMfaFAyrayEdvlIXJMT
 TQ2msvq1B4rSIXl5Ein9MwCCBaktTd8fYP5gAedMvW3SnueF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The DSI device for the panel was registered by the DSI host, so it is an
error to unregister it from the panel driver. Drop the call to
mipi_dsi_device_unregister().

Fixes: c7f66d32dd43 ("drm/panel: add support for rm69299 visionox panel")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index 775144695283..b15ca56a09a7 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -253,8 +253,6 @@ static void visionox_rm69299_remove(struct mipi_dsi_device *dsi)
 	struct visionox_rm69299 *ctx = mipi_dsi_get_drvdata(dsi);
 
 	mipi_dsi_detach(ctx->dsi);
-	mipi_dsi_device_unregister(ctx->dsi);
-
 	drm_panel_remove(&ctx->panel);
 }
 

-- 
2.39.2

