Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A22857E6E4D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 17:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E3F89A88;
	Thu,  9 Nov 2023 16:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67DD10E082
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 10:47:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40839652b97so4524625e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 02:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1699526843; x=1700131643; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OtUS9KOQgir7QLPY56WWpZ4C4Ru6cfGdt3ZmbrwNufE=;
 b=s04nlgkd4gDB9kIgfpWWIeFFE5j1UxPfr9QG6Sz0cBfFVGJnsguBQPF+LXkAoA599e
 jDzPvBamq3VcejnvkWec0DcGVaKKgTq2RQOkxmp17Cb+VAimpr8o8wpDrw0Wx/ri8pP6
 Pep6icm/X7bphb3dyJUIiX5rShUuoI6D8M4Xg02JCuSKZntLxECTvSxScx4YxG6NUvcJ
 LDEZsSXTvZOJFMZS3G7mFIsoKyXE+lhctmJ+/ICl5QyLIEY0nkTY3pHF8sQtyUS004ws
 KfAieW24DzAhPBh1Ybc3sGwpa6YKX5EQNM6eM+kHMRccPFGqXJtSnGSh5Yno4QV3am/b
 d4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699526843; x=1700131643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OtUS9KOQgir7QLPY56WWpZ4C4Ru6cfGdt3ZmbrwNufE=;
 b=Qf3cdljxvhyV+W9CV/rgjPFgmky2JyJXF25okaMFpafj5lgMsNm0MpKcC5WcU2PSNL
 dsAUkbfzVHh0U50aAsW3Lip2HCbMrhehXvQji9ZtH71chTG6kuU3BBIQ6jlMGSKzu4ME
 qLewQ7J//EZaUQvSCVv49j/3NbBHl9C2XIhiz5AA37LAe5z62eSe2E0CA+uzt0teiCuc
 st2vJ6sjpy7+/nS7UFGRjbE/MsCs+XvvhP/wJ0Sxtji4D8P2+gMeECPBv2TCI0cj0fxA
 7oGFLqT+jY6EGiCBFo91GWRUzvrIcN/bcd5G2zJ1uQyVhbU+eR8JiUhTo9BAnJL1lutu
 rV+Q==
X-Gm-Message-State: AOJu0YwA0L/DytX4zXEQcfWeWJXl4cqpmWi7dNRIaO1PTYta40pzTXVR
 uoqTfOgo2kq9ccWtltHftNyqJA==
X-Google-Smtp-Source: AGHT+IEUQ+pvpvGxswh65KLLAMCjD9WolAOjkh6BWjTWehA+OZ/WzUvaXt0ISyfbK47vPdD6ubxSRA==
X-Received: by 2002:a05:600c:2046:b0:405:75f0:fd31 with SMTP id
 p6-20020a05600c204600b0040575f0fd31mr4137119wmg.31.1699526843218; 
 Thu, 09 Nov 2023 02:47:23 -0800 (PST)
Received: from xu.huaqin.com ([63.221.192.42])
 by smtp.gmail.com with ESMTPSA id
 m39-20020a05600c3b2700b00405bbfd5d16sm1709037wms.7.2023.11.09.02.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 02:47:22 -0800 (PST)
From: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Subject: [PATCH] drm/panel: auo,
 b101uan08.3: Fine tune the panel power sequence
Date: Thu,  9 Nov 2023 18:46:50 +0800
Message-Id: <20231109104650.1852828-1-xuxinxiong@huaqin.corp-partner.google.com>
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
Cc: xiazhengqiao@huaqin.corp-partner.google.com, devicetree@vger.kernel.org,
 Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhouruihai@huaqin.corp-partner.google.com,
 yangcong@huaqin.corp-partner.google.com
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

