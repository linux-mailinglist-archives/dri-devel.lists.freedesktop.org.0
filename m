Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0388AFAB94
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 08:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0626410E411;
	Mon,  7 Jul 2025 06:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wUZOj7c+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCDB10E410
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 06:18:20 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-235e1d710d8so35613905ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 23:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869100; x=1752473900; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=wUZOj7c+9vZDYYwva52HHj5g+CSBQ/Vjxjo/YUYzpuilGI3U4KqW1NSnoNqi0JBM7B
 jQQOfY4/3W0mlLJOeb9Hn0EJTNzT4Q4KXa0+OYwXq8mMxil0r6FtppKRZlh0LDfs4yFL
 dYDF2XQn54c6oL9SfcpsWLWYF6nRb6byfF4N7kneasFeiLdN4n5wrVuF+SdpoIaF/sVM
 essw2AOwUA2rGyGT2iaVH8Y9rujWio0QcQJ48dW2DpHlKSa5oBgEuTyE5h8RqFRPcS6R
 +enRF2gdVoaPWYfTO3rhnEkTCvEZ9dqEAO3TE0/YyFiRRQNysOK7VhJLeV/apAete+aL
 4lgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869100; x=1752473900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=aq9HcYIGm+jhVopirnOjzCJY+ergHPBbQao2JRLAfQH6oysOKIaHUaTkmqfmdSGBsm
 7d+Ata9Ip6LdKwobPJWI9jiIDTsw+uluYxpUjRUi7rc6PMR5DhoxXuuqlbqvQ91gBDgJ
 lc2ttkYaZ+y0mxPo+ksBIjGK9lb2hmC/0Q/ZpJ8ayDAHEyAGsaYYLwhWAxSlATDTuyEW
 lQrp1QQzc37s9KaFQFmsTk23qfx41PLhT8eRDXJfXjaCb1yAEAB0GmHMAOkwznyqCnYA
 4LeSHw7Ugr6zXWhvKgQPN1kRbDlTjCtF3+n/d25Y/wC5gbTaLMPpgvj8ZNgxXJCrU1vL
 cMkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcWv6LXr06w0zY3QLklv6tvJMmC+A1o4CNnK/xZbLiCJngm9fstGqYgGfW/xMyXEqdWEAZopLq60s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYjJJSd4aoWcXsWANHQIBBmgVKCFNGaudkG+Ss9N0qZAgmN0Ri
 UVxwSOaeTGd8CGNacm6m/4R4QJMg6OibwPlpi4Xv4JPy1jNSFiEAQFcYbPbyzPczaNA=
X-Gm-Gg: ASbGncuKhl4/PnGkoBO/UKlLYW6GD2F+ImksNYCAVLp56y0zZA8C1c+QNxihFf+gIcC
 L+G/Rkt+bc79dy6yZpkgbaKoIdbF3XSkskuuHrmo8qfxJ9U3qk6gCZM2rrlIvO1Q9ZXPsRBme68
 JT/rmHE91DELhosA5BJhdFyv8X4TFxDnZvxoJnftjwv0QSy2wXNFbigoCTXQiQLMpW6ZM3UC7ni
 IgohhNVngQUBUkTMcpO9RzGGCRm7lE2gF1zgzsX1Mw7a7NVl5vVgrv3CgzcTGuEJN5d7fHl6nQI
 EJVGxEK+XUyH0+GCLs3NXX2CyrDmSgdAOBh7D0/JC4u/W9Vkpg8cQXsdegg=
X-Google-Smtp-Source: AGHT+IHRRa1nd8EABRQU5wK9XzCGFikI9OJL8kdQbUK0WUMo87bOtO4uywAsrOfWnCd+HRjG6iJPtg==
X-Received: by 2002:a17:903:2304:b0:220:c164:6ee1 with SMTP id
 d9443c01a7336-23c90fc7b7bmr105932755ad.32.1751869100387; 
 Sun, 06 Jul 2025 23:18:20 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:18:20 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:57 +0800
Subject: [PATCH v12 02/12] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-2-67e3721e7d83@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KP97mkf4mFx6Hynpv+UvTtqAjJLhCHcsa39rmhW+j40=;
 b=eVMLeIUgZqZLeZ6Ci2g5Ka64hLAyQjdFTZDLaC2dgeCYsGmozTC1kJqA/rBQTjoMdzD4RZrJq
 kdEp3oVl/uwAcz9bq09dQ8GU8HHKb8bWx8e6T5k+KSEV+cn4RO3kXWT
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

Currently, only one pair of mixers is supported, so a non-zero counter
value is sufficient to identify the correct mixer within that pair.
However, future implementations may involve multiple mixer pairs. With
the current implementation, all mixers within the second pair would be
incorrectly selected as right mixer. To correctly select the mixer
within a pair, test the least significant bit of the counter. If the
least significant bit is not set, select the mixer as left one;
otherwise, select the mixer as right one for all pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4b545448d74657aafc96e9042c7756654b4f0e7..9a40492e5aa961f7180ba4ac6c86e06fcccef8c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -377,11 +377,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 {
 	struct dpu_crtc_state *crtc_state;
-	int lm_idx, lm_horiz_position;
+	int lm_idx;
 
 	crtc_state = to_dpu_crtc_state(crtc->state);
 
-	lm_horiz_position = 0;
 	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
 		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
 		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
@@ -392,7 +391,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 
 		cfg.out_width = drm_rect_width(lm_roi);
 		cfg.out_height = drm_rect_height(lm_roi);
-		cfg.right_mixer = lm_horiz_position++;
+		cfg.right_mixer = lm_idx & 0x1;
 		cfg.flags = 0;
 		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
 	}

-- 
2.34.1

