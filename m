Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B47A643DDB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 08:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CC310E105;
	Tue,  6 Dec 2022 07:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A08410E105;
 Tue,  6 Dec 2022 07:55:25 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id k79so13811761pfd.7;
 Mon, 05 Dec 2022 23:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+m1uoCSNZiNORNnWeYA/gOGOdLV8fKAWwqiFnQ4JGO4=;
 b=FLYjs2BsV+r65aZM3AJb2KO8o01qTTcxiXypSxBwse82Ge2U8dGdI5gwwrNj8KB6zO
 Vg3bwEuvpm2rok9Zr22M5HWzhrr//eVcFAt6p7YGtICttZPnajxCmYf/Ui63XHiiaS75
 vqseQZ/25z4WZlVG4yEYuAgmpOabbz6ZizTTBaA3AByXlp/YxcXF2IRa5pg24/shxCYD
 ZbY5gosvJBuIlzlsU9I0xKFzQfAF9Q0K/l+PdtPFNCHxXmyY4uudoiszGeRfhQsca0tW
 vXHomb3+0Un+BkjnH9GQjqxW9i5Wdcq9bTwyS0QT8EseISs88Dy+273WAs1hePzG72rH
 zjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+m1uoCSNZiNORNnWeYA/gOGOdLV8fKAWwqiFnQ4JGO4=;
 b=RJSikha8WMYOzcpxKY5tdx+VRcMav8E5z+czVItHr8bXog91dxMsW6EU0Yjh4wXG2/
 9JFSwZklSLDy1Zqlgx7GI6HPetSKjfPoHtRfqN5Y3VFNLyWerBNfpGTMxBgw8MIF9Yup
 IIGwmL6hHDpOcfPTTy4x6FjYyrUSiGfIykjhF0MlTrwg70uOK2tQWRbQ+dtqpSjvxU2R
 vBqtW5nss4Fqy2mK0gxjgO5OYEl21JCBGUT4BiMkc1fL6HsFI0DcA9BkJkC4/uheXSYd
 Y+J+YM5hCpCLuUaYuRFRqbxQtptLEZBOYixPnhIxx15A2gXfEYFp9Xeq5Fit+fOnsEV3
 w+sA==
X-Gm-Message-State: ANoB5pn/ON3Lw8wUlZgBLTSM9GlrOFJc7iDQFmRljuazMvD+Wr1SJi9d
 MaVdn48LYSWFMEe4rujrTds=
X-Google-Smtp-Source: AA0mqf5dzvkZeVIdPTS9qvKDt87TQ2d5a756QKQdk8c0187z5gzzHU9yhowfHZF4VanVQG1f9UxM2w==
X-Received: by 2002:a05:6a00:27ab:b0:56c:71a4:efe with SMTP id
 bd43-20020a056a0027ab00b0056c71a40efemr72801167pfb.84.1670313324560; 
 Mon, 05 Dec 2022 23:55:24 -0800 (PST)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 i14-20020a17090332ce00b00189422a6b8bsm11951284plr.91.2022.12.05.23.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 23:55:23 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Fix memory leak in
 msm_mdss_parse_data_bus_icc_path
Date: Tue,  6 Dec 2022 11:55:12 +0400
Message-Id: <20221206075512.812389-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_icc_get() alloc resources for path1, we should release it when not
need anymore. Early return when IS_ERR_OR_NULL(path0) may leak path1.
Add icc_put(path1) in the error path to fix this.

Fixes: b9364eed9232 ("drm/msm/dpu: Move min BW request and full BW disable back to mdss")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e13c5c12b775..a38fa9a9a3d6 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -49,8 +49,10 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	struct icc_path *path0 = of_icc_get(dev, "mdp0-mem");
 	struct icc_path *path1 = of_icc_get(dev, "mdp1-mem");
 
-	if (IS_ERR_OR_NULL(path0))
+	if (IS_ERR_OR_NULL(path0)) {
+		icc_put(path1);
 		return PTR_ERR_OR_ZERO(path0);
+	}
 
 	msm_mdss->path[0] = path0;
 	msm_mdss->num_paths = 1;
-- 
2.25.1

