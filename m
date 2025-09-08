Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621A7B48D59
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2585910E212;
	Mon,  8 Sep 2025 12:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QBiGskmp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U8ObWBz2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jb5hfFEb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VBBAzHIA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC70010E212
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:25:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0CE0F60787;
 Mon,  8 Sep 2025 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757334334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=n/HaLLG81RdFIIe0gqypvBXhVi4QjnjtzEf3z6SPceU=;
 b=QBiGskmpl6MX4ToF2vQeI56+bJ6uxdbjvQu1CiORj+Bd50pF9wPkg+j/+9scernR6C0Wd7
 tVYvU5uNkdfDCk5g6PYqqbIFoTl1HiCzTHcOIFHtFDSJGTsU1TdaLzF762xbCC0R73fx7A
 OvY/fPaYtOUCynq0pQMBOkDvb9O3F6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757334334;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=n/HaLLG81RdFIIe0gqypvBXhVi4QjnjtzEf3z6SPceU=;
 b=U8ObWBz2uAng4tR9oW46Iw+g0L7saE4YPoTHQCZPVkRyBc3WPPFwsu3okSprjgWle7TYTY
 VLCaSa8ixGCxRwAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757334333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=n/HaLLG81RdFIIe0gqypvBXhVi4QjnjtzEf3z6SPceU=;
 b=jb5hfFEbeKH5gGWp6AhgbSQNT7DpJjRh1iUs+CAfr0HYek4iX2W+tvYGFP/7mhBxsd3193
 S0VzLUx2DuHVYpFXCO6ph800HySY03h6zHbueTFqVcTUnTV6M8KWBwXPXdq9qsZbKRqbu4
 ZS1TNy6N9xU8bApv1gxItC5NMxpX+Zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757334333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=n/HaLLG81RdFIIe0gqypvBXhVi4QjnjtzEf3z6SPceU=;
 b=VBBAzHIAQjNql7BWDJVzWqql4pqTAMpAe7n2tX1ZberPYuIAB48e6yHQ5xq2zp5QZ68k5Z
 pPrIl9907pnsC7CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C277813946;
 Mon,  8 Sep 2025 12:25:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tgI/LjzLvmhnIwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Sep 2025 12:25:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/sysfb: Integrate blit helper
Date: Mon,  8 Sep 2025 14:19:24 +0200
Message-ID: <20250908122240.740033-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_SEVEN(0.00)[7];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

The sysfb-helper library is the only remaining user of drm_fb_blit().
Merge the code into the module and remove the helper. Cleans up the
interface of the format-helper library. Also improves error detection
and performance of the sysfb code.

Tested on vesadrm with format conversion.

Thomas Zimmermann (3):
  drm/sysfb: Add custom plane state
  drm/sysfb: Lookup blit function during atomic check
  drm/format-helper: Remove drm_fb_blit()

 drivers/gpu/drm/drm_format_helper.c       |  91 -------------
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h  |  34 ++++-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 152 +++++++++++++++++++++-
 include/drm/drm_format_helper.h           |   4 -
 4 files changed, 180 insertions(+), 101 deletions(-)

-- 
2.51.0

