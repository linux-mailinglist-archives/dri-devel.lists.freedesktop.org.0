Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBFBB2B60B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 03:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB8410E507;
	Tue, 19 Aug 2025 01:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IBhgP7gZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CAD10E505
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 01:31:27 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-76e2e613e90so3436608b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755567087; x=1756171887; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=IBhgP7gZwEBsSp7Fgsh58RRMDFKx43pdcxKjqTbEgM9UcuGqtK6IBVReBvE2iBmgdx
 u0yFXC8SZ82eFsRZeHIuPKpAkZz6x9P17+XQD/9+/S9iou2tVt8SfR0tppTyctm6wcLi
 4XBFTJHpXlnm25c92BtOiMhQpyUipjlHJS0Sos8l86OzgjLMn3OBS7c3XGolKOOdW3o5
 rIjQUSzjYhrre6PyOXZ5eapHZRT2VmFQ2R7ggoHb5MRgpsQ4MDfrPQPO0oTnDS9e08PY
 rbHh3dp+bKYey4F+VA9dgOl7KAxlZPR6rnYhCrQsjPywvpSmivDIXWJJpnJWJH5CF29c
 lsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755567087; x=1756171887;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=TyISBB+tC4BpZ9x0Fr6CwkkLWlqF+C5Thd1HVZtscGcLFv5vx7mGkfqQ0iBrxMPxBT
 +JCGW8W+vgKG17faPu/XD46mN28xQb3d9M2rwnIBkqeXgU9lRlrTRX2euZNvH/JHiVM2
 C0+BpH4OKu3MrZz/h7DaVGUt7AIDp4wf5vw8oBUavfscBdY15bCJYWNmFqdD/NoEw4bd
 PN5LUanb9Ezn903cCKcpYY7/FOUsVsUUP2GOhkrCYTefUTs8JLqyMWDMRj02X66413N4
 VprPiXFwdpYc8wqA9J/YBLb/BzusfacbxdhWnvI6lUft7vlUPw3dSozGRe8qzhl9E6pi
 NFuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzm08k1A7r6iGFU+n2zPANL0PveWkW8qN2sUDTDMm7KrqCU6s51IoNTaWmVaJ4uAAD9EbaYjJJlE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB5U5ZnXpttDBLiDp7KjjQ1L4iwaJGrtPPqJ5zexB3WtymrPEw
 Fyysu5N4GEO3NWayd1rp+KQNjg/5j3WX6YckYweMQnXRwKnp/XfjROBdwQL7TK5cSn0=
X-Gm-Gg: ASbGncvwaJnVgRRIndhJJL3eEdHgxM5jXsBecuxiJZdR/RDUqhNYLU1B1PqMm/U1JM8
 oe3RMP0ly3Zlt+S7wElhlRECc3eNoSfTE+fTFda34E13pNWCUsUUuUvX4UFkhIZkVtiTmeWHaVg
 Jlw7ODVFpy9Uwm31vBC0eIWA2egkG2b2buhTqtt3ToX2Vy/bPTehP0gRxjP9FC3lw2NwZ0KkE7i
 iI9VR9v9eN39/ziTDDuibhD8nsSppCPsUwXPWn0gSGWKA29Kckonn1Fs0HNCm/ResX8iR4oTEjo
 LjnMTYmsrToYqonZUegKz5vFueXL5WkZbJMi5uh/K1wGM+UsQ+8LODk6IB7icgL59LVPp64ZPhf
 /XNGa8C41QQ1NAvQNBA==
X-Google-Smtp-Source: AGHT+IGps1ST7kdQvxYit2Ob99jtGtkYokyhyRmmvXkWhW2P7lhMmeUjXrOBgJl4/RARBwWnz7OdKg==
X-Received: by 2002:a05:6a20:7294:b0:240:9af2:71cb with SMTP id
 adf61e73a8af0-2430d372220mr922993637.20.1755567086739; 
 Mon, 18 Aug 2025 18:31:26 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 18:31:26 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:30:58 +0800
Subject: [PATCH v15 04/13] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-4-2c7a85089db8@linaro.org>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=Dl0sF5pWfn9RHyOh3X9+toV9iaBEjSAor1oRajKpwW6z4obYTT7oFvWdRGeYf+oUPpjzPNx3z
 5LYiatLWoMBDaahzNyoUttMSMXwjmvTD6Zw4bE8Ia//fq2rbkAB5S9B
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

