Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7059D6D4044
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 11:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA59710E397;
	Mon,  3 Apr 2023 09:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5DF10E3C1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 09:23:16 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id c29so37195438lfv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 02:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680513795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EtVCC2sqWX4+Mq7NALEB6lzAsKnEhdcOZVvmQOHFlmQ=;
 b=kXMdJu1oAz8RkogNiaVcVQDXkkx4aNY71D7RyXS48H+GY24cmyLbnkcV3xjDNIUOMu
 YM4+OJ4Y3JCyCJ7PfnoieHT4Zx6axj4Ni7UibcGTPyos+mPiLGiV9KRjswoCOUVYbyZ2
 hlm0jvyBKZxgvwF4fhgFlCqBP0cJeQ87/l1X6fL6NqY3jnJmJPEq+ii493oyDsXtwVyu
 QB21FyNOwz10DoaA/cUduMRv+gfarb+hOOzmjbRBDnLTzITekAB8kyOGCsW9BJqPM7Cc
 dQlsd4yI12kyqrWl6eyjKE6mvyoWoH0+dG4eL0D2DVpq1nWopt+lFal957MmLxtMcM6Q
 Bv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680513795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EtVCC2sqWX4+Mq7NALEB6lzAsKnEhdcOZVvmQOHFlmQ=;
 b=ZpvH3sgkL53RxxmzdgqpNFChPsHm3/BTFLFpsXOnTUsUvdti0OOIsjMyZ4DuXyspx8
 6a1NBN1Jwbja676zn4UewiiOzIjftNNLPRk+CtV6vNEInExRXAH/g7/HOyAqHFmt7lHk
 E4AOCSG8TuhBUNawFhJXlh8Y+arZ3XYGSr8Bw7XXpNatdS4T7IrVPy0qBXFnaOa7FSi8
 +VOeHrKZRf409YsgfNEN0obHiKhcLC8gtQHf4TvPge6GdI2pRHlYNZqAvc3WLEUu+C6Q
 B3NbxjlCbeQ0EmoOMiLY/CcqYP6ivBodK9UzRvm/W+4VaGpELhJB6WBtLf+Z0kGwmXcp
 AhkQ==
X-Gm-Message-State: AAQBX9cTzu3f0QO2t3Cbdu5bNfxhSyUgpEq+sS2i3vSmJVVRwFZRXx8l
 pPsqREpXxj9BbQVRz4ODntR4pw==
X-Google-Smtp-Source: AKy350bEt/pfhDifVSZGPSEQacf0JBsmuuJnexEOmvGWwSWTvHA8VDI7eTjKMhCWHM6t7dah0Unxzw==
X-Received: by 2002:ac2:5613:0:b0:4ea:f7be:e071 with SMTP id
 v19-20020ac25613000000b004eaf7bee071mr9687585lfd.46.1680513794690; 
 Mon, 03 Apr 2023 02:23:14 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w5-20020ac25985000000b004e844bb6939sm1680666lfn.2.2023.04.03.02.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 02:23:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 00/12] drm/i915: move DSC RC tables to drm_dsc_helper.c
Date: Mon,  3 Apr 2023 12:23:01 +0300
Message-Id: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Other platforms (msm) will benefit from sharing the DSC config setup
functions. This series moves parts of static DSC config data from the
i915 driver to the common helpers to be used by other drivers.

Note: the RC parameters were cross-checked against config files found in
DSC model 2021062, 20161212 (and 20150914). The first patch modifies
tables according to those config files, while preserving parameter
values using the code. I have not changed one of the values in the
pre-SCR config file as it clearly looks like a typo in the config file,
considering the table E in DSC 1.1 and in the DSC 1.1 SCR.

Chances since v3:
- Rebased on top of drm-intel-next
- Dropped the msm patch to make patchset fully mergeable through
  drm-intel
- Made drm_dsc_set_const_params() ignore rc_model_size, picked up
  drm_dsc_set_initial_scale_value() patch by Jessica and switched
  intel_vdsc.c to use those two helpers.
- Added a patch to make i915 actually use rc_tgt_offset_high,
  rc_tgt_offset_low and rc_edge_factor from struct drm_dsc_config.

Chances since v2:
- Rebased on top of drm-intel-next

Chances since v1:
- Made drm_dsc_rc_buf_thresh static rather than exporting it
- Switched drm_dsc_rc_buf_thresh loop to use ARRAY_SIZE. Added
  BUILD_BUG_ON's to be sure that array sizes are correct
- Fixed rc_parameters_data indentation to be logical and tidy
- Fixed drm_dsc_setup_rc_params() kerneldoc
- Added a clause to drm_dsc_setup_rc_params() to verify bpp and bpc
  being set.
- Fixed range_bpg_offset programming in calculate_rc_params()
- Fixed bpp vs bpc bug in intel_dsc_compute_params()
- Added FIXME comment next to the customizations in
  intel_dsc_compute_params().

Dmitry Baryshkov (11):
  drm/i915/dsc: change DSC param tables to follow the DSC model
  drm/i915/dsc: move rc_buf_thresh values to common helper
  drm/i915/dsc: move DSC tables to DRM DSC helper
  drm/i915/dsc: stop using interim structure for calculated params
  drm/display/dsc: use flat array for rc_parameters lookup
  drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
  drm/display/dsc: include the rest of pre-SCR parameters
  drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters
  drm/display/dsc: add helper to set semi-const parameters
  drm/i915/dsc: use additional DSC helpers
  drm/i915/dsc: make use of several params from drm_dsc_config

Jessica Zhang (1):
  drm/display/dsc: Add flatness and initial scale value calculations

 drivers/gpu/drm/display/drm_dsc_helper.c  | 1008 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c |  464 ++--------
 include/drm/display/drm_dsc_helper.h      |   21 +
 3 files changed, 1081 insertions(+), 412 deletions(-)

-- 
2.39.2

