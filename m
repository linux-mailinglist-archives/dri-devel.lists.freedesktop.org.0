Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F5999D45
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C350710EA49;
	Fri, 11 Oct 2024 06:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZZFqAodU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IyXj3Mut";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZZFqAodU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IyXj3Mut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D1D10EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:57:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 185C51F7D4;
 Fri, 11 Oct 2024 06:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728629829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R7cpB2/h6HNUvLu0SuRvuPdQEziL2BLMrDE+fXIHxfM=;
 b=ZZFqAodUOQCzdriuw9f37zRDOP9txVE2ClvZ7f2POQfw5BcnmBlYs+H+JuwIWgpfUr1qF5
 YMttblePL+x7uTS05PGHf0y9I3w5rGjHgjpKaleMOW1aOJsIx0TdrR0d9+EI7KWYvwbzHt
 lro/btkb+Jdl3S/Kyy8bReUcvNyoqKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728629829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R7cpB2/h6HNUvLu0SuRvuPdQEziL2BLMrDE+fXIHxfM=;
 b=IyXj3MutE6HaEJx02O0VjpThp+ERGX2668DzLu6mCFm3VZX9OMK91CmMV0vJQXRNCx6BqR
 5q2aWx71NyHGNeCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728629829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R7cpB2/h6HNUvLu0SuRvuPdQEziL2BLMrDE+fXIHxfM=;
 b=ZZFqAodUOQCzdriuw9f37zRDOP9txVE2ClvZ7f2POQfw5BcnmBlYs+H+JuwIWgpfUr1qF5
 YMttblePL+x7uTS05PGHf0y9I3w5rGjHgjpKaleMOW1aOJsIx0TdrR0d9+EI7KWYvwbzHt
 lro/btkb+Jdl3S/Kyy8bReUcvNyoqKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728629829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R7cpB2/h6HNUvLu0SuRvuPdQEziL2BLMrDE+fXIHxfM=;
 b=IyXj3MutE6HaEJx02O0VjpThp+ERGX2668DzLu6mCFm3VZX9OMK91CmMV0vJQXRNCx6BqR
 5q2aWx71NyHGNeCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD3C51370C;
 Fri, 11 Oct 2024 06:57:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Jg3dMETMCGcRfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 06:57:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, airlied@redhat.com,
 jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/7] drm: Add physical status and BMC support to conenctor
Date: Fri, 11 Oct 2024 08:43:05 +0200
Message-ID: <20241011065705.6728-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Track a connector's physical status separately from the logical status
and implement BMC support for DRM drivers. Connectors with virtual BMC
stay connected even if no display is physically connected. DRM clients
then continue displaying output to the BMC.

Ast and mgag200 have been doing this for a while. Moving this into
struct drm_connector and probe helpers simplifies htese divers and
makes the functionality available to others. Hibmc is a candidate here.

Patch just simplifies code in probe helpers and has been acked as part
of the series at [1].

Pathces 2 and 3 add the physical status and a BMC flag to struct
drm_connector. Usually physical connector status and regular, logical
status are in sync, so nothing changes for most drivers. If the the
BMC flag has been set, the logical status is always connected. The
probe helpers also take care of sending hotplug events if the physical
status changes.

Patches 4 to 7 update ast and mgag200. Both drivers already implement
their own tracking of physical status, which is now handled by DRM
helpers. Ast also receives two simple bug fixes for cleaning up EDID
properties in the BMC case.

Tested on ast and mgag200 hardware. Another driver that could make use
of this functionality is hibmc.

[1] https://patchwork.freedesktop.org/series/136084/

Thomas Zimmermann (7):
  drm/probe-helper: Call connector detect functions in single helper
  drm: Add physical status to connector
  drm: Add bmc_attached flag to connector
  drm/ast: sil164: Clear EDID if no display is connected
  drm/ast: vga: Clear EDID if no display is connected
  drm/ast: Track physical connector status in struct drm_connector
  drm/mgag200: Track physical connector status in struct drm_connector

 drivers/gpu/drm/ast/ast_dp.c              | 21 +++-------
 drivers/gpu/drm/ast/ast_dp501.c           | 17 ++------
 drivers/gpu/drm/ast/ast_drv.h             | 24 ++---------
 drivers/gpu/drm/ast/ast_sil164.c          | 19 +++------
 drivers/gpu/drm/ast/ast_vga.c             | 30 +++-----------
 drivers/gpu/drm/drm_connector.c           |  1 +
 drivers/gpu/drm/drm_probe_helper.c        | 50 +++++++++++++----------
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 32 +++------------
 include/drm/drm_connector.h               | 15 +++++++
 9 files changed, 77 insertions(+), 132 deletions(-)

-- 
2.46.0

