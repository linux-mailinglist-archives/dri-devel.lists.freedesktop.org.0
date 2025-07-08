Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9562BAFC441
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0072610E5AA;
	Tue,  8 Jul 2025 07:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="HTfKRRSV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBC010E5AA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 07:39:07 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-74924255af4so3600885b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1751960347; x=1752565147;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZN7aSjUU2m/lgLen2skU4S+C9lHA5hU+Z1BWGyIcRGk=;
 b=HTfKRRSV9c633f/a5qlDoWAoyUTzGAKqSGhbxw2hNnBwBC3R7MBAEtOYD4scOvblH8
 BwmaqVbZ1zkWrKDOJFW4JlRLD5aYWFiY3HgHKRtK82IIZnt+6NZGThUFfaxGnNkWuosw
 h+a59QkREJkw3yBvEZiEe1osUmIg/KICACzrUn7FnU09iEc6kDMGZzhm/aMGGPnZkjLY
 /fINZM1pt0IIqFARsrQvjPRGB1VAPBmrdN320B+i5MO1KiaV9SD8RxX0bvrJDumSNg2m
 HZusuw2qObFprmMChHSHytlc3V7saYb5tfshAgiAJuw263wNWjhCs30YEDML8bREMl5h
 mWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751960347; x=1752565147;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZN7aSjUU2m/lgLen2skU4S+C9lHA5hU+Z1BWGyIcRGk=;
 b=bpvGw1C2fGDtDPdvZs6W5blWMnVQo+BzEI1T+ISxC0/+k1Awya0bmUGu+Fl12rNX0n
 ncdoY6/4Q/SwoETcfNHgJtg7ZQTm22h4P4/7Ph02bchq7VzSl3N/VGPauUbtd0jVzZps
 zk88TyVzGl43GOaoG6RIVEaEmNGiDrWQIissW70A8bx9Tq1rUzAUwrrZAnR9cT/AOc0j
 Fyo5YW2c+WFJaVVF2z7+9AjUMCsBJNNsKOdWPUztbhkowLSTQ0kDNgaPm+rfhdodIROr
 vfjP5iVDNEH3OPZ8zSgYbpI9xZn2sU8RuZLmxzsjZxGkdr5qqgn2I0OFV/k0rDtLBMUb
 g8dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGqqtvU0J1hvHVpPWtM6FnNQ9K0cob09JqZzZ6C6ntR1x/WAEElWKI1TTl51YiF35Y8yacrnrZIxw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz81dVJw5NbNkgeNB9PI/lSCFLkZi19HhsqhNJpD74JKGInBJ31
 CPK3x0Zh/UaaXQmb8ksW/kVKdBQ+ecqKGI0RAIieOnVSQf+pY4uRB7uf6SWax/NefTI=
X-Gm-Gg: ASbGnctbSNKW0RgKLKzANG3pTrvT1YZilqL1CX+Orjm6bV5B8EXaNPyouKS23jtvMbf
 tM1ZwNNTraDVHzikM9dgzWQk0pCdkFghd4rfKHjOgq9Sip7XWYxUTV/K3MC7P7e1lN7vlynHnNI
 wZGtWDgwuKlcMAjJUXKqJ6ymX/O2WgdTOq3NGZen1APVc7wKAER4ausvUlY40RFb/8JuCWzQoKb
 R35aBetA+sNplQRwuQcv4cJWAW02ssL89zoq5moaQXHrrZL3p5yYoUX8AhmPKjiyESAnhhvllyb
 7dOAEf9c/QuLLOfuktMuhfMs+uNCgTLh/HQOfdvlFauuGFvTkO7SG/gMskTvPvsVd5hf1EaVTxt
 /Gd+POZrrdk2o7+1uBg==
X-Google-Smtp-Source: AGHT+IGcYNPUjs2kwjkvmFdGShMU4syGWz/FE+DbOGjtHhPQiV8ZsbgVj6QjspJrmZqOo3MkvanzoA==
X-Received: by 2002:a05:6a20:e687:b0:21f:cdfa:120e with SMTP id
 adf61e73a8af0-2260c839353mr26223435637.30.1751960347004; 
 Tue, 08 Jul 2025 00:39:07 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce42a540bsm11633523b3a.140.2025.07.08.00.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 00:39:06 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 0/3] drm: docs: Remove deprecated MIPI DSI macro
Date: Tue,  8 Jul 2025 01:38:57 -0600
Message-ID: <20250708073901.90027-1-me@brighamcampbell.com>
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

The first patch of the series removes the last remaining references to
mipi_dsi_generic_write_seq() in the jdi-lpm102a188a driver and updates
the driver to use the undeprecated _multi variants of MIPI functions.
Any behavioral modification to the jdi lpm102a188a panel driver by this
series is unintentional.

changes to v2:
 - Remove all usages of deprecated MIPI functions from jdi-lpm102a188a
   driver instead of just mipi_dsi_generic_write_seq().
 - Update TODO item in drm documentation instead of removing it
   entirely.

Brigham Campbell (3):
  drm/panel: jdi-lpm102a188a: Update deprecated MIPI function calls
  Remove unused MIPI write seq and chatty functions
  drm: docs: Update task from drm TODO list

 Documentation/gpu/todo.rst                    |  26 +--
 drivers/gpu/drm/drm_mipi_dsi.c                |  34 +---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 150 +++++++-----------
 include/drm/drm_mipi_dsi.h                    |  23 ---
 4 files changed, 71 insertions(+), 162 deletions(-)


Link: https://lore.kernel.org/lkml/20250707075659.75810-1-me@brighamcampbell.com/
base-commit: e33f256dbc293a1a3a31f18d56f659e7a27a491a
-- 
2.49.0

