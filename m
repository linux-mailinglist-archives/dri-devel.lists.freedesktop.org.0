Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90893862A99
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 15:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EE610E406;
	Sun, 25 Feb 2024 14:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QV+bquqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18F010E416
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 14:12:50 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so25161311fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 06:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708870368; x=1709475168; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4jp7b6W11oTt4eacy444Z/1g5qUWokbD1FKYrflZ4dE=;
 b=QV+bquqTHZ/tdp5uadyOdBYyn6vRwZTdzfvnOWilxbPeIiMcHJA4OJJPhV5Able84k
 CGwZ975hfZOOKJcWQ+lJMgO4TQ6MG78UsF3ZTGkiQpivKSnUBbTye/6igpr+oeSp4bLE
 HwAFyChhpqGGO20f1Bda2SM0jcshhcSyNZLbxAumGP5qHwn0A0aBbyysaf7uMPTe1oNA
 QIco5DnGQUhaBW9XY3JKCR+8QvgNUkSpgFM0v0i1mnj6oRFa4RWtSKTTud1Ee69UZf3Q
 0vtUDwrb8gt8PszDAUXCTwYB2zwV7/EaYeN/vMhVTmZZDxcu+T+0sndfsBBiUgvvIH3Y
 weiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708870368; x=1709475168;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4jp7b6W11oTt4eacy444Z/1g5qUWokbD1FKYrflZ4dE=;
 b=JpaBS+sX3+qA2KVx1jNvDjR0hRC+lfPEnFW0G3/sePQ0zUHFWMWttejd0G+d9GPkjk
 eEwf2Ojpot87Ji2SYhuZSpk75TnX248xAZGms5r0WySkSTBdkjYP5um2GeMnzteV7Jcs
 okUHiFM3BrnabVyWGgIgWpSUpg9ErkpsORGtjlfuuK6+BqpXqA+BMNQ2WCRWuwUyqfkl
 O8Pj/3MH+GMPecSwRV8JCHnQ2H2kULAOQPWZBYpsqma2t33gfRtl0siHQPJ0RhexbPDh
 ag4YlISHWCqAVNEWW/qN47ZQbqEUbxzND5YRH7pYC358YI910OydZ/hPeWZqJOkFJoLc
 MO6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjBDqtusRnUs12ISDXq+qZCEn9q50mUyoDKv0qtQ6BtrZVv1uqPqoT03P0w3M3lRJXFLisgxvw/+dJKYkxwZAHimUqM8SAa/Li5WVJxx50
X-Gm-Message-State: AOJu0Yy0VrJYDHx+RnxM3x3e2ZYlQL9hexCVoUsSc2yCWPzv04l3BGgc
 WXeK2PgojKio/obrDiumLjoCFAGWn7sW59igBzt8eKDTTf6xj/JZFTPGtJ+v2VA=
X-Google-Smtp-Source: AGHT+IGfKXH23S9pVnVMEvSXrYDgDTCkZCTqXbY8PsTS2t4khBBuR9Nipefet6np8QYGfQ/u019p7w==
X-Received: by 2002:a05:6512:3b99:b0:512:f68b:69de with SMTP id
 g25-20020a0565123b9900b00512f68b69demr1507476lfv.45.1708870368483; 
 Sun, 25 Feb 2024 06:12:48 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 w13-20020ac254ad000000b00512e5bd2296sm522931lfk.217.2024.02.25.06.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 06:12:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/3] drm/msm/dpu: debug commit_done timeouts
Date: Sun, 25 Feb 2024 16:12:45 +0200
Message-Id: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1K22UC/4XNQQ6CMBCF4auYrh3TFtIWV97DuAA6hUmUkhYaD
 eHuFjbGhXH5v2S+WVjEQBjZ+bCwgIki+SFHcTywtq+HDoFsbia5LLngCpwFO85gsZk7mOiBfp4
 AK6Edb1rDVcHy6RjQ0XNnr7fcPcXJh9f+JYlt/QMmAQKUrbSSxpSqFJc7DXXwJx86tolJfhTJz
 Q9FZqVyFddONNYa/aWs6/oGUhPVA/8AAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KOC17kShUQKZuxuTXp3eBvMi5MEvpIBdA3gtxscdztU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl20rfF+Ce8/b+rwxO9i085gWzGPOjk1Ty1z55/
 p/vHHN8swSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdtK3wAKCRCLPIo+Aiko
 1WFWB/0RI4QxaBJJDCkXRRz4JUQw4rpV3NyPXWfuMOmXh/wKqGkPNZdkp17kjSwd8f7zUJ+TiZ8
 0psZLdDPQDomXTqCEM6R7gN0/rYgXQFjxZO65S5gPORP54iJ6pKy+gI1wKIAtRlG2NLokVCYeUn
 LPny3QhF7weIIJdJaqugDuYLEtbHDTIVq2OYzpxCaZAzNxx5UAGxovX7t7KEbljSQuUXxm4qDCS
 FoLlvXdVKFN4+TeEnhi3+lkHgREOECAaVE6tzCwIuhvSNlHICVkCPvvlb+oHCSBaGrS2O61YFJo
 /TjublUJ+Lo2EN6NFLCtZxVqY8rjRQWnqc29cZ4M87ZJ4hWn
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

In order to debug commit_done timeouts ([1]) display the sticky bits of
the CTL_FLUSH register and capture the devcore dump when the first such
timeout occurs.

[1] https://gitlab.freedesktop.org/drm/msm/-/issues/33

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Capture the snapshot only on the first comit_done timeout (Abhinav)
- Link to v2: https://lore.kernel.org/r/20240208-fd-dpu-debug-timeout-v2-1-9f907f1bdd87@linaro.org

Changes in v2:
- Added a call to msm_disp_snapshot_state() to trigger devcore dump
  (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org

---
Dmitry Baryshkov (3):
      drm/msm/dpu: make "vblank timeout" more useful
      drm/msm/dpu: split dpu_encoder_wait_for_event into two functions
      drm/msm/dpu: capture snapshot on the first commit_done timeout

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 83 +++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        | 22 +-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  2 +-
 drivers/gpu/drm/msm/msm_drv.h                      | 10 ---
 5 files changed, 69 insertions(+), 50 deletions(-)
---
base-commit: 33e1d31873f87d119e5120b88cd350efa68ef276
change-id: 20240106-fd-dpu-debug-timeout-e917f0bc8063

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

