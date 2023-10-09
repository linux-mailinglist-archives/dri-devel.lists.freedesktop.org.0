Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A777BE905
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B162810E2C1;
	Mon,  9 Oct 2023 18:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C0810E2BF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:49 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5045cb9c091so6364534e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875048; x=1697479848; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rIiIl1qxmpZwJAax2zo4ZFB4kzioqbwuWWlEMohjM5o=;
 b=poZ33nt9aqdQXQPAvOIeGTprazdVol6IPs4onOqrdv1bvJG/NzcS4DcScYtjztds43
 lF6Kj5eTxyCGrFS5VJeJmt5+LpUbadV/Yg/WXhHx3B3GP6jcpj9qpcog2PNJfjrYhC2X
 B4E3ONDLTOz4cunQiuxGlXg9kUk4bL3aZlXY7yiRHDOaLyFyQf8KGeZrQKGZBSPQAyq/
 LmUjQZpOOL8oeZG/q6ZNQf9mOaCghEQFiVrHy/TWptn4n5AwGXjc3+wjKG/vsoFhZGbD
 eD/wyEyCdeE7P7p5AqPUymZLbjlrvgDztju3eyn3UpugGaTNQpjLPlvT4tGTsYNAmTYM
 NXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875048; x=1697479848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rIiIl1qxmpZwJAax2zo4ZFB4kzioqbwuWWlEMohjM5o=;
 b=jc2JxaK5bV0xoGm/uteBcAhWkDlu+3eXH6LHmLvzFL6NCKFLoBX5vNxzY04hL608LM
 Wzx4bpHqxhGVGpT/QNoybs0sVSs90B5pTz2hxl9zS0Z7FwZdWqmju+VKjbIgjEfDtpir
 Blk+HwN2s2358hHgWL66H9kYozluzjhv/P5AiAnB+BDeNAmv5BkAP9UXtU6mgJmVyEO1
 jVgt1gRFchC+pyf38RRcWwzCseea+YOuPkKEg1AkLg9kkSe+FjA8vGt65KqerTFVYGUC
 FbpEWSxiMUukYLvRAPCO1nvYFsx52M0awJ9lUvsUYwegRQOqmGarXTC1BJnZpyJPatj/
 ODTQ==
X-Gm-Message-State: AOJu0YxpwHpTrTLZGN0K2cHiJl6jOCu15+d8infrebSqn18I8nrTja32
 WNT5wwdjf5r/+Zxf5031CGYUHQ==
X-Google-Smtp-Source: AGHT+IELzXLGkqfFXYHQEEg+Re6/uU4DLwq935JYwzvmyWABx/+281fRZT0fJSVsJMsGdurSBTxfLg==
X-Received: by 2002:a05:6512:3e18:b0:505:7a65:ad5d with SMTP id
 i24-20020a0565123e1800b005057a65ad5dmr15542523lfv.56.1696875048162; 
 Mon, 09 Oct 2023 11:10:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 08/13] drm/msm: remove shutdown callback from
 msm_platform_driver
Date: Mon,  9 Oct 2023 21:10:35 +0300
Message-Id: <20231009181040.2743847-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

The msm_drv_shutdown only makes sense for the KMS-enabled devices, while
msm_platform_driver is only used in the headless case. Remove the
shutdown callback from the driver structure.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 76b69f605b9c..c2f989d1ff42 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1297,7 +1297,6 @@ void msm_drv_shutdown(struct platform_device *pdev)
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove_new = msm_pdev_remove,
-	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
 	},
-- 
2.39.2

