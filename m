Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED104F5A7E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B3410E384;
	Wed,  6 Apr 2022 10:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC01810E354
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:12:50 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id p15so3212394lfk.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 03:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNQASTvlLKNLD8hR/6/xkEqB3XhYihaOxq6BEyH/MZ0=;
 b=atuQiS5mxF0A6lAnssEBE+S1ASxnrBGHcRwSnMFpHRoBjSDhVfRkxwwRzVahRjk6Kd
 CYfKax7GiZwt/dT34ce2PxX97U9vax8orJomtkNh08SW0wwrRG9LNBHSPcKvp90QE/Nu
 OA7CNTWDuS/A1FhFLqkjMNGp0zo1iNOvsIjISChvcphencilmMlHA27gioK6FaMYevRk
 yxaHouk9KZE9tq3cIqnCJAKdIPmxzOlefnfXq7Poxyu06lnvbaTb78z3qv/JUR7v439w
 O+LEn93cnx88bt4nUAkM73TEzkOmEBf38fFE3WGvi/XRZzhw3QHaJ1WY/qy94YChmR2O
 9sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNQASTvlLKNLD8hR/6/xkEqB3XhYihaOxq6BEyH/MZ0=;
 b=sk07Lc6UhMfVTpn3hnQB1jI3qYw9xHVhD3eAqZ/61YA9f7qUpGDokKDNyagCYAyRiI
 6tFNXDD1KBfkTUHH3GTqi01Ya7zqIPIEaRODFAARZxKIWrycog+C+fU06GbP8N9OMLXL
 ewe4K/wqJF9geGgxwqSi6XQffxczIvSRU2OkFdH7/NIDMKlKLppSXkLQ3+qwittdEUrZ
 NyEyc3C195nNQ1VBaLdomH+tWpgJqXHz34+IZNYi/Pcv0jz+VtlM4bXgeUDt/er1JLK5
 U7qFow9zarSSxmkJfJpfjxBWK4af8cVgPBU9pSiZexkkpum3eyhRwzDeXVqxoQlJskUP
 ay8g==
X-Gm-Message-State: AOAM531Ai5JCldAgwrmnn7JpYGAc1U1ZUBGrk22jOTkUk6mDDjTqddII
 /7QCTHIB6MIBzNup2OpCBHGNbw==
X-Google-Smtp-Source: ABdhPJzX2vCNyl1ZY1jdgUYMJAG16UJYPGAkYgC0AA1daRXryqUe34e942NN/QJZfTZ+Xv4ynJbxhg==
X-Received: by 2002:a05:6512:10c3:b0:45c:d26a:d5e with SMTP id
 k3-20020a05651210c300b0045cd26a0d5emr5470082lfg.296.1649239969045; 
 Wed, 06 Apr 2022 03:12:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i4-20020a056512340400b0044a310f72f6sm1782154lfr.250.2022.04.06.03.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 03:12:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/3] drm/msm: remove DRM mode setting object arrays
Date: Wed,  6 Apr 2022 13:12:44 +0300
Message-Id: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSM DRM driver stores connectors, encoders and planes in the arrays
inside struct msm_drm_private. They are not really necessary, as
drm_devices also references lists of these objects. Drop private arrays
and use drm_mode_foo() macros.

Note, the crtc array is kept intact as it is used in vblank handling
code. Maybe it can be dropped later, but it would be a separate
intrusive change.

Changes since v1:
- Also drop MAX_PLANES/MAX_ENCODERS/MAX_CONNECTORS defines (as suggested
  by Stephen)

Dmitry Baryshkov (3):
  drm/msm/dpu: remove manual destruction of DRM objects
  drm/msm: loop over encoders using drm_for_each_encoder()
  drm/msm: don't store created planes, connectors and encoders

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 51 ++++++------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  7 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++----
 drivers/gpu/drm/msm/dp/dp_display.c      |  2 -
 drivers/gpu/drm/msm/dsi/dsi.c            |  1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  1 -
 drivers/gpu/drm/msm/msm_drv.h            | 12 ------
 7 files changed, 21 insertions(+), 70 deletions(-)

-- 
2.35.1

