Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E564B9740
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CB010E731;
	Thu, 17 Feb 2022 03:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4F110E75E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 03:54:02 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u20so7592985lff.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NPj9DuFzc5wZ5qQDoHU9zhJ7waGhcTk9Ut8y80UuXAM=;
 b=tFwAzo8/ZkBmIsV8kBDnMGFLrFx0YVbo1/v1NkcCxew+ugdeUOkOLEF5s1l60HAIlg
 +UTcM3jBsiedN7bjiJAIJKVjlE5h6jJj6zOZOd2DzqQoitC2oq5iBFLy0c8dnIAnqJWj
 rghldG033hGjmte5SyVgNEFOEWDbG/w7Zi22lR7R1I475hMEycqGDSEsWG831dLwlHDD
 J6kTLO8Fkj1etrUG38xREAO8qn6lq1KKFkLkZjesz2WibititxP6O1VH3MYyrvllCEoS
 OSnK6cD4Ysk65dH/afwvZ6+tq88MJkR4Sruku8tmBIFTk69oOzHybRAU7KZdudRQUZjm
 rwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NPj9DuFzc5wZ5qQDoHU9zhJ7waGhcTk9Ut8y80UuXAM=;
 b=Aqpc1fxNO6fDuRCgrj3haBC+DQvHMP13EhZqbvPmhKRo7oTIUBXXpyj71D3CzflYOE
 m6VKO65PPdnZ83xLcy6TXF0NbS9Tu0WpVPiitvO2I65FuGbBbA3wju7vbKx9sN969sVI
 xs3zVxwJHVeyHNHNGj5/u/ol5iY9agsZwL+ye3JT9Rq6a25Y44jl76LBE3Q0iqBfMadC
 0ZVLeyiT0p9WNS3Xi19xJnC3hG6f4xYde986uQjpN3eyKz/9+k2ZAtn0y61yL87co5aW
 mziwhHdmWRQzGU+8FrFiwenjgbFiuR1kH9DJMWuE27mcYGyWpSzsgA2K7/YcSleOceR3
 08PQ==
X-Gm-Message-State: AOAM5318CkgS9VfMhe7k+MAYf0acboV2MfUeXhC1KPlhlFRHg4TqsfRf
 vhC9vG8H3VsEV10TYYGjfvq8eQ==
X-Google-Smtp-Source: ABdhPJwrDPuNGRBBpzwRI7zFEF/VQ/jywG2z0N4Dw+fa1UFbf/A6EiND5HP39WpqV+2Wru3RRtG8Gw==
X-Received: by 2002:ac2:4250:0:b0:443:3d07:7b5a with SMTP id
 m16-20020ac24250000000b004433d077b5amr805701lfl.305.1645070040403; 
 Wed, 16 Feb 2022 19:54:00 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:54:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/7] drm/msm/dpu: cleanup dpu encoder code
Date: Thu, 17 Feb 2022 06:53:51 +0300
Message-Id: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
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

Changes since v2:
 - Expand commit message of 7th patch (pull connector from
   dpu_encoder_phys to dpu_encoder_virt)
 - Drop intf_type patch for now, as it causes controversy

Changes since v1:
 - Split dp audio fixup from the intf_type patch
 - Remove atomic_check() removal, used by the posted WB support

Dmitry Baryshkov (7):
  drm/msm/dpu: fix dp audio condition
  drm/msm: move struct msm_display_info to dpu driver
  drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
  drm/msm/dpu: drop bus_scaling_client field
  drm/msm/dpu: encoder: drop unused mode_fixup callback
  drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
  drm/msm/dpu: pull connector from dpu_encoder_phys to dpu_encoder_virt

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 59 +++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   | 18 ++++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 14 ++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 28 ++-------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 28 ++-------
 drivers/gpu/drm/msm/msm_drv.h                 | 18 ------
 6 files changed, 45 insertions(+), 120 deletions(-)

-- 
2.34.1

