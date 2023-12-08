Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64495809850
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 02:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D14210E9BC;
	Fri,  8 Dec 2023 01:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDE610E9BC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 01:03:18 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so1735324e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 17:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701997396; x=1702602196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+k6qf+bNHQcvQl30mfuUz9ipkvgI67LW5R0klxiQSzU=;
 b=SMKUNiggxv3y2GOF33X7nzu0RABGGL2zThiOiRYiAqqGDEAQN/B3knZ6jlPrNXeYCx
 9ugo8uYtdlwS5wl5pv0fIrQpKY406L0kRKsBddoEztIuYH4m+V9XlrnCQ6hDiW+yiDiO
 UQ4GibRWWikdk8azEyJaFAsFM320PCngfwA1v9Jd7X82ygj1Wlb7yGxtsupvXYNvfxiU
 7O7jVh59bpAKAEwoLH/RDfIzJ0LAt4nVkNkMTw0Ua/zZ2Mcw/DnZeywhwwW8vGBBH/EM
 WV4fD+vh7lYE0LIro6s8BdQR63NIYr4hNLt9bNMVMsKMgZ4rf1k+brc0ByExmVC2W5/h
 KiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701997396; x=1702602196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+k6qf+bNHQcvQl30mfuUz9ipkvgI67LW5R0klxiQSzU=;
 b=l98Hf1U9PCE+G3O6DU6kLFC4F6uo5Mwxamqk7Mht/zYiu/DtIbkoHm7G8Vw/rWwkBy
 KJ0I+Xluj8x6HPK2clleiv7KIKf0wYgkvWUT56RdyW325kUUWk1LfS1iudvqfkuauzTZ
 V61FPamLHgsrrpwQwh22nysPuvazGCz2R2M+25QEX3M1SLxF2Hz0TGOM8jrojNgZBz6c
 rRvABR83dV2g5pHorxBrjETogXjTJa5Wfu9/Dga5OUKVyWwWkjESsfmygSDrZpasslTg
 l57M5ZhUVTuqGGiIm2NjUnvHU+dSDMaellyBEBhxCYmZEGitnlTZTsK1KBxLfaUf7Jeb
 3liA==
X-Gm-Message-State: AOJu0YwqvTs86r1TaTUFWCR2DmW/WQLk+hPsdGUPtcPViN0xAs7ZYzrZ
 YBNZXlRRSCgZDjxl8LNtoDzFbA==
X-Google-Smtp-Source: AGHT+IHnR+0WQEYXynumg+Qc9toMubczuekfzq5G2a/0OMdv4pHOEOU3FG1N9mU5AgUYB/y97N6lEQ==
X-Received: by 2002:ac2:48ae:0:b0:50b:e6ad:e7e8 with SMTP id
 u14-20020ac248ae000000b0050be6ade7e8mr2063009lfg.131.1701997396284; 
 Thu, 07 Dec 2023 17:03:16 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t28-20020ac2549c000000b0050bcb5b443dsm68415lfk.171.2023.12.07.17.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 17:03:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v4 0/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Date: Fri,  8 Dec 2023 04:03:12 +0300
Message-Id: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
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

The function drm_atomic_helper_check_wb_encoder_state() doesn't use
drm_encoder for anything sensible. Internally it checks
drm_writeback_connector's state. Thus it makes sense to let this
function accept drm_connector object and the drm_atomic_state
and rename it to drm_atomic_helper_check_wb_connector_state().

Changes since v3:
- Fix the function usage in vkms_wb_encoder_atomic_check() (Maxime)

Changes since v2:
- Make the function accept drm_connector instead of
  drm_writeback_connector (Maxime)

Changes since v1:
- Make the function accept drm_writeback_connector and drm_atomic_state
  (Maxime)
- Added a patch for VKMS to move atomic_check of WB path from encoder to
  connector helpers.

Dmitry Baryshkov (2):
  drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
  drm/vkms: move wb's atomic_check from encoder to connector

 drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
 drivers/gpu/drm/vkms/vkms_writeback.c | 25 +++++++++++++++----------
 include/drm/drm_atomic_helper.h       |  5 ++---
 3 files changed, 26 insertions(+), 20 deletions(-)

-- 
2.39.2

