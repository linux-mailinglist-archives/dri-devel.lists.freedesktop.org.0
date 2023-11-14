Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977797EA9B0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 05:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF0A10E1B8;
	Tue, 14 Nov 2023 04:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB18110E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 04:42:20 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6bee11456baso4446656b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 20:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1699936940; x=1700541740; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lzKzHTgZGhEyoeuQssnxqUJngp24/YDbxcA+JAPu/wI=;
 b=14iDC8LbmraF3FyOG1GQF27HFXJHpNfY05lDkcqC93FXQoCu2TBb/9kTb2CkLZxwDs
 l8NT4IZ7mZ7DAeacZKDDmrdZ+q98S1W3zGv/gH2sIm2wqClfUxPsxd67W2TpLNNciizF
 r+tWSP5uOcwBpvY3HDdymFs7JrCvX1SqMjb6w10QJmXy3sCUoqvAi2RHraNezGrqDUfm
 O1MK3UdLSw+1t5YjuROzkLr4j2+2hMNTBtgt88g69JTBcSJSwUKBYF07nDN9f47CKZHs
 6JCyuMn6UTX07L9/bdu3tePMFzSZ9a3c0N8LuE67KCQ0W6Ka/L6LfWUQsrsBTp7oWUEw
 D9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699936940; x=1700541740;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lzKzHTgZGhEyoeuQssnxqUJngp24/YDbxcA+JAPu/wI=;
 b=Gd9jFvUMAK/F2x/gVQ9tBaQtKzlAD0MZym4Ey6ZXkXJnZzTUy0YQouaj5wVe+HZmLn
 DoE3Jy/igJ1xJuQ5pGAcsJYzchMJxeGLFQhT9ILJGWoxzDOBteatY136sqE/yyPdZrLl
 Y5HQITMSQ1mZwZZsvmAnNTkZ4PmBFfeRTR8ZCr2ccx1eHYN2+68PAmQun+LlGdYbakaz
 jZr+A+4Az2rFdWFbWs47u88athF4F2gcwLTg/q6pX0o9wWWAa8B9vk1EqaMg5dZLFPTS
 Kev/w3FkrPIyRb9eLpluqE/ZY5/PYWVMQR2/YZw1+GI0I/kqZl+bhVcH+OjlnaBcf0CU
 wPzg==
X-Gm-Message-State: AOJu0YyNYpJ8IgeKW8knCM++eDzPHCUAUZSpbyveFY/uzV+MITjzDChR
 P2NfI0Ffa8QTi69ad708drGejw==
X-Google-Smtp-Source: AGHT+IHEaaU52rEIf+IBygqIOYjs5C2JSimOni6Kwqbl7VnO7jskR+nTlJjjOGr4HjUfJTVqL5A8cg==
X-Received: by 2002:a05:6a20:d394:b0:186:e41:6f09 with SMTP id
 iq20-20020a056a20d39400b001860e416f09mr6384835pzb.33.1699936940331; 
 Mon, 13 Nov 2023 20:42:20 -0800 (PST)
Received: from xu.huaqin.com ([63.221.192.42])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a170903019200b001c47541ecd7sm4846238plg.250.2023.11.13.20.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 20:42:20 -0800 (PST)
From: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Subject: [V3] drm/panel: auo,b101uan08.3: Fine tune the panel power sequence
Date: Tue, 14 Nov 2023 12:42:05 +0800
Message-Id: <20231114044205.613421-1-xuxinxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org,
 Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For "auo,b101uan08.3" this panel, it is stipulated in the panel spec that
MIPI needs to keep the LP11 state before the lcm_reset pin is pulled high.

Fixes: 56ad624b4cb5 ("drm/panel: support for auo, b101uan08.3 wuxga dsi video mode panel")
Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
---
Changes in V3:
  - Updated the Fixes tag's style.
link to V2: https://patchwork.kernel.org/project/dri-devel/patch/20231114034505.288569-1-xuxinxiong@huaqin.corp-partner.google.com/
---
Changes in V2:
  - Updated the commit message and added the Fixes tag.
link to V1: https://patchwork.kernel.org/project/dri-devel/patch/20231109092634.1694066-1-xuxinxiong@huaqin.corp-partner.google.com/
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

