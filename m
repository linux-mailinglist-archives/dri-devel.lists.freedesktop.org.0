Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC6087365B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 13:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F1E113125;
	Wed,  6 Mar 2024 12:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UxPfFQET";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="etJpce24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B219811311F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 12:29:44 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3C79D3EE06;
 Wed,  6 Mar 2024 12:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709728182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5y5vALtoA58bwzW2myIJAAwvG2BEvs2NWDoyJ95gbyc=;
 b=UxPfFQET9QmP/609Kw6+wXUR2fX0O/O74Gf/PgfcIosy6qejX1gvxdxzbVz5NImpRAG6xd
 I0/CeZIunsMHgR8X72z+P+AqaicEdRao7net4VTm6Y8PZ2cLavK080KuLWjZFVnYTiQHB9
 Jcv/Wizm8AGDPSrZoGeHtMJeF9Zw5wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709728182;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5y5vALtoA58bwzW2myIJAAwvG2BEvs2NWDoyJ95gbyc=;
 b=etJpce24qjVU0vam9leCkg/pyA197mN/tD1FIXrfhuL7lf7HB8z54PaKzYc3JZYiL7z5bm
 BxG/IhiKhRXo3xDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FEF213A99;
 Wed,  6 Mar 2024 12:29:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id cKiKILVh6GWdTgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Mar 2024 12:29:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au, jani.nikula@intel.com, naresh.kamboju@linaro.org,
 deller@gmx.de, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 lkft-triage@lists.linaro.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/3] fbdev/chipsfb: Include <linux/backlight.h>
Date: Wed,  6 Mar 2024 13:28:18 +0100
Message-ID: <20240306122935.10626-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240306122935.10626-1-tzimmermann@suse.de>
References: <20240306122935.10626-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 3C79D3EE06
X-Spam-Flag: NO
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

Fix builds with CONFIG_PMAC_BACKLIGHT=y. The include statement for
the backlight header has recently been removed from <linux/fb.h>.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/dri-devel/CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 11b4eedfc87d ("fbdev: Do not include <linux/backlight.h> in header")
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/chipsfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index b80711f13df8a..b16a905588fed 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/backlight.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
-- 
2.44.0

