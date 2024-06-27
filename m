Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C202391AB83
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F2810EAEB;
	Thu, 27 Jun 2024 15:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pQMsPr+1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dJTsbtwt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pQMsPr+1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dJTsbtwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DF910EAED
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 15:36:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B4DFD21BF6;
 Thu, 27 Jun 2024 15:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719502602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XPnjE1P6R+ouQR6ThBTsBIP8leoM0cQKGt5X603YVFo=;
 b=pQMsPr+1az67hxwccammmrQtfvUaL0rT+IiA9GvGglfKZ34lvQgsMOdBZQhVKo5E8g89Ol
 6NtYmJPPFMtcN4zubZFjQMexpmyHqxLORAPjPO3AWWWSVUJRtdYmdkl0jramPBv/WZHbTC
 xV+MxL4Cn6QjSJKLu/0B0ewbhb5zZ90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719502602;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XPnjE1P6R+ouQR6ThBTsBIP8leoM0cQKGt5X603YVFo=;
 b=dJTsbtwtNO0na/EaLJuCO+2lCmc1kQ8kN5amgjhJEV3NfcdrvPzQrOXxE7hQcGY17Erza2
 x9d7jMM/Y7+XfADg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719502602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XPnjE1P6R+ouQR6ThBTsBIP8leoM0cQKGt5X603YVFo=;
 b=pQMsPr+1az67hxwccammmrQtfvUaL0rT+IiA9GvGglfKZ34lvQgsMOdBZQhVKo5E8g89Ol
 6NtYmJPPFMtcN4zubZFjQMexpmyHqxLORAPjPO3AWWWSVUJRtdYmdkl0jramPBv/WZHbTC
 xV+MxL4Cn6QjSJKLu/0B0ewbhb5zZ90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719502602;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XPnjE1P6R+ouQR6ThBTsBIP8leoM0cQKGt5X603YVFo=;
 b=dJTsbtwtNO0na/EaLJuCO+2lCmc1kQ8kN5amgjhJEV3NfcdrvPzQrOXxE7hQcGY17Erza2
 x9d7jMM/Y7+XfADg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C4FD1384C;
 Thu, 27 Jun 2024 15:36:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JFWPHAqHfWbmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jun 2024 15:36:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/8] drm/ast: Untangle the chaos in mode setting
Date: Thu, 27 Jun 2024 17:27:45 +0200
Message-ID: <20240627153638.8765-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

The CRTC's mode-setting code contains quite a bit of code that
belongs to the planes or various encoder chips. This patchset
refactors these bits and moves things to the correct places.

With the patches applied, the remaining DPMS function will be
gone and its content be moved. Several code duplications will
be removed. There was also a bugfix wrt the VGA SCREEN_DISABLE
bit, but it's unclear if the bug had any effect in practice.

Tested with AST2100 and AST2600 with VGA and DP outputs.

Thomas Zimmermann (8):
  drm/ast: Implement atomic enable/disable for encoders
  drm/ast: Program mode for AST DP in atomic_mode_set
  drm/ast: Move mode-setting code into mode_set_nofb CRTC helper
  drm/ast: Handle primary-plane format setup in atomic_update
  drm/ast: Remove gamma LUT updates from DPMS code
  drm/ast: Only set VGA SCREEN_DISABLE bit in CRTC code
  drm/ast: Inline ast_crtc_dpms() into callers
  drm/ast: Use drm_atomic_helper_commit_tail() helper

 drivers/gpu/drm/ast/ast_mode.c | 204 ++++++++++++++++++---------------
 drivers/gpu/drm/ast/ast_reg.h  |  10 +-
 2 files changed, 112 insertions(+), 102 deletions(-)

-- 
2.45.2

