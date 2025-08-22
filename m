Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3857B3199B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 15:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7E410E119;
	Fri, 22 Aug 2025 13:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Vx7EiYOt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BiwhpPzs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zqHyvQ64";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NqNEGg+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B7A10EB23
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 13:31:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA9011F38D;
 Fri, 22 Aug 2025 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755869496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nveo/sCIINBhIvO8H71DNBeqW9eFchpHr9JPVqfx6m4=;
 b=Vx7EiYOtISSefuppVLQxVjfruNGEgl/gHiqeF9o3jNZa62tdPdCr3UGy+f/MG+svAo1vw0
 9mNrTMJOwmkuzeDljXWXmc7vqiUVOzgi2OMuO4we6s8eIG2Loj5mdthCaIFYv776Ma4dFW
 xEh/zG+EyZcOLtvFGctBjjNEdAnu1wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755869496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nveo/sCIINBhIvO8H71DNBeqW9eFchpHr9JPVqfx6m4=;
 b=BiwhpPzsGjjhDrdMWezx6IOpc0Yeq6gfOnOQZe9f2Y2RTA/Rssi4Uuwr3cx5Ml+y6rqBlM
 I5920pEzJjk997CA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zqHyvQ64;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NqNEGg+N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755869495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nveo/sCIINBhIvO8H71DNBeqW9eFchpHr9JPVqfx6m4=;
 b=zqHyvQ64owHJqNATYixlGCNfvHCQIrNwT/DURm4ud3P0VUjMMoZyGxmAoKlnk0QraQU8Co
 sKZrBIMeKA4+YIRBxWA0ozOZ7MHqpOJLIFaO8cj01gNKjBgyD0Z8HXN9QZzcjHKpRrFnXF
 n+ORXLBBXrZRchXIEQ+84i5GJfl9n9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755869495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nveo/sCIINBhIvO8H71DNBeqW9eFchpHr9JPVqfx6m4=;
 b=NqNEGg+NKhhHLZOSTBn/lNdfp35atGnNQ7pZ8l+bueB9+QkLi3eu4Ptn5uuIY2lQWEXQfE
 5QjYcG1+03mcKFDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C94B139B7;
 Fri, 22 Aug 2025 13:31:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iEPrIDdxqGgneAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Aug 2025 13:31:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/6] ast: Replace DRAM info code
Date: Fri, 22 Aug 2025 14:52:07 +0200
Message-ID: <20250822132846.25376-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: CA9011F38D
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

The ast driver's ast_get_dram_info() helper is supposed to return
information about the hardware's memory setup. It depends on the
various types of configurations and the chipset model. The problem
is that most of this is not needed or outright wrong.

Really needed is only the bank layout of the memory for posting Gen2
and Gen3 systems with P2A configuration.

This series removes ast_gem_dram_info(). The code for retrieving the
bank layout goes into the Gen2 source code and runs when required.

Tested on AST2100 and AST2600 hardware.

Thomas Zimmermann (6):
  drm/ast: Do not print DRAM info
  drm/ast: Remove unused dram_bus_width field
  drm/ast: Remove unused mclk field
  drm/ast: Remove unused SCU-MPLL and SCU-STRAP values
  drm/ast: Move DRAM info next to its only user
  drm/ast: Put AST_DRAM_ constants into enum ast_dram_layout

 drivers/gpu/drm/ast/ast_2100.c |  45 +++++++++++-
 drivers/gpu/drm/ast/ast_drv.h  |  20 +++---
 drivers/gpu/drm/ast/ast_main.c | 126 ---------------------------------
 3 files changed, 51 insertions(+), 140 deletions(-)

-- 
2.50.1

