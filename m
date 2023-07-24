Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8074F75EC12
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 08:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522AE10E184;
	Mon, 24 Jul 2023 06:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EAA10E184
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 06:57:26 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 1656D1C015C;
 Mon, 24 Jul 2023 08:57:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.0
Received: from fluffy-mammal.speedport.ip
 (p200300f3cf161c9885ad30d3b3e24d7b.dip0.t-ipconnect.de
 [IPv6:2003:f3:cf16:1c98:85ad:30d3:b3e2:4d7b])
 by srv01.abscue.de (Postfix) with ESMTPSA id AF19C1C0155;
 Mon, 24 Jul 2023 08:57:23 +0200 (CEST)
From: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/mipi-dbi: Allow using same the D/C GPIO for
 multiple displays
Date: Mon, 24 Jul 2023 08:56:52 +0200
Message-Id: <20230724065654.5269-1-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 David Lechner <david@lechnology.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When multiple displays are connected to the same SPI bus, the data/command
switch is sometimes considered part of the bus and is shared among the
displays.

This series adds the GPIO_FLAGS_BIT_NONEXCLUSIVE flag for this GPIO and
SPI bus locking to the panel-mipi-dbi/drm_mipi_dbi drivers to support
this hardware setup.

---
Changes in v3:
- add comment and remove unnecessary line break as suggested by Noralf
Changes in v2:
- fix uses of mipi_dbi_spi_transfer outside drm_mipi_dbi.c (errors
  reported by kernel test robot)
- remove the is_locked argument introduced in v1 which was always set to
  true

Otto Pflüger (2):
  drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
  drm/tiny: panel-mipi-dbi: Allow sharing the D/C GPIO

 drivers/gpu/drm/drm_mipi_dbi.c        | 17 +++++++++++++----
 drivers/gpu/drm/tiny/ili9225.c        |  7 ++++++-
 drivers/gpu/drm/tiny/ili9486.c        |  4 ++++
 drivers/gpu/drm/tiny/panel-mipi-dbi.c |  3 ++-
 4 files changed, 25 insertions(+), 6 deletions(-)


base-commit: ae867bc97b713121b2a7f5fcac68378a0774739b
-- 
2.39.1
