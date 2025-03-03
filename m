Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5733A4C3FD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 15:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4B410E44E;
	Mon,  3 Mar 2025 14:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AOLGSyVn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1cYKua0s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AOLGSyVn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1cYKua0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0572710E463
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 14:59:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ADE781F393;
 Mon,  3 Mar 2025 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741013952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/Lh+LAy7QPBUgdx0kMj52Rnan70fpGj03qqEB/caUuA=;
 b=AOLGSyVnHwqDBLIf8f052CS5DKjvQeHg/1EQtwiL8/hqvoTKdHJhs56zKHW/RpU622tooI
 Iay7j1A96+uu7iFnkpuPqE8HCJgOtYeqWOYyooI0KWBEbYT/A0BuupU6/CF1QoeqQ6a5HG
 Oko8oJLzg4KAmd2+EYlXfVVj72MvP40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741013952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/Lh+LAy7QPBUgdx0kMj52Rnan70fpGj03qqEB/caUuA=;
 b=1cYKua0slF3v89afh1EUkxOrcUJDEyNZv21rg7V2/wF65CZMJXAhLEctpD98FSx3lWVpQi
 JRzQeRA3rRACSlCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AOLGSyVn;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1cYKua0s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741013952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/Lh+LAy7QPBUgdx0kMj52Rnan70fpGj03qqEB/caUuA=;
 b=AOLGSyVnHwqDBLIf8f052CS5DKjvQeHg/1EQtwiL8/hqvoTKdHJhs56zKHW/RpU622tooI
 Iay7j1A96+uu7iFnkpuPqE8HCJgOtYeqWOYyooI0KWBEbYT/A0BuupU6/CF1QoeqQ6a5HG
 Oko8oJLzg4KAmd2+EYlXfVVj72MvP40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741013952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/Lh+LAy7QPBUgdx0kMj52Rnan70fpGj03qqEB/caUuA=;
 b=1cYKua0slF3v89afh1EUkxOrcUJDEyNZv21rg7V2/wF65CZMJXAhLEctpD98FSx3lWVpQi
 JRzQeRA3rRACSlCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6217C13939;
 Mon,  3 Mar 2025 14:59:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jSykFsDDxWeZBAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Mar 2025 14:59:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, simona@ffwll.ch, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/udl: Fix USB disconnect
Date: Mon,  3 Mar 2025 15:52:55 +0100
Message-ID: <20250303145604.62962-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ADE781F393
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,linux.intel.com,kernel.org,gmail.com,poorly.run];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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

The udl drivers prints warnings about dropped URBs from its disconnect
handler. This is because the poll helper doesn't yet know that the USB
device is gone. Fix the disconnect clean-up logic and use managed cleanup
for poll helpers.

Thomas Zimmermann (3):
  drm/udl: Unregister device before cleaning up on disconnect
  drm/udl: Switch poll helpers to managed cleanup
  drm/probe-helper: Do not fail from drmm_kms_helper_poll_init()

 drivers/gpu/drm/ast/ast_mode.c     |  5 +----
 drivers/gpu/drm/drm_probe_helper.c | 11 ++++++-----
 drivers/gpu/drm/udl/udl_drv.c      |  3 +--
 drivers/gpu/drm/udl/udl_main.c     |  2 --
 drivers/gpu/drm/udl/udl_modeset.c  |  1 +
 include/drm/drm_probe_helper.h     |  2 +-
 6 files changed, 10 insertions(+), 14 deletions(-)

-- 
2.48.1

