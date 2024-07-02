Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA991ECE7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 04:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCCB10E090;
	Tue,  2 Jul 2024 02:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Rs1YMnIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1AF10E090
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 02:12:58 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-446416dccd5so17891421cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 19:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719886377; x=1720491177;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b/a3Uc3hoQUfgXywuwW/lQEXcTRLjyKZ6EC0IMuKPho=;
 b=Rs1YMnICl7C2btvBFk2sv5xM2N41chchQrT0kdA/V7QvWZX1lU5WEcGiUJWo8Miegw
 QRa7uJdme8eAtBRQabSTgCeoZrM9Hb1sAqVrw36o8SVnhFSU99FDeAaCEh6Xsob+cHz/
 TJOLVDEecbyPsFyr3fXswP5dkq4WLqFuehTug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719886377; x=1720491177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b/a3Uc3hoQUfgXywuwW/lQEXcTRLjyKZ6EC0IMuKPho=;
 b=AYQegEBjC8Ln6dY55/s1NGfjWM2WKwxfKuULZh6tXGoFY0LT/AeoXvS+QCa0iN2xIV
 DJwpKZ0+wOLoojMiglq0s2VxPKbqDTmGpgM1uL9SfeLA0Cr2rDiOaisAzltQrz9ugxKb
 QKVKuwr2OOXmbi/yo9wNKYC9fVsLJrud9OhW5AeTSvR+7F3KPJ7MDGWAPZwCA/4feenR
 iQTVnE9XGYnGdXf1yJNLSxiehM0a4+A5ZTAwI4FmVusblJVpQlTEbWMBzPQT0M9I8cmf
 aY3OQg5js1zh3PVMSQ+ViTy5VV//BdFNddrO1g/10IXixMk8vRBf8xNbgeMg1E6ZHFFB
 o5cQ==
X-Gm-Message-State: AOJu0Yx0oDVCSYvBa1iXfw1TrLlm62ruQTReyv+Mihj4KhZcNvV5CWp/
 0mqgi2324gmZfZrKF4CXQbgFIr6VDXD9Lv1v6/9yGklRJnSbw2t0sQNSrBSHyEIVZmqeGdvVW6+
 fzT9u3mp6agYhf60vHSNJfgAwpXSpmORc7j37W4yOAr9edmN90gBpDY2I4oBzUpDUvgPKD89UAE
 EyHS/mvXu8G0x7/BN4QHILWpZSun6V33Hi2NLgHSXSb8lQ4+9a7dfb
X-Google-Smtp-Source: AGHT+IFcDj5INNr/PGYJCHzG9oWKf7n5dDAiIBHplzHr1/ZIzEpxpU7QWQ7yrxO/fqXSO9uilErXLA==
X-Received: by 2002:a05:6214:2129:b0:6a0:c903:7226 with SMTP id
 6a1803df08f44-6b5b70cad0emr97589756d6.34.1719886376842; 
 Mon, 01 Jul 2024 19:12:56 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b5bcf1acc0sm21799366d6.44.2024.07.01.19.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 19:12:56 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 0/4] Fix various buffer mapping/import issues
Date: Mon,  1 Jul 2024 22:11:27 -0400
Message-ID: <20240702021254.1610188-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
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
v3: Simplify the first change which fixes the deadlock in the dma-buf
fence polling

Zack Rusin (4):
  drm/vmwgfx: Fix a deadlock in dma buf fence polling
  drm/vmwgfx: Make sure the screen surface is ref counted
  drm/vmwgfx: Fix handling of dumb buffers
  drm/vmwgfx: Add basic support for external buffers

 drivers/gpu/drm/vmwgfx/vmw_surface_cache.h |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 127 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  40 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c      |  17 +-
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
 15 files changed, 775 insertions(+), 534 deletions(-)

-- 
2.43.0

