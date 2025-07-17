Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D58B09209
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 18:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F08210E852;
	Thu, 17 Jul 2025 16:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="DvnAAeNp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6B310E854
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:41:38 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3138e64b42aso1409617a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752770497; x=1753375297;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8zaVonVNWKr3b0dyGZR9LCJexaagL6PKA2t2eXcHfTo=;
 b=DvnAAeNpYdNSx25oMu5Ue5LRyBovoLSpEmi99yst9/kyYg98Vq4YhqyLPE6grYYtA5
 V1zJg0sR5BBI4pmB2Ph83SsxKV6tIOGoYxvVtSAy2gXtRDGtFrXJ1izVqvhjC4ExJmlQ
 5OxDGmaiHJy1h0BjnHWijVsdEYoqpx0AvLeXY23DJ+F7deyHvVe60wSy4/sCo43LhK4N
 uP6kzlLpjldxNKPtrivmj4ev7L9Pa+gBLbVODYMMuvzROKGhJnBnjiD8xgfhIfW4pOmq
 rl56GTGW6DVfZuL5zDG5Xf2BWWV7IuYFwtUKPbiVT9IQhPQFI9m7/LZzZspxg5QzMdT/
 I/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752770497; x=1753375297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8zaVonVNWKr3b0dyGZR9LCJexaagL6PKA2t2eXcHfTo=;
 b=ck4iGLg2COw9rOdhmIlHP4QljXMLGBFUkymKSNweynGR55m0AIGyIPls/bOid1GdE2
 y797IPl3ERpySnBj8XzBuKFGLX7GSfbz1cxwVLzsu5eAi2ulLfQWFzQOMijdqPR034BX
 Ax0pJ6YBnuL23USUIUuzgQvXuny6t8vKanbMIYtk47hcnq60BzwaGtVU00iEq+U21Lbm
 QH0SjM8qaHo6/duqNRLOLyMPLSgyHyF9t5QI5nN4zgiTzUig0bvoqcH3kw7eGg3iXUJm
 Tz1emJSMyQdOk5MjALGk3gKJJ/CiONZnCzVluEQcNiX0QGCoazVyhw5UAjRU6s9s6Ts1
 EFsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO018BP4FTAFqrdAtnQ2rF/dzSILRdASaeOwmeqY4umw+LJ+vwIb+qns/yu8XjbRtpwpMC1euSrf4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybXGOab4sTeDOOBNOT3ZAE9B3aKqLamMi+ndavx9EutvUjTu9W
 y1VFD+9TSAW58O/uc1Wirhzk9bYatu4YkHhGACzCszAy38K3u17rOIwi+1tO0znO/Y0=
X-Gm-Gg: ASbGncttzwZa/AMXbS5ZRg+iSrz5XW4TFF6irSEgLAvTga1PyGmEEIyQFO5i3H8g3Ll
 N+oFcq/ZT7OFcjOr1IYfY/6Hlv1LD+gvJ0QUdus1Ks9kgLN8qdF2/lKdBLAoOclkgQ7KkDD4xBl
 B/D8BSmlSrlc8WPr2I+Xi9Y3HemUW4qHsoHe0CAtym2q2decl7ymM9Zbe15eKBvto1Az4Rz+8YM
 zBjOa6X6fAOwiKuKA5OM1qplO511tcUwrImkx62GD0CJtv434hPuqxe3zDZx7XIzmRSw8oR8ZTy
 8DTvkYVAEbgM1ptcy1NKKJipfF4e+z+DbdKnslN2M5X7nWWCm4YrxWBHqTImwXDnYGyJ3byo35R
 ZWorpGu+QEfSMRwDePLkPf+8U32sX/iMmhpSG/ewzwJxVDaakgQ==
X-Google-Smtp-Source: AGHT+IHnWxMFl+xdFfhd6iN1u48GSI5UYMmS7BfoELEh5F4oPsMjJBqSiWUBF1GSB6ivy5k7UULcDQ==
X-Received: by 2002:a17:90b:390f:b0:313:1e60:584d with SMTP id
 98e67ed59e1d1-31caf844db3mr5977675a91.11.1752770497172; 
 Thu, 17 Jul 2025 09:41:37 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 09:41:36 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 0/4] drm: Fix bug in panel driver,
 update MIPI support macros
Date: Thu, 17 Jul 2025 10:40:48 -0600
Message-ID: <20250717164053.284969-1-me@brighamcampbell.com>
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
  drm: Create mipi_dsi_dual macro
  drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
  drm: Remove unused MIPI write seq and chatty functions
  drm: docs: Update task from drm TODO list

 Documentation/gpu/todo.rst                    |  22 +-
 drivers/gpu/drm/drm_mipi_dsi.c                |  34 +--
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 197 ++++++------------
 include/drm/drm_mipi_dsi.h                    |  47 +++--
 4 files changed, 98 insertions(+), 202 deletions(-)

v3: https://lore.kernel.org/all/20250717065757.246122-1-me@brighamcampbell.com/
v2: https://lore.kernel.org/all/20250708073901.90027-1-me@brighamcampbell.com/
v1: https://lore.kernel.org/all/20250707075659.75810-1-me@brighamcampbell.com/

base-commit: 667efb341917bde19f5d7517b65defcdaed67c9e
-- 
2.50.1

