Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC3E676904
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6144610E436;
	Sat, 21 Jan 2023 20:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDDC10E40F
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3B964B808BB;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 309ECC433B4;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331671;
 bh=PjLweJQ8cypKFaudLIzuAj6peTciPXqMfolAf7iyIi0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=HnDwrwTv2oNoVcJJufx5aXYOIO+NiC7i6ZZvGWS7ZN3q4NrU4VRnMpTbE9Zai/4Kr
 Pb6zxd38JWyDBzPc1NwplsoopIUUSTPaZEUlv7FaYnwga09Y/mvwq2HcW0kSVuI/6q
 Xu4PUstbOuV0nNeycxsPIO6WasRbggZbtSeu/k1IuQsSwjYlUblO+eIvTbVMhSVGWR
 Fb2xLluavLeAkGiCN+2tZcPBkWNjqanV8CcKVyzg6mCTz9hsHwf/P9t2kKUPbbZ8jy
 OzWdjlHdUjAhL0KTRdWdw36ZW3OAaSDz/6lhJLmN+t0ys9Qf+k0WjBPYjiH08jgYj8
 0MHuTYou8vlKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1F24CC38A23;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:54 +0100
Subject: [PATCH 16/86] drm/drm_print: Minimize include footprint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-16-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=965;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=p6u7BCu6iGEw/mZH2TZOMAba4klZ9DSvcjzEhAAduqg=; =?utf-8?q?b=3Dpxuw98SOeU7w?=
 =?utf-8?q?iWuVVpt/bUcMQSvtyP/Z36Kx4YOnshnNRjAgWmUczNJZ0Wz5hMw+43OVkmMCa8Pf?=
 mtvGaUQ2DeY1ep7GALZuE7LPxGYGvl89Sgj9AMkXVBC8U8blBj1r
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Reduce drm_print.h to include or forward the minimal set of
files/symbols - to minimize the impact of the files that includes this
header file.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 include/drm/drm_print.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index c3753da97c4e..30673ee10190 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -26,14 +26,13 @@
 #ifndef DRM_PRINT_H_
 #define DRM_PRINT_H_
 
-#include <linux/compiler.h>
-#include <linux/printk.h>
-#include <linux/seq_file.h>
+#include <linux/dev_printk.h>
 #include <linux/device.h>
-#include <linux/debugfs.h>
-#include <linux/dynamic_debug.h>
+#include <linux/printk.h>
 
-#include <drm/drm.h>
+struct debugfs_regset32;
+struct seq_file;
+struct device;
 
 /* Do *not* use outside of drm_print.[ch]! */
 extern unsigned long __drm_debug;

-- 
2.34.1

