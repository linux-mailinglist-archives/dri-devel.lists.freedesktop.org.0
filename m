Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C38379E4C
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 06:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CCE6E9B9;
	Tue, 11 May 2021 04:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547F36E9B5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 04:20:59 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 v14-20020a4ae6ce0000b02901fe68cd377fso3939605oot.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 21:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fq9YiG4i+9Hg/626b2mYGf1Zeeqbbz7nhqruiypzKLM=;
 b=r/vp57WL04V0/z3ZbLOXmSODOaboMQD6mvsfrkIp8O5AOIFj+JAAAxETVVbPZRMoZD
 1BK8aLg1OtWzGA/TowHkOLnq/6mOR01C5u5fB5TYjNAdZY9ODcbQZC5ze3/zFrTRvoRd
 PD5Cf9sL1RwI/sSjlIQa6rRgsJPzoGNwXaXovRhNIn2sq1w1ZlD9WLKdqykwyr1oFs8U
 qbuNw5L6oRRlctHDuAvzHjGB3/uxMIZFXhxU3QuKcCBwsQmhMGdnrGzUjQbGW9h8tlmZ
 4oujK0m6oFrRrWtAzjq6oCrMaTLL0bclq2NGugNLVSiFUO0IX5EyYORyBf8212yHg+oB
 VW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fq9YiG4i+9Hg/626b2mYGf1Zeeqbbz7nhqruiypzKLM=;
 b=gzdIxKenUUE+tZ4zwsD/+YP1maghO/QVZHggj0KsdeLFCtNcOY6SrNGFjjVUUto/o+
 2lwR4MIQVMc0+sXXVC5NFQCvDN4Kay7Glk18dAuyVKZ4Ks18hcf4r4cH7hSR0zRWP12j
 J/gfLfjVucrFQHyr9ZsihtHu8grpxwle4LFqsa+z4BBKFA0khwQyH1IQSXgN6YBZBTAp
 xRUNFCVHju2+CKzo891Sy4uOywnoT8GhnfGImttEDu5KhQg3kfJWVOMDpJ9jGnCrggLR
 +e0Ed+ClkxrRvZ223VjSUnpGWnuVg1wVGdlLqGKVbff6QCcBGv3FbD49ZNjCPlMhMuaP
 A9WA==
X-Gm-Message-State: AOAM5318cSElCFAtFZ0+5ZXKacCJaRkacdJ+sMxaBpv6i68imvvgxvT4
 bl/NQ9SpgcnH+pegviPWzhmV5A==
X-Google-Smtp-Source: ABdhPJyVF8rLen4EcnoW1kysZcaLvhFVqL45nBVtHdbEibmOqIEkmJKRUCNqaNbO4OoxFZvT0nqedg==
X-Received: by 2002:a4a:e385:: with SMTP id l5mr21768512oov.48.1620706858691; 
 Mon, 10 May 2021 21:20:58 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
 by smtp.gmail.com with ESMTPSA id r124sm3042294oig.38.2021.05.10.21.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:20:58 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org
Subject: [PATCH 3/4] drm/msm/dp: Initialize the INTF_CONFIG register
Date: Mon, 10 May 2021 23:20:42 -0500
Message-Id: <20210511042043.592802-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511042043.592802-1-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some bootloaders set the widebus enable bit in the INTF_CONFIG register,
but configuration of widebus isn't yet supported ensure that the
register has a known value, with widebus disabled.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index a0449a2867e4..e3996eef5518 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -707,6 +707,7 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
 	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
 				dp_catalog->width_blanking);
 	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
+	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0);
 	return 0;
 }
 
-- 
2.29.2

