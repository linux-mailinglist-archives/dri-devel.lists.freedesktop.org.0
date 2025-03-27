Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DB7A73434
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 15:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7806410E8EC;
	Thu, 27 Mar 2025 14:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Jr6sjJMr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gu1hNPQ1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vYfk6Bar";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kROhuoCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6595510E8EC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 14:18:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D2C2E1F786;
 Thu, 27 Mar 2025 14:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743085118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oHDUk5d5m1G0uGmpSfw/G6GtxuKRMzWpxSOvf8LUe6Q=;
 b=Jr6sjJMrHwaUs2NCGenzhr/1Psowzab9C43iR6VRECgG2OMrMmQkbgK9mh4xmkf0DF733h
 VboP0qjSdhAbg6t2CKx3CramVWLzRcpzoRZ4rC1d4tF2pXyi6hOGqgBimVH+s3sg72mE8g
 dhFtQn3wgVRoBqD0guOzg2YAPt6BksA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743085118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oHDUk5d5m1G0uGmpSfw/G6GtxuKRMzWpxSOvf8LUe6Q=;
 b=Gu1hNPQ19PB4r5f9EC6VMKvmX85zjhEdvhDGHieHIkkOp4OxctTYupCyBjQihPnv/sx/DX
 7cG35lVn3AicJLCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vYfk6Bar;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kROhuoCn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743085117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oHDUk5d5m1G0uGmpSfw/G6GtxuKRMzWpxSOvf8LUe6Q=;
 b=vYfk6BarQ/4w08tIZ2lUqYUPTC/mkD+yAFym6MRsYbgTlurxPcHsBlc7aBrvf2ORLLHMKp
 Fsncdy4oi/1yOgHPhrf52a20hBVcujj8EEPQRrTcIHfdY6lsEO7Pv9TRFCexfyQp7q2K3Q
 Gy7+auTtndJ/j0q+xqFYXCMuWnLy2LY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743085117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oHDUk5d5m1G0uGmpSfw/G6GtxuKRMzWpxSOvf8LUe6Q=;
 b=kROhuoCn+dWuIvESBrcM8XLDEQwX0b4SJiGQaftUyHAPJ36qAjstS1SnZk75KseAxv4U8L
 F4LUJrVjBtkL+vAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5BD11139D4;
 Thu, 27 Mar 2025 14:18:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7Ou2FD1e5WdnXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Mar 2025 14:18:37 +0000
Date: Thu, 27 Mar 2025 15:18:35 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20250327141835.GA96037@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: D2C2E1F786
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_COUNT_TWO(0.00)[2];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Hi Dave, Sima,

here's the PR from drm-misc-next-fixes for this week. There's a single
trivial fix for the new adp driver.

Best regards
Thomas

drm-misc-next-fixes-2025-03-27:
Short summary of fixes pull:

adp:
- Fix error handling in plane setup
The following changes since commit 914ee6e730e134410b77edc453b629767e84c32c:

  drm/appletbdrm: Fix ref-counting on dmadev (2025-03-10 10:54:24 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-03-27

for you to fetch changes up to ee20c69c789b6cb2179a535cf440d72b98f4a134:

  drm: adp: Fix NULL vs IS_ERR() check in adp_plane_new() (2025-03-14 09:42:11 -0400)

----------------------------------------------------------------
Short summary of fixes pull:

adp:
- Fix error handling in plane setup

----------------------------------------------------------------
Dan Carpenter (1):
      drm: adp: Fix NULL vs IS_ERR() check in adp_plane_new()

 drivers/gpu/drm/adp/adp_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
