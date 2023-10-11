Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29C07C6133
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 01:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B85910E2DD;
	Wed, 11 Oct 2023 23:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915FE10E2DD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 23:39:22 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so4543161fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 16:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697067560; x=1697672360; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k9ZbNL2ZO2xnYw+f/qXgIy6W1+ECSK31UMyr+/My700=;
 b=ochdiD2IgjA6NZQHgA9w5hZmS8U4kBjNfBj0xcxnpCLp+5dFWl8eoS1/mYeJYQ/g8V
 lW7wpKwKfWEC2iEX+F3tbL/ZH9POa1FYx/+DkBLr/w5TeS9bVTaigIfvxXrksNxGQIEL
 8p3QC7RV/ITjx9tmKZEBuUHGglO2a4THwN5Rc2/LAZxcerLGvnx8rYCPq1I/qB/PcRXb
 t629A7vpxE1EghoZOiZgZDZ5Dcq8jOYBt4kwyQjIIdqAqDYIW0kWAzqc23fOKc1Hk5Vz
 mBXvSxgqW48FI+a215NHAFh4tNoL4UDt/ecanmH0o4kdjnyN1myKt/1mPOoXVLDiDc3J
 yqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697067560; x=1697672360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k9ZbNL2ZO2xnYw+f/qXgIy6W1+ECSK31UMyr+/My700=;
 b=i9JOnkGhUMwGyW/0OphCBNGr3uzFLMCSeG9pZpPznQPXk2v2qwEjIJL0Uj11V38LUg
 6erELt9qJL7BZjvExwUfRfEXGAyiexDxyu84UdavfIFJPnvkWa1QnqZpoued6rkCRMiW
 2QgTg5/Lf1YdC1tUte5C/zWennA+IP7X13TZA/kII97e82CRspQcf0HAgIajYQTJx1/C
 0SipilJbV3dDFAAhNRPdPWFb8NpDxqfEOQJXhlb4+p1kJplaaV04YEK/sMm3mm23NC14
 re5WjQ0oi8Fp/d3EloNk4hath6tGoyk5mTB8Dl5HNnhT0AFFh3e0kpOWHb4Pc6RYHiSb
 Xp4g==
X-Gm-Message-State: AOJu0YxhtVa2FA8XiebW1D/Rhu4HxDCS3Yn8GSGirIvTyK1BSPermtGj
 5EWOZ81+eNNQ+Pkm0a6cnX0RUg==
X-Google-Smtp-Source: AGHT+IElT7AQoWznFRUzefnPxjuyk/f4YoUnTLHexKJLP0Tp7XWPjqhbr10/ecYGLyY7bzUkIUh3WQ==
X-Received: by 2002:a05:6512:282b:b0:505:7371:ec83 with SMTP id
 cf43-20020a056512282b00b005057371ec83mr22292485lfb.48.1697067560648; 
 Wed, 11 Oct 2023 16:39:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056512015b00b0050567cdb8f6sm2466032lfo.239.2023.10.11.16.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 16:39:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/2] drm/msm/dsi: fix handling of TX DMA buffer
Date: Thu, 12 Oct 2023 02:39:17 +0300
Message-Id: <20231011233919.410099-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix two issues in how the MSM DSI driver handles the GEM-allocated TX
DMA buffer object.

Dmitry Baryshkov (2):
  drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
  drm/msm/dsi: free TX buffer in unbind

 drivers/gpu/drm/msm/dsi/dsi.c      |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 14 +++++++++-----
 3 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.39.2

