Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D2354FC8C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 19:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9A510E473;
	Fri, 17 Jun 2022 17:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3136F10E437
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 17:55:41 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i29so8032042lfp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D2/ulgUSDtuTKZUZ07V9o7lsdM5mVgDEWyK0WN4WUGU=;
 b=MWAeruo9ft6VGDTpDJ/JYrC6pGzRDc06xBNkpVSKI1EHGYPeenIj1OxUfEASEvbGuu
 eqjhBrY3gLhlG/c/IzLBPBes3QLEaw6c6oSsBOQLN9W9fL+42W6WCidt6jDvUOCUzLpe
 S5jdY1e4UMcKCcxOo9G6mVTmpcTmWsxvp8F7vD1VQUyvAP4EYzMkpnfKG4o9OewcGBnD
 1sHHX4VgpZwDLNsKJ/IHpToP8pxxMwn2X2jcf1JVFBU247/6KtFpzL415t9awtKm3dLL
 tUpwmDQeiyezaCDsKOIPzHbYPBXbiTTz7jCqyck4BpUksdiD+7FzN69P1L4X6oCDJEx6
 FN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D2/ulgUSDtuTKZUZ07V9o7lsdM5mVgDEWyK0WN4WUGU=;
 b=3zAp/etnjk8oq5BtIwkWUFKXxMdutlzJOCR7hcmO3J2vaZw2EkrT8OufMJ+PVS3gGn
 B7k/5WHLh95QLh2HnQERLeCI5v24Q6JOK5aTJ72jempCwCqCH21ZLvXXQZ9aey3iv+Z9
 pbEPgMCJ6LpptCAw+Kz4kMZj3caEiQSRnxt69Rbm+Co+j7N1SS7rJJUs75bfrb4XVt3j
 BNFWKfMr6qbAe9d8zW3lldUxYkGMjlHJDRGOCT+HzH9x+uWARcZS0yEWVLafN/ZeaBS2
 E4vrutppndXC6Kun5vQ2qNuogm2agh+p7LD6urDZC62arFzazER7PjH5gRiWNSociGSB
 vF4A==
X-Gm-Message-State: AJIora87aU8JMpKU3p0I4ff6ypKOBkSPOOUwTQq7jXL5h1S3xpxZMa6U
 ktR/bmjYl/yW8CJN2+7De+0y8A==
X-Google-Smtp-Source: AGRyM1vyrP7oq5/XG1m7rG9FImaNjM1DFc5qB2YeMbfXK3KMAkluqm7X0+FD8e/4eiZ/wJG3wSccWA==
X-Received: by 2002:a05:6512:702:b0:479:3bb1:8992 with SMTP id
 b2-20020a056512070200b004793bb18992mr6150820lfs.361.1655488539469; 
 Fri, 17 Jun 2022 10:55:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05651220d300b0047968606114sm712747lfr.111.2022.06.17.10.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 10:55:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 0/3] drm/msm: convet to drm_crtc_handle_vblank()
Date: Fri, 17 Jun 2022 20:55:35 +0300
Message-Id: <20220617175538.1080351-1-dmitry.baryshkov@linaro.org>
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

This patchseries replaces drm_handle_vblank() with
drm_crtc_handle_vblank(). As a bonus result of this conversion it is
possible to drop the stored array of allocated CRTCs and use the core
CRTC iterators.

Changes since v3:
 - In msm_drm_init simplify the code by using an interim var for the
   event thread itself rather than just the index (suggested by Abhinav)

Changes since v2;
 - none (sent by mistake)

Changes since v1;
 - fixed uninitialized var access (LTP Robot)

Dmitry Baryshkov (3):
  drm/msm/mdp4: convert to drm_crtc_handle_vblank()
  drm/msm/mdp5: convert to drm_crtc_handle_vblank()
  drm/msm: stop storing the array of CRTCs in struct msm_drm_private

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c |  9 +++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  9 +++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 44 +++++++++++++-----------
 drivers/gpu/drm/msm/msm_drv.h            |  3 +-
 7 files changed, 35 insertions(+), 36 deletions(-)

-- 
2.35.1

