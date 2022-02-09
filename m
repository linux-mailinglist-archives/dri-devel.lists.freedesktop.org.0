Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A734AF818
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121CA10E3F2;
	Wed,  9 Feb 2022 17:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F8F89CFA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:25 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id z7so4441529ljj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1/ATy1SER9Rft7B49K84iltLuTk/P0va3Tz7LA1Pnkg=;
 b=IqG7ATjnxOef+EGAmIBzFkZpr3VGQI8n1YxhsSjR2oK/919PYBxL1+WBGyRZMqhjbj
 y8qpYq5GXxIO2FQ747SLGQ5Y5Ew7VgoxOLaHpalMs0keAVb25PHAxldR9VmKfvKvPdpD
 ZfdggSY8xCsBodClGtri3nGKTPBwYwRjiM6+YdfwabZxnfNoFv7VdTzdgVWtzq3d1MBS
 BMYt6ayNuaqwhy0b8QFNCZwvgXMnrgsVqJY0vUkEm2vjIDbsA0YJdAAcB78bCOsOBGN9
 1YgVWbpN0AwcHvrkfx1mYg+n+hPAFASbxQrQbflPPEfwWXF4QyTdF7oTSpha9r7GiBP4
 qPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1/ATy1SER9Rft7B49K84iltLuTk/P0va3Tz7LA1Pnkg=;
 b=mZypDqxFBo9XRXXXDf8+U4KXKgEbFkoTtSwch/Z0iTpvFxyMmvzofcWwWnjdDvs7UO
 GkOEeWov8zr2aqngSahxHoApKcvafM6PgHX6fYzaSO2qHkznA+BIYuoL1f1JBWiH0l0H
 ZHC+nL6t3kUHCzqJ9x1rs51NTaLzIFN92ZInYmeuv8WIvmyCmWJBQIndKJNZyrLOqJxS
 +6f7tZ9XZB07ERuQUqDOXJxczXkcJiP9UYTOGQuIq8iKrza2oGGJ/nGiaxyObGwczyGO
 Mws9cEu5X4MQDkBSmX69Y62+5YvOPFXoR/P1Clg83mVLdH11BrDfTM3YELbAxFsNRWme
 hJjw==
X-Gm-Message-State: AOAM533h3wuYFvaJY+uLhJpxf7+o/aIs9gAfJVixBSXvjvhlsud9IcGq
 pGEFC1lyqd/1S1lfCjBs4Mieyw==
X-Google-Smtp-Source: ABdhPJxLWF5f9R0XQgNxir3+ThLX3no3g0rzkJKSvEttlfX9xwkNse3OCf3pewdaJnO7F7P78DPH6Q==
X-Received: by 2002:a2e:9916:: with SMTP id v22mr2187751lji.382.1644427524297; 
 Wed, 09 Feb 2022 09:25:24 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 02/25] drm/msm/dpu: do not limit the zpos property
Date: Wed,  9 Feb 2022 20:24:57 +0300
Message-Id: <20220209172520.3719906-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stop limiting zpos property values, we use normalized_zpos anyway. And
nothing stops userspace from assigning several planes to a single zpos
(it is a userspace bug, but the kernel is forgiving about it).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3fcc964dec0a..c04c3be16d85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1429,7 +1429,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
-	int zpos_max = DPU_ZPOS_MAX;
 	uint32_t num_formats;
 	int ret = -EINVAL;
 
@@ -1467,14 +1466,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	pdpu->catalog = kms->catalog;
 
-	if (kms->catalog->mixer_count &&
-		kms->catalog->mixer[0].sblk->maxblendstages) {
-		zpos_max = kms->catalog->mixer[0].sblk->maxblendstages - 1;
-		if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 1)
-			zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 - 1;
-	}
-
-	ret = drm_plane_create_zpos_property(plane, 0, 0, zpos_max);
+	ret = drm_plane_create_zpos_property(plane, 0, 0, DPU_ZPOS_MAX);
 	if (ret)
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
-- 
2.34.1

