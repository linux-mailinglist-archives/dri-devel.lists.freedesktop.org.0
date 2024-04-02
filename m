Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF8D89601A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 01:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C313A10E521;
	Tue,  2 Apr 2024 23:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Uj2Qgq1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E2310E521
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 23:28:19 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6ea7f2d093aso5413972b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 16:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712100498; x=1712705298;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X3rS3x3PbfqD0H+IhqCkxsyWXA4J2zLyAhJNBySLBMM=;
 b=Uj2Qgq1vhBf1e1gJz+6mFpNb57V+WSVKXWFEP2SPxcBGQb22Hx8ubheuvu8LsJiaj+
 Wp8hVRgELt5NGTDVOe0HBx/fHlsXdUt5Fr3azX6dGqmw5B/1o/GjXCWYP/lhKBGiIpPQ
 S3TlfSVQd8uEZF7LmTEnjCmEoD4WEDP4re5KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712100498; x=1712705298;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X3rS3x3PbfqD0H+IhqCkxsyWXA4J2zLyAhJNBySLBMM=;
 b=rhSQ3ipXkcBrcGbt1u2HtazEZq8oA8sRAdH15vdsmktH4YZ3RdxkYoRjs39JiV8vSM
 DnFXoMF0UfT03n5Jxw+X/9jtEF1sZ7AHpTpnZWtLhVjTq4rHxG2wwG61UgDNoROLO+V2
 bodc5cgprU2wh3ArPOQS6rKoFwklPex121Aupa2WajKQb+rY+lXXb5scg9L24tufevMh
 vcczHy3JfqYME3ruzpB6GbW+5vFxFOAeeTeUgOHjCuCvXVQ3k89d6vuJxYkjUhb60t8l
 h1KjXYGv6Sc6RUDDeLaU4ZTKMWc6/lmFKX2c6OUf6tItXB7jbPCMbTBicyC4wM04rx11
 YvSw==
X-Gm-Message-State: AOJu0YzsbIigRCJyYqj1WxQtyM+mHgQrz+mR7lkRrYoe7mXMZXXsjKTV
 niq9Cq/5z2vUshItEDBJt909q9IHdezakV11Lxs7VWe1+iku58uOj78tPOHjFt7o+2JfqCZnHbB
 S0Ukl3Zaowh5CBgITv5u1K5Nf/QPvpyxr/oiWuEGGlskxORMPQ2hxYnZ1uEMtXU8siDnnx9GP6s
 f6eGCWCabhVVfvttJOw+WkO3k9cTLW/pcZwKEwD7I1sb8cd3CaLA==
X-Google-Smtp-Source: AGHT+IHGH9F3ownPIsgTyqubJm48LFVa7/Bzgy1Nm4KnCEjkISuYhUDvoC9x4gC8+Y5/uv7TWMRm3w==
X-Received: by 2002:a05:6a00:2e26:b0:6e4:76b5:7dd3 with SMTP id
 fc38-20020a056a002e2600b006e476b57dd3mr1413585pfb.26.1712100498213; 
 Tue, 02 Apr 2024 16:28:18 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 i21-20020aa787d5000000b006eaada3860dsm10385121pfo.200.2024.04.02.16.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 16:28:17 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH 0/5] drm/vmwgfx: vblank and crc generation support
Date: Tue,  2 Apr 2024 19:28:08 -0400
Message-Id: <20240402232813.2670131-1-zack.rusin@broadcom.com>
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

vmwgfx didn't have support for vblank or crc generation which made it
impossible to use a large number of IGT tests to properly test DRM
functionality in the driver.

This series add virtual vblank and crc generation support, which allows
running most of IGT and immediately helped fix a number of kms issues
in the driver.

Zack Rusin (5):
  drm/vmwgfx: Implement virtual kms
  drm/vmwgfx: Implement virtual crc generation
  drm/vmwgfx: Fix prime import/export
  drm/vmwgfx: Fix crtc's atomic check conditional
  drm/vmwgfx: Sort primary plane formats by order of preference

 drivers/gpu/drm/vmwgfx/Makefile            |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c       |  35 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |   7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |   5 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |   7 +
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        |  32 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        |  51 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  26 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |  39 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c      |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  32 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  28 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       |  42 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  44 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c       | 630 +++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h       |  75 +++
 17 files changed, 963 insertions(+), 109 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h

-- 
2.40.1

