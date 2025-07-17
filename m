Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43131B0859F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 08:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A816010E6BA;
	Thu, 17 Jul 2025 06:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="MgbfE63l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E0910E6BA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:58:09 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so646834b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 23:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752735489; x=1753340289;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/QwaJ6+SV8dLr3sbsgOJRijgIEa6kBPmB3FaWrqGQmI=;
 b=MgbfE63lOWm7neXDcDsipa2KloP+L3iexQ2RPlPComWsjLWEpbApL+xEcvhXqVg+0h
 kSWd3gua+ZPM7SpTT/+ufdxwrZyff2kLM43m1nckWAsqouy+2dw3WDoNMwbfwsfQuZld
 PrHMvph0q5tIa0jea8wKPi8rYH46xlUASAaRc+hzQp/z/uYxKByzepW0exPrNQ0KhNzf
 +NI7IhXPVQHy2dg9T9Mncp86REA1QhV/+itXwtPcMcEnQSTFRGisjyBn84CUbrBi/nad
 JgvZLyR2JvMldE/rGLuypuGgwKhDBzC4LWxce2qdxAEkiU01UTJ/q+i81AQxc9ucxAzp
 5Wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752735489; x=1753340289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/QwaJ6+SV8dLr3sbsgOJRijgIEa6kBPmB3FaWrqGQmI=;
 b=OUZDfvzdCJtp4D+SAYY79dVQCYeOaUZyUOQ6rFnltsvOFjURrITi/amSVxCAp+YZ8+
 iLHjJa3KIYTEVn1VPZntPEC8UXi4XkoMRCEu5vazvZXqReu1+qnkWt0Yca7mWUx8avrn
 usIv68VoT43wk9FCTlEfMljRhp9oN+G7rHUXmJWNSX9y31jrLfek/bfyDfam+Ojmgm2z
 6XbJQDBcBlfSD5mlLjXUonu/1FeyUrYiO+Lmdi3PZaC4V2EojwJ4yTGBKALjMpOExy+I
 OwiDuygYNuSV7thbN8lJaX645YNS2z/Ue0n5hpsOl3KIJpTMpLzOlFWh/IzZt8Bi0rEz
 g7ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqh7ziIsaqluxqzp+0yzEIkYytb5JUrQBiZ6gg1E7rth9PYAQ3bqoY/GLeMGtQKtRFExdNdoiKLGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzueJwJDTttuvbQOcvphakHhekK09fBRGdmwXTbwD/v1YUbuPhW
 0mXBu3ubVyC+sCI23Qsc64Rg9/fYgtSQwWxt5diMaUb/TzQA+rDuEoJtZYiLd8fM1z0=
X-Gm-Gg: ASbGnctNkoQhIsG9pTQW4ypiN+Kn39XnxEQBEdSJV7BMe5yu4/2SM3l4wyL5A3xHL5V
 qGU/g2t8OTqjXa/OAaJ9sn+tK2aHdSqFjaYQCmg6bE+GBm8DWxU9vH0pvUhGHJcxzEHZksPp1Dv
 MLKL1KsyFYbLR322vd+4Sez/KhsOkpWZWEO86UrD9PHKTFXdRYn5hkFNABc5GAemGgJbJxGbohJ
 iOl+jq2jVBWWqm+fSIMsZMCswMmA1+P7hxds2y4dOPnuPLwdA1Gd3+Pr+/ckQtzeEG2To8F/dJw
 03ZNy6YLs8YNBPam1qR0PaIxmCl6dlXcoYRiOQpeHquZzL+2xC1HnB9THk8ewGoQOKVfXp71neg
 NLEuFDz5fKQmFH0FOO67SKc74c0m8UPZwV9oKrSplYHFXxLMLlXTe6w==
X-Google-Smtp-Source: AGHT+IEseKIfJqtbOw8gzUyfRbVBbKBWLtecuTXecrmR5KxL8XgEfMZkeKCbA0k+p/mbsZdrQYExAA==
X-Received: by 2002:a05:6a00:1707:b0:742:a82b:abeb with SMTP id
 d2e1a72fcca58-756e7acf5e2mr8654099b3a.2.1752735488782; 
 Wed, 16 Jul 2025 23:58:08 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 23:58:08 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 0/4] drm: Fix bug in panel driver,
 update MIPI support macros
Date: Thu, 17 Jul 2025 00:57:52 -0600
Message-ID: <20250717065757.246122-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
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

 Documentation/gpu/todo.rst                    |  22 +--
 drivers/gpu/drm/drm_mipi_dsi.c                |  34 +---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 187 ++++++------------
 include/drm/drm_mipi_dsi.h                    |  46 ++---
 4 files changed, 92 insertions(+), 197 deletions(-)

v2: https://lore.kernel.org/all/20250708073901.90027-1-me@brighamcampbell.com/
v1: https://lore.kernel.org/all/20250707075659.75810-1-me@brighamcampbell.com/

base-commit: 667efb341917bde19f5d7517b65defcdaed67c9e
-- 
2.49.0

