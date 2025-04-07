Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9644CA7DFFA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8291210E471;
	Mon,  7 Apr 2025 13:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="m6KqEIrY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fW7df1jQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m6KqEIrY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fW7df1jQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B30610E14F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:51:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C1AD01F388;
 Mon,  7 Apr 2025 13:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744033868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tPfQ1NEpvxJnJN5aG3nwhykhcCFX5aIEi+AbM76QZ0U=;
 b=m6KqEIrYpd0ocW5ponsHipHyP10IE5+giS+0KbZ8pDUFm9pdXWDm3hNJeV6ZcDu9JlMxQB
 xDbOPN6ob/WzXnJGEA0bCW7+PhjT4WFI6Z4gXSSSiPP671T2pjvpBo0CqZ6Fy3R2/9L5Ic
 DjgE/zdRT6uZIW9WeeL7HXfopFh5T/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744033868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tPfQ1NEpvxJnJN5aG3nwhykhcCFX5aIEi+AbM76QZ0U=;
 b=fW7df1jQ/1etg9vtzK3PQLH5X4I6Jd/ytZTLKZ9Ev+CHdr0sJP67WZZ96+J0AWWlzbhkO1
 pf+WgN9TQmpx2HAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m6KqEIrY;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fW7df1jQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744033868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tPfQ1NEpvxJnJN5aG3nwhykhcCFX5aIEi+AbM76QZ0U=;
 b=m6KqEIrYpd0ocW5ponsHipHyP10IE5+giS+0KbZ8pDUFm9pdXWDm3hNJeV6ZcDu9JlMxQB
 xDbOPN6ob/WzXnJGEA0bCW7+PhjT4WFI6Z4gXSSSiPP671T2pjvpBo0CqZ6Fy3R2/9L5Ic
 DjgE/zdRT6uZIW9WeeL7HXfopFh5T/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744033868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tPfQ1NEpvxJnJN5aG3nwhykhcCFX5aIEi+AbM76QZ0U=;
 b=fW7df1jQ/1etg9vtzK3PQLH5X4I6Jd/ytZTLKZ9Ev+CHdr0sJP67WZZ96+J0AWWlzbhkO1
 pf+WgN9TQmpx2HAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9388813A4B;
 Mon,  7 Apr 2025 13:51:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +/O4IkzY82eEHQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Apr 2025 13:51:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/sysfb: simpledrm: Fix device upcasts
Date: Mon,  7 Apr 2025 15:47:23 +0200
Message-ID: <20250407134753.985925-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C1AD01F388
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo]
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

Simpledrm contains invalid upcasts from struct drm_device. Remove
upcasting.

Thomas Zimmermann (2):
  drm/simpledrm: Do not upcast in release helpers
  drm/sysfb: simpledrm: Remove unused helper simpledrm_device_of_dev()

 drivers/gpu/drm/sysfb/simpledrm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

-- 
2.49.0

