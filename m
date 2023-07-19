Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE33175925B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 12:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9684D10E1D0;
	Wed, 19 Jul 2023 10:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 566 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jul 2023 10:07:06 UTC
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D91610E095
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:07:06 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 61E8D1C0160;
 Wed, 19 Jul 2023 11:57:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=4.0.0
Received: from fluffy-mammal.speedport.ip
 (p200300f3cf161c21784c9f47d061c57a.dip0.t-ipconnect.de
 [IPv6:2003:f3:cf16:1c21:784c:9f47:d061:c57a])
 by srv01.abscue.de (Postfix) with ESMTPSA id 0BE8B1C015E;
 Wed, 19 Jul 2023 11:57:34 +0200 (CEST)
From: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/mipi-dbi: Allow using same the D/C GPIO for multiple
 displays
Date: Wed, 19 Jul 2023 11:53:41 +0200
Message-Id: <20230719095343.88359-1-otto.pflueger@abscue.de>
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
 =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When multiple displays are connected to the same SPI bus, the data/command
switch is sometimes considered part of the bus and is shared among the
displays.

This series adds the GPIO_FLAGS_BIT_NONEXCLUSIVE flag for this GPIO and
SPI bus locking to the panel-mipi-dbi/drm_mipi_dbi drivers to support this
hardware setup.

Otto Pflüger (2):
  drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
  drm/tiny: panel-mipi-dbi: Allow sharing the D/C GPIO

 drivers/gpu/drm/drm_mipi_dbi.c        | 22 +++++++++++++++++-----
 drivers/gpu/drm/tiny/panel-mipi-dbi.c |  3 ++-
 include/drm/drm_mipi_dbi.h            |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

-- 
2.39.1
