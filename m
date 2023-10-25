Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 743EE7D66C1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEA710E618;
	Wed, 25 Oct 2023 09:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723E510E614
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:27:14 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507bd64814fso7857207e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 02:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698226032; x=1698830832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i8USfd2cXtMS5J3mM9vTi2tspxUYy+b4DZDSMhYADls=;
 b=yDmrNHw14y0MEs3cqpqWwJNI7ynOjVmuqxQ1INQauklgwY2jvjLhS+Cik8soufIGsz
 DoB+mBqXn8ixOv8nKKxg2XDCOEkiwjXaFUXqhanWOku3MzXhbqa8zC3DBCLc3zhU6m7N
 aTJjFegC5R5xK7Jab6vntHHSHFdfeSZkrCN78TLiCye4NuZKqOestj4SBG9TQoZkBH38
 xho6FcP/aNiHMm99pPRMkCbkqnhWSzxTEH4JSJ/Rwc90W7oHZz8or2bl5glBDzpXJL7w
 D1xr69SVRwMVCjisVUPpxKWmKjweZryKv7+BZBNSyehmAyxgQSq9ogdZqoWnbyI6K6Ye
 NJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698226032; x=1698830832;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i8USfd2cXtMS5J3mM9vTi2tspxUYy+b4DZDSMhYADls=;
 b=Gik+NlnC1zpSG0P2igP1H4iJkhw/8PVXtEKooqBMfjbkmuH0dmhh+yL7cTvwig8w/m
 lnBTQa4eUPjPLlJ3KK7xnqxqczradR15GcQFIll2/7bbXgYqRw0aA58B9XP3PODyFo6e
 O6ENFWvLH/1KjD7GnepmCl0+/bvU+WwxgnxECkr3KjP/1GNLA3XJG6yvRFrlB2yHqnER
 IqA62enuB+TzJqyeUb4UAdbULmf/08bECQDfIc/wfHh3/jfV3eeRNNvH0KtLx85/RSEd
 qiFQn4vcfGDp9hHD6ECj7letR/iaCJePYS92f5N+pOolHYJ6e5hoWizE9+vmqzYtpuSr
 cnXA==
X-Gm-Message-State: AOJu0YyfufNeddKyK9zrHkHq57ySKFkiM/nS1L7uah0Rz+w5hqWRZ0qp
 iYvHOTN3PARPkti4lZrVZJ7lDw==
X-Google-Smtp-Source: AGHT+IHTmUTCmb8MZXEisS6oCGCWvEuXG58i+0LOySJCTSTxUc7vXiT2YUaa5P7vgH3I4IZPYTsNqQ==
X-Received: by 2002:a19:655d:0:b0:507:9d70:b297 with SMTP id
 c29-20020a19655d000000b005079d70b297mr9607031lfj.60.1698226032561; 
 Wed, 25 Oct 2023 02:27:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 eq25-20020a056512489900b005079fff83d2sm2470377lfb.3.2023.10.25.02.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 02:27:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/2] drm/msm/dp: fix DP subconnector handling
Date: Wed, 25 Oct 2023 12:23:08 +0300
Message-ID: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
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
 Stephen Boyd <swboyd@chromium.org>, Abel Vesa <abel.vesa@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix two failovers in the DP subconnector's patch. I didn't notice that I
had another patch adding the property in my tree and later Abel pointed
out that we shouldn't use subconnector type for eDP panels.

Fixes since v1:
 - Add Abel's patch.

Abel Vesa (1):
  drm/msm/dp: don't touch DP subconnector property in eDP case

Dmitry Baryshkov (1):
  drm/msm/dp: attach the DP subconnector property

 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
 drivers/gpu/drm/msm/dp/dp_drm.c     |  3 +++
 2 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.42.0

