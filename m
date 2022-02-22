Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756704C0475
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 23:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9682910E2ED;
	Tue, 22 Feb 2022 22:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8112110E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 22:19:08 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso332003pju.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 14:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NvDRTgPxChmGOwbBu1IEeDWngy/wxmiyuXIu4qG8GgY=;
 b=M8EcTdQKHhkZyHx6loaC8hCQMviRsxMW7ziLP6j7P+589ry2FmHHmOkSjfvTR5X/FP
 4etnTp1OyTf5rf9gVFoADJ80z3VoOe1uV/Hn3rU4LMHFtm3ymH8VRjfv0sTBBc0QfUf8
 hPPfaIccp74UaAN/hkXda/dcjm9W5aBRryT+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NvDRTgPxChmGOwbBu1IEeDWngy/wxmiyuXIu4qG8GgY=;
 b=yAZKyPTW0hDtszrMPm6ioOJPlrXmbDNLvMLHawwAaFJO+51fxkyuDE3xwv1njCb23W
 rTAoWTcfzhrEqW3luHUSLCIXxB++BcB9bmXhYGlI9OJsanEhdp3eAqJErEkwW9dZNQp1
 B2yeOxTOwdw/DqOonYF0wXaLZI62UouxqU2vMfV2sbpkYasaUVafs+zBNU4y8Lnhwm9h
 ga6tEdok6cjxpkPqC1fFwYoVccIJKsfy8uas3mXG+1OOyoUIuAULDBPczAjzCm/tWEwQ
 pJqQHczSe6g4E3LSJ50ngEEFHCHp+I7xtPNrGcuHsm0YCeEPusNlIbTRf3v4kgpzPfe1
 2bpw==
X-Gm-Message-State: AOAM5330y3952U5mqClyndBsBCZjfnYP3aoQb2YzktzDIir9mHBQmhWs
 mmATinuujZFRKcMAOf8beCiwltOHtZco7EFBuC4=
X-Google-Smtp-Source: ABdhPJz6kzGJn4fxm6ra8m4EVhyRNC2Fji6XMAc/wBelVEhtvnboO+xynWuFmQZA/IDpglCz2/axmw==
X-Received: by 2002:a17:90a:fe87:b0:1bc:6928:86c7 with SMTP id
 co7-20020a17090afe8700b001bc692886c7mr6199022pjb.129.1645568347984; 
 Tue, 22 Feb 2022 14:19:07 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:ab7d:6b2a:b01e:d6ae])
 by smtp.gmail.com with ESMTPSA id g63sm17345756pfb.65.2022.02.22.14.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:19:07 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Properly undo autosuspend
Date: Tue, 22 Feb 2022 14:18:43 -0800
Message-Id: <20220222141838.1.If784ba19e875e8ded4ec4931601ce6d255845245@changeid>
X-Mailer: git-send-email 2.35.1.473.g83b2b277ed-goog
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Brian Norris <briannorris@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PM Runtime docs say:
  Drivers in ->remove() callback should undo the runtime PM changes done
  in ->probe(). Usually this means calling pm_runtime_disable(),
  pm_runtime_dont_use_autosuspend() etc.

We weren't doing that for autosuspend. Let's do it.

Fixes: 9bede63127c6 ("drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 38616aab12ac..fb6c588b0f71 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1758,6 +1758,7 @@ static inline void ti_sn_gpio_unregister(void) {}
 
 static void ti_sn65dsi86_runtime_disable(void *data)
 {
+	pm_runtime_dont_use_autosuspend(data);
 	pm_runtime_disable(data);
 }
 
@@ -1817,11 +1818,11 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 				     "failed to get reference clock\n");
 
 	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(pdata->dev, 500);
+	pm_runtime_use_autosuspend(pdata->dev);
 	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
 	if (ret)
 		return ret;
-	pm_runtime_set_autosuspend_delay(pdata->dev, 500);
-	pm_runtime_use_autosuspend(pdata->dev);
 
 	ti_sn65dsi86_debugfs_init(pdata);
 
-- 
2.35.1.473.g83b2b277ed-goog

