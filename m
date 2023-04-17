Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FBB6E4D6E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 17:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91B710E367;
	Mon, 17 Apr 2023 15:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B399F10E367
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:41:17 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4ec81773cf7so1498510e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 08:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681746075; x=1684338075;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gNAR3DHHJC576sjB6C7w6VlykVXtRCYWbXKleTgIMtU=;
 b=lqxVhSMkDgK0WQQQ6j6mWXdZCAKMy6ZCoyuZuBPf7iyGeBUCVclfaXJ0vtZv9gwILB
 whOHkmGCTzdOspRKQtaY5wdkH2h+YzDKnFAOmru1wAq3h89qSNHWdS4Bwa9WRzqLuJmm
 GaWTZEs9gvZUQ43v0ASLWnaxdW++mHBPEXKQ4BXKXodckOypxM++jSULkJ241hoox4A7
 uT3r1oi0rz4pXvGViegj1f+RFOJXjlbcT3NmETOW/Rlj4QPxuA+FSPEhru4IDVygp1iP
 o7bpFe/jmkZanXKeVs5vKTle2wwtHOYRm97R6AI6DYGHhNNDDk3KUBv7ig3XS77urcYo
 Xn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681746075; x=1684338075;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gNAR3DHHJC576sjB6C7w6VlykVXtRCYWbXKleTgIMtU=;
 b=Q88efccL0qx6SnqNC1AtfB28JeVnwyHlbpqGQXwPdtfwF+0Nuxj2JGih4igNPhrD5i
 ue9Tth/2Wa9sttzesbGi8KuiAvTViZUKi/snLBYV+eJhMRK1TP6lMVHZVmHNV+6pg9Bk
 itR1UtlBXgzl6dTUboTDFfb+1xKqzYcT9FC7HDbDEUq7/AghhhB41fj13pYUiYIosnTV
 XtvWud60Vd47yl7qPxSadoY1L0SscG55Xyr32dFDubAM7Wp2r9xSI7hIBLmfuIRyFG53
 b9RE0lr5tCYR2iJY749JaQSThfdgeSi3cL/TDS2DTAwD/5Fvbd5x/P9or7jhcIqQP2nc
 xGYg==
X-Gm-Message-State: AAQBX9dsiqQBC/0L5rRtmfhcIyhHVV7f8NBFYLMCnL0qSYrA7YVGuy7c
 7ThLiYd0ZfvIjoUoDOpf/NyQDg==
X-Google-Smtp-Source: AKy350aozgk1r5Jb/wfhVODFS97I8ZHEVfPFiXLG9ajKtf3QHi8XgpoqyMYmVFGZGJFbckexE/XItA==
X-Received: by 2002:a05:6512:98b:b0:4ed:c089:6e68 with SMTP id
 w11-20020a056512098b00b004edc0896e68mr1219950lft.41.1681746075603; 
 Mon, 17 Apr 2023 08:41:15 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 w13-20020ac2442d000000b004e95a1aca1bsm2066458lfl.87.2023.04.17.08.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 08:41:15 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 17 Apr 2023 17:41:08 +0200
Subject: [PATCH] drm/panel: novatek-nt35950: Only unregister DSI1 if it exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-maple_panel_fixup-v1-1-07c8db606f5e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJNoPWQC/x2N0QrCMAxFf2Xk2UK7Daf+ishIu+gCNQutE2Hs3
 xd8PId7uBtUKkwVbs0Ghb5ceRGDcGogzSgvcjwZQ+vbzvdhcJ9FObk3aqZRUSiPT/6t6sLg43n
 q8JKuEayOWMnFgpJm62XN2aQWsvX/7v7Y9wPRM+VffgAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681746074; l=1768;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ow64D0ztle1HmCwm747eKsJ3DSYCPMzYtrfBJ40ZY7w=;
 b=Wn+uTmifJi38q2SDiT/M2w/1LL8ry3gAsuKx92D5PjdkIhxdbFhFIMQ0GYid46vs1uiFfoeeI0Qe
 4PI1zgdkDZORcLs5aclC8V87sgGqd+ju6XwawXnVxcFyoYL1Km3n
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 5dd45b66742a ("drm/panel: novatek-nt35950: Improve error handling")
introduced logic to unregister DSI1 on any sort of probe failure, as
that's not done automatically by kernel APIs.

It did not however account for cases where only one DSI host is used.
Fix that.

Fixes: 5dd45b66742a ("drm/panel: novatek-nt35950: Improve error handling")
Reported-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index 7498fc6258bb..8b108ac80b55 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -586,7 +586,8 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
 
 	ret = drm_panel_of_backlight(&nt->panel);
 	if (ret) {
-		mipi_dsi_device_unregister(nt->dsi[1]);
+		if (num_dsis == 2)
+			mipi_dsi_device_unregister(nt->dsi[1]);
 
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
 	}
@@ -606,7 +607,8 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
 		ret = mipi_dsi_attach(nt->dsi[i]);
 		if (ret < 0) {
 			/* If we fail to attach to either host, we're done */
-			mipi_dsi_device_unregister(nt->dsi[1]);
+			if (num_dsis == 2)
+				mipi_dsi_device_unregister(nt->dsi[1]);
 
 			return dev_err_probe(dev, ret,
 					     "Cannot attach to DSI%d host.\n", i);

---
base-commit: ab4f869fba6119997f7630d600049762a2b014fa
change-id: 20230417-topic-maple_panel_fixup-170b6d3a8c9b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

