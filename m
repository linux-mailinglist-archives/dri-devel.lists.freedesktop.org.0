Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F96B84CF4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E5010E8AA;
	Thu, 18 Sep 2025 13:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eO8hE3Vf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FE510E8AA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 13:29:19 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-32e372c413aso983511a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758202159; x=1758806959; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=eO8hE3VfTZGaejWTOoegtNk6PcVYIr3OA++omRtxgHvRZwSpB2JiZhTPg6DA5wBeol
 CRdabZdN6HYTu2iNWXAMRSLZrsG+NFzwdRSisl91ZV6LrBOvwZ4+1FN0D5Wgc/ESjOZz
 lXv1Z9kEupdfPPujVIM8qnIeVOdwibLVMnfrIgHMuDwGtoHgqwe/fQ5MVguclNOVPzL1
 Qt+imeC26i7Eavp/htpr74hVhMeXAlwyCfHS4f1Cc3ZlMjMCJJI1MYROfzyaTYP0orlR
 5R2mFeEKFoQCruh12vqkm8zcxb3Ci6AQnujFbr1iAUHC/mzboBWV64Sm9HkheW8w0Jim
 +YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758202159; x=1758806959;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=gqgkuzGQflPUF7hC6k2SvFDwX2yD3h6BIAK81WPH7Mprx0ZkydzXcObWUGCIa+T9eJ
 qL9jZ53lL9x2S0dZsMYKi4Y6DOiKDAySM0V08FjapdXVpgoWU7AgFQ/kSM365VJp0KN/
 keLjN17ZmMEXVDX/CP4oZLx5am6LJsRmmdwETVgFPhBPj3CtYL2Xb46/NRqaYKbpz38z
 Wx3ntXDjwOUL7s25u1M+cPYlcdhFXw2fOQ93fpKuWYPzP9mHlPU50zyaOHFxUNsSaouC
 X9mIHifaOhSpKqOj0K1BQh5LHDkzr7MPC/+ze0lbTHWZFGIyH10xJuOVWgutrlnfj6Ex
 syiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYmmc0yxBc9evlmXncYYdqKvB/t2mtBKZQlzpkjsHv6OlpACF9yY+VyvxG0IZ6Hm4DNcxnANjX9Jc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxOTPEblgzW5VmxQY6uaKp+wj35dfji//lJk9qLVHq8n1V8zxY
 Fk6wMqh4YWcA//q70HMkQHvjggHxNYSR3rO8uxJ+wY9WR7oo02uvwnFhM7O9FtAay7g=
X-Gm-Gg: ASbGncvvjByalWwxYToLp6SAOeqe++BGopR2vkQG5uJWvAc5KwyjdaLDVp4t/DVdmf4
 bVaTxmf0A6hQMUxedG+9Su2QXwwUNMJ74FFnMtyUhAv5pNKwha7Fbe4ZkxRMk06gi+0a6FcpP56
 b42D2xofDJdJKxhmuEkT+omtCwZkQtQBuT46j+cg6zG8wFe4rQScnXGOtFMFpv7qvn1GT8vX056
 jREM8ofVoemz0AqnCGhRCNS6BqK4HlIJXqoUuuk4F9s+D+phGcpuktdsTPNRRI9JZ91tIZTn6Wq
 blpb7ptF/+Ww87U6Y7GsVkzybnp3AYN9+ZixIhj5pKRPCUqFNVgdk3Aq7OBIwTvpuI8szmFF/VU
 ZnI3ECcfOSMz5eIOTzAZXvL9fBSBit4yR+TSGGdpT5UC+qA==
X-Google-Smtp-Source: AGHT+IHpvGiImQFwMteDMnsQ9boqP2YBE1lyMVqRTtWnZvCXRZeXk5yWOTPnDuzCAJ9Cj66gJ+B0Qw==
X-Received: by 2002:a17:90b:1dc8:b0:32e:7270:94aa with SMTP id
 98e67ed59e1d1-32ee3f757dbmr8938250a91.19.1758202159252; 
 Thu, 18 Sep 2025 06:29:19 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 06:29:18 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Sep 2025 21:28:53 +0800
Subject: [PATCH v16 01/10] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-1-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=El5ho2A1Ag5BjirXgdffSiX1h8pTj0dCcNchyg38ZuJA1UFEylEq7nQEPDG8YtcX2VYdfhjGg
 cg/nvcBSPMKCNxgMJeVm2co5QzxxSEYGb1vhmg2WPVvoJRnC7LsP9PQ
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

