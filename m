Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 320587C6136
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 01:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6691F10E2FD;
	Wed, 11 Oct 2023 23:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C50E10E2DD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 23:39:23 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-503056c8195so549379e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 16:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697067561; x=1697672361; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J/MpJ17XmYHnlx8i/0n3G5y7B3wsnf8U/DZ/uSJ5ETk=;
 b=j35skBQUaQbjicgN3b8Vjyp4GfokMDzCPbPjUGvlnClSbQauByqGDym/pDk2g66ZHK
 a6645QXJVCVjcOFGM4Cy98EHX8F0aQqF/JGT6U8dnY3KCojw8uKR+0frzHMk48ut7Ua0
 wzwn+434Jjhrn5S5KXGx6gpWCfPbS9W+Zyu6kHgZE0B3AGFI6CqdeyVFQXu/sRMXzdJB
 xUktnsZAF1sCaps2MRWoIiDY3AJWtqz4R6miMIQMDEnEE9pDINePvI2Zwstht8/H+Fuy
 gTpPEcmHTLrPakhD4A7s5ESZgEIddsdlrnJ48jxeFai1gxwJ7rcIZFM9KUDUqSu/Keak
 Bs9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697067561; x=1697672361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J/MpJ17XmYHnlx8i/0n3G5y7B3wsnf8U/DZ/uSJ5ETk=;
 b=ULtIqeORVoxVK0mRGioI2atDLTrpm9wMj2biZ+lNEPqjthyHxWtRs8AaLwssHDmI9O
 xCrWD3rwCgA5Yucpkx7cS6NkAgFHZOvr9XgXDeH3fltcbwEYHfrQ2lHuHiYM4jKlGvYk
 3XMEHoylMChaRI4ipGrm9bEZr6gUj4yyyPRb+7uQFK9kmCKaAEfwZUjCDqTabbA1nTdQ
 EztdemfqB4rFrLtQtSdQr8JfZCA4UwAiFAKECA494HbDsNcnJr1OMrwnT6CMJ4bFx9uZ
 t4L8epL09TeXMnepN9+1iodyQsVvDJ/VEsCVs1aihf4fzYx9Q1eN0WvS6Gc+JhSpKF1Z
 XQQA==
X-Gm-Message-State: AOJu0YxxwCImoFdKEub6bm3fpA0eqRYs3D7XMTHzwjV09SkjCj4pMYef
 ZdS8IB4pmQtPNcD55VDYFFwRGg==
X-Google-Smtp-Source: AGHT+IFPDBRKTi3sZ7Nh+NrhcnYVb7RrWD6Ck7WGy2HQmEZMO6aLZb+HV8bDateZ3MxSKlrUyUdPLg==
X-Received: by 2002:a19:5044:0:b0:503:26bc:9ed2 with SMTP id
 z4-20020a195044000000b0050326bc9ed2mr16779185lfj.39.1697067561566; 
 Wed, 11 Oct 2023 16:39:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056512015b00b0050567cdb8f6sm2466032lfo.239.2023.10.11.16.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 16:39:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/2] drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
Date: Thu, 12 Oct 2023 02:39:18 +0300
Message-Id: <20231011233919.410099-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011233919.410099-1-dmitry.baryshkov@linaro.org>
References: <20231011233919.410099-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use exiting function to free the allocated GEM object instead of
open-coding it. This has a bonus of internally calling
msm_gem_put_vaddr() to compensate for msm_gem_get_vaddr() in
msm_get_kernel_new().

Fixes: 1e29dff00400 ("drm/msm: Add a common function to free kernel buffer objects")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index fd2201cb62db..19019c764f11 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1180,8 +1180,7 @@ static void dsi_tx_buf_free(struct msm_dsi_host *msm_host)
 
 	priv = dev->dev_private;
 	if (msm_host->tx_gem_obj) {
-		msm_gem_unpin_iova(msm_host->tx_gem_obj, priv->kms->aspace);
-		drm_gem_object_put(msm_host->tx_gem_obj);
+		msm_gem_kernel_put(msm_host->tx_gem_obj, priv->kms->aspace);
 		msm_host->tx_gem_obj = NULL;
 	}
 
-- 
2.39.2

