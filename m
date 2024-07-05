Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89E192882B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A789410EB83;
	Fri,  5 Jul 2024 11:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OqCilc/r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zhB/mM/2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l2K61TL9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EEPVUn6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8625110EB78
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:49:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB2221FCFF;
 Fri,  5 Jul 2024 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UagM+OGXJllgRgIgvnskccvPd41S05sJrQFKEw+19oQ=;
 b=OqCilc/rFeJVaq+Lf/GX+2VcGA+DF475FfA9eaX06Xl9uDjFDUlh8rZDQaQP5lFGhEy4XY
 Upf/oFHjXKURpof9dmlt30d/Jso8IQIw+hdWg6yR6kiqmxjj8CK/ADbWtREFw004n46q2t
 cB/wsdzZr8Sivx6tblocz296Gp+j0Zk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180146;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UagM+OGXJllgRgIgvnskccvPd41S05sJrQFKEw+19oQ=;
 b=zhB/mM/2O/rAABfjEMZfUtW8sCfGUHGXpq+ZvY69SiYCNIoTOic7FVTt28DTaPHA7rXNSn
 qm3KcKH9Gm1Gg3DQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=l2K61TL9;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EEPVUn6w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720180145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UagM+OGXJllgRgIgvnskccvPd41S05sJrQFKEw+19oQ=;
 b=l2K61TL96GNfqN9WrO0hxOjf8MIws3RX6vPI5VCdKks70+L9cJpYz0dxUmP0lRURQvkavD
 KGmfrb/cveROFSAjFWw54NQ8FC2iv4oBSvSH419N/zpUkuGYSbc5bh01Z/9dQVZ+iNd0hY
 QPC30jcm7jzRugTjSC//pPoCMN92s2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720180145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UagM+OGXJllgRgIgvnskccvPd41S05sJrQFKEw+19oQ=;
 b=EEPVUn6wQgEdPb22ZaMgYft+lt0UWEUQSwf9zpn8m7RKMC0dIdw+ZTzifehsinTohXcz9y
 GZy8HdHmNCyGlWCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB3A913889;
 Fri,  5 Jul 2024 11:49:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qCJ7KLHdh2bUcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Jul 2024 11:49:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, sam@ravnborg.org,
 emil.l.velikov@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 0/7] drm/mgag200: Implement VBLANK support
Date: Fri,  5 Jul 2024 13:47:43 +0200
Message-ID: <20240705114900.572-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EB2221FCFF
X-Spam-Flag: NO
X-Spam-Score: -1.51
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

(was: Rate-limit shadow-FB-to-console-update to screen refresh)

Implement support for VBLANK events in mgag200.

Patches 1 to 5 prepare mgag200's modesetting code by renaming or
adding variables for various hardware fields. This makes the code
more readable and aligns it with the programming manuals for Matrox 
hardware.

Patch 6 implements support for VBLANK events. The patch has been
reviewed before at [1]. That old patchset never found its way into
the kernel, but the VBLANK support is still useful.

Patch 7 adds support for VBLANK timestamps.

v4:
- split off the patchset from an earlier series [1]

[1] https://patchwork.freedesktop.org/series/66442/

Thomas Zimmermann (7):
  drm/mgag200: Use hexadecimal register indeces
  drm/mgag200: Align register field names with documentation
  drm/mgag200: Use adjusted mode values for CRTCs
  drm/mgag200: Add dedicated variables for blanking fields
  drm/mgag200: Add dedicted variable for <linecomp> field
  drm/mgag200: Add vblank support
  drm/mgag200: Implement struct drm_crtc_funcs.get_vblank_timestamp

 drivers/gpu/drm/mgag200/mgag200_drv.c     |  47 ++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  14 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c    |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |   5 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   5 +
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 169 ++++++++++++++++------
 drivers/gpu/drm/mgag200/mgag200_reg.h     |   7 +
 12 files changed, 232 insertions(+), 45 deletions(-)

-- 
2.45.2

