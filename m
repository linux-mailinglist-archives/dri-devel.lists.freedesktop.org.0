Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8A94CDDCE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 21:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD51C113745;
	Fri,  4 Mar 2022 20:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8894F113741;
 Fri,  4 Mar 2022 20:23:45 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso8938228pjo.5; 
 Fri, 04 Mar 2022 12:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8wKHEFGcZJBFIGWvjsg6haK45B9roDuA9AnfN8zp1WU=;
 b=ETWLRUK8yvHGuySP/W1rFb7Qb46SgJOyrSMqvh3x9ieihQRpFgCK7TpkX3tFbdj+1o
 r9PoYh52D6yeG7ICY9uLrDEhgt7GrHAg02pctMcCBo11wOwPXW0b045ZxsxKFnkNnBLn
 usz94gEodH/yeqCiJj4sFprFltydit0ZjqWxTFlfl/uHJdi+05I1jwzP6+U4MzBgNcCI
 5/PSFD294Eq7S8naVXEmzsIR2++qyA/gZxh3VUiy3LTPhLiBkJ6wOzTE0LOVZsQ7xQ+f
 aaoABdIE63QZuwxePV+qwgZsxbNr0B/m2X68QAD3B41/VVe5GD5HvTvnAmDAK6y61W/T
 CDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8wKHEFGcZJBFIGWvjsg6haK45B9roDuA9AnfN8zp1WU=;
 b=0a4/7dQfCgYa6qmTUVP37L0G1+X3cBTScM6BZ3+8UuSPxEfB35yv2kQ4mhZad3reYp
 rSzZRcDcuO6IiPl4aemljUMqBA7YDj22IbZDgtkATC1Az2b3jutFTW3eUVc+r5u+ms5m
 NxDlV5Lgvtvq0W4lSEPpus0VUZW3Y4fkdT2S8W0RC+Hc/WPKuJBhSxxcJ/DkRzCV6uTb
 DOpx7MOIlBQlt8K6CmRXN6r/lh9HkNsZndHvR2Ua9oPHDRj1bCMnjDxzKYcq4FFgTSz+
 SJmDmS0GF8Rtlo6rBB3Ivg8ebDTXIBL8UfV485oqRWQjZ6q8gMSRJl0vSjBKvhXN6en6
 b0TA==
X-Gm-Message-State: AOAM533bNv61pblqcPgsLnT+saUVtUIYDRxNUWbteTaZUCFuuRYaFPG6
 YbgmX+cm2mVNeyy7sMkjov9K0s9U10Q=
X-Google-Smtp-Source: ABdhPJyF5prUtDablbt4ZQd5sCQzEG+vhe0XmdWzoKh+68RJqCblDwYUbDyjr4r0BzAIUDZHG80yUg==
X-Received: by 2002:a17:902:d505:b0:151:9e65:b844 with SMTP id
 b5-20020a170902d50500b001519e65b844mr165351plg.49.1646425424419; 
 Fri, 04 Mar 2022 12:23:44 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a17090a390800b001bf37d6b433sm452572pjb.43.2022.03.04.12.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:23:43 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: Fix missing ARRAY_SIZE() check
Date: Fri,  4 Mar 2022 12:24:04 -0800
Message-Id: <20220304202406.846485-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes: f6d62d091cfd ("drm/msm/a6xx: add support for Adreno 660 GPU")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 02b47977b5c3..6406d8c3411a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -687,6 +687,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 
 	BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
 	BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
+	BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
 
 	if (adreno_is_a650(adreno_gpu)) {
 		regs = a650_protect;
-- 
2.35.1

