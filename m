Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE7F3D1C02
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 04:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3226EE96;
	Thu, 22 Jul 2021 02:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED916EE96
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 02:46:18 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 a17-20020a9d3e110000b02904ce97efee36so2037361otd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 19:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PuEoL0cflmj88ic5E/HBFbgKYO0ZjMr2HcVskHGb4+8=;
 b=gTWxU6v2EWpdjHWSdRsk7wGshB7EBoTxmSV8TDRq2yPSI+1sk7E66j1/hwyjO4OvR1
 ERJYkBJc9Dy8API/rXeZ+l4O6oiASLlyq07LRhhazsHoV+RZPzB1EP2osUPlOKuTxtro
 tsFgityqP73QzS4/Hp56+85gZF9n7sb3eGg9VoHjmF616Yi/u2Bg5wkfZ0cVrwkyb+1+
 qRC9l9PhkTMIRd8JVck0BGGsS2UojXzmzZ7pGR8s6EnAUm/4lPqVA69zwov42viY5jbN
 fO4SlDvt8c6ZkomLyW2cf93psDPozgx8QWP5ynKKkoZpwrY9e7uSlpxofWPei1rnnNsJ
 u4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PuEoL0cflmj88ic5E/HBFbgKYO0ZjMr2HcVskHGb4+8=;
 b=Zj+fNFDeF4Q4X4Dukj/kisqIx8D8BhUQ/rSfnmzjrv7nmDGJce2iTgmdfneGip9pw6
 3xBW7ozenIzyL0oTL9s7g1HXIydypTs2Vh6IfUmlQJN4/P+0XzvoQfDlR34hd3Jb+R9F
 9yyRLBcl+hoNNFzw0JMrxUHahQPgmG4lE9E9qofpwF8XczvjbC3mon9dAy2ZaYhH9C3+
 qDkG9oDheQF5OwtaOCiK9q8LKm4srKXP/CFZzNSHC1QiPzagaro7+1SB43seItisg5xQ
 RiBgPtqYl8jPqGxPFDigb0+ed89HvaI0m5+YbC97TLgnWSmy3kGYCf7AL8qCjV1qzCDd
 1uhg==
X-Gm-Message-State: AOAM533UGq7BTqyPYBeDyiHSA4LEI1On74QG9VTv0DSNinYmSbXs0iQ6
 m5ijtCKnvBs4s0WUZxrhqAdJtQ==
X-Google-Smtp-Source: ABdhPJzn5vDJKXScBg/5Zax5IQIFFmirfICOQE36McKeLi23Vbz6GYsDN43N0AUPf+NSyaLxhLNgXQ==
X-Received: by 2002:a05:6830:1b6b:: with SMTP id
 d11mr27389811ote.234.1626921977560; 
 Wed, 21 Jul 2021 19:46:17 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x16sm390098ooj.1.2021.07.21.19.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:46:17 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Subject: [PATCH] drm/msm/dp: Initialize the INTF_CONFIG register
Date: Wed, 21 Jul 2021 19:44:34 -0700
Message-Id: <20210722024434.3313167-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>, Vara Reddy <varar@codeaurora.org>,
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
index 23458b0ddc37..37cb1102a0ca 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -747,6 +747,7 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
 	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
 				dp_catalog->width_blanking);
 	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
+	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0);
 	return 0;
 }
 
-- 
2.29.2

