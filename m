Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5A9A14DA5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 11:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43AA10EABB;
	Fri, 17 Jan 2025 10:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="f5mNEc2Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y6gffr0T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IlfWHbCs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CPjYt6DT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA90810EAC0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 10:35:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E3902115F;
 Fri, 17 Jan 2025 10:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737110096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+m53FldsUXI6xvpMZbOa1jopdbOqudxd79IuAUX0dCU=;
 b=f5mNEc2YdOEkKfUwS0ffxalci5bufq7sLgklupRQu8FlEQpbtG1u97w+QaLkX32574b+sH
 xYkB3niuH9Kdr1ko5tfJjELjtpKEaXlti5/cEdpiDY30BgQAk7InjgU94hJdzPDZvDWpKm
 PR0QCgeN3doWxvcboKIS767GuY7e9cs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737110096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+m53FldsUXI6xvpMZbOa1jopdbOqudxd79IuAUX0dCU=;
 b=y6gffr0T4b+D1ZAz9cCK9jAhlh3ZDyawyxYrXmDcN5J2Xhm5TGPmgvZv+XbvdvaSpvpQEY
 mzpwEO23BLnBUpBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737110095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+m53FldsUXI6xvpMZbOa1jopdbOqudxd79IuAUX0dCU=;
 b=IlfWHbCsgyG623IyvYZeP+o+dPNBIX/3l5gix84OF7Zogeqp8R7aAK/w7wxyTUQ9RiPjHt
 YoQqb082TRTK2M8GsWHUkbvIww15T1wdx98WkbKqJQYZgGdsm3huDidj2NcdXvXRSqrj5R
 QYRL19LD1QXZrLattsjfdTw3Cp/+I1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737110095;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+m53FldsUXI6xvpMZbOa1jopdbOqudxd79IuAUX0dCU=;
 b=CPjYt6DTSWBRNYIA4ecT/iQeq7LiswnW0wJMMRuTemvDt9buIl5o6MqErx4UvsJNvcDbLb
 oPC0vCZzswCPZLAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 483AC13332;
 Fri, 17 Jan 2025 10:34:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jCZKEE8yimewLAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jan 2025 10:34:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/8] drm/ast: Reorganize TX-chip detection and init
Date: Fri, 17 Jan 2025 11:29:05 +0100
Message-ID: <20250117103450.28692-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
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

Detection and initialization of TX chips is mixed up with each other
and other device-probing code. Move it into one place and reorganize
branches by Aspeed Gen.

This series is another step towards separating the TX code from the
rest of the driver and making each hardware gen self-contained.

Tested on AST 1100, 2300, 2500 and 2600.

Thomas Zimmermann (8):
  drm/ast: Detect wide-screen support before creating modeset pipeline
  drm/ast: Detect DRAM before TX-chip
  drm/ast: Refactor ast_post_gpu() by Gen
  drm/ast: Initialize ASTDP in ast_post_gpu()
  drm/ast: Hide Gens 1 to 3 TX detection in branch
  drm/ast: Align Gen1 DVO detection to register manual
  drm/ast: Merge TX-chip detection code for Gen4 and later
  drm/ast: Only warn about unsupported TX chips on Gen4 and later

 drivers/gpu/drm/ast/ast_drv.c  |   6 +-
 drivers/gpu/drm/ast/ast_drv.h  |   2 +-
 drivers/gpu/drm/ast/ast_main.c | 113 +++++++++++++++++++--------------
 drivers/gpu/drm/ast/ast_post.c |  49 ++++++++++----
 drivers/gpu/drm/ast/ast_reg.h  |   1 +
 5 files changed, 107 insertions(+), 64 deletions(-)

-- 
2.47.1

