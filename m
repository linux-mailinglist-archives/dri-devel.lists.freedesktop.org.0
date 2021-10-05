Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 247DC423433
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 01:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D456E48F;
	Tue,  5 Oct 2021 23:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB38D6E488
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 23:11:43 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 j11-20020a4a92cb000000b002902ae8cb10so282887ooh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 16:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQpkJbXdp5NaD5qxiGom/Wfq8wfmW/3aS/lr+Qb5xRs=;
 b=oqueMNzGUkR0//cRE4HSJcINwQU73pQ04AVYh5mEi30ciDFiUR7SdlfNFHjRM1fuB9
 3D5Oh6BvUVktSBS608uBVmqAPMRPeuNYY6NIcQNSApWe0jxdI85bNGZAzvVirv++hoBy
 iLzxcGCco/T4vqO1tWmBEv1E6dW6Y496l/uk3QfVWiZYZ7dL5PYkIIShrjWHdztByYWF
 7P9ydFYcXIEEmO+HpdGpkyCdbsO7TpqstsYzsAJxWvHuITuVIJ6LFeeqD3A7JuMQX1Xt
 IjTiBX3zxBQfvkKdGaWzMgv8XpfYec4Ev9IO1c2Hcg3LnOR/9VCLlX7H9EejfX2XGytz
 Gfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQpkJbXdp5NaD5qxiGom/Wfq8wfmW/3aS/lr+Qb5xRs=;
 b=LVbt6rPfO9pJcn/+CP1zBEurO1/NBgL4W/v+eU+4pRJUdUxYLkALLCHXnML83dyqJg
 a6SMXjzvCSjLdSK2QTgjl2oe62ScGAvY3CT6mkLw0ok4bH1jwAJnjfZ9ocJDjtt59W6p
 sNHk87rh/cL7f77cdOvTnmWyG4/BruNfuPk6gsAAcr45NXz2UmPi4qQBjfuOltjUnMEl
 shdPlEkpjsjFSfhR4K2CqD0azofqBDJvTCkgof7vH0OJGbnZDMU8e/tOxshvYvQyD4Fc
 wp/doGzewU0Z2sh1ZcweHg0+K5rzaENUvrim4NGtVNNTOeUSknK5lQgZj9Fhrc4z6AWY
 5a6A==
X-Gm-Message-State: AOAM5302LZeOYKlS2zxMvh7M+1vowrLIxYzLkg6efyar3IFwPaY5aMz/
 4XQ8SJhToNcTiqCSm7be9hD/0g==
X-Google-Smtp-Source: ABdhPJyyWLaV9KUdV30ySmf3HQps056UZvaj3bt/VAjhu9J/UFlwoxSolCJwEnrtnJ7mikzLiPkREA==
X-Received: by 2002:a4a:e0c4:: with SMTP id e4mr15716360oot.24.1633475502788; 
 Tue, 05 Oct 2021 16:11:42 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 v9sm1665141oth.62.2021.10.05.16.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 16:11:42 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] drm/msm/dp: Support multiple DP instances and add
 sc8180x
Date: Tue,  5 Oct 2021 16:13:16 -0700
Message-Id: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current implementation supports a single DP instance and the DPU code will
only match it against INTF_DP instance 0. These patches extends this to allow
multiple DP instances and support for matching against DP instances beyond 0.

With that in place add SC8180x DP and eDP controllers.

Bjorn Andersson (7):
  drm/msm/dp: Remove global g_dp_display variable
  drm/msm/dp: Modify prototype of encoder based API
  drm/msm/dp: Allow specifying connector_type per controller
  drm/msm/dp: Allow attaching a drm_panel
  drm/msm/dp: Support up to 3 DP controllers
  dt-bindings: msm/dp: Add SC8180x compatibles
  drm/msm/dp: Add sc8180x DP controllers

 .../bindings/display/msm/dp-controller.yaml   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  23 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  66 ++++----
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c           | 153 ++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.h           |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |  13 +-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  30 +++-
 drivers/gpu/drm/msm/dp/dp_parser.h            |   3 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   2 +-
 10 files changed, 194 insertions(+), 108 deletions(-)

-- 
2.29.2

