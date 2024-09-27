Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185C698818E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 11:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEE010ECA2;
	Fri, 27 Sep 2024 09:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="kbxCuXvT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C4C10ECA2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 09:44:07 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20b1134a6b0so2787065ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1727430247; x=1728035047; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I+pcE4ggyYRS5X6pVo2fS5/uPfMaFvxBm9rRWSI3wH8=;
 b=kbxCuXvTCv6SinLQ8coTQkI0ZTowgmKCb4T4Q1866cG1ykR7SoCyrapWbllT8UPW3O
 farmRyrEb0tv3pYHMFvUqnDLQUlCKcgSOxF3uUN6UmO27zMO6CcHbHnVjz/kEqfHbHce
 3OzhwinUQfKxNTI5FHGHGgQ1X/1FGGEaUp6L29GiqH6DsKvZi+QaOhJp+yz5vMFpJDag
 vIHz/6W6OCHw4Lex605CKb8QTgmsKCkFitNRMP6bzuI05jweNfC77gkwU/u4uBUQNAUM
 c005jDX5OPSNVDmwlYtezFiL5v2GDVDG1En61Q5Oqqe/77O6RNNUYWcZCeCu/A+sGbiN
 wSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727430247; x=1728035047;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I+pcE4ggyYRS5X6pVo2fS5/uPfMaFvxBm9rRWSI3wH8=;
 b=uPq5X19uND6CZrWJCnM9B+OHWOyk4vlgKdZN9EsWFzFuIYjSYWK+RMSgnDmeWmK+LR
 ZUaReWOJAj0bFqR6vfV91DuhB9ABtWxuXni5bHQuKFt2c+qPEOPsUNhMaKFQeWxE22xI
 mEbMTAhC2x2ExvsAw92C5Xeh5EGjJy+6KKUmKD5YCSokTXgopOaNOYjCbzxI6ZnL9DIl
 moqWRRnlgAKYgbUvRq7d+MPlc6ga334nZ8d5guWuAyos0ADLcBYFVwqVfGJCTjGrcbdh
 wEhbWbVsnQikVmV5cBLENHmpQ1yiZESafuK9gmLg0xqLYzC9XEVrTVcKfM0n/UaUy9uz
 UiXA==
X-Gm-Message-State: AOJu0YzzTez/XV90lvVJQGmQR/qpCvLXIPMmxePTfhFL+m7ZcshXuTVA
 GVf1UjqiSUPJGFknhj+/cokhKUS6hdhXQs5QM6Pvr1n9k6NgoGrvdyFy7d7DLpw=
X-Google-Smtp-Source: AGHT+IEv4f2iWdehOnAHDvI+4cTE317jz6vBcdU/dL58GnnGLWNRzmz39Mt/C1xTWOvT+3IlYnO3Zw==
X-Received: by 2002:a17:903:41ce:b0:206:b6db:499f with SMTP id
 d9443c01a7336-20b36716572mr16798355ad.0.1727430247011; 
 Fri, 27 Sep 2024 02:44:07 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e06e1bae46sm5105895a91.22.2024.09.27.02.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 02:44:06 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org,
 hsinyi@google.com, awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 1/2] drm/panel: jd9365da: Modify Kingdisplay and Melfas
 panel timing
Date: Fri, 27 Sep 2024 17:43:39 +0800
Message-Id: <20240927094340.18544-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240927094340.18544-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240927094340.18544-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

In MTK chips, if the DRM runtime resume has not yet completed and the
system enters sleep mode at the same time, there is a possibility of
a black screen after waking the machine. Reduce the disable delay
resolves this issue,

The "backlight_off_to_display_off_delay_ms" was added between
"backlight off" and "display off"  to prevent "display off" from being
executed when the backlight is not fully powered off, which may cause
a white screen. However, we removed this
"backlight_off_to_display_off_delay_ms" and found that this situation
did not occur. Therefore, in order to solve the problem mentioned
above, we reduced it from 100ms to 3ms (tCMD_OFF >= 1ms).

This is the timing specification for the two panels:
1. Kingdisplay panel timing spec:
https://github.com/KD54183/-JD9365DA_Power-On-Off-Sequence_V0120240923
2. LMFBX101117480 timing spec: https://github.com/chiohsin-lo/TDY-JD_LIB

Fixes: 2b976ad760dc ("drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel")
Fixes: c4ce398cf18a ("drm/panel: jd9365da: Support for Melfas lmfbx101117480 MIPI-DSI panel")

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V3 and V2:
-  1. Modify the commit message 
v2: https://lore.kernel.org/all/20240923134227.11383-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  1. Modify the commit message 
-  2. Modify the value of backlight_off_to_display_off_delay_ms.
v1: https://lore.kernel.org/all/20240915080830.11318-2-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 44897e5218a6..486aa20e5518 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -858,7 +858,7 @@ static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
 	.reset_before_power_off_vcioo = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 10,
-	.backlight_off_to_display_off_delay_ms = 100,
+	.backlight_off_to_display_off_delay_ms = 3,
 	.display_off_to_enter_sleep_delay_ms = 50,
 	.enter_sleep_to_reset_down_delay_ms = 100,
 };
@@ -1109,7 +1109,7 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
 	.reset_before_power_off_vcioo = true,
 	.vcioo_to_lp11_delay_ms = 5,
 	.lp11_to_reset_delay_ms = 10,
-	.backlight_off_to_display_off_delay_ms = 100,
+	.backlight_off_to_display_off_delay_ms = 3,
 	.display_off_to_enter_sleep_delay_ms = 50,
 	.enter_sleep_to_reset_down_delay_ms = 100,
 };
-- 
2.17.1

