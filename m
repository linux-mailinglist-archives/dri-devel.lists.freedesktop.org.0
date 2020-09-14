Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADBA268545
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F866E1A7;
	Mon, 14 Sep 2020 07:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AA76E0BA;
 Mon, 14 Sep 2020 02:30:06 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c196so11445907pfc.0;
 Sun, 13 Sep 2020 19:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZifYdXY/7F2LoiT7gKnIbVwnlCP6qvLug13m2oN5teE=;
 b=gxlzUj0xB0yJzg+U+5am9MlOexD+ex+GBmHcy+ZwRAfevVIs3epB2w8paAeANIXgit
 jx7rLx9HRr9MOiZd4mftyGKHwfhtDN0/8hGve8qYRsygsqN/ApjbJsV/IQeNPAxnBtnA
 9iT3WNn+7BHeNC/w5shwjj1bCDf9ctz3B3lWa8Be3F5lyGLyY2Jem8tob/jESkwV0KDL
 /5sGttriChwnC3Sz0bZ5gfgHFayZ0h/enNYw0hkHT3NltTjhNETsyknhrkSDr5uXQCeO
 alus8zTyjbaKW7s3XMgF4mj3i6whdvI+HWC5zmtziKBJ3ywcA2UuEzpDTMp666/9JCZz
 E1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZifYdXY/7F2LoiT7gKnIbVwnlCP6qvLug13m2oN5teE=;
 b=cdtSmHUHx9eJETibUyAnKO5yLfQlue5H7cB9t+Sf0zhhTq8G2zb4X2iClNwApsyMkA
 fVoSn8L/h54WyiSZYaSQoPESTqoWdCljqEuRfFwaoDYtYzJzcZ2iUNvH8WqkvE6IKKP5
 8nw209H/3AAURQynk8ab7q2kuaQdznxA9lqIQbowoxz316aCA453K1i4vwA3g5+pBVjH
 qSigz9W/0nu6xgwFxarPu48pcpXsERmEIJw3BbzlWa08BLHWh6cLk+zYUEIfaKuCwSRe
 01r5EThTq11ZJsI7Z9xoaGvSJWjTbVi+2zt4JfEl8tvT8BTaeWC+BIFRU+htCV7IcKV+
 9PiQ==
X-Gm-Message-State: AOAM530AhQ3bL5hWLaN15/vcJ++hbOs0dRcjci+3J2BmW9mod0SNqUVF
 L0NPSQxI6UjXcgoepxPthVc=
X-Google-Smtp-Source: ABdhPJwNFwdUH+e2nolvRlNJB6bmWymbrUxCPUl3Zk8Dd/rloSA++etdrtwOBW10+jp51Wr4Ga/N3g==
X-Received: by 2002:aa7:9795:: with SMTP id o21mr11830850pfp.26.1600050605774; 
 Sun, 13 Sep 2020 19:30:05 -0700 (PDT)
Received: from ZB-PF0YQ8ZU.360buyad.local
 (f.a4.5177.ip4.static.sl-reverse.com. [119.81.164.15])
 by smtp.gmail.com with ESMTPSA id j9sm8426372pfe.170.2020.09.13.19.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 19:30:04 -0700 (PDT)
From: Zhenzhong Duan <zhenzhong.duan@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/a6xx: Fix a size determination in
 a6xx_get_indexed_registers()
Date: Mon, 14 Sep 2020 10:29:49 +0800
Message-Id: <20200914022949.129-1-zhenzhong.duan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: freedreno@lists.freedesktop.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 dri-devel@lists.freedesktop.org, Markus.Elfring@web.de, sean@poorly.run,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's allocating an array of a6xx_gpu_state_obj structure rather than
its pointers.

Fixes: d6852b4b2d01 ("drm/msm/a6xx: Track and manage a6xx state memory")
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>
---
v2: Update commit message per Markus, thanks

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index b12f5b4..e9ede19 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -875,7 +875,7 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 	int i;
 
 	a6xx_state->indexed_regs = state_kcalloc(a6xx_state, count,
-		sizeof(a6xx_state->indexed_regs));
+		sizeof(*a6xx_state->indexed_regs));
 	if (!a6xx_state->indexed_regs)
 		return;
 
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
