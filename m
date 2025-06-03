Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604F4ACC0D7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C101410E686;
	Tue,  3 Jun 2025 07:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iBVwlfIg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4510310E6AB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:10:47 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-739b3fe7ce8so3925013b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 00:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748934647; x=1749539447; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
 b=iBVwlfIgUVeOHIhe2iVfHL4055KGuaIfFCkuLw2Fe9yWFzlG7GQdG1geJiwtj/2mj3
 aFH9/WEucXcWPifhCXWduHP2DHTo9tSJQfu0MMSVH3pwk+4vCNAs/zl2yXIqbmOCGUC9
 5Bw8yfMRlyy3lLFNKtfTxmQpb2fGLhUDvKzI5JL1drbrI18WcfswLkQlmY+89uPTIA2O
 U/g0+vQQK+6UrBmg8f+n6rJm6BzJp/OXUhcwSNmvyqe3FVK7jcvTfNcSEiQc7VcwS58E
 AdE/WGaI4RmxD1YLeGAwfZ9OY8EYcGZZP9HJORpUKJUIoAPgt1deITyYRmD6TZRqFEgO
 LrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748934647; x=1749539447;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
 b=cSQw/qP5ZoygBL1fxAZa2wI1HsGdy+ifmdAi9lS8oO7GKm4ynsN5S+dT5os41VkHLG
 lwSQUWCoX+oLAwU1TkBS8OiQh0vgLHLsCpD58DfHuoNhy0WnBY/uvW67GP+GzfqUq0yx
 1eV8hwAheWmLmIGDdPOncAtz3bnAIZIlcub+gT4k9FXaJxrHNs7w0E8LaDeVxVeqZ9vt
 O4Xe6BSOJGTVKB93XF67N4pN1iHKSQdlBSe+5siF4AvDQsRw/JnZXt6vDUDFiv9kV6T8
 7Gru6ThvjBojK7Slx8Dbcta645Pm6oAKDtwMWnBVVHhfSBUyAAh3gR0WY+7GnhS/ANvK
 V62w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmvL8FrAZynsyxQbuhp6RX2lgyUDo5OzJ4Pg7uQNBmVCJ239F7Loz2OZXOlDYkVMgj7zARX+zrg8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0/9vPF33u4L2OdWKVVB+LufwyWdHqe+4BjuaEXVi/6uq3aQpM
 bXiCwvUTDKPuWE22stfSixnRcHxg4FuUUDzEG+1n85RvOBvkCEh/2RIRoXz7OUasBJk=
X-Gm-Gg: ASbGncue0gZcy1eNlZj2g4d8cK1Y0KmJj0/wf/zJj6CuRIqcqouzNzFriwK7UdtOfYU
 G5FVdIvf8oVNLuJsCK3zbyO5JF4BIOtnfiBZthVJfw7aEDSPoODdzqpqlOEY4x8nomHKP5VT2TG
 b0FpBBiYxKfsCOQpTQc1F8GiuNwGehzo+GWMNosHKFK6N1OTaOx6GC2BZsydlC6bHujmEdnF7eR
 CgErUOhLFetu9ErSXJqeN2PoNCvP7lSAPXHeLjo4FVK50kHXNJZzwLxgpCY9mKKyIOU+iNlV/+e
 pJ9wgGPqMNpdu+hpgNkG2lBC+J1+YxhsQ2SRAHLD8Nnyuran9EcEs/J5+/hO
X-Google-Smtp-Source: AGHT+IECU07ZJTnHbY+6PX1HVqrdVBJvjDjVo6qU85+DIIL39w20q2KY+lm0QftMCabBa3zRnow5tg==
X-Received: by 2002:a05:6a00:4b04:b0:746:cc71:cc0d with SMTP id
 d2e1a72fcca58-747bd9873e8mr22641065b3a.12.1748934646820; 
 Tue, 03 Jun 2025 00:10:46 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 00:10:46 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:02 +0800
Subject: [PATCH v11 03/12] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-3-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2zVon4JQp3GbP7LIHy+YThFAabtOIovGb5UEovt+mkU=;
 b=M6kGX+zoyyifKCoa3Ihq4iUR6UyyVoU6M2k4GhholpJmyeFukaEvdo5CO2SVv0U+uk2QpqrGK
 /5yKxv751IWBn5orwmm1L8XYtOVu7zCAqFdb9V8AdseZitDIGHNmAYw
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

