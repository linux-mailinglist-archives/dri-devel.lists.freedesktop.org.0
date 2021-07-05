Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D773BB4E4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FD789AC3;
	Mon,  5 Jul 2021 01:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8AD89C14
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:20 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id b40so2605768ljf.12
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2n+O1n3MjobMyODgFgXeqymGpOIdBepgLh9Gjje/d/0=;
 b=KgGxMdEA+VY7xzyZ5I0yedEdw8+REG8vuVi/1htoTppTW0P+Gdv9u5R+blkHi3G3Aj
 Cx9YlQ0q/KFtWF0+yUK4VaFL5uQi/OEvLjiU6aHFVNtFsbbKcsfz3UJ+YdX1A1XlfYr1
 tzwXgGr+anC0gr7nfIkrM108XFOziIf1W+WCcro3p0ITUnBC1GaiUABTuK40H+q1/X69
 0h/I81/SzhDRJC1q+DNjnp8wlqQErRO9RVkRto7BxFAsUcra+O4FLf511g1DY2SO3pv0
 71QvsgbXASBBXScII4IUzR+p050IZnORLQfSJHHDU/8KP7eUU/LxH9uLJPO0tExxNvDW
 mckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2n+O1n3MjobMyODgFgXeqymGpOIdBepgLh9Gjje/d/0=;
 b=DZog+tL5jvVN9B72gxWbLC3dsZ1IW5VD41OS/DVBsC260cd5tpiXZ633v6pen5vBoa
 ettWLflfI29y2i5zvRwHBerBbt3Pw1YwdnLeJ2SGrvK4LzfaIWxW7RrfFp0M1D8Ofds7
 zY+CpSO2X/JvLo2AsZ+DOuIviWVYgUl5zbPOXRD6kxmU6K0t17TJV6ROns92etwZH4tB
 93Y/sSer3ACjMrj+hYIWxqcYQYq8D3go8Y9hA/B32yIlRn/enGrtkDcqc/5SO8Q7WtFD
 OKjQJnaOfHESlumSKN8d7Q1p9tRg/bGhuv7VnQ4AyFYINjZLQn2s3f9TL72RUlALahqc
 7CUQ==
X-Gm-Message-State: AOAM531p6TSwyAubxlTzAmYffZHmVjaU6C2Ng7pBDT1aDax3ePtF8yE3
 BwcVC8fL/6F/cTj50zXOxlI4ug==
X-Google-Smtp-Source: ABdhPJyk0MnE4sbF8fIDz4NEvdOqd8wfgkcMZH9utOBO7M+fLQoKlektvvwLWM/9Npk69CmzaFvCxA==
X-Received: by 2002:a2e:a583:: with SMTP id m3mr9152522ljp.305.1625448319208; 
 Sun, 04 Jul 2021 18:25:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 16/22] drm/msm/dpu: do not limit the zpos property
Date: Mon,  5 Jul 2021 04:21:09 +0300
Message-Id: <20210705012115.4179824-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
index 8ed7b8f0db69..3850f2714bf3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -44,7 +44,6 @@
 #define DPU_NAME_SIZE  12
 
 #define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
-#define DPU_ZPOS_MAX 255
 
 /* multirect rect index */
 enum {
@@ -1374,7 +1373,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
-	int zpos_max = DPU_ZPOS_MAX;
 	uint32_t num_formats;
 	int ret = -EINVAL;
 
@@ -1412,14 +1410,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
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

