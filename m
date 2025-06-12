Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB87AD6A68
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D3810E7B0;
	Thu, 12 Jun 2025 08:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o0t8Jr4Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zcb5eQ53";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o0t8Jr4Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zcb5eQ53";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD8510E7A0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:21:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E6AC1F84A;
 Thu, 12 Jun 2025 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
 b=o0t8Jr4YgLD3HoipyEKmfELq+7ylqu46Ex0aZWOCu9HcVgH53AYrxIonLXhg7y7JE4ubuJ
 CgvtGX+TePQ9Okgfo6YXySA+zn4UcoH2ib/aWGPDOAKMWx5At13RwnzaecmhMY3GoGbX0d
 Q8DVtGOYFJJXYASGTdn/NkILHX6kIpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716488;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
 b=Zcb5eQ53Nb3CvOd8G90WZpPJTiSWB46y5XU9R8epFhGtIGfR+f8XrYGZ+Q7xDxjv8nSS2X
 kH5ht8pC90I+y/Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
 b=o0t8Jr4YgLD3HoipyEKmfELq+7ylqu46Ex0aZWOCu9HcVgH53AYrxIonLXhg7y7JE4ubuJ
 CgvtGX+TePQ9Okgfo6YXySA+zn4UcoH2ib/aWGPDOAKMWx5At13RwnzaecmhMY3GoGbX0d
 Q8DVtGOYFJJXYASGTdn/NkILHX6kIpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716488;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
 b=Zcb5eQ53Nb3CvOd8G90WZpPJTiSWB46y5XU9R8epFhGtIGfR+f8XrYGZ+Q7xDxjv8nSS2X
 kH5ht8pC90I+y/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38F3313A6D;
 Thu, 12 Jun 2025 08:21:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0M2RDAiOSmgILAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, linux@armlinux.org.uk,
 FlorianSchandinat@gmx.de, alchark@gmail.com, krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/14] fbdev/omap2: Do not include <linux/export.h>
Date: Thu, 12 Jun 2025 10:16:32 +0200
Message-ID: <20250612081738.197826-10-tzimmermann@suse.de>
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

  drivers/video/fbdev/omap2/omapfb/dss/dpi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
  drivers/video/fbdev/omap2/omapfb/dss/sdi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
  drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c      | 1 -
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c      | 1 -
 drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 86ed4c077c30..ad8ae1727966 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -13,7 +13,6 @@
 
 #include <linux/kernel.h>
 #include <linux/delay.h>
-#include <linux/export.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/platform_device.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index 2d3e5d4467c5..68e569ec0f83 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/regulator/consumer.h>
-#include <linux/export.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/of.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c b/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
index ea8c88aa4477..152dbeaa6451 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
@@ -16,7 +16,6 @@
 #include <linux/mm.h>
 #include <linux/omapfb.h>
 #include <linux/vmalloc.h>
-#include <linux/export.h>
 #include <linux/sizes.h>
 
 #include <video/omapfb_dss.h>
-- 
2.49.0

