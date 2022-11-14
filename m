Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F35662898C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 20:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA5E10E314;
	Mon, 14 Nov 2022 19:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAC210E314;
 Mon, 14 Nov 2022 19:41:10 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id v3so11134860pgh.4;
 Mon, 14 Nov 2022 11:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3XrI4nxvGHUCxoc8HuMbGJ+vNpFCW7F3PwRmwEeEnBE=;
 b=gppJTB4ThxkXJZLbWfSW4pZ121wwq072YhQUh+SzfkcvR94GOYRlkaQZg7dO7+yQNN
 5k3gNK8L1xS3vged5EKsB/9a71x2UreuBfs7GFBWV2mE+xY9TTS16jvL7ki0RpsXfaJV
 Fn3lgL3+mHi9IE5wNArMI0w7WgUEH2JE4OjytDywiWxE+1stkdv2Cul5CrgXn6Szpt6z
 7jarednJ9M0GUC0dprQE4/2rcI04RCTEcgUkUfki2i9QZPbhAxvP1RrdSiIWznaI7VRa
 0N4RaT5hz1BpQw8R4j91f9AxlSovfy1IUhd/99Xnb4TxVGlPSo9zlNgObRNYNcjTmOyA
 pDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3XrI4nxvGHUCxoc8HuMbGJ+vNpFCW7F3PwRmwEeEnBE=;
 b=mTyFMayI3/aNJL8lbWss1ddaggfDgNbSGLxRfOJtyoCCmrsmS0lYgXPMbVKwWVzJxd
 jgoAMnBItGLgFcp9WXCoWi38JghKqW/RF8qBzsrcV8FETHhC9xNFpYiJX/6D/hY+TxJK
 KFJMgFYfTM2WTmXY5vqC+h9K/KTah/xhD+cPJ5QiZ12ll63LFJH/08q6IgcgnC69nQ8m
 BdXYqexplradWHFg+av7VtF5EZ8KbJFN9XoiIIAJQaQmLt2WVyzljkW2xDwayjyILyMJ
 1VxeRJF6UdEq8X2f1cCTNsFqbI8LBkoDirOg9HBH6Pg8ZJGd5ysfREaNZ+P83FY+fwNg
 h9mg==
X-Gm-Message-State: ANoB5pk8rlXI446FnArIowlgOvxgBsF+093OsbEOQwiVHHt893zkLt/B
 5StUnonPZIRjv9y70evSLFS+P9W+Gf0=
X-Google-Smtp-Source: AA0mqf7ozzAVNmQ0762Wdq2RaoUHGyy3f7FD4K4fw0PZKL9JZzpVniJ6TDAEWGe0OS68Bc54J/2JBw==
X-Received: by 2002:a63:5206:0:b0:41a:5a80:5f20 with SMTP id
 g6-20020a635206000000b0041a5a805f20mr12701044pgb.442.1668454870081; 
 Mon, 14 Nov 2022 11:41:10 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 gk9-20020a17090b118900b00205db4ff6dfsm6841481pjb.46.2022.11.14.11.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 11:41:09 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: Fix speed-bin detection vs probe-defer
Date: Mon, 14 Nov 2022 11:41:31 -0800
Message-Id: <20221114194133.1535178-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If we get an error (other than -ENOENT) we need to propagate that up the
stack.  Otherwise if the nvmem driver hasn't probed yet, we'll end up with
whatever OPP(s) are represented by bit zero.

Fixed: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7fe60c65a1eb..96de2202c86c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1956,7 +1956,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 		DRM_DEV_ERROR(dev,
 			      "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
 			      ret);
-		goto done;
+		return ret;
 	}
 
 	supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
-- 
2.38.1

