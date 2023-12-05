Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565E8044EE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 03:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FED310E465;
	Tue,  5 Dec 2023 02:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F74A10E465
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 02:31:53 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50be8ced3ddso3042604e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 18:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701743512; x=1702348312; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DbHE9BPTRIRsV88TvG0gZTWaeA9wHAPMM62YddZwnZA=;
 b=m97LchrLpq39+WPJzTrp5U8+dliIwaisROipTwGcaJTMopu5q6a4EkVFWDo6y5ND8+
 VyGhPj6Xa5sb+uxGR+kv6uwDzLTBsqvSWkKNrmbE3NyNpQz4/JHVASMQm+spkCzk1wZ0
 szbKYITiFizBmNJ9E+1+IIj5j48W98zOQqt8WznGEwPZPAnEoNKpIg5x7ok0H4JSyBzY
 JSOiV/zAiHNwDx8vz0LZWozIIQOoIvz0LnwuqzFan1JyhUCqPb/4dWuOKnGp2ySuisNo
 V/g/7kjIJtpdruGFWDKLZmAxKSRe8uy5cX53QjDG2/e8rCXa9cjSrYF/cNY3KqxnbC7G
 Uo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701743512; x=1702348312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DbHE9BPTRIRsV88TvG0gZTWaeA9wHAPMM62YddZwnZA=;
 b=GIHluYIbwsSQ5DMhtmLDUiUAtO6jtfeoqk5y6Y1SbL3qlrYKAaLR3GtJKS+lLtJVEu
 xDktYwVRa5ozYdOFcFK7g/Y9DG0EVM6Ng7AQyGi711+isy/On7h5BIS3DxBvqPBIFLdU
 AGTV70CsLJfKxyhHs0XALEyo6hmbkRfN0Lz4EJOv5YW7Bv9S9vEqFJHuutNRzeiYm89Y
 bTlzaDhaY4f1hBMZjCS8o4tV/ZmbtP1ef9nuw0n3nNvrMjd+QsErRI/i1OKrJKpqq73N
 SZhtlwv9hKExP80OlfRbejBkOf5Swqy4t+1glgKTJ5y+CYExuXKvMDV+qm/LKSRCFktj
 cZjA==
X-Gm-Message-State: AOJu0YwyeKvQ6wx9UeiMLgOz78mFfEFN3nx3CFZEfUfPb7NzEEZoA9Vh
 u6DHsoVu+lqGDsAcFn+RfRzm7g==
X-Google-Smtp-Source: AGHT+IHj4RrgA3yIRfjkHr/FC4YWFuT0bc/fAnNvvSdZ66FbSu+DwF4JqrgODiqGTpqRbe66VifBVg==
X-Received: by 2002:a05:6512:3ba0:b0:50b:fe77:196c with SMTP id
 g32-20020a0565123ba000b0050bfe77196cmr1069018lfv.27.1701743511658; 
 Mon, 04 Dec 2023 18:31:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t10-20020ac24c0a000000b0050bc57ec288sm1414726lfq.44.2023.12.04.18.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 18:31:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v2 0/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Date: Tue,  5 Dec 2023 05:31:48 +0300
Message-Id: <20231205023150.1581875-1-dmitry.baryshkov@linaro.org>
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
function accept drm_writeback_connector object and the drm_atomic_state
and rename it to drm_atomic_helper_check_wb_connector_state().

Maxime suggested that the function should take drm_connector, but I
think that drm_writeback_connector is more appropriate, following the
purpose of the function.

Changes since v1:
- Make the function accept drm_writeback_connector and drm_atomic_state
  (Maxime)
- Added a patch for VKMS to move atomic_check of WB path from encoder to
  connector helpers.

Dmitry Baryshkov (2):
  drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
  drm/vkms: move wb's atomic_check from encoder to connector

 drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
 drivers/gpu/drm/vkms/vkms_writeback.c | 27 +++++++++++++++++----------
 include/drm/drm_atomic_helper.h       |  5 ++---
 3 files changed, 28 insertions(+), 20 deletions(-)

-- 
2.39.2

