Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB106B16CA0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 09:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E352C10E712;
	Thu, 31 Jul 2025 07:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hXa7fcaW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D9B10E702;
 Thu, 31 Jul 2025 05:36:45 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3b77b8750acso231883f8f.0; 
 Wed, 30 Jul 2025 22:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753940204; x=1754545004; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9wjzRFN4mNt2Ahno1y82ZVBSbr4UOHx9K5gFPebp1jI=;
 b=hXa7fcaWJ+2Qht1MzVCEU7Rlf6fr/ZUIIarTooDg/CZvhD+INQpPMytJiqlSKibBFp
 RiZ6Z6aMBW1rawHdH79min+ripME/V/nAjW78jcZYQlwcrNxek3sE/CVje0GQwiii3m7
 Vyo7XD5V4Kil5DlIeh/8iuU4gwWrXzOwxmQD3VxBdSZR83AHcgmWFgAZusVqFRDwVY/y
 oZL65z7dsSXHmEY9vok09Z17gdY7ZpxgnkbzprRSw3xknz2/1a2MXBlnm9Pk2bLDr2m2
 IF/b7p4378fl9/ZDuCfVevRU+q2RTJdIZNCPByFwfCf9zMwxEpbaRvvWFphmWChNO7IT
 Sf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753940204; x=1754545004;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9wjzRFN4mNt2Ahno1y82ZVBSbr4UOHx9K5gFPebp1jI=;
 b=pcQF2de9YsOORmHCnlZvC/eB2/Le0dArO62Z2SrsAXNhBy6Uro7TX9pHksYrKS3twV
 dPZfi08breew5Gqw78+S4z2cHkMYsIzlVybaT5cdZ5PDD4JPEze/s3SXdHQiFp2V5aiv
 ysyWtnh0LKNV/rBc+ozcI8tR9eX63OYdWC3e2AqoUsb4WJNVvO/bDvqgItXBuzi7o3gK
 SglPa3bD+tuopsx0ajjdiCpG3QQdJqGHwoucVJIBCAPQYEiYu7BJr1USKI6vknSsxjfU
 RXtFQo6hCEX/7L18zNOTT0hWBTbB6LfWSFeQN+spWTmLhKmdm7i250UnwqVm2zTE7ICG
 p05A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtrCI352zMaYPfpc+KS3Z8QDCaXhlbHLkJ7nN3drTF0zpxwORW1eFy+CcqqiV4Jf8olnb9JRrAz8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKRn+ZvqiOC6qT9s3zt5OSs0nJ4QnNt4g7KEOoM0nni+ZICg88
 R8ZXaefawLd/Iy2+2efNiZDh5qJx8CfUsHnuC2JpuwWWxSGYhxR0+MkW
X-Gm-Gg: ASbGncvnmfoC5RjVUmY6WaIrPUHzBalmgcxV7wPM6bVK0j30f0aI/9kIM9ToUije7M6
 CSFE3LmKD/G6/t2tXMZ7oQBy7g87lGphP8lgvDIMI5+B1j/KOBqZMsOUx1A38Nuol16KqdXJkYU
 mHKVCjRb8kKmKy5gwv5YKXAKce+0z9qRMit/i9nKcUycdjt95xDn48EnuCK0C7FLw8RC9vDmTBm
 EDUP/d4LtwhfzG5Hnzv8A1+Q063pOA1gjz6lTG6HSj20R9CjRRFZT0JVI00VJs4YrD2V79TphvN
 OWv9gqehYX1ltATRpOBiSR90WkVMiz4hvJAzWhxtYnbADoMbmqFeLUACgn8ZZGi4IO7rSXMIF9I
 l/Ko7nzwftTeg2u4bcTf3iCDQe/gWjrCGKOVnJT4N/MKLouqVQa628gHVK4Ia
X-Google-Smtp-Source: AGHT+IHZzT2X7dcyUlKwCrocUxoHjRp8HDiN+RWizQinctQQjrI6tN9tQPybT24AfCWIZ5kXsrV/ig==
X-Received: by 2002:a05:6000:2dc2:b0:3b7:908e:e4ac with SMTP id
 ffacd0b85a97d-3b79d42097dmr494133f8f.2.1753940203459; 
 Wed, 30 Jul 2025 22:36:43 -0700 (PDT)
Received: from [192.168.1.205]
 (dynamic-176-005-138-071.176.5.pool.telefonica.de. [176.5.138.71])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac093sm1149137f8f.9.2025.07.30.22.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 22:36:41 -0700 (PDT)
From: Philipp Zabel <philipp.zabel@gmail.com>
Subject: [PATCH RFC 0/6] amdgpu: Avoid powering on the dGPU on
 vkEnumeratePhysicalDevices()
Date: Thu, 31 Jul 2025 07:36:33 +0200
Message-Id: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEAi2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc2MD3SQT3ZT8vBLd8sTsVN281IoSXUPztGQDI0NDE2NjQyWgvoKi1LT
 MCrCZ0UpBbs5KsbW1ABBVMXpoAAAA
X-Change-ID: 20250730-b4-dont-wake-next-17fc02114331
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Philipp Zabel <philipp.zabel@gmail.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Mailman-Approved-At: Thu, 31 Jul 2025 07:23:44 +0000
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

This is an attempt at fixing amd#2295 [1]:

  On an AMD Rembrandt laptop with 680M iGPU and 6700S dGPU, calling
  vkEnumeratePhysicalDevices() wakes up the sleeping dGPU, even if all
  the application wants is to find and use the iGPU. This causes a delay
  of about 2 seconds on this system, followed by a few seconds of
  increased power draw until runtime PM turns the dGPU back off again.

[1] https://gitlab.freedesktop.org/drm/amd/-/issues/2295

Patch 1 avoids power up on some ioctls that don't need it.
Patch 2 avoids power up on open() by postponing fpriv initialization to
the first ioctl() that wakes up the dGPU.
Patches 3 and 4 add AMDGPU_INFO to the list of non-waking ioctls,
returning cached values for some queries.
Patch 5 works around an explicit register access from libdrm.
Patch 6 shorts out the syncobj ioctls while fpriv is still
uninitialized. This avoids waking up the dGPU during Vulkan syncobj
feature detection.

regards
Philipp

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Alex Deucher (1):
      drm/amdgpu: don't wake up the GPU for some IOCTLs

Philipp Zabel (5):
      drm/amdgpu: don't wake up the GPU when opening the device
      drm/amdgpu: don't query xclk in AMDGPU_INFO_DEV_INFO
      drm/amdgpu: don't wake up the GPU for some AMDGPU_INFO queries
      drm/amdgpu: don't wake up the GPU for mmGB_ADDR_CONFIG register read
      drm/amdgpu: don't wake up the GPU for syncobj feature detection

 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  80 +++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c  |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 137 +++++++++++++++++++++-------
 6 files changed, 194 insertions(+), 36 deletions(-)
---
base-commit: 6ac55eab4fc41e0ea80f9064945e4340f13d8b5c
change-id: 20250730-b4-dont-wake-next-17fc02114331

Best regards,
--  
Philipp Zabel <philipp.zabel@gmail.com>

