Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FE73A0616
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 23:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B482E6E0B7;
	Tue,  8 Jun 2021 21:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A6F6E0B7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 21:35:32 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id n12so27417399lft.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 14:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SKSn5e5l5EjJZcD4q3vHTl17EzR0YEY3LdJw5OjTi/M=;
 b=AF7C33Owauk/B6TTWJ/oY3Erb+fUogfRweAiNjkJEu/Yn7NZCK4W7EyP3epOVG4+ro
 K/7d7eSvXRIT8T+OR+i+Ev6jIXEwHNwOEuLvc7QfFZveV5MTIFO/0+R6LCE2Ia/NupsD
 GyQqUoCAoARqdEdYfa+e7UipnYyw3sB9KRBl9Nn4UWUGowy+93Gp5WRDfR8EtAJDQKm/
 pslaqQUQcyfDXa6u/Ehc8IPI/egZ7PsXaf0lV7q8M7sSl7/3W0bOC1sWGqdWcj87BPdi
 /So7SPFNU+1/OQa0JsO0JWK+PlIbFftBQzYTXQ7xyQZKUCztmE3xL1g1jgPBoTr//9G7
 DOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SKSn5e5l5EjJZcD4q3vHTl17EzR0YEY3LdJw5OjTi/M=;
 b=rwUWiy7eZ+xKfl3JO1QuPjUssbCTkYp+J3Fg+vMggHq+x3KNSXzSCSxRerSFvnLAT9
 /S1Py0OoW0Y/CcpK9ouJRYlYeUjBdpYO5uaiwOnfC+ciTXgHRrciUEkrlng2d7ZndYmL
 BlH6aMngEpzVsO7JnDQ7vmI9wfM9s+91/Sv8oQ11Ikt+IvRvFAtz/DLKxE6IC19ivTdi
 hQTBnNzFli60o1wkMqNGpEuHt0o6FxEZa6VzNtYkwGNfznB8kU7KAu7YKD7H7JTP8FaK
 5dR2CwLzJAC9vMKVT7LqDLHkIhFz95b3+dynrMhGoBe52SmJ4IRvNAAmxzqYGZT7s5Fm
 LIPQ==
X-Gm-Message-State: AOAM532Vbnch4Ka1XWSmlXY6+oQx2Td1A3RYwl8xUB5yZN2TX7qZWa2y
 YugcuxW+dAR4lAaqV+AJDtxlQa60zNbykg==
X-Google-Smtp-Source: ABdhPJzCwEBMGFTavqUMUeLQzI613grLHDnKwWg51CmlgqbT5mrK2uWzjwWyBG/2Lo354+Mm/3DD/g==
X-Received: by 2002:ac2:4e46:: with SMTP id f6mr16360491lfr.570.1623188130675; 
 Tue, 08 Jun 2021 14:35:30 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id d22sm110051ljc.55.2021.06.08.14.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 14:35:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Fix off by 10^3 in calculation
Date: Tue,  8 Jun 2021 23:33:18 +0200
Message-Id: <20210608213318.3897858-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The calclulation of how many bytes we stuff into the
DSI pipeline for video mode panels is off by three
orders of magnitude because we did not account for the
fact that the DRM mode clock is in kilohertz rather
than hertz.

This used to be:
drm_mode_vrefresh(mode) * mode->htotal * mode->vtotal
which would become for example for s6e63m0:
60 x 514 x 831 = 25628040 Hz, but mode->clock is
25628 as it is in kHz.

This affects only the Samsung GT-I8190 "Golden" phone
right now since it is the only MCDE device with a video
mode display.

Curiously some specimen work with this code and wild
settings in the EOL and empty packets at the end of the
display, but I have noticed an eeire flicker until now.
Others were not so lucky and got black screens.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reported-by: Stephan Gerhold <stephan@gerhold.net>
Fixes: 920dd1b1425b ("drm/mcde: Use mode->clock instead of reverse calculating it from the vrefresh")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index b3fd3501c412..5275b2723293 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -577,7 +577,7 @@ static void mcde_dsi_setup_video_mode(struct mcde_dsi *d,
 	 * porches and sync.
 	 */
 	/* (ps/s) / (pixels/s) = ps/pixels */
-	pclk = DIV_ROUND_UP_ULL(1000000000000, mode->clock);
+	pclk = DIV_ROUND_UP_ULL(1000000000000, (mode->clock * 1000));
 	dev_dbg(d->dev, "picoseconds between two pixels: %llu\n",
 		pclk);
 
-- 
2.31.1

