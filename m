Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A39158A4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15EA10E589;
	Mon, 24 Jun 2024 21:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kMb/Asw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F04110E266
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:55 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52cdebf9f53so2189117e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263633; x=1719868433; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SPozXOfnQpkwCjUxXDexUWZWPSk8EJlZgnDGsjKSuG0=;
 b=kMb/Asw+cbXWq9pq4PMr4X2QQl9G5nONkhmALujdA/FGL9SwwpBFN6o2yoX/cCNEQN
 46i208owcphh+pPPGXJ250xl/4hEC6F8CmVu6mL4e6DDmFFQt1DfBJIQTWbJW4FvRCgK
 4vGCxAIPmBA1fxrneBBCYnCSj8rRRHxWKzlUxOuP+db4UraVT/wVtJ7CYFoIOv4FYmSS
 eV6YdsKKox3Jy3BgJeVpOwhr7Ekn9bLmOZzKSWaZHQh0p4kr0hODswQFKdCrPl2H+i7r
 KZQoBz9hOhFSZ5BfFXLbP1mw9szqxsa+Bt2RemRtRN+e9SuTgm5Oy0jBT04O14m+Fkwo
 Ll3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263633; x=1719868433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPozXOfnQpkwCjUxXDexUWZWPSk8EJlZgnDGsjKSuG0=;
 b=lMV59z8drZYSA94Dmw/LXfGQQpBdqEajap5wVIkeryWGuP1gGYqJUZsPdqo9IN9CHz
 Sn28QAu9wy0X+MrQqPU967SJwE8I9gHMWy56o6+RIgNQpQfid8+OnU4odFyG3k8p09l/
 Xd4+5NTgUAYXGc7WOTe+VpUoeogArJFvsUpGbtOA7/FQ0W9++Tx2PPnEREB4pqrK+3OM
 ZnWIOrtpE9Q3LzSEw726rPBlRkcv6bzdG/QwMntVvVp5hJbfUVUOFJCadsnUfBOPxqHc
 HO4EeSyuHjmUGJw4uHkfKENFf019WoyuNSTLX9PixlgfdRbZtDbvvR2b9lYzbrFAeiNF
 unQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR3X6lp1N5xb7DibBJwwc/k49h4Qr+qyYpSzuolMyftcmZ/cDrdiHLNl0rU+PsXRNLqdPoYNgaELMTBldPpEHSRqe5swEIMaHFYBJBApzT
X-Gm-Message-State: AOJu0YxjykX0sL87ZX+367WkEtxRmpwrQeng6z4j9J8xMWI0iDr665t/
 G7skB0GFSHydf7rirllS/0JQ16cP0SPPZWWzL0f0FhnEdFCLsazv9thZxRDwXM8=
X-Google-Smtp-Source: AGHT+IFRmNxqzJxnwWq1WdrSGLnwmetEW2V9V3wvpKQg+TAZ5eDZB0QAdA4CARbVGYJU8bJ+TolinA==
X-Received: by 2002:ac2:5617:0:b0:52c:b606:2b2 with SMTP id
 2adb3069b0e04-52ce0673b84mr3559689e87.46.1719263633701; 
 Mon, 24 Jun 2024 14:13:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:50 +0300
Subject: [PATCH v5 10/16] drm/msm/dpu: move pitch check to
 _dpu_format_get_plane_sizes_linear()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-10-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PvarS7GjKhySpbWrpwCTIA/zEFMlNGs5eUuK3EGV4IQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGIedeaS+Ov6hN6YtNe5NW489hPRC+aWEHSO
 C+oUPjo/jKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiAAKCRCLPIo+Aiko
 1dSmCACS6PKtzUdgdFph3etGxKofF/FuEt7sz5GRaCXlw8vUtsJUZZDZDS+Z3jpkSyyoSbborrf
 8RH15mOuVFfJtI19Bmf0Nj5BqZrtG3TBZu1Bovmj3b8XCOHpZq5MYPiZ+6Z9gEOhEgKzHpbYiRp
 OR3Yqf/ugbnrIKYL19DGUdlE5jteCE/UCjMIxcrFTn+VfszmM/p4gJcQdFUyCMKv09n8ypvVpl4
 12UfiFu7K5PROiPHcW7GpxNK7pe9WTJK9RMVWjTQDfmG/ER5NVav8wg2lCt8yC370Lbt9bPAEtl
 wBE0Kg7n1hwP+5r8QIOTCsGoVhhHNj1oNisjsBu+AONxFGw1
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

The _dpu_format_get_plane_sizes_linear() already compares pitches of
the framebuffer with the calculated pitches. Move the check to the same
place, demoting DPU_ERROR to DPU_DEBUG to prevent user from spamming the
kernel log.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index df046bc88715..4d17eb88af40 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -229,8 +229,13 @@ static int _dpu_format_get_plane_sizes_linear(
 	 * all the components based on ubwc specifications.
 	 */
 	for (i = 0; i < layout->num_planes && i < DPU_MAX_PLANES; ++i) {
-		if (layout->plane_pitch[i] < fb->pitches[i])
+		if (layout->plane_pitch[i] <= fb->pitches[i]) {
 			layout->plane_pitch[i] = fb->pitches[i];
+		} else {
+			DRM_DEBUG("plane %u expected pitch %u, fb %u\n",
+				  i, layout->plane_pitch[i], fb->pitches[i]);
+			return -EINVAL;
+		}
 	}
 
 	for (i = 0; i < DPU_MAX_PLANES; i++)
@@ -360,15 +365,6 @@ static int _dpu_format_populate_addrs_linear(
 {
 	unsigned int i;
 
-	/* Can now check the pitches given vs pitches expected */
-	for (i = 0; i < layout->num_planes; ++i) {
-		if (layout->plane_pitch[i] > fb->pitches[i]) {
-			DRM_ERROR("plane %u expected pitch %u, fb %u\n",
-				i, layout->plane_pitch[i], fb->pitches[i]);
-			return -EINVAL;
-		}
-	}
-
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i) {
 		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);

-- 
2.39.2

