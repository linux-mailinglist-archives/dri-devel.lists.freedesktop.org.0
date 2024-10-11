Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99BE99A6BD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 16:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802E010E03D;
	Fri, 11 Oct 2024 14:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bdg9Hlye";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rXLE2Cn2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rLWmoVbM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4/U2vT2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56F310EB00
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 14:46:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D4FF41FF09;
 Fri, 11 Oct 2024 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728657994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=05NTnmd3Dzla5sXvmN/4rGy6VLLRTRQIFGKV18p7Jss=;
 b=bdg9HlyebQxiw+zyB5dqjCTeGhT3L2L1WncNKF+AQ4Qn22igmwGzNoS6aNY+oE9AScLH0c
 iKHRWopbCaufCyW/7WZFMwOQNkXPCSX65sOK7D7jDuxNsd5j+D2wRACiKLEhgzF0B5EbUf
 vYX43gaBorNDzRLIfX0k6pId4gxJVNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728657994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=05NTnmd3Dzla5sXvmN/4rGy6VLLRTRQIFGKV18p7Jss=;
 b=rXLE2Cn2fqDGuWBRRvbhE/wF/XxTsTYijR5fe/1neriIPvpEsccINVfC5RjQgXtT70S9ga
 +YMD5JUTM9snDwAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rLWmoVbM;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="4/U2vT2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728657993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=05NTnmd3Dzla5sXvmN/4rGy6VLLRTRQIFGKV18p7Jss=;
 b=rLWmoVbMs/j9oY2KjD8ZNQ6bUtHTSys6lF34f1e3T0XKyg1VhXyPrFbZoOz5TwQpblaEl+
 kmqpS+KW8q4VWKR2sSaBaDLPSeTvGLDe42nv+Kiz8h6gZSe8hvJ3CS1vv8As6kq/QWuVqL
 K/wEzalJUAn2lGf5ROSrry/aiqONJlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728657993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=05NTnmd3Dzla5sXvmN/4rGy6VLLRTRQIFGKV18p7Jss=;
 b=4/U2vT2PkB4pXgQ4Aiwl/M6dl0dftEP7JsfgeaRXj6qrF7PPYb4NAaAvEBw6SKmp0DPHdK
 Y7LV4rcOi/9QseBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A53C8136E0;
 Fri, 11 Oct 2024 14:46:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6iERJ0k6CWc/GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 14:46:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/6] drm: Trivial include fixes
Date: Fri, 11 Oct 2024 16:41:18 +0200
Message-ID: <20241011144632.90434-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D4FF41FF09
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim, suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
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

Fix several proxy includes related to <linux/backlight.h>, which in
turn includes <linux/fb.h>. This includes several more headers that
declare interfaces used by drivers. As backlight.h is expected to not
refer to fb.h soon, resolve the proxy includes by including required
header files directly.

Thomas Zimmermann (6):
  drm/fsl-dcu: Include <linux/of.h>
  drm/panel: Include <linux/of.h>
  drm/panel: panel-orisetech-otm8009a: Include <linux/mod_devicetable.h>
  drm/panel: panel-samsung-s6e3ha2: Include <linux/mod_devicetable.h>
  drm/panel: panel-samsung-s6e63m0: Include <linux/property.h>
  drm/tiny: panel-mipi-dbi: Include <linux/of.h>

 drivers/gpu/drm/drm_panel.c                      | 1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c        | 1 +
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c    | 1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c            | 1 +
 6 files changed, 6 insertions(+)

-- 
2.46.0

