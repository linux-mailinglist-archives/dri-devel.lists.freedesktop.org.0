Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0550DC46
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 11:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016A410E09A;
	Mon, 25 Apr 2022 09:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D3210E091;
 Mon, 25 Apr 2022 09:18:41 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id hf18so9896148qtb.0;
 Mon, 25 Apr 2022 02:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c3DGZK5DUQkJKoG1zq/bxgy9gvzlprZtCF4qarINkuM=;
 b=mtp/DXIrhnVz/pLfkYQB5MdLNeGrEdBvnkDNvJkZUFa9Y0esmOj0owxut/Kk26hO3B
 RsMmoVB6nrDBIwAG6LSDS8NUHZkzwDELdgXznUpF1FY2uMJGylRSBzYFc8pIvjwmuOyf
 cfapt5EubqdRJH6ctJeLD90l7YdW5unwIeldh3BswN+y/6lDghhkOIfMv4kqmQozPgHm
 U0LpH/UCUwOnoh6JnHGh6WCtKx6RpnpQHM55lUHC7wkBugT3EjMMcKXZ96fVzpWEmp9W
 qI9WqppV/GGVV7LUaY/Aj1I6NAyxzwE4oWhjv/3NDu5EuwJW0ujr8G8xw0edR+DVucGP
 W5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c3DGZK5DUQkJKoG1zq/bxgy9gvzlprZtCF4qarINkuM=;
 b=AH36mozkkToFQ+lDS6IW7rdQ+HZP4rbu2LITu8YvEasYSUrn9M4o/WqdL3f9B+Ot+G
 V2xFLR+reN6bL2KpPPUMWT49bTP3jAthcNArANtKy9NySzj0N1b1RDl+B5ZUrLRSkEPQ
 Yalxm5hy3SDjxj5fA9NZLhIRyjm/eafqYhzvjjgMlVJwORmvrk0UFVDsMgeKaxg0ql//
 8H/GBDTWnNtJ+2PaXBdRdDYyS4iBPCl0S5B8Ff38Ttmo1uqfd7djVVlEPWWZJAgrmIKQ
 ooI+OC8rt5w6/1x8V0/VWxgCSFXnl1Ku0pzrAJfYLuOxoHNGB+To6bfgtN0Cyh28IZFM
 LBFw==
X-Gm-Message-State: AOAM531qin+EQf1XOXiWQjZK/XRsRY8cuXpoQnFjEPe5E+qptz7NCF+a
 ogf6MKKMhGznSC5c+DHpzjY=
X-Google-Smtp-Source: ABdhPJySq8HdV/v++Aqw4NLLiOBRDiQu9mv8AeH8tmM6FwSF/kC2yWt97V5SHtW1stLpGSnViUZ3gw==
X-Received: by 2002:ac8:5905:0:b0:2f3:677a:efaf with SMTP id
 5-20020ac85905000000b002f3677aefafmr2995920qty.83.1650878320204; 
 Mon, 25 Apr 2022 02:18:40 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 m4-20020ac85b04000000b002f363eccb2csm3416405qtw.89.2022.04.25.02.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 02:18:39 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: sean@poorly.run,
	quic_abhinavk@quicinc.com
Subject: [PATCH] drm/msm/hdmi: fix error check return value of
 irq_of_parse_and_map()
Date: Mon, 25 Apr 2022 09:18:31 +0000
Message-Id: <20220425091831.3500487-1-lv.ruyi@zte.com.cn>
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
Cc: daniel.thompson@linaro.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 lv.ruyi@zte.com.cn, linmq006@gmail.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, christophe.jaillet@wanadoo.fr,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

The irq_of_parse_and_map() function returns 0 on failure, and does not
return a negative value anyhow, so never enter this conditional branch.

Fixes: f6a8eaca0ea1 ("drm/msm/mdp5: use irqdomains")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ec324352e862..c3b661c2932d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -298,9 +298,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	drm_connector_attach_encoder(hdmi->connector, hdmi->encoder);
 
 	hdmi->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (hdmi->irq < 0) {
-		ret = hdmi->irq;
-		DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
+	if (!hdmi->irq) {
+		ret = -EINVAL;
+		DRM_DEV_ERROR(dev->dev, "failed to get irq\n");
 		goto fail;
 	}
 
-- 
2.25.1

