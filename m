Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B3BA91183
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 04:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9C410E099;
	Thu, 17 Apr 2025 02:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KMa2WvG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A445A10E099;
 Thu, 17 Apr 2025 02:13:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so140717f8f.0; 
 Wed, 16 Apr 2025 19:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744856032; x=1745460832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Glni7Ctegs0Uy0pmEHCLGfEY/faO7Dp8uDE4yyi7B7E=;
 b=KMa2WvG81pOb+hbpbmL93lrQcwhdEbQbavbhhUeQa6qkkU6YMgRm9OBxH3gY48vPyG
 0gUppuO66HUoa8haj1pIUhlTBgc1mgxIokURI9Hd97uvmp1jY8JAB8BX52hMs03X0/rt
 ZEeoQi07Ihv0obPVeFZE3Um729zzyUAsWcEhHzWxP8IYrNvnhPHqSYJ/GG0Agmw6+ptS
 ojqCTJuniFxFzEkV77a10Uc4UaCgzsPlBUlasy79kqsQNVhywZHB2J1fhfJiZbg9gkTN
 dgoXjue1zfIolEwBU7zeMI+4bgiXpmNqBtaF3WOJlPbzkgKwtK2PDaf5pDIfyBLEQom3
 ZRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744856032; x=1745460832;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Glni7Ctegs0Uy0pmEHCLGfEY/faO7Dp8uDE4yyi7B7E=;
 b=sdE73V9npsX03GGatdoGHxLMDRUD7CWE+jS9j/MFP0CAJ4PmzEci1zXlfzqYihBiru
 frf8DyikYdJkmh3AcNCo7zYj6ebGj28sgf6GhSW2ucgeELFc2VCsJ47UOp8GupTYsKF3
 GwoMZXHMsaAN5zqlh6r+qchTujNE3IkGHnyqgzrIpjId4UI4aZqOrimy/ad/5OmV2A2J
 6l0qUbDJa20ks0wmV1p42IsWTy+Ekrq70i62AcU7maRvCkwPRBGIgakwez6O5//iePE1
 ZpKgZOleDbHQ0/iXylZqC4SRpkAwoG18L4bcdtDXFZSGMCICyNoo2fWbqhPt81Aqex0W
 kW2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcBrsM9cHrk9jWf/AkQ98ESpctLeYVVglpq2evaVd0yxHJpUAaR+bTnEE30nEuAnFdP30VGAXbSd8=@lists.freedesktop.org,
 AJvYcCWynziyammoiZCNAhmxh+Kzv/A5XfmVXKfaaNyeGR/xezXvRXJO6AxI/3R/zFQU2C97j0h7I91WH2vY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVYLq1+LcZZ6lOE9UnozLXXRpia1+/cNZrWEuBbMAtDsj8Zole
 RzebDOc9nxVmYRP6OdM6A26aaTdl0tPxeiycs52oXrjLoDxJKL0=
X-Gm-Gg: ASbGncs7JoFu/8wAHUJvpXy7t7H+2CGRAgm0xBFtIwQaHxHD/drpGy/qcfrPkG7niyU
 YV1hZzeWmdOdknbVms5NmeUPBrb3VomMuuYuDDP6dQS71u+v1K5zYK9m2dAOJYckUoEzSQTtsJb
 Id+gUB+E5Xxah8vMq3noyYfPNJcZH32FN6lkdqowcuq+SsokyBEijMKvD8i2lZ1922gZMVDn1Y6
 NyNyCZO0FreEc8OpnBRWn3PF4XKGDiTLSt8gUrdpsgwj5e7ogReRrHwVgqzCzGfzGfg9PqZkXi7
 yGzTARjxgMYj5TzTFKfbCXmUYo0S+DctEN0D1fyb810Whw==
X-Google-Smtp-Source: AGHT+IF6yRq9L3wSEJqVWwemj1Z9rNAIRILp+bcwijkxSF4HMMr/lypABvlcr6xh1EKHH98BRkJuqg==
X-Received: by 2002:a5d:64ae:0:b0:39c:11c0:eb98 with SMTP id
 ffacd0b85a97d-39ee5b9f651mr3707652f8f.39.1744856031791; 
 Wed, 16 Apr 2025 19:13:51 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4d1236sm36940485e9.13.2025.04.16.19.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 19:13:51 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: drm/msm/dp: Introduce link training per-segment for LTTPRs
