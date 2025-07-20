Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EDFB0B2D1
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 02:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FA810E0E4;
	Sun, 20 Jul 2025 00:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e8mAgFhx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1336910E0E4
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 00:02:02 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-236377f00a1so26660085ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 17:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752969721; x=1753574521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=OMXYFyLZ9LRVuoYvq7JlpXm9rj1HGO9gOfANGlZsnNU=;
 b=e8mAgFhx+fWOI5dXPSyZ6lUgIGxmsWK2/C/3cz5Ufv4nv8gFbnAyrgaBHiQwy4ela3
 s5V9ui5uf7wQdcocgpTshBGj4p1PYt1WEDbkl2Kj5siil0gB/oKs8ddfjD6iq9X44Ubd
 gtYyhYOOPBSK20XxAI/6J4KPpA7R5i3ZyfgOkfusSvktaHrYw5I2v/YG0qM4pcBN1Q9e
 M3J7rv/SHw/w+OxNA8xn/g1BLs2H8B+HHCwsYLzy6ZPMsL93NOY0b+N5bKNqcnSBkujJ
 7zcYXS0mqt8GNyoBn4l1LCscAeB2yCAMFytmAXyMsNsM54udRgbZmZXO4q09F2AtwD1/
 cj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752969721; x=1753574521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OMXYFyLZ9LRVuoYvq7JlpXm9rj1HGO9gOfANGlZsnNU=;
 b=PqMpMb5Yh+KLU+WMMI5krAplKEBF2U19RFiEVBUqDs67fh5ka3nDCd5digeOE4nd/W
 Ah67q+SZPbkqonpqk1t/5nU+Oj4Fzq86x2Wfgvich5eJUPMlUR+z0PQpNKdY87nkfejB
 czUmwH3XkVcgIyx2da6SC3OQ+Ffypm91rJXv/sbMP2dX9tlJQUWjQ/a0v/RFGmPfNghT
 MYeIj6oWx56a0wILxFLcllg5MWPUrDpSFxsbUsOnC58ibDmno6oKGouadl7naJxMR7ri
 0y2xkxVSsNOrdiOmJjf9dFQHJv9Ra21AUpkxEtcwDHJTfhsC8jUDN7CXJ4akNQ1ulxgo
 mMmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHOljGolMm8yAIV24ciIYuoO4PtiHpqO4ITWm/RBOou/tkuRSJtyZ4RwDmQ1t3ma5dwU19gwZ8vy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZXcEoZI6JrmALLDtiMQ0Cvg/LGwPo/G5AOIdSfjTy+lwWjj3C
 /kebXT8mSbOMPHjtOBjG+EUzuhRyst8BNkdO/+EYUSqSeZjS90Yz5/gO
X-Gm-Gg: ASbGncugcAjy5mk9sSpp08Fc2JiYxChgMlBY7eWD41zmxKx9WByAiBKXosw3V6JPVY1
 TOY5EB0d1jEY55zXr4vFHChS3PT67UoplB9gLWf3Q/96PS766rDUiJGUuTukc/HBhs2PI6XOlwU
 RnVutdpVQQpVYKFHIeJvDAInMtvrqSY+vQV3EnqrkhSQ3PVHXBF+/1SiaODnAy/NZowB2CgmU5Q
 eumeQL4I0r6WS6XJ9zMmqOOcQgBPluk8lU8Mt/5cAXZ9dVxkk/kiZIGh+5cIXK3gIKW3p1dIrTO
 D2LcSHYh5zeBSjJNVXSMqza/mBfbAXamX7vgv1wM6kCSZAHDjclIQxmHq6gz0tpeyua4Vg6ql21
 1WMwX6ipgh3f/pZt7r5kidHpBJG3KYhwHeBdkxWbipOxfhvj3BJYs
X-Google-Smtp-Source: AGHT+IEWhzR2mm7DE1QL76lEZq9yVKIipYDARtaJz7Dl9K267KKRrQQk077MGORFZcrIgL6+UJPf9w==
X-Received: by 2002:a17:902:e804:b0:235:779:edea with SMTP id
 d9443c01a7336-23e24f56b2emr264152565ad.38.1752969721497; 
 Sat, 19 Jul 2025 17:02:01 -0700 (PDT)
Received: from localhost (111-252-5-201.dynamic-ip.hinet.net. [111.252.5.201])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23e3b6cfb89sm34023075ad.132.2025.07.19.17.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 17:02:01 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] drm/panthor: add devcoredump support
Date: Sat, 19 Jul 2025 17:01:37 -0700
Message-ID: <20250720000146.1405060-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
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

This series adds devcoredump support to panthor.

This is written from scratch and is not based on the prior work[1]. The
main differences are

 - coredump triggers on all faulty/fatal/timeout events
 - state capture and state process are two separated steps, with
   GFP_NOWAIT being used for state capture
 - state capture captures both sw states and hw regs that are
   potentially interesting
 - coredump data is in text format, similar to what msm and xe do

A sample devcoredump can be found at
https://gitlab.freedesktop.org/panfrost/linux/-/issues/44

[1] https://lore.kernel.org/lkml/20240821143826.3720-1-daniel.almeida@collabora.com/

Chia-I Wu (9):
  drm/panthor: add devcoredump support
  drm/panthor: capture GPU state for devcoredump
  drm/panthor: capture GLB state for devcoredump
  drm/panthor: capture CSG state for devcoredump
  drm/panthor: capture CS state for devcoredump
  drm/panthor: capture AS state for devcoredump
  drm/panthor: capture VMA state for devcoredump
  drm/panthor: check bo offset alignment in vm bind
  drm/panthor: add DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE

 drivers/gpu/drm/panthor/Makefile           |   2 +
 drivers/gpu/drm/panthor/panthor_coredump.c | 617 +++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_coredump.h | 178 ++++++
 drivers/gpu/drm/panthor/panthor_device.h   |   6 +
 drivers/gpu/drm/panthor/panthor_drv.c      |   3 +-
 drivers/gpu/drm/panthor/panthor_mmu.c      |  54 +-
 drivers/gpu/drm/panthor/panthor_mmu.h      |   4 +
 drivers/gpu/drm/panthor/panthor_regs.h     |   6 +
 drivers/gpu/drm/panthor/panthor_sched.c    | 104 ++++
 drivers/gpu/drm/panthor/panthor_sched.h    |  14 +
 include/uapi/drm/panthor_drm.h             |   7 +
 11 files changed, 989 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_coredump.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_coredump.h

-- 
2.50.0.727.gbf7dc18ff4-goog

