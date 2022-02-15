Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7797A4B6E85
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 15:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCC110E57E;
	Tue, 15 Feb 2022 14:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612DB10E579
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 14:16:46 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id u6so37147958lfc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 06:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=22TX4LYstdLNVIjkGd2GuVsGQO8yGKAR+N5sETL9hVQ=;
 b=PMbfdPlFSOsOXZ+TfL72dreiL7ntrfsZYcK/k0PURLikQS3bZtEf7zIJjd7BQZKQjo
 VI6/8QL8FME5YR1NfVZqtMdybr/q7Md1vISskflD4+YP9B3P2SQp24wKjMBtETzlk7tj
 Ycf7XBZjaEWQSjTCuMw/SOQLzKrGzWZanz8pM/U/a4X1c8K67cL3GCJM8qqVyUeKLoRI
 j6H3jpfsL8EybwMBy2mIvEIq+UFfoCVchcAmyWuz3DKsAm1GMpGDx5EWDtRLAUD1MyfD
 euxvXpEObSBFMP+1sQX7th6z7GlL8H+t3QOEc3p2u7KXIi4SH+WhomrrwGR2s3z4dJR+
 QmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=22TX4LYstdLNVIjkGd2GuVsGQO8yGKAR+N5sETL9hVQ=;
 b=hoiGEhBmM3bfB/oX+Z75ywmdQrzkF3wZyN0Z4ldNvYkQJLXc2GfXLCdiBGutvVML4o
 uaLWcoiHrPPvmkx+Se90rTgw38U7cKtyGbk1hzo/GlPcIrH3bsPLdse34B2fw+0oq60M
 TNYo8KZDCCtzce/YLKraobb7uXvuZjQYtY2Eu5NiP31ZWF6R2K4hSHVg8hcdTXmpB7dB
 e/VTlX/u+NQ0TxXtYLuKNtLNooS4mL2NtrrdNOAMHSgYIy/EF6qi1bgXBoAtOPYs1ce2
 M0okM/eKzG4YsCRAtk5mDrTdhYqzMcrrjtfPdG9fY34GTdwT9ezmiNLv6Xu/bgzWuNvI
 xDpA==
X-Gm-Message-State: AOAM530Hgpkq8NEqRbceaUZkT0HcbVtW2n84C9HXf+KDHmE6e7+gA+Nu
 5yIdg0SzHL8s/HKzaoK6mxA7KA==
X-Google-Smtp-Source: ABdhPJya95X7LDNjmXmmcG6iI2tJCEsuHR7RtyI1OLcSwvfSVxQt14x6P8m+Jtrtl+IsAhuEGqI3Gw==
X-Received: by 2002:a05:6512:ac3:: with SMTP id
 n3mr3157187lfu.379.1644934604637; 
 Tue, 15 Feb 2022 06:16:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 06:16:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/8] drm/msm/dpu: cleanup dpu encoder code
Date: Tue, 15 Feb 2022 17:16:35 +0300
Message-Id: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchset targets DPU encoder code, removing unused artifacts (empty
callbacks, MSM bus client id, etc).

Changes since v1:
 - Split dp audio fixup from the intf_type patch
 - Remove atomic_check() removal, used by the posted WB support

Dmitry Baryshkov (8):
  drm/msm/dpu: fix dp audio condition
  drm/msm: move struct msm_display_info to dpu driver
  drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
  drm/msm/dpu: drop bus_scaling_client field
  drm/msm/dpu: encoder: drop unused mode_fixup callback
  drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
  drm/msm/dpu: pull connector from dpu_encoder_phys to dpu_encoder_virt
  drm/msm/dpu: simplify intf allocation code

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 83 +++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   | 18 ++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 14 +---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 28 +------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 28 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  5 +-
 drivers/gpu/drm/msm/msm_drv.h                 | 18 ----
 7 files changed, 55 insertions(+), 139 deletions(-)

-- 
2.34.1

