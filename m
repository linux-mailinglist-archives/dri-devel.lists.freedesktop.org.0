Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC3C88D126
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 23:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6799610F424;
	Tue, 26 Mar 2024 22:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pGx4NCTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB3410F424
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 22:38:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D65A8CE246F;
 Tue, 26 Mar 2024 22:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C948DC433C7;
 Tue, 26 Mar 2024 22:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711492718;
 bh=SPB6L/ctChhLveaXdYBbCjCt9oobwLX1bdGDBwGOoO0=;
 h=From:To:Cc:Subject:Date:From;
 b=pGx4NCTG2LWhkmyMjnIr7QzormuwKJKb8jduPcvEr9fHh9kO7VEnTBmioJRHspeDT
 H5YNlaoP6D7Q2ZgNhshKsS/BmV6fY0stqvvKrjUKukKt4t3PljRcdOcYW/I+80sDbg
 R89SGRiBcBON/LwB2ujoF+tWhQ32eqIRVBcCpCVeYkax6D8uqqRGex5bSxoqmAZeGP
 jXOGpr6Ob6HCEsFvy948o0gSqCxIS6NpNrU2aJMXy9NSc5Ih2WSgU5M/QN5d0Wk4Em
 AUaltyTlXALh0GnoMXcZLFVs6K3I9Nov1ese+LhHwPhrOpJpNBoK+83Fr966hvuTK7
 Zkic1AdBfrkmw==
From: Arnd Bergmann <arnd@kernel.org>
To: llvm@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Ariel Elior <aelior@marvell.com>,
 Manish Chopra <manishc@marvell.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Hannes Reinecke <hare@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Helge Deller <deller@gmx.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 0/9] enabled -Wformat-truncation for clang
Date: Tue, 26 Mar 2024 23:37:59 +0100
Message-Id: <20240326223825.4084412-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Arnd Bergmann <arnd@arndb.de>

With randconfig build testing, I found only eight files that produce
warnings with clang when -Wformat-truncation is enabled. This means
we can just turn it on by default rather than only enabling it for
"make W=1".

Unfortunately, gcc produces a lot more warnings when the option
is enabled, so it's not yet possible to turn it on both both
compilers.

I hope that the patches can get picked up by platform maintainers
directly, so the final patch can go in later on.

     Arnd

Arnd Bergmann (9):
  fbdev: shmobile: fix snprintf truncation
  enetc: avoid truncating error message
  qed: avoid truncating work queue length
  mlx5: avoid truncating error message
  surface3_power: avoid format string truncation warning
  Input: IMS: fix printf string overflow
  scsi: mylex: fix sysfs buffer lengths
  ALSA: aoa: avoid false-positive format truncation warning
  kbuild: enable -Wformat-truncation on clang

 drivers/input/misc/ims-pcu.c                  |  4 ++--
 drivers/net/ethernet/freescale/enetc/enetc.c  |  2 +-
 .../ethernet/mellanox/mlx5/core/esw/bridge.c  |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_main.c    |  9 ++++---
 drivers/platform/surface/surface3_power.c     |  2 +-
 drivers/scsi/myrb.c                           | 20 ++++++++--------
 drivers/scsi/myrs.c                           | 24 +++++++++----------
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |  2 +-
 scripts/Makefile.extrawarn                    |  2 ++
 sound/aoa/soundbus/i2sbus/core.c              |  2 +-
 10 files changed, 35 insertions(+), 34 deletions(-)

-- 
2.39.2

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Ariel Elior <aelior@marvell.com>
Cc: Manish Chopra <manishc@marvell.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Hannes Reinecke <hare@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-rdma@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kbuild@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: alsa-devel@alsa-project.org
Cc: linux-sound@vger.kernel.org
Cc: llvm@lists.linux.dev

