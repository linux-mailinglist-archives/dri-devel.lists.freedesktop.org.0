Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A67BE906
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F145010E2D1;
	Mon,  9 Oct 2023 18:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C02010E2AD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:52 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5046bf37daeso6239316e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875050; x=1697479850; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMPNImdJ1XH1qKLcBF8egU3WJE3EwSdEbTA3EmbAyxE=;
 b=XRDghrBgUqJAEZbB7N/BSTh0g62XFW3okuCq9LsfbEMP2OLNkUMqQfwm64v2hp2iNM
 3cJWSFZpeGD8yW5r1J7x+F74DmLAZ9YvbZZCE3sDulxTwuN8osWg3C1muL/D/pAXKIXN
 6NuAcXaAuJvxKiiPvc/JL+aQ59jc1uKCzrwrqOfk3HCIi8Lju+ERpTFEJUk+KERpJ/NU
 2REHrE1xEuX6vvFFep+Cp6DB51g5pOu+fD7ALssBQN2RWPQXFIGmf3dKb2VduFhGJCA6
 oaeHX9cpuVHmSx99tlDJ8eXQXPlwTCvUxldfMET1CXEQXYRD8sqYZ5AVlK5W/Zka5LaR
 ju7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875050; x=1697479850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMPNImdJ1XH1qKLcBF8egU3WJE3EwSdEbTA3EmbAyxE=;
 b=gquy7eagPG28Ua4prTeIqEQO7cMLpKHPgF6zNPTPcRYag3M1tFkMDZg765wD2laWbg
 8T7Hji9gitblW82hsLNNmC/vMl4HifOT1Az1dhJYnGvYhgqVvhftJANuuKdhmZLiIZCs
 LMs0lCKTJT9dy7zyLEG2a3Nsb4LMq9odbRhrY0ZGXy/ybHpaiBuTAuAi76Aa+QU+mfPi
 xuOLWXLkQxKLOIluB2gSbdB/vSKXVYlHknhY7EwlvgV4JodGELS2AQIoOi+l7zNUtoCv
 XbAacAkj+54rb948TjJuMlR6ZPpT/ROBhXNw/BVpuxWKi3MBNUxmz9CDEjAbOSTiaoY/
 ptQQ==
X-Gm-Message-State: AOJu0Yy7srLzhlkdYAOGWiQ8yQqmzLHtyQDiGm7XHS2XyrSy7oR93yoU
 yJL8/H0BIhDyMacjsGIInDbKjF+QQ2Vij26o2BgRFQ==
X-Google-Smtp-Source: AGHT+IGxFWo1cv7MZPWO4e5pj8qUwRrrnJfIcbY5MCcf9WtFviJE0fE4zMGxdE7ohyapXkTdwdxUSg==
X-Received: by 2002:a05:6512:3b29:b0:503:293a:dc1b with SMTP id
 f41-20020a0565123b2900b00503293adc1bmr17109215lfv.30.1696875050408; 
 Mon, 09 Oct 2023 11:10:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 11/13] drm/msm: only register 'kms' debug file if KMS is
 used
Date: Mon,  9 Oct 2023 21:10:38 +0300
Message-Id: <20231009181040.2743847-12-dmitry.baryshkov@linaro.org>
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

There is little point in having the empty debugfs file which always
returns -ENODEV. Change this file to be created only if KMS is actually
used.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index a0a936f80ae3..06fc632fd6f9 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -314,8 +314,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
-		dev, &msm_kms_fops);
+	if (priv->kms)
+		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
+				    dev, &msm_kms_fops);
 
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
-- 
2.39.2

