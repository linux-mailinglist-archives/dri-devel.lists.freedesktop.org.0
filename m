Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDBB98DEA2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 17:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1135710E763;
	Wed,  2 Oct 2024 15:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oyeJ8KRm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2lxGfzbC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pHVZrscT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="upyibpfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D97210E773;
 Wed,  2 Oct 2024 15:15:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C45E521C76;
 Wed,  2 Oct 2024 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727882130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ziT2x5drRDgrc83+VlX/JW6EBssFihBEAAHkgD2BcGM=;
 b=oyeJ8KRmybeuktXTIe50Q+32UFhH0veH/XJFkRVGqgGN/e428WRxz/KkaC/ggVwhVl4UDQ
 cmVOyNsthYiuiusIXEbU0kiJ+9+XqfDhRqHvs8q1jNUXvjxqLxJD4XTJK4vzsdBnnynPSR
 kHI8QKQ2VjuIgqgh+AxkvUc7gG329II=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727882130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ziT2x5drRDgrc83+VlX/JW6EBssFihBEAAHkgD2BcGM=;
 b=2lxGfzbCc08UphL4YokncBfIJBkRvZ0hR1prWuGjJHgSA3Id+B5Nf/TGowyTLpsU9U1TLX
 3RyKsLdjqk/idqCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pHVZrscT;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=upyibpfk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727882129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ziT2x5drRDgrc83+VlX/JW6EBssFihBEAAHkgD2BcGM=;
 b=pHVZrscTgBu3XMeQo6KO7y3DmKgmoKjuhEGWY7oX4Nk5XBeT1tbyoB0of5waijTAV7Lz3U
 gM5feX0fwE+8dQiBI/q7+h0+Ztibh5zoNHOD9uCCNuqfKm+SIzWV1a+QLAym1Qc9uIKKVb
 osipwufwqjGqUv4zH7IKNEfHAenIqE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727882129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ziT2x5drRDgrc83+VlX/JW6EBssFihBEAAHkgD2BcGM=;
 b=upyibpfk4idfggpWU9/P3y2MUauKcmiCY4HyWLn1VGehrWco1SJUWpFicBTK2ZJqIfmlj5
 e0PgDeyhEbssOCBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63DB513A6E;
 Wed,  2 Oct 2024 15:15:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vXkyF5Fj/Wa3QQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Oct 2024 15:15:29 +0000
Date: Wed, 2 Oct 2024 17:15:28 +0200
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
Message-ID: <20241002151528.GA300287@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C45E521C76
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[16];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim]
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

Hi Dave, Sima,

although a bit early, here's the week's PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2024-10-02:
Short summary of fixes pull:

panthor:
- Set FOP_UNSIGNED_OFFSET in fops instance
- Acquire lock in panthor_vm_prepare_map_op_ctx()
- Avoid ninitialized variable in tick_ctx_cleanup()
- Do not block scheduler queue if work is pending
- Do not add write fences to the shared BOs

scheduler:
- Fix locking in drm_sched_entity_modify_sched()
- Fix pointer deref if entity queue changes
The following changes since commit 43102a2012c2e2f8424d7eef52aede8e73cf2fed:

  Merge tag 'drm-misc-fixes-2024-09-26' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2024-10-01 08:15:55 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-10-02

for you to fetch changes up to f9e7ac6e2e9986c2ee63224992cb5c8276e46b2a:

  drm/panthor: Don't add write fences to the shared BOs (2024-10-01 18:41:02 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

panthor:
- Set FOP_UNSIGNED_OFFSET in fops instance
- Acquire lock in panthor_vm_prepare_map_op_ctx()
- Avoid ninitialized variable in tick_ctx_cleanup()
- Do not block scheduler queue if work is pending
- Do not add write fences to the shared BOs

scheduler:
- Fix locking in drm_sched_entity_modify_sched()
- Fix pointer deref if entity queue changes

----------------------------------------------------------------
Boris Brezillon (4):
      drm/panthor: Lock the VM resv before calling drm_gpuvm_bo_obtain_prealloc()
      drm/panthor: Fix access to uninitialized variable in tick_ctx_cleanup()
      drm/panthor: Don't declare a queue blocked if deferred operations are pending
      drm/panthor: Don't add write fences to the shared BOs

Christian König (1):
      drm/sched: revert "Always increment correct scheduler score"

Liviu Dudau (1):
      drm/panthor: Add FOP_UNSIGNED_OFFSET to fop_flags

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-fixes' into drm-misc-fixes

Tvrtko Ursulin (3):
      drm/sched: Add locking to drm_sched_entity_modify_sched
      drm/sched: Always wake up correct scheduler in drm_sched_entity_push_job
      drm/sched: Always increment correct scheduler score

 drivers/gpu/drm/panthor/panthor_drv.c    |  1 +
 drivers/gpu/drm/panthor/panthor_mmu.c    |  8 ++++++++
 drivers/gpu/drm/panthor/panthor_sched.c  | 20 +++++++++++---------
 drivers/gpu/drm/scheduler/sched_entity.c | 12 ++++++++++--
 4 files changed, 30 insertions(+), 11 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
