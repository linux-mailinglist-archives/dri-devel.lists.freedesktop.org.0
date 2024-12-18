Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B50B9F6090
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 09:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8436410EB08;
	Wed, 18 Dec 2024 08:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sH4AT0fa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBAF10EB08
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 08:59:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EF8E9A40B5F;
 Wed, 18 Dec 2024 08:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C503C4CECE;
 Wed, 18 Dec 2024 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734512350;
 bh=YDrmVNS9CVj8aY1vhRPDzir+A2W9ahTbTFvoJ2lxY0I=;
 h=From:To:Cc:Subject:Date:From;
 b=sH4AT0fa5h01DYhNudJmJCiOuVMVCtUmlKQ9tQ/U724q3HTlzynO/DqBSDHUpNvER
 OvlIB3Z6LGSps1gRatiNnSoZ9QOrdWbzr7AsfpUOyljB2truLras2qoqsR3mqpSBga
 KQGFcAkBWGCdyfkyF1lOyZVo2Rh00/qmcspyy20C6mEpWCFNWn+3WhGeWxmNVqhf4L
 jAZOavB7rCcJsKPs5Zc+ACFyTnd1+bzXC89EE1EjER3QU8qdxFv83kGIXokQ6Cwm1X
 MfvZjZIZktoYe+j/efnpTZ9qZwVGWJJCwBtNHEFekkdXsCyQK4lKu6vg2Ie3MhI0G0
 nGC15dZqm3TXg==
From: Arnd Bergmann <arnd@kernel.org>
To: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] accel/amdxdna: include linux/slab.h
Date: Wed, 18 Dec 2024 09:58:57 +0100
Message-Id: <20241218085902.2684002-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

This driver fails to build in random configurations:

drivers/accel/amdxdna/aie2_solver.c: In function 'remove_partition_node':
drivers/accel/amdxdna/aie2_solver.c:121:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
  121 |         kfree(pt_node);
      |         ^~~~~
drivers/accel/amdxdna/aie2_solver.c: In function 'get_free_partition':
drivers/accel/amdxdna/aie2_solver.c:153:19: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
  153 |         pt_node = kzalloc(sizeof(*pt_node), GFP_KERNEL);

Add the missing include.

Fixes: c88d3325ae69 ("accel/amdxdna: Add hardware resource solver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This one is still needed, I had previously combined two missing includes
in one patch
---
 drivers/accel/amdxdna/aie2_solver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/aie2_solver.c b/drivers/accel/amdxdna/aie2_solver.c
index 1939625d6027..2013d1f13aae 100644
--- a/drivers/accel/amdxdna/aie2_solver.c
+++ b/drivers/accel/amdxdna/aie2_solver.c
@@ -8,6 +8,7 @@
 #include <drm/drm_print.h>
 #include <linux/bitops.h>
 #include <linux/bitmap.h>
+#include <linux/slab.h>
 
 #include "aie2_solver.h"
 
-- 
2.39.5

