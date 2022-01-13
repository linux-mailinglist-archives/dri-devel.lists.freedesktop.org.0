Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D0348DBD5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 17:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E8310E274;
	Thu, 13 Jan 2022 16:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD18110E274;
 Thu, 13 Jan 2022 16:32:14 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id hv15so11150785pjb.5;
 Thu, 13 Jan 2022 08:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+3q5GmFbYNyEJgrrlP1Ic3dY/1SWaaTPA9VEhYfsQJU=;
 b=d2Xxijoqk1QxRW3U9287LjfQMlQt+Zec3Aq3Nchqnw2EWG+HksVI/vEUzpHE/dfibA
 UZER/wPc+2d3Xj+o6c6iamOXGQAZIs+YtR4EBaekNegFq4Mko78lNZzwRda2/s5YeeaZ
 7xHycysmT01PaDS+tM43VLDWaUUO/epZW9nen5LXHCIWPFrxAqkvBXaIthJ4gxDv7lh5
 Kgn5MmaGRKqqwLvokqAskJ/lyShZLolLBISSnVHJKWZ6Hza0HU3Ne4CoFzucpfdqijK1
 y0/Ob77r/LjPOdqB9gun5GShbWxLXj3Nixw5KVs2XXGDfkfyUi1FB9KChHfeiCP0KX+h
 2tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+3q5GmFbYNyEJgrrlP1Ic3dY/1SWaaTPA9VEhYfsQJU=;
 b=kP5Kt+H4SguJGBp3AwmElQT6JcmNJYcXbayyzcb7AO6gQ0tJMxSP8/LY4ivCnfi7Gd
 LtrPYmF7AeOvb1Qsn+WcVUlwIeX2m2cXeELDHi+GBNHnS8mss1Fw0BulFd13KcTV426Z
 g4zgsXj3aDDr8Ada+p/f4ymh3XRs8CpMYTyPMImvxogdDo2yS5wLEjQRx9z+Jx5UBkj6
 Du5FziGcfwhdOmCvcSht92zmkv6q1MggCjRPAt45PJ6z2PAlnDJinqchM163qOl8ViCA
 IaEOxGD0L9Dmz71rLbqFbNTh+/zfOhqGbIcKp7syvwyN/hZtTq7iAWZ6/eHTRJB2UIIN
 rVnQ==
X-Gm-Message-State: AOAM5328gbIle0lSF3c2DOXhA4v/DvlYMbyoOY+bu5NhYzlz6E0kqBcd
 BCKmmoImyNzT98Q5MpAFWEwVI898OPU=
X-Google-Smtp-Source: ABdhPJyJl32B4r9KsE63UDv2Xaa30wFKuy2pT+8hjSFdNf9DEJ1Gz6eszjXC7Cb2AJywPnufEKWtBA==
X-Received: by 2002:a17:90a:458d:: with SMTP id
 v13mr14966962pjg.202.1642091533656; 
 Thu, 13 Jan 2022 08:32:13 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id j18sm2661612pgi.78.2022.01.13.08.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 08:32:12 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: Add missing suspend_count increment
Date: Thu, 13 Jan 2022 08:32:13 -0800
Message-Id: <20220113163215.215367-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Danylo Piliaiev <dpiliaiev@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Reported-by: Danylo Piliaiev <dpiliaiev@igalia.com>
Fixes: 3ab1c5cc3939 ("drm/msm: Add param for userspace to query suspend count")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 51b83776951b..17cfad6424db 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1560,6 +1560,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 		for (i = 0; i < gpu->nr_rings; i++)
 			a6xx_gpu->shadow[i] = 0;
 
+	gpu->suspend_count++;
+
 	return 0;
 }
 
-- 
2.34.1

