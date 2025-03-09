Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC3AA58180
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 09:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EACE10E2FC;
	Sun,  9 Mar 2025 08:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mFHjYm2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AC210E2F8;
 Sun,  9 Mar 2025 08:14:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 53C30A458F0;
 Sun,  9 Mar 2025 08:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42974C4CEE5;
 Sun,  9 Mar 2025 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741508043;
 bh=9BlOFXAcL52pqaOXhKgnjzByr6uM1wVuOwRZXNaUb5U=;
 h=From:Subject:Date:To:Cc:From;
 b=mFHjYm2yvmooa7VfxOxgsAscGInvMY323dYDX60lY26eCBThxwGaL0HW2fKbanbpc
 ELX3fBT2vf/s56edwOmnZs0z9/MTlrwW1A5Q/r/MSs9eVdojUpjjd4+YhBoLlck3aV
 L7Ix0QXLrTSo4NoEIbepg6xcXaPrxcBaXo39f0wNjT3cXy1s22LEAP8Nqr937qrrgf
 Nw39hEHX8ZinCGx75RxxirHedc6Gm54rstKIgVbRSCO3mnC6He9HO6cXt9xlbPao8w
 LZg4kvVmsXD+hhFbRTQZXOBZ4VHADAk4Bj7SbEjKzt/oYf64N6VOGqhNlJXASBKBds
 5baqpIPnQhTxQ==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 0/4] drm/display: hdmi: provide common code to get Audio
 Clock Recovery params
Date: Sun, 09 Mar 2025 10:13:55 +0200
Message-Id: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMNNzWcC/x3MMQqAMAxA0atIZgNpRRSvIg6lSTWDVVIQQby7x
 fEN/z9QxFQKTM0DJpcWPXKFaxuIW8iroHI1ePI9dTQi244b74ohGg6BXSIm5zlBTU6TpPe/m5f
 3/QAV9Dc7XgAAAA==
X-Change-ID: 20250308-drm-hdmi-acr-7ad1f0d012df
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9BlOFXAcL52pqaOXhKgnjzByr6uM1wVuOwRZXNaUb5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnzU3Gy7L1n0F+9PZnSM8l3ElHgqHAXY9nQIo/u
 R01KQwreQWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ81NxgAKCRCLPIo+Aiko
 1aKeB/95KJqQpYAAWap+VHmraWFLscqQJ7F7hm5jYkVoocd3/6Yk08Xc56MZByxJYoH748BXYxk
 WrPZDf/487GWfes9Iib7OVFPjn2lCecJtXZCoqqMHxQMjmFyx66Lg4kdW4IvEBeYl/QRWEQyXaj
 vveEHUUTNJAU/BGSwoVUhU5PrcF4w9QQbNrBya+6RgXnmJqLlHZsoVnOPt7IV/mmtuEZX6OY6qN
 GM0JZrUNZ7QgYnRL24Xv8HS9QG1mJlSty1hHH1GV2rE9I8Bsya6QtAyQNUvqR7GTjSrE+zuTa5/
 5HUneJNp8V74RgjTPA00gtFKGb1tCZ9qK6ZHMkfm72vNSLUJ
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

HDMI standards define a recommended set of values to be used for Audio
Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
implements its own way to determine those values. Implement a common
helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
only) drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      drm/display: hdmi: provide central data authority for ACR params
      drm/msm/hdmi: use new helper for ACR tables
      drm/vc4: use new helper to get ACR values
      drm: bridge: dw-hdmi: use new helper to get ACR values

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  90 ++--------------
 drivers/gpu/drm/display/drm_hdmi_helper.c | 164 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c     | 107 ++-----------------
 drivers/gpu/drm/vc4/vc4_hdmi.c            |  10 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h            |   7 ++
 include/drm/display/drm_hdmi_helper.h     |   6 ++
 6 files changed, 197 insertions(+), 187 deletions(-)
---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250308-drm-hdmi-acr-7ad1f0d012df

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

