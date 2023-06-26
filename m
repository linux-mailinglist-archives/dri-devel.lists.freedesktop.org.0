Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF4673DE79
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCAB10E1F6;
	Mon, 26 Jun 2023 12:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6212310E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:07:35 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-262e66481c4so312347a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1687781254; x=1690373254; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dsWwmk/RTc3MCrJdzjtuf6nawuzuNbHJKPGxRq8Ztoo=;
 b=VjdPYhzkhXM3bRJ+9tVCTvwJrS6rzB7mH5eGuTvD2Vh0bA9Si8efDAFhm3BNUPvY/O
 qAS0HGM5cMsULL9Fku+QCYiIDV6QiFtpPQfA8m3JQxO7quOf/jwxGbIjD1Rf25qz/TgD
 TvBkEhak5g1o014HV595HoFzL3I4qSrA7QYwq7FGhJChqVFwq26xsg1X5AbTAey3QkEv
 KlrMzkmA/Kp1CMHrgxO/mk4g5wBk9jixgE69m3RuQkmVxENu0xtMH4yqkPHEEorBxlsd
 R9AJdYFBTqdmuFeHkVdCyozCCgxM4itmuoRQkyyJlpg6oRjuS7A+qqECK76sKtR2mPzn
 luFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687781254; x=1690373254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dsWwmk/RTc3MCrJdzjtuf6nawuzuNbHJKPGxRq8Ztoo=;
 b=FNjl+DaSNG4sugY+0ezDY7DgA22GsI4QkN4JZKsU3/X2vtOKiVOL8kEU13UAW+w0SK
 AtUV+gXtMT1v0bB99h20jxmgp/kn2jxr5gH13PWn9gPogOCO55MdMrihaykVo+nzyeIc
 /429fpUjHE4sDy6fi69WrrwT+UPeX12ocUForS2vD+gsqTLpeo5ca9JepwW4teWZKKPb
 StcHzhOUBEGo17CJ2vy0lkJ0u0+GiR+BgLyMlcN+UH6V/lS76b9h8jV5O6MuPBmR6Jw9
 nVs+wmJhcNezktMoh8KMRBMhi/mdbZM1owBFv/t43jRsCROdlumTYRrAEHRfiII854JE
 G8kA==
X-Gm-Message-State: AC+VfDwCx/Z2OqyruDb06XdgdCNmXWhWedCO9etv7qVkGg2CfQDwkEiT
 GxUWxsOBO9Sm/WpHJBaFYrYAGoiwQXaCXOKOpkw=
X-Google-Smtp-Source: ACHHUZ6Lv+/DVcuw+jeotefNu+yXcBEbRRTnoBocuIPtCLcr2QrLO+/6BWN1wJO2vGsKNXh9ncDknA==
X-Received: by 2002:a17:90a:1a03:b0:262:ce8f:a3e with SMTP id
 3-20020a17090a1a0300b00262ce8f0a3emr2070091pjk.42.1687781254513; 
 Mon, 26 Jun 2023 05:07:34 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a17090aea0500b002532ddc3a00sm6010021pjy.15.2023.06.26.05.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 05:07:34 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 airlied@gmail.com, dianders@google.com, hsinyi@google.com
Subject: [PATCH] drm/panel: Fine tune Starry-ili9882t panel HFP and HBP
Date: Mon, 26 Jun 2023 20:07:24 +0800
Message-Id: <20230626120724.161117-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because the setting of hproch is too small, there will be warning in
kernel log[1]. After fine tune the HFP and HBP, this warning can be
solved. The actual measurement frame rate is 60.1Hz.

[1]: WARNING kernel:[drm] HFP + HBP less than d-phy, FPS will under 60Hz

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 3cc9fb0d4f5d..dc276c346fd1 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -2139,9 +2139,9 @@ static const struct panel_desc starry_himax83102_j02_desc = {
 static const struct drm_display_mode starry_ili9882t_default_mode = {
 	.clock = 165280,
 	.hdisplay = 1200,
-	.hsync_start = 1200 + 32,
-	.hsync_end = 1200 + 32 + 30,
-	.htotal = 1200 + 32 + 30 + 32,
+	.hsync_start = 1200 + 72,
+	.hsync_end = 1200 + 72 + 30,
+	.htotal = 1200 + 72 + 30 + 72,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 68,
 	.vsync_end = 1920 + 68 + 2,
-- 
2.25.1

