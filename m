Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8915A54DDC8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 11:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2F7113BAD;
	Thu, 16 Jun 2022 09:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B23113BAD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:03:24 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id s10so763508ljh.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fV4e5YC9VYPaeaA3wYkEZj1J8lq/TEYTcnfqzS3h2eU=;
 b=o0fIZANVn9C9PV0ontkcAk6mmCC1Eso7Xx+wM30L4F+Nav7QGbwlKA9k4BAz9ScOvG
 N0XnfSxgcFtu/BNsn/gMY3F73M+Q2nGWdSsN5aKiGxhLVNpIW7rHyQiG4CdrSVcXCJ0U
 tQsehBpaRfefwBr+eTC4wl3qiQ05VuOdjsa9OnuCdl5alW7sC/IqR8bQDDGRLOBrXtb/
 +dICAGXXktHLx2oie+hiHxOfZUXNnUcMfbBa01ektqvVvn/buCJsClEsyezmCGZPLNCH
 CUaVUP7TCvp5mCevW+YeHBUXCAHxjCbO4d+eACyAubQsae1g+s4KwvQBJIuroVf4d0TR
 Jglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fV4e5YC9VYPaeaA3wYkEZj1J8lq/TEYTcnfqzS3h2eU=;
 b=5kynS0lI1nYOtyTQXEXZnCp5+al/9OLjTrh6X+9Ah1lE2gxh60A7u26+ZqbQ/HX22p
 xyC8uhIEOjrot1G6Aa9IE22IToNKX2V7XHcKSM7CwcYE3RcBUu5fqjSHE/nxeXbg3QdD
 gi3UMVfzHyesD7AEWFl+trq3IA1WgGwmk2o6aJhAK9ezDhFQiaEzaq44QiNQJW0wU+El
 cHQenz2rK5ajBRKmvU2r9WUL/MqPUVZMSsnz0EdI4ENbFyiKv7Kfu4RL5FVUvITyjNjv
 l3PuXnG9843jjl35iN4bdxG3Hieom+iDf9hWKPw/UOSMKebSZzYoV1wyz7z4p6SEzQqd
 Sy3A==
X-Gm-Message-State: AJIora+QKgreHsIl+EsbLrzNibyC627IA4JC+pkA9aYfC5uZYKuWcZDN
 akHO88a7SqOltUQZlTcEY6YHsw==
X-Google-Smtp-Source: AGRyM1sZRCtLA14Wp6cT/661rkyn2DZwhIIVqJ/CT3dEJjmk0LvlNqAXGICx3umKnWixeyOI4AGQcQ==
X-Received: by 2002:a05:651c:545:b0:25a:45d1:4086 with SMTP id
 q5-20020a05651c054500b0025a45d14086mr1911485ljp.307.1655370202943; 
 Thu, 16 Jun 2022 02:03:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 j9-20020a2e8009000000b0025575338c41sm172573ljg.127.2022.06.16.02.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 02:03:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH 0/2] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Thu, 16 Jun 2022 12:03:19 +0300
Message-Id: <20220616090321.433249-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDP4 uses custom code to handle LVDS panel. It predates handling
EPROBE_DEFER, it tries to work when the panel device is not available,
etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
to follow contemporary DRM practices.

Note, this code has been compile-tested only. Testing on the real device
is still pending (and will be performed before the merge).

Dmitry Baryshkov (2):
  drm/msm/mdp4: move move_valid callback to lcdc_encoder
  drm/msm/mdp4: switch LVDS to use drm_bridge/_connector

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  32 ++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      |   7 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  46 +++----
 .../drm/msm/disp/mdp4/mdp4_lvds_connector.c   | 120 ------------------
 5 files changed, 47 insertions(+), 159 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c

-- 
2.35.1

