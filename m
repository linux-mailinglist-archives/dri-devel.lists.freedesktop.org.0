Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841C488B0EA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A2D10E584;
	Mon, 25 Mar 2024 20:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qFi9jErc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LB0f03RU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="obY75La/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9aXp70E7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855F510E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:09:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3AF425C2A2;
 Mon, 25 Mar 2024 20:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711397339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jut3qeOixjRbrox3ZvyuBBAu5kGvru1KhVfH+fUHVEc=;
 b=qFi9jErcha2OsGa+fOc+0HD0d9cAt/tsPfkJBzMj1xPgfvtebUG03CwEragHub3O9KSuD6
 U2FrGLmUnCuvVrMgVkz5W/DPwQ6RX7ElBfmRnMNKolypYQPMmjeHJqdCHpGZirmhUjxCpJ
 3bR71FjdYOa0kU5TKwpxhGh2YmCv3qA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711397339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jut3qeOixjRbrox3ZvyuBBAu5kGvru1KhVfH+fUHVEc=;
 b=LB0f03RUXr3YRukNijKoq7C2Neudy0EE+s42SAr6958cKeE+E/3+PMt5+BXjnCd42iP2jN
 YvhCr6jDHxY+S3Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711397338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jut3qeOixjRbrox3ZvyuBBAu5kGvru1KhVfH+fUHVEc=;
 b=obY75La/AQcKNlt7Be/uftnOvKZ6dyMOxPZPmbn7l+3CKMMfOHQYzTj8IxnZhjCneLbAuh
 8A2cQ+5FwWsK4wo0vztq0rneBq2rXTMduw67zz41v/sXCnMYvPh0sixqzcdbM6/3c0jaN+
 6vb7stkEPbdGhwvI+PS7+uboryi4ZFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711397338;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jut3qeOixjRbrox3ZvyuBBAu5kGvru1KhVfH+fUHVEc=;
 b=9aXp70E7+K/cGz940Ep/wTU0DWPx7T1YIFsvzMJiKQcyOiOBv7BHeLK0hFrDjonUzrwzKP
 XL7DadQcYh+LR8Dw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E008013AC5;
 Mon, 25 Mar 2024 20:08:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id KJhkNdnZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:08:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 01/13] drm/ast: Include <linux/of.h> where necessary
Date: Mon, 25 Mar 2024 21:06:46 +0100
Message-ID: <20240325200855.21150-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325200855.21150-1-tzimmermann@suse.de>
References: <20240325200855.21150-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RL9pqk354j4esf7wsagg6iyf8a)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[10];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.dev,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[30.99%]
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

Include <linux/of.h> to get of_property_read_u32() in the source
files that need it. Avoids the proxy include via <linux/i2c.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.c  | 1 +
 drivers/gpu/drm/ast/ast_main.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 90bcb1eb9cd94..f8c49ba68e789 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -27,6 +27,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 2f3ad5f949fcb..0637abb70361c 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -26,6 +26,7 @@
  * Authors: Dave Airlie <airlied@redhat.com>
  */
 
+#include <linux/of.h>
 #include <linux/pci.h>
 
 #include <drm/drm_atomic_helper.h>
-- 
2.44.0

