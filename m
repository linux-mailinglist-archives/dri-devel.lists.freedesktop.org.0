Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59C6802383
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77EB10E2B2;
	Sun,  3 Dec 2023 11:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B6A10E2B2
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:53:18 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9f62fca3bso8690311fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701604397; x=1702209197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p+lPohBi/ZxoOWEwMqklXE78q3N8omeUQljRY/SKmPA=;
 b=fjRn1iyZqPINLzcee4IfVTKbfo4G3Mm6WelcrFa9Xw7r1uKCsl97VCqKT5c6zBg1Ui
 zBuKO/+tHHQNAKbX9o3C2ohNkc9lm2VMoKp/ARJv8VMKUdHNxn4sza4lXxvJKCXQhvnr
 ea8TLkJ6Uhwd4FiVst0G3AlNLvsQ+UBSqJUBKOfvZDQbVQOqYh6Rk0LXLtQUMZ3kP77R
 RiAWretnIjoPWP2ZvPusIYDImT6Lqb+rpV0SJqZVCO1Ibh/zRe4qGOyNTrk4E8xTloA8
 oiO3YSPNDLtF1eEjpnkXl8uYO/4530SvVxcSU1Et+g77HXRbhztGlreFjRMbK3Ha6xxD
 UZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701604397; x=1702209197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p+lPohBi/ZxoOWEwMqklXE78q3N8omeUQljRY/SKmPA=;
 b=CKx/dhoNQ+FKBOCJRa+ltb8iAILXU72H/vG+0jE+wmZ2eRD+34j9IsyrE5/Aw3iMwS
 4vcVORp2/yr4bUjP55R2SJcsXtyh8sJbfC58LG1J6YG7/yCRYmv0JAV/cTnWSmE3lR7O
 6XSsGB90jtw4v2b+n+Lp5AWbUtO6EdcIWijcArb8vXRp8k7NI1gD7Q2/ZS3+RjmxsPwv
 SPynqBa2GqfW+tDbMnaoigsXA2/7nnHt0BpY3Na863Thuo49sVSQg2YSJcV+o0PJK970
 Q1yKuyQwWMG/CqDFN1c4qkKu2ldmuRaWBe+q/yOZVCLDGYBzU0zozaTTErAmxvdYYgpX
 0Uuw==
X-Gm-Message-State: AOJu0YyA/3D04UZPfMXDjz78zpOAp/cLd0t+mgvO8BMGFu+zDEL00BtG
 NY42ByCUVWHvE5ceXtLyQljhbQ==
X-Google-Smtp-Source: AGHT+IEX8KqcCeITGDqjCPGan5WOV95qsQaT/IZAMSQd/9QNkAU6y90+zhFGlVygmZEqaicsSHKynQ==
X-Received: by 2002:a2e:381a:0:b0:2c9:caf4:18b0 with SMTP id
 f26-20020a2e381a000000b002c9caf418b0mr1904893lja.41.1701604396691; 
 Sun, 03 Dec 2023 03:53:16 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a2e9645000000b002c9c21d01c2sm900437ljh.101.2023.12.03.03.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:53:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND v2 0/3] drm: introduce per-encoder debugfs directory
Date: Sun,  3 Dec 2023 14:53:12 +0300
Message-Id: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resending, patch 1 needs review from DRM core maintainers, but it got no
attention since October.

Each of connectors and CRTCs used by the DRM device provides debugfs
directory, which is used by several standard debugfs files and can
further be extended by the driver. Add such generic debugfs directories
for encoder. As a showcase for this dir, migrate `bridge_chains' debugfs
file (which contains per-encoder data) and MSM custom encoder status to
this new debugfs directory.

Changes since v1:
- Brought back drm_printer usage to bridges_show (Tomi Valkeinen)
- Updated the drm/bridge commit message to reflect format changes (Tomi
  Valkeinen)

Dmitry Baryshkov (3):
  drm/encoder: register per-encoder debugfs dir
  drm/bridge: migrate bridge_chains to per-encoder file
  drm/msm/dpu: move encoder status to standard encoder debugfs dir

 drivers/gpu/drm/drm_bridge.c                | 44 --------------
 drivers/gpu/drm/drm_debugfs.c               | 65 ++++++++++++++++++++-
 drivers/gpu/drm/drm_encoder.c               |  4 ++
 drivers/gpu/drm/drm_internal.h              |  9 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 ++------------
 include/drm/drm_bridge.h                    |  2 -
 include/drm/drm_encoder.h                   | 16 ++++-
 7 files changed, 96 insertions(+), 89 deletions(-)

-- 
2.39.2

