Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E36B158D6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 08:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C5010E128;
	Wed, 30 Jul 2025 06:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="W0F9NmP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F1E10E36E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 06:17:56 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-23ffdea3575so24451335ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 23:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753856276; x=1754461076;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=98acdjAVPrJS4Gqdzmu/lk9sXTEBspyDUAMw8EWioqY=;
 b=W0F9NmP6zz36TbwmTQ8Wxtj3L+bMjxFFGNeMen2q6LTdxC6DTraBzYCXtMZvSuGAdx
 Y0phbRFE7pAV60/1GoAr1ZG8oq1yXzIr5HQWQROXXgvhJVnYQNxKpEy5YNkGS0y5anwk
 Sy1Vy1LThmhi3s84YlAvx6TU6IXKFJlelVddGZjy2ep06TLANFjG+yZa6kYiIJQinpSa
 EnMG8syakhRqbB1bRf4HwYjSvwsFxLKDQPHKGEhPRrjb/AJPGgerjKmPnGzoBwd9YSH9
 14yrxm5htDVc+VDzRXkTvPpLpr99nFbZ3rNMsSTponSHPejlLvi7Qm1J9aGTj15M3h1I
 J7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753856276; x=1754461076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=98acdjAVPrJS4Gqdzmu/lk9sXTEBspyDUAMw8EWioqY=;
 b=CgjpoSH+j1ZBq30VxFcgucAnW6LpETKJ0RHuycu3yOriG2I6Tnz8CHSXdMUQZF+igK
 xX21p252h5HO6bWTKRp8SoFEAsDXNoeZwZ0EOTE4y/nSkPQGyuOY402aoNZphocvfnV+
 ils71MqOjW+wrTG9obORxG1jiisWx8ite08WHhHTqNruP3K7XUs/o2JWXdzsaqKcMfxE
 lNEa/rIBDE1oh1PoyU1ciBLocD9q7YYyeGxpyDwIyBgshQ7olbO1sYYn4F3+pHDDFx/r
 nY6BYPiSwrEvg0MNSM7yXg37HIrfpE8vzEYBpJ/nltxmmsJaB8hw9CNXLIimoA22yyK/
 85Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV98mGGhPiCEURSf6/+vF+zMER5VFW1k6hLBf6KNaoNrdduhhASbLqURMY+xMnobpAHoe9Dy042Fsg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyefa6uXTkgMLFQr5U9OCs+8uAOXnqg5WSNGuNq1lja6068PqZG
 CLQe4s5BerpG88gg8CNfhU1lZqLpAGOqPWK2bsMW0EI9aT3f0RPEAS5aURUZsj8LwwI=
X-Gm-Gg: ASbGncsq+MiU7YfGS+D+suN5h8smnxQvRZw4xbuGcntLxkekXjrq+/Ro5LivQ+RtSi7
 JDl5gWVY//uX4FaAIg5KpeI7swQkaahGyuemA4sivHsTKVh/asIN12oifiIMsYNexPzXgEEDday
 EfqcJHARJcq9lNVHvwP8JWjoOmMzqzYFm3wXlgsn5H8SuWVUQ0MToIddG9K7TCzRBzLhpC0sCRs
 uaGIBKWKc3y4blqq1SOD7RKP3rjaPOMCdDnfFYPDq6ls8Z9q0MuqLkXJaB/TF0bkjMGh6OUo0Rx
 Z/3rHiDLBre/Cas1TpQUy0/joYEUMYGa1akrpaCHYeQU3z3LhlBHuqR3KHi/xBL0t/KnSafV2KK
 S9du0qp+lkKL7Z7ewtknXBP6gLHaCoopU4jY4rwADakHE0cCfGf9MXr5zvEAJ
X-Google-Smtp-Source: AGHT+IF2plv3fMP0uvyMA0WmAMrYR0uHAsvmRyjAdt8jIJYVnquEq1k4jegvH5HMZncHbb6PvKV5aA==
X-Received: by 2002:a17:903:2a83:b0:240:7fb:cb0b with SMTP id
 d9443c01a7336-24096a688b9mr25697995ad.15.1753856275969; 
 Tue, 29 Jul 2025 23:17:55 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ffa37f078sm75017815ad.115.2025.07.29.23.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 23:17:55 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 1/3] drm/panel: novatek-nt35560: Fix invalid return value
Date: Wed, 30 Jul 2025 00:17:46 -0600
Message-ID: <20250730061748.1227643-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730061748.1227643-1-me@brighamcampbell.com>
References: <20250730061748.1227643-1-me@brighamcampbell.com>
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

Fix bug in nt35560_set_brightness() which causes the function to
erroneously report an error. mipi_dsi_dcs_write() returns either a
negative value when an error occurred or a positive number of bytes
written when no error occurred. The buggy code reports an error under
either condition.

Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 98f0782c8411..17898a29efe8 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -161,7 +161,7 @@ static int nt35560_set_brightness(struct backlight_device *bl)
 		par = 0x00;
 		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
 					 &par, 1);
-		if (ret) {
+		if (ret < 0) {
 			dev_err(nt->dev, "failed to disable display backlight (%d)\n", ret);
 			return ret;
 		}
-- 
2.50.1

