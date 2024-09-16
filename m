Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D722979CC8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 10:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C5E10E2EB;
	Mon, 16 Sep 2024 08:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bFUhnq5M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Dz9SOPG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bFUhnq5M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Dz9SOPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38F910E2E6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 08:29:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84B0121BAE;
 Mon, 16 Sep 2024 08:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726475365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Dcu1Fc6HkWfNcVcPM8R7zEW4feCWV/Nslrs64dfSETo=;
 b=bFUhnq5Mud1HJ5Urjh/d8ThgPGjexRvv4YykSbiuraG3Yccmo78p6aObq5OX7Wx/zU9oc1
 1Dybimr72qaW0LtDkimrxLSQSL2g9HCrdMtSAO+/xxYMKf8b69bOSrvVeWF4CfsDWGq5U6
 M1MXRuwzZJw702tJx4SS1ZaCgqSfHuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726475365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Dcu1Fc6HkWfNcVcPM8R7zEW4feCWV/Nslrs64dfSETo=;
 b=6Dz9SOPGkU6VLCn/NZlr+5pm5/b5CILDyqX3oFOBcq7fKFCtl43mTys9Mag1PsMRVrhKco
 Asy3VmqNLxD7jTAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bFUhnq5M;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6Dz9SOPG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726475365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Dcu1Fc6HkWfNcVcPM8R7zEW4feCWV/Nslrs64dfSETo=;
 b=bFUhnq5Mud1HJ5Urjh/d8ThgPGjexRvv4YykSbiuraG3Yccmo78p6aObq5OX7Wx/zU9oc1
 1Dybimr72qaW0LtDkimrxLSQSL2g9HCrdMtSAO+/xxYMKf8b69bOSrvVeWF4CfsDWGq5U6
 M1MXRuwzZJw702tJx4SS1ZaCgqSfHuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726475365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Dcu1Fc6HkWfNcVcPM8R7zEW4feCWV/Nslrs64dfSETo=;
 b=6Dz9SOPGkU6VLCn/NZlr+5pm5/b5CILDyqX3oFOBcq7fKFCtl43mTys9Mag1PsMRVrhKco
 Asy3VmqNLxD7jTAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55B37139CE;
 Mon, 16 Sep 2024 08:29:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8u+yE2Xs52bOPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Sep 2024 08:29:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/ast: Clean up use of TX-chip register constants
Date: Mon, 16 Sep 2024 10:25:12 +0200
Message-ID: <20240916082920.56234-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 84B0121BAE
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
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

On GEN4 and later, VGACRD1 returns the device's TX chip. Clean up the
use of the constants. Warn about unsupported chips.

Tested on various Aspeed devices. Really cleaning this up needs more
work, but at least the TX-chip warnings can be added now.

Thomas Zimmermann (3):
  drm/ast: Rename register constants for TX-chip types
  drm/ast: Use TX-chip register constants
  drm/ast: Warn about unsupported TX chips

 drivers/gpu/drm/ast/ast_dp501.c | 13 +++++++------
 drivers/gpu/drm/ast/ast_main.c  | 30 +++++++++++++++++++++++-------
 drivers/gpu/drm/ast/ast_reg.h   | 26 ++++++++++++--------------
 3 files changed, 42 insertions(+), 27 deletions(-)

-- 
2.46.0

