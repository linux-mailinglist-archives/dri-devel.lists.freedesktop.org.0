Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13169AAEEE2
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 01:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50FC10E2B7;
	Wed,  7 May 2025 23:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fmTSgOr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8462410E29C;
 Wed,  7 May 2025 23:01:20 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-acae7e7587dso51272766b.2; 
 Wed, 07 May 2025 16:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746658879; x=1747263679; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SFuv2QKP0uD2PYvKigfp0hEV+zPl3GzM8TneWY4q/xg=;
 b=fmTSgOr0bOaY8WGcKbgYk0rE42y2LsSb/o81/r/X9VP3HvzPwpHvRO7WAAD/WlaFKw
 d3/+WBBy1TpmqDEgHpzpg1Lu+K1BvxK/0IDDJ2bIVF8ixxcnNL7HhW1Bqi9E1Q2Q8ZXY
 aq+jFhmH5kADHL7QTAqu1MH6bMskTNQaEsEOF4Tq3p0mFK5j2YS/zSJhFj1DCaaZ3qJL
 BOGWl2ywENfRZ6EWhKm3gI+NsYPqjcQs64Lb/dlDPdQaJPxb4VzO3xjXk/i+/F78wBXf
 2P+XLogWPpuCR4+qZxyouTiqaJS6r+rRzhQL+hh80wUeMEd6G3ER5M1Sl8zqK02n5eRi
 ktSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746658879; x=1747263679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SFuv2QKP0uD2PYvKigfp0hEV+zPl3GzM8TneWY4q/xg=;
 b=BRpsg3dnZPUCBqhhNGpf8z1fHC3wZqw9AGWMfJKsQM+P018TeSvQ9jx/ZSPhHUaUY/
 bKHo1Sx8TcFPjg7CP8PDrgzn4x9gxhk4QcwA6s73WswsK2UrOV1C5McsscqvCRwC5r6u
 3QbfVrRpapgoyI0u97YQvTbkCbjYgHe4bdpwSZ3Zcysr/m3+4elEkIbybdKsBXY621be
 v36+Gq8zm4uPXZiX9CpqVb6gelDEieePAZZvxiAD0fq1llzsYAqK74Wzl61130Fa50Bc
 iTXX/7V04Bd//4K8wM7OLEMn95hVEIKG9Ex3SL2ajpPQe3vKOf85V3s63C/2uR20SrQ8
 9MNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHUc3iFGKvUKa1qzHMK51hpZKb+PT86ciN4SHWq5CUjtMGGK5sZjB4lHUDqR/rEzzfBSfsXnBJiWcI@lists.freedesktop.org,
 AJvYcCVgv9M50IY5Z8+1TewczzX/Cvp4bBfkRAOi4N9P76Px4kGcseYrxXSdXS0sR5qOLgxLv/joAfnFat4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwKA84UQ+r+rRIC3eM/3cdJSEbERLqTdIwLsJhBbQmpu5zhDaJ
 qIqPaU9BDfDqPvC6NXqV9tAQ8cfaQl5wQ3Gt1Gt+aaIzm7GQj/o=
X-Gm-Gg: ASbGncvgCkPEM0ZxwJgTUYIpZZjVXdY6RJpR947qTN5/1k4qW4+O0cwJ+8L4LTzqJl5
 X+bwQKZkEX32jrf+CItMXm5tHwKNCtt9Hl1thV6VH55JAPQ1dOv0P+Inf1Xj0kocGXYfN/UQmxN
 bW6QclrrzP1xUnrvJNkMCm5l5oDVmKTMu5Q4ClQGRaFg3amBBnnRqgaw4oc3crjz01RQrvYURXW
 aa79pwVEFB7op8llemuC4fEt1n7i05rF1m4dOORZleAdbKU2E7Lgl0iuFlSzpqOFP/3tTm0sPMA
 PWTO/Gr3WeYZlo9eep0VW2M1aSFk8EGGd7m+8L73H0PYhyUc41JZ7T/K
X-Google-Smtp-Source: AGHT+IFw9U+jQHVqcYcmg+RJ4EcdLl0ouOzm/w+TOZZbRNJGdtfaDch+IFqB/IpI39jZDotAJ7jqpQ==
X-Received: by 2002:a17:907:18c6:b0:acb:34b1:4442 with SMTP id
 a640c23a62f3a-ad1fe99e400mr80001466b.48.1746658877926; 
 Wed, 07 May 2025 16:01:17 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa777c8b12sm10507906a12.24.2025.05.07.16.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 16:01:17 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v5 0/4] drm/msm/dp: Introduce link training per-segment for
 LTTPRs
Date: Thu,  8 May 2025 00:58:58 +0200
Message-ID: <20250507230113.14270-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Changes in v5:
- Altered 4/4 commit message to include LTTPR's max training level
  context.
- Picked Abhinav's R-b tags
- Picked Jessica's T-b tags
- Link to v4: https://lore.kernel.org/all/20250430001330.265970-1-alex.vinarskis@gmail.com/

Changes in v4:
- Add 'Fixes' tag for entire series
- Rebase on 6.15-rc4 (was previously on top of msm-next)
- Picked Johan's, Rob's T-b tags
- Picked Dmitry's R-b tags
- Re-tested on X1E/X1P with DP->monitor, DP->dock->monitor
- Link to v3: https://lore.kernel.org/all/20250417021349.148911-1-alex.vinarskis@gmail.com/

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

