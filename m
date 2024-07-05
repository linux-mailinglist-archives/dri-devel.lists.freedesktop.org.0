Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4368D928720
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C151910E16A;
	Fri,  5 Jul 2024 10:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GF3A7R2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8A510EAB1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:53:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4265267db01so395975e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 03:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720176822; x=1720781622; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nPaLzRHyMO7fheB48bkwp+Y0j4OZdMsIVUFYWAvW8mE=;
 b=GF3A7R2ubVJFuvqZaSHNaJ2ZM4Z+XYTnf6m8R2NMWodBXMls5wnf8Yy1PwzJNsELrh
 tjv7YTDo40UOF91SNzpGg10blNgXYGRKkX/I0uVCExEpWvZhfv2c+Hy5IIkj4Yal+/qS
 Da9efRYzM5m7ImZ4o6AdvbysjNU+PWJUNL/ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720176822; x=1720781622;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nPaLzRHyMO7fheB48bkwp+Y0j4OZdMsIVUFYWAvW8mE=;
 b=nlGeh+iep1XsZMV17kq5q5WkI9YXMOI0y/CZrq0y/1ngebLtSRxHudYz2GhImCrZy1
 LOGhCqaBG4wLAYw3pek/IuuWc9zOPXilH9kGnn2Ps5muSFNhi1NIrMEiBD2fUIKP+2iJ
 Yq5FZY6ke++y+whR2fQ6p1BVTGA6GgPmOYWSV3+mLs6DWFYf4FMw38HqjHRPQSJcOSh/
 yPXtW8pMFVUmeYFsUoXoUqoJmNo3lXtC2m6Yt2geQ373Ro0SQ4GEvZwOwUoYOdEyp9Xl
 /rzLCt/uVDZnlzwVqI7lXJ8LqqKsjX9RcqhqBQlTkpBX1E6bMLPFi9IaUlXKg6DCqCed
 55bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCzOOzPDINbpDkla1y5wPq7mEamWKuDNV8xKdkHV3FY3sKq3At+VuxzAiOTMglbJkl38PSrGMvFhEJZQk++FKp9sC6BIBqREratFObDsmp
X-Gm-Message-State: AOJu0Ywzm4qqsB0C6cH/8XqcaZORxQLbsCfsEJIFYhFS7Sng27cQpAfZ
 kNnWYEh+sRWqO85u12sTGRRIlMTkMozmsIL9Gm/LTBJBgOWadabIs/vtM+s4Kcg=
X-Google-Smtp-Source: AGHT+IGwbA+5Nba6wqmsyP+zBhPGQAJWRUedfb0m14SOM4RDLwwrsjacVIQ6QbBF5I3SMiaMv1+wag==
X-Received: by 2002:a5d:6da8:0:b0:362:4aac:8697 with SMTP id
 ffacd0b85a97d-3679db7dbdamr3248107f8f.0.1720176821633; 
 Fri, 05 Jul 2024 03:53:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3679887d58fsm4771469f8f.42.2024.07.05.03.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 03:53:41 -0700 (PDT)
Date: Fri, 5 Jul 2024 12:53:39 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [pull] drm/msm: drm-msm-next-2024-07-04 for v6.11
Message-ID: <ZofQs0EOxVXOYKMj@phenom.ffwll.local>
References: <CAF6AEGvZQpYEHpSCgXGJ2kaHJDK6QFAFfTsfiWm4b2zZOnjXGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvZQpYEHpSCgXGJ2kaHJDK6QFAFfTsfiWm4b2zZOnjXGw@mail.gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Thu, Jul 04, 2024 at 08:48:18AM -0700, Rob Clark wrote:
> Hi Dave, Sima,
> 
> This is the main pull for v6.11.  It includes a merge of the immutable
> tag qcom/20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com to pick
> up dependencies for raytracing and SMEM speedbin.
> 
> Further description below.
> 
> The following changes since commit 92815da4576a495cb6362cdfb132152fccc2222d:
> 
>   Merge remote-tracking branch 'drm-misc/drm-misc-next' into HEAD
> (2024-06-12 16:52:39 +0300)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-07-04
> 
> for you to fetch changes up to fe34394ecdad459d2d7b1f30e4a39ac27fcd77f8:

Pulled, thanks.

