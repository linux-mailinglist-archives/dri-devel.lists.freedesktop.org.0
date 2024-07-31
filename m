Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE4A942E88
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD7D10E604;
	Wed, 31 Jul 2024 12:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iqgx+wh7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iivSVA8p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iqgx+wh7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iivSVA8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A9910E5FF
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 12:35:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7750C21992;
 Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09+AU06djEdeORlaZcSG1+NmM1Qzrn5oq/L4+t2dqQA=;
 b=iqgx+wh7LakyZwFT7Fhqy9nKR6DZZGS1LV4nTB7JCxHOyz635L2hyMT8YS1QCKLy48GBwr
 /puPns8RtoOnvIzuZXCzbf3/PQVInZr72MDR2pUPxcwKmxy/MmzPBxmMLp6PPs6+nQb2pd
 Xj+J8wacp93Evg1NFkZlFpOdfnHQk8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429306;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09+AU06djEdeORlaZcSG1+NmM1Qzrn5oq/L4+t2dqQA=;
 b=iivSVA8p6SadjkLF0r1CnUfhAThfwk3rdNASc1zhjrpzChFliC8ar9oZEne+4UThGPaWvC
 pmgis+4sumFXABBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09+AU06djEdeORlaZcSG1+NmM1Qzrn5oq/L4+t2dqQA=;
 b=iqgx+wh7LakyZwFT7Fhqy9nKR6DZZGS1LV4nTB7JCxHOyz635L2hyMT8YS1QCKLy48GBwr
 /puPns8RtoOnvIzuZXCzbf3/PQVInZr72MDR2pUPxcwKmxy/MmzPBxmMLp6PPs6+nQb2pd
 Xj+J8wacp93Evg1NFkZlFpOdfnHQk8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429306;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09+AU06djEdeORlaZcSG1+NmM1Qzrn5oq/L4+t2dqQA=;
 b=iivSVA8p6SadjkLF0r1CnUfhAThfwk3rdNASc1zhjrpzChFliC8ar9oZEne+4UThGPaWvC
 pmgis+4sumFXABBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 492DE13297;
 Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wLGMEHovqmYiUQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/9] fbdev: chipsfb: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:45 +0200
Message-ID: <20240731123502.1145082-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731123502.1145082-1-tzimmermann@suse.de>
References: <20240731123502.1145082-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.40 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; FREEMAIL_TO(0.00)[gmx.de];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Flag: NO
X-Spam-Score: 0.40
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

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality or semantics

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/chipsfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index b16a905588fe..33caf0b99a45 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -399,7 +399,7 @@ static int chipsfb_pci_init(struct pci_dev *dp, const struct pci_device_id *ent)
 	/* turn on the backlight */
 	mutex_lock(&pmac_backlight_mutex);
 	if (pmac_backlight) {
-		pmac_backlight->props.power = FB_BLANK_UNBLANK;
+		pmac_backlight->props.power = BACKLIGHT_POWER_ON;
 		backlight_update_status(pmac_backlight);
 	}
 	mutex_unlock(&pmac_backlight_mutex);
-- 
2.45.2

