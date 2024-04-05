Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4E889A12C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1455B113C5A;
	Fri,  5 Apr 2024 15:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N6BUcKEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235FB113C5A;
 Fri,  5 Apr 2024 15:31:05 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-516c87a511bso2460607e87.3; 
 Fri, 05 Apr 2024 08:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712331063; x=1712935863; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SS16wuno39hi9Kx30J1PofJZCgdGOIuxdr7bBF8mXmE=;
 b=N6BUcKEPK9o5j7nRE3TQju0xaV1Zi86w3fWXIucE8B5BEZI88P4WT6J8+MYt3azWQL
 ZtzZkEmoSa0TjpQAC/9mNsKW+NxLl1PLMCcUVq3r0ksUkxS39GLfVqencauEqxbGa9dF
 m7A/YrBG6uwiQlAruIzalji5qt7F0JyBCfFhabihe0qExYy+KuC/l20laD3/7IsNwwTc
 EYDnc4th3g/9yqqiOcMPfoA3QjoV5CHnAJ3UayKz+EnAf1IctzV4iNDahbUP34PqoBn0
 oThINv0v4lvTXn5PYkqB069bW1WSw/ob2reBcWXyYKWzaecD6WLU8CloZmvAwxrt5GGn
 /tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712331063; x=1712935863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SS16wuno39hi9Kx30J1PofJZCgdGOIuxdr7bBF8mXmE=;
 b=YyLi0RyPt0/qNW9xt1HnVybN60KcR+iFPAYWw/4sK960KCISPdAfDLlWJ/H9Lx69CW
 tatN2qcDFqnHUqRfIToqob++E/K1MiTh6CWTRLx67PJKpVRZyC5nN4U0yuB2YVp1AN6Y
 hOCTSTdn4fSEkTZt/ZcF9Oy+HfbywP9NbiouBbfK/jQR7aGOZ/dQrmRWx5vgbDaoQdfA
 Po4qAnCF72hEb7KddJ+i8ClZX8b8cDCa8Y6m2new7wKTh315x41s943cRpbVp7JC9Ca/
 8wxFnBMs/RMWcTlVqk5kBWIWewnNI3VPU+1jnuOAwy5Bdw45ji8PhtQL+Mp8ITCk224q
 bCww==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9VxUFU2sB/By7XwUXfOJg4DleRe1ExOtv1bpoXNVwLx9txJ+Z/RLSAkEvxfLAUyWzoBHce1ilBKxzCbQdskK0R5woqbQFiyLBMBuiYM2C2Fv/gIZF3uwiwmbAf8D4+UCiUyUnbv8Vzug8LQ==
X-Gm-Message-State: AOJu0YxG+kW3cl+YDajuZWIb+isOy2hYcvEPX6WlHI8RtlmgepAN0KEr
 m/MnuTZqxprU2p6+2nnahRkpevH7gQwtPj12bzH3Eou6KwJKDc3c
X-Google-Smtp-Source: AGHT+IG+sRwiunYU741Mny17rGJ3l8Sy2B7PsFFqnAp0oSBk2M/7j7AvU9Dkc9YywVBpoRQH9rVdJQ==
X-Received: by 2002:a19:3813:0:b0:516:d14a:9692 with SMTP id
 f19-20020a193813000000b00516d14a9692mr1320618lfa.6.1712331062959; 
 Fri, 05 Apr 2024 08:31:02 -0700 (PDT)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 ca19-20020aa7cd73000000b0056dfda8eef3sm906752edb.54.2024.04.05.08.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 08:31:02 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com, megi@xff.cz,
 linux-kernel@vger.kernel.org, Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH v2 0/3] drm/lima: fix devfreq refcount imbalance for job
 timeouts
Date: Fri,  5 Apr 2024 17:29:48 +0200
Message-ID: <20240405152951.1531555-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.44.0
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

v1 reference:
https://patchwork.freedesktop.org/series/131902/

Changes v1 -> v2:
- Split synchronize_irq of pp bcast irq change into (new) patch 2.

Erico Nunes (3):
  drm/lima: add mask irq callback to gp and pp
  drm/lima: include pp bcast irq in timeout handler check
  drm/lima: mask irqs in timeout path before hard reset

 drivers/gpu/drm/lima/lima_bcast.c | 12 ++++++++++++
 drivers/gpu/drm/lima/lima_bcast.h |  3 +++
 drivers/gpu/drm/lima/lima_gp.c    |  8 ++++++++
 drivers/gpu/drm/lima/lima_pp.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/lima/lima_sched.c |  9 +++++++++
 drivers/gpu/drm/lima/lima_sched.h |  1 +
 6 files changed, 51 insertions(+)

-- 
2.44.0

