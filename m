Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0344A55F6F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 05:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E450410EABF;
	Fri,  7 Mar 2025 04:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s+HhjOhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25EA10E0B8;
 Fri,  7 Mar 2025 04:35:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 703115C5BCA;
 Fri,  7 Mar 2025 04:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F21C4CED1;
 Fri,  7 Mar 2025 04:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741322093;
 bh=XqzhyeJqcijzc1zEWnFHc8CXWW9TaUwdVzABORTsWzg=;
 h=From:Subject:Date:To:Cc:From;
 b=s+HhjOhSqHORZRdCgtb8Vrv/rRuiWnb96ZQPANjE1MyLwf3qdFWc2jI5VqiZa8eLB
 rD1b7oK29o0X37aFgrq8IN7nhINe9omVacWzB1cRMkwuo/SdpjKFNyeexIIPWkrzvB
 6ETBorUlap+aEeFVdMzQs9lrybWuEK8ArkvbW48OaEc6E9wMJYRWulm31uDNeZGiR0
 LwuAYUWGW/uDhdQZUGNrZ4xjC81nKYrfrCmTW8kPQWKaPG6l+nZGBVZ7gj4l1EByIT
 f8d4wcY/gZVqdKMs/XKdc7OXjzmKrTaJBsNyBunLaPyoVNRZWA6moIo3coTUSjn4BF
 2Y+dPoHVcvD4w==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH RFC v3 0/7] drm/display: dp: add new DPCD access functions
Date: Fri, 07 Mar 2025 06:34:42 +0200
Message-Id: <20250307-drm-rework-dpcd-access-v3-0-9044a3a868ee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJ3ymcC/3XOwQrCMAwG4FeRnq2k2dzQkyD4AF7Fw5ZmW1HXk
 UpVxt7dsot42PFP+L9kVIHFcVD71aiEowvO9ylk65Wirupb1s6mrBAwN5gZbeWhhV9ebtoOZHV
 FxCHoGhpCzktbmEyl8iDcuPcMX9T5dFTXNOxceHr5zMeimVfJ3YIx5ZIbjQZdNgQIDLmt6XB3f
 SV+46WdzYg/J4PF/yImJ7c7LAAbKsn+OdM0fQEd0r1rCgEAAA==
X-Change-ID: 20241231-drm-rework-dpcd-access-b0fc2e47d613
To: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2883;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XqzhyeJqcijzc1zEWnFHc8CXWW9TaUwdVzABORTsWzg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyndlMsf/JrFPSmdbYWWLvhwHDkT/ieTkTXN9/
 lqE5dH+wNGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8p3ZQAKCRCLPIo+Aiko
 1aKhCACjQw5F7YO5gtzvIHSaGtZo4Y/5aGzxeTxD0OMUp/5hT2oTXrms082iYP0AiH6KDcY4cRH
 cd3zg/fRgPvw+3Pnwe88wo/9F9RGhnuyAzfT+b76GOoq3qiO6xws9hNIM/+p+uQ0quL67unGB7/
 8PJc5scnCbK2hQcuNiYvuD2+Zy3SQn2wz4LaZHuLOo9WrMlIpiwz0iFIaXWJPG0nfCgYTbp15g3
 A0mofYnAkZSoMSG4BUHj4Wje+l7WpPdL2AD9Pd1BYoFabjJX6gnm2HhidAkS7cXc4tU7/onNjrc
 2IRbVF+vSZdWm+C9yJ/TubcGS1ZPe8N0m4SoukasvViWrDel
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Existing DPCD access functions return an error code or the number of
bytes being read / write in case of partial access. However a lot of
drivers either (incorrectly) ignore partial access or mishandle error
codes. In other cases this results in a boilerplate code which compares
returned value with the size.

As suggested by Jani implement new set of DPCD access helpers, which
ignore partial access, always return 0 or an error code. Implement
new helpers using existing functions to ensure backwards compatibility
and to assess necessity to handle incomplete reads on a global scale.
Currently only one possible place has been identified, dp-aux-dev, which
needs to handle possible holes in DPCD.

This series targets only the DRM helpers code. If the approach is found
to be acceptable, each of the drivers should be converted on its own.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Fixed cover letter (Jani)
- Added intel-gfx and intel-xe to get the series CI-tested (Jani)
- Link to v2: https://lore.kernel.org/r/20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org

Changes in v2:
- Reimplemented new helpers using old ones (Lyude)
- Reworked the drm_dp_dpcd_read_link_status() patch (Lyude)
- Dropped the dp-aux-dev patch (Jani)
- Link to v1: https://lore.kernel.org/r/20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org

---
Dmitry Baryshkov (7):
      drm/display: dp: implement new access helpers
      drm/display: dp: change drm_dp_dpcd_read_link_status() return value
      drm/display: dp: use new DCPD access helpers
      drm/display: dp-aux-dev: use new DCPD access helpers
      drm/display: dp-cec: use new DCPD access helpers
      drm/display: dp-mst-topology: use new DCPD access helpers
      drm/display: dp-tunnel: use new DCPD access helpers

 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |   8 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   2 +-
 drivers/gpu/drm/display/drm_dp_aux_dev.c           |  12 +-
 drivers/gpu/drm/display/drm_dp_cec.c               |  37 ++-
 drivers/gpu/drm/display/drm_dp_helper.c            | 307 +++++++++------------
 drivers/gpu/drm/display/drm_dp_mst_topology.c      | 105 ++++---
 drivers/gpu/drm/display/drm_dp_tunnel.c            |  20 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c       |   4 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  24 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  18 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |   8 +-
 include/drm/display/drm_dp_helper.h                |  92 +++++-
 12 files changed, 322 insertions(+), 315 deletions(-)
---
base-commit: 565351ae7e0cee80e9b5ed84452a5b13644ffc4d
change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

