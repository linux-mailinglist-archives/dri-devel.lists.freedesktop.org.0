Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF166B822
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 08:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6AF10E1D1;
	Mon, 16 Jan 2023 07:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBC310E1D1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 07:24:11 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so33006721pjk.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 23:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ni4uZerb82m6sG9PyWeah+pcBmtj9ALkxTiSi64ZLJA=;
 b=eZ0C9MzdHljfc0iZikOy6ACBmYGakhCzHaNk+ISGQS/AYhTbmGS85Ocf4VdKXS6J6g
 I8zU46FOzy8IxXnyZ7mDRivZNDcKEQIcnAXAcjLCxGynqMBM3tHGhMxMG7EjLWC8rewr
 r81qcBuGrWNd2j42VFSgoeflk+AUpWpe9KCFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ni4uZerb82m6sG9PyWeah+pcBmtj9ALkxTiSi64ZLJA=;
 b=DcWdfrpeVKwgfH6vHu3aH4gInYCCBL64ioMpAM1BKG0GIldNK+sFOuKfIdnuxXSVyq
 Bj5hUewEDGCqrlmoCCvrCGNC03eY+zZxcrbjwNBVMutnH39BN/a996GxBgJczuO2FRsz
 sZBfi0A/d6637t9W1mxF6vEPC3mNqilZ5guNY9CpWK9A/3uKellSd6GQfzVYtgh0TibW
 jF2hrhTBucfQ24ok+gImitRsZzd3wn7WoOsakU+yG4cWbdMn/k+duhPs2kuyXLgWTjl8
 +TZfNVauMLTutRCA+zDGuL2QARx9o3lV3edRlGgV+SXuCfdxwPeSg1/cIjZfcOmGzLgo
 gIZg==
X-Gm-Message-State: AFqh2kojLJfL4BYDQ4Vc6owId//OLni3CDeydkIV4uF1lNr3goiFWgNL
 Fk/QJBY9ce3l4X5yzN7zF1Czfw==
X-Google-Smtp-Source: AMrXdXvp3DxYbsTR9t8SKnjeLZd9dx6QUSRcZFMtY8RTBxIAJJIMAA4cE/tATX0KFnsHYmpOptOIKQ==
X-Received: by 2002:a17:902:b608:b0:192:babc:20df with SMTP id
 b8-20020a170902b60800b00192babc20dfmr55147480pls.58.1673853851445; 
 Sun, 15 Jan 2023 23:24:11 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:1d4f:b969:9e53:5eb0])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a170902ea0100b001913c5fc051sm7415541plg.274.2023.01.15.23.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 23:24:11 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: anx7625: Use common macros for DP power
 sequencing commands
Date: Mon, 16 Jan 2023 15:24:06 +0800
Message-Id: <20230116072406.3971025-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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
Cc: linux-kernel@vger.kernel.org, Xin Ji <xji@analogixsemi.com>,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM DP code has macros for the DP power sequencing commands. Use
them in the anx7625 driver instead of raw numbers.

Fixes: 548b512e144f ("drm/bridge: anx7625: send DPCD command to downstream")
Fixes: 27f26359de9b ("drm/bridge: anx7625: Set downstream sink into normal status")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is a minor cleanup. No functional changes.

 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 808dbf79d209..7e1fb93a6ce4 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -935,8 +935,8 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 
 	dev_dbg(dev, "set downstream sink into normal\n");
 	/* Downstream sink enter into normal mode */
-	data = 1;
-	ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
+	data = DP_SET_POWER_D0;
+	ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, DP_SET_POWER, 1, &data);
 	if (ret < 0)
 		dev_err(dev, "IO error : set sink into normal mode fail\n");
 
@@ -975,8 +975,8 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 
 	dev_dbg(dev, "notify downstream enter into standby\n");
 	/* Downstream monitor enter into standby mode */
-	data = 2;
-	ret |= anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
+	data = DP_SET_POWER_D3;
+	ret |= anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, DP_SET_POWER, 1, &data);
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
 
-- 
2.39.0.314.g84b9a713c41-goog