>   dt-bindings: display/msm: dsi-controller-main: Add SM7150
> (2024-07-03 05:57:35 -0700)
> 
> ----------------------------------------------------------------
> Updates for v6.11
> 
> Core:
> - SM7150 support
> 
> DPU:
> - SM7150 support
> - Fix DSC support for DSI panels in video mode
> - Fixed TE vsync source support for DSI command-mode panels
> - Fix for devices without UBWC in the display controller (ie.
>   QCM2290)
> 
> DSI:
> - Remove unused register-writing wrappers
> - Fix DSC support for panels in video mode
> - Add support for parsing TE vsync source
> - Add support for MSM8937 (28nm DSI PHY)
> 
> MDP5:
> - Add support for MSM8937
> - Fix configuration for MSM8953
> 
> GPU:
> - Split giant device table into per-gen "hw catalog" similar to
>   what is done on the display side of the driver
> - Fix a702 UBWC mode
> - Fix unused variably warnings
> - GPU memory traces

Stumbled over this and it feels a bit hilarious ... merged 4 years ago
with bbd9d05618a6 ("gpu/trace: add a gpu total memory usage tracepoint").
Only now the first driver, and we don't even have uapi docs for this ...

I think a little bit more actual consensus engineering like pepp is trying
to do now for gpu tracing would be good.

Cheers, Sima

