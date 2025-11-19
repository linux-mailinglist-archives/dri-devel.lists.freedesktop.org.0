Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7AC71829
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 01:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD3B10E6B8;
	Thu, 20 Nov 2025 00:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.de header.i=@posteo.de header.b="Uth+6XUf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0617E10E583
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 06:56:29 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 47361240027
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
 t=1763535080; bh=Ykx2T8Ng6fXHND/T5wfFnpfDrJ9o/apK37DPUIfi02k=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:From;
 b=Uth+6XUfCOPOVQ28+qmfyxyW0elVABrgVaiUenECPZ0NbP3UDX25n3UHX2jAV4SEc
 +KrubU+w9bYQa7kieVXSvXMOym/MARjzhyIiKx3KPvuz4a22t/9sEM0J6zdWmIKO2t
 8iq87V6esWHz39pQ1eFZeyeHTjt1VgFB7f8S9Vpg5Fwa/txqEKjhNP08bRe16lH/h5
 kDBh150KSXrq2skBWPPXlQo2zhxmkDKQQZyWOKikj/1JhkMLT9jGomnujy34M6oqHs
 ltIg9yCqu9YCOTiu3zziBB0V79u9QFod5YJcsWjp2nwkd2vGtXfbDzgUtEWARBCY4b
 C3SSVQEmTBr9Q==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4dBBw6656Cz6v1B;
 Wed, 19 Nov 2025 07:51:18 +0100 (CET)
From: Martin Kepplinger <martink@posteo.de>
To: robh@kernel.org, krzk+dt@kernel.org, airlied@gmail.com,
 gregkh@linuxfoundation.org
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [RFC 2/4] hack: edt-ft5x06 / panel-mantix-mlaf057we51: declare
 mantix_panel_prepared() in drm_panel.h
Date: Wed, 19 Nov 2025 06:51:19 +0000
Message-ID: <20251119065109.910251-3-martink@posteo.de>
In-Reply-To: <20251119065109.910251-1-martink@posteo.de>
References: <20251119065109.910251-1-martink@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Nov 2025 00:10:28 +0000
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

From: Martin Kepplinger <martin.kepplinger@puri.sm>

and use that header in the touchscreen driver. This avoids:

drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c:45:6: error: no previous prototype for 'mantix_panel_prepared' [-Werror=missing-prototypes]
   45 | bool mantix_panel_prepared(void)
      |      ^~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
---
 drivers/input/touchscreen/edt-ft5x06.c | 3 +++
 include/drm/drm_panel.h                | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index bf498bd4dea96..2a27750c76444 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -34,6 +34,9 @@
 
 #include <linux/unaligned.h>
 
+/* bool mantix_panel_prepared(void); */
+#include <drm/drm_panel.h>
+
 #define WORK_REGISTER_THRESHOLD		0x00
 #define WORK_REGISTER_REPORT_RATE	0x08
 #define WORK_REGISTER_GAIN		0x30
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 2407bfa60236f..ea43b3f908d05 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -392,4 +392,6 @@ static inline int drm_panel_of_backlight(struct drm_panel *panel)
 }
 #endif
 
+bool mantix_panel_prepared(void);
+
 #endif
-- 
2.47.3

