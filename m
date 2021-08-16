Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631573ED2F4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 13:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DC289DD8;
	Mon, 16 Aug 2021 11:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08C289DDF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 11:15:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1925340wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MypbfBd+8NzYvLq8nTK4OIM+Bwb5IR2a9QYE7TAun74=;
 b=vnT219uIiszmKrVIAUYdubgrTwJG3I6olt/Ws9boCTBLxLKTtA792tVCKp+rcAk1Ac
 tKonnyCTPO8Oq0HPLPdBRAcNq74/BVwSufa9wtfbukHisxhcx1UPV1/NqPObS/KuF3Xj
 zQwAQdTz2XwfIWk5Aheomy00R2VoSrOO6sz5xwGbCyvr84GQTrfzRbx3dWtAXWEukitp
 GE8qqsXAM7tlWXIsk37GeAyKsElY0DYhCfOgC0mj/3riv3oay7mb0fJpfpHqCv13t5jW
 txI2efJqcjB4ly7vtT3WmNT0qpsXaN5V/TyAubqcQ0YqHzvnVrbOuaxDzEBfV/KLjkEe
 ASrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MypbfBd+8NzYvLq8nTK4OIM+Bwb5IR2a9QYE7TAun74=;
 b=NLalR3jKpJP+1pTHZlOjLtCfdw32BdHvx/L+ApHn8r/IXhUeNZ8JnrdG65uhnKIkYY
 wECFD7DD4SQPUGu6IWZEPDzcyT9SM/Rke7FwBqqxD8Nt884yX3pkw9XG8o59pxyPZT0R
 9oc/6Y+jh8FephTrsGvVL9ggP051IKZPBYmGkFeZPMLBzBxQCCVUeMKPiJP2FoSUmukb
 rftTnHhKdtJD/RSgX/WtdyorShO6enaQ/Cmkp3IJYt6a1KOWt66PbA1zXlWCA6HiigBl
 NoRegYFSIoalKvcd1wvC/dftQV0OqWqGaYnqtHxpqQAFWkKc12tZUnzHLtCTZUfm6vZ7
 WIGA==
X-Gm-Message-State: AOAM532Xe2px0+GzAuOCh4o77bHDD4GKcf4HNzlVzBOjVKNe/qYk6hjR
 M6rot6eK3vOEhyZMEtzIee9YwjMwZH1gCVG5
X-Google-Smtp-Source: ABdhPJyV1EJFi/aPZ2cNitANdudEmTvHeqAh0HBnAYoRiE2CnapHO0QKkAubn9UPFzfY3Pn+ckEu3g==
X-Received: by 2002:a1c:5404:: with SMTP id i4mr14854665wmb.80.1629112504172; 
 Mon, 16 Aug 2021 04:15:04 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:2e53:d7ab:82a:3b3d])
 by smtp.gmail.com with ESMTPSA id o14sm1459825wms.2.2021.08.16.04.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 04:15:03 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: a.hajda@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 xji@analogixsemi.com, pihsun@chromium.org, tzungbi@google.com,
 sam@ravnborg.org, hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH v1] drm/bridge: anx7625: Don't store unread return value
Date: Mon, 16 Aug 2021 13:14:51 +0200
Message-Id: <20210816111451.1180895-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The return value of sp_tx_rst_aux() is stored, but never read.
This happens in the context EDID communication already failing,
which means that this additional failure doesn't necessarily
convey any additional inforamation.

This means that we can safely avoid storing the value.

Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 14d73fb1dd15b..3471785915c45 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -771,7 +771,7 @@ static int segments_edid_read(struct anx7625_data *ctx,
 		ret = sp_tx_aux_rd(ctx, 0xf1);
 
 		if (ret) {
-			ret = sp_tx_rst_aux(ctx);
+			sp_tx_rst_aux(ctx);
 			DRM_DEV_ERROR(dev, "segment read fail, reset!\n");
 		} else {
 			ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
-- 
2.30.2

