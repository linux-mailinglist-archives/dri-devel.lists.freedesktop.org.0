Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682A5BC0ED
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 03:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C51210E3CC;
	Mon, 19 Sep 2022 01:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6E210E3CC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 01:09:49 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 05210660159F;
 Mon, 19 Sep 2022 02:09:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663549788;
 bh=97eKtb5ACsHB0i90sg0ChglscPOhXzYdnuqR0MvnluQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ckPZlLuHsf3GQnS+lfMovbLdecQLYjcV2IYAJlt4nIsoKh/z+h9I8LlR5MoZWKV2L
 5RuPGllrIQTcY6jEyBmbvTINENxPaDHLDOP+khst1+D7TxqA3H0TIylrxywfN1WIn6
 s3sfvxiFRgxeaenrKyi9/7A3aJGQbvTJNELH17yMalTaDO1yBbJJfzq9qof9BYzDu1
 QL6eJi2KAt6idPzuiMa/M8QBpr22yeARtQ/yRoK27nuvVIQmA65PSK1qlQ2cHnoIKG
 G2Ch7Ob4DO0zGvOYgz3C35v7jqIjDBYdDPo+Qazt6956MDe5R7KVRp5z3DeISyuX+w
 0VUwnlk9y5Z7w==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/meson: fix use-after-free driver unload issues
Date: Mon, 19 Sep 2022 02:09:37 +0100
Message-Id: <20220919010940.419893-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
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
Cc: adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series tries to fix some use-after-free bugs I've observed with
the help of KASAN in Amlogic's KMS DRM driver.

The first patch in the series reorders the driver deinitialisation sequence
so that devres won't deallocate things that are still expected to be around
by a later call to drm_dev_put.

The second patch adds a missing call to component_master_del inside a new
driver's remove callback.

The third patch makes sure some drm bridges added during driver
initialisation are removed at module unload time, to make sure the global
bridge list doesn't keep nodes to freed memory.

All three patches have been tested on an Odroid N2+ plus SBC.

Adrián Larumbe (3):
  drm/meson: reorder driver deinit sequence to fix use-after-free bug
  drm/meson: explicitly remove aggregate driver at module unload time
  drm/meson: remove drm bridges at aggregate driver unbind time

 drivers/gpu/drm/meson/meson_drv.c          | 14 +++++++++++++-
 drivers/gpu/drm/meson/meson_drv.h          |  7 +++++++
 drivers/gpu/drm/meson/meson_encoder_cvbs.c |  7 +++++++
 drivers/gpu/drm/meson/meson_encoder_cvbs.h |  1 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  7 +++++++
 drivers/gpu/drm/meson/meson_encoder_hdmi.h |  1 +
 drivers/gpu/drm/meson/meson_venc.h         | 15 +++++++++++++++
 7 files changed, 51 insertions(+), 1 deletion(-)

-- 
2.37.0

