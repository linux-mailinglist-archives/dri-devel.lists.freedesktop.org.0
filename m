Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D147EA936
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 04:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D4310E0C0;
	Tue, 14 Nov 2023 03:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892E610E0C0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 03:45:14 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5875c300becso3148600eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 19:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1699933513; x=1700538313; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OVsN8rkMK9ieuHR4mwXwPpKRTxt1HOM2CVzwFQIOZas=;
 b=n9+mvwXLrCuIYDywroh+KUF9VvZsdwZ1KmlqK1SO0TLSTtMuplLkSdWKuP2VFwzfuK
 d1z3z1vwJnhJAYO8A6w8RZdXS3LrshpVn/q2L4s3lAKygOpYXTPVJRzNvQk2pV/+qmth
 MhOwgWjdbO9oTTrDIS734iXbaxBm+IDuKTiiX0ApPJyf2XW02VPBuocnRvCDDmUPsddt
 jDHgL/QYZ2uLjG3kp3I4LxeXlkcngSn5fJFRqbS9Qt9Wru9nFJRTn+Mvpeq4Zhr55J+b
 AiPyDtjPGBUk/F+hKvBX6Pf5xkbMfoinqw60n/yC5S0XsrrcZbJWq7ueo83cbkVF5Yw3
 XSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699933513; x=1700538313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OVsN8rkMK9ieuHR4mwXwPpKRTxt1HOM2CVzwFQIOZas=;
 b=YbHtYlHx/S1ZB2fnXin6N5gpruXYQMFnk69aGPGdQPtE7iFkyYTWhwgj1IX1zescqV
 XzU249ELbxp2Z0+jxPIpVA6SQRfpIVw633FWahpHLaa+NCZ782gyJ281DDyGxSZ7Dl3w
 KGtAwXy1C+2geomd1WoHQ7VCHZU57yulOov0TqZ/RawIpN+BL4YExUacZw69kAmda2Ga
 DpdUJXPtno48oVw1i/dpS6K5ZgwJLGkq2wxp0OppeINUDckktu4qqup/3duSTOotB6vu
 RxCHjsklk1kQMfL9NEUoVpL9co8lTQG/pKaIehwYaGrcd1SvzYhc39r2pm3qd+ZKN718
 JGag==
X-Gm-Message-State: AOJu0YwMd7+qGVV+cz/oX6x+8wE8UaN4C7ylBPKXggFUyiNJ3uUgI3sz
 xPyL1i7/2EUFds9qbwXa3AbHpQ==
X-Google-Smtp-Source: AGHT+IESMio62SS8HuDNPEPniTlgmN9zRq4U+au5lX1q5TLOZ250iTNbs6a2s8sAPisG8pz1DMtGaQ==
X-Received: by 2002:a05:6358:338c:b0:16b:a9f5:cde0 with SMTP id
 i12-20020a056358338c00b0016ba9f5cde0mr1557304rwd.29.1699933513493; 
 Mon, 13 Nov 2023 19:45:13 -0800 (PST)
Received: from xu.huaqin.com ([63.221.192.42])
 by smtp.gmail.com with ESMTPSA id
 i189-20020a6387c6000000b005bd3f34b10dsm4823112pge.24.2023.11.13.19.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 19:45:13 -0800 (PST)
From: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Subject: [V2] drm/panel: auo,b101uan08.3: Fine tune the panel power sequence
Date: Tue, 14 Nov 2023 11:45:05 +0800
Message-Id: <20231114034505.288569-1-xuxinxiong@huaqin.corp-partner.google.com>
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

Fixes: 56ad624b4cb5("drm/panel: support for auo, b101uan08.3 wuxga dsi video mode panel")
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

