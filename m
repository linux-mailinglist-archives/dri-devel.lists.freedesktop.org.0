Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E0A272D3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 14:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654F010E33D;
	Tue,  4 Feb 2025 13:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fUIyWD52";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OlGDvMdA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fUIyWD52";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OlGDvMdA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727C910E32F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 13:32:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3316D210F9;
 Tue,  4 Feb 2025 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738675934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2N2pRZFju1Mse8DbzREoyxUHnm65HOPDmiQUS8rKmWE=;
 b=fUIyWD52dUZlkwNO9TOAv2Kx3MSvNc14WVPT97uWFyxELyvzz/BH+0tM9IB0O37fRopWBD
 2Q66hlak9wO0mcneuo/n0G6ki6t2OnkwWcB/ko3dy5fD/DYCszKgxYAkS9A8sisQIq+KBc
 cMNgBfnIHkmAtsvUcwRGM4s12rGGghQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738675934;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2N2pRZFju1Mse8DbzREoyxUHnm65HOPDmiQUS8rKmWE=;
 b=OlGDvMdA8oQy+BIVpX8TovUZX10qnkISkvSdzaUrQzD3XjVi+45NbdQwq/5B7IU/aKSMY7
 1BNVaAUDt7PZwpBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738675934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2N2pRZFju1Mse8DbzREoyxUHnm65HOPDmiQUS8rKmWE=;
 b=fUIyWD52dUZlkwNO9TOAv2Kx3MSvNc14WVPT97uWFyxELyvzz/BH+0tM9IB0O37fRopWBD
 2Q66hlak9wO0mcneuo/n0G6ki6t2OnkwWcB/ko3dy5fD/DYCszKgxYAkS9A8sisQIq+KBc
 cMNgBfnIHkmAtsvUcwRGM4s12rGGghQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738675934;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2N2pRZFju1Mse8DbzREoyxUHnm65HOPDmiQUS8rKmWE=;
 b=OlGDvMdA8oQy+BIVpX8TovUZX10qnkISkvSdzaUrQzD3XjVi+45NbdQwq/5B7IU/aKSMY7
 1BNVaAUDt7PZwpBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01B3A1393E;
 Tue,  4 Feb 2025 13:32:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2u6tOt0WomfsVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Feb 2025 13:32:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] drm/ast: astdp: Improve mode handling
Date: Tue,  4 Feb 2025 14:26:36 +0100
Message-ID: <20250204133209.403327-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
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

The ASTDP transmitter chip requires a mode index for each supported
mode. Currently, that is being handled internally whne programming
the display mode. Rework the code to filter out unsupported modes and
detect errors early.

Tested on AST2600 hardware.

Thomas Zimmermann (4):
  drm/ast: astdp: Add connector state
  drm/ast: astdp: Inline mode-index calculation
  drm/ast: astdp: Store mode index in connector state
  drm/ast: astdp: Validate display modes

 drivers/gpu/drm/ast/ast_dp.c | 157 ++++++++++++++++++++++++++---------
 1 file changed, 118 insertions(+), 39 deletions(-)

-- 
2.48.1

