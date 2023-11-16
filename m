Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7D7ED873
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 01:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5054B10E2BC;
	Thu, 16 Nov 2023 00:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40A710E2B2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 00:17:49 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6ce2b6b3cb6so128855a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700093869; x=1700698669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5axKZ3rBh2546l575rzKo4AVUrOHl6dJO+NCLZTqdmQ=;
 b=ChG6LJxHSBoJAPyy/C8GESbF7J7Lme6C1drsAXCYFSPx5OclbrJ25wCXX6BPPg4q5V
 vP3ggCLjHjkaUFyRaZJVoX5ofka+F9KnPm6ZaX7FAlXrEaDdHX7eB0ZlvF9QmGrTIkyZ
 St9SxKo88O3ed9Ej/Q9XR3H+NWP7R+SSV0icly+ZoLqUzyPwMA2xcjBS6APiUgkfuwPB
 d9b2IJ+8PFqQTcRt0CjMp17I2pTGnjgUHhzSGkPyRtG+IKT3evEE0i8XAZPrexRVwpmf
 Ux1WH1EKckmcqVpp9+o33ny2b2QyUoV9CrCYMxo8HEnJSOxriv1ft+K7rkmaerKYQPQc
 wGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700093869; x=1700698669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5axKZ3rBh2546l575rzKo4AVUrOHl6dJO+NCLZTqdmQ=;
 b=aeyVeXFPvADOg6HStNc3Syt4kvTAF/sXiC8XLrc3KAiQXsodne5Dw3TSnJLQiN0XwR
 4GohbsE5T60vSB6EmXz+eW7aukURTt4hjVit10iMzmOc47iHyzuUxIutEyZnZgfqz/9k
 U1uZpXIxge79OPCh3RpVtpfzl4DHxPdXHXCNKOXDrmF/rEsynCuNLn0C4TVEO1Ryp9z0
 /hXgjSU7Kb7VTWgCJ2QgR8xzQAXxku4l9tngWDT4T3Yo0ZX0DBQJGpOIdQGMeCGSMzKO
 b2HMbz5Pss6VD2sm9dkVCXc4havayz350QGVTzXFZ0CHHkAydS7HY300cHqdA11j/FTp
 BRIQ==
X-Gm-Message-State: AOJu0YxXXtYMlo/IWrJ9bdbizNP5H36wQSYKD8yQVTBQxpiUKQvKVoMm
 TPbQIoZJGTUO6qnhSboXFZs=
X-Google-Smtp-Source: AGHT+IFDBddG1lVi868AvwqXMsbhb/xjnNXZ9npqgsEGmKHtLPeO2U8aBbM2Pm0KhfnvhakZQEzH6g==
X-Received: by 2002:a05:6870:b155:b0:1ef:62fc:d51c with SMTP id
 a21-20020a056870b15500b001ef62fcd51cmr16441458oal.51.1700093869189; 
 Wed, 15 Nov 2023 16:17:49 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a9d7d92000000b006c619f17669sm727117otn.74.2023.11.15.16.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 16:17:48 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V3 2/6] drm/panel: nv3051d: Hold panel in reset for unprepare
Date: Wed, 15 Nov 2023 18:17:38 -0600
Message-Id: <20231116001742.2340646-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116001742.2340646-1-macroalpha82@gmail.com>
References: <20231116001742.2340646-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Improve the panel's ability to restore from suspend by holding the
panel in suspend after unprepare.

Fixes: b1d39f0f4264 ("drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel")
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 79de6c886292..c44c6945662f 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -261,6 +261,8 @@ static int panel_nv3051d_unprepare(struct drm_panel *panel)
 
 	usleep_range(10000, 15000);
 
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
 	regulator_disable(ctx->vdd);
 
 	return 0;
-- 
2.34.1

