Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D457BCF77
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 19:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D442110E18A;
	Sun,  8 Oct 2023 17:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1C410E027;
 Sun,  8 Oct 2023 17:56:25 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68bed2c786eso2836446b3a.0; 
 Sun, 08 Oct 2023 10:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696787785; x=1697392585; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vzldSszU6MMY3+BPZFEE+sdPY1rkhW3V7SWMFRFvi3c=;
 b=X+08X8OHzC4AM9nlTxTWRK+lwu4eNE8LAjXeQt7QfSs+g62tL9dIZHNsB0xd4edQRF
 Wtan+meThCIXsO8367wFMGbx8Q+C6aEc3l0bWJhchadoIxZxJ3lh9y3mwnKvikBEIQV/
 iLq1F0UlSOsrPqjgdWUjAjzJGaKFO/wcTghERObrYW/ZrX8+RTLzLJURwPSTs9UO1XxC
 sbLBbvzGpuj480fzRjXHfPf5ddzqRxEBPbPrnggNxzGyyc5YhxQPJ+fJgLFV+Ir4HH2C
 3j/bIIDWcRfbPIyBE12g4hmnZgOqZvI8yH2h5uFxvzJ8rXqYJDkgDcGjcSm05qCztvGN
 6AIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696787785; x=1697392585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vzldSszU6MMY3+BPZFEE+sdPY1rkhW3V7SWMFRFvi3c=;
 b=ZGwr63CvaYLWGHmhj5i/+bozDRXBU2vRyLnGmtwMcNs/n9vGUp4U6u6fzxVVwST3Gt
 JFXMje5rxgXInYD1QnCTs8ey7o2N6vpjIMZriRMVctEEM3ecrzSmwQ2NBs8a1F3fI4Ue
 5CltH9inSjog5CgnBNSMEmeRLy4xhnU8Rw5E0DVpaQcUfnw/MSFA04s8bXjI0sqAscWM
 j7CbFgw0MTWlz1vBdesypZc0hiwCL++CQJNYOVSIsqxKB1puxOa4IwvRA+XwrPhbPzyo
 xPm6TnpRRrbcKD1sVoq5vitnQMknFxsVfIam8jnPrMPOzkUKT+EzJsgrWHB49BovkdhW
 a93A==
X-Gm-Message-State: AOJu0Yx0lq2J/Tf586iqFpkzSJcDsxFr4na2EPH5xoti2/8i0amOolAL
 iMiv21/xVG+OCYlUcGc/iKn7f5wZyto=
X-Google-Smtp-Source: AGHT+IHqQ/Vyp0H3SIe36vYhUTFYZOV3Jn9KI7Rwe/TDcLX9WK8K9IRoidQS4zA/CzHtqqtXwbRB+g==
X-Received: by 2002:a05:6a21:a5a7:b0:15d:721e:44d5 with SMTP id
 gd39-20020a056a21a5a700b0015d721e44d5mr15053674pzc.49.1696787784604; 
 Sun, 08 Oct 2023 10:56:24 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 jb17-20020a170903259100b001c8836a3795sm7741992plb.271.2023.10.08.10.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 10:56:23 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: Use the encoder for default CRC source
Date: Sun,  8 Oct 2023 10:55:59 -0700
Message-ID: <20231008175615.413497-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 Daniel Stone <daniels@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-msm@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Helen Koike <helen.koike@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

i-g-t expects the CRC to reflect any applied CTM.  But the layer mixer
source is upstream of the DSPP, so it is before the CTM is applied.

Switch the default source to 'encoder' instead so that the CRC is
captured downstream of the DSPP.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt |  4 ----
 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt |  5 -----
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt | 11 +----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  6 +++---
 4 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
index faf2702c223f..a51950746443 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
@@ -1,10 +1,6 @@
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
 kms_cursor_legacy@cursorA-vs-flipA-atomic-transitions,Crash
-kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
-kms_plane_alpha_blend@alpha-7efc,Fail
-kms_plane_alpha_blend@coverage-7efc,Fail
-kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
 kms_plane_alpha_blend@pipe-A-alpha-7efc,Fail
 kms_plane_alpha_blend@pipe-A-coverage-7efc,Fail
 kms_plane_alpha_blend@pipe-A-coverage-vs-premult-vs-constant,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
index 612f7e822c80..327039f70252 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
@@ -1,7 +1,2 @@
 # Suspend to RAM seems to be broken on this machine
 .*suspend.*
-
-# Test incorrectly assumes that CTM support implies gamma/degamma
-# LUT support.  None of the subtests handle the case of only having
-# CTM support
-kms_color.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
index ba36b92e3325..3d53c53a0659 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
@@ -1,20 +1,11 @@
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
-kms_color@ctm-0-75,Fail
 kms_color@ctm-blue-to-red,Fail
 kms_color@ctm-green-to-red,Fail
 kms_color@ctm-negative,Fail
 kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
-kms_color@pipe-A-ctm-0-25,Fail
-kms_color@pipe-A-ctm-0-5,Fail
-kms_color@pipe-A-ctm-0-75,Fail
-kms_color@pipe-A-ctm-blue-to-red,Fail
-kms_color@pipe-A-ctm-green-to-red,Fail
-kms_color@pipe-A-ctm-max,Fail
-kms_color@pipe-A-ctm-negative,Fail
-kms_color@pipe-A-ctm-red-to-blue,Fail
-kms_color@pipe-A-legacy-gamma,Fail
+kms_color@ctm-max,Fail
 kms_cursor_legacy@basic-flip-after-cursor-atomic,Fail
 kms_cursor_legacy@basic-flip-after-cursor-legacy,Fail
 kms_cursor_legacy@basic-flip-after-cursor-varying-size,Fail
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8ce7586e2ddf..5eacf19382b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -79,10 +79,10 @@ static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
 	if (!src_name ||
 	    !strcmp(src_name, "none"))
 		return DPU_CRTC_CRC_SOURCE_NONE;
-	if (!strcmp(src_name, "auto") ||
-	    !strcmp(src_name, "lm"))
+	if (!strcmp(src_name, "lm"))
 		return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
-	if (!strcmp(src_name, "encoder"))
+	if (!strcmp(src_name, "encoder") ||
+	    !strcmp(src_name, "auto"))
 		return DPU_CRTC_CRC_SOURCE_ENCODER;
 
 	return DPU_CRTC_CRC_SOURCE_INVALID;
-- 
2.41.0

