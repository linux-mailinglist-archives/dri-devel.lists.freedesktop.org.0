Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6FF8C282C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A15910EE3E;
	Fri, 10 May 2024 15:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QuwnOY4R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qCxOZhKf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QuwnOY4R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qCxOZhKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052ED10ED80
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:48:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B1A8A6738C;
 Fri, 10 May 2024 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715356124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SboyLU/aPnyVf9xOi5bFyCFrmNYeGd3/r5VQHCGWnbA=;
 b=QuwnOY4ReB0aoCJGHG0U/ILsv/Fvpfkx6ACKWPoDzWobOpNiEj99bvXyg53pffBZQz+vRk
 D6Hy8FF/0/i65XhQlbBm5b/A1mMLg6t454FLpB6nGOjoA7G+vlVtP9IcSm54fbrRWlVVIW
 zhb8Kbyeo11gucYuzxAnRdmUFUwaKoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715356124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SboyLU/aPnyVf9xOi5bFyCFrmNYeGd3/r5VQHCGWnbA=;
 b=qCxOZhKfn45Sz/nbsP/kDfd9U32V+CcnU57WNXqSwoMn50jl/C/SixVwkJcjqeGK4O5IBJ
 EXaOn3VUzalkIeBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QuwnOY4R;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qCxOZhKf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715356124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SboyLU/aPnyVf9xOi5bFyCFrmNYeGd3/r5VQHCGWnbA=;
 b=QuwnOY4ReB0aoCJGHG0U/ILsv/Fvpfkx6ACKWPoDzWobOpNiEj99bvXyg53pffBZQz+vRk
 D6Hy8FF/0/i65XhQlbBm5b/A1mMLg6t454FLpB6nGOjoA7G+vlVtP9IcSm54fbrRWlVVIW
 zhb8Kbyeo11gucYuzxAnRdmUFUwaKoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715356124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SboyLU/aPnyVf9xOi5bFyCFrmNYeGd3/r5VQHCGWnbA=;
 b=qCxOZhKfn45Sz/nbsP/kDfd9U32V+CcnU57WNXqSwoMn50jl/C/SixVwkJcjqeGK4O5IBJ
 EXaOn3VUzalkIeBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72CF313A39;
 Fri, 10 May 2024 15:48:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sK3cGtxBPma7MgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 May 2024 15:48:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 3/5] drm/udl: Clean up Makefile
Date: Fri, 10 May 2024 17:47:10 +0200
Message-ID: <20240510154841.11370-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510154841.11370-1-tzimmermann@suse.de>
References: <20240510154841.11370-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim]; TO_DN_SOME(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B1A8A6738C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.01
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

Clean up Makefile before listing new object files. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/udl/Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/Makefile b/drivers/gpu/drm/udl/Makefile
index 3f6db179455d1..00690741db376 100644
--- a/drivers/gpu/drm/udl/Makefile
+++ b/drivers/gpu/drm/udl/Makefile
@@ -1,4 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
-udl-y := udl_drv.o udl_modeset.o udl_main.o udl_transfer.o
+
+udl-y := \
+	udl_drv.o \
+	udl_main.o \
+	udl_modeset.o \
+	udl_transfer.o
 
 obj-$(CONFIG_DRM_UDL) := udl.o
-- 
2.44.0

