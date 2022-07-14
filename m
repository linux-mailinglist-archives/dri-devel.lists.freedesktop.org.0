Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D1574AD5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 12:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A028A4508;
	Thu, 14 Jul 2022 10:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07792A3446
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 10:39:02 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by albert.telenet-ops.be with bizsmtp
 id uyez2700L4C55Sk06yezsT; Thu, 14 Jul 2022 12:39:01 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oBvwx-003The-8p; Thu, 14 Jul 2022 12:20:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oBulZ-00Bf1F-Go; Thu, 14 Jul 2022 11:04:13 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/5] drm/modes: parse_cmdline: Handle empty mode name part
Date: Thu, 14 Jul 2022 11:04:06 +0200
Message-Id: <302d0737539daa2053134e8f24fdf37e3d939e1e.1657788997.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657788997.git.geert@linux-m68k.org>
References: <cover.1657788997.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If no mode name part was specified, mode_end is zero, and the "ret ==
mode_end" check does the wrong thing.

Fix this by skipping all named mode handling when mode_end is zero.

Fixes: 7b1cce760afe38b4 ("drm/modes: parse_cmdline: Allow specifying stand-alone options")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
v2:
  - Add Reviewed-by, Acked-by,
  - Keep "ret == mode_end" check.
---
 drivers/gpu/drm/drm_modes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 14b746f7ba975954..67773740c74c9ba0 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1823,7 +1823,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 	}
 
 	/* First check for a named mode */
-	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
+	for (i = 0; mode_end && i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
 		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
 		if (ret == mode_end) {
 			if (refresh_ptr)
-- 
2.25.1

