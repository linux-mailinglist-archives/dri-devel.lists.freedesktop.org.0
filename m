Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89658896C8D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D0D10F679;
	Wed,  3 Apr 2024 10:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xcipZzIt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GQ5XbuRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069631129B4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:33:29 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C20635219;
 Wed,  3 Apr 2024 10:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712140408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=E7xY2KLpXDOBo8Q+4nLXobY2kbmLdIsoP8k1eyAXu0M=;
 b=xcipZzIt0vkFjdT5kDsiggFtaN09LWoaaphgYIas1IO/7BQvQ4A7TFaOLteHMZ09jqPk1Z
 XRms9OOUdXmkyoSeps4L3UZHcjNYFicjNAqSVJp4sShRzAkIt5lNjztvjc+ezCDTJkR3Kx
 wYjRPdoRc2L1YEmBwMUuvnzbJ2LrKIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712140408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=E7xY2KLpXDOBo8Q+4nLXobY2kbmLdIsoP8k1eyAXu0M=;
 b=GQ5XbuRArD2Wv1m/7vorRCsn4hicBr7RxX1/2S0BpIL7FPVWU/+H2mcDCoHH7n3Oxpj9pZ
 I6f7PNjnYkuPliBA==
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C3F413357;
 Wed,  3 Apr 2024 10:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id opt+CXgwDWaNEAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 10:33:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/ast: DDC improvements
Date: Wed,  3 Apr 2024 12:31:27 +0200
Message-ID: <20240403103325.30457-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.20 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.993];
 MIME_GOOD(-0.10)[text/plain]; BAYES_HAM(-0.00)[21.71%];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:rdns,imap2.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 1.20
X-Spam-Level: *
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

One fix and two minor improvements to ast's DDC code. Follow-up
to the recently added support for connector polling. [1]

Tested on AST2500 hardware.

[1] https://patchwork.freedesktop.org/series/131306/

Thomas Zimmermann (3):
  drm/ast: Set DDC timeout in milliseconds
  drm/ast: Group DDC init code by data structure
  drm/ast: Define struct ast_ddc in ast_ddc.c

 drivers/gpu/drm/ast/ast_ddc.c  | 30 ++++++++++++++++++++----------
 drivers/gpu/drm/ast/ast_ddc.h  | 13 ++-----------
 drivers/gpu/drm/ast/ast_mode.c |  8 ++++----
 3 files changed, 26 insertions(+), 25 deletions(-)

-- 
2.44.0