> - Add param for userspace to know if raytracing is supported
> - Memory barrier cleanup and GBIF unhalt fix
> - X185 support (aka gpu in X1 laptop chips)
> - a505 support
> - fixes
> 
> ----------------------------------------------------------------
> Abhinav Kumar (3):
>       drm/msm/a6xx: use __unused__ to fix compiler warnings for gen7_* includes
>       drm/msm/dpu: drop validity checks for clear_pending_flush() ctl op
>       drm/msm/dpu: check ubwc support before adding compressed formats
> 
> Akhil P Oommen (3):
>       dt-bindings: display/msm/gmu: Add Adreno X185 GMU
>       drm/msm/adreno: Add support for X185 GPU
>       drm/msm/adreno: Introduce gmu_chipid for a740 & a750
> 
> Barnabás Czémán (4):
>       drm/msm/dpu: guard ctl irq callback register/unregister
>       drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
>       dt-bindings: display/msm: qcom, mdp5: Add msm8937 compatible
>       dt-bindings: msm: dsi-phy-28nm: Document msm8937 compatible
> 
> Connor Abbott (5):
>       firmware: qcom: scm: Add gpu_init_regs call
>       firmware: qcom_scm: Add gpu_init_regs call
>       drm/msm/a7xx: Initialize a750 "software fuse"
>       drm/msm: Add MSM_PARAM_RAYTRACING uapi
>       drm/msm/a7xx: Add missing register writes from downstream
> 
> Daniil Titov (3):
>       drm/msm/mdp5: Add MDP5 configuration for MSM8937
>       drm/msm/dsi: Add phy configuration for MSM8937
>       drm/msm/adreno: Add support for Adreno 505 GPU
> 
> Danila Tikhonov (5):
>       dt-bindings: display/msm: Add SM7150 DPU
>       drm/msm/dpu: Add SM7150 support
>       dt-bindings: display/msm: Add SM7150 MDSS
>       drm/msm: mdss: Add SM7150 support
>       dt-bindings: display/msm: dsi-controller-main: Add SM7150
> 
> Dmitry Baryshkov (9):
>       dt-bindings: display/msm/dsi: allow specifying TE source
>       drm/msm/dpu: convert vsync source defines to the enum
>       drm/msm/dsi: drop unused GPIOs handling
>       drm/msm/dpu: pull the is_cmd_mode out of
> _dpu_encoder_update_vsync_source()
>       drm/msm/dpu: rework vsync_source handling
>       drm/msm/dsi: parse vsync source from device tree
>       drm/msm/dpu: support setting the TE source
>       drm/msm/dpu: rename dpu_hw_setup_vsync_source functions
>       drm/msm/dpu: remove CRTC frame event callback registration
> 
> Jani Nikula (1):
>       drm/msm/dp: switch to struct drm_edid
> 
> Jonathan Marek (4):
>       drm/msm/dpu: fix video mode DSC for DSI
>       drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
>       drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
>       drm/msm/dsi: add a comment to explain pkt_per_line encoding
> 
> Jun Nie (2):
>       drm/msm/dpu: adjust data width for widen bus case
>       drm/msm/dpu: enable compression bit in cfg2 for DSC
> 
> Konrad Dybcio (7):
>       drm/msm/a6xx: Fix A702 UBWC mode
>       soc: qcom: Move some socinfo defines to the header
>       soc: qcom: smem: Add a feature code getter
>       drm/msm/dsi: Remove dsi_phy_read/write()
>       drm/msm/dsi: Remove dsi_phy_write_[un]delay()
>       drm/msm/adreno: De-spaghettify the use of memory barriers
>       Revert "drm/msm/a6xx: Poll for GBIF unhalt status in hw_init"
> 
> Krzysztof Kozlowski (4):
>       dt-bindings: display/msm/gpu: constrain clocks in top-level
>       dt-bindings: display/msm/gpu: define reg-names in top-level
>       dt-bindings: display/msm/gpu: simplify compatible regex
>       dt-bindings: display/msm/gpu: fix the schema being not applied
> 
> Neil Armstrong (2):
>       drm/msm/adreno: fix a7xx gpu init
>       drm/msm/adreno: fix a743 and a740 cx mem init
> 
> Rob Clark (11):
>       drm/msm/adreno: Split up giant device table
>       drm/msm/adreno: Split catalog into separate files
>       drm/msm/adreno: Move hwcg regs to a6xx hw catalog
>       drm/msm/adreno: Move hwcg table into a6xx specific info
>       drm/msm/adreno: Move CP_PROTECT settings to hw catalog
>       drm/msm: Add GPU memory traces
>       drm/msm: Add obj flags to gpu devcoredump
>       drm/msm/adreno: Check for zap node availability
>       Merge remote-tracking branch
> 'qcom/20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com' into
> msm-next-robclark
>       drm/msm/a6xx: Add missing __always_unused
>       drm/msm/gem: Add missing rcu_dereference()
> 
>  .../bindings/display/msm/dsi-controller-main.yaml  |   19 +
>  .../bindings/display/msm/dsi-phy-28nm.yaml         |    1 +
>  .../devicetree/bindings/display/msm/gmu.yaml       |    4 +
>  .../devicetree/bindings/display/msm/gpu.yaml       |   27 +-
>  .../devicetree/bindings/display/msm/qcom,mdp5.yaml |    1 +
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml |    1 +
>  .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  143 +++
>  .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  458 +++++++
>  drivers/firmware/qcom/qcom_scm.c                   |   14 +
>  drivers/firmware/qcom/qcom_scm.h                   |    3 +
>  drivers/gpu/drm/msm/Kconfig                        |    1 +
>  drivers/gpu/drm/msm/Makefile                       |    5 +
>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |   52 +
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   81 ++
>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |   50 +
>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |  161 +++
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   29 +-
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 1259 ++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   38 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  995 ++--------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   12 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   13 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c         |  624 +---------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    6 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   44 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  335 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   25 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |    2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   57 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   15 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |    8 +
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    4 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   21 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |    3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |    3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   19 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |    5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   26 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |    2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   45 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |    7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |    4 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |   91 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                |   11 +-
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |   47 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |    2 +-
>  drivers/gpu/drm/msm/dsi/dsi.h                      |    1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c                 |   59 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              |    5 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |    2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    6 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |  273 ++---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  218 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c         |  109 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |  323 ++---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |  205 ++--
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  320 +++--
>  drivers/gpu/drm/msm/msm_drv.h                      |   11 +
>  drivers/gpu/drm/msm/msm_gem.c                      |   37 +
>  drivers/gpu/drm/msm/msm_gpu.c                      |    6 +-
>  drivers/gpu/drm/msm/msm_gpu.h                      |    9 +
>  drivers/gpu/drm/msm/msm_mdss.c                     |    8 +
>  drivers/soc/qcom/smem.c                            |   33 +
>  drivers/soc/qcom/socinfo.c                         |    8 -
>  include/linux/firmware/qcom/qcom_scm.h             |   23 +
>  include/linux/soc/qcom/smem.h                      |    1 +
>  include/linux/soc/qcom/socinfo.h                   |   34 +
>  include/uapi/drm/msm_drm.h                         |    1 +
>  71 files changed, 4011 insertions(+), 2470 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
>  create mode 100644
> Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
>  create mode 100644 drivers/gpu/drm/msm/adreno/a2xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a4xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a5xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
