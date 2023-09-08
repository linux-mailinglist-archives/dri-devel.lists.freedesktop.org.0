Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0732F7980CE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 05:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885E110E85D;
	Fri,  8 Sep 2023 03:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B415410E760
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 03:05:25 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bf66a32f25so6564221fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 20:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694142324; x=1694747124; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PjF+Ni17TVCwIorp3DZ1/pP2g7KWsdAJkvzgXwIGnZs=;
 b=dpOGhSqrR9FTcJWoCmMS+HY/1mRULQozEF6AYS2uLuSXx8kl+zIGMBzTrx/9TTYPAP
 i+Xcmn95a1QwVZiHRJpIJuEz1FfntUq+ztfWnn05PYJ2WJd05I9P/mHiOIx7m/jUP696
 3pnPZVk7FzpC6ODFs00LjdpqN28uZwsFsqhw1f0zm9mbcT442tut3gX7YK6ejWNLnk/w
 q3Fp4kv8oKxEw8mglbU+7UnE3CVnUP+11v1adox7AuWt1pZRYZ/owakS0aPbLDtZnV30
 mp9vOCnmexKd8cYQk6esxyCxK759+B0VOZf4RbnVRyGm5fyLEDYmzFkeHdCl9LsC9A3s
 tIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694142324; x=1694747124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PjF+Ni17TVCwIorp3DZ1/pP2g7KWsdAJkvzgXwIGnZs=;
 b=wXSB9VdBtC+sPySmYoxrZ+CQqa442CpNcL8OHqvSk+/Mjm3YYG+i5P7RYyE9KF5jb8
 Cktk0+Nao3m+/xCpkBeKqHYbfWY/Lpd/fOhjJD+nnLxLLQeC3pnsGNst5h5DAKHNubJI
 bX/3Z8sbb0zyOl2g1t3qrmZrX+bgl1TzZVFJUDZX0gW847BHnVuE/P6P8O3H6Vrv2Ejb
 r6WrYuH0O0gkgmcTXFSVSkMFExiSmMJyNfFL3dQpu/8Z1JoA67Ra+zZ5Oinnmgy6eo9T
 TRhENOD7+cFhMnQlmQYENdfF21iw/wfWmMaDRyz9qaMmmVELROd5VaWD84pC3dYhZLeB
 gjfg==
X-Gm-Message-State: AOJu0YywJFRGu62gUEF7tFfHGWYwme6Pgay1HLyWvrQTPH5GK4bbglpt
 FC7NIRy99MyAxz/Es6a+thrlJw==
X-Google-Smtp-Source: AGHT+IEPZQBKLVkp0sj0YHhbSBoBG7ps4S6wXzS+PGeOdpT3sIK8s0aBEQUUBdV9d5V+uIjuBNLNIw==
X-Received: by 2002:a2e:b044:0:b0:2bc:befb:b602 with SMTP id
 d4-20020a2eb044000000b002bcbefbb602mr776445ljl.1.1694142324074; 
 Thu, 07 Sep 2023 20:05:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 20:05:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/5] drm/msm/dpu: finalise global state object
Date: Fri,  8 Sep 2023 06:05:18 +0300
Message-Id: <20230908030521.236309-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add calls to finalise global state object and corresponding lock.

Fixes: de3916c70a24 ("drm/msm/dpu: Track resources in global state")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa6ba2cf4b84..fba2294e329f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -385,6 +385,12 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)
+{
+	drm_atomic_private_obj_fini(&dpu_kms->global_state);
+	drm_modeset_lock_fini(&dpu_kms->global_state_lock);
+}
+
 static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 {
 	struct icc_path *path0;
@@ -827,6 +833,8 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 		dpu_rm_destroy(&dpu_kms->rm);
 	dpu_kms->rm_init = false;
 
+	dpu_kms_global_obj_fini(dpu_kms);
+
 	dpu_kms->catalog = NULL;
 
 	if (dpu_kms->vbif[VBIF_NRT])
-- 
2.39.2

