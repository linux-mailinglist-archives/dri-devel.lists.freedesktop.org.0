Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70225B0AEA1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 10:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7FD10E03F;
	Sat, 19 Jul 2025 08:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="MhexPego";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B8510E03F
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 08:27:02 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-74ce477af25so1898367b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752913622; x=1753518422;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EPId7hlRtak29cJpHNdXMRMJJGzWtgzI1RuZFg9RVGU=;
 b=MhexPegogMq2TLFSGxLtet7iC/3KIUdj8evdoXqlrBCuxHorZBl21kUD2ib38gU4Nc
 fHC5D7VmqWuH/y2hvmlAmyXeqX/Y8WXis13wx+eSjQdR4UI8hqwUMTvEgL6LJLYxYkwV
 xtgFWI1RIGy2QC8cOOsQXcGU19BoG8hloE2/RfElARu3DeiBThUef3xh+yF4I01CB7F8
 qnZ0rxZmFiFz1yTqqEGeRIPU5cJyRo4KeDRkCf7R1zWnZpUpPAztfdz6T6p/Zkt5jQsL
 rwTV3u5wl+uEkSmFYDJr6oSBYpQuh79TdatEPRfbnSkZRw/7Ulb/w9VcTa9u+wKoB6c0
 nUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752913622; x=1753518422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EPId7hlRtak29cJpHNdXMRMJJGzWtgzI1RuZFg9RVGU=;
 b=lklIjd9vlBVbBbAtBONwlYeUxXOdzR5YFdGhot0XEYzkzESkuEUjPtBiG7/8MQI3cm
 ny/B2FcvGAx+bwhfRTQkMNlSk4EOiTzmOnYzMEHmd+1vRSCT29WTYMPRAgVmYP6LJgGl
 FQGd+qy2ctaJo2BHizyL2y+lG39IqkV3YnvRlR5U2W+zrOoaSDz3YoFz0VT/sQ2wyrtI
 6M+c5SG7eyOGq7fb66p+OSvUpYMcGEaoEVFJTJzlOnzLFthifIT+jPG+C1v+QWEd58Nx
 BzDWuQDqeY/2O12HDUMILIbCm7IbkZqTXzRmYHjjOYvFn/QqySjGfjZYHxK+rSAgCYn0
 vgUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcToP2VaCX1oy6nktOjB9YZV72IXdAV1wrPlEgKJpO9n2cIRvWGBG+rNBiUvCpIjRm/ANimL+0nCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+TF5/lwsK2jjzm62pJrldrhmU96W0/laGa4eon+s8pG0hPnmp
 KmsKS1Z4ggi9aqQCbyBmfw6C1jEC/wWQzYWInDqBPonITp2C//8he7HJxReAxBlE2Sw=
X-Gm-Gg: ASbGncvkNiSf3grmHtaekeRMN6EBPaxU0WbwkpqVnSdKv3ctJxBUehlGEohD56ACqFf
 pSQnTwiKpRiwmiW/E6fkt68k97ZBDKv5w8F9ZEwL5mGcQ0j3oTcvGt7sR64GRFSAxzjnHuG+/fL
 WVMrJjVtvvYY4WbSYUC8rz7wSsLS1s/jEuRyBw7DeR5cFSfgq70PGUiYlZWoyI2QMxuZTyTX1ld
 AO5nCxLbC5Cx5qwmEjM2l5lqYFzlGSBNxnfkcuoJGsJxb9L5xnMbniRRF3UybIA8s+34lz9OfUV
 8khSImkjU+o5xGcsmekcIPcL9bxZZZfcZpu/xzMwFcxVavLZx5H/u9MbunrddjOk6BNbe48Nfzf
 bkbF/Kx512yxG3pSOw910pT5Ux3SPz8AWjrJgvw+33/XIqBZCUw==
X-Google-Smtp-Source: AGHT+IEzBjqgE2BlaLz1oOWFjBrHioQyEDfCtdHE+F0FDfd8OvpCDexvgvzMEwrHYyRAhMYVJmlFCA==
X-Received: by 2002:a05:6a00:3a11:b0:736:51ab:7aed with SMTP id
 d2e1a72fcca58-75724180944mr17224932b3a.16.1752913621977; 
 Sat, 19 Jul 2025 01:27:01 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 01:27:01 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v5 0/4] drm: Fix bug in panel driver,
 update MIPI support macros
Date: Sat, 19 Jul 2025 02:26:34 -0600
Message-ID: <20250719082639.307545-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
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

This series removes the unintuitive mipi_dsi_generic_write_seq() macro
and related mipi_dsi_generic_write_chatty() method from the drm
subsystem. This is in accordance with a TODO item from Douglas Anderson
in the drm subsystem documentation. Tejas Vipin (among others) has
largely spearheaded this effort up until now, converting MIPI panel
drivers one at a time.

The second patch of the series removes the last remaining references to
mipi_dsi_generic_write_seq() in the jdi-lpm102a188a driver and updates
the driver to use the undeprecated _multi variants of MIPI functions. It
fixes a bug in the driver's unprepare function and cleans up duplicated
code using the new mipi_dsi_dual macro introduced in the first patch.

changes to v5:
 - Rework mipi_dsi_dual to explicitly not support passing macros into
   _func and add "dual" variants of the generic and dcs write macros.
 - Make jdi-lpm102a188a use the new
   mipi_dsi_dual_generic_write_seq_multi macro.
 - Make local struct variable in jdi-lpm102a188a conform to reverse
   christmas tree order.

changes to v4:
 - Fix whitespace (I forgot to run checkpatch. Thanks for your patience
   as I familiarize myself with the kernel development process)
 - Initialize mipi_dsi_multi_context struct

changes to v3:
 - Define new mipi_dsi_dual macro in drm_mipi_dsi.h to reduce code
   duplication.
 - Fix bug in lpm102a188a panel driver's unprepare function which causes
   it to return a nonsensical value.
 - Make lpm102a188a panel driver's unprepare function send "display off"
   and "enter sleep mode" commands to both serial interfaces regardless
   of whether an error occurred when sending the last command.

changes to v2:
 - Remove all usages of deprecated MIPI functions from jdi-lpm102a188a
   driver instead of just mipi_dsi_generic_write_seq().
 - Update TODO item in drm documentation instead of removing it
   entirely.

Brigham Campbell (4):
  drm: Create mipi_dsi_dual* macros
  drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
  drm: Remove unused MIPI write seq and chatty functions
  drm: docs: Update task from drm TODO list

 Documentation/gpu/todo.rst                    |  22 +-
 drivers/gpu/drm/drm_mipi_dsi.c                |  82 +++++---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++++++------------
 include/drm/drm_mipi_dsi.h                    | 112 ++++++++--
 4 files changed, 210 insertions(+), 202 deletions(-)

v4: https://lore.kernel.org/all/20250717164053.284969-1-me@brighamcampbell.com/
v3: https://lore.kernel.org/all/20250717065757.246122-1-me@brighamcampbell.com/
v2: https://lore.kernel.org/all/20250708073901.90027-1-me@brighamcampbell.com/
v1: https://lore.kernel.org/all/20250707075659.75810-1-me@brighamcampbell.com/

base-commit: ca2a6abdaee43808034cdb218428d2ed85fd3db8

May you all have a wonderful weekend. I'll be riding my motorcycle up
Logan Canyon.
-- 
2.50.1

