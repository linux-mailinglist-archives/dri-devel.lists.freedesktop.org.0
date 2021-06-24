Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000173B3203
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA536EC1D;
	Thu, 24 Jun 2021 14:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233136EC16
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:42 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id u13so10831998lfk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GdDMjhCpUMomtdmjludjL5DxnUY1JT83cC3CTovzo2Y=;
 b=zRkE9OGfJJ4nFYiDu1P5KaM4cDCELkftdGs2GKacA9JHQS9RlfHijtPn2Vq2PM5GlD
 +hAvTv7WDJ7mBZu76N39JRX7WwBS/1v3rnFuQoGxUdp3MbOCitwkISJs9j/1rjTB1Lit
 QtY/6JzO38InQ+sFdSPikB1FD35DZmdZYiDLiAMBzLC9vRfQ5PfLydBYcLG5r7n+Z6RJ
 aAUqVBFfFf+Z/QupclOWfkdSNMuf/1wjaTNPZpXgKUEbj5b4WCMs5cxj4fKyvFJrsFzV
 nNu8BhB0WlH98w40uKdoTS+Nahr2GH8fwO6Bnt66EBWRVsl0lFELdTPY9HJLxa9JaUpv
 HzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GdDMjhCpUMomtdmjludjL5DxnUY1JT83cC3CTovzo2Y=;
 b=SxJQ2vRl2vnxQv9O4h03efNkleJ3Pj4v77mpCuWKmlv6RIo+RbvY7XV9Om+Lx1FPnv
 DAAkljQfIRtN/fLT5XxPn+vtjWauFPG1uakAIveQOKUvuZKoOVexU9PQJFfdV8JjtQ/k
 ca04Or0KkjEz8GRtjxrt56fkRmYeeIIQpM3RDakWXR4EbGE8JY2oAeu9jVDl6ISJct+k
 BGcMfMdXW820hrUz3PbJBRXYBGECPpz13Tq46S4ZSnZUGOeStNFwF40Ln7eZ84nRtM6f
 Vn7xHNshDHaLEdokkVWb3aO8Y/u0m0zXh/D4PoVJq5LDuNrv0AK1Lb9WCkARloNeok6g
 ihAQ==
X-Gm-Message-State: AOAM5337na9xwAK+1CMhpnDxJZv2A6EMUYG58aBGHD47lArtllil0oT7
 pPz2+9Eh30YIymF9c0I4X62dYw==
X-Google-Smtp-Source: ABdhPJx/kJfCtet4fGDL3wGu+FwOoWTGqTUzJOs/TzpnGbn9Ox9ag+5FrcgHKhChPXN9L1FVwxNSxA==
X-Received: by 2002:a19:c749:: with SMTP id x70mr4215189lff.326.1624546660613; 
 Thu, 24 Jun 2021 07:57:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 03/17] drm/msm/dpu: drop pipe_name from struct dpu_plane
Date: Thu, 24 Jun 2021 17:57:19 +0300
Message-Id: <20210624145733.2561992-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
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

Use plane->name instead of artificial pipe_name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 20ff1832c958..97507e25f4f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -115,7 +115,6 @@ struct dpu_plane {
 	struct dpu_csc_cfg *csc_ptr;
 
 	const struct dpu_sspp_sub_blks *pipe_sblk;
-	char pipe_name[DPU_NAME_SIZE];
 
 	/* debugfs related stuff */
 	struct dentry *debugfs_root;
@@ -1431,7 +1430,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 
 	/* create overall sub-directory for the pipe */
 	pdpu->debugfs_root =
-		debugfs_create_dir(pdpu->pipe_name,
+		debugfs_create_dir(plane->name,
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
@@ -1656,12 +1655,9 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
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
2.30.2