Date: Thu, 17 Apr 2025 04:10:31 +0200
Message-ID: <20250417021349.148911-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
to non-transparent mode to enable video output on X1E-based devices
that come with LTTPR on the motherboards. However, video would not work
if additional LTTPR(s) are present between sink and source, which is
the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).

First, take into account LTTPR capabilities when computing max link
rate, number of lanes. Take into account previous discussion on the
lists - exit early if reading DPCD caps failed. This also fixes
"*ERROR* panel edid read failed" on some monitors which seems to be
caused by msm_dp_panel_read_sink_caps running before LTTPR(s) are
initialized.

Finally, implement link training per-segment. Pass lttpr_count to all
required helpers.
This seems to also partially improve UI (Wayland) hanging when
changing external display's link parameters (resolution, framerate):
* Prior to this series, via direct USB Type-C to display connection,
  attempt to change resolution or framerate hangs the UI, setting does
  not stick. Some back and forth replugging finally sets desired
  parameters.
* With this series, via direct USB Type-C to display connection,
  changing parameters works most of the time, without UI freezing. Via
  docking station/multiple LTTPRs the setting again does not stick.
* On Xorg changing link paramaters works in all combinations.

These appear to be mainlink initialization related, as in all cases LT
passes successfully.

Test matrix:
* Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
          Type-C to HDMI dongle, USB Type-C to DP dongle
	* Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
	  monitor per USB Type-C connector)
* Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection
	* Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
          Thunderbolt/USB Type-C, probes with an LTTPR when in USB
          Type-C/DP Alt mode)
* Dell XPS 9345, Debian trixie/sid, Gnome 48, Wayland (Stefan Schmidt)
        * Left USB Type-C, Right USB Type-C
        * Dell WD15 Dock with DisplayPort connected
        * Dell HD22Q dock with HDMI connected
        * USB Type-C to HDMI dongle
        * Dell U3417W

In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled
in UEFI to force universal Thunderbolt/USB Type-C devices to work in
DP Alt mode.
In both cases laptops had HBR3 patches applied [1], resulting in
maximum successful link at 3440x1440@100hz and 4k@60hz respectively.
When using Dell WD22TB4/U2725QE, USB Type-C pin assigment D got enabled
and USB3.0 devices were working in parallel to video ouput.

Known issues:
* As mentioned above, it appears that on Gnome+Wayland framerate and
  resolution parameter adjustment is not stable.

Due to lack of access to the official DisplayPort specfication, changes
were primarily inspired by/reverse engineered from Intel's i915 driver.

[1] https://lore.kernel.org/all/20250226231436.16138-2-alex.vinarskis@gmail.com/

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

---

Changes in v3:
- Split 1st patch into 3
- Simplified handling of max_lttpr_lanes/max_lttpr_rate
- Moved lttpr_common_caps to msm_dp_link (not msm_dp_panel, as LTTPRs
  are link related, not panel related)
- Picked Stefan's T-b tag (last patch only, as 1st one is getting split)
- Droped Abel's R-b tags from 1st patch that got split due to high diff
- Fixed alignment issues, initialization of variables, debug prints
- Moved lttpr_count to avoid ugly pointer
- Link to v2: https://lore.kernel.org/all/20250311234109.136510-1-alex.vinarskis@gmail.com/

Changes in v2:
- Picked up Abel's R-b tags
- Fixed typo as per Abel, fixed readability as per Johan
- Updated cover and commit message on mailink issue which appears to be 
  specific to Gnome+Wayland. No problems on Xorg.
- Link to v1: https://lore.kernel.org/all/20250310211039.29843-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (4):
  drm/msm/dp: Fix support of LTTPR initialization
  drm/msm/dp: Account for LTTPRs capabilities
  drm/msm/dp: Prepare for link training per-segment for LTTPRs
  drm/msm/dp: Introduce link training per-segment for LTTPRs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 126 ++++++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.c |  27 ++++--
 drivers/gpu/drm/msm/dp/dp_link.h    |   4 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  12 ++-
 4 files changed, 122 insertions(+), 47 deletions(-)

-- 
2.45.2

