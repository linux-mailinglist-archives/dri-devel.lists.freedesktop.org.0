Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1F4AD6A62
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFD310E7A7;
	Thu, 12 Jun 2025 08:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QKG4HyYH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1odK2eCW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QKG4HyYH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1odK2eCW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D66D10E7A7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:21:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71D6B218FC;
 Thu, 12 Jun 2025 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/L860iFSRWtDQn8ireYrc3Cye0vTyizniIYlymGiLU=;
 b=QKG4HyYH1Oi3zSDwB0196c9Kp+qDzcGdzcc3rHOCQL0A+mPOXmC0059Lc6RjxizFof8J6y
 V43uRp4qUvs2K3IES5cbl7Z5u2p1AA1znqwIIxtHU4Et9TkBn/NWTnIAO9DKViSMDTt3M3
 f1jir0NlRFCegsS9lPg7qZsHcj3iSWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/L860iFSRWtDQn8ireYrc3Cye0vTyizniIYlymGiLU=;
 b=1odK2eCW3Wun/wlpQaQJx2lHf3/sEYHhLAMtqsi3IotmLTfqrHiZe0WxxJ1ela/E4qC7q+
 OZNybidr1hLFNrAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/L860iFSRWtDQn8ireYrc3Cye0vTyizniIYlymGiLU=;
 b=QKG4HyYH1Oi3zSDwB0196c9Kp+qDzcGdzcc3rHOCQL0A+mPOXmC0059Lc6RjxizFof8J6y
 V43uRp4qUvs2K3IES5cbl7Z5u2p1AA1znqwIIxtHU4Et9TkBn/NWTnIAO9DKViSMDTt3M3
 f1jir0NlRFCegsS9lPg7qZsHcj3iSWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/L860iFSRWtDQn8ireYrc3Cye0vTyizniIYlymGiLU=;
 b=1odK2eCW3Wun/wlpQaQJx2lHf3/sEYHhLAMtqsi3IotmLTfqrHiZe0WxxJ1ela/E4qC7q+
 OZNybidr1hLFNrAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F984132D8;
 Thu, 12 Jun 2025 08:21:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kMlyBgeOSmgILAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, linux@armlinux.org.uk,
 FlorianSchandinat@gmx.de, alchark@gmail.com, krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 06/14] fbdev/matroxfb: Include <linux/export.h>
Date: Thu, 12 Jun 2025 10:16:29 +0200
Message-ID: <20250612081738.197826-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612081738.197826-1-tzimmermann@suse.de>
References: <20250612081738.197826-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLeer19tzumyaughgdh7h6uhe9)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
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

Fix the compile-time warnings

  drivers/video/fbdev/matrox/g450_pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_DAC1064.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_Ti3026.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_accel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_g450.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/matrox/matroxfb_misc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/matrox/g450_pll.c         | 2 ++
 drivers/video/fbdev/matrox/matroxfb_DAC1064.c | 1 +
 drivers/video/fbdev/matrox/matroxfb_Ti3026.c  | 1 +
 drivers/video/fbdev/matrox/matroxfb_accel.c   | 2 ++
 drivers/video/fbdev/matrox/matroxfb_base.c    | 1 +
 drivers/video/fbdev/matrox/matroxfb_g450.c    | 2 ++
 drivers/video/fbdev/matrox/matroxfb_misc.c    | 1 +
 7 files changed, 10 insertions(+)

diff --git a/drivers/video/fbdev/matrox/g450_pll.c b/drivers/video/fbdev/matrox/g450_pll.c
index 96996efc9288..e2c1478aa47f 100644
--- a/drivers/video/fbdev/matrox/g450_pll.c
+++ b/drivers/video/fbdev/matrox/g450_pll.c
@@ -14,6 +14,8 @@
  *
  */
 
+#include <linux/export.h>
+
 #include "g450_pll.h"
 #include "matroxfb_DAC1064.h"
 
diff --git a/drivers/video/fbdev/matrox/matroxfb_DAC1064.c b/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
index 99bdcb52ef4b..9a893b70ab19 100644
--- a/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
+++ b/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
@@ -13,6 +13,7 @@
  *
  */
 
+#include <linux/export.h>
 
 #include "matroxfb_DAC1064.h"
 #include "matroxfb_misc.h"
diff --git a/drivers/video/fbdev/matrox/matroxfb_Ti3026.c b/drivers/video/fbdev/matrox/matroxfb_Ti3026.c
index f53b8066e8a5..4eb636cd1f89 100644
--- a/drivers/video/fbdev/matrox/matroxfb_Ti3026.c
+++ b/drivers/video/fbdev/matrox/matroxfb_Ti3026.c
@@ -79,6 +79,7 @@
  *
  */
 
+#include <linux/export.h>
 
 #include "matroxfb_Ti3026.h"
 #include "matroxfb_misc.h"
diff --git a/drivers/video/fbdev/matrox/matroxfb_accel.c b/drivers/video/fbdev/matrox/matroxfb_accel.c
index 52e15dc6f45b..2670db392da2 100644
--- a/drivers/video/fbdev/matrox/matroxfb_accel.c
+++ b/drivers/video/fbdev/matrox/matroxfb_accel.c
@@ -77,6 +77,8 @@
  *
  */
 
+#include <linux/export.h>
+
 #include "matroxfb_accel.h"
 #include "matroxfb_DAC1064.h"
 #include "matroxfb_Ti3026.h"
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 81603ce05a22..5be0cdcd7c71 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -101,6 +101,7 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/export.h>
 #include <linux/version.h>
 
 #include "matroxfb_base.h"
diff --git a/drivers/video/fbdev/matrox/matroxfb_g450.c b/drivers/video/fbdev/matrox/matroxfb_g450.c
index 86fe757d7761..800c05b70ee3 100644
--- a/drivers/video/fbdev/matrox/matroxfb_g450.c
+++ b/drivers/video/fbdev/matrox/matroxfb_g450.c
@@ -13,6 +13,8 @@
  *
  */
 
+#include <linux/export.h>
+
 #include "matroxfb_base.h"
 #include "matroxfb_misc.h"
 #include "matroxfb_DAC1064.h"
diff --git a/drivers/video/fbdev/matrox/matroxfb_misc.c b/drivers/video/fbdev/matrox/matroxfb_misc.c
index 3fe99214c116..2c5f0099532b 100644
--- a/drivers/video/fbdev/matrox/matroxfb_misc.c
+++ b/drivers/video/fbdev/matrox/matroxfb_misc.c
@@ -85,6 +85,7 @@
  *
  */
 
+#include <linux/export.h>
 
 #include "matroxfb_misc.h"
 #include <linux/interrupt.h>
-- 
2.49.0

