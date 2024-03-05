Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB4E871DEB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D9110E14E;
	Tue,  5 Mar 2024 11:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="EZzuJhDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B10F10E14E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:34:17 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-299a2456948so4152027a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 03:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709638457; x=1710243257;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:dkim-signature:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9c7P4AsN9fpsoKzoJwB6VptYp+jLXrzfi7VE5UxanTA=;
 b=VIIdmUbuExj5S3SlrI7R0yeRMutzR3Wq5NTcKYWCwIE6kJJ0GrwHu3ejO6T3aEV6Jl
 FaXazaPhVUIuuk0CMIO7FtBqzc9gIS8y6TQ3yYPJq/bPrumf89Z79JI6ZJvGHZYbbFMv
 4riby7QrH2XUoCqHOppfBInw2JoBI/i8eqgN6xG1TAHyCv85u9RNMHpmmSkYZShqD64U
 R9WZcvlGyEQxHGoPVVFQA4BLIETggcd3vLm4g0rZRQxhAIfZYl4BT9NsQZ5a2HYA2L49
 RCTKBrczRfMX3QmgfTon/pgBKg+8yEauynTJEEYw8flFUPVjHLcrTLd5A8NpFGu0RJ1P
 PrSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJkra0YBgtcfHusxSh7HehMzvaoaptebwsnpb31EdLICJ+7u4392iH44hmgTYrt2qv7LjXG54uak65lSsN97Lgl1Xj1a45V/VJJ+dxaapG
X-Gm-Message-State: AOJu0YyN3nvBzv/3IWR4Cp4vt0R1CLqRzew3rGLJ/qoOcdXlTkF41jm0
 SWgUk2QFEJdRzf6CgZWzez24ylVx4wHbqONAL9rGVOacMA1pzB/K
X-Google-Smtp-Source: AGHT+IG4B5z9Zy4ubA8gJ37ztpvtPxKGdu9NA4uzuoP9LtUTMWn/0u3QcLizO1KljrTaW00G2xY4fg==
X-Received: by 2002:a17:90a:7e14:b0:29a:6b1d:4d32 with SMTP id
 i20-20020a17090a7e1400b0029a6b1d4d32mr10346649pjl.38.1709638456902; 
 Tue, 05 Mar 2024 03:34:16 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a17090a858200b002997a5eea5bsm9288490pjn.31.2024.03.05.03.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 03:34:16 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1709638455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9c7P4AsN9fpsoKzoJwB6VptYp+jLXrzfi7VE5UxanTA=;
 b=EZzuJhDl4Ssk4Fi41+Okkg10V6WH7NcFhK67GLnCe1BxspHdOcMnj3FxDPCl6GML7YRi3Y
 cKvxCexnRt+T64GDvTywq19VhFSk5ho/jEpqnLHTKkriq5H2/J3oBQQyMJJfKlbPv4LaWO
 r6un1Zq7cSg5zSEk6Ls4y+2vURLWHEIRPcMqngBx9kgzz6AO/Wg4JfILDbRKZ8mz3n72tO
 uIpjgM9gjKlb8C+S8V/1kCXli2/F04ABL3lhJpd0AGLOAT5P0LS6KyTXsXYlpJHjyI7xlg
 2DKYFTnNuVOc57j2mJPXfpJqd/7yInxCCnpaHA19nh15UjvYDmwftoezTdRN7g==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Subject: [PATCH RESEND drm-misc 0/4] drm: constify struct class usage
Date: Tue, 05 Mar 2024 08:34:09 -0300
Message-Id: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADED52UC/32NzQ6CMBCEX8Xs2Zr+SEw9eZCrBz0aYmpZZBMop
 ItEQ3h3Cw/g8ZvMzDcBYyRkOG4miDgSUxcSqO0GfO3CCwWViUFLvZdGZsI3jvnhG3Th3YsytiK
 zyruDeRpVaUi7PmJFn/XzDtf8ll/OS7xUW2IPRYKaeOjid9WOam3+MYxKSGGttM5oayppT62LD
 WHEXcABinmefzfhP5fJAAAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=p3Usdi8NEVn9t1kDJN4YA4fwxeibQbkfEJtbw/RtQ9E=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl5wMyRfmZWlIW2DOu9EcfD+rKMK94X4PZQG5Qu
 j9nn5dUX5CJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZecDMgAKCRDJC4p8Y4ZY
 pteSD/0VhMbV+81x3Qef/ijLUpc4bA/SSiwYbaX5+ykAiohgXbj0E5Se3sm6qSQ4altuwdLHHmN
 OIPbaBuhu5Xlb+iFNjImIaz5YjOiSjtj60LIU3+XMZH2X9nblsj6SDnlUSyPpjTa/vcSHuYNiSQ
 39S5GIFYY9HqN4p3EXqjEZ11NeD+CHKOG9VUQKAcCCR8tYlf+vtWTi4PsxoOj0delkqawh63DLe
 m2KBpOlvqFVBm0CFjUaVu7Ys5QOozNEAuDjORSPlLWK9516GOSLfPZG+gMWLLUTYIKAa1/s+wzV
 hGhAnYa5MVSm87EDQHNSrgn3CMxtkkkGcMe8oqNcxUTeSv55MIFtA8ZD0VaCx3lGgIPBiT7Hu4C
 y7ewvzeHZSNrXFebuOhesuFegfU2D1ViJB475zXH0KhAAJZtRUVDk/fIreqLRBzNX5acrb+Zk84
 HlLdb3+ilo7SOJ9XVFV+U2L04aulKzzUVfI6C/e0nT3QBaK5Rl4oht56TgOsTUsjYitZW6hfEvI
 HB9AUOM4cwmntImsMgN+Y6jsDWJfoXehZWh/CLkTnWnooM/wo3QonlwPraysHDNVsxmbr1pTeb2
 CVmArk1WBM+u5NOjoz9qhi2aEBNldzYoIZzQuSXxPGQZLAEAqEreh+suSVxSKgBBjun2LYz2TW4
 I+UxCjQyPX2WXnA==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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

This is a simple and straight forward cleanup series that aims to make the
class structures in drm constant. This has been possible since 2023 [1].

[1]: https://lore.kernel.org/all/2023040248-customary-release-4aec@gregkh/

Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
Ricardo B. Marliere (4):
      drm/dp: make drm_dp_aux_dev_class constant
      drm/sysfs: make drm_class constant
      drm/fbdev/core: make fb_class constant
      dma-buf: heaps: make dma_heap_class constant

 drivers/dma-buf/dma-heap.c               | 26 ++++++++++---------
 drivers/gpu/drm/display/drm_dp_aux_dev.c | 22 ++++++++--------
 drivers/gpu/drm/drm_internal.h           |  2 +-
 drivers/gpu/drm/drm_privacy_screen.c     |  2 +-
 drivers/gpu/drm/drm_sysfs.c              | 44 ++++++++++++++------------------
 drivers/video/fbdev/core/fb_internal.h   |  2 +-
 drivers/video/fbdev/core/fbcon.c         |  4 +--
 drivers/video/fbdev/core/fbmem.c         | 17 ++++++------
 drivers/video/fbdev/core/fbsysfs.c       |  4 +--
 9 files changed, 60 insertions(+), 63 deletions(-)
---
base-commit: 4a0e7b3c37531aabddf6f144b83ae9b65ec809fd
change-id: 20240305-class_cleanup-drm-591ca73b31f2

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

