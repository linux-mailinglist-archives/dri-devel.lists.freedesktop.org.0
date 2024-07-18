Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A35B93509A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 18:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B026010EA11;
	Thu, 18 Jul 2024 16:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Vf8210kG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A48310EA11
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 16:22:43 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-79ef8fe0e90so33222585a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 09:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1721319762; x=1721924562;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Eyl1O809R/tXd3AlwYP9OEN+IlVVF7JuR3JKTTQXZWc=;
 b=Vf8210kGbap/pTT+cWA4gCu2iydB/vEcEeJstI90O2eYD/9xZ79MmQCe5RqvgYDdMo
 6dc4W3hf8p+Xv1nMo3G2ThP7cemIT8ZKl4ztn4fjMvV2BTCpZGX0Uc3LgOelpi89tgoX
 DZDX618f0WfTc2uCKCRyGEPB+sedpijNDi5p8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721319762; x=1721924562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eyl1O809R/tXd3AlwYP9OEN+IlVVF7JuR3JKTTQXZWc=;
 b=D+Z3iEq/uRJkqp0SEbpadhl+MYbfyvr6rzOFn1SkETI4Ab9Mx1ZE/nVnG+SNEARRMw
 7JeBepAu66DVf63LqG7Wqde6h1KarHDxxgBA+EiEyfRButw2A/YjXHmk5bHNgZ7BNSwU
 UmxzWDtlYvMwtEQsartL8iNxnx1TjJVEyPPQ1r9hF9pJ9kcdDX+ctQ9QsPOrxHHzivG3
 aIPVj9EWz7Hd5jRnuK1LCzUBgwhCBby/Lxs88YGrR4BwvFgR6RyYL8eMXLNO7d/42+E4
 t4azz+jTUBvihLLoI3HM3tNrWXiYb3K/JjENHALn698mFLjxQwmffdzELqtuZZvm8Tcg
 NFkg==
X-Gm-Message-State: AOJu0YyrvNdunZ8R+bWVw0aKnV9HmSippeL+tXp/PpSmz9zKkyDXRzrt
 pHZRb1H5PDIUmc+1cay81om50rSCzceIZS8PbLpoQ/Woq7rTuTP+pZSpJaQUbNXvFMNXBrPXtH3
 7UbTfumpow0Nt3asId54Gn6Zm3Z+WSD8RR7kL/CNEzpkIggzKt7/HqO3WzsEvXkjE/S9GHeljTQ
 IxkDumNlE1uEymdHA8E9ZY+ELFpL/E7bYfPdEF0sUQj32hPbpPMA==
X-Google-Smtp-Source: AGHT+IGPFMkSAEhle2LT7ddSlW/tUX9C0hN9QQbWSV0RjE9WHWotHzk0z19oX7j2CrDOkKAoLqu8bg==
X-Received: by 2002:a05:620a:410e:b0:79f:88f:6989 with SMTP id
 af79cd13be357-7a1938e977emr190584085a.20.1721319762272; 
 Thu, 18 Jul 2024 09:22:42 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1938f8ae8sm39988285a.70.2024.07.18.09.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 09:22:42 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v4 0/4] Fix various buffer mapping/import issues
Date: Thu, 18 Jul 2024 12:21:40 -0400
Message-ID: <20240718162239.13085-1-zack.rusin@broadcom.com>
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
v4: Fix mouse cursor races due to buffer mapping not being reserved in
the third patch

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
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        | 499 +++++++++------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |  14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c      |  32 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  33 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       | 145 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    | 280 +++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c       |  40 +-
 15 files changed, 824 insertions(+), 534 deletions(-)

-- 
2.43.0

