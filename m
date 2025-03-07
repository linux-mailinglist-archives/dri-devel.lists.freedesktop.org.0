Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3388FA560C1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 07:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C9310EAEE;
	Fri,  7 Mar 2025 06:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ma2vRfTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAAF10E0A8;
 Fri,  7 Mar 2025 06:25:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1D857A4551B;
 Fri,  7 Mar 2025 06:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12850C4AF09;
 Fri,  7 Mar 2025 06:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741328707;
 bh=ToJ3cdSShRxTh5D7YbbrmuSVXEQc4dk2gJEoA36jpSA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ma2vRfTpZETfjiq8xEkioqtoRP+fxwZVqSSNO3eulV4HVGVoFJ/WcNdMbiZOW1aNW
 dptmcjtQaZIHxJMYcy0V3WMP08W0WRcKQf29a9bHKHjbLWq3onp1OhYb1LsHFWDOII
 RRTWHl4FOlZkv4+oDoWeL8uivIfOSenASwdqAm50o/hCy6Tq0d7NJOYnt/REv8Aae+
 rjMww6SwGq67heVvB150q7wVbUsJiOrgzxDq2nMrskQwnjgOARiEnh+dbLKdlQEmKs
 goOJ3vNLEjMzFfZnlZlJ7sOCxBBz1+5fZoJRVaGIYfsMbePWurqegSkrzrSCMRRNi7
 by1rDHPXFEvxg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:52 +0200
Subject: [PATCH v3 4/8] drm/msm/dpu: use single CTL if it is the only CTL
 returned by RM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-4-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XtKtQEs7QltCe35WP411DsS3zIkURK+Ca3d0ucslYjU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE0Josiif5SEScDkGJhl2eT7X6NXJy3N12wn
 hzi2f+Qa+KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNAAKCRCLPIo+Aiko
 1f0bB/91WlJXYDXmggaf0hbEqIgDXXViJDXPQ0YJV5zRc0a23Z4tsW/gZY5TMYw5RPhD6z18Wzl
 n8x1txku97hlQaZbnNeFyJuRi0WHD7rk6jAwoK6Q2kgWdUoO45SOSowyn8pvVfLvCtGevpICddk
 UJuWHx2re90hZf2h0t0nohYwotgBxBLqhXxkVt3Wd1Zn2nStypELAJiGkjoFTaf4phSrjFh6WHV
 5Tw7wnWA1QqRtYPLzg6GeExRX+7YxdTGbN03rDQ682Ryo3FzOdF9x0nHOANuiafoZ/oUI1fK8Fb
 nqhnlG+FXmBBU/GNy5smz92rYIawQ4PxVBc0ZHYdEfdrz2ou
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On DPU >= 5.0 CTL blocks were reworked in order to support using a
single CTL for all outputs. In preparation of reworking the RM code to
return single CTL make sure that dpu_encoder can cope with that.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0eed93a4d056beda6b54c0d20f027a53c84f67db..b5e8ba592d8af298a52924d34a573d4f9e05c476 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1247,7 +1247,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
+		/* Use first (and only) CTL if active CTLs are supported */
+		if (num_ctl == 1)
+			phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[0]);
+		else
+			phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
 		if (!phys->hw_ctl) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);

-- 
2.39.5

