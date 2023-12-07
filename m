Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6F0808CEB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 17:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CD410E915;
	Thu,  7 Dec 2023 16:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F0F10E915
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 16:11:03 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a1915034144so146958466b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 08:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701965461; x=1702570261;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UXMGWx05Oqhgl5suufkTuT8kZBkK433+J40SP+lUHbM=;
 b=a3HKmtv3qO9557MWLMufheY1nd1rizN0Vtt+/LGDQK4uJ0Sa4WMqOTTB82m/KHftFb
 uhpG/1k/moshv9t1LZ6U10utIV82p4mPrk4yBPKwa4ppgeTrkhhBzg4xAoqTecRSd+vM
 QbnDf2gzEn0NvdMpxxIzbvccDqRiGKNVRUj7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701965461; x=1702570261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UXMGWx05Oqhgl5suufkTuT8kZBkK433+J40SP+lUHbM=;
 b=IYr/TP/21slurYGIRrPSgtIbghoqdjqGCM8/Qj0HwLVmEvSSR1e/1HKmlETfJTvB7/
 Ilq0Ck+RbjdKfP4/IKSmKvjJYfpeonlDkQX49MTs60z7bIH1B0ikRnRRdQnMIalByXvc
 A2wAbR/czTxtteoANktZkSGWqtLWpdp69ueGoQDQYqCnVcOuHiO2FWmDGuXXpcVqB/ZJ
 Ie9+xUoQFAGqV5B3bnZzaT2vZTqoCUCpapTyPK07xB/FGBRqD0427i/Nsyu/9jlDeuj4
 9FPu4g4eBwSD5lSipO3wZxDnV8INkcvISQUt4aimjeuBuCwg/lP9wunLE2K/sd0/Djee
 hDAg==
X-Gm-Message-State: AOJu0YyuPtcbLsNG9GdVX8EKSiMrFtUjrKFy8DcEI/e/QNgU1hzmiVMJ
 djlNXajVxzFXdXAnUaQt5cUNcQ==
X-Google-Smtp-Source: AGHT+IGs6KP73vU1SUU/HRyy8dMywzlKbx8fMvag5ZyzuitZ0Tn8jejydHX1ZR3GalG7y7zCNBbq7A==
X-Received: by 2002:a17:906:e8b:b0:a1d:7f40:bebe with SMTP id
 p11-20020a1709060e8b00b00a1d7f40bebemr1678683ejf.126.1701965461446; 
 Thu, 07 Dec 2023 08:11:01 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:9bf:959c:3c66:46c2])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a170906681300b009a193a5acffsm989730ejr.121.2023.12.07.08.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 08:11:01 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: samsung-dsim: check the return value only if
 necessary
Date: Thu,  7 Dec 2023 17:10:43 +0100
Message-ID: <20231207161056.183442-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It was useless to check again the "ret" variable if the function
register_host() was not called.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/bridge/samsung-dsim.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index be5914caa17d..98cd589e4427 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -2020,11 +2020,11 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	else
 		dsi->bridge.timings = &samsung_dsim_bridge_timings_de_high;
 
-	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
+	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host) {
 		ret = dsi->plat_data->host_ops->register_host(dsi);
-
-	if (ret)
-		goto err_disable_runtime;
+		if (ret)
+			goto err_disable_runtime;
+	}
 
 	return 0;
 
-- 
2.43.0

