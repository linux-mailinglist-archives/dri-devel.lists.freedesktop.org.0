Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B204A5D338
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 00:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C0610E6A3;
	Tue, 11 Mar 2025 23:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XH48olcw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38FB10E6A3;
 Tue, 11 Mar 2025 23:41:16 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso29137195e9.3; 
 Tue, 11 Mar 2025 16:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741736475; x=1742341275; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gJ8EyWj+V3lGQ1KYljBA+TqtPpIeQuDsaPbpLuX41JU=;
 b=XH48olcwkcRTWR46Iq7n6eS81rnvY/G8CGe5JRKrmmJrc3WisVpwTzD4FovbIrfOjW
 PA3s3qeK/cR+nH0jkfaPYWKni9GWlYC17eaKMOiYRZOaRwxBFouOCccennTko26P2R5n
 Wf6xjsDCu9wEoepptEMiUXI/LPIuAPFiq8Bw4Gcm/k/F55ko++Ww+YJQVSM4UuzGQCI5
 2pmqjJw0gOC/Gk4iDCTZWtPkNP9m4xupoL0OrzJxfDBcV7Nsexeq5fGUCvSQL1iOUafZ
 nFMmDi+CPurw3ULPu49P201rMzr39PCV/j46a1M7b1XbE80JQQQt+cCToiws13H++A3v
 VATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741736475; x=1742341275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gJ8EyWj+V3lGQ1KYljBA+TqtPpIeQuDsaPbpLuX41JU=;
 b=R/QpzR1vAu67SNG0h+6t3pZYLY6UOBYxzwrbjOB8B+K1cGWKQ8qdQ5VPTW6jFdYOLE
 vDP8jZzsXEtIy/80vL+cCqJtP6DwlOhUwGgbwCEWOAu1qjzA5fai15c3IuoousqDip7O
 zPs02M/T180qTmULM5osXbAQ5HIpqFxK/TvGJ30VvIAoNi0aDh2ufl2IiE6HRbfArD3y
 i/RtSjlvCm777l8uBF2rrkTiRhzdaFNjyh9VQzPLGCVah8/EZxepPEi8YCOS2Mrlmtf9
 zIRUtLxSEAZx6kdm2DNNKRjkvI0wEDXqyfdxbyF45SJYfMcWU2VMzCOxpj5WeNyTQctT
 UulA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2OvpEouHi9Ns6hkdUsoFw+tzy6q/0C4UP8XIBad2WnvggYBYqF+0R6OjzvqOSZFLuS6jIXgZpVCFh@lists.freedesktop.org,
 AJvYcCXsLKz1yvuTJJzuegeWJf5qyJ/tSd/7sEtcLaQGAFcaHZ8cKvjXGuPB35NPnw2JJDojzeOxl90apI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/tGWCWENxkR21MaUSyxWOlTSCwaFDJAjnEie9hCx+nKpGHHYg
 /L4Cb03eS6QQJ7YpezPaXAVHW+arsEvA2RmL//Os3G4a7Eld63M=
X-Gm-Gg: ASbGncsonCYsDo/4Qt3lI1eYdsmQa3uKWQeKCba1SvktcIDBczxBmCkvh1hIeXH9fxS
 MJebAIxMIH0GVYzoyuyaOBC93BxIVQaiaS0CJEb/ZgO83IzN7usrrEY2oY7+R/Ln5TN5pyoJOGr
 cl8LjUIWYbHg/A4YLvHhycQa4uvh7+Phob33OMArNjR9djg2xp6f9j+Q50S672dXGHO9IWNaT1j
 0Z/vsxKwDvPtPlHGSWFdUY6GHMkF8220qYp8i8A6eXfCwhomrUeOBTcz4CI4TpuY7lKX7GizsmT
 JXr1YEBzSh6Ht0RLEfzkRh8+ZpFcVHivrt7oimH7ppJVORT0baTzM6Pf2/X3JCw2vDq1HoZrykY
 0u5YeeA==
X-Google-Smtp-Source: AGHT+IGmpUbEyhkAFSxBQp5Q99XB7Lq9csmnsvhQmC59eDhmUh1KPfKQ3rq38gkn1WnBBi9iEZyJhw==
X-Received: by 2002:a05:600c:4f0e:b0:43c:fa0e:471a with SMTP id
 5b1f17b1804b1-43cfa0e4b6cmr100755055e9.5.1741736474607; 
 Tue, 11 Mar 2025 16:41:14 -0700 (PDT)
Received: from alex-x1e.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a72ea88sm3988345e9.7.2025.03.11.16.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 16:41:14 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 0/2] drm/msm/dp: Introduce link training per-segment for
 LTTPRs
Date: Wed, 12 Mar 2025 00:38:02 +0100
Message-ID: <20250311234109.136510-1-alex.vinarskis@gmail.com>
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
* Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
          Type-C to HDMI dongle, USB Type-C to DP dongle
	* Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
	  monitor per USB Type-C connector)
* Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection
	* Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
          Thunderbolt/USB Type-C, probes with an LTTPR when in USB
          Type-C/DP Alt mode)

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

Changes in v2:
- Picked up Abel's R-b tags
- Fixed typo as per Abel, fixed readability as per Johan
- Updated cover and commit message on mailink issue which appears to be 
  specific to Gnome+Wayland. No problems on Xorg.
- Link to v1: https://lore.kernel.org/all/20250310211039.29843-1-alex.vinarskis@gmail.com/

---

Aleksandrs Vinarskis (2):
  drm/msm/dp: Fix support of LTTPR handling
  drm/msm/dp: Introduce link training per-segment for LTTPRs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 137 +++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  31 +++++--
 drivers/gpu/drm/msm/dp/dp_panel.c   |  30 ++++--
 drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
 5 files changed, 141 insertions(+), 61 deletions(-)

-- 
2.45.2

