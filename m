Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4E2C1F81
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DCB6E235;
	Tue, 24 Nov 2020 08:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBAA89CB9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 10:46:51 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id bo9so16836619ejb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 02:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bf3Dad1zscNI33FoKwPu/py5sOPRwrYDQb8QYdxZRy4=;
 b=VyY/UaY2A1uZvQ9rve79LjJiOJL1CI3dvsrV3swg09sAABwIgosjjta5q8zhkrPoZZ
 5zImlhFEsF3ai58SF4irPNNvGoRzCyvQztYAx8s+zLmSXjGZPa4RtMzUBMMT0cLt23/C
 yHjZ1Yj8/hds3Ex7rjyXLJLmFMIi2ICX9C4t2uVm1Fse395iKjIwzbqEi+10ZfRgT6Iq
 sAq6GIQrrm5vWPAyO3ox79zmrxHRCEhXPNxlT816oaz9+2B3VFo0jHrGboJxWIB/PPoG
 7W+5YxoOUheRkD5Zysd3l0azMFn4ne6mj/iIiaJTmtMLK+ufVDO7sVGtP0KrUy8Hs0Lm
 QdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bf3Dad1zscNI33FoKwPu/py5sOPRwrYDQb8QYdxZRy4=;
 b=YQZShUf40N6/Okpu9tfERcmeA45aFJpmp/CdKUTihOKoQZRsYDi8Q37xU3vGPmg4Yk
 OWI9Vy6o5zcjGOhHhcBEWe/a38+HkG0G2jhuXz7PEh21AzSwq03y9+tcyM+f5FzpefFb
 8o4qwAdWJO+tYQwd5SrOT/ritEy2m+oe67GamRtnfX7/EaCix5BE+1XUeXxmhVgjKajx
 LGmQ7Qi2YQP/bkBGiGFXhgR0JgQ69fDVzvfvd7qAGlPgiW4khoB1cqiHnEA2P1/aVuzP
 HDZl6sQcXc+KzzYNG2fYida89dvpdUhDWC0J2CqJCT3oG/3SH9fq2Q6WUSpcWg7ybTDJ
 74UQ==
X-Gm-Message-State: AOAM532hOlnq44ZarxSGiueHVsnd84KTEa/mXqRFsEEX514yInPfCGAD
 KXlgdgK65msl+rFkm7qV4sdO/g==
X-Google-Smtp-Source: ABdhPJyMBnVAkcORAG/kSFMYC3vQyJU5E/KKGMO0DHSQoIjEO9c+wUaT0pEXyAB7B9n3QJvhfEnEuQ==
X-Received: by 2002:a17:906:468d:: with SMTP id
 a13mr45376085ejr.253.1606128409768; 
 Mon, 23 Nov 2020 02:46:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:f25:a362:ce86:20d])
 by smtp.gmail.com with ESMTPSA id
 gf9sm4792416ejb.18.2020.11.23.02.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 02:46:49 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 John Stultz <john.stultz@linaro.org>, Peter Collingbourne <pcc@google.com>
Subject: [PATCH v1] drm/bridge: lt9611: Fix handling of 4k panels
Date: Mon, 23 Nov 2020 11:46:16 +0100
Message-Id: <20201123104616.1412688-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: Alistair Delva <adelva@google.com>, Anibal Limon <anibal.limon@linaro.org>,
 Vinod Koul <vinod.koul@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

4k requires two dsi pipes, so don't report MODE_OK when only a
single pipe is configured. But rather report MODE_PANEL to
signal that requirements of the panel are not being met.

Reported-by: Peter Collingbourne <pcc@google.com>
Suggested-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Tested-by: John Stultz <john.stultz@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index d734d9402c35..e8eb8deb444b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -867,8 +867,14 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_mode *mode)
 {
 	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	return lt9611_mode ? MODE_OK : MODE_BAD;
+	if (!lt9611_mode)
+		return MODE_BAD;
+	else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
+		return MODE_PANEL;
+	else
+		return MODE_OK;
 }
 
 static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
