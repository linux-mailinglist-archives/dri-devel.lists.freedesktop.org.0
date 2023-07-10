Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F49474D11B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 11:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9843110E245;
	Mon, 10 Jul 2023 09:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99D010E246
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 09:10:49 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a0423ea749so3278643b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688980248; x=1691572248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+G6rw6Lzr4S57ts7YP1ylMlTPk8hLpi7yHWyU7B67Pk=;
 b=WA5KTELETcwWf6w/I55emKwkPdPD6iqH5cMo+ztoYJPOEhyW0/lxNunr71IJJgEdb0
 2BuAPcAN8UtUjVLClL3O/XIk22Ql1QD0X5B5mVXbPp4K8te5CPBCi5/r5a9c/0yAbs0M
 TXWfi6YXFEVwT9ToCZShEm1GhLQTa1PFXALAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688980248; x=1691572248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+G6rw6Lzr4S57ts7YP1ylMlTPk8hLpi7yHWyU7B67Pk=;
 b=T/k9AP8SXSF68eTmCF+20LOho2RYrU8cvXjYl1B+tVgg/rauSYcNmClI3zWWEEgWYw
 HMoeG6Eok0bkAlf5c2Bl1lgmRkmFFoYp53MBVNYakAFWZkvK/iCkV+Lh7M2RjRk+Wo4O
 0VPW2hk9pJp3kTUSFwP6uNPnB+crustBS4FuEfdvj0IyI/E8FuSE4m45VJa8qYTsxmyn
 c/MCfYp/A71BxUK6SRl3v/gjPIQnSI3OYR4b0ve0WtAAALKX6Q4g2rRh0U8IzB+DBkSB
 adBLIL/JMyB2yF/hxk4Krd9E22B93cJd4RPGNSBqQ+fQx25QiM07FTRRBEj7El+0CSEd
 BrIA==
X-Gm-Message-State: ABy/qLaQig4E9sarRjd2lnYl4tCeSU+he+Sp6S/2iPbHxSWje+05Gtoh
 1GU0Fh6HVoGPkTRSaaXwuXyQltFurS7AWWc/vmE=
X-Google-Smtp-Source: APBJJlEpqaHHC1IrHo+NkQBReIWnVoPc8td0Q6Q/LlodZF7TnbCM+J5/LE3j7wJfL6wk0SQ9tHt8Bw==
X-Received: by 2002:a05:6358:52ca:b0:135:3f00:b8de with SMTP id
 z10-20020a05635852ca00b001353f00b8demr11516209rwz.17.1688980248710; 
 Mon, 10 Jul 2023 02:10:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:be97:1d05:f9b6:36a6])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a637b1b000000b0053f06d09725sm6997574pgc.32.2023.07.10.02.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 02:10:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH RESEND] drm/bridge: anx7625: Use common macros for DP power
 sequencing commands
Date: Mon, 10 Jul 2023 17:09:27 +0800
Message-ID: <20230710090929.1873646-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM DP code has macros for the DP power sequencing commands. Use
them in the anx7625 driver instead of raw numbers.

Fixes: 548b512e144f ("drm/bridge: anx7625: send DPCD command to downstream")
Fixes: 27f26359de9b ("drm/bridge: anx7625: Set downstream sink into normal status")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Collected tags and rebased on v6.5-rc1.

 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 8b985efdc086..9db3784cb554 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -931,8 +931,8 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 
 	dev_dbg(dev, "set downstream sink into normal\n");
 	/* Downstream sink enter into normal mode */
-	data = 1;
-	ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
+	data = DP_SET_POWER_D0;
+	ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, DP_SET_POWER, 1, &data);
 	if (ret < 0)
 		dev_err(dev, "IO error : set sink into normal mode fail\n");
 
@@ -971,8 +971,8 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 
 	dev_dbg(dev, "notify downstream enter into standby\n");
 	/* Downstream monitor enter into standby mode */
-	data = 2;
-	ret |= anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
+	data = DP_SET_POWER_D3;
+	ret |= anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, DP_SET_POWER, 1, &data);
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
 
-- 
2.41.0.255.g8b1d071c50-goog

