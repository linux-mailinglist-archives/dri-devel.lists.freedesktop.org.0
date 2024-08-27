Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FCC961206
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 17:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE59F10E34F;
	Tue, 27 Aug 2024 15:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="HLfKAd4e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7305610E350
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1724772359;
 bh=WOYVZE4elMTLqZPSxOgwkH1342itHfJBnZKFofqCp5s=;
 h=From:Subject:Date:To:Cc:From;
 b=HLfKAd4ecE+/8gyl8MCAFIKbgbfGjs1KwNPoWCG8FoHFUDl/x8BRDiv7j8uSddGH3
 lBoB7RO2cS8ImEqpZVPRVzxDhu7lWGJ2BYbfiQA09RNyZZr6ySgmJUt3K4O1tEQFTZ
 4Y9BuJoKV4s0GQUE43fH5NWoSDj2WLe9BQZ7DM2w=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/5] fbdev: devm_register_framebuffer() and some fixes for
 efifb
Date: Tue, 27 Aug 2024 17:25:11 +0200
Message-Id: <20240827-efifb-sysfs-v1-0-c9cc3e052180@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANfvzWYC/x2MQQqAIBAAvyJ7TjCRlL4SHUzX2ouFC1GIf086D
 sNMBcZCyDCLCgVvYjpzh3EQEA6fd5QUO4NW2iinrcREaZP8cmKJXrloVXDBTNCLq3T7/Ldlbe0
 DpzeC910AAAA=
To: Peter Jones <pjones@redhat.com>, Helge Deller <deller@gmx.de>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724772358; l=1005;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=WOYVZE4elMTLqZPSxOgwkH1342itHfJBnZKFofqCp5s=;
 b=7cFNZ+8YbmjoRNA/U+xUZ5sibM8RhEZT+/vLwKa+33Kcp1wG/avGokCL7g33hhDDxZUHHeYQN
 ZE1xbeLEmY2AqydNSyVqVIFTgBPSQLkN9ugkgttLb0c4a3qaLqg1hOz
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

Some random optimization and fixes I came up with while looking at
efifb.c.

I can't get the efifb driver to probe on my hardware,
so this is only compile-tested.
If somebody could actually test it, that would be great.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (5):
      fbdev/efifb: Use stack memory for screeninfo structs
      fbdev/efifb: Register sysfs groups through driver core
      fbdev: Introduce devm_register_framebuffer()
      fbdev/efifb: Use devm_register_framebuffer()
      fbdev/efifb: Use driver-private screen_info for sysfs

 drivers/video/fbdev/core/fbmem.c | 24 +++++++++++++++
 drivers/video/fbdev/efifb.c      | 63 +++++++++++++++-------------------------
 include/linux/fb.h               |  1 +
 3 files changed, 49 insertions(+), 39 deletions(-)
---
base-commit: 3e9bff3bbe1355805de919f688bef4baefbfd436
change-id: 20240827-efifb-sysfs-ea08d70c8c46

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

