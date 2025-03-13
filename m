Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E56A5FEB9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 19:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822A510E257;
	Thu, 13 Mar 2025 18:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zNVEWNS/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ukLJWsxG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ynLAWiIM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xl61+A5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCE910E900
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 18:01:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 536FF1F388;
 Thu, 13 Mar 2025 18:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741888898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TjuN0IveOUG/6vNO+5+3Nnsz/EWCBxjJ4RidM1cHTwo=;
 b=zNVEWNS/J83Hc7FLwkycVcKGjP2NQg50xAeYFCGJnH9MGbYZNQnkzRaqV4M19XoOuUamw2
 qpRKj0+bb+V1QBsHIowE4tLSyNWWE+tTgVgUXYA/PlKuKw+WkvJla31EJihSq4VefcTKfo
 BYaeCfwCXvpLz6+h/rVIvr8Gg72o7C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741888898;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TjuN0IveOUG/6vNO+5+3Nnsz/EWCBxjJ4RidM1cHTwo=;
 b=ukLJWsxGXjvkbLlBCEP1jy0+QSPFlCPPavQ1ubiI2ktyjVa5eZOJ7CWwYkyuylhw87dnZT
 mV4FxBEd2+9o/OBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741888897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TjuN0IveOUG/6vNO+5+3Nnsz/EWCBxjJ4RidM1cHTwo=;
 b=ynLAWiIMei4fLJZCwYr9lBpWgpn51wrUPv9efPJph6r45h+8AyazUHI0u/eT53U3NTrFh/
 XzoY9gojr3/7gohygbdejt/M+VowSkBQ/hX6fF3CebZvxI/ntyA+845Te2vFAFKdU8xRvr
 5zqE/CvnqbWJOxV8ntyx9q5e5fSBcNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741888897;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TjuN0IveOUG/6vNO+5+3Nnsz/EWCBxjJ4RidM1cHTwo=;
 b=xl61+A5duR7/A1lcvqw2k2ih8TXexM/zDi7PxtCTg8QOgfrF8IiyTNEqdlCl80Z+Y0+Yu8
 avEZAY7N67Vi+uAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DFEB6137BA;
 Thu, 13 Mar 2025 18:01:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HMFsNYAd02dFSwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Mar 2025 18:01:36 +0000
Date: Thu, 13 Mar 2025 19:01:35 +0100
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
Message-ID: <20250313180135.GA276891@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MISSING_XM_UA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 linux.fritz.box:mid, gitlab.freedesktop.org:url]
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

Hi Dave, Sima,

here's the first PR from drm-misc-next-fixes for this release cycle.
Just one patch this week.

Best regards
Thomas

drm-misc-next-fixes-2025-03-13:
Short summary of fixes pull:

appletbdrm:
- Fix device refcount
The following changes since commit d65a27f95f6ab236b1a788d9bc463d24a8b2aebe:

  Merge tag 'drm-misc-next-2025-03-06' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2025-03-07 09:55:50 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-03-13

for you to fetch changes up to 914ee6e730e134410b77edc453b629767e84c32c:

  drm/appletbdrm: Fix ref-counting on dmadev (2025-03-10 10:54:24 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

appletbdrm:
- Fix device refcount

----------------------------------------------------------------
Thomas Zimmermann (1):
      drm/appletbdrm: Fix ref-counting on dmadev

 drivers/gpu/drm/tiny/appletbdrm.c | 1 -
 1 file changed, 1 deletion(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
