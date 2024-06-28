Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6091C708
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 22:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FFE10ED39;
	Fri, 28 Jun 2024 20:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SF+J4Mku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8693410E0AE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 20:07:34 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-444fdb6c1cfso6423051cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719605253; x=1720210053;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BBpJW+Gf1o1xBVec+61sLZ56vS/QqyS6ZhxeGdhONS0=;
 b=SF+J4MkuOGPGrxuMRQ2F0Q66Cl9BY2J423hA4Snsbzweg8Ps52GdtQCbPp+LQR8tT1
 1n9PMn4tzqiZ05VgrILxd5oKoVVSWoc9frHuruBIuI6puDfgfwyC3QAblH1dD8QGwWgu
 LiCuAT8m/qtE81Knqe7MEgiBgX2TV0CXy/jzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719605253; x=1720210053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BBpJW+Gf1o1xBVec+61sLZ56vS/QqyS6ZhxeGdhONS0=;
 b=j7wLKCYfbQ4hiljFpb2/TUr93OxPuv0fFOVNdCXxqFzwD8MNQz6CzsDrezFFBtQa35
 5t/SGME0p3G0rx0Q84LhnlEV3NLWzTh2sI6LBC0VEjp0ewOmeiRkMsUNMGbrxZ4h0Kyv
 JodmRZW9dQGtDZYvuAqAJ5GWL8QInTlAUuCtIKg063v+teKVLka3Wu6GUrj/TIAy7zpS
 iRe9FyGMpusmM9qifrH4xkXBKbQKOJXh7/t7pDPb4Yrteq/wjgtVd6HKvLbFaxoiiLE9
 eGNdG7rA2a47wbZjey5AYz1GyZEiVycuryeu1h2nYdcv+vAXYkN2jGlQ3AzIo6KW54M0
 nQhQ==
X-Gm-Message-State: AOJu0YzHwIuVLsPTQyh9+gmVJFRC8fIYtpP/bW8n+rl/qicEM1kkbw+h
 q/qZI/R05LBjVuckITJMK1jXbNHOr6TEoRlfh5lire8va+zVopIG/w53M75ArcC9ofyN4Tg8vJi
 6Xg1KEV0Sz5TA+5y1LGvyAfS/RozDhRJxJ8KIp7gc6SLX0oRKv/5zEM50GpRGduARjzuudO30FE
 O0kDHDlxS7cJrU4MvtxrdIpZs8O+HB0lXXN8Rn8wV7vC8nafTuXNbL
X-Google-Smtp-Source: AGHT+IHS1vOcQLL/igwJw9dJMINxww7nVpSRawCiqyI9lLS65RhRl8kT2B5t0LB7h8Swq7DMZ4M6dw==
X-Received: by 2002:ac8:5755:0:b0:444:f4dc:e09b with SMTP id
 d75a77b69052e-444f4dce4bcmr141867501cf.17.1719605253154; 
 Fri, 28 Jun 2024 13:07:33 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4465140bf35sm9972351cf.37.2024.06.28.13.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 13:07:32 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 0/4] Fix various buffer mapping/import issues
Date: Fri, 28 Jun 2024 16:07:25 -0400
Message-Id: <20240628200729.754669-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
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

This small series fixes all known prime/dumb_buffer/buffer dirty
tracking issues. Fixing of dumb-buffers turned out to be a lot more
complex than I wanted it to be. There's not much that can be done
there because the driver has to support old userspace (our Xorg driver
expects those to not be gem buffers and special cases a bunch of
functionality) and new userspace (which expects the handles to be
gem buffers, at least to issue GEM_CLOSE).

The third patch deals with it by making the objects returned from
dumb-buffers both (raw buffers and surfaces referenced by the same
handle), which always works and doesn't require any changes in userspace.

This fixes the known KDE (KWin's) buffer rendering issues.

v2: Fix compute_crc in the second patch, as spotted by Martin

Zack Rusin (4):
  drm/vmwgfx: Fix a deadlock in dma buf fence polling
  drm/vmwgfx: Make sure the screen surface is ref counted
  drm/vmwgfx: Fix handling of dumb buffers
  drm/vmwgfx: Add basic support for external buffers

 drivers/gpu/drm/vmwgfx/vmw_surface_cache.h |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 127 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  40 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c      |  26 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        |  62 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        | 453 +++++++--------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |  14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c      |  32 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  33 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       | 145 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    | 277 ++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c       |  40 +-
 15 files changed, 788 insertions(+), 530 deletions(-)

-- 
2.40.1

