Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1889AE55B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 14:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216E910E930;
	Thu, 24 Oct 2024 12:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IeLaMLom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bwPn/WK+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IeLaMLom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bwPn/WK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E381310E930;
 Thu, 24 Oct 2024 12:49:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4CE521FDB7;
 Thu, 24 Oct 2024 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729774163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TNZyzsAZPH1onMcnoCmPu3rQFvjSIdxP5wWbG6tr7sE=;
 b=IeLaMLomb4JJ20ZBEjnHUquzUfNZtz1ws3YUDLGZoxGmxwJ8T6n9rfSBiI4HeouFCa2qo2
 lJ9qiw+Rol4FkCkESL0BEyNzLCyPjTY8xsvKkrXm5cZTmCcyJTaGRoujbeUcLvvbAZWRnY
 Th8vfTqZui2Z5rYwP2zoeDgzvqciGoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729774163;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TNZyzsAZPH1onMcnoCmPu3rQFvjSIdxP5wWbG6tr7sE=;
 b=bwPn/WK+TtzEvhZZ05Q/8A0xgJFiv7wJP4RqVLps10tVM0cmVT3FACZjqLwORhmpSeDrx9
 ztoC3PG2HqO/lHBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IeLaMLom;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="bwPn/WK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1729774163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TNZyzsAZPH1onMcnoCmPu3rQFvjSIdxP5wWbG6tr7sE=;
 b=IeLaMLomb4JJ20ZBEjnHUquzUfNZtz1ws3YUDLGZoxGmxwJ8T6n9rfSBiI4HeouFCa2qo2
 lJ9qiw+Rol4FkCkESL0BEyNzLCyPjTY8xsvKkrXm5cZTmCcyJTaGRoujbeUcLvvbAZWRnY
 Th8vfTqZui2Z5rYwP2zoeDgzvqciGoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1729774163;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=TNZyzsAZPH1onMcnoCmPu3rQFvjSIdxP5wWbG6tr7sE=;
 b=bwPn/WK+TtzEvhZZ05Q/8A0xgJFiv7wJP4RqVLps10tVM0cmVT3FACZjqLwORhmpSeDrx9
 ztoC3PG2HqO/lHBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB8F2136F5;
 Thu, 24 Oct 2024 12:49:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6OjhM1JCGmeoDQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Oct 2024 12:49:22 +0000
Date: Thu, 24 Oct 2024 14:49:21 +0200
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
Message-ID: <20241024124921.GA20475@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 4CE521FDB7
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,gitlab.freedesktop.org:url];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
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

this is the PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2024-10-24:
Short summary of fixes pull:

bridge:
- aux: Fix assignment of OF node
- tc358767: Add missing of_node_put() in error path
The following changes since commit 83f000784844cb9d4669ef1a3366479db3197b33:

  Merge tag 'drm-xe-fixes-2024-10-17' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes (2024-10-18 13:53:41 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-10-24

for you to fetch changes up to 5c23878252515b8d2b86839bd4cb7dea7088aacd:

  drm/bridge: tc358767: fix missing of_node_put() in for_each_endpoint_of_node() (2024-10-21 15:00:35 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

bridge:
- aux: Fix assignment of OF node
- tc358767: Add missing of_node_put() in error path

----------------------------------------------------------------
Abel Vesa (1):
      drm/bridge: Fix assignment of the of_node of the parent to aux bridge

Javier Carrasco (1):
      drm/bridge: tc358767: fix missing of_node_put() in for_each_endpoint_of_node()

 drivers/gpu/drm/bridge/aux-bridge.c | 3 ++-
 drivers/gpu/drm/bridge/tc358767.c   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
