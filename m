Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D540B8A23FB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 04:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA99010ECC2;
	Fri, 12 Apr 2024 02:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Uvd5I1U8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC0D10EA64
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 02:55:23 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4349685c845so2537621cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 19:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712890522; x=1713495322;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gNL9yajaFXuSJROBb7rw0BHk0lVhV+eqnBsWv/u+bAw=;
 b=Uvd5I1U8c4YNNE1Qvgrr6LwK3efmkrkXoZh1fBI1c78gQOHVtZ0p6YU7H04ZA0vqt6
 RLFd42PNRUyia54ua0IPITjXowISwNOOIdStL1ccoQKd6X/uwGxvBhhsEmpP1p1BWtbp
 gYFKa+Yh0JNkeo8iwbPcz75qT19WyFdnjQ3hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712890522; x=1713495322;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gNL9yajaFXuSJROBb7rw0BHk0lVhV+eqnBsWv/u+bAw=;
 b=KeA6Rx8zAm0SKBpqMV7MYG5XLkuAR494uAbUoaWf0+WSSGshWNKrXuKNlMCTcO9qKr
 Ww9S2QjvVn1QkYMaYUVfsCWOFtfzjfxQwIcGjRgmvXpm9JIum0ZseMNet5VcJ6UyT4ws
 STPxhmLi3ZhYI7SXSujpmJEcexgFcivUJn/M5IilpsX2chVKtP+S7vaGnljcydaUsH3S
 RcaVtNwZzR7QQ0YiKcexE4FykiYUQL4++DUXe6SvJqGkboaBjB3bp2piszw2nB0HaYKr
 fkDXonatZCpsuq9aiVn82JPaKEyn0TcfruSFKpsJtRDXnN0hFys+41YjpKDd0P2EH92Y
 9CQA==
X-Gm-Message-State: AOJu0YzX3K5miU7B/eFMuCp3IChw1+EuR+afP+jOc3xOcLtn19PZuOuI
 iKlwsr2wWOL9LT6fvYRp0SI15VXEdziHQc95VuSta8sFXH6CLgJfOfXDFtJQ0dlh45eNjd6np2A
 Na4h2h25Jf9m/zi7utd0B5F9kBmMB+ux0WqPVqHFwnTDCgHwykA8l5NSNUdJ+j8ypRiQs7+qYMc
 RIKBnPEuJILKbokUirPdJRQvdLQLTxW1ciJxwKqlm3EeVQxkLq5A==
X-Google-Smtp-Source: AGHT+IHoGI0NJoKM3o5OMLidqxcEl7W21DzDn6sj0S8dTXe4+PM7y+3q03pW36ag0PQmvf/yy/4JEQ==
X-Received: by 2002:ac8:59c1:0:b0:436:93c4:ec70 with SMTP id
 f1-20020ac859c1000000b0043693c4ec70mr279053qtf.63.1712890522421; 
 Thu, 11 Apr 2024 19:55:22 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 t12-20020ac865cc000000b00434ab3072b0sm1682174qto.40.2024.04.11.19.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 19:55:22 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 0/5] drm/vmwgfx: vblank and crc generation support
Date: Thu, 11 Apr 2024 22:55:06 -0400
Message-Id: <20240412025511.78553-1-zack.rusin@broadcom.com>
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

v2: Fix misspelled comment header found by the kernel test robot, a style
fix spotted by Martin and improve commit message in 5/5 as suggested
by Pekka.

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
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c       | 632 +++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h       |  75 +++
 17 files changed, 965 insertions(+), 109 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h

-- 
2.40.1

