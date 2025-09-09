Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE7B4FCAE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF2E10E731;
	Tue,  9 Sep 2025 13:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Xgj9F4KL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HWnXNunt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xgj9F4KL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HWnXNunt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EED10E730
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:23:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 17A245CD42;
 Tue,  9 Sep 2025 13:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757424215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IUc8AjzQRApggW4uIo9PqIWujxmpyBtKzPWA/Vpo8n0=;
 b=Xgj9F4KLEByZU789Lqeaf3ai+D94EcMSqdp09hyg1nSSQsJjiE5aaXXxj/S8yCbmE9kXKH
 O+L+6Jp3NiA9zzdr2UV8sEU80KGhm+1vRwnjXSw74hBKIRg1Lr1wKTw9+a1N5CbtMjh2w6
 DNPDssX5zSaxmEqPKeQdFvv1V0wm4d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757424215;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IUc8AjzQRApggW4uIo9PqIWujxmpyBtKzPWA/Vpo8n0=;
 b=HWnXNuntdCoR1kpUK91DaS+HewmosP8uCYceCom+Wz+pM3cgrjGVv5CD0lD/cm7aRtW5zF
 oDr0FjmUy6nUppCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Xgj9F4KL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HWnXNunt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757424215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IUc8AjzQRApggW4uIo9PqIWujxmpyBtKzPWA/Vpo8n0=;
 b=Xgj9F4KLEByZU789Lqeaf3ai+D94EcMSqdp09hyg1nSSQsJjiE5aaXXxj/S8yCbmE9kXKH
 O+L+6Jp3NiA9zzdr2UV8sEU80KGhm+1vRwnjXSw74hBKIRg1Lr1wKTw9+a1N5CbtMjh2w6
 DNPDssX5zSaxmEqPKeQdFvv1V0wm4d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757424215;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IUc8AjzQRApggW4uIo9PqIWujxmpyBtKzPWA/Vpo8n0=;
 b=HWnXNuntdCoR1kpUK91DaS+HewmosP8uCYceCom+Wz+pM3cgrjGVv5CD0lD/cm7aRtW5zF
 oDr0FjmUy6nUppCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB7951365E;
 Tue,  9 Sep 2025 13:23:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ctdCMFYqwGgmXAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Sep 2025 13:23:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	simona@ffwll.ch,
	arnd@arndb.de,
	soci@c64.rulez.org
Cc: daniel.palmer@sony.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] fbdev: Simple fixes to Kconfig dependencies
Date: Tue,  9 Sep 2025 15:19:29 +0200
Message-ID: <20250909132047.152612-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmx.de,ffwll.ch,arndb.de,c64.rulez.org];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 17A245CD42
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Fix some of the dependencies within fbdev to follow best practices.

Thomas Zimmermann (2):
  fbdev: Make drivers depend on FB_TILEBLITTING
  fbdev: Turn FB_MODE_HELPERS into an internal config option

 drivers/video/fbdev/Kconfig      | 8 ++++----
 drivers/video/fbdev/core/Kconfig | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.51.0

