Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2179696BB2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119A810E951;
	Tue, 14 Feb 2023 17:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7434C10E94E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:29 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id n20so3507543edy.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DYv8a/6OJy8MXb4KukAGuO4KrVafYfuTHns/Kb02ayY=;
 b=DmTOd/wjk7KS04TN9/EsVziPdXoeM86DwwoO0M6up/iMBT9+UbMYH9B1i1n03++RnF
 78wjQCqUU3/LbnAKkws9hcZnmG24rdLdQTRWqzrp/S9iT2tTH0sI663FrVRpPdnX6ZsD
 F5eUwtJ5/cCoKPF2K+KllxHTPtZY8NhSIB/xBIa9E8tpOrKvYe9pPrOGbOa+A71LT7W0
 hy07eF810ArwqBMjxqpAQN3nbZUi09mMJ2CS2kR+3V1Zr0x7g/KufmKlFk4rrg8cXySd
 boesWPGSXS9we+H7a9jvFC4wEFgWWgvX3UU7OZBKR3HnwVoiutPUg+Nt1lw1pcQ79JSJ
 YSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DYv8a/6OJy8MXb4KukAGuO4KrVafYfuTHns/Kb02ayY=;
 b=7oS1LYk/Kt/SvK9IQrxnmx0+sUM1qezws9UfD7fTA6Jln2hqce4R679ZEK1iB6OXZQ
 4pX5JJ1rU9yPIwR251O0zfG8DQ+U/2rVOHfhQqTk8YKwnf2IwnypCWEwz6z7JwwaH8RA
 qno+/mJVEiC+BegPpz07/7Uc4Vf/pZtzIqGYIdY1yB/4X92CJ4ee8NrXE8oxn8t3wTja
 1fuiR7XMXMsmjcjJJiENrnBz7RsP1QbjDGmEt2D0hQcTGxq/INB5Bw+o85uW76lVvJie
 qPcNv1M/1Uz0rJllWVY/KStSvbk3S1O/mZj4qFLEsW5h/6SGYUcjQg2YZu/qrQOsIePd
 UzBQ==
X-Gm-Message-State: AO0yUKUtfARnOTsdIqPzH7XJV3Ezv7PeMLltXfVaBbJj9vops6+SYA2o
 VaiBi2DQC/I06ikkf2CZ5v71aQ==
X-Google-Smtp-Source: AK7set/QEDbEa8JZMZ5nDsQTEWO9TnlFJPm08a8Wgn1ES/Q9Gwv+FqjInAFWVZYuHtutMT7nwO5nbg==
X-Received: by 2002:a50:871a:0:b0:4ac:b4f2:ce44 with SMTP id
 i26-20020a50871a000000b004acb4f2ce44mr3371125edb.38.1676395949068; 
 Tue, 14 Feb 2023 09:32:29 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:32:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2 12/14] drm/msm/a6xx: Use "else if" in GPU speedbin rev
 matching
Date: Tue, 14 Feb 2023 18:31:43 +0100
Message-Id: <20230214173145.2482651-13-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b08ed127f8c4..ffe0fd431a76 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2153,16 +2153,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {
-- 
2.39.1

