Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D153806F5E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 13:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7429710E6DF;
	Wed,  6 Dec 2023 12:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5755F10E6DF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 12:02:11 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33334480eb4so793387f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 04:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701864130; x=1702468930; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C9luEiqd3rNZRXjehlbFdnQ2e1wzzmxPWamwzOSoC4I=;
 b=OCcU1J3kEJyX/GvHG4Fr/ZvPxhJYVqSxR+jwyu/L7mbxZNroOVE/AB8W1ahiqTlinr
 ZSgl/dqyGyBmaNLK2OCZekxJq6rWAY12lbA7Iee+aNgQ8X1+dhDR2lA2PhxYQFfsQ05i
 7ZBwn0BR5s7+yxosMKb4SwSdGQUtb3h+plB/WDtRnN8UyTGpjISoW6P7pUX6Qhd7MrG1
 fwzevHCsri7znYxI/bHz1BMKV4GJFy/DVUECe0mFP8Nktbod3o2KaeeC0aEf8E5qQKVm
 rC1bJzmbRkMJ4ZXTVrN9jgIQHVvIqlGFSfLfDzq2GUHgljYAP9Q/EDttihne6j4yIo9g
 aukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701864130; x=1702468930;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C9luEiqd3rNZRXjehlbFdnQ2e1wzzmxPWamwzOSoC4I=;
 b=oGpErm7KngIwCkijwU84/LZnDUwgYq+ozO8Hg2jmg/6EQRQQPVSJ+ltRaCuR2A3ibH
 xkOX30nrzujksjeaYbDDqD/o/SrwhZRmBCRegpVHOKdSzg6TN7Sd4QR7d1eSeB5WL92/
 OvMwiGEUk3mzAqBLxTd3QHRRZZKk1Ux+fh5JlMiSSDuB9MJ0bmT3Q989yU9YKh0t/EQt
 8i8XTkG/uEKizGecsBQ6HQLL8Qh8j4ktIyGSdQ6EwXawTVM66ITAf8gkcyiovmDlFrh7
 2ufEB7N3hp7Rlb/wQecUBYsORlTWocKLglp19n2FQqw/yOGmMdBRsGXSRXy9xD5O4Fue
 RAtg==
X-Gm-Message-State: AOJu0YwWFfFGF3zyTK2fsJZNtxmXkrtTIlH8ST3oUhFi57ZAPhmRzHJh
 /0ndAmAe7GEzykiOLdE2BpiBVg==
X-Google-Smtp-Source: AGHT+IFJokEpInd+DiAKxLDKJAGHst4aJ50KC/hLVyMjr37BE7LjVcnWh8PkujsMGpwy/wk3eMm1WA==
X-Received: by 2002:a7b:cd0d:0:b0:40b:5e4a:4072 with SMTP id
 f13-20020a7bcd0d000000b0040b5e4a4072mr523452wmj.146.1701864129773; 
 Wed, 06 Dec 2023 04:02:09 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b0040b45356b72sm25543935wmo.33.2023.12.06.04.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 04:02:09 -0800 (PST)
Date: Wed, 6 Dec 2023 15:02:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH] drm/msm/dp: Fix platform_get_irq() check
Message-ID: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: freedreno@lists.freedesktop.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The platform_get_irq() function returns negative error codes.  It never
returns zero.  Fix the check accordingly.

Fixes: 82c2a5751227 ("drm/msm/dp: tie dp_display_irq_handler() with dp driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 61b7103498a7..d80cb3d14c6b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1166,9 +1166,9 @@ static int dp_display_request_irq(struct dp_display_private *dp)
 	struct platform_device *pdev = dp->dp_display.pdev;
 
 	dp->irq = platform_get_irq(pdev, 0);
-	if (!dp->irq) {
+	if (dp->irq < 0) {
 		DRM_ERROR("failed to get irq\n");
-		return -EINVAL;
+		return dp->irq;
 	}
 
 	rc = devm_request_irq(&pdev->dev, dp->irq, dp_display_irq_handler,
-- 
2.42.0

