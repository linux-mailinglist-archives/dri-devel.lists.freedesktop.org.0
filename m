Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CBlNRKIqWki+gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:41:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A944212B01
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D4710EAFE;
	Thu,  5 Mar 2026 13:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LnaAUkga";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iGGp5S+m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LnaAUkga";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iGGp5S+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A7910E2A5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 13:41:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F1FE5BCF2;
 Thu,  5 Mar 2026 13:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772718091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qJhTqpkWlqOFZyQFKxmlLrS7VTkP43dnlbpeBL+HBMg=;
 b=LnaAUkgaUNHFAP/LEXATi1Nv0tocg6sABtKdj+vt4bFLgVrTY5mdhKsh6nDp0lh4QhBjcH
 zHxl3hlHLI7OIeL5QqHW7aT/w5bq11e+wi8rXtlW/ofqW/JeFWptTsFvVeBnVvQ35rACs4
 YOBXfZXZ1QV9l1MOGbpEfrdCtc4xFXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772718091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qJhTqpkWlqOFZyQFKxmlLrS7VTkP43dnlbpeBL+HBMg=;
 b=iGGp5S+mykpbXVFfJC7xtzDyyp+UibfKb2zA1vLrtiPy6WIbxQUhq7glFRDoxyswFn3DYv
 sBhzEN1KsBUhF+CA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LnaAUkga;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iGGp5S+m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772718091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qJhTqpkWlqOFZyQFKxmlLrS7VTkP43dnlbpeBL+HBMg=;
 b=LnaAUkgaUNHFAP/LEXATi1Nv0tocg6sABtKdj+vt4bFLgVrTY5mdhKsh6nDp0lh4QhBjcH
 zHxl3hlHLI7OIeL5QqHW7aT/w5bq11e+wi8rXtlW/ofqW/JeFWptTsFvVeBnVvQ35rACs4
 YOBXfZXZ1QV9l1MOGbpEfrdCtc4xFXo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772718091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qJhTqpkWlqOFZyQFKxmlLrS7VTkP43dnlbpeBL+HBMg=;
 b=iGGp5S+mykpbXVFfJC7xtzDyyp+UibfKb2zA1vLrtiPy6WIbxQUhq7glFRDoxyswFn3DYv
 sBhzEN1KsBUhF+CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2EE03EA68;
 Thu,  5 Mar 2026 13:41:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nyb9NQqIqWnFQQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Mar 2026 13:41:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/vmwgfx: Use DRM's vblank timer
Date: Thu,  5 Mar 2026 14:39:57 +0100
Message-ID: <20260305134122.246884-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
X-Rspamd-Queue-Id: 8A944212B01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zack.rusin@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action

Replace vmwgfx's vblank timer with DRM's shared implementation. The
common code is mostly equivalent, but provides additional protection
against concurrent changes to the vblank counter.

Patches 1 and 2 align vmwgfx with the shared code, so that it can be
converted easily.

The conversion is on patch 3. It replaces vmwgfx's custom timer with
calls to DRM's vblank interfaces. Initialization happens internally.

This series should get some more testing.

Thomas Zimmermann (3):
  drm/vmwgfx: Determine lock-waiting timeout from vblank state
  drm/vmwgfx: Move vblank handling into separate helper
  drm/vmwgfx: Convert to DRM vblank timers

 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |  2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 68 ++++++++--------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h |  2 +-
 6 files changed, 22 insertions(+), 53 deletions(-)


base-commit: 3594e3a9ce7d4ad237f43ff907e9744446108603
-- 
2.53.0

