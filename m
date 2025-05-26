Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1E5AC3CBA
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A063C10E30F;
	Mon, 26 May 2025 09:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i2NokJ30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06AC10E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:28:51 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7398d65476eso1275329b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748251731; x=1748856531; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
 b=i2NokJ307yEqU1hM2OiTIqiCRQd/btS+Hh1ZixU5gViJTMfsI+ATzaY42umapbJa+M
 L9hG18yVynpPwj0CQouYQoMpW4DQrmCJWo6ZK2FXF1PsxV6XpeFtoP2GzYmqSHaZox9O
 pVpSgEVPm5Vs0hi/bqOozUOE0peCnzVz0K8JDurlefnyoiT1gwJI7mspbbFUVzthMI82
 FMj9EY1hLkMPLtGCSenhemsIJ1rdeP6PvQttF7h0q2GEYLBtgD49nKJ/mlKYV2xQFM+I
 myul3g/iFrxf+Oh9BqHxZLo4f1VE4kU2U2hV0nuDKtJAfSiZWdvuaKssLyFJKrnKDJw7
 Nkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748251731; x=1748856531;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
 b=FyhBpYk+u837Q25I6IlQbxsX5Wsq2taIIp8m65WKyMQPPBXBxoAcJGHZ8/BXanRIXu
 rtZD4KBP6WoCKwl1/kGQbFHgn7kSQEYL7aPer5CVoMEkrWumoaTXRTA1VFkXkbU0EGaU
 D2Ufubot3/XrmjNPNz/aHQnsITNR+c65+ZRhtGGrTYd+jXnaNRqRFrw8aISXC1TV7g6Y
 0713cAWSL7T5Zw+xPrPux7XilmGSucX0Oi6LUKmDUWJOYsVVJQSpuyb22MEx2xs+JTEb
 Gm0YhHlrhmD7bJvf4RCK3bXEsMt+GKwaFPucaiTcwCvsB9bcLCBbey32kbOaeY2QmLzm
 QC+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQDunfiXIdEWaDU+td11wKufUm4EcJDeBulZMRPEPgY7JNNey/rPeiaTCwd/ftjn0V7O9k95llyAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPwgePs67iEq6eseAb6Xf7KbwUin2G30MY6oIAa9rxGvPn05IS
 T9IfBqDwv8lv/vS0Uilr9LHktnY+OrA6fyvAsgb0b/dQZEdIdPxx8NWLugpfb7kH9RI=
X-Gm-Gg: ASbGncux5DCbgtr5+HdOgBXDeOxLfwdlzuY59wpQsrphgFaWh5K6E6f/qHjbKnFhKWu
 1YMIkfJ0hcFZLmN9prxOVnejpxv6CGV9qfjWd7njazYCLIgXk147SToexyFrHxA7fOVox0gIzfD
 ArkKBXSoIv5qN4bgyKEwsQ1saW+yu79mA1juM3wS8BWi5T60KBFptpkR6w6K4smqXsv+nF2WejB
 IAi4IzeB4gLt8fIfZDok+gTGageCARdqX/uOp+5maIO3xjNXa15JNBJjW7gVrphz8lEhZyx/RR2
 0AOE0oAvJIWT8CkBmNY0D1bcuGJv7A4urOrV5b9rTy2zqm9DIw==
X-Google-Smtp-Source: AGHT+IGJHwGsOxCdN5oGis27vb1AyYNhvNbxlgv3Kb4o4M728AI9zEGSMuLJuyD0gEFVU4qbEDu0qQ==
X-Received: by 2002:a05:6a00:138d:b0:742:ccf9:317a with SMTP id
 d2e1a72fcca58-745ece8e29fmr18116579b3a.12.1748251731195; 
 Mon, 26 May 2025 02:28:51 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 02:28:50 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:21 +0800
Subject: [PATCH v10 03/12] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-3-5fed4f8897c4@linaro.org>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2zVon4JQp3GbP7LIHy+YThFAabtOIovGb5UEovt+mkU=;
 b=lutuJy0IlgOtx6aUkFLZEfXbrUQnxG83yF25Vb6Q9+e+okhLrSXqHlx66bdw4JoPZ/idme+0t
 fsk2zMHDXoTC4OFQ469lUlWf2vO+151FQG8yJoYNfRKlvlJCcMBqOuI
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Current code only supports usage cases with one pair of mixers at
most. To support quad-pipe usage case, two pairs of mixers need to
be reserved. The lm_count for all pairs is cleared if a peer
allocation fails in current implementation. Reset the current lm_count
to an even number instead of completely clearing it. This prevents all
pairs from being cleared in cases where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2d8ff4b524715c658188fe56bc337e3ffa831c0a..bc7639a46386c6b9457edf3afdf6f747a632651f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -374,7 +374,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Reset lm_count to an even index. This will drop the previous
+		 * primary mixer if failed to find its peer.
+		 */
+		lm_count &= ~1;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1

