Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E74463E0C7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 20:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E900110E4C6;
	Wed, 30 Nov 2022 19:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EA410E4C3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 19:27:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E8F2BB81CBA;
 Wed, 30 Nov 2022 19:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C344C4314B;
 Wed, 30 Nov 2022 19:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669836417;
 bh=znC7oc0Eqelv+AbWaBkIcUV8ibH0DJjHig+VBhzLfbw=;
 h=From:Date:Subject:References:In-Reply-To:To:Reply-To:From;
 b=S9iSDjUIMgQ35QEufOO6jpQQbfHrb++POF4slN/kK1RX6heM4J1s94hoE8h7prnf4
 1s0U+VFyvpCasBXZdA7lpRUBCHl3jmAEVNB0eqV35K6VoQ/jmoUWMlup+o3GEhdmM6
 2v5Hov/FLATMPYBRIFXcZUeTMHMPu1bqtku7kqMjOo8rdJg3Vc5Tavc2oloaSZKLAY
 Diwnf89ECkyF6uRbpjgS+LgyGd4HRLoRKrMdCB40i0y7RyoER601nC0vSHKImfslJA
 cvdjApLzXWyRNx/wCFlNvu8aAqjiP1HZguFpA+LjJTBI/KZFJGUyniDaXJGaGFtvO6
 IkmZgr6pq4DYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3537BC4708C;
 Wed, 30 Nov 2022 19:26:57 +0000 (UTC)
From: Noralf =?utf-8?q?Tr=C3=B8nnes?= via B4 Submission Endpoint
 <devnull+noralf.tronnes.org@kernel.org>
Date: Wed, 30 Nov 2022 20:26:54 +0100
Subject: [PATCH v2 6/6] drm/gud: Enable synchronous flushing by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-gud-shadow-plane-v2-6-435037990a83@tronnes.org>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 stable@kernel.org,
 Noralf =?unknown-8bit?q?Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailer: b4 0.11.0-dev-cc6f6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669836415; l=2023;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=h2o+XqMBQHUWEJfpLcc+HZU/hC6MAxxmg8TWrtkZl5c=; =?utf-8?q?b=3DPVR2ctkGVWUa?=
 =?utf-8?q?qtpGxbUgZ6431+rt3RQPRUMnZWnZ7iu59dZF437cyLiFf+lDYBYV9Ety0wLM71xE?=
 NwFjFV4RAr/uKnDq6ZbyeWe5J2FCEiZAER7z/jH+5e/qUwVYAyjZ
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Submission Endpoint for noralf@tronnes.org/20221122
 with auth_id=8
X-Original-From: Noralf =?utf-8?q?Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Reply-To: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Noralf Trønnes <noralf@tronnes.org>

gud has a module parameter that controls whether framebuffer flushing
happens synchronously during the commit or asynchronously in a worker.

GNOME before version 3.38 handled all displays in the same rendering loop.
This lead to gud slowing down the refresh rate for a faster monitor. This
has now been fixed so lets change the default.

The plan is to remove async flushing in the future. The code is now
structured in a way that makes it easy to do this.

Link: https://blogs.gnome.org/shell-dev/2020/07/02/splitting-up-the-frame-clock/
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_pipe.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 92189474a7ed..62c43d3632d4 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -25,17 +25,13 @@
 #include "gud_internal.h"
 
 /*
- * Some userspace rendering loops runs all displays in the same loop.
+ * Some userspace rendering loops run all displays in the same loop.
  * This means that a fast display will have to wait for a slow one.
- * For this reason gud does flushing asynchronous by default.
- * The down side is that in e.g. a single display setup userspace thinks
- * the display is insanely fast since the driver reports back immediately
- * that the flush/pageflip is done. This wastes CPU and power.
- * Such users might want to set this module parameter to false.
+ * Such users might want to enable this module parameter.
  */
-static bool gud_async_flush = true;
+static bool gud_async_flush;
 module_param_named(async_flush, gud_async_flush, bool, 0644);
-MODULE_PARM_DESC(async_flush, "Enable asynchronous flushing [default=true]");
+MODULE_PARM_DESC(async_flush, "Enable asynchronous flushing [default=0]");
 
 /*
  * FIXME: The driver is probably broken on Big Endian machines.

-- 
2.34.1
