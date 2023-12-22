Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FB681CDC0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD2C10E844;
	Fri, 22 Dec 2023 17:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEC610E7F8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:26 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3368abe1093so1458591f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266944; x=1703871744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U2HtmTELSCmQNqADg2Zx1cwuvSj7RPiUvZpCNIv/8+8=;
 b=PBDYCdN4Sn+/FfRpBwHQ9BRJBKmz839wdAOKrItorEgYcB1Mce1xUK3VYKV209tnqQ
 33x7AX4cC2qNY7mEVP5hyuR/YJCzAuJnGPVwvf4Y4CmgRDFn4RjXctLWplX2CcfMcRn4
 YEaJbylUj3RXD3Xr6FISORnYuDKwQsGmOmu53oEY0Ex5CPLcckANHQB4XadRW2DEuH+q
 LqrwfzoXyTJtvJJ2i9+pNyvZ84nQQmbN2kqcYR6bDBRE9eT95peClzcqxPkn6qJyLwm/
 u9XrwVxAAm1ge9arR8tnfWftSKDI6lteOau9YuciuO24uw3vYvXlXFMs3TRBgX1Sx4kl
 NHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266944; x=1703871744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U2HtmTELSCmQNqADg2Zx1cwuvSj7RPiUvZpCNIv/8+8=;
 b=E1OXE7IiyRGHBE6Rcxp5mSwIzq2HXyYKJQ+hEO0ECetozNYjMs/70VF0zRLBAJ31dU
 rVofweo0vvMFMDtw+pYhqvEEuhOqMuFDaFZqRcZGNPF0TDmne6ZtBZx7PyGh+I42YpTi
 Ys1tS+zqGZdlTMC5blSYeGaep1TXwd/KvG0jIm3Fb95caVAQrSouTUt6dyutBkTGPjlR
 tv6TdTNRBdL/SHMsyeApaJkdpxmZj9vDtbru/u5q0p1ZJYRTF38zPptDr+LXdPr4J03G
 RcPcygr6KBr8BKT4NFIe0Ep3UPmgkDV8RsqgvvzXO1RfgjKVqj+spVSvfjP/TC3JGSdG
 3POQ==
X-Gm-Message-State: AOJu0YyrfCdVIfcGspCBd9TeQ08uWuQidSXAKX72XrKQ8UEwFhF7nf+Y
 kKQdShL02qKL4zvx/9vVRw==
X-Google-Smtp-Source: AGHT+IFV/fIOXodbE6RmpDPeWLOnH4XmVWoyKpBmq+L8MCu5fyIARaUJmQScH13sxNwDp3moadiGgQ==
X-Received: by 2002:adf:dd8c:0:b0:336:77a3:2fbf with SMTP id
 x12-20020adfdd8c000000b0033677a32fbfmr947364wrl.31.1703266944629; 
 Fri, 22 Dec 2023 09:42:24 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:24 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 03/29] drm/rockchip: inno_hdmi: Fix video timing
Date: Fri, 22 Dec 2023 18:41:54 +0100
Message-ID: <20231222174220.55249-4-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Zheng Yang <zhengyang@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The controller wants the difference between *total and *sync_start in the
HDMI_VIDEO_EXT_*DELAY registers. Otherwise the signal is very unstable for
certain non-VIC modes. See downstream commit [0].

[0] https://github.com/rockchip-linux/kernel/commit/8eb559f2502c

Fixes: 412d4ae6b7a5 ("drm/rockchip: hdmi: add Innosilicon HDMI support")
Co-developed-by: Zheng Yang <zhengyang@rock-chips.com>
Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - none

changes in v3:
 - none

changes in v4:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 6e5b922a121e..345253e033c5 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -412,7 +412,7 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HBLANK_L, value & 0xFF);
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HBLANK_H, (value >> 8) & 0xFF);
 
-	value = mode->hsync_start - mode->hdisplay;
+	value = mode->htotal - mode->hsync_start;
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDELAY_L, value & 0xFF);
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_HDELAY_H, (value >> 8) & 0xFF);
 
@@ -427,7 +427,7 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 	value = mode->vtotal - mode->vdisplay;
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VBLANK, value & 0xFF);
 
-	value = mode->vsync_start - mode->vdisplay;
+	value = mode->vtotal - mode->vsync_start;
 	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDELAY, value & 0xFF);
 
 	value = mode->vsync_end - mode->vsync_start;
-- 
2.43.0

