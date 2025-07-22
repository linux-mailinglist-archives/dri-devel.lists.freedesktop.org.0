Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD385B0CF60
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 03:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D61E10E5CB;
	Tue, 22 Jul 2025 01:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="nVvhNVTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F68B10E5CB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 01:53:19 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-23694cec0feso46155585ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 18:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753149199; x=1753753999;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=02hyzrs3C6jwWph1NhtzQUl897VWViCvH01In3YsMDc=;
 b=nVvhNVTurx9URWZmjL4/2pPmyVq7WkN+WR5qZC0l0of8scAqLF9dpYBDRFQ3SvRsuX
 E0IUwUcUXURmHgTc3UtPOEXSn+8qd7rrjK4Ndw+WUaNJjnHVmOrnV7d6maYZIFBCOMXu
 hXXuXS34u2DdAC9ocwPKRjRF89+RpDLRkS956BKAYGi/5JuFokKqRq5mMZv4znUu59JU
 DKi52eMj16g3qKHokrT8V8vtiOduwtSO4qWws3KFbLXh+mqPq0PcAHL/Rsu0x5Y8mG2H
 skPJ/bKj6AgvYNTceaI2vP0Rk8ezTXnq7okXQCuFnVHgcZrr+/F3HgSiVwfWynxgvV4U
 CsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753149199; x=1753753999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=02hyzrs3C6jwWph1NhtzQUl897VWViCvH01In3YsMDc=;
 b=n2F6agX/ssMS01su/n6+DZKLcwCQW6orS3mg6upMTF60+c/Y02m7XvsTtxqxZ5rSu1
 6UUqowOg6HJ4NFYuZM47eR8pp9J2ZyekPGN7IhNs1SJmHkDgrWJdDKOnDcaCJ/DFzXin
 sDXOK7KhpU2gaTvAe+NGGjSLIM6XByDFzNqGckPT+SgkSMCDw4PV8Bl86MAWNzQL7FRG
 nnMuS9yp36A08MfZUsdMjDW4pnrSYQ0/rS4NMwQaF4/rWjIzmd7RwInIczmiyllVghT9
 EP1dMKDGeg0jZP3DHBvH3pFR+1Vnf0SdoezaheGV4OQk+TXGP3u1lr2dIktDWPFkTzmw
 u+Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrL8QpUdSk65/ofSNpN/QqQ1EhiKP0eZtc9TlRfSGq4i7k0TkPmLE2jSo2Gj6yRaBYQNj3g8JYl7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhEz15CmBvxzXlqEw2aMI/K8aEdbEerl3eX4HopkL4AFxuw4aR
 1M69g+oxVi8lAXxzdHemIJqHJIB5g/xFl1r+YYZo1zaiibs1FZ0ed0pKAlMjuANtb/0=
X-Gm-Gg: ASbGncs8uIl3qNHZXCJgM1+f8Mv+LSeydEBV9e3rH+5u2ac+ssHp1FQbJ/1D1esWmxH
 0qTJs3ItuThXo8bVu5KcVS/a6t8HwKIxgwOscztRFmEmSii9CDMSVitlVzligf6sR6o2JC09D0E
 qHaWYqM3K6K5jd7KEyPpHOIYzloIEib/+6Hv4UbhaomjHMglW+Dr2JuN8aat2Q3Xu3DfdOjkECY
 KUQA9AXiZrZeFvq7BF9+ImQiA9dPBFfe+Z6l7u51vdAPF50XSA23ca4W6j8pjr28doqfD0tty48
 CmYXeJQ4Dgkd790mmErJ5NIUGEAGL+cND0OFGq9uR2le1+PvGFiQ0xYjnCVcBwYliCUxuvt3oHY
 AKBsb3ThkfitOTNHv7AK9egnlfm4Ol8iXU7O6Cmm1PSBjM0VbaA==
X-Google-Smtp-Source: AGHT+IG+irLWOD78xwoAvbuOvZHdyLGDUiKL9Lg3uosSOKZjL28JHUt4/xMQ/877nSZppjATq3CYSA==
X-Received: by 2002:a17:902:f78a:b0:234:c549:da13 with SMTP id
 d9443c01a7336-23e24edaf41mr361519995ad.17.1753149198840; 
 Mon, 21 Jul 2025 18:53:18 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe62d9fsm6017441a12.1.2025.07.21.18.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 18:53:18 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v6 0/4] drm: Fix bug in panel driver,
 update MIPI support macros
Date: Mon, 21 Jul 2025 19:53:07 -0600
Message-ID: <20250722015313.561966-1-me@brighamcampbell.com>
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
code using the new mipi_dsi_dual* macros introduced in the first patch.

changes to v6:
 - Fix various style and kerneldoc issues in patch 1/4
 - Fix typo mpi_dsi_dual... -> mipi_dsi_dual...
 - Fix incorrectly named "data" and "len" variables
 - Make _seq argument of mipi_dsi_dual_dcs_write_seq_multi macro
   variadic
 - Remove duplicate definition of mipi_dsi_dual_dcs_write_seq_multi
   macro from novatek display driver

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
 drivers/gpu/drm/drm_mipi_dsi.c                |  82 +-
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 804 +++++++++---------
 include/drm/drm_mipi_dsi.h                    | 118 ++-
 5 files changed, 614 insertions(+), 608 deletions(-)


base-commit: ca2a6abdaee43808034cdb218428d2ed85fd3db8
-- 
2.50.1

