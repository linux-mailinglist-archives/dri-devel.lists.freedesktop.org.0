Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC416AFAB97
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 08:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B64A891CC;
	Mon,  7 Jul 2025 06:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pjppZHzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E5E10E410
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 06:18:27 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-74924255af4so2498067b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869106; x=1752473906; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=pjppZHzhVylETIF1BknV2Bq/ZjZtU7NAA4PXoUoL93L0yRJVEGN7w9Ge5NtCca3M+6
 yLKX1KNn8JlnVCMZVtTrTpir3InSab6TYd+0+YIkb6w13HRbS8z+LbrmA6Yf2Q7xdoq4
 umARVEVwliKbY5qitKn9S7ZlNamVrPqHvWP0ER6A2rByzms4yI+KZtdTGZPOHWLYBo4O
 ik+eCUHfghTAsvIIlPgYHqDuz+MXXp1Qn3puH9fZncVLH+DlH3m8aeaY8U3v113+bOve
 /DLPuK4BJYkMhMdEfOqSRWITr/YYbuwU2zHUE9dZF63izZIxROr4EhlI95QA/61F/rZP
 6RFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869106; x=1752473906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=w/4kEVtRSyEM0SvtDdWDC8rF4ZFUD1wV1fjB2VvF9kxTuw2crDiyY44AElM17+S8v8
 39lt7V90TNh2sDeqYHJh6H+CW/iYq0liNdhWLc09MtVtWf42jXSGHq9LHz49oU0wyTK0
 hPBIKYemTgtw1UTnDk9ScvhvhG8HSf6HrvMm7dADuSs5Au2irNe1CAlCAfiLPwebzFjd
 NfMHedJYQMb5T1+rC6phVZHafMl2g6+n7uQaM/WfsVetQbh4VZJWX2JWankBhAuIx0Mr
 3QSJAHrJE1+MvJxoE3sOfWj7ggsittlmsZQlsgMAxhwtFIGTYiQ3o/6sGj4tn91tbSzX
 KbhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVip2eYYIzlAdOt6FLg27zIjPMhEFwNW1R9tsT3IqftdPofp6qJMLTx8f4Efx4jYyLKMZbvxUavphE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIZRbmPg9MPGMTgpjxrawnEUMLZ1qg4g6Hk+17nmZK50tDZVe/
 V1xK6vMqJaOHXbAP0s+mOedbLVXL9thoIiKNPD30MMa7skjgoagRjeg8RdQze4zLvCg=
X-Gm-Gg: ASbGncs4QF985YdgX1ZC5NJysg4W1CtWEoe16+4YllitITQNQ1jbxkNiGUMeD9fKEd/
 RcAY2nzAs3gutXwqkQq3OPejZUWc0NeHIuyWoE/NSGdztzZbNEqlc7O8VKvDy2JFYPUUETAC4y2
 8c+jZUHnj985KHVJ4KbsF6FBZKd+TyGmysDiGiB5Dest2aeaJ+YU+aQtS5PPGkCPG5GN9YA6Qqn
 PUS+m+m/SJrwgB7VNvF4TKv2/KpJZdTdPgRfwG6r7SIEYtiiZWYzsWfWayJCAlaJ5lMmS9tHsQk
 L6qWDD4uf/mYkVR7K10v+JjxOGdzc2aef/TRTNa/vEmayc83994xL7Db6UI=
X-Google-Smtp-Source: AGHT+IEmnc9Nl7lcGHKBCmQmCi/m7XOmXpKt5Cnl8qyjZqXrrplvrrS72dHqfjoA89VugwwUs5rqDw==
X-Received: by 2002:a05:6a20:3ca6:b0:225:c286:5907 with SMTP id
 adf61e73a8af0-2260a0a362bmr17640836637.3.1751869106645; 
 Sun, 06 Jul 2025 23:18:26 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:18:26 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:58 +0800
Subject: [PATCH v12 03/12] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-3-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=HIyipBAXPGv4iNFX/AHEf7r3WMbFa9ZI0N5soHzc2+H6HD25aR3ZFY5RtKQV9yhsI3bp4xQZp
 NKWA9XKuuigCEPtJpJX+IkEjE/6yf+9/eIdQRwzGkisQtZC9ZCsrtJ7
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
index 2c77c74fac0fda649da8ce19b7b3c6cb32b9535c..3f344322b7f214d0050986e675b32522f8eb0ba7 100644
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

