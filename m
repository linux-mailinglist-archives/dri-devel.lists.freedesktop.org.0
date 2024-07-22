Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316EB9393C5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 20:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3755810E0EF;
	Mon, 22 Jul 2024 18:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ZAO/9QzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C0710E272
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 18:43:24 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-7035c367c4cso2545766a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1721673803; x=1722278603;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LfSvAb06oqKelT4dZ1Tzhrs0Aj85QwCtxm1RWqjCJao=;
 b=ZAO/9QzMtfWdCI8ejruFwfVxH5+YF5cGzXi6BMS6DinOo+NivQ//EMBBs4qo+i+9p0
 0IbySzLUEh4DcXjhQwdlqkNUV/Sp9SVp+e095j5Mtb42QpxeMJG1DnTeNNUcx+5B0pjn
 jwQ6SV42PB4fRwHbDoCEyrVpXUCfQhMhHxDu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721673803; x=1722278603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LfSvAb06oqKelT4dZ1Tzhrs0Aj85QwCtxm1RWqjCJao=;
 b=JpZUeuKby86eW3G7MWqMj1xit4c0JnxFWOnvOw8q0TaNcGgrIhC861lU3xCGFKYzMP
 yoZtkJGmBo1nw9l4aH2Wt+Jbz2AZn43iLFyTgWTMtRxzh3OjIO/ZFUFSFnav96ouY3/L
 CTzFwUS6VT/Ui14Xp+rLvb78qOJqKFhssQjO2addB4lxaze9S54povI195IO0nzbugav
 bEPJIpYGX83jOUTsT1QBa39MoLB8LjZDwCM9fgf7AWqh2kEx8SuU/UzbiiXUwlR497ZI
 QWk4CRUZ3Cx1COWimLhXohbzY7mDS2amqExEum+5l0hkw6cUdDD/bejyDr851YCQj6Rh
 fvRA==
X-Gm-Message-State: AOJu0YyfBo8U+8L5rfvuhM1X9g8RdF8F3SoDhmaYZz7jGyss5PF/YrIj
 kZcn080ORFACkJFhqUU2uenOW8cr691TwgImZjPHhfASsLlYmrAxlcBfVlPmUTLQbia3u6oh5e/
 2rzjXQUD48F56sroNSGwCp/2Hiu0ttzR8bbxMVkqDjkttMwp5VKqmpbu0rT0vHd/JoYr3iT7nIm
 q9iocYDQhoACZ+If5fg29gJ7CFxQHilGg6q4RMT46+DMSX26rVFg==
X-Google-Smtp-Source: AGHT+IHICo7kMIG/1R5KBMcSJqF7A4M7bG9P8qG2eO8s43RF8bpCD0VWFtoE8murT6nv7VT+89n4dg==
X-Received: by 2002:a05:6830:6d17:b0:708:7dbe:61f6 with SMTP id
 46e09a7af769-709009ddfb6mr11312290a34.29.1721673803305; 
 Mon, 22 Jul 2024 11:43:23 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7acafdb01sm38261466d6.129.2024.07.22.11.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 11:43:23 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v5 0/4] Fix various buffer mapping/import issues
Date: Mon, 22 Jul 2024 14:41:12 -0400
Message-ID: <20240722184313.181318-1-zack.rusin@broadcom.com>
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
v5: Use map.virtual to check whether an user buffer is mapped instead
of map.bo. There's no change in functionality but we do use map.virtual
to check whether a buffer has been mapped elsewhere so usage of it
is more consistent. Spotted by Ian.

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
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        | 502 +++++++++------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |  14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c      |  32 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  33 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       | 145 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    | 280 +++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c       |  40 +-
 15 files changed, 827 insertions(+), 534 deletions(-)

-- 
2.43.0

