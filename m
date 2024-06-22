Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AA6913665
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 00:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4D710EDE7;
	Sat, 22 Jun 2024 22:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uNg199FK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365DE10EDE2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:21 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ec50d4e47bso14978091fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093739; x=1719698539; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=64LEVOrzgJygsjtslXFVKLGh/ZheVk3INSmy/1YhYkw=;
 b=uNg199FKnGt0faqsh/nW4MsZmjfmKMvQmGh8Fsk61NBrkEk6bFzin6a51laPci9Ajv
 57BYbHwAzmYGlvwT5smnRWI8XwSx8bnYMp0vTex6QkXd6IE4LSivqSM1R++c9u0R7b/x
 rCzy+tOGWswz/w4zYHMfhvHBQk15Ho4tP2b+0Zeu46Ah+0fjTEGzcDBzsWIGh+McfqVa
 7WFlG9163jeyVyB8t8em4Vtct/a9h1oV0iIHFE2GdZi8v+gDhTdIvHSaVCwvvJwI/nL0
 9lxBGOwyYzPG76VgDWTNUItnMiqW+kx7laAwUefIyUHMnduWG9maiPH3A/kTCMK27+6K
 ioOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093739; x=1719698539;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=64LEVOrzgJygsjtslXFVKLGh/ZheVk3INSmy/1YhYkw=;
 b=iwPF29BA0c1EqoTMxgmuuhke4XoJzRlr+raQ+kCmznUiGyn2QiBYjOI+Xqgb8GbQCA
 ZHcQE+/CQE2stKE9eVEYNROizLqa3XZJ7NdN7tYGSrlqrjcA1fRt8UOdGYJYa5QJytta
 RSmUCUoDrc6KD3ZGxHZ3+UA1n9PIUKJuLysGxCTQxCrlhABdOibJZVRgf+fg41AJMIhd
 QrPPEDIE4hdtIH0u2h8aCxPlIycp0h5Foq9KGkgxpuRGu7ZSd/9TzvUBI8Iq1VnCg2vz
 iDDpjUF0bZT5wXzt5zEtA7GkkLpF2MtRD+VUQ1mariFCvK4ilznvpPFY+4ly8CLLpTse
 G+Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVznv4NBDQGGfjMnMh1RecrVHo/GzScrbyX13AXR7pIfWuKaAiLMqRW35OLxko3l3bpUjg+O05qfiW22WyCJ8q0uhy+5yaCSbaCXPY1hb1A
X-Gm-Message-State: AOJu0YyX1TYXEBEea1/vb8OivFuU2qxU61I4OBqXYpHaXenCd2EyePSf
 xogZJiZwFhEEmwS9ljUXAfsiFqvF5h1Ikb5rirYZT07onmsemqaYkfQETfFMfx0=
X-Google-Smtp-Source: AGHT+IFzw1Gde3mqgvpH02c2bEnsd2XzVkvI/ckW5BdDtV7OdSLIwXAknbswVRWdkUx8lVNsTFkqhQ==
X-Received: by 2002:a2e:9b96:0:b0:2ec:51b5:27c8 with SMTP id
 38308e7fff4ca-2ec5b2dd919mr4402111fa.32.1719093738992; 
 Sat, 22 Jun 2024 15:02:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 00/13] drm/msm/hdmi: rework and fix the HPD even generation
Date: Sun, 23 Jun 2024 01:02:13 +0300
Message-Id: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOVJd2YC/23OywqDMBCF4VcpWXckndQLXfU9iotoRhNajUwkV
 MR3bxQKXXT5L87HWUUgdhTE7bQKpuiC82MKdT6J1uqxJ3AmtUCJV5kjQmfAmsGBnQyQqorKUFN
 okiItJqbOvQ/tUafu2A8wWyb9NZQslESZ56iysqhQwQWSNvOSNZqXYJ8+3l9u1Owzz/2OWhdmz
 8vxMOJO/z8TESS0SjamKdu8LenXqbdt+wA6tBkA7AAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=md7jhGKlOM+w6BZGeSXbU5W/Ury7H26Ee1cLS6Zhie8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0nnTufW95SKrWHG++JrkElcNx7EBZ3GYA5ZK
 eEmok9E3huJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ5wAKCRCLPIo+Aiko
 1a1nB/43/0cvVcvVPP66ncByrT/vuYcbf93n36kaGSRPKfwc5DTkD6ZP8YbZ2GZWCEjmuFAjcei
 xG+NELoKKs6eBl6UY2Qon1D7sdAdMeuHryhVtlnnibcD4CijmzE9TvJuQKHWn3/2O6yD7F1m5xv
 1xyuyE4E8HkdofF5v9dUHqC+MgzUwek10sGEqkQy7lxXRfhX6vYt3BpSaS40w6B/g5zSuRkuP9F
 Flct+homaAFDXF8JnhfgkoZdXnsFzkO+NOG4aorJ3U5QwdAH2HBbgrvK/ECdYqobyTlF5QUJwMb
 YT742rOpCkTthSXvw7ar8rFrJZCkiib8SS1EUU58pOnDAOl7
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

The MSM HDMI driver is plagued with the long-standing bug. If HDMI cable
is disconnected, in most of the cases cable reconnection will not be
detected properly. We have been carrying the patch from [1] in our
integration tree for ages. The time has come to fix the long-standing
bug and implement proper HPD handling.

This series was tested on msm8996 and apq8064 boards. Previously HPD
handling sometimes could trigger in the CRTC event handling, however I
can no longer reproduce it now.

[1] https://lore.kernel.org/linux-arm-msm/20171027105732.19235-2-architt@codeaurora.org/

---
Changes in v3:
- Rebase on top of linux-next
- Dropped the patches that were replaced by the HDMI Connector
  framework
- Picked up the mode_set -> atomic_pre_enable patch
- Link to v2: https://lore.kernel.org/r/20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org

---
Dmitry Baryshkov (13):
      drm/msm/hdmi: program HDMI timings during atomic_pre_enable
      drm/msm/hdmi: move the alt_iface clock to the hpd list
      drm/msm/hdmi: simplify extp clock handling
      drm/msm/hdmi: drop clock frequency assignment
      drm/msm/hdmi: switch to clk_bulk API
      drm/msm/hdmi: switch to pm_runtime_resume_and_get()
      drm/msm/hdmi: add runtime PM calls to DDC transfer function
      drm/msm/hdmi: implement proper runtime PM handling
      drm/msm/hdmi: rename hpd_clks to pwr_clks
      drm/msm/hdmi: expand the HDMI_CFG macro
      drm/msm/hdmi: drop hpd-gpios support
      drm/msm/hdmi: ensure that HDMI is up if HPD is requested
      drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops

 drivers/gpu/drm/msm/hdmi/hdmi.c        | 145 ++++++++++++++++-----------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  26 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  73 ++++++++---------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 142 ++++++--------------------------
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c    |  14 +++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |   6 +-
 6 files changed, 150 insertions(+), 256 deletions(-)
---
base-commit: d6beed9e425d272d4a332e6ee684ac457f91b570
change-id: 20240522-fd-hdmi-hpd-e3868deb6ae0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

