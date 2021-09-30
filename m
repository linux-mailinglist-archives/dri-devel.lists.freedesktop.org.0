Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A0041DBBE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 16:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809A66E406;
	Thu, 30 Sep 2021 14:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A6B6E406
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:00:26 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b15so25603464lfe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6uNVJNXTlb3jfg3nMyHjCyNqhUc3xWo2dy+1dRY+1kI=;
 b=ZjQInZWH6ToGckxaN6rHk2EVawVU9sdVb1WSPFkl3n5UUmntaoCbC7/3DOHL6LV6b0
 eErEiLj8z3p7hvn45vfMOAL5n7NiOH1Ai9boczHgjVDJC/rinZEv6lnKomCu3Tb/O14Z
 NQtAGyrupJF0+2gmkQnPSgDsEudELR/ro5FyeY5+RqWZn9AaUAscNknhUjUTXAYO/91Z
 KQOvtrz8wV00K4vBTKFeWvqi3MHmR6T69iRTudgg6hDBgs02B+AqvbYHcVif0Vtd+y98
 20Tdi4yl1JwsrUcwlQWYZb1j7Ft8gp9KJR5RdWkDkNRoSON5a3Nf/VeRvnv0Qz1hXogZ
 7kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6uNVJNXTlb3jfg3nMyHjCyNqhUc3xWo2dy+1dRY+1kI=;
 b=wy/pvDXzE8Mp7fSr10U0heQMYYBvDkCkc28G7Ligb8kNiME3AagfKxh4eqB9/jkcr6
 aQuOLmoCrQ5o2voapB1ZGsfUX8Ktytn/PIJQ/BwLx0VivntfPeAWNSt3hHKfd/bXgWkB
 BWZRHfpoCIz/m7FhZcJ0oL+f5Oi9L94IDM6i8O9tF8QY/oF5ywO8eCW4q98oO85Asdhk
 J2W0ydeuwcZf8obO/NFTR++gO3xYgNMilUjyW6dZXJWTp/H8XUMm2xmCucWv6iJFod7B
 wxLcpBkvuBrUVo5es+IysFSmBqeVDx2djI6Mf648lwHkhfZhsaCwHu7w9pDnDvpgesIu
 TtwQ==
X-Gm-Message-State: AOAM531GTTYF4zuy0V/c8adrc8upwgUaGdiYpvNvUNuEHWom+YWyQqth
 iBLMALxsxJn+QzK+pYFcwprRHA==
X-Google-Smtp-Source: ABdhPJwGwzemg2UO6l8i7NrpGocpuRtlXgFrQ3XlNo6D+Tk3j2thUFYikQFN/1DwLtCN1xSPfxaCIQ==
X-Received: by 2002:a05:6512:2308:: with SMTP id
 o8mr3254105lfu.393.1633010422290; 
 Thu, 30 Sep 2021 07:00:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:00:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 03/11] drm/msm/dpu: drop pipe_name from struct dpu_plane
Date: Thu, 30 Sep 2021 16:59:54 +0300
Message-Id: <20210930140002.308628-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
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

Use plane->name instead of artificial pipe_name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 88d726133b8b..ef3737642b0c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -115,7 +115,6 @@ struct dpu_plane {
 	struct dpu_csc_cfg *csc_ptr;
 
 	const struct dpu_sspp_sub_blks *pipe_sblk;
-	char pipe_name[DPU_NAME_SIZE];
 
 	/* debugfs related stuff */
 	struct dentry *debugfs_root;
@@ -1429,7 +1428,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 
 	/* create overall sub-directory for the pipe */
 	pdpu->debugfs_root =
-		debugfs_create_dir(pdpu->pipe_name,
+		debugfs_create_dir(plane->name,
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
@@ -1660,12 +1659,9 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* success! finalize initialization */
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
-	/* save user friendly pipe name for later */
-	snprintf(pdpu->pipe_name, DPU_NAME_SIZE, "plane%u", plane->base.id);
-
 	mutex_init(&pdpu->lock);
 
-	DPU_DEBUG("%s created for pipe:%u id:%u virtual:%u\n", pdpu->pipe_name,
+	DPU_DEBUG("%s created for pipe:%u id:%u virtual:%u\n", plane->name,
 					pipe, plane->base.id, master_plane_id);
 	return plane;
 
-- 
2.33.0

