Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229277E6E4F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 17:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4A910E8E1;
	Thu,  9 Nov 2023 16:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422E910E20E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:26:46 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50943ccbbaeso870081e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1699522004; x=1700126804; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OtUS9KOQgir7QLPY56WWpZ4C4Ru6cfGdt3ZmbrwNufE=;
 b=AdqFnLkMzRCellkTBWPZi+p1mAfIxGNrV91Gw5T/UVNtkOQe4e/OvpgNwC2eB0IllX
 dMr6D3U/gsHzZJ+thYWxXRE63vJgf3TZT5YLsp6qUZho4JVg58HsOrYR9JnhKlyz7ZPN
 ZCcuVthYch8UtQiXh2vjgJlU8ys6rAS4LREfnzRgUVpNkijLwfRxtFyVEZ2JeVyGZ2wk
 rx+t1LFY/NMeYJ+WhgHuVWc94sHbVZnoOmCOA88tsa8L/x6Aw6kRMv62Dpqmb0pujW2/
 PDCApYiG8GnkIWLTCGKcTTN+6xVR3YZJZ3S5OvxL+Xypk7fZHc0YVbKwVXiDQhphsauZ
 VmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699522004; x=1700126804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OtUS9KOQgir7QLPY56WWpZ4C4Ru6cfGdt3ZmbrwNufE=;
 b=JlJvI8wBKALLkYxffv7/HybQ8LKIFmInoihny0xUNIfUwcEzF+9wWgUh6KUnD3ZPIV
 /uPnKVjF7PG4OFc2iqV88ZxTQluwO5cm1akEVmLGKvRhChWunXRnaA/lpTpLZuVBh04V
 ZQvfe24lGuR8LpmF00Q2c83UDyxiskQkmx8f9Y3XTEhdWsl5qaBadf5QLjRTvA1/acfr
 92jjQTOnhHtb0v8zU2/7OODrwaSeQ1MQ9A2B23m44GCf1FOi5T1WDBWxwiRdqsS07NaH
 A7r3vtTA9OwdH4lr/wKi50zhEOlQKax87XE3+U3SSNJzf5vUfVRNc2HOApN2y/CFUHLY
 99IQ==
X-Gm-Message-State: AOJu0YzR7JJ3MKVEkOVnhnfVp/d2ZueUPHwXp7RYUiOm/Jngf5UXv8hr
 AC/q6YjpLaZz3Z9mYmLVNofABQ==
X-Google-Smtp-Source: AGHT+IHJK/nj9TdR5GrGrqyyLWh21pYlSsJPVw10oqT7SrcDHd5Pm4lDsK8bIAFZ9V6f2Wd1q8NV6w==
X-Received: by 2002:ac2:4305:0:b0:503:17fd:76bb with SMTP id
 l5-20020ac24305000000b0050317fd76bbmr967348lfh.39.1699522004253; 
 Thu, 09 Nov 2023 01:26:44 -0800 (PST)
Received: from xu.huaqin.com ([63.221.192.42])
 by smtp.gmail.com with ESMTPSA id
 x14-20020adff0ce000000b0032fb17c65desm6949575wro.19.2023.11.09.01.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:26:43 -0800 (PST)
From: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Subject: [PATCH] drm/panel: auo,
 b101uan08.3: Fine tune the panel power sequence
Date: Thu,  9 Nov 2023 17:26:34 +0800
Message-Id: <20231109092634.1694066-1-xuxinxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 09 Nov 2023 16:09:48 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For "auo,b101uan08.3" this panel, it is stipulated in the panel spec that
MIPI needs to keep the LP11 state before the lcm_reset pin is pulled high.

BUG=b:309908277
TEST=emerge-kukui chromeos-kernel-5_10

Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 9323e7b9e384..a287be1aaf70 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1709,6 +1709,7 @@ static const struct panel_desc auo_b101uan08_3_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		      MIPI_DSI_MODE_LPM,
 	.init_cmds = auo_b101uan08_3_init_cmd,
+	.lp11_before_reset = true,
 };
 
 static const struct drm_display_mode boe_tv105wum_nw0_default_mode = {
-- 
2.39.2

