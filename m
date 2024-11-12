Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C394F9C6048
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 19:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3AF10E614;
	Tue, 12 Nov 2024 18:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MjKplHGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3182510E610;
 Tue, 12 Nov 2024 18:22:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43159c9f617so47661915e9.2; 
 Tue, 12 Nov 2024 10:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731435739; x=1732040539; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rGw8I43GoIEdw75f9gcID3EPkPrgfiDyB1X473+QaOg=;
 b=MjKplHGZeWfpQCpZZMh/d0HWECDuE47XSRrUkNC9oJUxh0ttXFcQtk+/+7vVwV/79F
 FsSP1bvhx9E4KfUi3++zMIQ38qGC7BF3nDpflUTE/TnnDmqutM2DEgXL22ldgeYo0DhQ
 KSHU9gUqBcs0Xanq/yIdm/mNTa/JSH4D8bfj4cNIqqaB7gkJ2MlsYQdejTHI7smPmQal
 D8wUpn3H/YmoO/qE7ymueNAx9PS4OdSdLGLJpJT3lyxsHVfBBWy0UkW4BzzTaWN3CITz
 YCjDzp0/hoARNaV2eFqFsPlfqZ9gcis8sJMVacijPr4u/6jGVHiULr50iGHkPZHXgT/B
 +Wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435739; x=1732040539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGw8I43GoIEdw75f9gcID3EPkPrgfiDyB1X473+QaOg=;
 b=klZV8zbG/A3cAhv25OXmn0oexEhmtaDH53+BWXz+uWJxTis6euZiVEBHC+0txpFtLt
 Gr1M36YZsqZCCcXYnTqZQjzvlI7DcMuHGlRkyrj/lSFsX4SVbLz81xQHq8/lEFnVFy+8
 T80HkFaOfBRvlSvqL90wQ3PvTopeO3olqhfl/DbgzkdZaktbASP6Ac0zqqYfhP0P0tsL
 9ok1HP43AJ27bpPscnhnYdRq0LFeOKz0+YrVvx3WJR7FmVY9GN8YW9HBY/LE2HNoB3Pk
 WPy23YzDMSM484MPzVUGi5n/1QsdCHeaUVRSZKtt82Pz7GmPxFvz7TQ3XLYanSyCTIQG
 R/rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIDZl9Ck6O6y5h7Fh0+8oFJwwYY8NRVL1uBWoRTDRGukbUJKeayc8FI48GW6zER1/dGbsobgrfsqw=@lists.freedesktop.org,
 AJvYcCWxcngLurUr0bH7Uc5tfn/3EZ5g9Ioa/3Ttug+NJj9dGuVQLuxktWct+YabPr81wJjDppGgNUKbQL75@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+q8KG97LWRf/3LTO2OfPzQUSdMz934OJ2ne2Kg+RjtcwAwZZw
 R1BEnSJtzHfYkUJ3dWSCawfEp4w+YmlNm20n4w6Vq//GAc1YHRs8
X-Google-Smtp-Source: AGHT+IHQJ9DcCw2M41pZGval9nx2PIlFgi2G38OFndiORIwfTgf0326SaoN/rywDWnrSrr2FwxlJzQ==
X-Received: by 2002:a05:600c:4507:b0:431:5c1c:71b6 with SMTP id
 5b1f17b1804b1-432b750a433mr165118395e9.17.1731435739344; 
 Tue, 12 Nov 2024 10:22:19 -0800 (PST)
Received: from localhost ([194.120.133.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97e62csm15903604f8f.37.2024.11.12.10.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 10:22:18 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][V2] drm/msm/a5xx: remove null pointer check on pdev
Date: Tue, 12 Nov 2024 18:22:18 +0000
Message-Id: <20241112182218.1119158-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The call chain on a5xx_gpu_init is such that pdev is not going to be
null, so the null check on pdev can be removed. This also cleans up
a static analysis warning where pdev is dereferenced before the null
check which cannot actually occur.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

---

V2: rewrite Subject, remove null check on pdev

---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ee89db72e36e..4edf9109d1d8 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1760,11 +1760,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	unsigned int nr_rings;
 	int ret;
 
-	if (!pdev) {
-		DRM_DEV_ERROR(dev->dev, "No A5XX device is defined\n");
-		return ERR_PTR(-ENXIO);
-	}
-
 	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
 	if (!a5xx_gpu)
 		return ERR_PTR(-ENOMEM);
-- 
2.39.5

