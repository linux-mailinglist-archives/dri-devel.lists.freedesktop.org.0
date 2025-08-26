Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50BAB354CF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5446810E5D1;
	Tue, 26 Aug 2025 06:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dOnF/jo1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DWkRipzc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dOnF/jo1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DWkRipzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546C710E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 06:53:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1627820027;
 Tue, 26 Aug 2025 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756191203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cZVm7Q2mvZZzpRPa74FWq7GAPvIktNpOXl0UN7lzGw=;
 b=dOnF/jo1xSwyfPdpl+eT5T22zDZ56gFzgZTEJ6ejMQgPJDi4sjZY/hEHlTR1kXHgBy1vWN
 80Fajo2M8LhLqI/FEF38nTkeVbHoi7EN6BCA0WE+8Us1UQbigLD5yvM3yYCJiXT/CiTNxJ
 xCSBGC3vEt1vge2USwiZDwIA2pWCR74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756191203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cZVm7Q2mvZZzpRPa74FWq7GAPvIktNpOXl0UN7lzGw=;
 b=DWkRipzcseTdc15HURgy9jPVJnAp+62TCxiM6Ms6M4kh33D9Yn3E6hhG+cXOprFxSXaBTq
 accjTj36cISXGvDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756191203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cZVm7Q2mvZZzpRPa74FWq7GAPvIktNpOXl0UN7lzGw=;
 b=dOnF/jo1xSwyfPdpl+eT5T22zDZ56gFzgZTEJ6ejMQgPJDi4sjZY/hEHlTR1kXHgBy1vWN
 80Fajo2M8LhLqI/FEF38nTkeVbHoi7EN6BCA0WE+8Us1UQbigLD5yvM3yYCJiXT/CiTNxJ
 xCSBGC3vEt1vge2USwiZDwIA2pWCR74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756191203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cZVm7Q2mvZZzpRPa74FWq7GAPvIktNpOXl0UN7lzGw=;
 b=DWkRipzcseTdc15HURgy9jPVJnAp+62TCxiM6Ms6M4kh33D9Yn3E6hhG+cXOprFxSXaBTq
 accjTj36cISXGvDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C80A313A51;
 Tue, 26 Aug 2025 06:53:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WF+lL+JZrWhtMQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Aug 2025 06:53:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/6] drm/ast: Do not print DRAM info
Date: Tue, 26 Aug 2025 08:49:20 +0200
Message-ID: <20250826065032.344412-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826065032.344412-1-tzimmermann@suse.de>
References: <20250826065032.344412-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

Most of the information in the DRAM status output is irrelevant; some
is even wrong. Only the DRAM type is used on some older models. Drop
the output entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 44b9b5f659fc..830f1c5fe893 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -355,8 +355,6 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
 	ret = ast_get_dram_info(ast);
 	if (ret)
 		return ERR_PTR(ret);
-	drm_info(dev, "dram MCLK=%u Mhz type=%d bus_width=%d\n",
-		 ast->mclk, ast->dram_type, ast->dram_bus_width);
 
 	ast_detect_tx_chip(ast, need_post);
 	switch (ast->tx_chip) {
-- 
2.50.1

