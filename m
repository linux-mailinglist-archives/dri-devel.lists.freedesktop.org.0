Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164CF99DEBA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 08:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B0510E2B2;
	Tue, 15 Oct 2024 06:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fM7VX7Oe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V8utWjo+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fM7VX7Oe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V8utWjo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2C810E2B2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 06:51:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A3001F45F;
 Tue, 15 Oct 2024 06:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728975075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZEHkNiEMqgVM/ltwaRiYSGm/LM21y7mlbJQB0CELuGc=;
 b=fM7VX7Oeg4WaQtD5qRaaSirXB4Mw45lf+1CTJOiVyALf5viKp0jiMyUjyDmIRor0A84YdO
 0BqFBr9NgM1dJbWGVD+mktLQKW/RuRdRwV5krJgBoDAidC78HwAEt0nzW4gH3OLR/pLqOK
 nAFUvJGU7pf0GLsWohKWuy0/1zr7OTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728975075;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZEHkNiEMqgVM/ltwaRiYSGm/LM21y7mlbJQB0CELuGc=;
 b=V8utWjo+A5xiHvxtPFi5nblpfNdu8cBGZOOLyMVvHxvz92vh4Z3kQ/LGOuNwNq8DzS4+fk
 rzhFjwN+XsGAf+Bg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fM7VX7Oe;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=V8utWjo+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728975075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZEHkNiEMqgVM/ltwaRiYSGm/LM21y7mlbJQB0CELuGc=;
 b=fM7VX7Oeg4WaQtD5qRaaSirXB4Mw45lf+1CTJOiVyALf5viKp0jiMyUjyDmIRor0A84YdO
 0BqFBr9NgM1dJbWGVD+mktLQKW/RuRdRwV5krJgBoDAidC78HwAEt0nzW4gH3OLR/pLqOK
 nAFUvJGU7pf0GLsWohKWuy0/1zr7OTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728975075;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZEHkNiEMqgVM/ltwaRiYSGm/LM21y7mlbJQB0CELuGc=;
 b=V8utWjo+A5xiHvxtPFi5nblpfNdu8cBGZOOLyMVvHxvz92vh4Z3kQ/LGOuNwNq8DzS4+fk
 rzhFjwN+XsGAf+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41DF613A42;
 Tue, 15 Oct 2024 06:51:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qC/HDuMQDmcbcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Oct 2024 06:51:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/ast: Trivial EDID fixes
Date: Tue, 15 Oct 2024 08:49:05 +0200
Message-ID: <20241015065113.11790-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8A3001F45F
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

After unplugging a display from the connector, the driver has to clear
the connector's EDID property. Recent code for BMC support forget to do
this for VGA- and SIL164-based transmitters. Fix it.

Thomas Zimmermann (2):
  drm/ast: sil164: Clear EDID if no display is connected
  drm/ast: vga: Clear EDID if no display is connected

 drivers/gpu/drm/ast/ast_sil164.c | 2 ++
 drivers/gpu/drm/ast/ast_vga.c    | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.46.0

