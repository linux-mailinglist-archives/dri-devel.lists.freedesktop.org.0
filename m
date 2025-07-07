Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BFAAFB9FB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 19:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152858825B;
	Mon,  7 Jul 2025 17:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HWr2EKzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BCF8825B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 17:37:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DE03EA53E55;
 Mon,  7 Jul 2025 17:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB69C4CEE3;
 Mon,  7 Jul 2025 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751909841;
 bh=V3pmH44cuKhTBJ+8HOjoKFZwsuSa2HHUySVK6PSIJPE=;
 h=From:To:Cc:Subject:Date:From;
 b=HWr2EKzp1uFcrmiM1Y1F5DY6r8vMYV3/17P0Rs9R22yXGseKXWEfnvcSfCkmQPA6L
 WuYZiCR+13e4jB9s96CzwVODjXY6v8+t2idCNFryCPiUPRlhtcuDaY88qPpC+bhDau
 KCigIMgitd2BJmQTojtOKAxxYoAdzAoM830Sn/knXTdXuTH3Uo0AmPeHpnkrcjc8OA
 NSuWRLvTEqFooCi3uMEEL8NhmV5FjSEPyvC4XFhUQV80MvH+y/kY11tOqcMa+VYkUO
 NrfL/lVMTRw3RZPsV+8wDisyWpzNJyt3P5ph52HtI2/hR5EQpgn51SUo88Fxc34BdV
 rrHIE5Uh8u+4Q==
From: Hans de Goede <hansg@kernel.org>
To: David Airlie <airlied@linux.ie>
Cc: Hans de Goede <hansg@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Andi Kleen <ak@linux.intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] agp/amd64: Remove support for probing unlisted PCI devices
Date: Mon,  7 Jul 2025 19:37:07 +0200
Message-ID: <20250707173710.313701-1-hansg@kernel.org>
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

Hi all,

As discussed in this thread:

https://lore.kernel.org/dri-devel/b29e7fbfc6d146f947603d0ebaef44cbd2f0d754.1751468802.git.lukas@wunner.de/

The amd64_agp driver's support for trying to probe unsupported devices does
not make sense anymore given that no new AGP devices have been produced for
a while now.

This patch series disabled the probing of unsupported devices in 2 steps
(for easier reverting and/or for applying one step at a time) first default
it to off and then completely remove it.

The first patch is a resend of Lukas' patch for 6.16-rc# to fix
the bootsplash regression caused by the probing of unsupported devices

I've included this patch so that the series applies cleanly, this means
that drm-misc-fixes (once it lands there) will needs to be backmerged
for the last patch to apply.

Regards,

Hans


Hans de Goede (2):
  agp/amd64: Change agp_try_unsupported default to 0
  agp/amd64: Remove support for probing unlisted PCI devices

Lukas Wunner (1):
  agp/amd64: Check AGP Capability before binding to unsupported devices

 drivers/char/agp/Kconfig     |  3 +--
 drivers/char/agp/agp.h       |  1 -
 drivers/char/agp/amd64-agp.c | 41 +-----------------------------------
 drivers/char/agp/backend.c   |  4 ----
 4 files changed, 2 insertions(+), 47 deletions(-)

-- 
2.49.0

