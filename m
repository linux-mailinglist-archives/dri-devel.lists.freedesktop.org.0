Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A550F6C87E7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 23:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8420E10ECB7;
	Fri, 24 Mar 2023 22:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE5C10ECAD;
 Fri, 24 Mar 2023 22:00:20 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id c18so3086918ple.11;
 Fri, 24 Mar 2023 15:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679695220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TwSVZpLUzRmiKPBTqz2xkUjjibhOLesM/D7QB066vDY=;
 b=MzzWglGqjxWYLJ5m0oOhSLE8/AUlI9bSF/LPOlD7NAvgKgilVhKJrTyXk0zveHQ6qb
 YC/rJ5lphx2bNt7p81GmTWdTTWAf/HifT+tF5GwgQO0tcg57jipY7bral9bwxSrPWvzC
 t/SarjzE8fMpdaiLFmOiO22fwq4U721ebyBbzJvA4AUlse0y0R+oAqKSjenK/5IV5Jya
 QdssZ7RXOHqlbsPBfDBEHbOXNGYHaax75s48wmivRLqrdCCgN4YBtb5xz5+H76WF5OMt
 Hbvr7aJNSTR19MEZznTmkxPA57RsbJ/FW/vfM4XrdaD4+yis7IporewAm9+uWJLyWuwt
 1fYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679695220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TwSVZpLUzRmiKPBTqz2xkUjjibhOLesM/D7QB066vDY=;
 b=gvD0ingmthH9VLFVm3Wk2BgSp53azqj19x/4M7Vo88iMjxz4UYDAnnBymIAWoNIoRs
 pcdEdRfy1TCAgVZ0DZn2/4CAAoXSlY+YQwDjISov5nhj1ZQR2L7ql6H65LPh1xofHYUS
 eF5p+BFDW6fzQkO7AEsr5pdwtDPGofR1cMLsULQXq5/xOOUFboyY7ybCELe9VHdB9GdD
 wEvWrUdJZNJIVMSzotjdNBdzZWBemO19GF+QtHFgM6VIHyccd1X7a6umvAkpiTRIaAvS
 y0x+AMDCQZIljoF/O2W82PR+kDCBYceb9MdI6pYzdmTDN7yX8tHyKX7TBYepM1aAL1U0
 HHCQ==
X-Gm-Message-State: AO0yUKVhUNvPV7puqm76Y2B5c0sZHbcylJb9K13949jMvtAUlbINwDHt
 /al1ThJbpJtvs8KK6fW3Di+/wY2uD7E=
X-Google-Smtp-Source: AK7set+PGtDOTkfzZJx37x4Pz4RQeFFcdSqmH6QQdA7Wb4n1Bcs/q3h6z5bxt6vTpwuaw2fVQ90ZjA==
X-Received: by 2002:a05:6a20:c28a:b0:c7:770a:557f with SMTP id
 bs10-20020a056a20c28a00b000c7770a557fmr3861341pzb.50.1679695220121; 
 Fri, 24 Mar 2023 15:00:20 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 k23-20020aa790d7000000b006247123adf1sm14773685pfk.143.2023.03.24.15.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 15:00:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Avoid rounding down to zero jiffies
Date: Fri, 24 Mar 2023 15:00:13 -0700
Message-Id: <20230324220013.191795-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If userspace asked for a timeout greater than zero, but less than a
jiffy, they clearly weren't planning on spinning.  So it is better
to round up to one.

This fixes an issue with supertuxkart that was (for some reason)
spinning on a gl sync with 1ms timeout.  CPU time for a demo lap
drops from:

  15.83user 20.98system 0:47.46elapsed 77%CPU

to:

  8.84user 2.30system 0:46.67elapsed 23%CPU

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9f0c184b02a0..7936aa6cad03 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -548,7 +548,7 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
 	}
 
-	return clamp(remaining_jiffies, 0LL, (s64)INT_MAX);
+	return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
 }
 
 /* Driver helpers */
-- 
2.39.2

