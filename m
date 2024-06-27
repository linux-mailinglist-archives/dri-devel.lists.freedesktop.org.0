Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C82919EB2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 07:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0661E10E028;
	Thu, 27 Jun 2024 05:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="LrMVSXMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2793610E028
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 05:34:57 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4463be6230cso3568871cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 22:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719466495; x=1720071295;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zmb3RjHCoB9mRrlzu9YpHQfhvJwF3YPL4II67EVqP/s=;
 b=LrMVSXMSD6790NIt4k7xaT7zYJoIMsDmqy1ZIfe0wvM3gC75L9jDkG+4agPMtmvpcH
 D4nWEpubchyMFmGvDNtkNMOM/k3cKuLnRkLJ49IO+6Goe3IwubJJHtQnpOJFqZ5Z09zk
 Az2s2S5WF4WGx0Ve6FgzlIvAtkq0i7kF34Bh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719466495; x=1720071295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zmb3RjHCoB9mRrlzu9YpHQfhvJwF3YPL4II67EVqP/s=;
 b=wybzTBYrrgqeiMEUHv7jHPXDEL0fmRi069a1vtaGZCoX1D6WeRsHbAmS3KmikS6lcy
 aXXcp291lv/BvyzbiPbJyByzH//WIT+vb4XcvcNOqeSNQNDZBWtMaF+ukYnbWNTUtYkH
 INahmvvzTnzTEIezXFZb7h2d1OIhmTpdm0H5Mbc7QJQ9V/ZDhv9RKdBTrsJ7WMaovw/D
 VErJrhzFCojefdc3ROHlJ4qmrEc8zDncbyniujQ/dpn4A8AUnvi+uHkVvPnf5RnPLY9j
 i/fvksSPaY2p9HT4BibiyEsenwjfARghXjbVY0Smj3F97IfEStkm8L/ITEVyA2eodUm0
 FNSw==
X-Gm-Message-State: AOJu0Yyc4Kh1ZLe39p1Xb89DEnHw0ZqlTib/ZQS51fxQ7386i25R+qYQ
 UdMt3SsO25IE4gioBJeAMBGfZqEQkIWgo1a4bu0efVIx0F+HxahT0iGvFy84v7c2KyKLca9Cszw
 OXpkL27DMsZTZAuE6dwJ8PajP9j8tdyAf5QAp+fCUnj96A97NZ0dzohWPOZHdOYynZ5yQAFPesM
 cekRlHsHRQLHOdJQdFQ6x0txuKWxtPpg1c6hs+FrZByBsSygQ49RSo
X-Google-Smtp-Source: AGHT+IGJLWH/kD6NDLFIItoBK0OMAPCmht65wzxAVbYXk1HKR66fqCUFbuzoFDVTcqGSkKxrvzIZNQ==
X-Received: by 2002:ac8:5f93:0:b0:444:ff0b:adb0 with SMTP id
 d75a77b69052e-444ff0baf42mr66588111cf.64.1719466495314; 
 Wed, 26 Jun 2024 22:34:55 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44641eebfa0sm2716971cf.48.2024.06.26.22.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 22:34:54 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH 0/4] Fix various buffer mapping/import issues
Date: Thu, 27 Jun 2024 01:34:48 -0400
Message-Id: <20240627053452.2908605-1-zack.rusin@broadcom.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c       |  37 +-
 15 files changed, 789 insertions(+), 526 deletions(-)

-- 
2.40.1

