Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84806CACDDC
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A5310E408;
	Mon,  8 Dec 2025 10:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UjA7N6bm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vdrYY+Kp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FGptB9H8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FEoFLqGs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAA310E408
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:28:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F35FC5BE9F;
 Mon,  8 Dec 2025 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765189736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=83/Mri6rkMAhnMrvR8Wn72egYf7ePlsBAu+deyXrnRM=;
 b=UjA7N6bmJgB/jgxCOm1F5dosVWqcYAj+CY0MiLP8AqJoUigRonxyMxGvLZYpOt0EB94ujG
 izZum+/pZcp8n/IxuwjixCyhZNrWTAzFsbeJ/15rztMoJ+lHR+5MIWv8mftH1p2hB9B/Dm
 hKH/EQz+meupCq9X7COjtjnzNrohFww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765189736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=83/Mri6rkMAhnMrvR8Wn72egYf7ePlsBAu+deyXrnRM=;
 b=vdrYY+Kp+aTbVtAcIULnff6kuhFrshrG6K3FP9JISediCbfpnw4/PS5cgsXtzgV9Qa1Xuc
 sKTxz2IAYsTYBfAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FGptB9H8;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FEoFLqGs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765189735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=83/Mri6rkMAhnMrvR8Wn72egYf7ePlsBAu+deyXrnRM=;
 b=FGptB9H8aSkB+d7VDPBdZAmZwGKf2uUgJZDWS4s9qroSm18ubCTFMOKiK/fOqGL5kpuJTM
 sOSRwG8eA/SD2JKPN4YNuqN2663m+nvY2Cs5AUvwX/OuKM9S59GHtkQvcwPVvFtDIAhLgq
 3368XDEebX4dEuGkepSWL/x1/AM8+ss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765189735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=83/Mri6rkMAhnMrvR8Wn72egYf7ePlsBAu+deyXrnRM=;
 b=FEoFLqGs4p82IfyHfgnSu7talPRzFU07/rGJwPX0s+vTB7Lv+4gU7qKfrABkrkfs3nLDQv
 H1/PEXZ7I/3xqLCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9EC113EA63;
 Mon,  8 Dec 2025 10:28:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yt9TJWaoNmm7VQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Dec 2025 10:28:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, simona@ffwll.ch,
 airlied@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] vt: Remove kdb hooks
Date: Mon,  8 Dec 2025 11:17:32 +0100
Message-ID: <20251208102851.40894-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,ffwll.ch,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: F35FC5BE9F
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

Commit 7068d42048da ("fbcon: Remove fb_debug_enter/_leave from struct
fb_ops") removed the only implementation of the kdb hooks in struct
consw. Now clean up the callers in vt and the hooks themselves.

If accepted, this series would ideally go through DRM trees, so that
it reaches upstream together with the fbcon rework in v6.20-rc1.

Thomas Zimmermann (2):
  vt: Remove trailing whitespace
  vt: Remove con_debug_enter/_leave from struct consw

 drivers/tty/vt/vt.c     | 32 ++------------------------------
 include/linux/console.h |  8 --------
 2 files changed, 2 insertions(+), 38 deletions(-)

-- 
2.52.0

