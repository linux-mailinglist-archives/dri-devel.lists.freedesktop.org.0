Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC26D1174
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188AC10F071;
	Thu, 30 Mar 2023 21:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684B210F078
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:16 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c29so26407701lfv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ypvks8Nd4YCSiniAO1T/BNftQnJ4Oqy5AhQ1SVvGOLw=;
 b=PibJy4N3FtioWzHiCyjezAzgljLOv5t4TFWDA0/LgVT0d0yzX+XWdGJwybKig2BmzD
 Uq/W5edzqUIYH/nGMn+0Iv3lO4IRpT5aBAcZER21cTtBpkgcUcToLx8X1Q+v6+0kRka5
 qUcBduCpDFaRB1vsP8/BB36K7Wddyk8L4SFWSuISMifs1IZRpPuFaPGTfSMvG7UpWoxp
 BYgWeDEra3xi9PbiOE5Hv4rLkz9gB4FEXlP0L2ij0RIHrZ+61gO95ZykFuA096pxzu5I
 OmmjF2ZFXLOIPIPc81RU9OSRM4RaiK719PtgBCqOP7IJML5r/QJUa9CnSZp9ij17LIgc
 +qCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ypvks8Nd4YCSiniAO1T/BNftQnJ4Oqy5AhQ1SVvGOLw=;
 b=yv6F9R/uY8tEZ0SAISC+7gjEl39Fz0jNVrex5x7KoI0mWj9MbwKCOAUzR6/LTMdT5I
 AbucVSAU6bVLQFyHeAHKraeLNAgs9LjgU7CORDq7teXZqfa1ZOidcNruvpXiPkNypIBk
 9W6jNfKmiKnjgvqEpJ+pwc3LCQHCziLcMPZUc7IdboF+aKbxZ3WgDiv/q8ppTbN1a+KQ
 btAvlqLcHNXocmgPo53TJNT6LQtsstHTBKnY3++HdxX6RLh0haMW15X2+x5TdQ1VzxcN
 D+IE1ER1cfOulxpOYKrcPbbbE2VjfnOGJZYyLxIuwasCUfVTiRhzHNMZ+n8QKZ+/172c
 IRZA==
X-Gm-Message-State: AAQBX9cKVOO2PQa2mygpMZFPI5HOmZrrvbk7IS3VfYxSSwH0aKC3SzJ5
 feMT1i0LOckaLDQ6F29jLm5/QA==
X-Google-Smtp-Source: AKy350Yq32N51YLheHbnkMme9F4sPIgraKrGm4BzCMNAwnMn4l+qor7FwY1Jz3UVYuIz6Op4kwQQ6Q==
X-Received: by 2002:ac2:4287:0:b0:4ea:c730:aabe with SMTP id
 m7-20020ac24287000000b004eac730aabemr6359527lfh.20.1680213255994; 
 Thu, 30 Mar 2023 14:54:15 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 28/38] drm/msm/dpu: enable DSPP on sc8180x
Date: Fri, 31 Mar 2023 00:53:14 +0300
Message-Id: <20230330215324.1853304-29-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 92a8e474e380..bbdfec415185 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -90,6 +90,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.sspp = sm8150_sspp,
 	.mixer_count = ARRAY_SIZE(sm8150_lm),
 	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8150_pp),
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-- 
2.39.2

