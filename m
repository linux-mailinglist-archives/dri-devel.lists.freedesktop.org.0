Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 368977EBA00
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 00:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F39210E38D;
	Tue, 14 Nov 2023 23:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598DC10E404
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 23:00:18 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-66d122e0c85so35841896d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1700002817; x=1700607617; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0WgbXh9MgeOn39Qx8ZOYsj5qd/Y25XhdC9fJIxz5E4s=;
 b=XHiDN41Qv1XB8A/je7I3HoqAAn6J4erbjXylxaDRsHrNYdL+NPN9W8KJXB732tybaX
 yYcLVx1OfxLX6WPq8VWOvWXT+ojEoOKY+PCbQ+E2h8L2k+zNajKLOHkYwao5NDCMc/UL
 a2Q21HFR4tOI8j1rTG7AeE/cF6an6m+Fu8QgdcMPXESw+aFtWlWftMbYmjuoI+DMLja3
 ycBB2jHlGoIZUEy0LtSuFFk+BOiAcGVxDrtbBdP2e4UarfZXlZ5JdPFPKJqSH+bfUnJq
 8+1Sw6ZN0W6B4Kqav4sMOslRpaJC/ywdZfCz9Vegrm1axaEnEDEpydfmcQi3A5EpOIaI
 s9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700002817; x=1700607617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0WgbXh9MgeOn39Qx8ZOYsj5qd/Y25XhdC9fJIxz5E4s=;
 b=lL3w5GgNrobdqFL6XR2/4IFKYVWXepinr70dBWF5U0WFmmTDjAHYJx9PwwPEw618Ai
 ZsL3/I3ML4hzqzaiAjRZua+Vah+zGP7P2KwZNoRWPflRSVk6KWFQFbEqKmvqVdnAT+9e
 45XTb25M14Rtds1CwwAkgtGYKmaNdrMnTm/cc70Jt6IS0Enf/beUQJ4eP39qRjFB+BE7
 9WRUMns6ssvSOT/kfo7t6ieZJ5hi6JNYhVCuDa/PeBSXvRFc4mEUjM9dieZIoI0pM8gu
 RsDnj7wOny52wrPjqTmk80cOflrw7jkmJmdTlsJwTTR8XKU6iaxyi3inHTIvlSZCrU87
 mSfw==
X-Gm-Message-State: AOJu0YycGb+aSGBeVt9dxl19OcpgSTukcj90bAZ/6E+kM5t0jwSH7AaG
 V1h3DDJO+QCJf2ZGgmx4f+44lg==
X-Google-Smtp-Source: AGHT+IFnjqTgSRAEEv9oTG0p8gs1SiKRgR8rwDL76VdXJfcgXZJsNySy8WBq1Lpu5ZkIr/aU+PwDZA==
X-Received: by 2002:a0c:fd81:0:b0:670:710f:203a with SMTP id
 p1-20020a0cfd81000000b00670710f203amr3645510qvr.59.1700002817358; 
 Tue, 14 Nov 2023 15:00:17 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 15:00:17 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/msm: DSI DSC video mode fixes
Date: Tue, 14 Nov 2023 17:58:28 -0500
Message-Id: <20231114225857.19702-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, Doug Anderson <dianders@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>, Kalyan Thota <quic_kalyant@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnaud Vrac <rawoul@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2: added new patches (first two patches) to get DSC video mode running with
the upstream DPU driver (tested with the vtdr6130 panel)

Jonathan Marek (6):
  drm/msm/dpu: fix video mode DSC for DSI
  drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
  drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC (fix video mode DSC)
  drm/msm/dsi: add a comment to explain pkt_per_line encoding
  drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
  drm/msm/dsi: fix DSC for the bonded DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 11 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 13 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h                 |  3 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 50 ++++++++++---------
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |  2 +-
 include/drm/drm_mipi_dsi.h                    |  1 +
 10 files changed, 58 insertions(+), 28 deletions(-)

-- 
2.26.1

