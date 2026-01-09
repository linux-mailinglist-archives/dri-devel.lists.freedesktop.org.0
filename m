Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596ABD0B048
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD31210E8EB;
	Fri,  9 Jan 2026 15:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lJ1Xd5ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C37B10E8EB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 15:46:49 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2a3e76d0f64so14894275ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 07:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767973608; x=1768578408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBICZ8YwEG0B49att9rs+qAvonW13wXo7ZtxBvLrLF0=;
 b=lJ1Xd5nsdJOyqSFYfaMCetIA+eukugOiOnFa3oPYNVDeD/+BL5dxilt+B8Fy9i3Th8
 CrIuYUN6KecuvI9lG1MKkLpuQRB6oJQHl5QjQVIsuUnVv73gLrXepkQmJY9bINMPM8T0
 PZGWBfVhRbEVsqAUBZIr9EoY8taFzQSSdPLBAL50rEmAXPGBaD+GnM10ncPMqjBb4GGO
 PiAhB00tjcfbdV64W7hBHYUUTdo2+b3PPAcYt2cgvsq13kUZ0kOgMnT3yyuGqPmWxllx
 BV8yVOCPdru7rSvZeokKJzcxNvBGvTvmTHdmAsJIYuSLA5il067icExYuwmv3bLfTCms
 N9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767973608; x=1768578408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CBICZ8YwEG0B49att9rs+qAvonW13wXo7ZtxBvLrLF0=;
 b=eK3ATX/xjUImtkxB7d4Hj/0Pbl2xLCgMdXV99AxUpDRGDcno0cA4M4xGC+FkOgT33H
 WckdM3yxv70pxO0CmiyKGKVC8TUxwJ+F5H5uog4XsUkytM4WtIZF2+w1lAiDPUQzfc1b
 AMjfmloo1gF0yYpCvI9fpIMVgz31+6a5pqFwsd0XuLo0+VGojWyRv7vCNPrI83zUBT+b
 0ezHW4N4UW9KbUJatzIN+gLAufJIrLK2JvGbVZ7SoZxNo5FfywveIrpmcgV0jGbh4nse
 X+0o2rcya+5YNMqoNKC7z/QB1fMFgzFLa+9/oBMErkCPLQt4xn5xOXztNCRKgTsK9syc
 7fzA==
X-Gm-Message-State: AOJu0YyksUmhtdGYdhK/3UuybaJ3qttHcqDYWGGQ0v90kvK5sQwNpQFZ
 iqzsYqF8Qn/dWqdUV1a1tNKt3iM2qTzOBlM+RjUhEZPRzUT8C2lQHou4oS4kHCf0
X-Gm-Gg: AY/fxX6i93PKeY1dIw/whfu/l3whr2zIZvnCdVjlQqyqlEC00mRvbhbsF8kIVNG0hMt
 Ai/u3kkUZoGmVv9tuomzkTHRSixjx+QaQYejTNNcIhXZO8hrbWjjx5UsJXWumEwPqmo4llP3a29
 O22U0hCb1YFNyppEvn1J1W/cxodFjpJb44cKCRC9HMwloQboOF1B4MfNDWWe7WZhWMJY/DWCOSm
 bbdEZ3NsPkvsZ10xvk4jVQeKo5yuUCISTy2LuaRXrZUmwGWbhAEzltTS51vTxSoVbNoyz5ifugC
 waTW2nkLQh5+/Z5cjnoe0hxyhcfQAkxRYeuI/vjfB5p7Rp6X2ikoAHtg86cAtC5rNSE0iPV/xgh
 fSf2yYUdYdECIrUui2+NiUw0lEKZEPWqAly5R1BRWGHiwEmVrecMIJhemIVTqTNuKiCagoAHmdu
 9tSQTyZQzBDf1iTzdTvkyhmsBaNRIP1QlE5T+KfRachz4=
X-Google-Smtp-Source: AGHT+IHbGH/eZSPJCY+XWmlxxF4AOahN295jcnS4f6MVPfHQ03ioY+P5qRBqDsvA7iagUFK10+KKJQ==
X-Received: by 2002:a17:903:90d:b0:2a0:acdb:ce0c with SMTP id
 d9443c01a7336-2a3edbaeef5mr114591645ad.29.1767973608260; 
 Fri, 09 Jan 2026 07:46:48 -0800 (PST)
Received: from fedoraemon.neon-universe.ts.net
 ([2406:7400:11d:8d1e:1613:9777:a803:43fd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3ba03f9sm108166395ad.0.2026.01.09.07.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:46:47 -0800 (PST)
From: Avinal Kumar <avinal.xlvii@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH 2/2] drm/panel: panasonic-vvx10f034n00: transition to mipi_dsi
 wrapped functions
Date: Fri,  9 Jan 2026 21:11:57 +0530
Message-ID: <20260109154157.33592-3-avinal.xlvii@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109154157.33592-1-avinal.xlvii@gmail.com>
References: <20260109154157.33592-1-avinal.xlvii@gmail.com>
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

Changes the panasonic-vvx10f034n00 panel to multi
style functions for improved error handling.

Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
---
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 3c3308fc55df..73c5827a15a4 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -44,14 +44,24 @@ static inline struct wuxga_nt_panel *to_wuxga_nt_panel(struct drm_panel *panel)
 
 static int wuxga_nt_panel_on(struct wuxga_nt_panel *wuxga_nt)
 {
-	return mipi_dsi_turn_on_peripheral(wuxga_nt->dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = wuxga_nt->dsi
+	};
+
+	mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
+	return dsi_ctx.accum_err;
 }
 
 static int wuxga_nt_panel_disable(struct drm_panel *panel)
 {
 	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);
 
-	return mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = wuxga_nt->dsi
+	};
+
+	mipi_dsi_shutdown_peripheral_multi(&dsi_ctx);
+	return dsi_ctx.accum_err;
 }
 
 static int wuxga_nt_panel_unprepare(struct drm_panel *panel)
-- 
2.52.0

