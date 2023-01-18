Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 125F6670F57
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 02:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA9610E61D;
	Wed, 18 Jan 2023 01:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582BD10E61B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 01:04:31 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ss4so72308529ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 17:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8rhJ0O8Zy/1VvqvtS0RaWkABfDCQcHeOv+mUOGGm0vg=;
 b=c4+IadVG1v6vHRVEIM+x0TcO5mn4FPTbnM6tL/hFLXlB4bn5l9Jbt7wPGmnFo3/XKz
 p+QXOHjMYZJTJkJ/GcMtBujS33aBr91rP6k8IMjckb/EheH5FEhZQumwetPqeuca5YWT
 Ci+r1VlRqYvw+E13V+qulLZ62H7kYrbSy8yQbF92bg+np1w/p6mz+Qizp4pJ7Q10c26K
 FdenHZCzjdjK4OLvYw4pzb49HerHMNoLRfZm9fMkt4HhRWoggSyABRGy9CwHgQWvEWZs
 CPu+tzZiHf+bahsjOXrmt4eqzvv0hd2iRdJTlA3UrFD9uO9sg2Gl5W/wNlTQWTCFhpPZ
 8TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8rhJ0O8Zy/1VvqvtS0RaWkABfDCQcHeOv+mUOGGm0vg=;
 b=Nwjya8dOm8LedHyBviumkh3mDArjf6JpWEVSgIQpePy3ZH50vv/nszVnX7uOMhsmEC
 Rx3DnYjOEnxnEDXwu1HjytR/Th2/2evw+QJt+itLkxMU8l0rscSeCk6Vgr22YYB/WPex
 Je/gh4IAc74T6B8thWzj6keUEj+4nXxmCEcY/cVNtVLojfICS31caw4dXMCqtj3c/HdV
 swYS9UioJYGGtHbdsshzbvdX6NxZ4l5S3bg4y+k6rx5uAKSiiJQjlQQXxcOOIp3arrLP
 QPe8bzkILfi0ECQu1MYc+IMtF53FnM3rjm6AkAtXlURCn+QFZqT/2gNNmFjIsVk/7QsY
 huYQ==
X-Gm-Message-State: AFqh2kqFEOZ4RC3xgR1xPDwrZsgC23UPDX5YzEe7YnKWmj/AGSWT36La
 hgcDk7FL3U28t90EvWh03G0qWQ==
X-Google-Smtp-Source: AMrXdXsbrX4whZyE4W/TN4wre7PGGEwiXJsJa0DevP/1mPPa3o9ayYPR8cCbC9sb6CWX7aeHGhqkew==
X-Received: by 2002:a17:906:e24a:b0:86e:ec10:ed15 with SMTP id
 gq10-20020a170906e24a00b0086eec10ed15mr4124318ejb.41.1674003869883; 
 Tue, 17 Jan 2023 17:04:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090609c100b007e0e2e35205sm13988953eje.143.2023.01.17.17.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:04:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/3] drm/msm/mdss: rework UBWC setup
Date: Wed, 18 Jan 2023 03:04:25 +0200
Message-Id: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

The commit 92bab9142456 ("drm/msm: less magic numbers in
msm_mdss_enable") reworked the static UBWC setup to replace magic
numbers with calulating written values from the SoC/device parameters.
This simplified adding new platforms.
However I did not estimate that the values would still be cryptic and
would be C&P-sted instead of being determined from the vendor DT. Some
of the platform (sc8180x) completely missed this setup step.

This series attempts to rework the static UBWC setup to be both
manageable and hopefully easier to write.

Changes since RFC:
- Merged sm6115 fixup patch into the main patch, since only the comment
  was incorrect
- Moved reading HW revision and UBWC decoder version to the error case
  only

Dmitry Baryshkov (3):
  drm/msm/mdss: convert UBWC setup to use match data
  drm/msm/mdss: add data for sc8180xp
  drm/msm/mdss: add the sdm845 data for completeness

 drivers/gpu/drm/msm/msm_mdss.c | 198 ++++++++++++++++++++-------------
 1 file changed, 120 insertions(+), 78 deletions(-)

-- 
2.39.0

