Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27E239B74C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 12:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0499E6E4A6;
	Fri,  4 Jun 2021 10:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35DD6E4A6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 10:44:36 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id w15so10917604ljo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9h1yKD+LgXGUnoZj5bAFUkiqd1zySY4f07AJKJZ6sB8=;
 b=esj90VqN2pifcAXHyVCWCrqSCXOxARgl24V2l2stp5Kulet9jYYn/ArvQTTwu7I5xN
 M0WJI7CSHPeyb1jkxoc/XZArFAu5vNz84pbnSdalDr2EzcKBcrASJPU2LZHzHbpmwPuh
 vMjkuhL5+DC2eVZIopdrCd8WhQwcxUS4e3tEU1u3ueTvdBE//lcQJsGb9U40Le31pcMO
 PECaN2PP8aZQ1XLX3/ylgcNSHPDa6JFDdWQGU2F0ESLjGr0cGyfw4FR9ZwhA6CfJAu6K
 g9bQsFlm2mCfWZZVc40xVkGKiDDSQMOklWhkT8OL7L3584EyGptSBwN62HUeN925DIu/
 NpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9h1yKD+LgXGUnoZj5bAFUkiqd1zySY4f07AJKJZ6sB8=;
 b=YbuNuZpwN0i1aNOifUbjcis3nxC4YbkDv6pGUPCx786HddW52+9c4TBRL1sbYOqcJ2
 N5lgrpKoNbg+y/ZTkLWVbjph1szWzQhAucSOpC2XKSC9QTpCiks1x0hcTIlcQqShTpSq
 gW3MPoElfJUOUTO7uLxxxZzQh2jWyrKi0IQXD4ziUnoiZIiwQJXWnqA7ZpzFxSFpPf0g
 ZNlIfpotr/52sLYSoM6eCsTmCXFN8C8VkaucfYu2xgF3iuA2Ka8bXkhCahPHc3JjUKtc
 w6Meve4rdmRMHvM99UnAR9t+Uo7YiT9hS7UQ9GXsSVVTA0T18uo/a7N8itc3OtEuGDfZ
 /baA==
X-Gm-Message-State: AOAM530aSEzGEP89vP32dhuPHxVKbHPd2P4jYnQVNcP03HX58jfD2QyW
 AMaiP2ypoJmoF3FV5gH+l/exmQ==
X-Google-Smtp-Source: ABdhPJwdRAGWrohXulTTMqwK47ar+H8y5xiqlSo2SCohQGWRuR4wUm9D4HbCLMOYqQq/PCW9jf888A==
X-Received: by 2002:a05:651c:104e:: with SMTP id
 x14mr2987179ljm.345.1622803475248; 
 Fri, 04 Jun 2021 03:44:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q17sm671687ljp.3.2021.06.04.03.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 03:44:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH] drm/msm/dsi: print error code when MIPI DSI host registration
 fails
Date: Fri,  4 Jun 2021 13:44:33 +0300
Message-Id: <20210604104433.1442949-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to ease debugging of DSI host registration issues, print return
code of dsi_mgr_setup_components().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cd016576e8c5..4df5defdbf4c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -817,8 +817,8 @@ int msm_dsi_manager_register(struct msm_dsi *msm_dsi)
 
 	ret = dsi_mgr_setup_components(id);
 	if (ret) {
-		pr_err("%s: failed to register mipi dsi host for DSI %d\n",
-			__func__, id);
+		pr_err("%s: failed to register mipi dsi host for DSI %d: %d\n",
+			__func__, id, ret);
 		goto fail;
 	}
 
-- 
2.30.2

