Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD0E905738
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 17:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF5310E8BC;
	Wed, 12 Jun 2024 15:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W23xrzJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D565D10E7B9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:37:06 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1f6f031549bso20930405ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718199426; x=1718804226; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWKGCz3EWFmYzxcw2AH10wBEqhDAZAXMwRxOW8+/rNE=;
 b=W23xrzJmT1gQh92DsOjk7mRcwgR0UQAC4bBnX7j6gIkCO3Rs+xVGMDQKBwHagrklQl
 HKgzX74mp7lxwIn+iqq7+yu7KRUKHBR6I2xxn3hFrBvxtQNzaNDwsBVwQm5c/HfMlnuD
 q+1h8442y8Ka6wgJ+dyY9LMu4EZbOUiw03OkNW6tV/D+fDdZTE7tTa1uY+TARjl0TmE/
 gc7+TEVlHZQWPsztMor+LQYLX+8AYm+Oa1XIyj/NnxNYQr+s3tf53QUuUjqhpFYCRk/U
 wxT5mbDzJpMZ3jQUPIrXhknkpOj9MeF+4+ZTcTKDTfjxnUEtbmzUV6dfu5OKPpPIjA6y
 Ukyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718199426; x=1718804226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oWKGCz3EWFmYzxcw2AH10wBEqhDAZAXMwRxOW8+/rNE=;
 b=BL3znAOfzlklz5NXr5RoRP453fqqzEZxodbfDJBfV1cYrgez9DSFa3a/jYFYvbrCVU
 k3ZjLM53irBJArKklGmOkENqvGExsF9n1WXhQZPo0DXlBuagFsqHtTN4R3txBOLR3pR2
 mNqd7c9pZXAQk3N3yO2y/RglnS/IGoHZ8TvXONWa9xR5WEvwbwCvHRARifJyVQPQ+dK2
 z/Vx73m60oNLzEf+eN2r0Y7979srVTYcYd2v25kllAaMeutS07ecAZBp2mHfHirSCaDJ
 fqJHYPlwmvW4TEqozTC71MImCsy9z6KO99PGrYDjPxeTT7SVs6bkL18LVid8aQexRQZ7
 3qHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0CN+Au8jhQj8OztqqlgsL8v/uJriRMVWL+GWj7XnCkbl+epf3b1Rtk07tyLuNV5AXyJrKKcep720KH3WZbisBAakT23vb5di2nHzuhA8x
X-Gm-Message-State: AOJu0YweeV+rMs3fZiWKiHKyKOceF9G01tDA5juW1sLQeb0os0gILhhy
 k3Yxsn7vqnHdYaXvoje+1o1cMdhMioBt77A3VnB2mqRrMAadDfe4
X-Google-Smtp-Source: AGHT+IGk2WNb7MVw3PvR+Dd5n5F6ztFXUCd2N90utcqQ6HM1yzqO4d0rKoJRZPGLEL6Elpt27tujyQ==
X-Received: by 2002:a17:902:d4d0:b0:1f7:e32f:f057 with SMTP id
 d9443c01a7336-1f83b5f7b15mr20751715ad.34.1718199426278; 
 Wed, 12 Jun 2024 06:37:06 -0700 (PDT)
Received: from distilledx.localdomain ([103.246.195.195])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f845e0ca86sm7291815ad.0.2024.06.12.06.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 06:37:06 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com
Cc: Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, linus.walleij@linaro.org, dmitry.baryshkov@linaro.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/panel : himax-hx83102: fix incorrect argument to
 mipi_dsi_msleep
Date: Wed, 12 Jun 2024 19:05:42 +0530
Message-ID: <20240612133550.473279-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612133550.473279-1-tejasvipin76@gmail.com>
References: <20240612133550.473279-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Jun 2024 15:43:15 +0000
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

mipi_dsi_msleep should be modified to accept ctx as a pointer and the
function call should be adjusted accordingly.

Fixes: a2ab7cb169da3 ("drm/panel: himax-hx83102: use wrapped MIPI DCS functions") 
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 6009a3fe1b8f..6e4b7e4644ce 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -286,7 +286,7 @@ static int boe_nv110wum_init(struct hx83102 *ctx)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
 	hx83102_enable_extended_cmds(&dsi_ctx, false);
 
-	mipi_dsi_msleep(dsi_ctx, 50);
+	mipi_dsi_msleep(&dsi_ctx, 50);
 
 	return dsi_ctx.accum_err;
 };
@@ -391,7 +391,7 @@ static int ivo_t109nw41_init(struct hx83102 *ctx)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
 	hx83102_enable_extended_cmds(&dsi_ctx, false);
 
-	mipi_dsi_msleep(dsi_ctx, 60);
+	mipi_dsi_msleep(&dsi_ctx, 60);
 
 	return dsi_ctx.accum_err;
 };
@@ -538,7 +538,7 @@ static int hx83102_prepare(struct drm_panel *panel)
 	dsi_ctx.accum_err = ctx->desc->init(ctx);
 
 	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
-	mipi_dsi_msleep(dsi_ctx, 120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 	if (dsi_ctx.accum_err)
 		goto poweroff;
-- 
2.45.2

