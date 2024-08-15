Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0685F9536F3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 17:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8BA10E467;
	Thu, 15 Aug 2024 15:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TdnPLLvl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+rZf8ECh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D6XzBfe8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x4S0urnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA2A10E456
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 15:19:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB0932002A;
 Thu, 15 Aug 2024 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723735198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=okm7Oii76d5Rw+SbOWckA+1vQbiH9Hp4TocxBvMQytQ=;
 b=TdnPLLvlvdPh4IL3J4TF6ZgO6sX7DTUpOJKfclDKmlRuSACAYwk7SeQ9BMpiGKpQ35yJT8
 pQ4F0PK55oQU68RMJ2TCIeXeYmCPkZevvQ4JGnQhMBWLm3FCR0OQaxQb6052EO/HJKfDa4
 8oY0h6QrCzXWeV872ChlCtOYRrXETVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723735198;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=okm7Oii76d5Rw+SbOWckA+1vQbiH9Hp4TocxBvMQytQ=;
 b=+rZf8EChVNrtJxJ0Mlp+FKV6/PIJtrpO6Do/UHJssnEhvatkYi7j7JMkKHWHV4lh95oiRm
 Qr46xQEsyyPwkSAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723735197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=okm7Oii76d5Rw+SbOWckA+1vQbiH9Hp4TocxBvMQytQ=;
 b=D6XzBfe8ln8u5rpo+OgMHJAC9AVmi7FXIv38kJCGiD/O6JqN9CWeJjgsSNEIs0GJK0W9Ep
 HAQbSRNI6/2GmWHtpADWaeDwGnFE3zgivV06YfzWOp+U28RxzwmpBMRraoaDU6joWkXked
 zveEabWSVp8XZwkwCUorztpYXolBKH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723735197;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=okm7Oii76d5Rw+SbOWckA+1vQbiH9Hp4TocxBvMQytQ=;
 b=x4S0urnwcZC9QfmP60quHvq+sCzKXmgZlkHuOpA89An5Y9SMcapaxmgEjJV8/dCjV9jQiQ
 9n/NvLQrTSsehjAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A28B413983;
 Thu, 15 Aug 2024 15:19:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2sV9Jp0cvmb6DAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Aug 2024 15:19:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 00/11] drm/ast: Transparently handle BMC in outputs
Date: Thu, 15 Aug 2024 17:18:42 +0200
Message-ID: <20240815151953.184679-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Add transparent BMC support to all outputs. If the user disconnects
the physical display, each output will now return display modes for
the BMC. Makes the BMC connector obsolete, so remove it.

The benefit of the new approach is that is works with any userspace.
Most userspace compositors have problems configuring the current BMC
connector. The BMC connector is now gone and only a physical connector
is present.

Also clean up some of the EDID handling in preparation. Switching to
struct drm_edid and its helpers simplifies the code for inclusion of
the BMC support.

A similar approach has been taken for mgag200. [1] Here a server's
display hardware also contains an internal BMC that needs to display
even without the presence of a physical display.

v3:
- track physical connector status in struct ast_connector
v2:
- fix reading EDID data on ASTDP and DP501 chips (Jocelyn)

[1] https://patchwork.freedesktop.org/series/136885/

Thomas Zimmermann (11):
  drm/ast: Move code for physical outputs into separate files
  drm/ast: Add struct ast_connector
  drm/ast: astdp: Move locking into EDID helper
  drm/ast: astdp: Use struct drm_edid and helpers
  drm/ast: astdp: Simplify power management when detecting display
  drm/ast: astdp: Transparently handle BMC support
  drm/ast: dp501: Use struct drm_edid and helpers
  drm/ast: dp501: Transparently handle BMC support
  drm/ast: sil164: Transparently handle BMC support
  drm/ast: vga: Transparently handle BMC support
  drm/ast: Remove BMC output

 drivers/gpu/drm/ast/Makefile     |   4 +-
 drivers/gpu/drm/ast/ast_dp.c     | 242 ++++++++++++-
 drivers/gpu/drm/ast/ast_dp501.c  | 184 ++++++++--
 drivers/gpu/drm/ast/ast_drv.h    |  42 +--
 drivers/gpu/drm/ast/ast_mode.c   | 578 -------------------------------
 drivers/gpu/drm/ast/ast_sil164.c | 127 +++++++
 drivers/gpu/drm/ast/ast_vga.c    | 127 +++++++
 7 files changed, 667 insertions(+), 637 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_sil164.c
 create mode 100644 drivers/gpu/drm/ast/ast_vga.c

-- 
2.46.0

