Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D2AA2D5B5
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 11:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC76D10E3B0;
	Sat,  8 Feb 2025 10:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="fdjYsbCp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC5B10E0CA
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 10:53:45 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2fa21145217so3753139a91.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 02:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1739012025; x=1739616825; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQrnvzVN+czw/aIxJ1bypX+PwJX4ySE3P9bY6Zh8dF4=;
 b=fdjYsbCpGqRjIcPNr0lceT17U0YDkdckzM6511jm1k+NtXkUthw5oTIlKDl/uyJ/0m
 VK0Qk7/ySn7dl5cnDiOesrN/CNKF8zcHhXzs+M+pQGl6D4siNiLP9zBYdeBXy5hVSYAl
 2QfaLLIyE7/2aX3UDDvdVXzA34AZ6ZMz/slRag/tczauWw5XtwGQjI8hMrIDkIK5HN3O
 X1UUdIhKBwSc9oDvO4IkrJ59AcDqHzB+yuu1eKmLGfsKLNGCzK11xudCs6xMzyeb3pJg
 YMuTSf5q778Glw5KfELC72WQ4Rg9z3Fgqi6fu3kMjzYwQBjeu1c9e5gH7649C1Na3bXU
 gZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739012025; x=1739616825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQrnvzVN+czw/aIxJ1bypX+PwJX4ySE3P9bY6Zh8dF4=;
 b=Zj+P3Hit0MSq7INl//ociK82m+UUaY0JwlFpW0KqwEzJZ3ZW4gtXZKLlKqrhoB0LIW
 +f+1siCHFKy+rrUFcw8mm6wNAupSwlSiDUBRn03V5sXG/GMNYC7RhrckycfbwciUi3bS
 qnpnvGlRV29RkDEOY7pRK2LR2mLPoj1GW+Obp0t1lFhOUmWdvojROjSFgNBFZ2OAsqkQ
 3ZTjxac1ss/Dq5KR1KWx0sRyuaqm3Um60Ku4E7ILeUEPYUG+HkQV+F703mKeEAE33NYA
 SdlpqYvZeq6dLqLgMN73VxgT5NTnyYTSjL6Rj/9TKJJe98Hy5WRzTgmE5F5tBBj1b+Nh
 Y5pg==
X-Gm-Message-State: AOJu0YzFMVHL0oEHNQc2TK9K8CjoDwz/sWWRw/58GxiGVsChopatfXOE
 Y4XNskoXFnHJlP7T9SvQhLI/l5L4lmrMVkGvhBLTvDxXKnVhTAgs3vfJUraZKMA=
X-Gm-Gg: ASbGncvwKJvj92MMH/zh3eKhdsw9d44FpYaH72sWy8QsWApjYUz7ss+Xx0rk4xXvIIv
 NgFdxsS5UH3Ck5ytkuHCAtloBNRBmv4AqSvAcoTV0eaMF3paTr7ih01H1ZTKNKEeLLkfr34Jqpv
 Uf7x8nsij1V7C+bIS1LTRDSkrd1S70ZQaPSsLL2gkYSOpTakO+ukZ2BIn8I5Zd5lHC9TzPVHL9/
 mG+IkVyW09h7DwVT+HwXNQDBiu6czzcdfwO6DF2jz5vbB4cOQSsBvfhrnWVjuJWG26b+XMhq1Im
 iQZXl8yBNDcP7USMxI1UUo/gEVz6QFiXoHWTg8tj90vD/IoXPD5HNIRaBIq5qoU=
X-Google-Smtp-Source: AGHT+IGNH73KvngmIvEBiJnWdA5V2qlSw1SSZo8SpbLAGo12RqBszTDgGsAMmaVXYHfqsOSFIdlxFw==
X-Received: by 2002:a17:90b:510e:b0:2ee:70cb:a500 with SMTP id
 98e67ed59e1d1-2fa23f563b2mr9057596a91.1.1739012025335; 
 Sat, 08 Feb 2025 02:53:45 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa36f185c5sm2142003a91.16.2025.02.08.02.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 02:53:44 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v5 3/3] drm/panel: panel-himax-hx83102: support for
 starry-2082109qfh040022-50e MIPI-DSI panel
Date: Sat,  8 Feb 2025 18:53:26 +0800
Message-Id: <20250208105326.3850358-4-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
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

The starry-2082109qfh040022-50e is a 10.95" TFT panel. The MIPI controller
on this panel is the same as the other panels here, so add this panel to
this driver.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 142 ++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 9a818dea653f..66abfc44e424 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -24,6 +24,8 @@
 #define HX83102_SETPOWER	0xb1
 #define HX83102_SETDISP		0xb2
 #define HX83102_SETCYC		0xb4
+#define HX83102_UNKNOWN_B6	0xb6
+#define HX83102_UNKNOWN_B8	0xb8
 #define HX83102_SETEXTC		0xb9
 #define HX83102_SETMIPI		0xba
 #define HX83102_SETVDC		0xbc
@@ -584,6 +586,121 @@ static int kingdisplay_kd110n11_51ie_init(struct hx83102 *ctx)
 	return dsi_ctx.accum_err;
 }
 
