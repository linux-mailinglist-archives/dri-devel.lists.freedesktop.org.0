Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D66B1847E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629FC10E8AD;
	Fri,  1 Aug 2025 15:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LMOLYIjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D66110E8AD
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 15:08:11 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b4233978326so1004015a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754060891; x=1754665691; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=LMOLYIjDlIH8aT1Lt7v6zn2iqu12bcDUvAj4l/RAbCD+Z4zb7SQhkM5/hhd+355FQn
 WVOntnjS8kA0ctjaiAeVM5AItH7k0MTSKu8ikBBLRa17bJP7CWO7Nr1fYzE2rvgOqyfQ
 jYOm3ZXdM5axGUzeN5N9RjvfG17lnN5OA4ryv80ApKds2s09fam+6sbehSvT8pAQSvHW
 7Z7zAg9KALpId4rcBcNpz1MUR1uIYlMwdE45jWc4iy4Aopw7x5jk0I6a0sUZos8BRcbI
 cTc4070i3pucZ/mpegpjOibvcfHrCB23CDjfj/D6Uux/zodxBWLhLWaBbyyUuM/53/d1
 CZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060891; x=1754665691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=CTt6stCdds3nKOE+jQ4qANys/ujn3Z95BbT94NXo95VkU+eDaaCU7BoQHWDrKHy8xO
 EPwswj3bYZNZV/S3lagp7dU0lIcnTKhdrX09C6b4F6l3x+wXaqZY0tz6lriYNTKjxZFh
 Ss0dW7PZzkK2rW4LHbiDvBqkM/Ooext8f5aw4W3cH8db+X1RPUMwEk/tvo4dwDGJ+hxJ
 SmxaHPE35bAEE+qNj6Bn5fnBWsVNBNEJtYwuLE28KEfuUekx1hg1QCtdPMbbWIkCxnwM
 qUjCeEUkm9J12mt6cIkoh7oSm3WfHO3E/yGsEOTRMKR8cFFCOcNXQjZGGdB5xeZdXHM/
 oZiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMnURVo+dnbV/uL4gOJJi7bQJ33odJ/jahfyNCM54oEmK8xLpz2sPk7hvMhy3iMYgiVGlhy1/YIfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxc5fhMZvGY41JeiDGFltrF0WiPNN+COu+IZvZWPl0wKcNuj9ym
 n4JlxDIow7BuZVdNGAR0U7wSFz/X25F3+Xe8kHeACdxByfPPuHomwXvrM1A0h1P3IpU=
X-Gm-Gg: ASbGncuOagM39mR+UHjKUoh3a+lwKM8WNRPUoVOqGH55WY1QJRN9YvnVgOHibxf9Aod
 MLuW5t2PRJNjXjVeGoDZzx55QSSinodXoKr1BnFRZhoFoQ3qqLlSAI7ab+NNlWn8xKtFdCODlwz
 WYj/Dal0S/gYV7GwIq+vwl2zczq/2z8M8t7srbGcr9u+1aJpKIlgvpH5Vgxkl3lbyOddjga4yYd
 2G3fAvPVY6tDlZp2cbiYBS9sVKp4qmZic3HG7BfVSzzRgI0qQ6mhZzTC+jiSypyx7DIyWG5QLCS
 PSIhU9IrCEHMqlL6iQR+U7NuHnJs8T0OLgBZHg0RhGgd7zcr/wj4bXHj9wEOdmWvyKCvmWV4sWz
 sYwSkhKuDYlb6s8Ph8A==
X-Google-Smtp-Source: AGHT+IFayGqBx8hW294QxMt2k98HLw7+m+LZMmht2Y8J5kauLQORFEs1yvXOy9+cvVSKakLHEQx1Ag==
X-Received: by 2002:a17:902:db11:b0:23d:dd04:28e2 with SMTP id
 d9443c01a7336-2422a6b1521mr43892835ad.35.1754060890630; 
 Fri, 01 Aug 2025 08:08:10 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:08:10 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:28 +0800
Subject: [PATCH v14 04/13] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-4-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=DETqfYzbBAU3+ZrJj8OiSBo60uswBpiJ+Fiol09/aeqJuM42nOixyKlbhgbx+R/Qv/ErHOuBJ
 OZ4elEmcauaA0/mjq4r+cq1buvaWss0mroaRogcSvaeaex/i2K5+B0T
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

