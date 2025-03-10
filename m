Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20135A5AF85
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 00:51:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5DC10E4EC;
	Mon, 10 Mar 2025 23:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XRB2tFTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C9A10E2C1;
 Mon, 10 Mar 2025 21:11:06 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso16225465e9.3; 
 Mon, 10 Mar 2025 14:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741641065; x=1742245865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xDGr+bd0+v4IvOiFmty2KtVI4kE9v+gI/XWZpKSUg9E=;
 b=XRB2tFTrpm24t+87zI+XuBPsZpOoNNRm5Ope6pmYnxbNMsFOo8hQdzmQ9N+HbZ1WpE
 SeFtmnNRtXXgdaDYzIHP+zZP0Qyc2eLZY9J9R+CUlcSahWV25NtK7U++nlMU91b8NaN1
 8K7cYYdbaBPoZavPQd9JVORnzxfl0FkGxDq/xaRuK3NmuQevgHm/elcrBOIB0Nmn+x94
 IwLkpaIWx/RA3kkRu8xSD3qbUU8KpI2bNi54DqZYMnOFFlp2be0L/sWK9xS5hWxQK58S
 4NIBEFI95U0tjIO0pI1dGX1Q2EVU7oeyuYfRMq+/SkC41Fyr1nLCRhKBbEibaYKiEuDN
 i02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741641065; x=1742245865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xDGr+bd0+v4IvOiFmty2KtVI4kE9v+gI/XWZpKSUg9E=;
 b=H7atlZ06yRxaLEX8h1SsBVJAcDHoEFoj4jUE8UX7ocbG5eqFVFW7BECO4Pj/B97e8v
 VjklbLzqupmZb6tvASiXQRxjT5axecdWYoLTgbjHgsrncQ3/WGPgRvUOmHjo6g77dLp0
 h44bia6YNNx1q5utS/K1zC1tEa6e0UEPuYFQkCupcaPJTkUmlmNKqVBc95HMgasClKIa
 Vd7rgo1SPm90LmOJFXe8gnJQlZzj0/5K0VrV5HIn1Prsw3+6OBNOigEBVBGvcMfRlMmo
 HImxrJirs7lSTsNGtBAljzfYC63ECepiXryAajLmauAdVtPOZEQxMssoISnOng29AOqu
 JicA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV42YAHaNfdxEN3OiptNAB8W16Y5EfYQ+y31S018lphVk3Z2cGOTi8v1qESz3DEVqE6qzy0Ii2RijQ=@lists.freedesktop.org,
 AJvYcCVMMeDssFGfYTLFmKfeCfdpq70qZUbdQ8PsBQu1IjQKG1K2O1T92okhiK+/9NbNMdMpx877GtL/SHOj@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaLdTep8WmDEnQklD1iWWRtv8rLka30LDmeHjudL2chJYGtZu4
 uhsPKJw6XDzMfp5skyuvJkbHE2NjSkx6GnKrGe34KOcXBwBAaME=
X-Gm-Gg: ASbGncuGUQIwVmHihr6zrJHLbtbIxRInjzzIJn1ahpFMcKezBHjW2JuQSYgtafdxIEL
 durknMqd5HwCB5bRpJ7E1oCzZz1xQG7cMHI64QzRMSTFFqW3J+ItjtcSjSfl0XLX526PXyFR7g6
 e7zwj0YNER3aswTkEHUcDEtF42B2rJtl1lVOEujiR5tECw3mT40GZ4X1p1LjtPBIwss+Nm9PTy7
 5dup9lGFxyJi7DZQnxxTNZWN74p6P5bgiZwIeL34bXGx9/fpvGlAfWUzd0gmltrPNzC67C4/rRU
 2Y10ZVYm75OMy8dHwaRuiyor7haivuPyprCaoLCdMo+JeAcjSoMlEmSkApptqYK7i3Lg1L6jZkc
 Mlke0fA==
X-Google-Smtp-Source: AGHT+IEBiIQ1MbFvdWaPDPFgLiSRfkjBIX+VNXkv/hbTgdIWgEvtEnCjb21i0lAzwM5h6ATTR8/aYA==
X-Received: by 2002:a05:600c:1d12:b0:43c:eec7:eab7 with SMTP id
 5b1f17b1804b1-43d01bdd224mr20195455e9.11.1741641064571; 
 Mon, 10 Mar 2025 14:11:04 -0700 (PDT)
Received: from alex-x1e.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf595a771sm54980415e9.36.2025.03.10.14.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 14:11:04 -0700 (PDT)
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
Subject: [PATCH v1 0/2] drm/msm/dp: Introduce link training per-segment for
 LTTPRs
Date: Mon, 10 Mar 2025 22:05:50 +0100
Message-ID: <20250310211039.29843-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Mar 2025 23:50:52 +0000
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
required helpers. This seems to also partially improve UI hanging when
changing external display's link parameters (resolution, framerate):
* Prior to this series, via direct USB Type-C to display connection,
  attempt to change resolution or framerate hangs the UI, setting does
  not stick. Some back and forth replugging finally sets desired
  parameters.
* With this series, via direct USB Type-C to display connection,
  changing parameters works most of the time, without UI freezing. Via
  docking station/multiple LTTPRs the setting works when increasing
  bandwith (eg. change framerate from 60hz to 100hz), but in all other
  cases the setting again does not stick.

These appear to be mainlink initialization related, as in all cases LT
passes successfully.

Test matrix:
* Dell XPS 9345
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection, Dell WD19TB, Dell WD22TB4
	* Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
	  monitor per USB Type-C connector)
* Dell XPS 9345
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection
	* Dell U2725QE (universal Thunderbolt/DP Alt mode, probes with
	  LTTPR when in DP Alt mode)

In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled
in UEFI to force universal Thunderbolt/DP Alt mode devices to work in
DP Alt mode.
In both cases laptops had HBR3 patches applied [1], resulting in
maximum successful link with 3440x1440@100hz and 4k@60hz respectively.
When using WD22TB4/U2725QE, USB Type-C pin assigment D got enabled, and
USB3.0 devices were working in parallel to video ouput.

Known issues:
* As mentioned above, mainlink parameters changing is not stable, but
  appears to be unrelated to this series, and works better than before.
* In a very particular combination of Dell XPS 9345 + Dell AW3423DWF at
  max resolution, right USB Type-C connector does not always work:
  following successful link training, mainlink is not starting. When
  switching monitor to PIP/PBP mode, the issue is gone. I am unable to
  reproduce this issue in any other combination of devices/modes, so
  perhaps its an edge case of either the monitor (Dell AW3423DWF) or
  the docking station (Dell WD19TB/WD22TB4) specifically.


Due to lack of access to official DisplayPort specfication, changes
were primarily inspired by/reverse engineered from Intel's i915 driver.

[1] https://lore.kernel.org/all/20250226231436.16138-2-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (2):
  drm/msm/dp: Fix support of LTTPR handling
  drm/msm/dp: Introduce link training per-segment for LTTPRs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 136 +++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  33 +++++--
 drivers/gpu/drm/msm/dp/dp_panel.c   |  30 ++++--
 drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
 5 files changed, 141 insertions(+), 62 deletions(-)

-- 
2.45.2

