Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FA93B3217
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842DB6EC2D;
	Thu, 24 Jun 2021 14:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54FC6EC2A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:50 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id d25so8139597lji.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4naGYo6Q7vXKVyJFMwcq6Oq3/UZm+MxRt8NyXrzXPuc=;
 b=b5Hb6gwlVgE7E9fxC+jhksQM3CacT3Ee6wIxCO13yES6cmq1+Bbv8XdeJS2xvX0KPy
 PTYO7f78kcfA0heSnreu8XuKWPgKbl7iEKlkD5RvKvvJRv0lamgXKusE7aVtr1qjnKhJ
 ze//Csgb+Kr0zTp5r+ucjAUc1M0ds+SPafSqVCK2jy2aRJcO1vnPxOseAQYVI9yFAeM1
 ton8nZ1ywugAr93GNZ7VE0XdWX4nK/n8lAKqZ1henNgcloTJapbya73DBZpJa8/HuKEa
 OP79Ki8flUDDReVM+sAbi3vKmG1O+PxbSslsfbUTAtZMGffedlNEDWK7BR133009ENE2
 eUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4naGYo6Q7vXKVyJFMwcq6Oq3/UZm+MxRt8NyXrzXPuc=;
 b=SkD2OL7MP2+Cl519jaR5HySTvUUw2FPHBgPAlaYItD1C2lnDKm1aczwvBL5z0fvybV
 EOZbGesnNxUzS0ZDO9VCuRmk1piFeRH1n/A/tw57tOFeCWd/T93N4tx9IyVbX0bhvF5M
 S9kRBO3pv6jDf2/O0joiICN3cgkch9SuQxlBiWLKXDSN5gUrkhbodw8CuakqYtQpwti2
 h5BPtfbz2dFzzjWLylh3sest2hRzqD1li28fvH6kwt3wvTdWOt8euHUgF/lWFUGhmGvA
 maZEMG8eiRPX/ljY/rD0IxFfzq7w2DUOF5gA0IzqUp5cd7SwLdKI9QyH0l1RZG36h9W8
 zdQg==
X-Gm-Message-State: AOAM530tKSmU5kHhwdgC0MJ2ayEuYIoXYJ/XipNTpPktv28PxYYVBAy/
 pyTAg0YDK4B3jKC0RbaQYmzptg==
X-Google-Smtp-Source: ABdhPJxUoVSVazVY3Zn8HYTwVgBxA3JQEQAxELpvDBRiC5HLPvm4PS/M8kT8Xo2G3ecdzf4RsM23sQ==
X-Received: by 2002:a2e:8748:: with SMTP id q8mr891051ljj.508.1624546668845;
 Thu, 24 Jun 2021 07:57:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 14/17] drm/msm/dpu: do not limit the zpos property
Date: Thu, 24 Jun 2021 17:57:30 +0300
Message-Id: <20210624145733.2561992-15-dmitry.baryshkov@linaro.org>
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

Stop limiting zpos property values, we use normalized_zpos anyway. And
nothing stops userspace from assigning several planes to a single zpos
(it is a userspace bug, but the kernel is forgiving about it).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4658410eedfb..8a8727ff7645 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -44,7 +44,6 @@
 #define DPU_NAME_SIZE  12
 
 #define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
-#define DPU_ZPOS_MAX 255
 
 /* multirect rect index */
 enum {
@@ -1375,7 +1374,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
-	int zpos_max = DPU_ZPOS_MAX;
 	uint32_t num_formats;
 	int ret = -EINVAL;
 
@@ -1413,14 +1411,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	pdpu->catalog = kms->catalog;
 
-	if (kms->catalog->mixer_count &&
-		kms->catalog->mixer[0].sblk->maxblendstages) {
-		zpos_max = kms->catalog->mixer[0].sblk->maxblendstages - 1;
-		if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 1)
-			zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 - 1;
-	}
-
-	ret = drm_plane_create_zpos_property(plane, 0, 0, zpos_max);
+	ret = drm_plane_create_zpos_property(plane, 0, 0, 255);
 	if (ret)
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
-- 
2.30.2

