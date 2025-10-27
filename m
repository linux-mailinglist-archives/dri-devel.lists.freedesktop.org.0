Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9674AC0E3D5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CF010E4AD;
	Mon, 27 Oct 2025 14:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aWUyu4iE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6LpRkn2u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aWUyu4iE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6LpRkn2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CBA10E4AD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:06:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B8D9421A3A;
 Mon, 27 Oct 2025 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761574010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fO0TbvnWdk4B6flZBNryj4UTlawtK3PKy0XxEAgaHLQ=;
 b=aWUyu4iEHcsIH/QUqscncDi/GtVg8fov4PogbF8kTQXGOq8tH9btyFyGXpFBRpreCDlLnN
 OlSjQJ0tCRTF1BwdkCBbNYyxqM8ZcFCbv8yG2IKP80vFQl5GHglEk1GgpvSpKxQRbZ6mXe
 KPZXkrObMQR9uKhhmeDlG+8zaJW7OAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761574010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fO0TbvnWdk4B6flZBNryj4UTlawtK3PKy0XxEAgaHLQ=;
 b=6LpRkn2u5YixPleU4NEjy7by9nFIUmyTwN+t6xd8F9OeaorRMWoMgelFDskX1l+NLajY1M
 M/6wYaa8nloLmSDg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aWUyu4iE;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6LpRkn2u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761574010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fO0TbvnWdk4B6flZBNryj4UTlawtK3PKy0XxEAgaHLQ=;
 b=aWUyu4iEHcsIH/QUqscncDi/GtVg8fov4PogbF8kTQXGOq8tH9btyFyGXpFBRpreCDlLnN
 OlSjQJ0tCRTF1BwdkCBbNYyxqM8ZcFCbv8yG2IKP80vFQl5GHglEk1GgpvSpKxQRbZ6mXe
 KPZXkrObMQR9uKhhmeDlG+8zaJW7OAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761574010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fO0TbvnWdk4B6flZBNryj4UTlawtK3PKy0XxEAgaHLQ=;
 b=6LpRkn2u5YixPleU4NEjy7by9nFIUmyTwN+t6xd8F9OeaorRMWoMgelFDskX1l+NLajY1M
 M/6wYaa8nloLmSDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 570D113693;
 Mon, 27 Oct 2025 14:06:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LIXJE3p8/2jMdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 14:06:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: naresh.kamboju@linaro.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] powerpc: Fix backlight include fallout
Date: Mon, 27 Oct 2025 15:05:39 +0100
Message-ID: <20251027140646.227025-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B8D9421A3A
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[linaro.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[12]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Fix the fallout from a recent cleanup of the backlight header.

Thomas Zimmermann (2):
  powermac: backlight: Include <linux/of.h>
  macintosh/via-pmu-backlight: Include <linux/fb.h> and <linux/of.h>

 arch/powerpc/platforms/powermac/backlight.c | 1 +
 drivers/macintosh/via-pmu-backlight.c       | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.51.1

