Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM10GOBgnWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:27:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CB3183A50
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DCD10E4E1;
	Tue, 24 Feb 2026 08:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Iu5IiC+N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5keyt2N1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k7pXYi5O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BkHUQjxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C99710E4E1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 08:27:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 310795BCD5;
 Tue, 24 Feb 2026 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771921623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mCjkASW6ZWZUc+DPfyf02czl7AULiee7mXTsK7x2OF8=;
 b=Iu5IiC+NLsoLKGnKX956c5GNWOczNko8F20E2DnygUk+9KmAx6TLzSArD1HYV04oWUMoNF
 GqpzqVaSH6P9IdUiBXCuDpdv9jDPPJajZpEr+M+PGn3/M4nFrb2Lih+8TqAk5nAja9Zfhv
 9mhGgJ6ZC+t04TjwrnUSEUdhEVo8/to=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771921623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mCjkASW6ZWZUc+DPfyf02czl7AULiee7mXTsK7x2OF8=;
 b=5keyt2N1Wep4T5HTw1kewYqu6zNsgejP57hbs3q3VCscWoQn2VaeY45vHNVHxdvNOZ/waI
 C96E2+bCEhF3MhCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=k7pXYi5O;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BkHUQjxa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771921622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mCjkASW6ZWZUc+DPfyf02czl7AULiee7mXTsK7x2OF8=;
 b=k7pXYi5Op/lZTr5OLA/H/1xI8dOD0h0PvB4FAQPbLzo0x9QYN2NsuZ9hXbPnFSbLVIQUvp
 zcjWKcO7ywbCgjMk8nLUVktSTf7e2PcdTq/o9sgN0WhnHAGUZiMQGpG049IXbspeU0V57T
 vyhaBzeJSPRhWpoqVGofUkkIs9ZBe1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771921622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mCjkASW6ZWZUc+DPfyf02czl7AULiee7mXTsK7x2OF8=;
 b=BkHUQjxag6gb2Wa7MCwQugP7gsWvTkppuWHye/D9op4aCt9Q7A81wRnLWo+D0U4jtmy3c5
 XlgENaSJL097NDBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E81EC3EA68;
 Tue, 24 Feb 2026 08:27:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1pc+N9VgnWnVQAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 08:27:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	simona@ffwll.ch,
	jayalk@intworks.biz
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/4] fbdev: defio: Protect against device/module removal
Date: Tue, 24 Feb 2026 09:25:53 +0100
Message-ID: <20260224082657.207284-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
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
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:simona@ffwll.ch,m:jayalk@intworks.biz,m:linux-fbdev@vger.kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,ffwll.ch,intworks.biz];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 13CB3183A50
X-Rspamd-Action: no action

There's a long-standing bug in defio where the framebuffer device or
module gets removed while mmap'ed areas of the framebuffer memory
persists in userspace. Page faults in the area then operate on defined
state.

Patches 1 and 2 fix these problems. Patches 3 and 4 build upon the fix
and put defio state into the correct places.

v2:
- use alloc_obj() functions

Thomas Zimmermann (4):
  fbdev: defio: Disconnect deferred I/O from the lifetime of struct
    fb_info
  fbdev: defio: Keep module reference from VMAs
  fbdev: defio: Move variable state into struct fb_deferred_io_state
  fbdev: defio: Move pageref array to struct fb_deferred_io_state

 drivers/video/fbdev/core/fb_defio.c | 266 ++++++++++++++++++++--------
 include/linux/fb.h                  |   9 +-
 2 files changed, 195 insertions(+), 80 deletions(-)


base-commit: 1c44015babd759b8e5234084dffcc08a0b784333
-- 
2.52.0

