Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E8F3F7E86
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 00:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8736E43A;
	Wed, 25 Aug 2021 22:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFA76E432
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 22:24:50 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id y128so1552215oie.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHbqQ8fRCnVK3Idr6RNjSXsfz0ngq03w7usVXN+ejos=;
 b=y461vBwFD8A1katLlj19BbJOG+zm5UUGx6Kv7yQ8JQH7MR93Lly/X/EiiBNPnjUmp/
 ni4CuiYEZeMcJ0TdiNITkeSYdkhodx9vwZSHs49IBEQr9m2+xQE22Js2kJ65Nt2YUd46
 jwY0GOyJ7Dim2KqwA6VBq0rdhS3LgazL9QiZrOMd3lkLKZI4INefz5UYCrq5ymi0z21E
 3J3iYreIG7aNnv1fPvAsUaDWtyNwaMeyKsF3wmm51CXzv72FOoVIZrMdzRda4HEtS/i9
 kgHJ/UZ9GYdx9gCFMfQxpMQNu8dsXo3JddGkMobI0J8xS19YTGWvPghZ3G/YloC0+M2Y
 pVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHbqQ8fRCnVK3Idr6RNjSXsfz0ngq03w7usVXN+ejos=;
 b=rlyLudCWiQWKUxc9vd9NRJ01p0mYj9Ig5pDBpMyk64QuZttPDxil3M8MfXik/PDR76
 SX3PS79JAZruCFtIK5WSzBHpiB7TZz4C8KVTV/QvILynAkOaRIIxEQPy2nYcaqAWhJ1S
 yYNwZTmURCovB8FPq3KdgTIU+5JHWdVO++TgynJGBNA6a3z9EtEJJLF0Vj4mBnwtVJ7b
 bptrdR2UnadI/EyH2F47HarDem5jMlZd2zQNENjbP15D2DeyxSdWnM61c+6QFLZIgNmC
 AkK2C45o+TZ/Kw8ZnXfqwkXyVPgGejlyqRpF2RPlhT7cf1SiyZCZ7qEgDg6g34zWb7W2
 SdIA==
X-Gm-Message-State: AOAM533X09L93QiT/2mx9eojk+SltTDJihRQOHowW0kf2+JCSuLAiQ/B
 5A+wktYRSlRDXf7sYrhSdVSVRg==
X-Google-Smtp-Source: ABdhPJxcDn3dYTNjUYYiv97lr2KPu3aGjOEXExc9zRZ5IXoHWFlf4F40fIRQNIhuK7UuTXuPK9wN8g==
X-Received: by 2002:aca:e0d7:: with SMTP id x206mr8616473oig.64.1629930289816; 
 Wed, 25 Aug 2021 15:24:49 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u19sm263721oiv.28.2021.08.25.15.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 15:24:49 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] drm/msm/dp: Allow sub-regions to be specified in DT
Date: Wed, 25 Aug 2021 15:25:57 -0700
Message-Id: <20210825222557.1499104-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
References: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not all platforms has P0 at an offset of 0x1000 from the base address,
so add support for specifying each sub-region in DT. The code falls back
to the predefined offsets in the case that only a single reg is
specified, in order to support existing DT.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Reworked on top of changes in 4/5

 drivers/gpu/drm/msm/dp/dp_parser.c | 49 +++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 4a7dad86159f..a5412ddade53 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -53,18 +53,45 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	if (IS_ERR(dss->ahb.base))
 		return PTR_ERR(dss->ahb.base);
 
-	if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
-		DRM_ERROR("legacy memory region not large enough\n");
-		return -EINVAL;
-	}
+	dss->aux.base = dp_ioremap(pdev, 1, &dss->aux.len);
+	if (IS_ERR(dss->aux.base)) {
+		/*
+		 * The initial binding had a single reg, but in order to
+		 * support variation in the sub-region sizes this was split.
+		 * dp_ioremap() will fail with -ENODEV here if only a single
+		 * reg is specified, so fill in the sub-region offsets and
+		 * lengths based on this single region.
+		 */
+		if (PTR_ERR(dss->aux.base) == -ENODEV) {
+			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+				DRM_ERROR("legacy memory region not large enough\n");
+				return -EINVAL;
+			}
+
+			dss->ahb.len = DP_DEFAULT_AHB_SIZE;
+			dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
+			dss->aux.len = DP_DEFAULT_AUX_SIZE;
+			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
+			dss->link.len = DP_DEFAULT_LINK_SIZE;
+			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
+			dss->p0.len = DP_DEFAULT_P0_SIZE;
+		} else {
+			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
+			return PTR_ERR(dss->aux.base);
+		}
+	} else {
+		dss->link.base = dp_ioremap(pdev, 2, &dss->link.len);
+		if (IS_ERR(dss->link.base)) {
+			DRM_ERROR("unable to remap link region: %pe\n", dss->link.base);
+			return PTR_ERR(dss->link.base);
+		}
 
-	dss->ahb.len = DP_DEFAULT_AHB_SIZE;
-	dss->aux.base = dss->ahb.base + DP_DEFAULT_AUX_OFFSET;
-	dss->aux.len = DP_DEFAULT_AUX_SIZE;
-	dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
-	dss->link.len = DP_DEFAULT_LINK_SIZE;
-	dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
-	dss->p0.len = DP_DEFAULT_P0_SIZE;
+		dss->p0.base = dp_ioremap(pdev, 3, &dss->p0.len);
+		if (IS_ERR(dss->p0.base)) {
+			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
+			return PTR_ERR(dss->p0.base);
+		}
+	}
 
 	io->phy = devm_phy_get(&pdev->dev, "dp");
 	if (IS_ERR(io->phy))
-- 
2.29.2

