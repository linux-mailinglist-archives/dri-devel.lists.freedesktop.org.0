Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115E3659263
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 23:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5325B10E41D;
	Thu, 29 Dec 2022 22:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A521110E41D;
 Thu, 29 Dec 2022 22:10:35 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d3so20145536plr.10;
 Thu, 29 Dec 2022 14:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kRyde3/fSKsKjFS+aPwf5uEQhzkfhK22Fr/7tHCPJdA=;
 b=DQdMsvS8ZUtWgRPvyO7PU438V0JhSyDrONOmWpJBDzHacXngRgWBil64F+xY7I5Zw6
 mKfnUjRbKIaspnl8Uazvq624XhEO8gli3jD54oIXccMxNbSedIUMEU7xPE/xGJ7pUSce
 0PZ0e7oWp6XZCLlv18zWDQc3GVfNk3u6rhhyFHnjjiGlyipe+054J8NjhzDzcm16ZuKN
 fDG9W8W9Yt214FezG1878nP7+vVTKXqU9I9X0TbuSM06W/OYakvGSiu/MGaMtjRJgaLd
 nVDBJMclGQ70Fq1HLBbJ/PeQG2zWalG467/ATKzC63fN1PcxN5mlKur+ThePH09nPXZo
 KRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kRyde3/fSKsKjFS+aPwf5uEQhzkfhK22Fr/7tHCPJdA=;
 b=i0EiA8MfQyx8n9fhM+0HqdaEpqkmQDXmBaelJ3A9Qx8m6yuZFl/QRVaw33FDvtYYNT
 4M/LXpSW02fFkbVAHsD6svsFgbPiLD1vau9rKj7S+VpWh8p0QTns/Aq9QxsZ3+2yfyVx
 4GKpQwmZjPm84WFY8Ow7kLjplOqbfL+XGMzsy6rCFFFE+ahFKwLyb7igzKSN5NV+YRqb
 ebEZIdkgaer5vRx5pFkjyKwxsVZOWVIuvGVXmiRTyyfC0n2YYywfuwi1S70gTVhcBvJe
 ud1/ZI+R9bjDgxhiroiU+40EFC+/oRx4e0jLqs1dX2Sjdr3+wZGN93NnPdELbX9DfFHq
 bcJQ==
X-Gm-Message-State: AFqh2kroriWvXkJ9/rYhbbIcTeFByaxfn3+Pcq4uQsBtwm3XawS59qF/
 rK1Q/uB8fRZvZaRodRoyKg0J9sXgXik=
X-Google-Smtp-Source: AMrXdXtk9ysIPzG6lLR3ceBm7y+Qz32EHSryZjB+EMiLeHjPoXCqYtH6t3LaPxb14AMfH+lilsf4vg==
X-Received: by 2002:a17:902:70cb:b0:189:cada:4294 with SMTP id
 l11-20020a17090270cb00b00189cada4294mr29391770plt.5.1672351834917; 
 Thu, 29 Dec 2022 14:10:34 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a170902e54300b001745662d568sm13469088plf.278.2022.12.29.14.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 14:10:34 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm/msm/a6xx: Fix devcore register range bugs
Date: Thu, 29 Dec 2022 14:10:27 -0800
Message-Id: <20221229221031.775463-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

RB_MRT_FLAG_BUFFER is 0x8903->0xa91a inclusive.. don't split it (with a
hole) in the ps_cluster_rac and don't accidentially re-dump part of the
range in ps_cluster_rbp.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
I'm not 100% sure about this, because the RB_RB_SUB_BLOCK_SEL_CNTL_CD
stuff makes me think the registers dumped are not what the offsets
imply.  But if this is the case, the devcore doesn't capture enough
information to decode these regs properly in the first place!  Either
way there is *something* wrong.

I noticed this because these result in the crashdec tool encountering
only _LO or _HI components of 64b regs that it expects to come in
pairs of 32b dwords.

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 2fb58b7098e4..a03891d844a5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -18,12 +18,12 @@ static const u32 a6xx_gras_cluster[] = {
 static const u32 a6xx_ps_cluster_rac[] = {
 	0x8800, 0x8806, 0x8809, 0x8811, 0x8818, 0x881e, 0x8820, 0x8865,
 	0x8870, 0x8879, 0x8880, 0x8889, 0x8890, 0x8891, 0x8898, 0x8898,
-	0x88c0, 0x88c1, 0x88d0, 0x88e3, 0x8900, 0x890c, 0x890f, 0x891a,
+	0x88c0, 0x88c1, 0x88d0, 0x88e3, 0x8900, 0x891a,
 	0x8c00, 0x8c01, 0x8c08, 0x8c10, 0x8c17, 0x8c1f, 0x8c26, 0x8c33,
 };
 
 static const u32 a6xx_ps_cluster_rbp[] = {
-	0x88f0, 0x88f3, 0x890d, 0x890e, 0x8927, 0x8928, 0x8bf0, 0x8bf1,
+	0x88f0, 0x88f3, 0x8927, 0x8928, 0x8bf0, 0x8bf1,
 	0x8c02, 0x8c07, 0x8c11, 0x8c16, 0x8c20, 0x8c25,
 };
 
-- 
2.38.1

