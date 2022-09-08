Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5556E5B17CA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 10:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A0510E9C8;
	Thu,  8 Sep 2022 08:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7D810E9C8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 08:55:09 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id pj10so6666698pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 01:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=uacXOofD8iMt8GLUR5lx4NNyko53fwtDtrMNESrEi8c=;
 b=CITPCIDUriXf+nDAVczMxdww75NlJvrkYEzD6+e9xKCS+gVi9AWf5wp4Hx49+wjx/I
 rCeT33PSgA704aayIDWByWvmBlFnby0oJy5zZZRfIRlnO83GPAWQ/7LDkqtcxOPGPp+N
 BHQppY+hkRZRKxeMeRsVquLb/tniJrf6EVcRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=uacXOofD8iMt8GLUR5lx4NNyko53fwtDtrMNESrEi8c=;
 b=A4j9WrWIPS1o3xZ/8VRdB2n4WDTm6DwZ+PBrtiGv8P4LB27PLMkWo5b5vufVnfTKC9
 LCQLfpPpUuQnUfgPaEXAO0rAsioMDK19dQgLX2dRN4wk+zstHIpygLwNqgufBZAECErH
 /B08IWYUcUbmYt8yjWnLB+A1OVieDevlALg/rc133nftVO0Kl7KFDaibkZJLd3aIQamc
 Zq1hHkPM4O0vv43kw3vG3nyQg5RyuG2Uch9HLHxF2zOGfXP9Y/VjeaUBazpgKY1qNdou
 hd7wQjm1rsEIu3o5ZQBVvrv7Fy2OulsC6L5m+UttaLWuz8Q+lhKBG9+BSvVNC8CrURJ3
 OdIA==
X-Gm-Message-State: ACgBeo0ER+knKHPLu/m6fv2SHb47OS666cwDYDkFsIhRnjkaMWSq3g/9
 apodZdUZdiVx72o/z31pCYNk+g==
X-Google-Smtp-Source: AA6agR6NcpB09eefHHYXp6GkJKUOTTDK2AyTs5wLlrRzKJdAfD4PHYm6JQ29Zc8u7kSciiOn6EqWZA==
X-Received: by 2002:a17:902:c94a:b0:16f:81c1:255a with SMTP id
 i10-20020a170902c94a00b0016f81c1255amr7603761pla.35.1662627308604; 
 Thu, 08 Sep 2022 01:55:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:c6ba:fe7c:d2b:242e])
 by smtp.gmail.com with ESMTPSA id
 mj19-20020a17090b369300b001f334aa9170sm1188629pjb.48.2022.09.08.01.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 01:55:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/2] drm/panel-edp: Fix delays for Innolux N116BCA-EA1
Date: Thu,  8 Sep 2022 16:54:53 +0800
Message-Id: <20220908085454.1024167-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 52824ca4502d ("drm/panel-edp: Better describe eDP panel delays")
clarified the various delays used for eDP panels, tying them to the eDP
panel timing diagram.

For Innolux N116BCA-EA1, .prepare_to_enable would be:

    t4_min + t5_min + t6_min + max(t7_max, t8_min)

Since t4_min and t5_min are both 0, the panel can use either .enable or
.prepare_to_enable.

As .enable is better defined, switch to using .enable for this panel.

Also add .disable = 50, based on the datasheet's t9_min value. This
effectively makes the delays the same as delay_200_500_e80_d50.

Cc: Douglas Anderson <dianders@chromium.org>
Fixes: 51d35631c970 ("drm/panel-simple: Add N116BCA-EA1")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 2bef3e707a95..65e3a5361c80 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1295,7 +1295,8 @@ static const struct panel_desc innolux_n116bca_ea1 = {
 	},
 	.delay = {
 		.hpd_absent = 200,
-		.prepare_to_enable = 80,
+		.enable = 80,
+		.disable = 50,
 		.unprepare = 500,
 	},
 };
-- 
2.37.2.789.g6183377224-goog