+static int starry_2082109qfh040022_50e_init(struct hx83102 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	msleep(50);
+
+	hx83102_enable_extended_cmds(&dsi_ctx, true);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D9, 0xd1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0xb5, 0xb5, 0x31, 0xf1, 0x33,
+				     0xc3, 0x57, 0x36, 0x36, 0x36, 0x36, 0x1a, 0x8b, 0x11, 0x65,
+				     0x00, 0x88, 0xfa, 0xff, 0xff, 0x8f, 0xff, 0x08, 0x3c, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x47, 0xb0, 0x80, 0x00, 0x22,
+				     0x70, 0x3c, 0xa1, 0x22, 0x00, 0x00, 0x00, 0x88, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x14, 0x16, 0x14, 0x50, 0x14, 0x50,
+				     0x0d, 0x6a, 0x0d, 0x6a, 0x01, 0x9e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_B6, 0x34, 0x34, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_B8, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x84);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1b, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x38, 0x38, 0x22, 0x11, 0x33, 0xa0,
+				     0x61, 0x08, 0xf5, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x1e, 0x30, 0xd4, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, 0x13, 0x07, 0x00, 0x0f,
+				     0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, 0x03, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x37, 0x06, 0x00, 0x02, 0x04,
+				     0x2c, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x3b, 0x03, 0x73, 0x3b, 0x21, 0x21, 0x03,
+				     0x03, 0x98, 0x10, 0x1d, 0x00, 0x1d, 0x32, 0x17, 0xa1, 0x07,
+				     0xa1, 0x43, 0x17, 0xa6, 0x07, 0xa6, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x2a, 0x2b, 0x1f, 0x1f,
+				     0x1e, 0x1e, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b,
+				     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09,
+				     0x0a, 0x0b, 0x20, 0x21, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x02, 0xaa, 0xea, 0xaa, 0xaa, 0x00,
+				     0x02, 0xaa, 0xea, 0xaa, 0xaa, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x07, 0x10, 0x10, 0x2a, 0x32, 0x9f,
+				     0x01, 0x5a, 0x91, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12,
+				     0x05, 0x02, 0x02, 0x10, 0x33, 0x02, 0x04, 0x18, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0x7f, 0x11, 0xfd);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00, 0x00, 0x00, 0x80, 0x80, 0x0c,
+				     0xa1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x03, 0xff, 0xff, 0xff, 0xff, 0x00,
+				     0x03, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x00, 0x2d, 0x01, 0x7f, 0x0f,
+				     0x7c, 0x10, 0xa0, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x02, 0x00, 0x00, 0x10, 0x58);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x0a, 0x0a, 0x05, 0x03, 0x0a,
+				     0x0a, 0x01, 0x03, 0x01, 0x01, 0x05, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x03, 0x1f, 0xe0, 0x11, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xab, 0xff, 0xff, 0xff, 0xff, 0xa0,
+				     0xab, 0xff, 0xff, 0xff, 0xff, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xfe, 0x01, 0xfe, 0x01, 0xfe, 0x01,
+				     0x00, 0x00, 0x00, 0x03, 0x00, 0x03, 0x81, 0x02, 0x40, 0x00,
+				     0x20, 0x9e, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0xff, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaa, 0xab, 0xea, 0xaa, 0xaa, 0xa0,
+				     0xaa, 0xab, 0xea, 0xaa, 0xaa, 0xa0, 0xaa, 0xbf, 0xff, 0xff,
+				     0xfe, 0xa0, 0xaa, 0xbf, 0xff, 0xff, 0xfe, 0xa0, 0xaa, 0xaa,
+				     0xaa, 0xaa, 0xaa, 0xa0, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_E1, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x96);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x84);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	hx83102_enable_extended_cmds(&dsi_ctx, false);
+
+	mipi_dsi_msleep(&dsi_ctx, 110);
+
+	return dsi_ctx.accum_err;
+}
+
 static const struct drm_display_mode starry_mode = {
 	.clock = 162680,
 	.hdisplay = 1200,
@@ -694,6 +811,28 @@ static const struct hx83102_panel_desc kingdisplay_kd110n11_51ie_desc = {
 	.init = kingdisplay_kd110n11_51ie_init,
 };
 
+static const struct drm_display_mode starry_2082109qfh040022_50e_default_mode = {
+	.clock = 192050,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 160,
+	.hsync_end = 1200 + 160 + 66,
+	.htotal = 1200 + 160 + 66 + 120,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 115,
+	.vsync_end = 1920 + 115 + 8,
+	.vtotal = 1920 + 115 + 8 + 28,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct hx83102_panel_desc starry_2082109qfh040022_50e_desc = {
+	.modes = &starry_2082109qfh040022_50e_default_mode,
+	.size = {
+		.width_mm = 147,
+		.height_mm = 235,
+	},
+	.init = starry_2082109qfh040022_50e_init,
+};
+
 static int hx83102_enable(struct drm_panel *panel)
 {
 	msleep(130);
@@ -924,6 +1063,9 @@ static const struct of_device_id hx83102_of_match[] = {
 	{ .compatible = "kingdisplay,kd110n11-51ie",
 	  .data = &kingdisplay_kd110n11_51ie_desc
 	},
+	{ .compatible = "starry,2082109qfh040022-50e",
+	  .data = &starry_2082109qfh040022_50e_desc
+	},
 	{ .compatible = "starry,himax83102-j02",
 	  .data = &starry_desc
 	},
-- 
2.34.1

