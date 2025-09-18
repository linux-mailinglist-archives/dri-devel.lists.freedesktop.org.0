Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A07B85B8B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 17:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B63710E1F8;
	Thu, 18 Sep 2025 15:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dlQEoWs0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EvsFjNHo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dlQEoWs0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EvsFjNHo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A176C10E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 15:44:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 348693368A;
 Thu, 18 Sep 2025 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758210295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wGjzDc+EnR3bJ+pbJKHaYbjYVVHWApbGTGx1hlyxqMg=;
 b=dlQEoWs0N+pd1fPS8OZqMoU28xL6lanYkofWncYtRQDA/c1VHQs/3cvIg6L9yfGPNEhwmg
 fKkX7EUxskSnEJfU1b1l/C0bURJofO4KidkJsidK06uBuGIIEZvWCEUCM84aNrzh7oSlTI
 3CD/ovgSU/X4JG/cYNva4VvkOSYK9Nk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758210295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wGjzDc+EnR3bJ+pbJKHaYbjYVVHWApbGTGx1hlyxqMg=;
 b=EvsFjNHoLgVeeqvFYKZkknRwA33au4vGeEcuvMnNHZN2UUckT40Y+1ckfMEI4AJwAKumgj
 H40vcxvjBDLYyPDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dlQEoWs0;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EvsFjNHo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758210295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wGjzDc+EnR3bJ+pbJKHaYbjYVVHWApbGTGx1hlyxqMg=;
 b=dlQEoWs0N+pd1fPS8OZqMoU28xL6lanYkofWncYtRQDA/c1VHQs/3cvIg6L9yfGPNEhwmg
 fKkX7EUxskSnEJfU1b1l/C0bURJofO4KidkJsidK06uBuGIIEZvWCEUCM84aNrzh7oSlTI
 3CD/ovgSU/X4JG/cYNva4VvkOSYK9Nk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758210295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wGjzDc+EnR3bJ+pbJKHaYbjYVVHWApbGTGx1hlyxqMg=;
 b=EvsFjNHoLgVeeqvFYKZkknRwA33au4vGeEcuvMnNHZN2UUckT40Y+1ckfMEI4AJwAKumgj
 H40vcxvjBDLYyPDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00F1C13A51;
 Thu, 18 Sep 2025 15:44:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uPmgOvYozGh/YQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Sep 2025 15:44:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] drm/sysfb: Integrate blit helper
Date: Thu, 18 Sep 2025 17:39:48 +0200
Message-ID: <20250918154207.84714-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
 RCPT_COUNT_SEVEN(0.00)[7];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 348693368A
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

The sysfb-helper library is the only remaining user of drm_fb_blit().
Merge the code into the module and remove the helper. Cleans up the
interface of the format-helper library. Also improves error detection
and performance of the sysfb code.

Tested on vesadrm with format conversion.

v2:
- simplify duplicate helper (Javier)
- fix vesadrm begin_fb_access
- minor fixes

Thomas Zimmermann (3):
  drm/sysfb: Add custom plane state
  drm/sysfb: Lookup blit function during atomic check
  drm/format-helper: Remove drm_fb_blit()

 drivers/gpu/drm/drm_format_helper.c       |  91 -------------
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h  |  34 ++++-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 153 +++++++++++++++++++++-
 drivers/gpu/drm/sysfb/vesadrm.c           |   3 +-
 include/drm/drm_format_helper.h           |   4 -
 5 files changed, 183 insertions(+), 102 deletions(-)

-- 
2.51.0

