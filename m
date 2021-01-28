Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7930801D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 22:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF636EA2A;
	Thu, 28 Jan 2021 21:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C69D6EA2A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 21:03:42 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id j2so3462642pgl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 13:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WONUXtOBA+aimidJBvuVmUVV583MRFRwJEB2kxrPYs=;
 b=YBojJS9p5xbUaHKy2Lz2exq+I/GlOwWsVyMzlakgcN5k6/BM6757RCUFuEhsw8dCfB
 9UEEpZeZj1zog1T/mkmttEZM8l3dbQVyYDv6LBQdB/UPJOe03VCWXD5VBq0BRQX4KiLH
 ma3VCoVUws7V3pu4w1LfWsKEv02ZUmn/UfmGg4GY77V1wJvPlaOdIRlro9d6Dp9PopvF
 kM5Qmt/lRx5kDPtA06kkMyG3RDp0Pu3B/eGPIRRA9JzNr98Sey/KnZuJbIt1nh8oIh5l
 SHsqgSF3FTXSJpCCzOoNGuU48b99UVXx/HwVY7lwCRKEnfBuDbIIZ09OjEDuXF+ikVee
 C3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WONUXtOBA+aimidJBvuVmUVV583MRFRwJEB2kxrPYs=;
 b=tgaNl/oFLvNgJwtQK2ZUh479cgOtSMu8n7agdpn5IkxIo5QaJXUr7RNFxurhMS94D8
 MJpg8vtP/9XZCxR8sQGCgXB+y/MrOFfwF2uZGfV7qgJSw55fkipd+DbLd0mX/46ZPlbE
 Z+7mlap7tWl21bunjMe0L6//9/CFe0xAWt8bOMVKi9lrb8QuTbuyTVWwE9pUJuEuL1jK
 x7hNERVF9TiT5zD4WY1ldWQM2z22hydHaz8TklY0n+FxsXn45LaqJ9cguFxKlgAJyW5+
 qlm556GPaW8Tdqy6OCtZEkjQNiHElPkxQUaZ9bC9QtvxumZInaj1yMmtaL/bN+SezHKx
 wjhw==
X-Gm-Message-State: AOAM533ULNAd/kdgZ4PwYvAP5RUOcIuU5x/zJVS3OkuQio8ohDXIjS16
 V7LIFva7+tk0nkIVyYPhQ5iLKkuvvmqR1W/6
X-Google-Smtp-Source: ABdhPJyjDHTf5cZ2T8LWCexxoeNi+YORZrAIIvHkgQ9CukxkleXU959cZ4xsh58LnwRvlkSO+tlCgw==
X-Received: by 2002:a65:62d3:: with SMTP id m19mr1313991pgv.180.1611867821498; 
 Thu, 28 Jan 2021 13:03:41 -0800 (PST)
Received: from wildbow.anholt.net ([75.164.105.146])
 by smtp.gmail.com with ESMTPSA id l2sm6753295pga.65.2021.01.28.13.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 13:03:40 -0800 (PST)
From: Eric Anholt <eric@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH v3 0/3] drm/msm: fix for "Timeout waiting for GMU OOB set
 GPU_SET: 0x0"
Date: Thu, 28 Jan 2021 13:03:29 -0800
Message-Id: <20210128210332.1690609-1-eric@anholt.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Updated commit messages over v2, no code changes.

Eric Anholt (3):
  drm/msm: Fix race of GPU init vs timestamp power management.
  drm/msm: Fix races managing the OOB state for timestamp vs timestamps.
  drm/msm: Clean up GMU OOB set/clear handling.

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 105 +++++++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  49 ++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   8 +-
 3 files changed, 84 insertions(+), 78 deletions(-)

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
