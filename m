Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D43E807143
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F3F10E72A;
	Wed,  6 Dec 2023 13:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB1410E723
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:51:58 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 217AA1F8D7;
 Wed,  6 Dec 2023 13:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701870716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lntZmBS+yEbpxRmB2HRuz/0o9xazqmtKhzuOpAkyTAc=;
 b=QQNtSfaQQOcBM4CKaHXlAxzcqRTJfyluWDapeYR3F5zd21IRcux0HgOt1V3Uarc77NgQ7i
 0tIGIfiKdzYbLydy65MKcVLKqDtN5vuC5RtMZKRpoRZR/C7jHrxXizE/nczs8lRwqtahCt
 pvPJ/OdMjaCfRGMu5O0kSQAOoRevD+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701870716;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lntZmBS+yEbpxRmB2HRuz/0o9xazqmtKhzuOpAkyTAc=;
 b=33rnPX2dxviPlBUJsHuxvAYgTXzNrHJSJZyK+HjSszKf4T4/YEvoo7M8gFeH/xRGizRs7w
 Qkk7fycO8AaNF+Ag==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id CEB24133DD;
 Wed,  6 Dec 2023 13:51:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id p0yqMHt8cGWVBgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Dec 2023 13:51:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, pjones@redhat.com,
 sui.jingfeng@linux.dev
Subject: [PATCH v3 0/4] fbdev: Remove global screen_info in efifb/vesafb
Date: Wed,  6 Dec 2023 14:50:25 +0100
Message-ID: <20231206135153.2599-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: 4.89
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ****
X-Spamd-Result: default: False [4.89 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,linux.dev];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.01)[45.44%]
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the global instance of screen_info with the per-device instance
that is set by the sysfb code. The use of the global screen_info should
be limited and ideally be pushed into per-architecture code.

v3:
	* better const correctness in efifb (Sui)
	* fix build for deferred takeover (kernel test robot)
v2:
	* comment on devm_kmemdup() usage (Javier)

Thomas Zimmermann (4):
  fbdev/efifb: Replace references to global screen_info by local pointer
  fbdev/efifb: Use screen_info pointer from device
  fbdev/vesafb: Replace references to global screen_info by local
    pointer
  fbdev/vesafb: Use screen_info pointer from device

 drivers/video/fbdev/efifb.c  | 136 +++++++++++++++++++----------------
 drivers/video/fbdev/vesafb.c |  78 ++++++++++++--------
 2 files changed, 123 insertions(+), 91 deletions(-)

-- 
2.43.0

