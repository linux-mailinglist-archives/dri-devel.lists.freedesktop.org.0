Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0549AC0ACA
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 13:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58CD10E7C8;
	Thu, 22 May 2025 11:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LrRJCe10";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ejUr3kfh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LrRJCe10";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ejUr3kfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73CE10E7C3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 11:49:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7E8731F451;
 Thu, 22 May 2025 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747914590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=FqCczVLQKcIawzM2XednQUgL5/R8N77aTGF3JRFQuSQ=;
 b=LrRJCe10Q87uHVLxL4MvPcpyOqm4gwveA5eA9GvNuHPfQES/jeZq+QsyXhb6g9IhC+avg/
 481yQLc1N0KU3i3XBmcFSLrYc56rEcZGxpObJLKHgHs5YhBFR9DnI+7VAmZxkrwd8ONDp1
 liivI6HBmSM9FWerMYh5oXJuR5REt6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747914590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=FqCczVLQKcIawzM2XednQUgL5/R8N77aTGF3JRFQuSQ=;
 b=ejUr3kfhZDVijbOJN9PG2OiUVBHGBAvOfdLHefhweSjc4dJ66saUbgP/q7ZUXnZ2ljnZGZ
 YkneKItRRwsnThBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747914590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=FqCczVLQKcIawzM2XednQUgL5/R8N77aTGF3JRFQuSQ=;
 b=LrRJCe10Q87uHVLxL4MvPcpyOqm4gwveA5eA9GvNuHPfQES/jeZq+QsyXhb6g9IhC+avg/
 481yQLc1N0KU3i3XBmcFSLrYc56rEcZGxpObJLKHgHs5YhBFR9DnI+7VAmZxkrwd8ONDp1
 liivI6HBmSM9FWerMYh5oXJuR5REt6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747914590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=FqCczVLQKcIawzM2XednQUgL5/R8N77aTGF3JRFQuSQ=;
 b=ejUr3kfhZDVijbOJN9PG2OiUVBHGBAvOfdLHefhweSjc4dJ66saUbgP/q7ZUXnZ2ljnZGZ
 YkneKItRRwsnThBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 364AF137B8;
 Thu, 22 May 2025 11:49:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zcZpDF4PL2hYYwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 22 May 2025 11:49:50 +0000
Date: Thu, 22 May 2025 13:49:48 +0200
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
Subject: [PULL] drm-misc-fixes
Message-ID: <20250522113902.GA7000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 localhost.localdomain:mid, feijuan.li:url, gitlab.freedesktop.org:url]
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

only one fix from drm-misc-fixes this week.

Best regards
Thomas

drm-misc-fixes-2025-05-22:
Short summary of fixes pull:

edid:
- fix HDR metadata reset
The following changes since commit 72c7d62583ebce7baeb61acce6057c361f73be4a:

  dma-buf: insert memory barrier before updating num_fences (2025-05-14 15:31:23 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-05-22

for you to fetch changes up to 6692dbc15e5ed40a3aa037aced65d7b8826c58cd:

  drm/edid: fixed the bug that hdr metadata was not reset (2025-05-19 12:26:08 +0300)

----------------------------------------------------------------
Short summary of fixes pull:

edid:
- fix HDR metadata reset

----------------------------------------------------------------
feijuan.li (1):
      drm/edid: fixed the bug that hdr metadata was not reset

 drivers/gpu/drm/drm_edid.c | 1 +
 1 file changed, 1 insertion(+)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
