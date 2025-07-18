Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A90CB0A540
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 15:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD8B10E6EA;
	Fri, 18 Jul 2025 13:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T9I1xsl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BF410E6EA;
 Fri, 18 Jul 2025 13:34:40 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-45600581226so21868185e9.1; 
 Fri, 18 Jul 2025 06:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752845678; x=1753450478; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s3S2nH3iIBSHOnkJfrSWN1lV2Y4g07swQAw5eWhlmnw=;
 b=T9I1xsl8Sl2ZHFbytfQJeJpAmq6LNR4yEdqmlXrZV4/B73vAsieHXwqyZ4aeCSQgQr
 BvQ3RgVUD464m+hH8yRH3GLCu4hyeZ8WvWEEgdTMUHvF8lqLpDbsQxnXm/1fI/Fe7QzT
 jKWnX5mqSomVBXfstnYmjjYTpAe/p8BPO4pSph+3NBKg5eOTUdePMfqVhHo1Dfq7Z64d
 mB+qeVbgjz5q68h90pcJjSHc3Ad6ETUK2m3N6Hjv9hJlmYzMio5AmJ3mI9WQZjNqR05A
 GgyN3mUl1Ji++WrfVfSYMtt0Mi8p/u8q6f1zizRkDTNsSfUEXTTnPhBUpbFXzVzF6Sq4
 Fj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752845678; x=1753450478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s3S2nH3iIBSHOnkJfrSWN1lV2Y4g07swQAw5eWhlmnw=;
 b=GVmAWJyAij/msp0+x5OhHNW2xb/NNB4PTgubFNlSPeUy+73AFNBjoW8rejretNoFUN
 vwFHfMUv9j46K/zY6xbWQDOugojNxPAcVXRq8Tn/kHPlF9Ewy2TZLBF+TIw1loFAuZDp
 ppCt8y3yq15ayKemzqNHcbDVnItOqVJWJ+0O7anmmKX3wT2H0H4Uqn3a3fPgy0gz/5wv
 ryzVTFIoe+jP1S317+HTv7DLJKDPhsA96k6sQhkpOAMZVaXDBKaMM/SEZXrcK2oA28Ve
 96dycTnkNOANffSm2JAyGmP6OaXzC8ptJK/OlPipIcRXcLt98BoGzqW3BeHF6KwiRUpN
 uAMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIU+hxrgR9r05dKqiVxq2J+rW8MJbaT482dGKLNn3sstMet/3ny9nBBEQtpa80F15oVGXp1LkterVV@lists.freedesktop.org,
 AJvYcCVPO7sWBO1xMESSPpcnBNTF6Obc4oUMiWqn2QXm9zIjzmjsXzy+gDE6GnmN7Gv04hprfwlenaBOntw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/ME5h7NDTRMX7R5zAEvaAIeECUNlBKwhKMfSNatdhJBHWAad6
 WuKoBOW16NWJrjHjUPqNxdbkhfJnjNqRJx39ytEMH1XTFSoVbgEs8jH8
X-Gm-Gg: ASbGncswzMscrJFeM48JrMNAKckHcxeZ7aDTAi80QgOkT+Ug0oaaBN5y+hWtstXb2Xn
 8TvMIYnqYWuiOp1EXLwiaFZpU8dO7DTPLiTr+1yt1VLkPfbw/bY4b/5F/UHfF373tnE1iN1S0CJ
 B6eukOjWEeUWiB+/KgDL7688waMY/u6jezbmCpXicKR/m5o/BNLSWtltIHI0ohkyiS2xfGRZvpq
 q2SXdpQMLg1i7ECoH5IYz5DMtD3uUxTtpqRzDuUMt3Aj+cCXAZP7ip1laBtTAnbNHWW6XTcf7XC
 +B+BiUB3L0fGV8L/hcqd1hnZkU+vxBbQwzkfl8+saPs+q5oZ8qi9ugvR7OaAYi0V2CYkEcDryOr
 lbatR2MZY08zeXAp44S30
X-Google-Smtp-Source: AGHT+IFi/RrqmGh+8qREgha23rb51709ZRw5wTatIKiwddXGDcKLuzvKzv//gZCwhev886dyqBjvmg==
X-Received: by 2002:a05:6000:290d:b0:3a4:d53d:be23 with SMTP id
 ffacd0b85a97d-3b60dd731cfmr9611083f8f.30.1752845678170; 
 Fri, 18 Jul 2025 06:34:38 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b61ca24219sm1811269f8f.15.2025.07.18.06.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 06:34:36 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm: remove extraneous semicolon after a statement
Date: Fri, 18 Jul 2025 14:34:04 +0100
Message-ID: <20250718133404.2047673-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
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

There is a statement that has an extraneous semicolon; remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c317b25a8162..33caefd0f877 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -304,7 +304,7 @@ static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submi
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
 		for (int i = 0; state->bos && i < submit->nr_bos; i++) {
-			struct drm_gem_object *obj = submit->bos[i].obj;;
+			struct drm_gem_object *obj = submit->bos[i].obj;
 			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
 
 			msm_gem_lock(obj);
-- 
2.50.0

