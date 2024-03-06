Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F4873659
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 13:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3CF113124;
	Wed,  6 Mar 2024 12:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ICN4//FG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oaN2YyUU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r8h0hjSy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wLnEU1dZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BB411311F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 12:29:45 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E65AF3EE52;
 Wed,  6 Mar 2024 12:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709728183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJNxphZx7XjU9hiGlq4h2q9FwKPOBcX1l2W3Dsi+WLE=;
 b=ICN4//FGmuEjcPVnj+SfqqTI/t3LzpsCERY4Ca6tGEvO9VQ//HKgiyQjWH+/mHJt2jOAJY
 3UER7Nx3nKvobmzp3tinSKZVLz+eKxUXbN2wrzm8Ap+REQvgTd7sXxDXuLRgum2Mgjnn31
 cqy/bNn/gKnN8tbiwQ2b9y2y8Up3cPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709728183;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJNxphZx7XjU9hiGlq4h2q9FwKPOBcX1l2W3Dsi+WLE=;
 b=oaN2YyUUHdeJqYPjlvUkBXBxK5B4V+nLcGDg80+aTv3TENGff/iJiavGL+guFNAu+hVDOX
 5e5uR6CP9MTg5MBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709728182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJNxphZx7XjU9hiGlq4h2q9FwKPOBcX1l2W3Dsi+WLE=;
 b=r8h0hjSyqHERH5YA4X/WlprlmyPv85scRxZ3Xn3t3fKLks+hsWmTNTorf6FpIn8Ljy7ZEN
 zaZ8Ih/+YoNcUAmiyAKvpuV4GljJwn4S9KAUGNKLZt2qx2NtKpTL8SCrNZojfeLGfWCebF
 ssnORnHzhIlFnDdBYXgiBagRwkI1i9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709728182;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJNxphZx7XjU9hiGlq4h2q9FwKPOBcX1l2W3Dsi+WLE=;
 b=wLnEU1dZXGOZHjuc8TGCU3NXkc1b8a8DDKNpfFDjV4u7Rkf6FBby4zCuGksKhsY9cfVkGJ
 B6vQc8HA9kZflDAg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 47C3613A9B;
 Wed,  6 Mar 2024 12:29:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id ENkpELZh6GWdTgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Mar 2024 12:29:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au, jani.nikula@intel.com, naresh.kamboju@linaro.org,
 deller@gmx.de, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 lkft-triage@lists.linaro.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 2/3] macintosh/via-pmu-backlight: Include
 <linux/backlight.h>
Date: Wed,  6 Mar 2024 13:28:19 +0100
Message-ID: <20240306122935.10626-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240306122935.10626-1-tzimmermann@suse.de>
References: <20240306122935.10626-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-2.02 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RL9wq65f3r6cge75md5ma8xy98)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[14]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,intel.com:email,gmx.de:email,lists.freedesktop.org:email,suse.de:email];
 FREEMAIL_TO(0.00)[ellerman.id.au,intel.com,linaro.org,gmx.de,gmail.com,csgroup.eu,kernel.org,linux.ibm.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-2.92)[99.67%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.02
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

Fix builds with CONFIG_PMAC_BACKLIGHT=y. The include statement for the
backlight header has recently been removed from <linux/fb.h>. Add it to
via-pmu-backlight.c to get the necessary symbols.

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
 drivers/macintosh/via-pmu-backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/macintosh/via-pmu-backlight.c b/drivers/macintosh/via-pmu-backlight.c
index c2d87e7fa85be..89450645c2305 100644
--- a/drivers/macintosh/via-pmu-backlight.c
+++ b/drivers/macintosh/via-pmu-backlight.c
@@ -10,6 +10,7 @@
 
 #include <asm/ptrace.h>
 #include <linux/adb.h>
+#include <linux/backlight.h>
 #include <linux/pmu.h>
 #include <asm/backlight.h>
 
-- 
2.44.0

