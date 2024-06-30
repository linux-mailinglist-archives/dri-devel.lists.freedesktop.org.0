Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5818B91D2EF
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 19:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF3E10E0BC;
	Sun, 30 Jun 2024 17:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P7wKBX/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABF210E0BC;
 Sun, 30 Jun 2024 17:00:30 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-79d879dc431so27514585a.0; 
 Sun, 30 Jun 2024 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719766829; x=1720371629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QhZDIO5zwyKjVc4uVRuo8HZwK5NnMF2vQ+RShUGl63Q=;
 b=P7wKBX/mFkQ2PI/kbZLPHbQeP+0gdVwg1najZVvwLUTaPD/Kl4Rsj8gPOy1t8Ns5zq
 dZtZ+nYforf8FdiHxziS6W4FG4BXlLOF9sWbaLYelZLzOS+enUjZI3/8qcoyzn6zlqGN
 /HhIbEYCFu+rmXtnoVKt29GXdCKTheF5c4RImEh+trhSAQ81jaqYjUTG73eaedti4uqk
 mUqThvbDv/tU198kHRq7x4yMYLW5OsFi5F9KR45jDi77O0GVMo9unWmOCbD+0w1pT+LR
 aTGezBFXY1hUpZLkQM7TfieC1gLKnGNp+ep+WMtdvuBLqY0Pioct9d4J05+v6CrapRXJ
 lnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719766829; x=1720371629;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QhZDIO5zwyKjVc4uVRuo8HZwK5NnMF2vQ+RShUGl63Q=;
 b=MFFj1a0XPC+OYxoR0xh7BJVO9AIa+mFofDKTo06hZVMBray1vY1mo6KvM0S0C2gwzR
 UJ8/zMcOxKW/8McoA1nJePWCiWlKv76yoLJY0X3boC9BAEFyFuaGuy43oAjV+CKd2/Jm
 VpxZTXb7PNjDCg/UVvELSACkIi28aIpRR5ENelF9N7sUCw+mtqV3BxydK/dIPcfmHezz
 zYa/s9uR8izZxA5SqCndvWPRtiz+tzGvQj7D7lvf+SwLdEuDZqQUSoqKDFR3i2QpEPZn
 QdOBo26gJxqECWr4hgvaxdsvMn6NLJtd9N7KMNWA+GsClDLui+6med5ZElp4n4udNyRO
 OUpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnu7/8U8izcM62ufizr0rMnTFvusg/JibuDXtIXmzEqqR2PZLI1YBNovMUAzO8NXN5sh5602JXH+5ngh1I+mG6jHiCAmWNOxUxR6kvr8p8IPMpFFbS7Fnx3UPf6Nc1hdIv39NyeNhBbEllLeAz9Q==
X-Gm-Message-State: AOJu0YyV5zv6pI3TYHPWWne6s87XTuuVTWP3djzTU4ZHCPXrmJoy6/8A
 eL83KlJZkuR9ytBOZSZOI5d+n9SRs2AReW2FdNN4VOkmDLtbwsIN
X-Google-Smtp-Source: AGHT+IEQWZf8Yo6gbgwJLFPggay24R6Ukeci/k2IqD6vqXm8jI2MY9xxuql7xgKaTohH6ACn4xBJfw==
X-Received: by 2002:a05:620a:2a06:b0:79c:11e5:52d0 with SMTP id
 af79cd13be357-79d7b796fa4mr645307985a.18.1719766829645; 
 Sun, 30 Jun 2024 10:00:29 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d69295f5esm263431785a.56.2024.06.30.10.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jun 2024 10:00:29 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] drm/radeon: remove load callback & drm_dev_alloc
Date: Sun, 30 Jun 2024 12:59:16 -0400
Message-ID: <20240630165949.117634-1-wuhoipok@gmail.com>
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

.load and drm_dev_alloc are deprecated. These patch series aims to
remove them.

v3: Both v1 and v2 sucks. v3 improves greatly on readability.

Wu Hoi Pok (6):
  drm/radeon: change variable name "dev" to "ddev" for consistency
  drm/radeon: remove load callback from kms_driver
  drm/radeon: use variable flags as parameter
  drm/radeon: add helper rdev_to_drm(rdev)
  drm/radeon: change rdev->ddev to rdev_to_drm(rdev)
  drm/radeon: change drm_dev_alloc to devm_drm_dev_alloc

 drivers/gpu/drm/radeon/atombios_encoders.c |  2 +-
 drivers/gpu/drm/radeon/cik.c               | 14 ++--
 drivers/gpu/drm/radeon/dce6_afmt.c         |  2 +-
 drivers/gpu/drm/radeon/evergreen.c         | 12 ++--
 drivers/gpu/drm/radeon/ni.c                |  2 +-
 drivers/gpu/drm/radeon/r100.c              | 24 +++----
 drivers/gpu/drm/radeon/r300.c              |  6 +-
 drivers/gpu/drm/radeon/r420.c              |  6 +-
 drivers/gpu/drm/radeon/r520.c              |  2 +-
 drivers/gpu/drm/radeon/r600.c              | 12 ++--
 drivers/gpu/drm/radeon/r600_cs.c           |  2 +-
 drivers/gpu/drm/radeon/r600_dpm.c          |  4 +-
 drivers/gpu/drm/radeon/r600_hdmi.c         |  2 +-
 drivers/gpu/drm/radeon/radeon.h            |  7 +-
 drivers/gpu/drm/radeon/radeon_acpi.c       | 10 +--
 drivers/gpu/drm/radeon/radeon_agp.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c   |  2 +-
 drivers/gpu/drm/radeon/radeon_audio.c      |  4 +-
 drivers/gpu/drm/radeon/radeon_combios.c    | 12 ++--
 drivers/gpu/drm/radeon/radeon_device.c     | 13 ++--
 drivers/gpu/drm/radeon/radeon_display.c    | 74 +++++++++++-----------
 drivers/gpu/drm/radeon/radeon_drv.c        | 27 +++++---
 drivers/gpu/drm/radeon/radeon_fbdev.c      | 26 ++++----
 drivers/gpu/drm/radeon/radeon_fence.c      |  8 +--
 drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_i2c.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_ib.c         |  2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c    | 12 ++--
 drivers/gpu/drm/radeon/radeon_kms.c        |  8 +--
 drivers/gpu/drm/radeon/radeon_object.c     |  2 +-
 drivers/gpu/drm/radeon/radeon_pm.c         | 20 +++---
 drivers/gpu/drm/radeon/radeon_ring.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c        |  6 +-
 drivers/gpu/drm/radeon/rs400.c             |  6 +-
 drivers/gpu/drm/radeon/rs600.c             | 14 ++--
 drivers/gpu/drm/radeon/rs690.c             |  2 +-
 drivers/gpu/drm/radeon/rv515.c             |  4 +-
 drivers/gpu/drm/radeon/rv770.c             |  2 +-
 drivers/gpu/drm/radeon/si.c                |  4 +-
 39 files changed, 184 insertions(+), 179 deletions(-)

-- 
2.45.2

